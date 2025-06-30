using UnityEngine;

using System.Collections.Generic;
using System;
using Sirenix.Utilities;
using Unity.Collections;

namespace CGJ2025
{
    public class BackpackGrids : MonoBehaviour
    {
        [SerializeField]
        private int backpackWidth = 7;

        [SerializeField]
        private int backpackHeight = 7;

        public int score { get; private set; } = 0; // Score for the backpack grid

        private List<BackpackSlot> backpackSlots;

        public static BackpackGrids Instance { get; private set; }

        void Awake()
        {
            if (Instance == null)
            {
                Instance = this;
                DontDestroyOnLoad(gameObject); // Keep this instance across scenes
            }

            this.backpackSlots = new List<BackpackSlot>();

            BackpackSlot[] slots = GetComponentsInChildren<BackpackSlot>();

            int i = 0;
            foreach (BackpackSlot slot in slots)
            {
                if (slot != null)
                {
                    int x = i % backpackWidth; // Calculate x position based on index
                    int y = i / backpackWidth; // Calculate y position based on index
                    slot.Initialize(this, x, y); // Initialize the slot with the grid reference and its position
                    backpackSlots.Add(slot);
                    i++;
                }
            }

            if (i != backpackWidth * backpackHeight)
            {
                Debug.LogError($"Backpack slots count mismatch: expected {backpackWidth * backpackHeight}, found {i}");
            }
        }

        // Start is called once before the first execution of Update after the MonoBehaviour is created
        void Start()
        {
            // Initialize the backpack grid or perform any setup needed
        }

        // Update is called once per frame
        void Update()
        {
            // Handle any updates related to the backpack grid
        }
        
        public void ResetScore()
        {
            this.score = 0; // Reset the score to zero
        }

        // x and y are the coordinates in the backpack grid, starting from (0, 0) at the top-left corner
        public bool SetItemAt(MagicItem item, int x, int y)
        {
            // Check if the item can fit at the specified position
            if (FitsAt(item, x, y))
            {
                // Place the item in the grid at the specified position
                for (int i = 0; i < item.Shape.Length; i++)
                {
                    for (int j = 0; j < item.Shape[i].Length; j++)
                    {
                        if (item.Shape[i][j] == 1)
                        {
                            int gridX = x + j;
                            int gridY = y + i;
                            backpackSlots[gridY * backpackWidth + gridX].SetItem(item); // Set the item in the corresponding slot
                        }
                    }
                }
                this.score += item.Score; // Increment the score by the item's score

                return true; // Successfully placed the item
            }
            else
            {
                Debug.LogWarning($"Item {item.ItemName} cannot fit at position ({x}, {y})");
                return false; // Item cannot be placed at the specified position
            }
        }

        public BackpackSlot GetSlotAt(int x, int y)
        {
            // Calculate the index in the list based on the x and y coordinates
            int index = y * backpackWidth + x;
            if (index >= 0 && index < backpackSlots.Count)
            {
                return backpackSlots[index];
            }
            return null; // Return null if the index is out of bounds
        }

        public void RemoveItem(MagicItem item)
        {
            if (item.IsInBackpack)
            {
                for (int i = 0; i < item.Shape.Length; i++)
                {
                    for (int j = 0; j < item.Shape[i].Length; j++)
                    {
                        if (item.Shape[i][j] == 1)
                        {
                            int gridX = item.CornerPosition.x + j;
                            int gridY = item.CornerPosition.y + i;
                            this.RemoveSlotItemAt(gridX, gridY); // Remove the item from the backpack grid
                        }
                    }
                }
            }
            this.score -= item.Score; // Decrement the score by the item's score
        }
        
        private void RemoveSlotItemAt(int x, int y)
        {
            BackpackSlot slot = GetSlotAt(x, y);
            if (slot != null && !slot.IsEmpty)
            {
                Debug.Log($"Clearing item {slot.item.ItemName} from slot ({x}, {y})");
                slot.ClearItem(); // Clear the item from the slot
            }
        }

        // Use upper left corner as the origin (0, 0)
        // Check if the item can fit at the specified position (x, y)
        public bool FitsAt(MagicItem item, int x, int y)
        {
            // Check if the cells are already occupied
            for (int i = 0; i < item.Shape.Length; i++)
            {
                for (int j = 0; j < item.Shape[i].Length; j++)
                {
                    if (item.Shape[i][j] == 1)
                    {
                        int gridX = x + j;
                        int gridY = y + i;
                        
                        if (gridX < 0 || gridY < 0 || gridX >= backpackWidth || gridY >= backpackHeight)
                        {
                            return false; // Item exceeds grid boundaries
                        }

                        if (!GetSlotAt(gridX, gridY).IsEmpty) // If the cell is already filled
                        {
                            return false; // Item cannot be placed here
                        }
                    }
                }
            }

            return true; // Item can be placed at the specified position
        }
    }
}