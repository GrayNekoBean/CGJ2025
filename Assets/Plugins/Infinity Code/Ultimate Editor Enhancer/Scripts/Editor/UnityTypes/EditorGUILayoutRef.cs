﻿/*           INFINITY CODE          */
/*     https://infinity-code.com    */

using System;
using System.Reflection;
using UnityEditor;
using UnityEngine;

namespace InfinityCode.UltimateEditorEnhancer.UnityTypes
{
    public static class EditorGUILayoutRef
    {
        private static MethodInfo _toolbarSearchFieldMethod;

        private static MethodInfo toolbarSearchFieldMethod
        {
            get
            {
                if (_toolbarSearchFieldMethod == null) _toolbarSearchFieldMethod = type.GetMethod("ToolbarSearchField", Reflection.StaticLookup, null, new[] {typeof(string), typeof(GUILayoutOption[])}, null);
                return _toolbarSearchFieldMethod;
            }
        }
        
        public static float kLabelFloatMaxW
        {
            get
            {
                return (float) ((double) EditorGUIUtility.labelWidth + (double) EditorGUIUtility.fieldWidth + 5.0);
            }
        }

        public static Type type => typeof(EditorGUILayout);

        public static string ToolbarSearchField(string value, params GUILayoutOption[] options)
        {
            return toolbarSearchFieldMethod.Invoke(null, new object[] { value, options }) as string;
        }
    }
}