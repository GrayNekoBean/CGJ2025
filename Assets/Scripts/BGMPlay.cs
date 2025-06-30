using UnityEngine;

namespace CGJ2025
{
    public class BGMPlay : MonoBehaviour
    {
        public AudioClip BGM;
        private AudioSource audioSource;

        void Awake()
        {
            audioSource = gameObject.AddComponent<AudioSource>();
            audioSource.clip = BGM;
            audioSource.loop = true; // Loop the background music
            audioSource.volume = 0.5f; // Set volume to a reasonable level
        }

        void Start()
        {
            PlayBGM();
        }

        public void PlayBGM()
        {
            if (!audioSource.isPlaying)
            {
                audioSource.Play();
            }
        }
    }
}