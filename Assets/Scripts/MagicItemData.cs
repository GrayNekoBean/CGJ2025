using UnityEngine;

using System.Collections.Generic;
using UnityEngine.Rendering;

namespace CGJ2025
{
    // MagicItem class represents a magical item in the game.
    [CreateAssetMenu(fileName = "MagicItemData", menuName = "CGJ2025/MagicItemData", order = 1)]
    public class MagicItemData : ScriptableObject
    {
        public string itemName; // Name of the magic item
        public string description; // Description of the magic item
        public int score;

        public float escapeTime
        {
            get
            {
                return 240.0f / score;
            }
        }
    }

    public enum ShapeType
    {
        TShape,
        LShape,
        SquareShape,
        LineShape,
        ZShape,
        BigEmptyShape
    }

    public static class ItemShapes
    {
        public static Dictionary<ShapeType, int[][]> ShapeDictionary;

        public static int[][] TShape = new int[3][]
        {
            new int[] { 1, 1, 1 },
            new int[] { 0, 1, 0 },
            new int[] { 0, 1, 0 }
        };

        public static int[][] LShape = new int[3][]
        {
            new int[] { 1, 0, 0 },
            new int[] { 1, 0, 0 },
            new int[] { 1, 1, 0 }
        };

        public static int[][] SquareShape = new int[2][]
        {
            new int[] { 1, 1 },
            new int[] { 1, 1 }
        };

        public static int[][] LineShape = new int[3][]
        {
            new int[] { 1, 1, 1 },
            new int[] { 0, 0, 0 },
            new int[] { 0, 0, 0 }
        };

        public static int[][] ZShape = new int[3][]
        {
            new int[] { 1, 1, 0 },
            new int[] { 0, 1, 1 },
            new int[] { 0, 0, 0 }
        };

        public static int[][] BigEmptyShape = new int[4][]
        {
            new int[] { 0, 0, 0 ,0},
            new int[] { 0, 0, 0,0 },
            new int[] { 0, 0, 0,0 },
            new int[] { 0, 0, 0,0 }
        };

        public static int[][] RotateShape(int[][] shape, bool clockwise = true)
        {
            if (shape == null || shape.Length == 0)
            {
                return null; // Return null if the shape is invalid
            }

            if (clockwise)
            {
                int rows = shape.Length;
                int cols = shape[0].Length;
                int[][] rotatedShape = new int[cols][];

                for (int i = 0; i < cols; i++)
                {
                    rotatedShape[i] = new int[rows];
                    for (int j = 0; j < rows; j++)
                    {
                        rotatedShape[i][j] = shape[rows - j - 1][i];
                    }
                }
                return rotatedShape;
            }
            else
            {
                // Counter-clockwise rotation
                int rows = shape.Length;
                int cols = shape[0].Length;
                int[][] rotatedShape = new int[cols][];
                for (int i = 0; i < cols; i++)
                {
                    rotatedShape[i] = new int[rows];
                    for (int j = 0; j < rows; j++)
                    {
                        rotatedShape[i][j] = shape[j][cols - i - 1];
                    }
                }

                return rotatedShape;
            }
        }
    }
}