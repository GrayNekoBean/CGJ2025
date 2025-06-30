using System.Collections;
using UnityEngine;
using TMPro;

public class TalkBubbleController : MonoBehaviour
{
    [Header("说话内容")]
    [TextArea]
    public string[] dialogueLines;

    [Header("时间设置")]
    public float minDelay = 2f;
    public float maxDelay = 5f;
    public float displayDuration = 2f;

    [Header("UI 元素")]
    public GameObject bubbleObject;      // 气泡整体（开启/隐藏）
    public TMP_Text bubbleText;          // 文本组件

    void Start()
    {
        bubbleObject.SetActive(false);
        StartCoroutine(TalkLoop());
    }

    IEnumerator TalkLoop()
    {
        while (true)
        {
            float waitTime = Random.Range(minDelay, maxDelay);
            yield return new WaitForSeconds(waitTime);

            // 选择一条随机文本
            string line = dialogueLines[Random.Range(0, dialogueLines.Length)];
            bubbleText.text = line;
            bubbleObject.SetActive(true);

            yield return new WaitForSeconds(displayDuration);
            bubbleObject.SetActive(false);
        }
    }
}
