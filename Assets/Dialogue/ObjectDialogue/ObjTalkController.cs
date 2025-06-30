using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class ObjTalkController : MonoBehaviour
{
    [Header("CSV 设置")]
    public TextAsset csvFile;
    public string currentState = "idle";

    [Header("UI 控制")]
    public GameObject bubbleUI;
    public TextMeshProUGUI bubbleText;

    public float displayTime = 3f;
    public Vector2 waitTimeRange = new Vector2(3f, 6f);

    private Dictionary<string, List<string>> stateToLines = new Dictionary<string, List<string>>();
    private int currentIndex = 0;
    private string lastState = "";

    void Start()
    {
        ParseCSV();

        if (bubbleUI != null)
            bubbleUI.SetActive(false);

        StartCoroutine(SpeakLoop());

    }

    void Update()
    {
        this.transform.rotation = Quaternion.identity;
    }

    void ParseCSV()
    {
        stateToLines.Clear();
        if (csvFile == null) return;

        string[] lines = csvFile.text.Split('\n');
        foreach (string line in lines)
        {
            if (string.IsNullOrWhiteSpace(line)) continue;
            string[] parts = line.Split(',');
            if (parts.Length < 2) continue;

            string state = parts[0].Trim();
            string text = parts[1].Trim();

            if (!stateToLines.ContainsKey(state))
                stateToLines[state] = new List<string>();

            stateToLines[state].Add(text);
        }
    }

    IEnumerator SpeakLoop()
    {
        while (true)
        {
            if (currentState != lastState)
            {
                currentIndex = 0;
                lastState = currentState;
            }

            List<string> lines = GetLinesByState(currentState);
            if (lines.Count > 0)
            {
                bubbleText.text = lines[currentIndex];
                bubbleUI.SetActive(true);
                yield return new WaitForSeconds(displayTime);
                bubbleUI.SetActive(false);
                yield return new WaitForSeconds(Random.Range(waitTimeRange.x, waitTimeRange.y));
                currentIndex = (currentIndex + 1) % lines.Count;
            }
            else
            {
                yield return new WaitForSeconds(1f);
            }
        }
    }

    List<string> GetLinesByState(string state)
    {
        return stateToLines.ContainsKey(state) ? stateToLines[state] : new List<string>();
    }
}
