using UnityEngine;
using TMPro;
using Yarn.Unity;

public class NameInput : MonoBehaviour
{
    public TMP_InputField nameInputField;
    public GameObject inputUI;
    public DialogueRunner dialogueRunner;

    public void SubmitName()
    {
        string player_name = nameInputField.text;
        if (string.IsNullOrEmpty(player_name))
            player_name = "你";

        inputUI.SetActive(false);

        dialogueRunner.VariableStorage.SetValue("$player_name", player_name);
        Debug.Log("player_name = " + player_name);

        // 继续执行第二段对话
        dialogueRunner.StartDialogue("Dia1");
    }
}
