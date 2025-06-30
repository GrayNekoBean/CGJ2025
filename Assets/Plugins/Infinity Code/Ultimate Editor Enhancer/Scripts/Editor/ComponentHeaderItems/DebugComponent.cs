/*           INFINITY CODE          */
/*     https://infinity-code.com    */

using InfinityCode.UltimateEditorEnhancer.Attributes;
using InfinityCode.UltimateEditorEnhancer.Windows;
using UnityEditor;
using UnityEngine;

namespace InfinityCode.UltimateEditorEnhancer.ComponentHeader
{
    [InitializeOnLoad]
    public static class DebugComponent 
    {
        private static readonly GUIContent content;

        static DebugComponent()
        {
            content = new GUIContent(Icons.debug, "Debug Component");
        }
        
        [ComponentHeaderButton(ComponentHeaderButtonOrder.Debug)]
        public static bool DrawDebugButton(Rect rect, Object[] targets)
        {
            if (!Prefs.componentExtraHeaderButtons || !Prefs.debugComponentHeaderButton) return false;
            if (targets.Length != 1) return false;

            Object target = targets[0];
            Component component = target as Component;
            if (component == null) return false;

            ButtonEvent buttonEvent = GUILayoutUtils.Button(rect, content, GUIStyle.none);
            if (buttonEvent == ButtonEvent.click)
            {
                Event e = Event.current;
                if (e.button == 0) ComponentWindow.Show(component).SetDebugMode(true);
            }

            return true;
        }
    }
}