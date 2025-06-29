﻿/*           INFINITY CODE          */
/*     https://infinity-code.com    */

using System;
using System.Reflection;
using UnityEngine;

namespace InfinityCode.UltimateEditorEnhancer.UnityTypes
{
    public static class PrefabStageUtilityRef
    {
        private static MethodInfo _openPrefabMethod;
        private static Type _type;

        private static MethodInfo openPrefabMethod
        {
            get
            {
                if (_openPrefabMethod == null) _openPrefabMethod = type.GetMethod("OpenPrefab", Reflection.StaticLookup, null, new[] {typeof(string), typeof(GameObject)}, null);
                return _openPrefabMethod;
            }
        }

        public static Type type
        {
            get
            {
                if (_type == null)
                {
                    _type = Reflection.GetEditorType("SceneManagement.PrefabStageUtility");
                }
                return _type;
            }
        }

        public static void OpenPrefab(string path, GameObject gameObject = null)
        {
            openPrefabMethod.Invoke(null, new object[] {path, gameObject});
        }
    }
}