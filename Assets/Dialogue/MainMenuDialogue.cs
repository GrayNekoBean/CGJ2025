using UnityEngine;

public class EnableDialogueSystem : MonoBehaviour
{
    [Header("要启用的对话系统对象")]
    public GameObject dialogueSystem;

    // 按钮点击时调用此函数
    public void EnableDialogue()
    {
        if (dialogueSystem != null)
        {
            dialogueSystem.SetActive(true);
            Debug.Log("Dialogue System 已启用");
        }
        else
        {
            Debug.LogWarning("未指定 Dialogue System 对象！");
        }
    }
}
