using UnityEngine;
using Doozy.Runtime.UIManager.Components;
using Doozy.Runtime.UIManager.Events;
using MoreMountains.Tools;
using UnityEngine.SceneManagement;

namespace CGJ2025
{
    /// <summary>
    /// Music Player Toggle component that integrates with Doozy UI Toggle to control background music playback.
    /// When toggle is ON: Music resumes playing
    /// When toggle is OFF: Music is paused
    /// Music persists across scene changes when toggle is ON
    /// </summary>
    [RequireComponent(typeof(UIToggle))]
    [AddComponentMenu("CGJ2025/Music Player Toggle")]
    public class MusicPlayerToggle : MonoBehaviour
    {
        [Header("Music Settings")]
        [Tooltip("The audio clip to play as background music")]
        public AudioClip backgroundMusic;
        
        [Tooltip("Volume level for the background music (0-1)")]
        [Range(0f, 1f)]
        public float musicVolume = 0.5f;
        
        [Tooltip("Whether the music should loop")]
        public bool loopMusic = true;
        
        [Tooltip("Whether the music should persist across scene changes")]
        public bool persistentMusic = true;
        
        [Header("Toggle Settings")]
        [Tooltip("The initial state of the music toggle")]
        public bool startWithMusicOn = true;
        
        [Header("Debug")]
        [Tooltip("Enable debug logging")]
        public bool enableDebugLogs = false;

        private UIToggle uiToggle;
        private AudioSource musicAudioSource;
        private bool isInitialized = false;
        private static MusicPlayerToggle instance;
        
        // Static properties to maintain state across scenes
        private static bool musicWasPlaying = false;
        private static float savedMusicTime = 0f;
        private static bool toggleState = true;

        #region Unity Lifecycle

        private void Awake()
        {
            // Singleton pattern to ensure only one music player exists
            if (instance == null)
            {
                instance = this;
                DontDestroyOnLoad(gameObject);
                InitializeMusicPlayer();
            }
            else
            {
                // If another instance exists, destroy this one
                Destroy(gameObject);
                return;
            }
        }

        private void Start()
        {
            InitializeToggle();
            SceneManager.sceneLoaded += OnSceneLoaded;
        }

        private void OnDestroy()
        {
            SceneManager.sceneLoaded -= OnSceneLoaded;
        }

        #endregion

        #region Initialization

        private void InitializeMusicPlayer()
        {
            // Create AudioSource for music
            musicAudioSource = gameObject.AddComponent<AudioSource>();
            musicAudioSource.clip = backgroundMusic;
            musicAudioSource.volume = musicVolume;
            musicAudioSource.loop = loopMusic;
            musicAudioSource.playOnAwake = false; // We'll control playback manually
            
            // Set up audio mixer group for music track
            if (MMSoundManager.Instance != null && MMSoundManager.Instance.settingsSo != null)
            {
                musicAudioSource.outputAudioMixerGroup = MMSoundManager.Instance.settingsSo.MusicAudioMixerGroup;
            }

            isInitialized = true;
            
            if (enableDebugLogs)
                Debug.Log("[MusicPlayerToggle] Music player initialized");
        }

        private void InitializeToggle()
        {
            uiToggle = GetComponent<UIToggle>();
            
            if (uiToggle == null)
            {
                Debug.LogError("[MusicPlayerToggle] UIToggle component not found!");
                return;
            }

            // Set initial toggle state
            toggleState = startWithMusicOn;
            uiToggle.isOn = toggleState;

            // Subscribe to toggle value changes
            uiToggle.onToggleValueChangedCallback += OnToggleValueChanged;

            // Apply initial music state
            ApplyMusicState(toggleState);
            
            if (enableDebugLogs)
                Debug.Log($"[MusicPlayerToggle] Toggle initialized with state: {toggleState}");
        }

        #endregion

        #region Toggle Event Handling

        private void OnToggleValueChanged(ToggleValueChangedEvent toggleEvent)
        {
            toggleState = toggleEvent.newValue;
            ApplyMusicState(toggleState);
            
            if (enableDebugLogs)
                Debug.Log($"[MusicPlayerToggle] Toggle changed to: {toggleState}");
        }

        private void ApplyMusicState(bool shouldPlay)
        {
            if (!isInitialized || musicAudioSource == null)
                return;

            if (shouldPlay)
            {
                ResumeMusic();
            }
            else
            {
                PauseMusic();
            }
        }

        #endregion

        #region Music Control

        private void ResumeMusic()
        {
            if (musicAudioSource == null || !isInitialized)
                return;

            if (!musicAudioSource.isPlaying)
            {
                // If we have a saved time, start from there
                if (savedMusicTime > 0f)
                {
                    musicAudioSource.time = savedMusicTime;
                    savedMusicTime = 0f;
                }
                
                musicAudioSource.Play();
                musicWasPlaying = true;
                
                if (enableDebugLogs)
                    Debug.Log("[MusicPlayerToggle] Music resumed");
            }
        }

        private void PauseMusic()
        {
            if (musicAudioSource == null || !isInitialized)
                return;

            if (musicAudioSource.isPlaying)
            {
                savedMusicTime = musicAudioSource.time;
                musicAudioSource.Pause();
                musicWasPlaying = false;
                
                if (enableDebugLogs)
                    Debug.Log($"[MusicPlayerToggle] Music paused at time: {savedMusicTime}");
            }
        }

        #endregion

        #region Scene Management

        private void OnSceneLoaded(Scene scene, LoadSceneMode mode)
        {
            if (enableDebugLogs)
                Debug.Log($"[MusicPlayerToggle] Scene loaded: {scene.name}");
            
            // If toggle is ON and music was playing, resume it
            if (toggleState && musicWasPlaying)
            {
                // Small delay to ensure everything is properly loaded
                Invoke(nameof(DelayedResume), 0.1f);
            }
        }

        private void DelayedResume()
        {
            if (toggleState)
            {
                ResumeMusic();
            }
        }

        #endregion

        #region Public Methods

        /// <summary>
        /// Manually set the music state (useful for external control)
        /// </summary>
        /// <param name="playMusic">True to play music, false to pause</param>
        public void SetMusicState(bool playMusic)
        {
            if (uiToggle != null)
            {
                uiToggle.isOn = playMusic;
            }
            else
            {
                toggleState = playMusic;
                ApplyMusicState(playMusic);
            }
        }

        /// <summary>
        /// Get the current music state
        /// </summary>
        /// <returns>True if music is playing, false if paused</returns>
        public bool IsMusicPlaying()
        {
            return musicAudioSource != null && musicAudioSource.isPlaying;
        }

        /// <summary>
        /// Get the current toggle state
        /// </summary>
        /// <returns>True if toggle is ON, false if OFF</returns>
        public bool IsToggleOn()
        {
            return toggleState;
        }

        /// <summary>
        /// Set the music volume
        /// </summary>
        /// <param name="volume">Volume level (0-1)</param>
        public void SetMusicVolume(float volume)
        {
            if (musicAudioSource != null)
            {
                musicVolume = Mathf.Clamp01(volume);
                musicAudioSource.volume = musicVolume;
            }
        }

        #endregion

        #region Editor Support

        #if UNITY_EDITOR
        private void OnValidate()
        {
            // Ensure volume is within valid range
            musicVolume = Mathf.Clamp01(musicVolume);
            
            // Update volume if audio source exists
            if (musicAudioSource != null)
            {
                musicAudioSource.volume = musicVolume;
            }
        }
        #endif

        #endregion
    }
} 