using UnityEngine;
using CGJ2025;

namespace CGJ2025.Examples
{
    /// <summary>
    /// Example script demonstrating how to use the MusicPlayerToggle component.
    /// This script shows how to programmatically control the music player.
    /// </summary>
    public class MusicPlayerToggleExample : MonoBehaviour
    {
        [Header("References")]
        [Tooltip("Reference to the MusicPlayerToggle component")]
        public MusicPlayerToggle musicPlayerToggle;

        [Header("Example Controls")]
        [Tooltip("Key to toggle music on/off")]
        public KeyCode toggleKey = KeyCode.M;
        
        [Tooltip("Key to increase volume")]
        public KeyCode volumeUpKey = KeyCode.Equals;
        
        [Tooltip("Key to decrease volume")]
        public KeyCode volumeDownKey = KeyCode.Minus;

        private void Start()
        {
            // If no reference is set, try to find it in the scene
            if (musicPlayerToggle == null)
            {
                musicPlayerToggle = FindObjectOfType<MusicPlayerToggle>();
                
                if (musicPlayerToggle == null)
                {
                    Debug.LogWarning("[MusicPlayerToggleExample] No MusicPlayerToggle found in scene. Make sure to add the MusicPlayerToggle component to a GameObject with a UIToggle.");
                }
            }
        }

        private void Update()
        {
            if (musicPlayerToggle == null)
                return;

            // Toggle music with M key
            if (Input.GetKeyDown(toggleKey))
            {
                bool currentState = musicPlayerToggle.IsToggleOn();
                musicPlayerToggle.SetMusicState(!currentState);
                Debug.Log($"[MusicPlayerToggleExample] Music toggled to: {!currentState}");
            }

            // Volume controls
            if (Input.GetKeyDown(volumeUpKey))
            {
                // This would need to be implemented in MusicPlayerToggle if you want volume control
                Debug.Log("[MusicPlayerToggleExample] Volume up pressed (not implemented in this example)");
            }

            if (Input.GetKeyDown(volumeDownKey))
            {
                // This would need to be implemented in MusicPlayerToggle if you want volume control
                Debug.Log("[MusicPlayerToggleExample] Volume down pressed (not implemented in this example)");
            }
        }

        #region Public Methods for UI Buttons

        /// <summary>
        /// Public method to toggle music - can be called from UI buttons
        /// </summary>
        public void ToggleMusic()
        {
            if (musicPlayerToggle != null)
            {
                bool currentState = musicPlayerToggle.IsToggleOn();
                musicPlayerToggle.SetMusicState(!currentState);
            }
        }

        /// <summary>
        /// Public method to turn music on - can be called from UI buttons
        /// </summary>
        public void TurnMusicOn()
        {
            if (musicPlayerToggle != null)
            {
                musicPlayerToggle.SetMusicState(true);
            }
        }

        /// <summary>
        /// Public method to turn music off - can be called from UI buttons
        /// </summary>
        public void TurnMusicOff()
        {
            if (musicPlayerToggle != null)
            {
                musicPlayerToggle.SetMusicState(false);
            }
        }

        #endregion
    }
} 