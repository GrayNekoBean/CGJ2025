using System.Threading;
using Doozy.Runtime.UIManager.Containers;
using JetBrains.Annotations;
using TMPro;
using UnityEngine;
using UnityEngine.SceneManagement;
using Yarn.Unity;

namespace CGJ2025
{
    // GameManager class is responsible for managing the game state and logic.
    // It can be extended to include properties like score, player state, etc.
    // Currently, it is an empty class, but you can add functionality as needed.
    public class GameManager : MonoBehaviour
    {
        public static GameManager Instance { get; private set; } // Singleton instance of GameManager

        public float GameTimeLimit = 150f;

        public int maxScore = 50; // Maximum score required to win the game

        public int winScore = 45; // Score required to win the game, can be adjusted based on game design

        public UIView GameWinView; // Reference to the game win UI view
        public UIView GameLoseView; // Reference to the game lose UI view

        public GameObject doll;

        public string gameScene; // Reference to the game scene, can be used to load or manage the game scene
        public string mainMenuScene; // Reference to the main menu scene, can be used to return to the main menu

        DialogueRunner dialogueRunner; // Reference to the DialogueRunner for managing dialogues in the game

        public BackpackGrids BackpackGrids;
        public RectTransform BackgroundRectTransform; // Reference to the background RectTransform

        public RectTransform BackpackRectTransform => BackpackGrids?.GetComponent<RectTransform>();

        public TextMeshProUGUI TimerText; // Reference to the timer text UI element
        public TextMeshProUGUI ScoreText; // Reference to the score text UI element
        public TextMeshProUGUI winScoreText; // Reference to the win score text UI element
        public TextMeshProUGUI maxScoreText; // Reference to the lose score text UI element

        public TextMeshProUGUI winText; // Reference to the player name text UI element
        public TextMeshProUGUI loseText; // Reference to the lose text UI element

        public AudioClip BGM;
        private AudioSource audioSource;

        private float gameTimer = 0f; // Timer for the game, can be used to track elapsed time
        private int gameTimerInt => Mathf.FloorToInt(gameTimer); // Convert game timer to integer seconds

        private static int loseGame = 0; // Flag to track if the last game was a win

        private bool oneGameCompleted = false; // Flag to track if one game has been completed

        void Awake()
        {
            // Ensure only one instance of GameManager exists
            if (Instance == null)
            {
                Instance = this;
                DontDestroyOnLoad(gameObject); // Keep this instance across scenes
            }
            else
            {
                Destroy(gameObject); // Destroy duplicate instances
            }

            if (this.audioSource == null)
            {
                this.audioSource = GetComponent<AudioSource>(); // Get the AudioSource component from the GameManager
            }

            if (doll == null)
            {
                this.doll = GameObject.Find("Doll 1"); // Find the doll GameObject in the scene
            }

            this.doll.SetActive(false); // Hide the doll at the start of the game
        }

        // Start is called once before the first execution of Update after the MonoBehaviour is created
        void Start()
        {
            ResetGame(); // Initialize the game state

            if (dialogueRunner == null)
            {
                dialogueRunner = FindFirstObjectByType<DialogueRunner>(); // Find the DialogueRunner in the scene
                dialogueRunner?.StartDialogue("Start");
            }

            if (this.winScoreText != null)
            {
                this.winScoreText.text = $"{winScore}"; // Set the win score text UI element if it exists
            }

            if (this.maxScoreText != null)
            {
                this.maxScoreText.text = $"{maxScore}"; // Set the lose score text UI element if it exists
            }

            if (this.BGM != null && this.audioSource != null)
            {
                this.audioSource.clip = this.BGM; // Set the background music clip
                this.audioSource.loop = true; // Loop the background music
                this.audioSource.Play(); // Start playing the background music
            }
        }

        // Update is called once per frame
        void FixedUpdate()
        {
            if (this.gameTimer > 0f)
            {
                this.gameTimer -= Time.fixedDeltaTime; // Increment the game timer
                TimerText.text = $"{gameTimerInt}s";
            }
            else
            {
                TimerText.text = "0s"; // Ensure timer does not go below zero
                if (BackpackGrids.score >= winScore)
                {
                    OnGameWin(); // Trigger game win if score is sufficient
                }
                else
                {
                    OnGameLose(); // Trigger game lose if score is insufficient
                }
            }

            this.ScoreText.text = $"{BackpackGrids.score}"; // Update the score text UI element

            if (BackpackGrids.score >= maxScore)
            {
                OnGameWin(); // Trigger game win if score reaches maximum score
            }
        }

        public void ReloadGameScene()
        {
            SceneManager.LoadScene(gameScene); // Reload the game scene
            ResetGame(); // Reset the game state after reloading
        }

        public void ReturnToMainMenu()
        {
            SceneManager.LoadScene(mainMenuScene); // Load the main menu scene
        }


        public void ResetGame()
        {
            this.gameTimer = GameTimeLimit; // Reset the game timer
            BackpackGrids.ResetScore(); // Reset the score
            TimerText.text = $"{gameTimerInt}s"; // Reset the timer text UI element
            ScoreText.text = $"{BackpackGrids.score}"; // Reset the score text UI element
            GameWinView.Hide(); // Hide the game win UI view
            GameLoseView.Hide(); // Hide the game lose UI view
            if (loseGame > 0)
            {
                this.doll.SetActive(true); // Hide the doll if the last game was a loss
            }
            else
            {
                this.doll.SetActive(false); // Show the doll if the last game was a win
            }

            if (oneGameCompleted)
            {
                this.Invoke(nameof(DisableDialogue), 0.1f); // Disable dialogue UI after a short delay
            }
        }

        public void ExitGame()
        {
            Application.Quit(); // Exit the game application
        }

        void OnGameWin()
        {
            // Handle game win logic here, such as showing a win screen or updating UI
            GameWinView.Show(); // Show the game win UI view
            oneGameCompleted = true; // Set the one game completed flag to true
            DisableDialogue(); // Disable dialogue UI if it exists

            if (this.winText != null)
            {
                string name = GetPlayerName.FuncGetPlayerName(); // Get the player name from the GetPlayerName script
                string text = $"学徒{name}成为了一代传奇"; // Create the win text message
                this.winText.text = text; // Set the player name in the win text UI element
            }
        }

        void OnGameLose()
        {
            GameLoseView.Show(); // Show the game lose UI view
            loseGame = 1; // Set the last game win flag to false
            oneGameCompleted = true; // Set the one game completed flag to true
            DisableDialogue(); // Disable dialogue UI if it exists

            if (this.loseText != null)
            {
                string name = GetPlayerName.FuncGetPlayerName(); // Get the player name from the GetPlayerName script
                string text = $"学徒 {name}"; // Create the lose text message
                this.loseText.text = text; // Set the lose text in the lose text UI element
            }
        }

        void DisableDialogue()
        {
            DialogueRunner dialogueRunner = FindFirstObjectByType<DialogueRunner>();
            if (dialogueRunner != null)
            {
                dialogueRunner.GetComponentInChildren<Canvas>().enabled = false; // Hide the dialogue canvas
            }
        }
    }
}