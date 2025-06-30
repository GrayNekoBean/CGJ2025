using UnityEngine;
using UnityEngine.UI;

using Sirenix.OdinInspector;

namespace CGJ2025
{
    // NaiveAnimationPlayer class is responsible for playing animations on a UI Image component.
    public class NaiveAnimationPlayer : MonoBehaviour
    {
        [SerializeField]
        private Image image; // Reference to the Image component to animate

        [SerializeField]
        private Sprite[] sprites; // Array of sprites to use for the animation

        [SerializeField]
        private float frameRate = 15.0f; // Frames per second for the animation

        private int currentFrame = 0; // Current frame index in the animation
        private float timer = 0.0f; // Timer to track time elapsed for frame updates

        private bool isPlaying = true; // Flag to control whether the animation is playing
        public bool IsPlaying => isPlaying; // Public property to check if the animation is playing

        void Awake()
        {
            if (image == null)
            {
                image = GetComponentInChildren<Image>();
            }

            if (image == null)
            {
                Debug.LogError("NaiveAnimationPlayer requires an Image component.");
            }
        }

        void Update()
        {
            if (sprites == null || sprites.Length == 0 || image == null) return;

            if (!isPlaying) return; // If not playing, skip the update

            timer += Time.deltaTime;
            if (timer >= 1.0f / frameRate)
            {
                currentFrame = (currentFrame + 1) % sprites.Length;
                image.sprite = sprites[currentFrame];
                timer = 0.0f;
            }
        }

        public void Play()
        {
            isPlaying = true; // Set the animation to playing
            currentFrame = 0; // Reset the current frame to the first frame
            timer = 0.0f; // Reset the timer
        }

        public void Stop()
        {
            isPlaying = false; // Set the animation to not playing
            currentFrame = 0; // Reset the current frame to the first frame
            timer = 0.0f; // Reset the timer
            if (sprites != null && sprites.Length > 0 && image != null)
                image.sprite = sprites[0]; // Set the image to the first sprite
        }

        public void Pause()
        {
            isPlaying = false; // Pause the animation
        }

        public void Resume()
        {
            isPlaying = true; // Resume the animation
        }

        public void Reset()
        {
            currentFrame = 0; // Reset the current frame to the first frame
            timer = 0.0f; // Reset the timer
            if (sprites != null && sprites.Length > 0 && image != null)
                image.sprite = sprites[0]; // Set the image to the first sprite
            isPlaying = true; // Set the animation to playing
        }
    }
}