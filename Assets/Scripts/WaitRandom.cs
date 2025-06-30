using System.Collections;
using UnityEngine;
using Yarn.Unity;

public class WaitRandom : MonoBehaviour
{
    [YarnCommand("WaitRandom")]
    public static IEnumerator DoWaitRandom(float min, float max)
    {
        float waitTime = Random.Range(min, max);
        yield return new WaitForSeconds(waitTime);
    }
}
