using UnityEngine;
using Sirenix.OdinInspector;

namespace CGJ2025
{
    // MagicItemEscapeBehaviour class is responsible for managing the escape behavior of the magic item.
    public class MagicItemEscapeBehaviour : MonoBehaviour
    {

        [SerializeField]
        private float maxPathDistance = 500.0f;

        [SerializeField]
        private float minPathDistance = 200.0f;

        [SerializeField]
        private float speed = 1000.0f;

        [SerializeField]
        private float restTime = 0.5f; // Time in seconds to escape

        [SerializeField]
        private RectTransform BackpackRectTransform; // Reference to the backpack UI RectTransform

        [SerializeField]
        private RectTransform BackgroundRectTransform; // Reference to the background UI RectTransform

        private RectTransform rect;

        private NaiveAnimationPlayer animationPlayer; // Reference to the animation player component

        public bool IsEscaping => isEscaping; // Public property to check if the item is currently escaping

        private float realSpeed;
        private bool stopMoving = false; // Flag to indicate if the item should stop moving
        private bool isEscaping = false; // Flag to indicate if the item is currently escaping
        private float restTimer = 0.0f; // Timer to track the rest time during escape
        private Vector2 targetPosition; // Target position for the escape
        private Vector2 backgroundSize, backpackSize, backgroundMin, backgroundMax, backpackMin, backpackMax;

        private bool attemptedToTeleportAgain = false; // Flag to indicate if the item has attempted to teleport

        void Awake()
        {
            // Ensure the RectTransform is set
            rect = GetComponent<RectTransform>();
            if (rect == null)
            {
                Debug.LogError("MagicItemEscapeBehaviour requires a RectTransform component.");
            }

            this.animationPlayer = GetComponent<NaiveAnimationPlayer>();
            if (animationPlayer == null)
            {
                Debug.LogWarning("MagicItemEscapeBehaviour requires a NaiveAnimationPlayer component.");
            }
        }

        void Start()
        {
            this.BackpackRectTransform = GameManager.Instance.BackpackRectTransform;
            this.BackgroundRectTransform = GameManager.Instance.BackgroundRectTransform;

            if (BackpackRectTransform == null || BackgroundRectTransform == null)
            {
                Debug.LogError("MagicItemEscapeBehaviour requires BackpackRectTransform and BackgroundRectTransform to be set.");
                return;
            }
            
            backgroundSize = BackgroundRectTransform.rect.size;
            backpackSize = BackpackRectTransform.rect.size;

            // Calculate the bounds of the background and backpack
            backgroundMin = (Vector2)BackgroundRectTransform.position - backgroundSize / 2;
            backgroundMax = (Vector2)BackgroundRectTransform.position + backgroundSize / 2;

            backpackMin = (Vector2)BackpackRectTransform.position - backpackSize / 2;
            backpackMax = (Vector2)BackpackRectTransform.position + backpackSize / 2;

            this.StartEscaping(); // Start the escape behavior when the script is initialized
        }

        public void StopMoving()
        {
            stopMoving = true; // Set the flag to stop moving
            this.animationPlayer?.Pause(); // Stop the escape animation
        }

        public void ResumeMoving()
        {
            stopMoving = false; // Reset the flag to allow moving
            this.animationPlayer?.Resume(); // Resume the escape animation
        }

        // BackpackRectTransform is inside the BackgroundRectTransform.
        // The item should escape from the BackpackRectTransform bounds to the BackgroundRectTransform bounds.
        // Get a random position within the background RectTransform bounds, but outside the backpack RectTransform bounds.
        private Vector2 GetRandomPositionInRange()
        {
            // Generate a random position outside the backpack bounds
            float x, y;
            do
            {
                x = Random.Range(backgroundMin.x, backgroundMax.x);
                y = Random.Range(backgroundMin.y, backgroundMax.y);
            } while (x > backpackMin.x && x < backpackMax.x && y > backpackMin.y && y < backpackMax.y);

            return new Vector2(x, y);
        }

        public void StartEscaping()
        {
            if (!isEscaping)
            {
                this.transform.rotation = Quaternion.identity; // Reset the rotation of the item
                isEscaping = true;
                stopMoving = false;
                EscapeToRandomPosition();
            }
            else
            {
                stopMoving = false; // If already escaping, just reset the stopMoving flag
                restTimer = 0.0f; // Reset the rest timer
            }

            this.animationPlayer?.Play(); // Start the escape animation
        }

        public void StopEscaping()
        {
            Debug.Log("Stopping escape behavior.");
            isEscaping = false; // Set the escaping flag to false
            restTimer = 0.0f; // Reset the rest timer
            this.animationPlayer?.Stop(); // Stop the escape animation
        }

        private void EscapeToRandomPosition()
        {
            // Get a random position within the background RectTransform bounds, but outside the backpack RectTransform bounds
            Vector2 randomPosition = GetRandomPositionInRange();
            this.transform.position = randomPosition;
        }

        private bool IsInBackpackArea()
        {
            // Check if the item is within the bounds of the backpack RectTransform
            return BackpackRectTransform.rect.Contains(rect.anchoredPosition);
        }

        // Pickup a next target position for the item to escape to.
        // the path from the current position to the next target position shouldn't across the backpack RectTransform bounds.
        private void PickNextTargetPosition()
        {
            // If the item is in the backpack area, then stop
            // if (IsInBackpackArea())
            // {
            //     Debug.Log("Item is in the backpack area, stopping escape.");
            //     stopMoving = true; // Stop moving if the item is in the backpack area
            //     return;
            // }

            int attempts = 50; // Maximum attempts to find a valid target position
            while (attempts > 0)
            {
                Vector2 randomPosition = GetRandomPositionInRange();

                Vector2 direction = randomPosition - (Vector2)transform.position;
                RaycastHit2D hit = Physics2D.Raycast(transform.position, direction.normalized, direction.magnitude, LayerMask.GetMask("Backpack"));
                if (hit.collider == null)
                {
                    // No obstacles in the way, set the target position
                    Debug.DrawLine(transform.position, randomPosition, Color.green, 2.0f);
                    this.realSpeed = speed * (1.0f + Random.Range(-0.5f, 0.5f)); // Add some randomness to the speed
                    this.targetPosition = randomPosition;
                    float angle = Mathf.Atan2(direction.y, direction.x) * Mathf.Rad2Deg; // Calculate the angle towards the target position
                    this.transform.rotation = Quaternion.Euler(0, 0, angle + 180); // Set the rotation towards the target position
                    break;
                }
                else
                {
                    Debug.DrawLine(transform.position, hit.point, Color.red, 2.0f);
                    // If there is an obstacle, try again
                    // Debug.Log("Obstacle detected, picking a new target position.");
                }
                attempts--;
            }

            if (attempts <= 0)
            {
                Debug.LogError("Failed to find a valid target position after multiple attempts.");
                if (!attemptedToTeleportAgain)
                {
                    attemptedToTeleportAgain = true; // Set the flag to indicate an attempt has been made
                    Debug.LogWarning("Attempting to teleport to a random position due to failure in finding a valid target position.");
                }
                // Fallback to the current position if no valid target found
                this.stopMoving = true; // Stop moving if no valid target position is found
            }
        }

        void Update()
        {
            if (stopMoving || !isEscaping)
            {
                return; // If stopMoving is true, do not update the position
            }

            // Check if the item has reached the target position
            if (Vector2.Distance(transform.position, targetPosition) < 0.1f)
            {
                // If the escape time is over, pick a new target position
                if (restTimer <= 0)
                {
                    PickNextTargetPosition();
                    restTimer = restTime; // Reset the rest timer
                }
                else
                {
                    // Decrease the escape time
                    restTimer -= Time.deltaTime;
                }
            }
            else
            {
                // Move the item towards the target position
                transform.position = Vector2.MoveTowards(transform.position, targetPosition, speed * Time.deltaTime);
            }
        }
    }
}