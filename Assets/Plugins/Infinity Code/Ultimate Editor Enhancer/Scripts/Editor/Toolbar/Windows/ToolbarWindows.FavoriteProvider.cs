﻿/*           INFINITY CODE          */
/*     https://infinity-code.com    */

using InfinityCode.UltimateEditorEnhancer.References;

namespace InfinityCode.UltimateEditorEnhancer.Tools
{
    public static partial class ToolbarWindows
    {
        public class FavoriteProvider : Provider
        {
            public override float order
            {
                get { return -1; }
            }

            public override void GenerateMenu(GenericMenuEx menu, ref bool hasItems)
            {
                if (!Prefs.favoriteWindowsInToolbar) return;

                foreach (var window in FavoriteWindowReferences.items)
                {
                    menu.Add("Favorites/" + window.title, window.Open);
                }
                if (FavoriteWindowReferences.count > 0) menu.AddSeparator("Favorites/");
                menu.Add("Favorites/Edit", Settings.OpenFavoriteWindowsSettings);
                hasItems = true;
            }
        }
    }
}