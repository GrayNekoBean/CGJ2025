using UnityEngine;
using Yarn.Unity;

public class NameInputUI : MonoBehaviour
{
    public GameObject inputUI;

    public static NameInputUI Instance { get; private set; }

    void Awake()
    {
        if (Instance == null)
        {
            Instance = this;
        }
        else
        {
            Destroy(gameObject);
        }
    }

    [YarnCommand("show_ui")]
    public static void ShowInputUI()
    {
        Instance?.inputUI.SetActive(true);
    }
}
