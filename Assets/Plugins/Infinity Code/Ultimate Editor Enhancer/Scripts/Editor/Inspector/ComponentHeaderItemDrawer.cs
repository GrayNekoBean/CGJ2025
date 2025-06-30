/*           INFINITY CODE          */
/*     https://infinity-code.com    */

using System;
using System.Collections;
using System.Linq;
using System.Reflection;
using InfinityCode.UltimateEditorEnhancer.Attributes;
using InfinityCode.UltimateEditorEnhancer.UnityTypes;
using UnityEditor;
using UnityEngine;

namespace InfinityCode.UltimateEditorEnhancer.InspectorTools
{
    [InitializeOnLoad]
    public static class ComponentHeaderItemDrawer
    {
        static ComponentHeaderItemDrawer()
        {
            EditorApplication.update += Update;
        }

        private static void Update()
        {
            IList editorHeaderItemsMethods = EditorGUIUtilityRef.editorHeaderItemsMethodsField.GetValue(null) as IList;
            if (editorHeaderItemsMethods == null) return;
            
            EditorApplication.update -= Update;
            
            var methods = TypeCache.GetMethodsWithAttribute<ComponentHeaderButtonAttribute>()
                .OrderBy(m => m.GetCustomAttribute<ComponentHeaderButtonAttribute>().order);
            
            Type headerItemDelegate = Reflection.GetEditorType("EditorGUIUtility+HeaderItemDelegate");
            
            foreach (MethodInfo method in methods)
            {
                editorHeaderItemsMethods.Add(Delegate.CreateDelegate(headerItemDelegate, method));
            }

            EditorGUIUtilityRef.editorHeaderItemsMethodsField.SetValue(null, editorHeaderItemsMethods);

            GUI.changed = true;
        }
    }
}