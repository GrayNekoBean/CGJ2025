using UnityEngine;
using TMPro;

public class GetPlayerName : MonoBehaviour
{
    public TMP_InputField nameInputField;
    private static string playerName;

    public void SavePlayerName()
    {
        playerName = nameInputField.text;

        if (!string.IsNullOrEmpty(playerName))
        {
            Debug.Log("Username saved: " + playerName);
        }
        else
        {
            Debug.LogWarning("Username is empty!");
        }
    }


    public static string FuncGetPlayerName()
    {
        return playerName;
    }
}
