using UnityEngine;
using UnityEngine.UI;

using Sirenix.OdinInspector;

namespace CGJ2025
{
    // VirtualSlot class represents a virtual slot in the backpack grid.
    public class VirtualSlot : MonoBehaviour
    {
        public Vector2Int position; // Position of the virtual slot in the grid

        public bool Occupied;

        private Image highlightImage; // Reference to the highlight image component

        void Awake()
        {
            highlightImage = GetComponent<Image>();
            if (highlightImage == null)
            {
                Debug.LogError("VirtualSlot requires an Image component for highlighting.");
            }

            if (highlightImage != null)
            {
                highlightImage.enabled = false; // Disable the highlight image by default
            }
        }

        public void SetHighlight(bool highlight)
        {
            if (highlightImage != null)
            {
                highlightImage.enabled = highlight; // Enable or disable the highlight image
            }
        }
    }
}