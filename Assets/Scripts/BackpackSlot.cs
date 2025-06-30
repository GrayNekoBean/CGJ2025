using Sirenix.OdinInspector;
using TMPro;
using UnityEngine;
using UnityEngine.UI;

namespace CGJ2025
{
    // BackpackSlot class represents a single slot in the backpack grid.
    public class BackpackSlot : MonoBehaviour
    {

        public int x; // X coordinate in the backpack grid
        public int y; // Y coordinate in the backpack grid

        [SerializeField] private TMP_Text slotPosition;

        [ReadOnly]
        public BackpackGrids backpackGrids;

        [ReadOnly]
        public MagicItem item; // The item placed in this slot

        public bool IsEmpty => item == null; // Check if the slot is empty

        [ReadOnly]
        public bool IsItemSlot = false;

        private Image image;

        private Color emptyColor = new Color(1f, 1f, 1f, 1f); // Color for empty slots

        private Color filledColor = new Color(0.5f, 0.5f, 0.5f, 1f); // Color for filled slots

        void Awake()
        {
            this.image = GetComponent<Image>();
            // Ensure the slot has an Image component for visual representation
            if (image == null)
            {
                Debug.LogError("BackpackSlot requires an Image component for visual representation.");
            }

            emptyColor = image.color; // Store the initial color for empty slots
            filledColor = emptyColor * 0.5f; // Set a different color for filled slots
            filledColor.a = 1f; // Ensure the alpha is set to fully opaque
        }

        public void Initialize(BackpackGrids grids, int posX, int posY)
        {
            if (IsItemSlot) return;

            this.backpackGrids = grids;
            this.x = posX;
            this.y = posY;
            this.item = null; // Initialize the item to null
        }

        public void SetTestSlotPositionText()
        {
            slotPosition.text = $"({x}, {y})";
        }

        public void ClearItem()
        {
            item = null; // Clear the item in this slot
            this.GetComponent<Image>().color = emptyColor; // Change color to indicate empty slot
        }

        public bool SetItem(MagicItem newItem)
        {
            if (IsEmpty)
            {
                item = newItem;
                this.GetComponent<Image>().color = filledColor; // Change color to indicate filled slot
                return true; // Successfully set the item
            }
            return false; // Slot is not empty, item cannot be set
        }

    }
}
