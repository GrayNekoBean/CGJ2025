using UnityEngine;
using UnityEngine.EventSystems;

namespace CGJ2025
{
    public class ItemDragController : MonoBehaviour, IPointerDownHandler, IBeginDragHandler, IDragHandler, IEndDragHandler
    {
        private MagicItem magicItem;
        private MagicItemEscapeBehaviour escapeBehaviour;
        private Canvas canvas;
        private CanvasGroup canvasGroup;
        private RectTransform rectTransform;
        
        // 拖拽相关
        private Vector3 originalPosition;
        private Vector3 originalLocalPosition;
        private BackpackSlot originalBackpackSlot;
        private bool wasInBackpack => !escapeBehaviour.IsEscaping && originalBackpackSlot != null;

        private bool isDragging = false;
        public bool IsDragging => isDragging; // 是否正在拖拽

        private RectTransform backpackArea;
        // UI相关
        private Camera uiCamera;
        private bool startDragFromBackpack = false;

        
        void Awake()
        {
            magicItem = GetComponent<MagicItem>();
            escapeBehaviour = GetComponent<MagicItemEscapeBehaviour>();
            rectTransform = GetComponent<RectTransform>();
            canvasGroup = GetComponent<CanvasGroup>();
            
            // 如果没有CanvasGroup组件，添加一个
            if (canvasGroup == null)
            {
                canvasGroup = gameObject.AddComponent<CanvasGroup>();
            }
            
            // 找到Canvas
            canvas = GetComponentInParent<Canvas>();
            if (canvas == null)
            {
                Debug.LogError("ItemDragController requires a Canvas in parent hierarchy");
            }
            
            // 获取UI摄像机
            uiCamera = canvas.worldCamera;
            
        }

        void Start()
        {
            backpackArea = GameManager.Instance.BackpackGrids.GetComponent<RectTransform>();
        }

        void Update()
        {
            if (isDragging)
            {
                if (Input.GetKeyDown(KeyCode.E))
                {
                    // 如果按下E键，旋转物体
                    magicItem.Rotate(true); // 顺时针旋转
                    Debug.Log("Rotating item clockwise");
                }
                else if (Input.GetKeyDown(KeyCode.Q))
                {
                    // 如果按下Q键，逆时针旋转
                    magicItem.Rotate(false); // 逆时针旋转
                    Debug.Log("Rotating item counter-clockwise");
                }
            }
        }

        public void OnPointerDown(PointerEventData eventData)
        {
            // 记录拖拽开始时的状态
            originalPosition = transform.position;
            originalLocalPosition = transform.localPosition;
            originalBackpackSlot = magicItem.centerSlot;

            // // 如果物体在背包中，先从背包中移除
            // if (wasInBackpack)
            // {
            //     magicItem.PickUp();
            // }
        }

        public void OnBeginDrag(PointerEventData eventData)
        {
            // 开始拖拽时的视觉效果
            canvasGroup.alpha = 0.8f;
            canvasGroup.blocksRaycasts = false;

            // 将物体移到最前面显示
            transform.SetAsLastSibling();

            startDragFromBackpack = wasInBackpack;

            escapeBehaviour.StopMoving();

            //计算MagicItem的centerSlot与MagicItem的相对位置，并将自身位置与光标位置移动到centerSlot的中心位置
            if (magicItem.AnchorSlot != null)
            {
                Vector3 offset = magicItem.AnchorSlot.transform.position - transform.position;
                Vector3 mousePosition = Input.mousePosition;
                transform.position = mousePosition - offset;
            }

            magicItem.PickUp();
            
            this.isDragging = true;
        }

        public void OnDrag(PointerEventData eventData)
        {
            // 跟随鼠标移动
            if (canvas.renderMode == RenderMode.ScreenSpaceOverlay)
            {
                rectTransform.anchoredPosition += eventData.delta / canvas.scaleFactor;
            }
            else
            {
                Vector3 worldPosition;
                RectTransformUtility.ScreenPointToWorldPointInRectangle(
                    rectTransform,
                    eventData.position,
                    uiCamera,
                    out worldPosition);
                rectTransform.position = worldPosition;
            }
        }

        public void OnEndDrag(PointerEventData eventData)
        {
            // 恢复视觉效果
            canvasGroup.alpha = 1.0f;
            canvasGroup.blocksRaycasts = true;

            //判断是否在背包中
            if (!IsInBackpackArea())
            {
                this.originalBackpackSlot = null; // 如果不在背包区域，清除原始槽位
                // 如果物体不在背包中，可能需要执行逃逸逻辑
                escapeBehaviour.ResumeMoving();
            }

            // 尝试放置物体
            bool placed = TryPlaceItem(eventData);

            if (!placed)
            {
                // 无法放置，回到原位置
                ReturnToOriginalPosition();
            }
            
            this.isDragging = false;
        }

        private bool TryPlaceItem(PointerEventData eventData)
        {
            // 检测鼠标下方的UI元素
            var raycastResults = new System.Collections.Generic.List<RaycastResult>();
            EventSystem.current.RaycastAll(eventData, raycastResults);
            
            BackpackSlot targetSlot = null;
            
            // 查找背包槽位
            foreach (var result in raycastResults)
            {
                BackpackSlot slot = result.gameObject.GetComponent<BackpackSlot>();
                if (slot != null && !slot.IsItemSlot)
                {
                    targetSlot = slot;
                    break;
                }
            }
            
            if (targetSlot != null)
            {
                // 尝试放置在背包中
                return TryPlaceInBackpack(targetSlot);
            }
            else
            {
                // 检查是否有其他放置区域（如货架）
                return TryPlaceInOtherAreas(raycastResults);
            }
        }

        private bool TryPlaceInBackpack(BackpackSlot targetSlot)
        {            
            // 检查是否可以放置在目标位置
            if (CanPlaceInBackpack(targetSlot.x, targetSlot.y))
            {
                // 执行放置逻辑
                magicItem.PlaceInBackpack(targetSlot.x, targetSlot.y);
                this.SnapToSlot(targetSlot);
                // 调用表现层方法
                OnItemPlacedInBackpack(targetSlot.x, targetSlot.y);

                return true;
            }
            
            return false;
        }

        private bool TryPlaceInOtherAreas(System.Collections.Generic.List<RaycastResult> raycastResults)
        {
            // TODO: 实现货架等其他区域的放置逻辑
            // 这里可以检测货架槽位等其他UI元素
            
            foreach (var result in raycastResults)
            {
                // 示例：检测货架槽位
                // ShelfSlot shelfSlot = result.gameObject.GetComponent<ShelfSlot>();
                // if (shelfSlot != null)
                // {
                //     return TryPlaceInShelf(shelfSlot);
                // }
            }
            
            return false;
        }

        private bool CanPlaceInBackpack(int x, int y)
        {
            // 使用BackpackGrids的FitsAt方法检查是否可以放置
            if (magicItem.backpackGrids != null)
            {
                return magicItem.FitInBackpack(x, y);
            }
            
            return false;
        }

        private void ReturnToOriginalPosition()
        {
            // 回到原始位置
            transform.position = originalPosition;
            transform.localPosition = originalLocalPosition;

            // 如果原来在背包中，重新放置回原位置
            if (!escapeBehaviour.IsEscaping && originalBackpackSlot != null)
            {
                magicItem.PlaceInBackpack(originalBackpackSlot.x, originalBackpackSlot.y);
                OnItemReturnedToOriginalPosition();
            }
            else
            {
                escapeBehaviour.StartEscaping(); // 如果不在背包中，开始逃逸逻辑
                // 如果物体不在背包中，可能需要执行逃逸逻辑 
            }
        }

        private void SnapToSlot(BackpackSlot slot)
        {
            // 将物体位置设置到指定槽位的中心
            Vector3 targetPosition = slot.transform.position;
            Vector3 offset = magicItem.AnchorSlot != null ? magicItem.AnchorSlot.transform.position - rectTransform.position : Vector3.zero;
            targetPosition -= offset; // 添加偏移量以对齐中心
            rectTransform.position = targetPosition;
        }

        // 表现层方法 - 物体成功放置在背包中时调用
        private void OnItemPlacedInBackpack(int x, int y)
        {
            // TODO: 实现具体的视觉表现
            // 例如：播放放置音效、显示特效等
            Debug.Log($"Item {magicItem.ItemName} placed in backpack at ({x}, {y})");
        }

        // 表现层方法 - 物体返回原位置时调用
        private void OnItemReturnedToOriginalPosition()
        {
            // TODO: 实现具体的视觉表现
            // 例如：播放回弹动画、音效等
            Debug.Log($"Item {magicItem.ItemName} returned to original position");
        }

        private bool IsInBackpackArea()
        {
            if (backpackArea == null) return false;
            
            Vector2 localPoint;
            RectTransformUtility.ScreenPointToLocalPointInRectangle(
                backpackArea, Input.mousePosition, canvas.worldCamera, out localPoint);
            
            return backpackArea.rect.Contains(localPoint);
        }
    }
}