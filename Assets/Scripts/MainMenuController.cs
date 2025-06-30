using CGJ2025;
using Doozy.Runtime.UIManager.Components;
using Doozy.Runtime.UIManager.Containers;
using TMPro;
using Unity.VisualScripting;
using UnityEngine;
using Yarn.Unity;

public class MainMenuController : MonoBehaviour
{

    public static MainMenuController Instance { get; private set; } // Singleton instance of MainMenuController

    [SerializeField]
    private DialogueRunner dialogueRunner; // Reference to the DialogueRunner component

    [SerializeField]
    private UIView mainMenuUI; // Reference to the main menu UI GameObject

    [SerializeField]
    private UIView inputUI; // Reference to the UI GameObject that contains the input field

    [SerializeField]
    private TMP_InputField inputField;

    [SerializeField]
    private UIButton startButton;

    private bool happyEndingTextShown = false; // Flag to track if the happy ending text has been shown

    void Awake()
    {
        // Ensure only one instance of MainMenuController exists
        if (Instance == null)
        {
            Instance = this;
        }
        else
        {
            Destroy(gameObject); // Destroy duplicate instances
        }
    }

    // Start is called once before the first execution of Update after the MonoBehaviour is created
    void Start()
    {
        if (dialogueRunner == null)
        {
            dialogueRunner = FindFirstObjectByType<DialogueRunner>();
            if (dialogueRunner == null)
            {
                Debug.LogError("DialogueRunner not found in the scene. Please add a DialogueRunner component.");
            }
        }

        if (inputUI != null)
        {
            inputUI.Hide();
        }
        else
        {
            Debug.LogError("Input UI GameObject is not assigned in the MainMenuController.");
        }

        this.mainMenuUI?.Show();
    }

    void Update()
    {
        if (inputField != null && inputField.text.Length > 0)
        {
            startButton.interactable = true; // Show the start button when there is text in the input field
        }
        else
        {
            startButton.interactable = false; // Hide the start button when the input field is empty
        }
    }

    public void StartDialogue()
    {
        if (inputUI != null)
        {
            inputUI.Hide(); // Hide the input UI after starting the dialogue
        }
        else
        {
            Debug.LogError("Input UI GameObject is not assigned in the MainMenuController.");
        }

        Invoke(nameof(IntroDialogue), 0.25f); // Start the dialogue after a short delay
    }

    private void IntroDialogue()
    {
        dialogueRunner.GetComponentInChildren<Canvas>().sortingOrder = 1;
        dialogueRunner.StartDialogue("Start"); // Start the dialogue with the specified start node
    }


    public void HappyEndingDialogue()
    {
        if (happyEndingTextShown)
        {
            Debug.Log("Happy ending dialogue has already been shown.");
            return; // Prevent showing the happy ending dialogue multiple times
        }

        if (dialogueRunner == null)
        {
            dialogueRunner = FindFirstObjectByType<DialogueRunner>(); // Find the DialogueRunner in the scene
        }

        if (dialogueRunner != null)
        {
            if (GameManager.LastGameWon)
            {
                dialogueRunner.GetComponentInChildren<Canvas>().sortingOrder = 1;
                dialogueRunner.StartDialogue("HappyEnding"); // Start the happy ending dialogue
                dialogueRunner.onNodeComplete.AddListener((text) =>
                {
                    dialogueRunner.GetComponentInChildren<Canvas>().sortingOrder = 0; // Reset sorting order after dialogue completes
                });
            }
            else
            {
                Debug.Log("Cannot start happy ending dialogue because the last game was not won.");
            }
        }
        else
        {
            Debug.LogError("DialogueRunner is not assigned in the MainMenuController.");
        }
    }


    [YarnCommand("show_ui")]
    public static void ShowInputUI()
    {
        Instance.inputUI.Show(false); // Show the input UI
        Instance.dialogueRunner.GetComponentInChildren<Canvas>().sortingOrder = 0;
    }
}
