using CGJ2025;
using Sirenix.OdinInspector;
using Sirenix.Utilities;
using UnityEngine;
using UnityEngine.Serialization;
using UnityEngine.UI;

namespace CGJ2025
{
    public class MagicItem : MonoBehaviour
    {
        // This class is responsible for managing the backpack grids.
        // It can be extended to include methods for adding, removing, and organizing items in the backpack.

        [Required, SerializeField]
        private MagicItemData magicItemData; // Reference to the MagicItem scriptable object

        
        [Required, SerializeField]
        private VirtualSlot anchorSlot;

        public VirtualSlot AnchorSlot => anchorSlot; // The anchor slot where the item is placed in the backpack grid

        public BackpackGrids backpackGrids { get; private set; } // Reference to the BackpackGrids component

        public BackpackSlot centerSlot => IsInBackpack ? backpackGrids.GetSlotAt(Position.x, Position.y) : null; // The center slot where the item is placed in the backpack grid

        public Vector2Int CornerPosition => IsInBackpack ? Position - this.anchorSlot.position : new Vector2Int(-1, -1); // The position of the corner slot in the backpack grid

        private Vector2Int Position = new Vector2Int(-1, -1);

                

        // 拖拽控制器引用
        private ItemDragController dragController;
        
        public bool IsDragging => dragController.IsDragging; // Check if the item is currently being dragged

        private MagicItemEscapeBehaviour escapeBehaviour;

        private Image image; // Reference to the Image component for visual representation

        private Material material;

        public int Score => magicItemData.score; // Score of the item, defined in the MagicItemData scriptable object

        public string ItemName => magicItemData.itemName; // Name of the item, defined in the MagicItemData scriptable object

        public int[][] Shape { get; private set; }// Shape of the item, defined in the MagicItemData scriptable object
        private int[][] originalShape; // Original shape of the item before any transformations

        // 检查物体是否在背包中
        public bool IsInBackpack => Position.x >= 0 && Position.y >= 0;

        private float escapeTimer = 0.0f; // Timer to track the escape time

        void Awake()
        {
            this.Position = new Vector2Int(-1, -1); // Initialize the position to indicate the item is not in the backpack

            // Ensure the magic item data is assigned
            this.image = GetComponentInChildren<Image>();
            if (image == null)
            {
                Debug.LogError("MagicItem requires an Image component for visual representation.");
            }
            image.alphaHitTestMinimumThreshold = 0.95f;

            this.material = image.material;
            if (image != null && image.material != null)
            {
                // Create a unique instance of the material for this object
                this.material = new Material(image.material);
                image.material = this.material;
            }
            else
            {
                Debug.LogError("MagicItem requires an Image with a material.");
            }

            // 获取拖拽控制器组件
            dragController = GetComponent<ItemDragController>();
            if (dragController == null)
            {
                // 如果没有拖拽控制器，添加一个
                dragController = gameObject.AddComponent<ItemDragController>();
            }

            this.escapeBehaviour = GetComponent<MagicItemEscapeBehaviour>();
            if (escapeBehaviour == null)
            {
                // 如果没有逃脱行为组件，添加一个
                escapeBehaviour = gameObject.AddComponent<MagicItemEscapeBehaviour>();
            }
        }

        // Start is called once before the first execution of Update after the MonoBehaviour is created
        void Start()
        {
            this.backpackGrids = GameManager.Instance.BackpackGrids; // Get the backpack grids from the GameManager
            this.AutoSetShape(); // Automatically set the shape of the item based on its virtual slots
        }

        // Update is called once per frame
        void Update()
        {
            // Code to update the backpack grids can go here.

            if (!escapeBehaviour.IsEscaping)
            {
                if (escapeTimer < magicItemData.escapeTime)
                {
                    escapeTimer += Time.deltaTime; // Increment the escape timer

                    if (escapeTimer > magicItemData.escapeTime / 2)
                    {
                        this.material.SetFloat("_VibrateFrequency", 50.0f); // Increase the wiggle frequency as the escape time approaches
                    }
                }
                else
                {
                    this.RemoveSelfFromGrid(); // Clear the item from the backpack grids

                    // If the escape time has been reached, trigger the escape behavior
                    escapeBehaviour?.StartEscaping();
                    escapeTimer = 0.0f; // Reset the escape timer
                    this.material.SetFloat("_VibrateFrequency", 0f); // Reset the wiggle frequency
                }
            }
        }

        private void ResetEscapeTimer()
        {
            escapeTimer = 0.0f; // Reset the escape timer
            this.material.SetFloat("_VibrateFrequency", 0f); // Reset the wiggle frequency
        }

        private void AutoSetShape()
        {
            VirtualSlot[] virtualSlots = GetComponentsInChildren<VirtualSlot>();

            if (virtualSlots == null || virtualSlots.Length == 0)
            {
                Debug.LogWarning("No VirtualSlot components found in the item.");
                return;
            }

            int[][] shape = new int[3][];
            for (int i = 0; i < shape.Length; i++)
            {
                shape[i] = new int[3]; // Assuming a 3x3 shape for simplicity
                for (int j = 0; j < shape[i].Length; j++)
                {
                    shape[i][j] = 0; // Initialize to empty
                }
            }

            foreach (VirtualSlot virtualSlot in virtualSlots)
            {
                if (virtualSlot != null && virtualSlot.Occupied)
                {
                    shape[virtualSlot.position.y][virtualSlot.position.x] = 1;
                }
            }

            this.Shape = shape; // Set the shape of the item
            this.originalShape = shape; // Store the original shape for reference
        }

        public void Rotate(bool clockwise)
        {
            float rotationAngle = transform.rotation.eulerAngles.z;
            transform.rotation = Quaternion.Euler(0, 0, clockwise ? rotationAngle - 90 : rotationAngle + 90);
            // TODO: Rotate the item transform as well
            // Rotate the item shape based on the clockwise parameter
            // Rotate the shape 90 degrees clockwise
            this.Shape = ItemShapes.RotateShape(this.Shape, clockwise);
        }

        public void RemoveSelfFromGrid()
        {
            backpackGrids?.RemoveItem(this); // Remove the item from the backpack grids
            this.Position = new Vector2Int(-1, -1); // Reset the position to indicate the item is not in the backpack
        }

        public void PickUp()
        {
            if (IsInBackpack)
            {
                this.RemoveSelfFromGrid(); // Clear the item from the backpack grid
                // 调用表现层方法
                OnItemPickedUp();
            }
            else
            {
                this.transform.rotation = Quaternion.identity; // Reset the rotation of the item
                this.Shape = originalShape; // Reset the shape to the original shape
            }
        }

        public bool FitInBackpack(int x, int y)
        {
            // Check if the item can fit in the backpack at the specified position
            if (backpackGrids != null)
            {
                Vector2Int upperLeft = new Vector2Int(x - this.anchorSlot.position.x, y - this.anchorSlot.position.y);
                return backpackGrids.FitsAt(this, upperLeft.x, upperLeft.y);
            }
            return false; // If backpack grids are not set, return false
        }

        // TODO: This method should be called when the item is placed in the backpack. (when clicking on the backpack slot)
        public void PlaceInBackpack(int x, int y)
        {
            Vector2Int upperLeft = new Vector2Int(x - this.anchorSlot.position.x, y - this.anchorSlot.position.y);
            // Check if the item can fit in the backpack at the specified position
            if (backpackGrids.SetItemAt(this, upperLeft.x, upperLeft.y))
            {
                // Place the item in the backpack grid at the specified position
                this.Position = new Vector2Int(x, y);
                this.escapeBehaviour.StopEscaping(); // Stop the escape behavior if it was active
                ResetEscapeTimer(); // Reset the escape timer

                // TODO: Set Item Image's position on slot grids UI correctly
                OnItemPlacedInBackpack(x, y);
            }
            else
            {
                Debug.LogWarning($"Item {ItemName} cannot fit at position ({x}, {y})");
            }
        }

        // 检查物体是否可以放置在指定的背包位置
        public bool CanPlaceInBackpack(int x, int y)
        {
            return backpackGrids != null && backpackGrids.FitsAt(this, x, y);
        }

        #region 表现层方法 - 留空以便后续实现

        // 表现层方法 - 物体被拾起时调用
        private void OnItemPickedUp()
        {
            // TODO: 实现具体的视觉表现
            // 例如：播放拾起音效、改变透明度等
        }

        // 表现层方法 - 物体放置在背包中时调用
        private void OnItemPlacedInBackpack(int x, int y)
        {
            // TODO: 实现具体的视觉表现
            // 例如：设置物体在UI中的正确位置、播放放置音效等
        }

        #endregion
    }
}