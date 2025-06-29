﻿/*           INFINITY CODE          */
/*     https://infinity-code.com    */

using InfinityCode.UltimateEditorEnhancer.UnityTypes;
using UnityEditor;
using UnityEngine;

namespace InfinityCode.UltimateEditorEnhancer.Behaviors
{
    [InitializeOnLoad]
    public static class CreateDirectory
    {
        static CreateDirectory()
        {
            KeyManager.KeyBinding binding = KeyManager.AddBinding();
            binding.OnPress += OnInvoke;
            binding.OnValidate += OnValidate;
        }

        private static void OnInvoke()
        {
            Object obj = Selection.objects[0];
            string path = AssetDatabase.GetAssetPath(obj);

            if (string.IsNullOrEmpty(path)) return;
            ProjectWindowUtilsRef.CreateFolderWithTemplates(obj.name, null);
        }

        private static bool OnValidate()
        {
            if (!Prefs.projectCreateFolderByShortcut) return false;
            if (Event.current.keyCode != KeyCode.F7) return false;
            return Selection.objects.Length == 1;
        }
    }
}