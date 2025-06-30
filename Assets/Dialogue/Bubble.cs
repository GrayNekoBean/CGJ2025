using UnityEngine;
using TMPro;

public class BubbleFollower : MonoBehaviour
{
    public Transform target; // 要跟随的物体
    public Vector3 offset = new Vector3(0, 2f, 0);
    public GameObject bubblePanel; // 包含 Image 和 TMP Text 的气泡
    public TextMeshProUGUI bubbleText;

    public float displayTime = 3f;
    public string[] dialogueLines;

    private int currentLine = 0;
    private float timer = 0f;

    void Update()
    {
        if (target != null)
        {
            Vector3 screenPos = Camera.main.WorldToScreenPoint(target.position + offset);
            transform.position = screenPos;
        }

        if (bubblePanel.activeSelf)
        {
            timer += Time.deltaTime;
            if (timer >= displayTime)
            {
                bubblePanel.SetActive(false);
                timer = 0f;
            }
        }
    }

    public void ShowNextLine()
    {
        if (dialogueLines.Length == 0) return;

        bubbleText.text = dialogueLines[currentLine];
        bubblePanel.SetActive(true);
        timer = 0f;
        currentLine = (currentLine + 1) % dialogueLines.Length;
    }
}
