using Yarn.Unity;
using UnityEngine; 
public class Name2Yarn : MonoBehaviour
{
    public GetPlayerName GetPlayerName;
    public DialogueRunner dialogueRunner;

    void Start()
    {
        // string playerName = playerData.FuncGetPlayerName();
        string playerName = "Test Name";
        
        // 设置 Yarn 变量
        dialogueRunner.VariableStorage.SetValue("$player_name", playerName);
    }
}
