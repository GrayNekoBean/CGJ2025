// Made with Amplify Shader Editor v1.9.8.1
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Sprite Shaders Ultimate/Multiplicative SSU"
{
	Properties
	{
		[PerRendererData] _MainTex ("Sprite Texture", 2D) = "white" {}
		_Color ("Tint", Color) = (1,1,1,1)
		[MaterialToggle] PixelSnap ("Pixel snap", Float) = 0
		[PerRendererData] _AlphaTex ("External Alpha", 2D) = "white" {}
		[Toggle(_VERTEXTINTFIRST_ON)] _VertexTintFirst("Vertex Tint First", Float) = 0
		[Toggle(_PIXELPERFECTSPACE_ON)] _PixelPerfectSpace("Pixel Perfect Space", Float) = 0
		[Toggle(_PIXELPERFECTUV_ON)] _PixelPerfectUV("Pixel Perfect UV", Float) = 0
		[Toggle(_SPRITESHEETFIX_ON)] _SpriteSheetFix("Sprite Sheet Fix", Float) = 0
		_SpriteSheetRect("Sprite Sheet Rect", Vector) = (0,0,1,1)
		[Toggle(_TILINGFIX_ON)] _TilingFix("Tiling Fix", Float) = 0
		[Toggle(_BAKEDMATERIAL_ON)] _BakedMaterial("Baked Material", Float) = 0
		[KeywordEnum(UV,UV_Raw,Object,Object_Scaled,World,UI_Graphic,Screen)] _ShaderSpace("Shader Space", Float) = 0
		_PixelsPerUnit("Pixels Per Unit", Float) = 100
		_ScreenWidthUnits("Screen Width Units", Float) = 10
		_RectWidth("Rect Width", Float) = 100
		_RectHeight("Rect Height", Float) = 100
		[KeywordEnum(None,Full,Mask,Dissolve,Spread)] _ShaderFading("Shader Fading", Float) = 0
		_FadingFade("Fading: Fade", Range( 0 , 1)) = 1
		_FadingPosition("Fading: Position", Vector) = (0,0,0,0)
		_FadingWidth("Fading: Width", Float) = 0.3
		_FadingNoiseFactor("Fading: Noise Factor", Float) = 0.2
		_FadingNoiseScale("Fading: Noise Scale", Vector) = (0.2,0.2,0,0)
		_FadingMask("Fading: Mask", 2D) = "white" {}
		[Toggle(_TOGGLEUNSCALEDTIME_ON)] _ToggleUnscaledTime("Toggle: Unscaled Time", Float) = 0
		[Toggle(_TOGGLECUSTOMTIME_ON)] _ToggleCustomTime("Toggle: Custom Time", Float) = 0
		_TimeValue("Time: Value", Float) = 0
		[Toggle(_TOGGLETIMESPEED_ON)] _ToggleTimeSpeed("Toggle: Time Speed", Float) = 0
		_TimeSpeed("Time: Speed", Float) = 1
		[Toggle(_TOGGLETIMEFPS_ON)] _ToggleTimeFPS("Toggle: Time FPS", Float) = 0
		_TimeFPS("Time: FPS", Float) = 5
		[Toggle(_TOGGLETIMEFREQUENCY_ON)] _ToggleTimeFrequency("Toggle: Time Frequency", Float) = 0
		_TimeFrequency("Time: Frequency", Float) = 2
		_TimeRange("Time: Range", Float) = 0.5
		_UberNoiseTexture("Uber Noise Texture", 2D) = "white" {}
		[Toggle(_ENABLESTRONGTINT_ON)] _EnableStrongTint("Enable Strong Tint", Float) = 0
		_StrongTintFade("Strong Tint: Fade", Range( 0 , 1)) = 1
		[HDR][NoAlpha]_StrongTintTint("Strong Tint: Tint", Color) = (1,1,1,1)
		[Toggle(_STRONGTINTCONTRASTTOGGLE_ON)] _StrongTintContrastToggle("Strong Tint: Contrast Toggle", Float) = 0
		_StrongTintContrast("Strong Tint: Contrast", Float) = 0
		[Toggle(_STRONGTINTMASKTOGGLE_ON)] _StrongTintMaskToggle("Strong Tint: Mask Toggle", Float) = 0
		_StrongTintMask("Strong Tint: Mask", 2D) = "white" {}
		[Toggle(_ENABLEADDCOLOR_ON)] _EnableAddColor("Enable Add Color", Float) = 0
		_AddColorFade("Add Color: Fade", Range( 0 , 1)) = 1
		[HDR]_AddColorColor("Add Color: Color", Color) = (2.996078,0,0,0)
		[Toggle(_ADDCOLORCONTRASTTOGGLE_ON)] _AddColorContrastToggle("Add Color: Contrast Toggle", Float) = 0
		_AddColorContrast("Add Color: Contrast", Float) = 0.5
		[Toggle(_ADDCOLORMASKTOGGLE_ON)] _AddColorMaskToggle("Add Color: Mask Toggle", Float) = 0
		_AddColorMask("Add Color: Mask", 2D) = "white" {}
		[Toggle(_ENABLEALPHATINT_ON)] _EnableAlphaTint("Enable Alpha Tint", Float) = 0
		_AlphaTintFade("Alpha Tint: Fade", Range( 0 , 1)) = 1
		[HDR]_AlphaTintColor("Alpha Tint: Color", Color) = (95.87451,5.019608,95.87451,0)
		_AlphaTintMinAlpha("Alpha Tint: Min Alpha", Range( 0 , 1)) = 0.02
		[Toggle(_ENABLESHADOW_ON)] _EnableShadow("Enable Shadow", Float) = 0
		_ShadowFade("Shadow: Fade", Range( 0 , 1)) = 1
		_ShadowOffset("Shadow: Offset", Vector) = (0.05,-0.05,0,0)
		_ShadowColor("Shadow: Color", Color) = (0,0,0,0)
		[Toggle(_ENABLEBRIGHTNESS_ON)] _EnableBrightness("Enable Brightness", Float) = 0
		_Brightness("Brightness", Float) = 1
		[Toggle(_ENABLECONTRAST_ON)] _EnableContrast("Enable Contrast", Float) = 0
		_Contrast("Contrast", Float) = 1
		[Toggle(_ENABLESATURATION_ON)] _EnableSaturation("Enable Saturation", Float) = 0
		_Saturation("Saturation", Float) = 1
		[Toggle(_ENABLEHUE_ON)] _EnableHue("Enable Hue", Float) = 0
		_Hue("Hue", Range( -1 , 1)) = 0
		[Toggle(_ENABLERECOLORRGB_ON)] _EnableRecolorRGB("Enable Recolor RGB", Float) = 0
		_RecolorRGBFade("Recolor RGB: Fade", Range( 0 , 1)) = 1
		[HDR]_RecolorRGBRedTint("Recolor RGB: Red Tint", Color) = (1,1,1,0.5019608)
		[HDR]_RecolorRGBGreenTint("Recolor RGB: Green Tint", Color) = (1,1,1,0.5019608)
		[HDR]_RecolorRGBBlueTint("Recolor RGB: Blue Tint", Color) = (1,1,1,0.5019608)
		[Toggle(_RECOLORRGBTEXTURETOGGLE_ON)] _RecolorRGBTextureToggle("Recolor RGB: Texture Toggle", Float) = 0
		_RecolorRGBTexture("Recolor RGB: Texture", 2D) = "white" {}
		[Toggle(_ENABLERECOLORRGBYCP_ON)] _EnableRecolorRGBYCP("Enable Recolor RGBYCP", Float) = 0
		_RecolorRGBYCPFade("Recolor RGBYCP: Fade", Range( 0 , 1)) = 1
		[HDR]_RecolorRGBYCPRedTint("Recolor RGBYCP: Red Tint", Color) = (1,1,1,0.5019608)
		[HDR]_RecolorRGBYCPYellowTint("Recolor RGBYCP: Yellow Tint", Color) = (1,1,1,0.5019608)
		[HDR]_RecolorRGBYCPGreenTint("Recolor RGBYCP: Green Tint", Color) = (1,1,1,0.5019608)
		[HDR]_RecolorRGBYCPCyanTint("Recolor RGBYCP: Cyan Tint", Color) = (1,1,1,0.5019608)
		[HDR]_RecolorRGBYCPBlueTint("Recolor RGBYCP: Blue Tint", Color) = (1,1,1,0.5019608)
		[HDR]_RecolorRGBYCPPurpleTint("Recolor RGBYCP: Purple Tint", Color) = (1,1,1,0.5019608)
		[Toggle(_RECOLORRGBYCPTEXTURETOGGLE_ON)] _RecolorRGBYCPTextureToggle("Recolor RGBYCP: Texture Toggle", Float) = 0
		_RecolorRGBYCPTexture("Recolor RGBYCP: Texture", 2D) = "white" {}
		[Toggle(_ENABLEINNEROUTLINE_ON)] _EnableInnerOutline("Enable Inner Outline", Float) = 0
		_InnerOutlineFade("Inner Outline: Fade", Range( 0 , 1)) = 1
		[HDR]_InnerOutlineColor("Inner Outline: Color", Color) = (11.98431,1.254902,1.254902,1)
		_InnerOutlineWidth("Inner Outline: Width", Float) = 0.02
		[Toggle(_INNEROUTLINEDISTORTIONTOGGLE_ON)] _InnerOutlineDistortionToggle("Inner Outline: Distortion Toggle", Float) = 0
		_InnerOutlineDistortionIntensity("Inner Outline: Distortion Intensity", Vector) = (0.01,0.01,0,0)
		_InnerOutlineNoiseScale("Inner Outline: Noise Scale", Vector) = (4,4,0,0)
		_InnerOutlineNoiseSpeed("Inner Outline: Noise Speed", Vector) = (0,0.1,0,0)
		[Toggle(_INNEROUTLINETEXTURETOGGLE_ON)] _InnerOutlineTextureToggle("Inner Outline: Texture Toggle", Float) = 0
		_InnerOutlineTintTexture("Inner Outline: Tint Texture", 2D) = "white" {}
		_InnerOutlineTextureSpeed("Inner Outline: Texture Speed", Vector) = (0.5,0,0,0)
		[Toggle(_INNEROUTLINEOUTLINEONLYTOGGLE_ON)] _InnerOutlineOutlineOnlyToggle("Inner Outline: Outline Only Toggle", Float) = 0
		[Toggle(_ENABLEOUTEROUTLINE_ON)] _EnableOuterOutline("Enable Outer Outline", Float) = 0
		_OuterOutlineFade("Outer Outline: Fade", Range( 0 , 1)) = 1
		[HDR]_OuterOutlineColor("Outer Outline: Color", Color) = (0,0,0,1)
		_OuterOutlineWidth("Outer Outline: Width", Float) = 0.04
		[Toggle(_OUTEROUTLINEDISTORTIONTOGGLE_ON)] _OuterOutlineDistortionToggle("Outer Outline: Distortion Toggle", Float) = 0
		_OuterOutlineDistortionIntensity("Outer Outline: Distortion Intensity", Vector) = (0.01,0.01,0,0)
		_OuterOutlineNoiseScale("Outer Outline: Noise Scale", Vector) = (4,4,0,0)
		_OuterOutlineNoiseSpeed("Outer Outline: Noise Speed", Vector) = (0,0.1,0,0)
		[Toggle(_OUTEROUTLINETEXTURETOGGLE_ON)] _OuterOutlineTextureToggle("Outer Outline: Texture Toggle", Float) = 0
		_OuterOutlineTintTexture("Outer Outline: Tint Texture", 2D) = "white" {}
		_OuterOutlineTextureSpeed("Outer Outline: Texture Speed", Vector) = (0.5,0,0,0)
		[Toggle(_OUTEROUTLINEOUTLINEONLYTOGGLE_ON)] _OuterOutlineOutlineOnlyToggle("Outer Outline: Outline Only Toggle", Float) = 0
		[Toggle(_ENABLEPIXELOUTLINE_ON)] _EnablePixelOutline("Enable Pixel Outline", Float) = 0
		_PixelOutlineFade("Pixel Outline: Fade", Range( 0 , 1)) = 1
		[HDR]_PixelOutlineColor("Pixel Outline: Color", Color) = (0,0,0,1)
		_PixelOutlineWidth("Pixel Outline: Width", Float) = 1
		_PixelOutlineAlphaLimit("Pixel Outline: Alpha Limit", Range( 0 , 1)) = 0.5
		[Toggle(_PIXELOUTLINETEXTURETOGGLE_ON)] _PixelOutlineTextureToggle("Pixel Outline: Texture Toggle", Float) = 0
		_PixelOutlineTintTexture("Pixel Outline: Tint Texture", 2D) = "white" {}
		_PixelOutlineTextureSpeed("Pixel Outline: Texture Speed", Vector) = (0.5,0,0,0)
		[Toggle(_PIXELOUTLINEOUTLINEONLYTOGGLE_ON)] _PixelOutlineOutlineOnlyToggle("Pixel Outline: Outline Only Toggle", Float) = 0
		[Toggle(_ENABLEADDHUE_ON)] _EnableAddHue("Enable Add Hue", Float) = 0
		_AddHueFade("Add Hue: Fade", Range( 0 , 1)) = 1
		_AddHueSpeed("Add Hue: Speed", Float) = 1
		_AddHueBrightness("Add Hue: Brightness", Float) = 2
		_AddHueSaturation("Add Hue: Saturation", Range( 0 , 1)) = 1
		_AddHueContrast("Add Hue: Contrast", Float) = 0.5
		[Toggle(_ADDHUEMASKTOGGLE_ON)] _AddHueMaskToggle("Add Hue: Mask Toggle", Float) = 0
		_AddHueMask("Add Hue: Mask", 2D) = "white" {}
		[Toggle(_ENABLEPINGPONGGLOW_ON)] _EnablePingPongGlow("Enable Ping-Pong Glow", Float) = 0
		_PingPongGlowFade("Ping-Pong Glow: Fade", Range( 0 , 1)) = 1
		[HDR]_PingPongGlowFrom("Ping-Pong Glow: From", Color) = (5.992157,0.1882353,0.1882353,0)
		[HDR]_PingPongGlowTo("Ping-Pong Glow: To", Color) = (0.1882353,0.1882353,5.992157,0)
		_PingPongGlowFrequency("Ping-Pong Glow: Frequency", Float) = 3
		_PingPongGlowContrast("Ping-Pong Glow: Contrast", Float) = 1
		[Toggle(_ENABLESHIFTHUE_ON)] _EnableShiftHue("Enable Shift Hue", Float) = 0
		_ShiftHueSpeed("Shift Hue: Speed", Float) = 0.5
		[Toggle(_ENABLEINKSPREAD_ON)] _EnableInkSpread("Enable Ink Spread", Float) = 0
		_InkSpreadFade("Ink Spread: Fade", Range( 0 , 1)) = 1
		[HDR]_InkSpreadColor("Ink Spread: Color", Color) = (8.47419,5.013525,0.08873497,0)
		_InkSpreadContrast("Ink Spread: Contrast", Float) = 2
		_InkSpreadDistance("Ink Spread: Distance", Float) = 3
		_InkSpreadPosition("Ink Spread: Position", Vector) = (0.5,-1,0,0)
		_InkSpreadWidth("Ink Spread: Width", Float) = 0.2
		_InkSpreadNoiseScale("Ink Spread: Noise Scale", Vector) = (0.4,0.4,0,0)
		_InkSpreadNoiseFactor("Ink Spread: Noise Factor", Float) = 0.5
		[Toggle(_ENABLEBLACKTINT_ON)] _EnableBlackTint("Enable Black Tint", Float) = 0
		_BlackTintFade("Black Tint: Fade", Range( 0 , 1)) = 1
		[HDR]_BlackTintColor("Black Tint: Color", Color) = (0,0,1,0)
		_BlackTintPower("Black Tint: Power", Float) = 4
		[Toggle(_ENABLESINEGLOW_ON)] _EnableSineGlow("Enable Sine Glow", Float) = 0
		_SineGlowFade("Sine Glow: Fade", Range( 0 , 1)) = 1
		[HDR]_SineGlowColor("Sine Glow: Color", Color) = (0,2.007843,2.996078,0)
		_SineGlowContrast("Sine Glow: Contrast", Float) = 1
		_SineGlowFrequency("Sine Glow: Frequency", Float) = 4
		_SineGlowMin("Sine Glow: Min", Float) = 0
		_SineGlowMax("Sine Glow: Max", Float) = 1
		[Toggle(_SINEGLOWMASKTOGGLE_ON)] _SineGlowMaskToggle("Sine Glow: Mask Toggle", Float) = 0
		_SineGlowMask("Sine Glow: Mask", 2D) = "white" {}
		[Toggle(_ENABLESPLITTONING_ON)] _EnableSplitToning("Enable Split Toning", Float) = 0
		_SplitToningFade("Split Toning: Fade", Range( 0 , 1)) = 1
		[HDR]_SplitToningHighlightsColor("Split Toning: Highlights Color", Color) = (1,0.1,0.1,0)
		[HDR]_SplitToningShadowsColor("Split Toning: Shadows Color", Color) = (0.1,0.4000002,1,0)
		_SplitToningContrast("Split Toning: Contrast", Float) = 1
		_SplitToningBalance("Split Toning: Balance", Float) = 1
		_SplitToningShift("Split Toning: Shift", Range( -1 , 1)) = 0
		[Toggle(_ENABLECOLORREPLACE_ON)] _EnableColorReplace("Enable Color Replace", Float) = 0
		_ColorReplaceFade("Color Replace: Fade", Range( 0 , 1)) = 1
		_ColorReplaceFromColor("Color Replace: From Color", Color) = (0,0,0,0)
		[HDR]_ColorReplaceToColor("Color Replace: To Color", Color) = (0,0,0.2,0)
		_ColorReplaceRange("Color Replace: Range", Float) = 0.05
		_ColorReplaceSmoothness("Color Replace: Smoothness", Float) = 0.1
		_ColorReplaceContrast("Color Replace: Contrast", Float) = 1
		[Toggle(_ENABLENEGATIVE_ON)] _EnableNegative("Enable Negative", Float) = 0
		_NegativeFade("Negative: Fade", Range( 0 , 1)) = 1
		[Toggle(_ENABLEHOLOGRAM_ON)] _EnableHologram("Enable Hologram", Float) = 0
		_HologramFade("Hologram: Fade", Range( 0 , 1)) = 1
		[HDR]_HologramTint("Hologram: Tint", Color) = (0.3137255,1.662745,2.996078,1)
		_HologramContrast("Hologram: Contrast", Float) = 1
		_HologramLineFrequency("Hologram: Line Frequency", Float) = 500
		_HologramLineGap("Hologram: Line Gap", Range( 0 , 5)) = 3
		_HologramLineSpeed("Hologram: Line Speed", Float) = 0.01
		_HologramMinAlpha("Hologram: Min Alpha", Range( 0 , 1)) = 0.2
		_HologramDistortionOffset("Hologram: Distortion Offset", Float) = 0.5
		_HologramDistortionSpeed("Hologram: Distortion Speed", Float) = 2
		_HologramDistortionDensity("Hologram: Distortion Density", Float) = 0.5
		_HologramDistortionScale("Hologram: Distortion Scale", Float) = 10
		[Toggle(_ENABLEGLITCH_ON)] _EnableGlitch("Enable Glitch", Float) = 0
		_GlitchFade("Glitch: Fade", Range( 0 , 1)) = 1
		_GlitchMaskMin("Glitch: Mask Min", Range( 0 , 1)) = 0.4
		_GlitchMaskScale("Glitch: Mask Scale", Vector) = (0,0.2,0,0)
		_GlitchMaskSpeed("Glitch: Mask Speed", Vector) = (0,4,0,0)
		_GlitchHueSpeed("Glitch: Hue Speed", Float) = 1
		_GlitchBrightness("Glitch: Brightness", Float) = 4
		_GlitchNoiseScale("Glitch: Noise Scale", Vector) = (0,3,0,0)
		_GlitchNoiseSpeed("Glitch: Noise Speed", Vector) = (0,1,0,0)
		_GlitchDistortion("Glitch: Distortion", Vector) = (0.1,0,0,0)
		_GlitchDistortionScale("Glitch: Distortion Scale", Vector) = (0,3,0,0)
		_GlitchDistortionSpeed("Glitch: Distortion Speed", Vector) = (0,1,0,0)
		[Toggle(_ENABLEFROZEN_ON)] _EnableFrozen("Enable Frozen", Float) = 0
		_FrozenFade("Frozen: Fade", Range( 0 , 1)) = 1
		[HDR]_FrozenTint("Frozen: Tint", Color) = (1.819608,4.611765,5.992157,0)
		_FrozenContrast("Frozen: Contrast", Float) = 2
		[HDR]_FrozenSnowColor("Frozen: Snow Color", Color) = (1.123529,1.373203,1.498039,0)
		_FrozenSnowContrast("Frozen: Snow Contrast", Float) = 1
		_FrozenSnowDensity("Frozen: Snow Density", Range( 0 , 1)) = 0.25
		_FrozenSnowScale("Frozen: Snow Scale", Vector) = (0.1,0.1,0,0)
		[HDR]_FrozenHighlightColor("Frozen: Highlight Color", Color) = (1.797647,4.604501,5.992157,1)
		_FrozenHighlightContrast("Frozen: Highlight Contrast", Float) = 2
		_FrozenHighlightDensity("Frozen: Highlight Density", Range( 0 , 1)) = 1
		_FrozenHighlightSpeed("Frozen: Highlight Speed", Vector) = (0.1,0.1,0,0)
		_FrozenHighlightScale("Frozen: Highlight Scale", Vector) = (0.2,0.2,0,0)
		_FrozenHighlightDistortion("Frozen: Highlight Distortion", Vector) = (0.5,0.5,0,0)
		_FrozenHighlightDistortionSpeed("Frozen: Highlight Distortion Speed", Vector) = (-0.05,-0.05,0,0)
		_FrozenHighlightDistortionScale("Frozen: Highlight Distortion Scale", Vector) = (0.2,0.2,0,0)
		[Toggle(_ENABLERAINBOW_ON)] _EnableRainbow("Enable Rainbow", Float) = 0
		_RainbowFade("Rainbow: Fade", Range( 0 , 1)) = 1
		_RainbowBrightness("Rainbow: Brightness", Float) = 2
		_RainbowSaturation("Rainbow: Saturation", Range( 0 , 1)) = 1
		_RainbowContrast("Rainbow: Contrast", Float) = 1
		_RainbowSpeed("Rainbow: Speed", Float) = 1
		_RainbowDensity("Rainbow: Density", Float) = 0.5
		_RainbowCenter("Rainbow: Center", Vector) = (0,0,0,0)
		_RainbowNoiseScale("Rainbow: Noise Scale", Vector) = (0.2,0.2,0,0)
		_RainbowNoiseFactor("Rainbow: Noise Factor", Float) = 0.2
		[Toggle(_ENABLECAMOUFLAGE_ON)] _EnableCamouflage("Enable Camouflage", Float) = 0
		_CamouflageFade("Camouflage: Fade", Range( 0 , 1)) = 1
		_CamouflageBaseColor("Camouflage: Base Color", Color) = (0.7450981,0.7254902,0.5686275,0)
		_CamouflageContrast("Camouflage: Contrast", Float) = 1
		_CamouflageColorA("Camouflage: Color A", Color) = (0.627451,0.5882353,0.4313726,0)
		_CamouflageDensityA("Camouflage: Density A", Range( 0 , 1)) = 0.4
		_CamouflageSmoothnessA("Camouflage: Smoothness A", Range( 0 , 1)) = 0.2
		_CamouflageNoiseScaleA("Camouflage: Noise Scale A", Vector) = (0.25,0.25,0,0)
		_CamouflageColorB("Camouflage: Color B", Color) = (0.4705882,0.4313726,0.3137255,0)
		_CamouflageDensityB("Camouflage: Density B", Range( 0 , 1)) = 0.4
		_CamouflageSmoothnessB("Camouflage: Smoothness B", Range( 0 , 1)) = 0.2
		_CamouflageNoiseScaleB("Camouflage: Noise Scale B", Vector) = (0.25,0.25,0,0)
		[Toggle(_CAMOUFLAGEANIMATIONTOGGLE_ON)] _CamouflageAnimationToggle("Camouflage: Animation Toggle", Float) = 0
		_CamouflageDistortionSpeed("Camouflage: Distortion Speed", Vector) = (0.1,0.1,0,0)
		_CamouflageDistortionIntensity("Camouflage: Distortion Intensity", Vector) = (0.1,0.1,0,0)
		_CamouflageDistortionScale("Camouflage: Distortion Scale", Vector) = (0.5,0.5,0,0)
		[Toggle(_ENABLEMETAL_ON)] _EnableMetal("Enable Metal", Float) = 0
		_MetalFade("Metal: Fade", Range( 0 , 1)) = 1
		[HDR]_MetalColor("Metal: Color", Color) = (5.992157,3.639216,0.3137255,1)
		_MetalContrast("Metal: Contrast", Float) = 2
		[HDR]_MetalHighlightColor("Metal: Highlight Color", Color) = (5.992157,3.796078,0.6588235,1)
		_MetalHighlightDensity("Metal: Highlight Density", Range( 0 , 1)) = 1
		_MetalHighlightContrast("Metal: Highlight Contrast", Float) = 2
		_MetalNoiseScale("Metal: Noise Scale", Vector) = (0.25,0.25,0,0)
		_MetalNoiseSpeed("Metal: Noise Speed", Vector) = (0.05,0.05,0,0)
		_MetalNoiseDistortionScale("Metal: Noise Distortion Scale", Vector) = (0.2,0.2,0,0)
		_MetalNoiseDistortionSpeed("Metal: Noise Distortion Speed", Vector) = (-0.05,-0.05,0,0)
		_MetalNoiseDistortion("Metal: Noise Distortion", Vector) = (0.5,0.5,0,0)
		[Toggle(_METALMASKTOGGLE_ON)] _MetalMaskToggle("Metal: Mask Toggle", Float) = 0
		[NoScaleOffset]_MetalMask("Metal: Mask", 2D) = "white" {}
		[Toggle(_ENABLESHINE_ON)] _EnableShine("Enable Shine", Float) = 0
		_ShineFade("Shine: Fade", Range( 0 , 1)) = 1
		[HDR]_ShineColor("Shine: Color", Color) = (11.98431,11.98431,11.98431,0)
		_ShineSaturation("Shine: Saturation", Range( 0 , 1)) = 0.5
		_ShineContrast("Shine: Contrast", Float) = 2
		_ShineWidth("Shine: Width", Float) = 0.1
		_ShineSpeed("Shine: Speed", Float) = 5
		_ShineRotation("Shine: Rotation", Range( 0 , 360)) = 30
		_ShineSmooth("Shine: Smoothness", Float) = 1
		_ShineFrequency("Shine: Frequency", Float) = 0.3
		[Toggle(_SHINEMASKTOGGLE_ON)] _ShineMaskToggle("Shine: Mask Toggle", Float) = 0
		[NoScaleOffset]_ShineMask("Shine: Mask", 2D) = "white" {}
		[Toggle(_ENABLEBURN_ON)] _EnableBurn("Enable Burn", Float) = 0
		_BurnFade("Burn: Fade", Range( 0 , 1)) = 1
		_BurnPosition("Burn: Position", Vector) = (0,5,0,0)
		_BurnRadius("Burn: Radius", Float) = 5
		[HDR]_BurnEdgeColor("Burn: Edge Color", Color) = (11.98431,1.129412,0.1254902,0)
		_BurnWidth("Burn: Width", Float) = 0.1
		_BurnEdgeNoiseScale("Burn: Edge Noise Scale", Vector) = (0.3,0.3,0,0)
		_BurnEdgeNoiseFactor("Burn: Edge Noise Factor", Float) = 0.5
		[HDR]_BurnInsideColor("Burn: Inside Color", Color) = (0.75,0.5625,0.525,0)
		_BurnInsideContrast("Burn: Inside Contrast", Float) = 2
		[HDR]_BurnInsideNoiseColor("Burn: Inside Noise Color", Color) = (3084.047,257.0039,0,0)
		_BurnInsideNoiseFactor("Burn: Inside Noise Factor", Float) = 0.2
		_BurnInsideNoiseScale("Burn: Inside Noise Scale", Vector) = (0.5,0.5,0,0)
		_BurnSwirlFactor("Burn: Swirl Factor", Float) = 1
		_BurnSwirlNoiseScale("Burn: Swirl Noise Scale", Vector) = (0.1,0.1,0,0)
		[Toggle(_ENABLEPOISON_ON)] _EnablePoison("Enable Poison", Float) = 0
		_PoisonFade("Poison: Fade", Range( 0 , 1)) = 1
		[HDR]_PoisonColor("Poison: Color", Color) = (0.3137255,2.996078,0.3137255,0)
		_PoisonDensity("Poison: Density", Float) = 3
		_PoisonRecolorFactor("Poison: Recolor Factor", Range( 0 , 1)) = 0.5
		_PoisonShiftSpeed("Poison: Shift Speed", Float) = 0.2
		_PoisonNoiseBrightness("Poison: Noise Brightness", Float) = 2
		_PoisonNoiseScale("Poison: Noise Scale", Vector) = (0.2,0.2,0,0)
		_PoisonNoiseSpeed("Poison: Noise Speed", Vector) = (0,-0.2,0,0)
		[Toggle(_ENABLEENCHANTED_ON)] _EnableEnchanted("Enable Enchanted", Float) = 0
		_EnchantedFade("Enchanted: Fade", Range( 0 , 1)) = 1
		_EnchantedSpeed("Enchanted: Speed", Vector) = (0,1,0,0)
		_EnchantedScale("Enchanted: Scale", Vector) = (0.1,0.1,0,0)
		_EnchantedBrightness("Enchanted: Brightness", Float) = 1
		_EnchantedContrast("Enchanted: Contrast", Float) = 0.5
		_EnchantedReduce("Enchanted: Reduce", Range( 0 , 2)) = 0
		[Toggle(_ENCHANTEDRAINBOWTOGGLE_ON)] _EnchantedRainbowToggle("Enchanted: Rainbow Toggle", Float) = 0
		_EnchantedRainbowSpeed("Enchanted: Rainbow Speed", Float) = 0.5
		_EnchantedRainbowDensity("Enchanted: Rainbow Density", Float) = 0.5
		_EnchantedRainbowSaturation("Enchanted: Rainbow Saturation", Float) = 0.8
		[HDR]_EnchantedLowColor("Enchanted: Low Color", Color) = (2.996078,0,0,0)
		[HDR]_EnchantedHighColor("Enchanted: High Color", Color) = (0,0.7098798,4.237095,0)
		[Toggle(_ENCHANTEDLERPTOGGLE_ON)] _EnchantedLerpToggle("Enchanted: Lerp Toggle", Float) = 0
		[Toggle(_ENABLESHIFTING_ON)] _EnableShifting("Enable Shifting", Float) = 0
		_ShiftingFade("Shifting: Fade", Range( 0 , 1)) = 1
		_ShiftingSpeed("Shifting: Speed", Float) = 0.5
		_ShiftingDensity("Shifting: Density", Float) = 1.5
		_ShiftingBrightness("Shifting: Brightness", Float) = 1
		_ShiftingContrast("Shifting: Contrast", Float) = 0.5
		[Toggle(_SHIFTINGRAINBOWTOGGLE_ON)] _ShiftingRainbowToggle("Shifting: Rainbow Toggle", Float) = 0
		_ShiftingSaturation("Shifting: Saturation", Float) = 0.8
		[HDR]_ShiftingColorA("Shifting: Color A", Color) = (1.498039,0,0,0)
		[HDR]_ShiftingColorB("Shifting: Color B", Color) = (1.498039,0.7490196,0,0)
		[Toggle(_ENABLETEXTURELAYER1_ON)] _EnableTextureLayer1("Enable Texture Layer 1", Float) = 0
		_TextureLayer1Fade("Texture Layer 1: Fade", Range( 0 , 1)) = 1
		_TextureLayer1Texture("Texture Layer 1: Texture", 2D) = "white" {}
		[HDR]_TextureLayer1Color("Texture Layer 1: Color", Color) = (0.4494117,1.298301,2.996079,1)
		_TextureLayer1Scale("Texture Layer 1: Scale", Vector) = (1,1,0,0)
		_TextureLayer1Offset("Texture Layer 1: Offset", Vector) = (0,0,0,0)
		[Toggle(_TEXTURELAYER1CONTRASTTOGGLE_ON)] _TextureLayer1ContrastToggle("Texture Layer 1: Contrast Toggle", Float) = 0
		_TextureLayer1Contrast("Texture Layer 1: Contrast", Float) = 1
		[Toggle(_TEXTURELAYER1SCROLLTOGGLE_ON)] _TextureLayer1ScrollToggle("Texture Layer 1: Scroll Toggle", Float) = 0
		_TextureLayer1ScrollSpeed("Texture Layer 1: Scroll Speed", Vector) = (0,1,0,0)
		[Toggle(_TEXTURELAYER1SHEETTOGGLE_ON)] _TextureLayer1SheetToggle("Texture Layer 1: Sheet Toggle", Float) = 1
		_TextureLayer1Columns("Texture Layer 1: Columns", Int) = 3
		_TextureLayer1Rows("Texture Layer 1: Rows", Int) = 3
		_TextureLayer1Speed("Texture Layer 1: Speed", Float) = 20
		_TextureLayer1StartFrame("Texture Layer 1: Start Frame", Int) = 0
		_TextureLayer1EdgeClip("Texture Layer 1: Edge Clip", Range( 0 , 1)) = 0.005
		[Toggle(_ENABLETEXTURELAYER2_ON)] _EnableTextureLayer2("Enable Texture Layer 2", Float) = 0
		_TextureLayer2Fade("Texture Layer 2: Fade", Range( 0 , 1)) = 1
		_TextureLayer2Texture("Texture Layer 2: Texture", 2D) = "white" {}
		[HDR]_TextureLayer2Color("Texture Layer 2: Color", Color) = (0.4494117,1.298301,2.996079,1)
		_TextureLayer2Scale("Texture Layer 2: Scale", Vector) = (1,1,0,0)
		_TextureLayer2Offset("Texture Layer 2: Offset", Vector) = (0,0,0,0)
		[Toggle(_TEXTURELAYER2CONTRASTTOGGLE_ON)] _TextureLayer2ContrastToggle("Texture Layer 2: Contrast Toggle", Float) = 0
		_TextureLayer2Contrast("Texture Layer 2: Contrast", Float) = 1
		[Toggle(_TEXTURELAYER2SCROLLTOGGLE_ON)] _TextureLayer2ScrollToggle("Texture Layer 2: Scroll Toggle", Float) = 0
		_TextureLayer2ScrollSpeed("Texture Layer 2: Scroll Speed", Vector) = (0,1,0,0)
		[Toggle(_TEXTURELAYER2SHEETTOGGLE_ON)] _TextureLayer2SheetToggle("Texture Layer 2: Sheet Toggle", Float) = 1
		_TextureLayer2Columns("Texture Layer 2: Columns", Int) = 3
		_TextureLayer2Rows("Texture Layer 2: Rows", Int) = 3
		_TextureLayer2Speed("Texture Layer 2: Speed", Float) = 20
		_TextureLayer2StartFrame("Texture Layer 2: Start Frame", Int) = 0
		_TextureLayer2EdgeClip("Texture Layer 2: Edge Clip", Range( 0 , 1)) = 0.005
		[Toggle(_ENABLEFULLALPHADISSOLVE_ON)] _EnableFullAlphaDissolve("Enable Full Alpha Dissolve", Float) = 0
		_FullAlphaDissolveFade("Full Alpha Dissolve: Fade", Range( 0 , 1)) = 0.5
		_FullAlphaDissolveWidth("Full Alpha Dissolve: Width", Float) = 0.5
		_FullAlphaDissolveNoiseScale("Full Alpha Dissolve: Noise Scale", Vector) = (0.1,0.1,0,0)
		[Toggle(_ENABLEFULLGLOWDISSOLVE_ON)] _EnableFullGlowDissolve("Enable Full Glow Dissolve", Float) = 0
		_FullGlowDissolveFade("Full Glow Dissolve: Fade", Range( 0 , 1)) = 0.5
		_FullGlowDissolveWidth("Full Glow Dissolve: Width", Float) = 0.5
		[HDR]_FullGlowDissolveEdgeColor("Full Glow Dissolve: Edge Color", Color) = (11.98431,0.627451,0.627451,0)
		_FullGlowDissolveNoiseScale("Full Glow Dissolve: Noise Scale", Vector) = (0.1,0.1,0,0)
		[Toggle(_ENABLESOURCEALPHADISSOLVE_ON)] _EnableSourceAlphaDissolve("Enable Source Alpha Dissolve", Float) = 0
		_SourceAlphaDissolveFade("Source Alpha Dissolve: Fade", Float) = 1
		_SourceAlphaDissolvePosition("Source Alpha Dissolve: Position", Vector) = (0,0,0,0)
		_SourceAlphaDissolveWidth("Source Alpha Dissolve: Width", Float) = 0.2
		_SourceAlphaDissolveNoiseScale("Source Alpha Dissolve: Noise Scale", Vector) = (0.3,0.3,0,0)
		_SourceAlphaDissolveNoiseFactor("Source Alpha Dissolve: Noise Factor", Float) = 0.2
		[Toggle]_SourceAlphaDissolveInvert("Source Alpha Dissolve: Invert", Float) = 0
		[Toggle(_ENABLESOURCEGLOWDISSOLVE_ON)] _EnableSourceGlowDissolve("Enable Source Glow Dissolve", Float) = 0
		_SourceGlowDissolveFade("Source Glow Dissolve: Fade", Float) = 1
		_SourceGlowDissolvePosition("Source Glow Dissolve: Position", Vector) = (0,0,0,0)
		_SourceGlowDissolveWidth("Source Glow Dissolve: Width", Float) = 0.1
		[HDR]_SourceGlowDissolveEdgeColor("Source Glow Dissolve: Edge Color", Color) = (11.98431,0.627451,0.627451,0)
		_SourceGlowDissolveNoiseScale("Source Glow Dissolve: Noise Scale", Vector) = (0.3,0.3,0,0)
		_SourceGlowDissolveNoiseFactor("Source Glow Dissolve: Noise Factor", Float) = 0.2
		[Toggle]_SourceGlowDissolveInvert("Source Glow Dissolve: Invert", Float) = 0
		[Toggle(_ENABLEHALFTONE_ON)] _EnableHalftone("Enable Halftone", Float) = 0
		_HalftoneFade("Halftone: Fade", Float) = 1
		_HalftonePosition("Halftone: Position", Vector) = (0,0,0,0)
		_HalftoneTiling("Halftone: Tiling", Float) = 4
		_HalftoneFadeWidth("Halftone: Width", Float) = 1.5
		[Toggle]_HalftoneInvert("Halftone: Invert", Float) = 0
		[Toggle(_ENABLEDIRECTIONALALPHAFADE_ON)] _EnableDirectionalAlphaFade("Enable Directional Alpha Fade", Float) = 0
		_DirectionalAlphaFadeFade("Directional Alpha Fade: Fade", Float) = 0
		_DirectionalAlphaFadeRotation("Directional Alpha Fade: Rotation", Range( 0 , 360)) = 0
		_DirectionalAlphaFadeWidth("Directional Alpha Fade: Width", Float) = 0.2
		_DirectionalAlphaFadeNoiseScale("Directional Alpha Fade: Noise Scale", Vector) = (0.3,0.3,0,0)
		_DirectionalAlphaFadeNoiseFactor("Directional Alpha Fade: Noise Factor", Float) = 0.2
		[Toggle]_DirectionalAlphaFadeInvert("Directional Alpha Fade: Invert", Float) = 0
		[Toggle(_ENABLEDIRECTIONALGLOWFADE_ON)] _EnableDirectionalGlowFade("Enable Directional Glow Fade", Float) = 0
		_DirectionalGlowFadeFade("Directional Glow Fade: Fade", Float) = 0
		_DirectionalGlowFadeRotation("Directional Glow Fade: Rotation", Range( 0 , 360)) = 0
		[HDR]_DirectionalGlowFadeEdgeColor("Directional Glow Fade: Edge Color", Color) = (11.98431,0.6901961,0.6901961,0)
		_DirectionalGlowFadeWidth("Directional Glow Fade: Width", Float) = 0.1
		_DirectionalGlowFadeNoiseScale("Directional Glow Fade: Noise Scale", Vector) = (0.4,0.4,0,0)
		_DirectionalGlowFadeNoiseFactor("Directional Glow Fade: Noise Factor", Float) = 0.2
		[Toggle]_DirectionalGlowFadeInvert("Directional Glow Fade: Invert", Float) = 0
		[Toggle(_ENABLEDIRECTIONALDISTORTION_ON)] _EnableDirectionalDistortion("Enable Directional Distortion", Float) = 0
		_DirectionalDistortionFade("Directional Distortion: Fade", Float) = 0
		_DirectionalDistortionRotation("Directional Distortion: Rotation", Range( 0 , 360)) = 0
		_DirectionalDistortionWidth("Directional Distortion: Width", Float) = 0.5
		_DirectionalDistortionNoiseScale("Directional Distortion: Noise Scale", Vector) = (0.4,0.4,0,0)
		_DirectionalDistortionNoiseFactor("Directional Distortion: Noise Factor", Float) = 0.2
		_DirectionalDistortionDistortion("Directional Distortion: Distortion", Vector) = (0,0.1,0,0)
		_DirectionalDistortionRandomDirection("Directional Distortion: Random Direction", Range( 0 , 1)) = 0.1
		_DirectionalDistortionDistortionScale("Directional Distortion: Distortion Scale", Vector) = (1,1,0,0)
		[Toggle]_DirectionalDistortionInvert("Directional Distortion: Invert", Float) = 0
		[Toggle(_ENABLEFULLDISTORTION_ON)] _EnableFullDistortion("Enable Full Distortion", Float) = 0
		_FullDistortionFade("Full Distortion: Fade", Range( 0 , 1)) = 1
		_FullDistortionDistortion("Full Distortion: Distortion", Vector) = (0.2,0.2,0,0)
		_FullDistortionNoiseScale("Full Distortion: Noise Scale", Vector) = (0.5,0.5,0,0)
		[Toggle(_ENABLEPIXELATE_ON)] _EnablePixelate("Enable Pixelate", Float) = 0
		_PixelateFade("Pixelate: Fade", Range( 0 , 1)) = 1
		_PixelatePixelsPerUnit("Pixelate: Pixels Per Unit", Float) = 100
		_PixelatePixelDensity("Pixelate: Pixel Density", Float) = 16
		[Toggle(_ENABLESQUEEZE_ON)] _EnableSqueeze("Enable Squeeze", Float) = 0
		_SqueezeFade("Squeeze: Fade", Range( 0 , 1)) = 1
		_SqueezeScale("Squeeze: Scale", Vector) = (2,0,0,0)
		_SqueezePower("Squeeze: Power", Float) = 1
		_SqueezeCenter("Squeeze: Center", Vector) = (0.5,0.5,0,0)
		[Toggle(_ENABLEUVDISTORT_ON)] _EnableUVDistort("Enable UV Distort", Float) = 0
		_UVDistortFade("UV Distort: Fade", Range( 0 , 1)) = 1
		_UVDistortFrom("UV Distort: From", Vector) = (-0.02,-0.02,0,0)
		_UVDistortTo("UV Distort: To", Vector) = (0.02,0.02,0,0)
		_UVDistortSpeed("UV Distort: Speed", Vector) = (2,2,0,0)
		_UVDistortNoiseScale("UV Distort: Noise Scale", Vector) = (0.1,0.1,0,0)
		[Toggle(_UVDISTORTMASKTOGGLE_ON)] _UVDistortMaskToggle("UV Distort: Mask Toggle", Float) = 0
		[NoScaleOffset]_UVDistortMask("UV Distort: Mask", 2D) = "white" {}
		[Toggle(_ENABLEUVSCROLL_ON)] _EnableUVScroll("Enable UV Scroll", Float) = 0
		_UVScrollSpeed("UV Scroll: Speed", Vector) = (0.2,0,0,0)
		[Toggle(_ENABLEUVROTATE_ON)] _EnableUVRotate("Enable UV Rotate", Float) = 0
		_UVRotateSpeed("UV Rotate: Speed", Float) = 1
		_UVRotatePivot("UV Rotate: Pivot", Vector) = (0.5,0.5,0,0)
		[Toggle(_ENABLESINEROTATE_ON)] _EnableSineRotate("Enable Sine Rotate", Float) = 0
		_SineRotateFade("Sine Rotate: Fade", Range( 0 , 1)) = 1
		_SineRotateAngle("Sine Rotate: Angle", Float) = 15
		_SineRotateFrequency("Sine Rotate: Frequency", Float) = 1
		_SineRotatePivot("Sine Rotate: Pivot", Vector) = (0.5,0.5,0,0)
		[Toggle(_ENABLEWIGGLE_ON)] _EnableWiggle("Enable Wiggle", Float) = 0
		_WiggleFade("Wiggle: Fade", Range( 0 , 1)) = 1
		_WiggleSpeed("Wiggle: Speed", Float) = 2
		_WiggleFrequency("Wiggle: Frequency", Float) = 2
		_WiggleOffset("Wiggle: Offset", Float) = 0.02
		[Toggle(_WIGGLEFIXEDGROUNDTOGGLE_ON)] _WiggleFixedGroundToggle("Wiggle: Fixed Ground Toggle", Float) = 0
		[Toggle(_ENABLEUVSCALE_ON)] _EnableUVScale("Enable UV Scale", Float) = 0
		_UVScaleScale("UV Scale: Scale", Vector) = (1,1,0,0)
		_UVScalePivot("UV Scale: Pivot", Vector) = (0.5,0.5,0,0)
		[Toggle(_ENABLESINEMOVE_ON)] _EnableSineMove("Enable Sine Move", Float) = 0
		_SineMoveFade("Sine Move: Fade", Range( 0 , 1)) = 1
		_SineMoveOffset("Sine Move: Offset", Vector) = (0,0.5,0,0)
		_SineMoveFrequency("Sine Move: Frequency", Vector) = (1,1,0,0)
		[Toggle(_ENABLESINESCALE_ON)] _EnableSineScale("Enable Sine Scale", Float) = 0
		_SineScaleFrequency("Sine Scale: Frequency", Float) = 2
		_SineScaleFactor("Sine Scale: Factor", Vector) = (0.2,0.2,0,0)
		[Toggle(_ENABLEVIBRATE_ON)] _EnableVibrate("Enable Vibrate", Float) = 0
		_VibrateFade("Vibrate: Fade", Range( 0 , 1)) = 1
		_VibrateOffset("Vibrate: Offset", Float) = 0.04
		_VibrateFrequency("Vibrate: Frequency", Float) = 100
		_VibrateRotation("Vibrate: Rotation", Float) = 4
		[Toggle(_ENABLEWIND_ON)] _EnableWind("Enable Wind", Float) = 0
		_WindRotation("Wind: Rotation", Float) = 0
		_WindMaxRotation("Wind: Max Rotation", Float) = 2
		_WindRotationWindFactor("Wind: Rotation Wind Factor", Float) = 1
		_WindSquishFactor("Wind: Squish Factor", Float) = 0.3
		_WindSquishWindFactor("Wind: Squish Wind Factor", Range( 0 , 1)) = 0
		[Toggle(_WINDLOCALWIND_ON)] _WindLocalWind("Wind: Local Wind", Float) = 0
		_WindNoiseScale("Wind: Noise Scale", Float) = 0.1
		_WindNoiseSpeed("Wind: Noise Speed", Float) = 1
		_WindMinIntensity("Wind: Min Intensity", Float) = -0.4
		_WindMaxIntensity("Wind: Max Intensity", Float) = 0.4
		[Toggle(_WINDHIGHQUALITYNOISE_ON)] _WindHighQualityNoise("Wind: High Quality Noise", Float) = 0
		[Toggle(_WINDISPARALLAX_ON)] _WindIsParallax("Wind: Is Parallax", Float) = 0
		_WindXPosition("Wind: X Position", Float) = 0
		_WindFlip("Wind: Flip", Float) = 0
		[Toggle(_ENABLESQUISH_ON)] _EnableSquish("Enable Squish", Float) = 0
		_SquishFade("Squish: Fade", Range( 0 , 1)) = 1
		_SquishStretch("Squish: Stretch", Float) = 0.1
		_SquishSquish("Squish: Squish", Float) = 0.1
		_SquishFlip("Squish: Flip", Range( -1 , 0)) = 0
		[Toggle(_ENABLECHECKERBOARD_ON)] _EnableCheckerboard("Enable Checkerboard", Float) = 0
		_CheckerboardDarken("Checkerboard: Darken", Range( 0 , 1)) = 0.5
		_CheckerboardTiling("Checkerboard: Tiling", Float) = 1
		[Toggle(_ENABLEFLAME_ON)] _EnableFlame("Enable Flame", Float) = 0
		_FlameBrightness("Flame: Brightness", Float) = 10
		_FlameSmooth("Flame: Smooth", Float) = 2
		_FlameRadius("Flame: Radius", Float) = 0.2
		_FlameSpeed("Flame: Speed", Vector) = (0,-0.5,0,0)
		_FlameNoiseFactor("Flame: Noise Factor", Float) = 2.5
		_FlameNoiseHeightFactor("Flame: Noise Height Factor", Float) = 1.5
		_FlameNoiseScale("Flame: Noise Scale", Vector) = (1.2,0.8,0,0)
		[Toggle(_ENABLEGAUSSIANBLUR_ON)] _EnableGaussianBlur("Enable Gaussian Blur", Float) = 0
		_GaussianBlurFade("Gaussian Blur: Fade", Range( 0 , 1)) = 1
		_GaussianBlurOffset("Gaussian Blur: Offset", Float) = 0.5
		[Toggle(_ENABLESHARPEN_ON)] _EnableSharpen("Enable Sharpen", Float) = 0
		_SharpenFade("Sharpen: Fade", Range( 0 , 1)) = 1
		_SharpenFactor("Sharpen: Factor", Float) = 4
		_SharpenOffset("Sharpen: Offset", Float) = 2
		[Toggle(_ENABLESMOOTHPIXELART_ON)] _EnableSmoothPixelArt("Enable Smooth Pixel Art", Float) = 0
		[Toggle(_ENABLESMOKE_ON)] _EnableSmoke("Enable Smoke", Float) = 0
		_SmokeAlpha("Smoke: Alpha", Range( 0 , 1)) = 1
		_SmokeSmoothness("Smoke: Smoothness", Float) = 1
		_SmokeNoiseScale("Smoke: Noise Scale", Float) = 0.5
		_SmokeNoiseFactor("Smoke: Noise Factor", Range( 0 , 1)) = 0.4
		_SmokeDarkEdge("Smoke: Dark Edge", Range( 0 , 1.5)) = 1
		[Toggle]_SmokeVertexSeed("Smoke: Vertex Seed", Float) = 0
		[Toggle(_ENABLECUSTOMFADE_ON)] _EnableCustomFade("Enable Custom Fade", Float) = 0
		_CustomFadeFadeMask("Custom Fade: Fade Mask", 2D) = "white" {}
		_CustomFadeSmoothness("Custom Fade: Smoothness", Float) = 2
		_CustomFadeNoiseScale("Custom Fade: Noise Scale", Vector) = (1,1,0,0)
		_CustomFadeNoiseFactor("Custom Fade: Noise Factor", Range( 0 , 0.5)) = 0
		_CustomFadeAlpha("Custom Fade: Alpha", Range( 0 , 1)) = 1
		[Toggle(_ENABLEWORLDTILING_ON)] _EnableWorldTiling("Enable World Tiling", Float) = 0
		_WorldTilingScale("World Tiling: Scale", Vector) = (1,1,0,0)
		_WorldTilingOffset("World Tiling: Offset", Vector) = (0,0,0,0)
		_WorldTilingPixelsPerUnit("World Tiling: Pixels Per Unit", Float) = 100
		[Toggle(_ENABLESCREENTILING_ON)] _EnableScreenTiling("Enable Screen Tiling", Float) = 0
		_ScreenTilingScale("Screen Tiling: Scale", Vector) = (1,1,0,0)
		_ScreenTilingOffset("Screen Tiling: Offset", Vector) = (0,0,0,0)
		_ScreenTilingPixelsPerUnit("Screen Tiling: Pixels Per Unit", Float) = 100
		[HideInInspector] _texcoord( "", 2D ) = "white" {}

	}

	SubShader
	{
		LOD 0

		Tags { "Queue"="Transparent" "IgnoreProjector"="True" "RenderType"="Transparent" "PreviewType"="Plane" "CanUseSpriteAtlas"="True" }

		Cull Off
		Lighting Off
		ZWrite Off
		Blend DstColor Zero, One OneMinusSrcAlpha

		
		Pass
		{
		CGPROGRAM
			#define ASE_VERSION 19801

			#ifndef UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX
			#define UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(input)
			#endif
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.5
			#pragma multi_compile _ PIXELSNAP_ON
			#pragma multi_compile _ ETC1_EXTERNAL_ALPHA
			#include "UnityCG.cginc"
			#include "UnityShaderVariables.cginc"
			#define ASE_NEEDS_VERT_POSITION
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_COLOR
			#pragma shader_feature_local _SHADERFADING_NONE _SHADERFADING_FULL _SHADERFADING_MASK _SHADERFADING_DISSOLVE _SHADERFADING_SPREAD
			#pragma shader_feature_local _ENABLESINESCALE_ON
			#pragma shader_feature _ENABLEVIBRATE_ON
			#pragma shader_feature _ENABLESINEMOVE_ON
			#pragma shader_feature _ENABLESQUISH_ON
			#pragma shader_feature _SPRITESHEETFIX_ON
			#pragma shader_feature_local _PIXELPERFECTUV_ON
			#pragma shader_feature _ENABLEWORLDTILING_ON
			#pragma shader_feature _ENABLESCREENTILING_ON
			#pragma shader_feature _TOGGLETIMEFREQUENCY_ON
			#pragma shader_feature _TOGGLETIMEFPS_ON
			#pragma shader_feature _TOGGLETIMESPEED_ON
			#pragma shader_feature _TOGGLEUNSCALEDTIME_ON
			#pragma shader_feature _TOGGLECUSTOMTIME_ON
			#pragma shader_feature _SHADERSPACE_UV _SHADERSPACE_UV_RAW _SHADERSPACE_OBJECT _SHADERSPACE_OBJECT_SCALED _SHADERSPACE_WORLD _SHADERSPACE_UI_GRAPHIC _SHADERSPACE_SCREEN
			#pragma shader_feature _PIXELPERFECTSPACE_ON
			#pragma shader_feature _BAKEDMATERIAL_ON
			#pragma shader_feature _VERTEXTINTFIRST_ON
			#pragma shader_feature _ENABLESHADOW_ON
			#pragma shader_feature _ENABLESTRONGTINT_ON
			#pragma shader_feature _ENABLEALPHATINT_ON
			#pragma shader_feature_local _ENABLEADDCOLOR_ON
			#pragma shader_feature_local _ENABLEHALFTONE_ON
			#pragma shader_feature_local _ENABLEDIRECTIONALGLOWFADE_ON
			#pragma shader_feature_local _ENABLEDIRECTIONALALPHAFADE_ON
			#pragma shader_feature_local _ENABLESOURCEGLOWDISSOLVE_ON
			#pragma shader_feature_local _ENABLESOURCEALPHADISSOLVE_ON
			#pragma shader_feature_local _ENABLEFULLGLOWDISSOLVE_ON
			#pragma shader_feature_local _ENABLEFULLALPHADISSOLVE_ON
			#pragma shader_feature_local _ENABLEDIRECTIONALDISTORTION_ON
			#pragma shader_feature_local _ENABLEFULLDISTORTION_ON
			#pragma shader_feature _ENABLETEXTURELAYER2_ON
			#pragma shader_feature _ENABLETEXTURELAYER1_ON
			#pragma shader_feature _ENABLESHIFTING_ON
			#pragma shader_feature _ENABLEENCHANTED_ON
			#pragma shader_feature_local _ENABLEPOISON_ON
			#pragma shader_feature_local _ENABLESHINE_ON
			#pragma shader_feature_local _ENABLERAINBOW_ON
			#pragma shader_feature_local _ENABLEBURN_ON
			#pragma shader_feature_local _ENABLEFROZEN_ON
			#pragma shader_feature_local _ENABLEMETAL_ON
			#pragma shader_feature_local _ENABLECAMOUFLAGE_ON
			#pragma shader_feature_local _ENABLEGLITCH_ON
			#pragma shader_feature_local _ENABLEHOLOGRAM_ON
			#pragma shader_feature _ENABLEPINGPONGGLOW_ON
			#pragma shader_feature_local _ENABLEPIXELOUTLINE_ON
			#pragma shader_feature_local _ENABLEOUTEROUTLINE_ON
			#pragma shader_feature_local _ENABLEINNEROUTLINE_ON
			#pragma shader_feature_local _ENABLESATURATION_ON
			#pragma shader_feature_local _ENABLESINEGLOW_ON
			#pragma shader_feature_local _ENABLEADDHUE_ON
			#pragma shader_feature_local _ENABLESHIFTHUE_ON
			#pragma shader_feature_local _ENABLEINKSPREAD_ON
			#pragma shader_feature_local _ENABLEBLACKTINT_ON
			#pragma shader_feature_local _ENABLESPLITTONING_ON
			#pragma shader_feature_local _ENABLEHUE_ON
			#pragma shader_feature_local _ENABLEBRIGHTNESS_ON
			#pragma shader_feature_local _ENABLECONTRAST_ON
			#pragma shader_feature _ENABLENEGATIVE_ON
			#pragma shader_feature_local _ENABLECOLORREPLACE_ON
			#pragma shader_feature_local _ENABLERECOLORRGBYCP_ON
			#pragma shader_feature _ENABLERECOLORRGB_ON
			#pragma shader_feature_local _ENABLEFLAME_ON
			#pragma shader_feature_local _ENABLECHECKERBOARD_ON
			#pragma shader_feature_local _ENABLECUSTOMFADE_ON
			#pragma shader_feature_local _ENABLESMOKE_ON
			#pragma shader_feature _ENABLESHARPEN_ON
			#pragma shader_feature _ENABLEGAUSSIANBLUR_ON
			#pragma shader_feature _ENABLESMOOTHPIXELART_ON
			#pragma shader_feature_local _TILINGFIX_ON
			#pragma shader_feature _ENABLEWIGGLE_ON
			#pragma shader_feature_local _ENABLEUVSCALE_ON
			#pragma shader_feature_local _ENABLEPIXELATE_ON
			#pragma shader_feature_local _ENABLEUVSCROLL_ON
			#pragma shader_feature_local _ENABLEUVROTATE_ON
			#pragma shader_feature_local _ENABLESINEROTATE_ON
			#pragma shader_feature_local _ENABLESQUEEZE_ON
			#pragma shader_feature_local _ENABLEUVDISTORT_ON
			#pragma shader_feature_local _ENABLEWIND_ON
			#pragma shader_feature_local _WINDLOCALWIND_ON
			#pragma shader_feature_local _WINDHIGHQUALITYNOISE_ON
			#pragma shader_feature_local _WINDISPARALLAX_ON
			#pragma shader_feature _UVDISTORTMASKTOGGLE_ON
			#pragma shader_feature _WIGGLEFIXEDGROUNDTOGGLE_ON
			#pragma shader_feature _RECOLORRGBTEXTURETOGGLE_ON
			#pragma shader_feature _RECOLORRGBYCPTEXTURETOGGLE_ON
			#pragma shader_feature_local _ADDHUEMASKTOGGLE_ON
			#pragma shader_feature_local _SINEGLOWMASKTOGGLE_ON
			#pragma shader_feature _INNEROUTLINETEXTURETOGGLE_ON
			#pragma shader_feature_local _INNEROUTLINEDISTORTIONTOGGLE_ON
			#pragma shader_feature _INNEROUTLINEOUTLINEONLYTOGGLE_ON
			#pragma shader_feature _OUTEROUTLINETEXTURETOGGLE_ON
			#pragma shader_feature _OUTEROUTLINEOUTLINEONLYTOGGLE_ON
			#pragma shader_feature_local _OUTEROUTLINEDISTORTIONTOGGLE_ON
			#pragma shader_feature _PIXELOUTLINETEXTURETOGGLE_ON
			#pragma shader_feature _PIXELOUTLINEOUTLINEONLYTOGGLE_ON
			#pragma shader_feature _CAMOUFLAGEANIMATIONTOGGLE_ON
			#pragma shader_feature _METALMASKTOGGLE_ON
			#pragma shader_feature _SHINEMASKTOGGLE_ON
			#pragma shader_feature _ENCHANTEDLERPTOGGLE_ON
			#pragma shader_feature _ENCHANTEDRAINBOWTOGGLE_ON
			#pragma shader_feature _SHIFTINGRAINBOWTOGGLE_ON
			#pragma shader_feature _TEXTURELAYER1CONTRASTTOGGLE_ON
			#pragma shader_feature _TEXTURELAYER1SHEETTOGGLE_ON
			#pragma shader_feature _TEXTURELAYER1SCROLLTOGGLE_ON
			#pragma shader_feature _TEXTURELAYER2CONTRASTTOGGLE_ON
			#pragma shader_feature _TEXTURELAYER2SHEETTOGGLE_ON
			#pragma shader_feature _TEXTURELAYER2SCROLLTOGGLE_ON
			#pragma shader_feature _ADDCOLORCONTRASTTOGGLE_ON
			#pragma shader_feature _ADDCOLORMASKTOGGLE_ON
			#pragma shader_feature _STRONGTINTCONTRASTTOGGLE_ON
			#pragma shader_feature _STRONGTINTMASKTOGGLE_ON


			struct appdata_t
			{
				float4 vertex   : POSITION;
				float4 color    : COLOR;
				float2 texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				
			};

			struct v2f
			{
				float4 vertex   : SV_POSITION;
				fixed4 color    : COLOR;
				float2 texcoord  : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
				float4 ase_texcoord1 : TEXCOORD1;
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
			};

			uniform fixed4 _Color;
			uniform float _EnableExternalAlpha;
			uniform sampler2D _MainTex;
			uniform sampler2D _AlphaTex;
			#ifdef _ENABLESQUISH_ON
			uniform float _SquishStretch;
			#endif
			#ifdef _ENABLESCREENTILING_ON
			uniform float2 _ScreenTilingScale;
			uniform float2 _ScreenTilingOffset;
			uniform float _ScreenTilingPixelsPerUnit;
			#endif
			float4 _MainTex_TexelSize;
			#ifdef _ENABLEWORLDTILING_ON
			uniform float2 _WorldTilingScale;
			uniform float2 _WorldTilingOffset;
			uniform float _WorldTilingPixelsPerUnit;
			#endif
			#ifdef _SPRITESHEETFIX_ON
			uniform float4 _SpriteSheetRect;
			#endif
			#ifdef _ENABLESQUISH_ON
			uniform float _SquishFade;
			uniform float _SquishFlip;
			uniform float _SquishSquish;
			#endif
			#ifdef _TOGGLECUSTOMTIME_ON
			uniform float _TimeValue;
			#endif
			#ifdef _TOGGLEUNSCALEDTIME_ON
			uniform float UnscaledTime;
			#endif
			#ifdef _TOGGLETIMESPEED_ON
			uniform float _TimeSpeed;
			#endif
			#ifdef _TOGGLETIMEFPS_ON
			uniform float _TimeFPS;
			#endif
			#ifdef _TOGGLETIMEFREQUENCY_ON
			uniform float _TimeFrequency;
			uniform float _TimeRange;
			#endif
			#ifdef _ENABLESINEMOVE_ON
			uniform float2 _SineMoveFrequency;
			uniform float2 _SineMoveOffset;
			uniform float _SineMoveFade;
			#endif
			#ifdef _ENABLEVIBRATE_ON
			uniform float _VibrateFrequency;
			uniform float _VibrateOffset;
			uniform float _VibrateFade;
			uniform float _VibrateRotation;
			#endif
			#ifdef _ENABLESINESCALE_ON
			uniform float _SineScaleFrequency;
			uniform float2 _SineScaleFactor;
			#endif
			uniform float _FadingFade;
			#ifdef _SHADERFADING_MASK
			uniform sampler2D _FadingMask;
			uniform float4 _FadingMask_ST;
			#endif
			uniform float _FadingWidth;
			uniform sampler2D _UberNoiseTexture;
			uniform float _PixelsPerUnit;
			#ifdef _SHADERSPACE_UI_GRAPHIC
			uniform float _RectWidth;
			uniform float _RectHeight;
			#endif
			uniform float _ScreenWidthUnits;
			uniform float2 _FadingNoiseScale;
			#ifdef _SHADERFADING_SPREAD
			uniform float2 _FadingPosition;
			uniform float _FadingNoiseFactor;
			#endif
			#ifdef _ENABLEWIND_ON
			uniform float _WindRotationWindFactor;
			uniform float WindMinIntensity;
			uniform float _WindMinIntensity;
			uniform float WindMaxIntensity;
			uniform float _WindMaxIntensity;
			uniform float _WindXPosition;
			uniform float WindNoiseScale;
			uniform float _WindNoiseScale;
			uniform float WindTime;
			uniform float _WindNoiseSpeed;
			uniform float _WindRotation;
			uniform float _WindMaxRotation;
			uniform float _WindFlip;
			uniform float _WindSquishFactor;
			uniform float _WindSquishWindFactor;
			#endif
			#ifdef _ENABLEFULLDISTORTION_ON
			uniform float _FullDistortionFade;
			uniform float2 _FullDistortionNoiseScale;
			uniform float2 _FullDistortionDistortion;
			#endif
			#ifdef _ENABLEDIRECTIONALDISTORTION_ON
			uniform float2 _DirectionalDistortionDistortionScale;
			uniform float _DirectionalDistortionRandomDirection;
			uniform float2 _DirectionalDistortionDistortion;
			uniform float _DirectionalDistortionInvert;
			uniform float _DirectionalDistortionRotation;
			uniform float _DirectionalDistortionFade;
			uniform float2 _DirectionalDistortionNoiseScale;
			uniform float _DirectionalDistortionNoiseFactor;
			uniform float _DirectionalDistortionWidth;
			#endif
			#ifdef _ENABLEHOLOGRAM_ON
			uniform float _HologramDistortionSpeed;
			uniform float _HologramDistortionDensity;
			uniform float _HologramDistortionScale;
			uniform float _HologramDistortionOffset;
			uniform float _HologramFade;
			#endif
			#ifdef _ENABLEGLITCH_ON
			uniform float2 _GlitchDistortionSpeed;
			uniform float2 _GlitchDistortionScale;
			uniform float2 _GlitchDistortion;
			uniform float2 _GlitchMaskSpeed;
			uniform float2 _GlitchMaskScale;
			uniform float _GlitchMaskMin;
			uniform float _GlitchFade;
			#endif
			#ifdef _ENABLEUVDISTORT_ON
			uniform float2 _UVDistortFrom;
			uniform float2 _UVDistortTo;
			uniform float2 _UVDistortSpeed;
			uniform float2 _UVDistortNoiseScale;
			uniform float _UVDistortFade;
			uniform sampler2D _UVDistortMask;
			uniform float4 _UVDistortMask_ST;
			#endif
			#ifdef _ENABLESQUEEZE_ON
			uniform float2 _SqueezeCenter;
			uniform float _SqueezePower;
			uniform float2 _SqueezeScale;
			uniform float _SqueezeFade;
			#endif
			#ifdef _ENABLESINEROTATE_ON
			uniform float _SineRotateFrequency;
			uniform float _SineRotateAngle;
			uniform float _SineRotateFade;
			uniform float2 _SineRotatePivot;
			#endif
			#ifdef _ENABLEUVROTATE_ON
			uniform float _UVRotateSpeed;
			uniform float2 _UVRotatePivot;
			#endif
			#ifdef _ENABLEUVSCROLL_ON
			uniform float2 _UVScrollSpeed;
			#endif
			#ifdef _ENABLEPIXELATE_ON
			uniform float _PixelatePixelDensity;
			uniform float _PixelatePixelsPerUnit;
			uniform float _PixelateFade;
			#endif
			#ifdef _ENABLEUVSCALE_ON
			uniform float2 _UVScalePivot;
			uniform float2 _UVScaleScale;
			#endif
			#ifdef _ENABLEWIGGLE_ON
			uniform float _WiggleFrequency;
			uniform float _WiggleSpeed;
			uniform float _WiggleOffset;
			uniform float _WiggleFade;
			#endif
			#ifdef _ENABLEGAUSSIANBLUR_ON
			uniform float _GaussianBlurOffset;
			uniform float _GaussianBlurFade;
			#endif
			#ifdef _ENABLESHARPEN_ON
			uniform float _SharpenOffset;
			uniform float _SharpenFactor;
			uniform float _SharpenFade;
			#endif
			#ifdef _ENABLESMOKE_ON
			uniform float _SmokeVertexSeed;
			uniform float _SmokeNoiseScale;
			uniform float _SmokeNoiseFactor;
			uniform float _SmokeSmoothness;
			uniform float _SmokeDarkEdge;
			uniform float _SmokeAlpha;
			#endif
			#ifdef _ENABLECUSTOMFADE_ON
			uniform sampler2D _CustomFadeFadeMask;
			uniform float2 _CustomFadeNoiseScale;
			uniform float _CustomFadeNoiseFactor;
			uniform float _CustomFadeSmoothness;
			uniform float _CustomFadeAlpha;
			#endif
			#ifdef _ENABLECHECKERBOARD_ON
			uniform float _CheckerboardDarken;
			uniform float _CheckerboardTiling;
			#endif
			#ifdef _ENABLEFLAME_ON
			uniform float2 _FlameSpeed;
			uniform float2 _FlameNoiseScale;
			uniform float _FlameNoiseHeightFactor;
			uniform float _FlameNoiseFactor;
			uniform float _FlameRadius;
			uniform float _FlameSmooth;
			uniform float _FlameBrightness;
			#endif
			#ifdef _ENABLERECOLORRGB_ON
			uniform float4 _RecolorRGBRedTint;
			uniform sampler2D _RecolorRGBTexture;
			uniform float4 _RecolorRGBGreenTint;
			uniform float4 _RecolorRGBBlueTint;
			uniform float _RecolorRGBFade;
			#endif
			#ifdef _ENABLERECOLORRGBYCP_ON
			uniform sampler2D _RecolorRGBYCPTexture;
			uniform float4 _RecolorRGBYCPPurpleTint;
			uniform float4 _RecolorRGBYCPBlueTint;
			uniform float4 _RecolorRGBYCPCyanTint;
			uniform float4 _RecolorRGBYCPGreenTint;
			uniform float4 _RecolorRGBYCPYellowTint;
			uniform float4 _RecolorRGBYCPRedTint;
			uniform float _RecolorRGBYCPFade;
			#endif
			#ifdef _ENABLECOLORREPLACE_ON
			uniform float4 _ColorReplaceFromColor;
			uniform float _ColorReplaceContrast;
			uniform float4 _ColorReplaceToColor;
			uniform float _ColorReplaceSmoothness;
			uniform float _ColorReplaceRange;
			uniform float _ColorReplaceFade;
			#endif
			#ifdef _ENABLENEGATIVE_ON
			uniform float _NegativeFade;
			#endif
			#ifdef _ENABLECONTRAST_ON
			uniform float _Contrast;
			#endif
			#ifdef _ENABLEBRIGHTNESS_ON
			uniform float _Brightness;
			#endif
			#ifdef _ENABLEHUE_ON
			uniform float _Hue;
			#endif
			#ifdef _ENABLESPLITTONING_ON
			uniform float4 _SplitToningShadowsColor;
			uniform float4 _SplitToningHighlightsColor;
			uniform float _SplitToningShift;
			uniform float _SplitToningBalance;
			uniform float _SplitToningContrast;
			uniform float _SplitToningFade;
			#endif
			#ifdef _ENABLEBLACKTINT_ON
			uniform float4 _BlackTintColor;
			uniform float _BlackTintPower;
			uniform float _BlackTintFade;
			#endif
			#ifdef _ENABLEINKSPREAD_ON
			uniform float4 _InkSpreadColor;
			uniform float _InkSpreadContrast;
			uniform float _InkSpreadFade;
			uniform float _InkSpreadDistance;
			uniform float2 _InkSpreadPosition;
			uniform float2 _InkSpreadNoiseScale;
			uniform float _InkSpreadNoiseFactor;
			uniform float _InkSpreadWidth;
			#endif
			#ifdef _ENABLESHIFTHUE_ON
			uniform float _ShiftHueSpeed;
			#endif
			#ifdef _ENABLEADDHUE_ON
			uniform float _AddHueSpeed;
			uniform float _AddHueSaturation;
			uniform float _AddHueBrightness;
			uniform float _AddHueContrast;
			uniform float _AddHueFade;
			uniform sampler2D _AddHueMask;
			uniform float4 _AddHueMask_ST;
			#endif
			#ifdef _ENABLESINEGLOW_ON
			uniform float _SineGlowContrast;
			uniform float4 _SineGlowColor;
			uniform sampler2D _SineGlowMask;
			uniform float4 _SineGlowMask_ST;
			uniform float _SineGlowFade;
			uniform float _SineGlowFrequency;
			uniform float _SineGlowMax;
			uniform float _SineGlowMin;
			#endif
			#ifdef _ENABLESATURATION_ON
			uniform float _Saturation;
			#endif
			#ifdef _ENABLEINNEROUTLINE_ON
			uniform float4 _InnerOutlineColor;
			uniform sampler2D _InnerOutlineTintTexture;
			uniform float2 _InnerOutlineTextureSpeed;
			uniform float _InnerOutlineFade;
			uniform float2 _InnerOutlineNoiseSpeed;
			uniform float2 _InnerOutlineNoiseScale;
			uniform float2 _InnerOutlineDistortionIntensity;
			uniform float _InnerOutlineWidth;
			#endif
			#ifdef _ENABLEOUTEROUTLINE_ON
			uniform float4 _OuterOutlineColor;
			uniform sampler2D _OuterOutlineTintTexture;
			uniform float2 _OuterOutlineTextureSpeed;
			uniform float _OuterOutlineFade;
			uniform float2 _OuterOutlineNoiseSpeed;
			uniform float2 _OuterOutlineNoiseScale;
			uniform float2 _OuterOutlineDistortionIntensity;
			uniform float _OuterOutlineWidth;
			#endif
			#ifdef _ENABLEPIXELOUTLINE_ON
			uniform float4 _PixelOutlineColor;
			uniform sampler2D _PixelOutlineTintTexture;
			uniform float2 _PixelOutlineTextureSpeed;
			uniform float _PixelOutlineFade;
			uniform float _PixelOutlineAlphaLimit;
			uniform float _PixelOutlineWidth;
			#endif
			#ifdef _ENABLEPINGPONGGLOW_ON
			uniform float4 _PingPongGlowFrom;
			uniform float4 _PingPongGlowTo;
			uniform float _PingPongGlowFrequency;
			uniform float _PingPongGlowFade;
			uniform float _PingPongGlowContrast;
			#endif
			#ifdef _ENABLEHOLOGRAM_ON
			uniform float4 _HologramTint;
			uniform float _HologramContrast;
			uniform float _HologramLineSpeed;
			uniform float _HologramLineFrequency;
			uniform float _HologramLineGap;
			uniform float _HologramMinAlpha;
			#endif
			#ifdef _ENABLEGLITCH_ON
			uniform float _GlitchBrightness;
			uniform float2 _GlitchNoiseSpeed;
			uniform float2 _GlitchNoiseScale;
			uniform float _GlitchHueSpeed;
			#endif
			#ifdef _ENABLECAMOUFLAGE_ON
			uniform float4 _CamouflageBaseColor;
			uniform float4 _CamouflageColorA;
			uniform float _CamouflageDensityA;
			uniform float2 _CamouflageDistortionSpeed;
			uniform float2 _CamouflageDistortionScale;
			uniform float2 _CamouflageDistortionIntensity;
			uniform float2 _CamouflageNoiseScaleA;
			uniform float _CamouflageSmoothnessA;
			uniform float4 _CamouflageColorB;
			uniform float _CamouflageDensityB;
			uniform float2 _CamouflageNoiseScaleB;
			uniform float _CamouflageSmoothnessB;
			uniform float _CamouflageContrast;
			uniform float _CamouflageFade;
			#endif
			#ifdef _ENABLEMETAL_ON
			uniform float _MetalHighlightDensity;
			uniform float2 _MetalNoiseDistortionSpeed;
			uniform float2 _MetalNoiseDistortionScale;
			uniform float2 _MetalNoiseDistortion;
			uniform float2 _MetalNoiseSpeed;
			uniform float2 _MetalNoiseScale;
			uniform float4 _MetalHighlightColor;
			uniform float _MetalHighlightContrast;
			uniform float _MetalContrast;
			uniform float4 _MetalColor;
			uniform float _MetalFade;
			uniform sampler2D _MetalMask;
			uniform float4 _MetalMask_ST;
			#endif
			#ifdef _ENABLEFROZEN_ON
			uniform float _FrozenContrast;
			uniform float4 _FrozenTint;
			uniform float _FrozenSnowContrast;
			uniform float4 _FrozenSnowColor;
			uniform float _FrozenSnowDensity;
			uniform float2 _FrozenSnowScale;
			uniform float _FrozenHighlightDensity;
			uniform float2 _FrozenHighlightDistortionSpeed;
			uniform float2 _FrozenHighlightDistortionScale;
			uniform float2 _FrozenHighlightDistortion;
			uniform float2 _FrozenHighlightSpeed;
			uniform float2 _FrozenHighlightScale;
			uniform float4 _FrozenHighlightColor;
			uniform float _FrozenHighlightContrast;
			uniform float _FrozenFade;
			#endif
			#ifdef _ENABLEBURN_ON
			uniform float _BurnInsideContrast;
			uniform float4 _BurnInsideNoiseColor;
			uniform float _BurnInsideNoiseFactor;
			uniform float2 _BurnSwirlNoiseScale;
			uniform float _BurnSwirlFactor;
			uniform float2 _BurnInsideNoiseScale;
			uniform float4 _BurnInsideColor;
			uniform float _BurnRadius;
			uniform float2 _BurnPosition;
			uniform float2 _BurnEdgeNoiseScale;
			uniform float _BurnEdgeNoiseFactor;
			uniform float _BurnWidth;
			uniform float4 _BurnEdgeColor;
			uniform float _BurnFade;
			#endif
			#ifdef _ENABLERAINBOW_ON
			uniform float2 _RainbowCenter;
			uniform float2 _RainbowNoiseScale;
			uniform float _RainbowNoiseFactor;
			uniform float _RainbowDensity;
			uniform float _RainbowSpeed;
			uniform float _RainbowSaturation;
			uniform float _RainbowBrightness;
			uniform float _RainbowContrast;
			uniform float _RainbowFade;
			#endif
			#ifdef _ENABLESHINE_ON
			uniform float _ShineSaturation;
			uniform float _ShineContrast;
			uniform float4 _ShineColor;
			uniform float _ShineRotation;
			uniform float _ShineFrequency;
			uniform float _ShineSpeed;
			uniform float _ShineWidth;
			uniform float _ShineSmooth;
			uniform float _ShineFade;
			uniform sampler2D _ShineMask;
			uniform float4 _ShineMask_ST;
			#endif
			#ifdef _ENABLEPOISON_ON
			uniform float2 _PoisonNoiseSpeed;
			uniform float2 _PoisonNoiseScale;
			uniform float _PoisonShiftSpeed;
			uniform float _PoisonDensity;
			uniform float4 _PoisonColor;
			uniform float _PoisonFade;
			uniform float _PoisonNoiseBrightness;
			uniform float _PoisonRecolorFactor;
			#endif
			#ifdef _ENABLEENCHANTED_ON
			uniform float4 _EnchantedLowColor;
			uniform float4 _EnchantedHighColor;
			uniform float2 _EnchantedSpeed;
			uniform float2 _EnchantedScale;
			uniform float _EnchantedRainbowDensity;
			uniform float _EnchantedRainbowSpeed;
			uniform float _EnchantedRainbowSaturation;
			uniform float _EnchantedContrast;
			uniform float _EnchantedBrightness;
			uniform float _EnchantedReduce;
			uniform float _EnchantedFade;
			#endif
			#ifdef _ENABLESHIFTING_ON
			uniform float4 _ShiftingColorA;
			uniform float4 _ShiftingColorB;
			uniform float _ShiftingSpeed;
			uniform float _ShiftingDensity;
			uniform float _ShiftingBrightness;
			uniform float _ShiftingSaturation;
			uniform float _ShiftingContrast;
			uniform float _ShiftingFade;
			#endif
			#ifdef _ENABLETEXTURELAYER1_ON
			uniform sampler2D _TextureLayer1Texture;
			uniform float2 _TextureLayer1Scale;
			uniform float2 _TextureLayer1Offset;
			uniform float2 _TextureLayer1ScrollSpeed;
			uniform float _TextureLayer1EdgeClip;
			#endif
			uniform int _TextureLayer1Columns;
			uniform int _TextureLayer1Rows;
			#ifdef _ENABLETEXTURELAYER1_ON
			uniform float _TextureLayer1Speed;
			#endif
			uniform int _TextureLayer1StartFrame;
			#ifdef _ENABLETEXTURELAYER1_ON
			uniform float4 _TextureLayer1Color;
			uniform float _TextureLayer1Contrast;
			uniform float _TextureLayer1Fade;
			#endif
			#ifdef _ENABLETEXTURELAYER2_ON
			uniform sampler2D _TextureLayer2Texture;
			uniform float2 _TextureLayer2Scale;
			uniform float2 _TextureLayer2Offset;
			uniform float2 _TextureLayer2ScrollSpeed;
			uniform float _TextureLayer2EdgeClip;
			#endif
			uniform int _TextureLayer2Columns;
			uniform int _TextureLayer2Rows;
			#ifdef _ENABLETEXTURELAYER2_ON
			uniform float _TextureLayer2Speed;
			#endif
			uniform int _TextureLayer2StartFrame;
			#ifdef _ENABLETEXTURELAYER2_ON
			uniform float4 _TextureLayer2Color;
			uniform float _TextureLayer2Contrast;
			uniform float _TextureLayer2Fade;
			#endif
			#ifdef _ENABLEFULLALPHADISSOLVE_ON
			uniform float _FullAlphaDissolveFade;
			uniform float _FullAlphaDissolveWidth;
			uniform float2 _FullAlphaDissolveNoiseScale;
			#endif
			#ifdef _ENABLEFULLGLOWDISSOLVE_ON
			uniform float4 _FullGlowDissolveEdgeColor;
			uniform float2 _FullGlowDissolveNoiseScale;
			uniform float _FullGlowDissolveFade;
			uniform float _FullGlowDissolveWidth;
			#endif
			#ifdef _ENABLESOURCEALPHADISSOLVE_ON
			uniform float _SourceAlphaDissolveInvert;
			uniform float _SourceAlphaDissolveFade;
			uniform float2 _SourceAlphaDissolvePosition;
			uniform float2 _SourceAlphaDissolveNoiseScale;
			uniform float _SourceAlphaDissolveNoiseFactor;
			uniform float _SourceAlphaDissolveWidth;
			#endif
			#ifdef _ENABLESOURCEGLOWDISSOLVE_ON
			uniform float2 _SourceGlowDissolvePosition;
			uniform float2 _SourceGlowDissolveNoiseScale;
			uniform float _SourceGlowDissolveNoiseFactor;
			uniform float _SourceGlowDissolveFade;
			uniform float _SourceGlowDissolveWidth;
			uniform float4 _SourceGlowDissolveEdgeColor;
			uniform float _SourceGlowDissolveInvert;
			#endif
			#ifdef _ENABLEDIRECTIONALALPHAFADE_ON
			uniform float _DirectionalAlphaFadeInvert;
			uniform float _DirectionalAlphaFadeRotation;
			uniform float _DirectionalAlphaFadeFade;
			uniform float2 _DirectionalAlphaFadeNoiseScale;
			uniform float _DirectionalAlphaFadeNoiseFactor;
			uniform float _DirectionalAlphaFadeWidth;
			#endif
			#ifdef _ENABLEDIRECTIONALGLOWFADE_ON
			uniform float4 _DirectionalGlowFadeEdgeColor;
			uniform float _DirectionalGlowFadeInvert;
			uniform float _DirectionalGlowFadeRotation;
			uniform float _DirectionalGlowFadeFade;
			uniform float2 _DirectionalGlowFadeNoiseScale;
			uniform float _DirectionalGlowFadeNoiseFactor;
			uniform float _DirectionalGlowFadeWidth;
			#endif
			#ifdef _ENABLEHALFTONE_ON
			uniform float _HalftoneInvert;
			uniform float _HalftoneTiling;
			uniform float _HalftoneFade;
			uniform float2 _HalftonePosition;
			uniform float _HalftoneFadeWidth;
			#endif
			#ifdef _ENABLEADDCOLOR_ON
			uniform float4 _AddColorColor;
			uniform sampler2D _AddColorMask;
			uniform float4 _AddColorMask_ST;
			uniform float _AddColorContrast;
			uniform float _AddColorFade;
			#endif
			#ifdef _ENABLEALPHATINT_ON
			uniform float4 _AlphaTintColor;
			uniform float _AlphaTintMinAlpha;
			uniform float _AlphaTintFade;
			#endif
			#ifdef _ENABLESTRONGTINT_ON
			uniform float4 _StrongTintTint;
			uniform sampler2D _StrongTintMask;
			uniform float4 _StrongTintMask_ST;
			uniform float _StrongTintContrast;
			uniform float _StrongTintFade;
			#endif
			#ifdef _ENABLESHADOW_ON
			uniform float4 _ShadowColor;
			uniform float _ShadowFade;
			uniform float2 _ShadowOffset;
			#endif
			float3 RotateAroundAxis( float3 center, float3 original, float3 u, float angle )
			{
				original -= center;
				float C = cos( angle );
				float S = sin( angle );
				float t = 1 - C;
				float m00 = t * u.x * u.x + C;
				float m01 = t * u.x * u.y - S * u.z;
				float m02 = t * u.x * u.z + S * u.y;
				float m10 = t * u.x * u.y + S * u.z;
				float m11 = t * u.y * u.y + C;
				float m12 = t * u.y * u.z - S * u.x;
				float m20 = t * u.x * u.z - S * u.y;
				float m21 = t * u.y * u.z + S * u.x;
				float m22 = t * u.z * u.z + C;
				float3x3 finalMatrix = float3x3( m00, m01, m02, m10, m11, m12, m20, m21, m22 );
				return mul( finalMatrix, original ) + center;
			}
			
			float MyCustomExpression16_g11717( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11715( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float FastNoise101_g11666( float x )
			{
				float i = floor(x);
				float f = frac(x);
				float s = sign(frac(x/2.0)-0.5);
				    
				float k = 0.5+0.5*sin(i);
				return s*f*(f-1.0)*((16.0*k-4.0)*f*(f-1.0)-1.0);
			}
			
			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			
			float MyCustomExpression16_g11668( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11669( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11672( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11671( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11677( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11678( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11720( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11674( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11731( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float4 texturePointSmooth( sampler2D tex, float4 textureTexelSize, float2 uvs )
			{
				float2 size;
				size.x = textureTexelSize.z;
				size.y = textureTexelSize.w;
				float2 pixel = float2(1.0,1.0) / size;
				uvs -= pixel * float2(0.5,0.5);
				float2 uv_pixels = uvs * size;
				float2 delta_pixel = frac(uv_pixels) - float2(0.5,0.5);
				float2 ddxy = fwidth(uv_pixels);
				float2 mip = log2(ddxy) - 0.5;
				float2 clampedUV = uvs + (clamp(delta_pixel / ddxy, 0.0, 1.0) - delta_pixel) * pixel;
				return tex2Dlod(tex, float4(clampedUV,0, min(mip.x, mip.y)));
			}
			
			float MyCustomExpression16_g11757( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11759( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11763( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float3 RGBToHSV(float3 c)
			{
				float4 K = float4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
				float4 p = lerp( float4( c.bg, K.wz ), float4( c.gb, K.xy ), step( c.b, c.g ) );
				float4 q = lerp( float4( p.xyw, c.r ), float4( c.r, p.yzx ), step( p.x, c.r ) );
				float d = q.x - min( q.w, q.y );
				float e = 1.0e-10;
				return float3( abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
			}
			float3 MyCustomExpression115_g11768( float3 In, float3 From, float3 To, float Fuzziness, float Range )
			{
				float Distance = distance(From, In);
				return lerp(To, In, saturate((Distance - Range) / max(Fuzziness, 0.001)));
			}
			
			float3 HSVToRGB( float3 c )
			{
				float4 K = float4( 1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0 );
				float3 p = abs( frac( c.xxx + K.xyz ) * 6.0 - K.www );
				return c.z * lerp( K.xxx, saturate( p - K.xxx ), c.y );
			}
			
			float MyCustomExpression16_g11791( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11775( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11802( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11810( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11848( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11845( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11847( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11837( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11839( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11830( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11832( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11833( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11825( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11823( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11824( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11819( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11851( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11856( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11854( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float2 MyCustomExpression10_g11866( float2 UV, int Width, int Height, float Tile, float2 Invert )
			{
				Tile = fmod(Tile + 0.001, Width * Height);
				float2 tileCount = float2(1, 1) / float2(Width, Height);
				float tileY = abs(Invert.y * Height - (floor(Tile * tileCount.x) + Invert.y * 1));
				 float tileX = abs(Invert.x * Width - ((Tile - Width * floor(Tile * tileCount.x)) + Invert.x * 1));
				return (UV + float2(tileX, tileY)) * tileCount;
			}
			
			float2 MyCustomExpression10_g11862( float2 UV, int Width, int Height, float Tile, float2 Invert )
			{
				Tile = fmod(Tile + 0.001, Width * Height);
				float2 tileCount = float2(1, 1) / float2(Width, Height);
				float tileY = abs(Invert.y * Height - (floor(Tile * tileCount.x) + Invert.y * 1));
				 float tileX = abs(Invert.x * Width - ((Tile - Width * floor(Tile * tileCount.x)) + Invert.x * 1));
				return (UV + float2(tileX, tileY)) * tileCount;
			}
			
			float MyCustomExpression16_g11873( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11881( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11883( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11879( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11875( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			
			float MyCustomExpression16_g11877( float linValue )
			{
				#ifdef UNITY_COLORSPACE_GAMMA
				return linValue;
				#else
				linValue = max(linValue, 0.h);
				return max(1.055h * pow(linValue, 0.416666667h) - 0.055h, 0.h);
				#endif
			}
			


			v2f vert( appdata_t IN  )
			{
				v2f OUT;
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(OUT);
				UNITY_TRANSFER_INSTANCE_ID(IN, OUT);
				float2 _ZeroVector = float2(0,0);
				float2 texCoord363 = IN.texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float4 ase_positionCS = UnityObjectToClipPos( IN.vertex );
				float4 screenPos = ComputeScreenPos( ase_positionCS );
				float4 ase_positionSSNorm = screenPos / screenPos.w;
				#ifdef _ENABLESCREENTILING_ON
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float2 appendResult16_g11656 = (float2(_MainTex_TexelSize.x , _MainTex_TexelSize.y));
				float2 staticSwitch2_g11656 = ( ( ( (( ( (ase_positionSSNorm).xy * (_ScreenParams).xy ) / ( _ScreenParams.x / 10.0 ) )).xy * _ScreenTilingScale ) + _ScreenTilingOffset ) * ( _ScreenTilingPixelsPerUnit * appendResult16_g11656 ) );
				#else
				float2 staticSwitch2_g11656 = texCoord363;
				#endif
				float3 ase_positionWS = mul( unity_ObjectToWorld, float4( ( IN.vertex ).xyz, 1 ) ).xyz;
				#ifdef _ENABLEWORLDTILING_ON
				float2 appendResult16_g11657 = (float2(_MainTex_TexelSize.x , _MainTex_TexelSize.y));
				float2 staticSwitch2_g11657 = ( ( ( (ase_positionWS).xy * _WorldTilingScale ) + _WorldTilingOffset ) * ( _WorldTilingPixelsPerUnit * appendResult16_g11657 ) );
				#else
				float2 staticSwitch2_g11657 = staticSwitch2_g11656;
				#endif
				float2 originalUV460 = staticSwitch2_g11657;
				#ifdef _PIXELPERFECTUV_ON
				float2 appendResult7_g11658 = (float2(_MainTex_TexelSize.z , _MainTex_TexelSize.w));
				float2 staticSwitch449 = ( floor( ( originalUV460 * appendResult7_g11658 ) ) / appendResult7_g11658 );
				#else
				float2 staticSwitch449 = originalUV460;
				#endif
				float2 uvAfterPixelArt450 = staticSwitch449;
				#ifdef _SPRITESHEETFIX_ON
				float2 break14_g11662 = uvAfterPixelArt450;
				float2 appendResult374 = (float2(_SpriteSheetRect.x , _SpriteSheetRect.y));
				float2 spriteRectMin376 = appendResult374;
				float2 break11_g11662 = spriteRectMin376;
				float2 appendResult375 = (float2(_SpriteSheetRect.z , _SpriteSheetRect.w));
				float2 spriteRectMax377 = appendResult375;
				float2 break10_g11662 = spriteRectMax377;
				float2 break9_g11662 = float2( 0,0 );
				float2 break8_g11662 = float2( 1,1 );
				float2 appendResult15_g11662 = (float2((break9_g11662.x + (break14_g11662.x - break11_g11662.x) * (break8_g11662.x - break9_g11662.x) / (break10_g11662.x - break11_g11662.x)) , (break9_g11662.y + (break14_g11662.y - break11_g11662.y) * (break8_g11662.y - break9_g11662.y) / (break10_g11662.y - break11_g11662.y))));
				float2 staticSwitch366 = appendResult15_g11662;
				#else
				float2 staticSwitch366 = uvAfterPixelArt450;
				#endif
				float2 fixedUV475 = staticSwitch366;
				#ifdef _ENABLESQUISH_ON
				float2 break77_g11901 = fixedUV475;
				float2 appendResult72_g11901 = (float2(( _SquishStretch * ( break77_g11901.x - 0.5 ) * _SquishFade ) , ( _SquishFade * ( break77_g11901.y + _SquishFlip ) * -_SquishSquish )));
				float2 staticSwitch198 = ( appendResult72_g11901 + _ZeroVector );
				#else
				float2 staticSwitch198 = _ZeroVector;
				#endif
				float2 temp_output_2_0_g11902 = staticSwitch198;
				#ifdef _TOGGLECUSTOMTIME_ON
				float staticSwitch44_g11663 = _TimeValue;
				#else
				float staticSwitch44_g11663 = _Time.y;
				#endif
				#ifdef _TOGGLEUNSCALEDTIME_ON
				float staticSwitch34_g11663 = UnscaledTime;
				#else
				float staticSwitch34_g11663 = staticSwitch44_g11663;
				#endif
				#ifdef _TOGGLETIMESPEED_ON
				float staticSwitch37_g11663 = ( staticSwitch34_g11663 * _TimeSpeed );
				#else
				float staticSwitch37_g11663 = staticSwitch34_g11663;
				#endif
				#ifdef _TOGGLETIMEFPS_ON
				float staticSwitch38_g11663 = ( floor( ( staticSwitch37_g11663 * _TimeFPS ) ) / _TimeFPS );
				#else
				float staticSwitch38_g11663 = staticSwitch37_g11663;
				#endif
				#ifdef _TOGGLETIMEFREQUENCY_ON
				float staticSwitch42_g11663 = ( ( sin( ( staticSwitch38_g11663 * _TimeFrequency ) ) * _TimeRange ) + 100.0 );
				#else
				float staticSwitch42_g11663 = staticSwitch38_g11663;
				#endif
				float shaderTime237 = staticSwitch42_g11663;
				float temp_output_8_0_g11902 = shaderTime237;
				#ifdef _ENABLESINEMOVE_ON
				float2 staticSwitch4_g11902 = ( ( sin( ( temp_output_8_0_g11902 * _SineMoveFrequency ) ) * _SineMoveOffset * _SineMoveFade ) + temp_output_2_0_g11902 );
				#else
				float2 staticSwitch4_g11902 = temp_output_2_0_g11902;
				#endif
				#ifdef _ENABLEVIBRATE_ON
				float temp_output_30_0_g11903 = temp_output_8_0_g11902;
				float3 rotatedValue21_g11903 = RotateAroundAxis( float3( 0,0,0 ), float3( 0,1,0 ), float3( 0,0,1 ), ( temp_output_30_0_g11903 * _VibrateRotation ) );
				float2 staticSwitch6_g11902 = ( ( sin( ( _VibrateFrequency * temp_output_30_0_g11903 ) ) * _VibrateOffset * _VibrateFade * (rotatedValue21_g11903).xy ) + staticSwitch4_g11902 );
				#else
				float2 staticSwitch6_g11902 = staticSwitch4_g11902;
				#endif
				#ifdef _ENABLESINESCALE_ON
				float2 staticSwitch10_g11902 = ( staticSwitch6_g11902 + ( (IN.vertex.xyz).xy * ( ( ( sin( ( _SineScaleFrequency * temp_output_8_0_g11902 ) ) + 1.0 ) * 0.5 ) * _SineScaleFactor ) ) );
				#else
				float2 staticSwitch10_g11902 = staticSwitch6_g11902;
				#endif
				float2 temp_output_424_0 = staticSwitch10_g11902;
#ifdef _SHADERFADING_MASK
				float2 uv_FadingMask = IN.texcoord.xy * _FadingMask_ST.xy + _FadingMask_ST.zw;
				#endif
#ifdef _SHADERFADING_MASK
				float4 tex2DNode3_g11718 = tex2Dlod( _FadingMask, float4( uv_FadingMask, 0, 0.0) );
				#endif
				float temp_output_4_0_g11716 = max( _FadingWidth , 0.001 );
				float2 texCoord435 = IN.texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _PIXELPERFECTSPACE_ON
				float2 temp_output_432_0 = (_MainTex_TexelSize).zw;
				float2 staticSwitch437 = ( floor( ( texCoord435 * temp_output_432_0 ) ) / temp_output_432_0 );
				#else
				float2 staticSwitch437 = texCoord435;
				#endif
				float2 temp_output_61_0_g11664 = staticSwitch437;
				float3 ase_objectScale = float3( length( unity_ObjectToWorld[ 0 ].xyz ), length( unity_ObjectToWorld[ 1 ].xyz ), length( unity_ObjectToWorld[ 2 ].xyz ) );
				float2 texCoord23_g11664 = IN.texcoord.xy * float2( 1,1 ) + float2( 0,0 );
#ifdef _SHADERSPACE_UI_GRAPHIC
				float2 appendResult28_g11664 = (float2(_RectWidth , _RectHeight));
				#endif
				#if defined( _SHADERSPACE_UV )
				float2 staticSwitch1_g11664 = ( temp_output_61_0_g11664 / ( _PixelsPerUnit * (_MainTex_TexelSize).xy ) );
				#elif defined( _SHADERSPACE_UV_RAW )
				float2 staticSwitch1_g11664 = temp_output_61_0_g11664;
				#elif defined( _SHADERSPACE_OBJECT )
				float2 staticSwitch1_g11664 = (IN.vertex.xyz).xy;
				#elif defined( _SHADERSPACE_OBJECT_SCALED )
				float2 staticSwitch1_g11664 = ( (IN.vertex.xyz).xy * (ase_objectScale).xy );
				#elif defined( _SHADERSPACE_WORLD )
				float2 staticSwitch1_g11664 = (ase_positionWS).xy;
				#elif defined( _SHADERSPACE_UI_GRAPHIC )
				float2 staticSwitch1_g11664 = ( texCoord23_g11664 * ( appendResult28_g11664 / _PixelsPerUnit ) );
				#elif defined( _SHADERSPACE_SCREEN )
				float2 staticSwitch1_g11664 = ( ( (ase_positionSSNorm).xy * (_ScreenParams).xy ) / ( _ScreenParams.x / _ScreenWidthUnits ) );
				#else
				float2 staticSwitch1_g11664 = ( temp_output_61_0_g11664 / ( _PixelsPerUnit * (_MainTex_TexelSize).xy ) );
				#endif
				float2 shaderPosition235 = staticSwitch1_g11664;
				float linValue16_g11717 = tex2Dlod( _UberNoiseTexture, float4( ( shaderPosition235 * _FadingNoiseScale ), 0, 0.0) ).r;
				float localMyCustomExpression16_g11717 = MyCustomExpression16_g11717( linValue16_g11717 );
				float clampResult14_g11716 = clamp( ( ( ( _FadingFade * ( 1.0 + temp_output_4_0_g11716 ) ) - localMyCustomExpression16_g11717 ) / temp_output_4_0_g11716 ) , 0.0 , 1.0 );
				float2 temp_output_27_0_g11714 = shaderPosition235;
				float linValue16_g11715 = tex2Dlod( _UberNoiseTexture, float4( ( temp_output_27_0_g11714 * _FadingNoiseScale ), 0, 0.0) ).r;
				float localMyCustomExpression16_g11715 = MyCustomExpression16_g11715( linValue16_g11715 );
#ifdef _SHADERFADING_SPREAD
				float clampResult3_g11714 = clamp( ( ( _FadingFade - ( distance( _FadingPosition , temp_output_27_0_g11714 ) + ( localMyCustomExpression16_g11715 * _FadingNoiseFactor ) ) ) / max( _FadingWidth , 0.001 ) ) , 0.0 , 1.0 );
				#endif
				#if defined( _SHADERFADING_NONE )
				float staticSwitch139 = _FadingFade;
				#elif defined( _SHADERFADING_FULL )
				float staticSwitch139 = _FadingFade;
				#elif defined( _SHADERFADING_MASK )
				float staticSwitch139 = ( _FadingFade * ( tex2DNode3_g11718.r * tex2DNode3_g11718.a ) );
				#elif defined( _SHADERFADING_DISSOLVE )
				float staticSwitch139 = clampResult14_g11716;
				#elif defined( _SHADERFADING_SPREAD )
				float staticSwitch139 = clampResult3_g11714;
				#else
				float staticSwitch139 = _FadingFade;
				#endif
				float fullFade123 = staticSwitch139;
				float2 lerpResult121 = lerp( float2( 0,0 ) , temp_output_424_0 , fullFade123);
				#if defined( _SHADERFADING_NONE )
				float2 staticSwitch142 = temp_output_424_0;
				#elif defined( _SHADERFADING_FULL )
				float2 staticSwitch142 = lerpResult121;
				#elif defined( _SHADERFADING_MASK )
				float2 staticSwitch142 = lerpResult121;
				#elif defined( _SHADERFADING_DISSOLVE )
				float2 staticSwitch142 = lerpResult121;
				#elif defined( _SHADERFADING_SPREAD )
				float2 staticSwitch142 = lerpResult121;
				#else
				float2 staticSwitch142 = temp_output_424_0;
				#endif
				
				OUT.ase_texcoord1 = screenPos;
				OUT.ase_texcoord2.xyz = ase_positionWS;
				
				OUT.ase_texcoord3 = IN.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				OUT.ase_texcoord2.w = 0;

				IN.vertex.xyz += float3( staticSwitch142 ,  0.0 );
				OUT.vertex = UnityObjectToClipPos(IN.vertex);
				OUT.texcoord = IN.texcoord;
				OUT.color = IN.color * _Color;
				#ifdef PIXELSNAP_ON
				OUT.vertex = UnityPixelSnap (OUT.vertex);
				#endif

				return OUT;
			}

			fixed4 SampleSpriteTexture (float2 uv)
			{
				fixed4 color = tex2D (_MainTex, uv);

#if ETC1_EXTERNAL_ALPHA
				// get the color from an external texture (usecase: Alpha support for ETC1 on android)
				fixed4 alpha = tex2D (_AlphaTex, uv);
				color.a = lerp (color.a, alpha.r, _EnableExternalAlpha);
#endif //ETC1_EXTERNAL_ALPHA

				return color;
			}

			fixed4 frag(v2f IN  ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				float2 texCoord363 = IN.texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float4 screenPos = IN.ase_texcoord1;
				float4 ase_positionSSNorm = screenPos / screenPos.w;
				#ifdef _ENABLESCREENTILING_ON
				ase_positionSSNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_positionSSNorm.z : ase_positionSSNorm.z * 0.5 + 0.5;
				float2 appendResult16_g11656 = (float2(_MainTex_TexelSize.x , _MainTex_TexelSize.y));
				float2 staticSwitch2_g11656 = ( ( ( (( ( (ase_positionSSNorm).xy * (_ScreenParams).xy ) / ( _ScreenParams.x / 10.0 ) )).xy * _ScreenTilingScale ) + _ScreenTilingOffset ) * ( _ScreenTilingPixelsPerUnit * appendResult16_g11656 ) );
				#else
				float2 staticSwitch2_g11656 = texCoord363;
				#endif
				float3 ase_positionWS = IN.ase_texcoord2.xyz;
				#ifdef _ENABLEWORLDTILING_ON
				float2 appendResult16_g11657 = (float2(_MainTex_TexelSize.x , _MainTex_TexelSize.y));
				float2 staticSwitch2_g11657 = ( ( ( (ase_positionWS).xy * _WorldTilingScale ) + _WorldTilingOffset ) * ( _WorldTilingPixelsPerUnit * appendResult16_g11657 ) );
				#else
				float2 staticSwitch2_g11657 = staticSwitch2_g11656;
				#endif
				float2 originalUV460 = staticSwitch2_g11657;
				#ifdef _PIXELPERFECTUV_ON
				float2 appendResult7_g11658 = (float2(_MainTex_TexelSize.z , _MainTex_TexelSize.w));
				float2 staticSwitch449 = ( floor( ( originalUV460 * appendResult7_g11658 ) ) / appendResult7_g11658 );
				#else
				float2 staticSwitch449 = originalUV460;
				#endif
				float2 uvAfterPixelArt450 = staticSwitch449;
				#ifdef _SPRITESHEETFIX_ON
				float2 break14_g11662 = uvAfterPixelArt450;
				float2 appendResult374 = (float2(_SpriteSheetRect.x , _SpriteSheetRect.y));
				float2 spriteRectMin376 = appendResult374;
				float2 break11_g11662 = spriteRectMin376;
				float2 appendResult375 = (float2(_SpriteSheetRect.z , _SpriteSheetRect.w));
				float2 spriteRectMax377 = appendResult375;
				float2 break10_g11662 = spriteRectMax377;
				float2 break9_g11662 = float2( 0,0 );
				float2 break8_g11662 = float2( 1,1 );
				float2 appendResult15_g11662 = (float2((break9_g11662.x + (break14_g11662.x - break11_g11662.x) * (break8_g11662.x - break9_g11662.x) / (break10_g11662.x - break11_g11662.x)) , (break9_g11662.y + (break14_g11662.y - break11_g11662.y) * (break8_g11662.y - break9_g11662.y) / (break10_g11662.y - break11_g11662.y))));
				float2 staticSwitch366 = appendResult15_g11662;
				#else
				float2 staticSwitch366 = uvAfterPixelArt450;
				#endif
				float2 fixedUV475 = staticSwitch366;
				float2 temp_output_3_0_g11665 = fixedUV475;
				#ifdef _ENABLEWIND_ON
				#ifdef _WINDLOCALWIND_ON
				float staticSwitch117_g11666 = _WindMinIntensity;
				#else
				float staticSwitch117_g11666 = WindMinIntensity;
				#endif
				#endif
				#ifdef _ENABLEWIND_ON
				#ifdef _WINDLOCALWIND_ON
				float staticSwitch118_g11666 = _WindMaxIntensity;
				#else
				float staticSwitch118_g11666 = WindMaxIntensity;
				#endif
				#endif
				float4 transform62_g11666 = mul(unity_WorldToObject,float4( 0,0,0,1 ));
				#ifdef _ENABLEWIND_ON
				#ifdef _WINDISPARALLAX_ON
				float staticSwitch111_g11666 = _WindXPosition;
				#else
				float staticSwitch111_g11666 = transform62_g11666.x;
				#endif
				#endif
				#ifdef _ENABLEWIND_ON
				#ifdef _WINDLOCALWIND_ON
				float staticSwitch113_g11666 = _WindNoiseScale;
				#else
				float staticSwitch113_g11666 = WindNoiseScale;
				#endif
				#endif
				#ifdef _TOGGLECUSTOMTIME_ON
				float staticSwitch44_g11663 = _TimeValue;
				#else
				float staticSwitch44_g11663 = _Time.y;
				#endif
				#ifdef _TOGGLEUNSCALEDTIME_ON
				float staticSwitch34_g11663 = UnscaledTime;
				#else
				float staticSwitch34_g11663 = staticSwitch44_g11663;
				#endif
				#ifdef _TOGGLETIMESPEED_ON
				float staticSwitch37_g11663 = ( staticSwitch34_g11663 * _TimeSpeed );
				#else
				float staticSwitch37_g11663 = staticSwitch34_g11663;
				#endif
				#ifdef _TOGGLETIMEFPS_ON
				float staticSwitch38_g11663 = ( floor( ( staticSwitch37_g11663 * _TimeFPS ) ) / _TimeFPS );
				#else
				float staticSwitch38_g11663 = staticSwitch37_g11663;
				#endif
				#ifdef _TOGGLETIMEFREQUENCY_ON
				float staticSwitch42_g11663 = ( ( sin( ( staticSwitch38_g11663 * _TimeFrequency ) ) * _TimeRange ) + 100.0 );
				#else
				float staticSwitch42_g11663 = staticSwitch38_g11663;
				#endif
				float shaderTime237 = staticSwitch42_g11663;
				#ifdef _ENABLEWIND_ON
				#ifdef _WINDLOCALWIND_ON
				float staticSwitch125_g11666 = ( shaderTime237 * _WindNoiseSpeed );
				#else
				float staticSwitch125_g11666 = WindTime;
				#endif
				float temp_output_50_0_g11666 = ( ( staticSwitch111_g11666 * staticSwitch113_g11666 ) + staticSwitch125_g11666 );
				float x101_g11666 = temp_output_50_0_g11666;
				float localFastNoise101_g11666 = FastNoise101_g11666( x101_g11666 );
				float2 temp_cast_0 = (temp_output_50_0_g11666).xx;
				float simplePerlin2D121_g11666 = snoise( temp_cast_0*0.5 );
				simplePerlin2D121_g11666 = simplePerlin2D121_g11666*0.5 + 0.5;
				#ifdef _WINDHIGHQUALITYNOISE_ON
				float staticSwitch123_g11666 = simplePerlin2D121_g11666;
				#else
				float staticSwitch123_g11666 = ( localFastNoise101_g11666 + 0.5 );
				#endif
				float lerpResult86_g11666 = lerp( staticSwitch117_g11666 , staticSwitch118_g11666 , staticSwitch123_g11666);
				float clampResult29_g11666 = clamp( ( ( _WindRotationWindFactor * lerpResult86_g11666 ) + _WindRotation ) , -_WindMaxRotation , _WindMaxRotation );
				float2 temp_output_1_0_g11666 = temp_output_3_0_g11665;
				float temp_output_39_0_g11666 = ( temp_output_1_0_g11666.y + _WindFlip );
				float3 appendResult43_g11666 = (float3(0.5 , -_WindFlip , 0.0));
				float2 appendResult27_g11666 = (float2(0.0 , ( _WindSquishFactor * min( ( ( _WindSquishWindFactor * abs( lerpResult86_g11666 ) ) + abs( _WindRotation ) ) , _WindMaxRotation ) * temp_output_39_0_g11666 )));
				float3 rotatedValue19_g11666 = RotateAroundAxis( appendResult43_g11666, float3( ( appendResult27_g11666 + temp_output_1_0_g11666 ) ,  0.0 ), float3( 0,0,1 ), ( clampResult29_g11666 * temp_output_39_0_g11666 ) );
				float2 staticSwitch4_g11665 = (rotatedValue19_g11666).xy;
				#else
				float2 staticSwitch4_g11665 = temp_output_3_0_g11665;
				#endif
				float2 texCoord435 = IN.texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				#ifdef _PIXELPERFECTSPACE_ON
				float2 temp_output_432_0 = (_MainTex_TexelSize).zw;
				float2 staticSwitch437 = ( floor( ( texCoord435 * temp_output_432_0 ) ) / temp_output_432_0 );
				#else
				float2 staticSwitch437 = texCoord435;
				#endif
				float2 temp_output_61_0_g11664 = staticSwitch437;
				float3 ase_objectScale = float3( length( unity_ObjectToWorld[ 0 ].xyz ), length( unity_ObjectToWorld[ 1 ].xyz ), length( unity_ObjectToWorld[ 2 ].xyz ) );
				float2 texCoord23_g11664 = IN.texcoord.xy * float2( 1,1 ) + float2( 0,0 );
#ifdef _SHADERSPACE_UI_GRAPHIC
				float2 appendResult28_g11664 = (float2(_RectWidth , _RectHeight));
				#endif
				#if defined( _SHADERSPACE_UV )
				float2 staticSwitch1_g11664 = ( temp_output_61_0_g11664 / ( _PixelsPerUnit * (_MainTex_TexelSize).xy ) );
				#elif defined( _SHADERSPACE_UV_RAW )
				float2 staticSwitch1_g11664 = temp_output_61_0_g11664;
				#elif defined( _SHADERSPACE_OBJECT )
				float2 staticSwitch1_g11664 = (IN.ase_texcoord3.xyz).xy;
				#elif defined( _SHADERSPACE_OBJECT_SCALED )
				float2 staticSwitch1_g11664 = ( (IN.ase_texcoord3.xyz).xy * (ase_objectScale).xy );
				#elif defined( _SHADERSPACE_WORLD )
				float2 staticSwitch1_g11664 = (ase_positionWS).xy;
				#elif defined( _SHADERSPACE_UI_GRAPHIC )
				float2 staticSwitch1_g11664 = ( texCoord23_g11664 * ( appendResult28_g11664 / _PixelsPerUnit ) );
				#elif defined( _SHADERSPACE_SCREEN )
				float2 staticSwitch1_g11664 = ( ( (ase_positionSSNorm).xy * (_ScreenParams).xy ) / ( _ScreenParams.x / _ScreenWidthUnits ) );
				#else
				float2 staticSwitch1_g11664 = ( temp_output_61_0_g11664 / ( _PixelsPerUnit * (_MainTex_TexelSize).xy ) );
				#endif
				float2 shaderPosition235 = staticSwitch1_g11664;
				#ifdef _ENABLEFULLDISTORTION_ON
				float2 temp_output_195_0_g11667 = shaderPosition235;
				float linValue16_g11668 = tex2D( _UberNoiseTexture, ( temp_output_195_0_g11667 * _FullDistortionNoiseScale ) ).r;
				float localMyCustomExpression16_g11668 = MyCustomExpression16_g11668( linValue16_g11668 );
				float linValue16_g11669 = tex2D( _UberNoiseTexture, ( ( temp_output_195_0_g11667 + float2( 0.321,0.321 ) ) * _FullDistortionNoiseScale ) ).r;
				float localMyCustomExpression16_g11669 = MyCustomExpression16_g11669( linValue16_g11669 );
				float2 appendResult189_g11667 = (float2(( localMyCustomExpression16_g11668 - 0.5 ) , ( localMyCustomExpression16_g11669 - 0.5 )));
				float2 staticSwitch83 = ( staticSwitch4_g11665 + ( ( 1.0 - _FullDistortionFade ) * appendResult189_g11667 * _FullDistortionDistortion ) );
				#else
				float2 staticSwitch83 = staticSwitch4_g11665;
				#endif
				#ifdef _ENABLEDIRECTIONALDISTORTION_ON
				float2 temp_output_182_0_g11670 = shaderPosition235;
				float linValue16_g11672 = tex2D( _UberNoiseTexture, ( temp_output_182_0_g11670 * _DirectionalDistortionDistortionScale ) ).r;
				float localMyCustomExpression16_g11672 = MyCustomExpression16_g11672( linValue16_g11672 );
				float3 rotatedValue168_g11670 = RotateAroundAxis( float3( 0,0,0 ), float3( _DirectionalDistortionDistortion ,  0.0 ), float3( 0,0,1 ), ( ( ( localMyCustomExpression16_g11672 - 0.5 ) * 2.0 * _DirectionalDistortionRandomDirection ) * UNITY_PI ) );
				float3 rotatedValue136_g11670 = RotateAroundAxis( float3( 0,0,0 ), float3( temp_output_182_0_g11670 ,  0.0 ), float3( 0,0,1 ), ( ( ( _DirectionalDistortionRotation / 180.0 ) + -0.25 ) * UNITY_PI ) );
				float3 break130_g11670 = rotatedValue136_g11670;
				float linValue16_g11671 = tex2D( _UberNoiseTexture, ( temp_output_182_0_g11670 * _DirectionalDistortionNoiseScale ) ).r;
				float localMyCustomExpression16_g11671 = MyCustomExpression16_g11671( linValue16_g11671 );
				float clampResult154_g11670 = clamp( ( ( break130_g11670.x + break130_g11670.y + _DirectionalDistortionFade + ( localMyCustomExpression16_g11671 * _DirectionalDistortionNoiseFactor ) ) / max( _DirectionalDistortionWidth , 0.001 ) ) , 0.0 , 1.0 );
				float2 staticSwitch82 = ( staticSwitch83 + ( (rotatedValue168_g11670).xy * ( 1.0 - (( _DirectionalDistortionInvert )?( ( 1.0 - clampResult154_g11670 ) ):( clampResult154_g11670 )) ) ) );
				#else
				float2 staticSwitch82 = staticSwitch83;
				#endif
				#ifdef _ENABLEHOLOGRAM_ON
				float temp_output_81_0_g11675 = unity_OrthoParams.y;
				float temp_output_8_0_g11675 = ( ( ( shaderTime237 * ( _HologramDistortionSpeed * temp_output_81_0_g11675 * 0.2 ) ) + ase_positionWS.y ) / temp_output_81_0_g11675 );
				float2 temp_cast_4 = (temp_output_8_0_g11675).xx;
				float2 temp_cast_5 = (_HologramDistortionDensity).xx;
				float linValue16_g11677 = tex2D( _UberNoiseTexture, ( temp_cast_4 * temp_cast_5 ) ).r;
				float localMyCustomExpression16_g11677 = MyCustomExpression16_g11677( linValue16_g11677 );
				float clampResult75_g11675 = clamp( localMyCustomExpression16_g11677 , 0.075 , 0.6 );
				float2 temp_cast_6 = (temp_output_8_0_g11675).xx;
				float2 temp_cast_7 = (_HologramDistortionScale).xx;
				float linValue16_g11678 = tex2D( _UberNoiseTexture, ( temp_cast_6 * temp_cast_7 ) ).r;
				float localMyCustomExpression16_g11678 = MyCustomExpression16_g11678( linValue16_g11678 );
				float2 appendResult2_g11676 = (float2(_MainTex_TexelSize.z , _MainTex_TexelSize.w));
				float hologramFade182 = _HologramFade;
				float2 appendResult44_g11675 = (float2(( ( ( clampResult75_g11675 * ( localMyCustomExpression16_g11678 - 0.5 ) ) * _HologramDistortionOffset * ( 100.0 / appendResult2_g11676 ).x ) * hologramFade182 ) , 0.0));
				float2 staticSwitch59 = ( staticSwitch82 + appendResult44_g11675 );
				#else
				float2 staticSwitch59 = staticSwitch82;
				#endif
				#ifdef _ENABLEGLITCH_ON
				float2 temp_output_18_0_g11673 = shaderPosition235;
				float2 glitchPosition154 = temp_output_18_0_g11673;
				float linValue16_g11720 = tex2D( _UberNoiseTexture, ( ( glitchPosition154 + ( _GlitchDistortionSpeed * shaderTime237 ) ) * _GlitchDistortionScale ) ).r;
				float localMyCustomExpression16_g11720 = MyCustomExpression16_g11720( linValue16_g11720 );
				float linValue16_g11674 = tex2D( _UberNoiseTexture, ( ( temp_output_18_0_g11673 + ( _GlitchMaskSpeed * shaderTime237 ) ) * _GlitchMaskScale ) ).r;
				float localMyCustomExpression16_g11674 = MyCustomExpression16_g11674( linValue16_g11674 );
				float glitchFade152 = ( max( localMyCustomExpression16_g11674 , _GlitchMaskMin ) * _GlitchFade );
				float2 staticSwitch62 = ( staticSwitch59 + ( ( localMyCustomExpression16_g11720 - 0.5 ) * _GlitchDistortion * glitchFade152 ) );
				#else
				float2 staticSwitch62 = staticSwitch59;
				#endif
				float2 temp_output_1_0_g11721 = staticSwitch62;
				float2 temp_output_26_0_g11721 = shaderPosition235;
				float temp_output_25_0_g11721 = shaderTime237;
				#ifdef _ENABLEUVDISTORT_ON
				float linValue16_g11731 = tex2D( _UberNoiseTexture, ( ( temp_output_26_0_g11721 + ( _UVDistortSpeed * temp_output_25_0_g11721 ) ) * _UVDistortNoiseScale ) ).r;
				float localMyCustomExpression16_g11731 = MyCustomExpression16_g11731( linValue16_g11731 );
				float2 lerpResult21_g11728 = lerp( _UVDistortFrom , _UVDistortTo , localMyCustomExpression16_g11731);
				float2 appendResult2_g11730 = (float2(_MainTex_TexelSize.z , _MainTex_TexelSize.w));
				float2 uv_UVDistortMask = IN.texcoord.xy * _UVDistortMask_ST.xy + _UVDistortMask_ST.zw;
				float4 tex2DNode3_g11729 = tex2D( _UVDistortMask, uv_UVDistortMask );
				#ifdef _UVDISTORTMASKTOGGLE_ON
				float staticSwitch29_g11728 = ( _UVDistortFade * ( tex2DNode3_g11729.r * tex2DNode3_g11729.a ) );
				#else
				float staticSwitch29_g11728 = _UVDistortFade;
				#endif
				float2 staticSwitch5_g11721 = ( temp_output_1_0_g11721 + ( lerpResult21_g11728 * ( 100.0 / appendResult2_g11730 ) * staticSwitch29_g11728 ) );
				#else
				float2 staticSwitch5_g11721 = temp_output_1_0_g11721;
				#endif
				#ifdef _ENABLESQUEEZE_ON
				float2 temp_output_1_0_g11727 = staticSwitch5_g11721;
				float2 staticSwitch7_g11721 = ( temp_output_1_0_g11727 + ( ( temp_output_1_0_g11727 - _SqueezeCenter ) * pow( distance( temp_output_1_0_g11727 , _SqueezeCenter ) , _SqueezePower ) * _SqueezeScale * _SqueezeFade ) );
				#else
				float2 staticSwitch7_g11721 = staticSwitch5_g11721;
				#endif
				#ifdef _ENABLESINEROTATE_ON
				float3 rotatedValue36_g11726 = RotateAroundAxis( float3( _SineRotatePivot ,  0.0 ), float3( staticSwitch7_g11721 ,  0.0 ), float3( 0,0,1 ), ( sin( ( temp_output_25_0_g11721 * _SineRotateFrequency ) ) * ( ( _SineRotateAngle / 360.0 ) * UNITY_PI ) * _SineRotateFade ) );
				float2 staticSwitch9_g11721 = (rotatedValue36_g11726).xy;
				#else
				float2 staticSwitch9_g11721 = staticSwitch7_g11721;
				#endif
				#ifdef _ENABLEUVROTATE_ON
				float3 rotatedValue8_g11725 = RotateAroundAxis( float3( _UVRotatePivot ,  0.0 ), float3( staticSwitch9_g11721 ,  0.0 ), float3( 0,0,1 ), ( temp_output_25_0_g11721 * _UVRotateSpeed * UNITY_PI ) );
				float2 staticSwitch16_g11721 = (rotatedValue8_g11725).xy;
				#else
				float2 staticSwitch16_g11721 = staticSwitch9_g11721;
				#endif
				#ifdef _ENABLEUVSCROLL_ON
				float2 staticSwitch14_g11721 = ( ( _UVScrollSpeed * temp_output_25_0_g11721 ) + staticSwitch16_g11721 );
				#else
				float2 staticSwitch14_g11721 = staticSwitch16_g11721;
				#endif
				#ifdef _ENABLEPIXELATE_ON
				float2 appendResult35_g11723 = (float2(_MainTex_TexelSize.z , _MainTex_TexelSize.w));
				float2 MultFactor30_g11723 = ( ( _PixelatePixelDensity * ( appendResult35_g11723 / _PixelatePixelsPerUnit ) ) * ( 1.0 / max( _PixelateFade , 1E-05 ) ) );
				float2 clampResult46_g11723 = clamp( ( floor( ( MultFactor30_g11723 * ( staticSwitch14_g11721 + ( float2( 0.5,0.5 ) / MultFactor30_g11723 ) ) ) ) / MultFactor30_g11723 ) , float2( 0,0 ) , float2( 1,1 ) );
				float2 staticSwitch4_g11721 = clampResult46_g11723;
				#else
				float2 staticSwitch4_g11721 = staticSwitch14_g11721;
				#endif
				#ifdef _ENABLEUVSCALE_ON
				float2 staticSwitch24_g11721 = ( ( ( staticSwitch4_g11721 - _UVScalePivot ) / _UVScaleScale ) + _UVScalePivot );
				#else
				float2 staticSwitch24_g11721 = staticSwitch4_g11721;
				#endif
				float2 temp_output_1_0_g11732 = staticSwitch24_g11721;
				#ifdef _ENABLEWIGGLE_ON
				float temp_output_7_0_g11732 = ( sin( ( _WiggleFrequency * ( temp_output_26_0_g11721.y + ( _WiggleSpeed * temp_output_25_0_g11721 ) ) ) ) * _WiggleOffset * _WiggleFade );
				#ifdef _WIGGLEFIXEDGROUNDTOGGLE_ON
				float staticSwitch18_g11732 = ( temp_output_7_0_g11732 * temp_output_1_0_g11732.y );
				#else
				float staticSwitch18_g11732 = temp_output_7_0_g11732;
				#endif
				float2 appendResult12_g11732 = (float2(staticSwitch18_g11732 , 0.0));
				float2 staticSwitch13_g11732 = ( temp_output_1_0_g11732 + appendResult12_g11732 );
				#else
				float2 staticSwitch13_g11732 = temp_output_1_0_g11732;
				#endif
				float2 temp_output_484_0 = staticSwitch13_g11732;
				float2 texCoord131 = IN.texcoord.xy * float2( 1,1 ) + float2( 0,0 );
#ifdef _SHADERFADING_MASK
				float2 uv_FadingMask = IN.texcoord.xy * _FadingMask_ST.xy + _FadingMask_ST.zw;
				#endif
#ifdef _SHADERFADING_MASK
				float4 tex2DNode3_g11718 = tex2D( _FadingMask, uv_FadingMask );
				#endif
				float temp_output_4_0_g11716 = max( _FadingWidth , 0.001 );
				float linValue16_g11717 = tex2D( _UberNoiseTexture, ( shaderPosition235 * _FadingNoiseScale ) ).r;
				float localMyCustomExpression16_g11717 = MyCustomExpression16_g11717( linValue16_g11717 );
				float clampResult14_g11716 = clamp( ( ( ( _FadingFade * ( 1.0 + temp_output_4_0_g11716 ) ) - localMyCustomExpression16_g11717 ) / temp_output_4_0_g11716 ) , 0.0 , 1.0 );
				float2 temp_output_27_0_g11714 = shaderPosition235;
				float linValue16_g11715 = tex2D( _UberNoiseTexture, ( temp_output_27_0_g11714 * _FadingNoiseScale ) ).r;
				float localMyCustomExpression16_g11715 = MyCustomExpression16_g11715( linValue16_g11715 );
#ifdef _SHADERFADING_SPREAD
				float clampResult3_g11714 = clamp( ( ( _FadingFade - ( distance( _FadingPosition , temp_output_27_0_g11714 ) + ( localMyCustomExpression16_g11715 * _FadingNoiseFactor ) ) ) / max( _FadingWidth , 0.001 ) ) , 0.0 , 1.0 );
				#endif
				#if defined( _SHADERFADING_NONE )
				float staticSwitch139 = _FadingFade;
				#elif defined( _SHADERFADING_FULL )
				float staticSwitch139 = _FadingFade;
				#elif defined( _SHADERFADING_MASK )
				float staticSwitch139 = ( _FadingFade * ( tex2DNode3_g11718.r * tex2DNode3_g11718.a ) );
				#elif defined( _SHADERFADING_DISSOLVE )
				float staticSwitch139 = clampResult14_g11716;
				#elif defined( _SHADERFADING_SPREAD )
				float staticSwitch139 = clampResult3_g11714;
				#else
				float staticSwitch139 = _FadingFade;
				#endif
				float fullFade123 = staticSwitch139;
				float2 lerpResult130 = lerp( texCoord131 , temp_output_484_0 , fullFade123);
				#if defined( _SHADERFADING_NONE )
				float2 staticSwitch145 = temp_output_484_0;
				#elif defined( _SHADERFADING_FULL )
				float2 staticSwitch145 = lerpResult130;
				#elif defined( _SHADERFADING_MASK )
				float2 staticSwitch145 = lerpResult130;
				#elif defined( _SHADERFADING_DISSOLVE )
				float2 staticSwitch145 = lerpResult130;
				#elif defined( _SHADERFADING_SPREAD )
				float2 staticSwitch145 = lerpResult130;
				#else
				float2 staticSwitch145 = temp_output_484_0;
				#endif
				#ifdef _TILINGFIX_ON
				float2 staticSwitch485 = ( ( ( staticSwitch145 % float2( 1,1 ) ) + float2( 1,1 ) ) % float2( 1,1 ) );
				#else
				float2 staticSwitch485 = staticSwitch145;
				#endif
				#ifdef _SPRITESHEETFIX_ON
				float2 break14_g11733 = staticSwitch485;
				float2 break11_g11733 = float2( 0,0 );
				float2 break10_g11733 = float2( 1,1 );
				float2 break9_g11733 = spriteRectMin376;
				float2 break8_g11733 = spriteRectMax377;
				float2 appendResult15_g11733 = (float2((break9_g11733.x + (break14_g11733.x - break11_g11733.x) * (break8_g11733.x - break9_g11733.x) / (break10_g11733.x - break11_g11733.x)) , (break9_g11733.y + (break14_g11733.y - break11_g11733.y) * (break8_g11733.y - break9_g11733.y) / (break10_g11733.y - break11_g11733.y))));
				float2 staticSwitch371 = min( max( appendResult15_g11733 , spriteRectMin376 ) , spriteRectMax377 );
				#else
				float2 staticSwitch371 = staticSwitch485;
				#endif
				#ifdef _PIXELPERFECTUV_ON
				float2 appendResult7_g11734 = (float2(_MainTex_TexelSize.z , _MainTex_TexelSize.w));
				float2 staticSwitch427 = ( originalUV460 + ( floor( ( ( staticSwitch371 - uvAfterPixelArt450 ) * appendResult7_g11734 ) ) / appendResult7_g11734 ) );
				#else
				float2 staticSwitch427 = staticSwitch371;
				#endif
				float2 finalUV146 = staticSwitch427;
				float2 temp_output_1_0_g11735 = finalUV146;
				#ifdef _ENABLESMOOTHPIXELART_ON
				sampler2D tex3_g11736 = _MainTex;
				float4 textureTexelSize3_g11736 = _MainTex_TexelSize;
				float2 uvs3_g11736 = temp_output_1_0_g11735;
				float4 localtexturePointSmooth3_g11736 = texturePointSmooth( tex3_g11736 , textureTexelSize3_g11736 , uvs3_g11736 );
				float4 staticSwitch8_g11735 = localtexturePointSmooth3_g11736;
				#else
				float4 staticSwitch8_g11735 = tex2D( _MainTex, temp_output_1_0_g11735 );
				#endif
				#ifdef _ENABLEGAUSSIANBLUR_ON
				float temp_output_10_0_g11737 = ( _GaussianBlurOffset * _GaussianBlurFade * 0.005 );
				float temp_output_2_0_g11747 = temp_output_10_0_g11737;
				float2 appendResult16_g11747 = (float2(temp_output_2_0_g11747 , 0.0));
				float2 appendResult25_g11749 = (float2(_MainTex_TexelSize.x , _MainTex_TexelSize.y));
				float2 temp_output_26_0_g11749 = ( appendResult16_g11747 * appendResult25_g11749 );
				float2 temp_output_7_0_g11737 = temp_output_1_0_g11735;
				float2 temp_output_1_0_g11747 = ( temp_output_7_0_g11737 + ( temp_output_10_0_g11737 * float2( 1,1 ) ) );
				float2 temp_output_1_0_g11749 = temp_output_1_0_g11747;
				float2 appendResult17_g11747 = (float2(0.0 , temp_output_2_0_g11747));
				float2 appendResult25_g11748 = (float2(_MainTex_TexelSize.x , _MainTex_TexelSize.y));
				float2 temp_output_26_0_g11748 = ( appendResult17_g11747 * appendResult25_g11748 );
				float2 temp_output_1_0_g11748 = temp_output_1_0_g11747;
				float temp_output_2_0_g11738 = temp_output_10_0_g11737;
				float2 appendResult16_g11738 = (float2(temp_output_2_0_g11738 , 0.0));
				float2 appendResult25_g11740 = (float2(_MainTex_TexelSize.x , _MainTex_TexelSize.y));
				float2 temp_output_26_0_g11740 = ( appendResult16_g11738 * appendResult25_g11740 );
				float2 temp_output_1_0_g11738 = ( temp_output_7_0_g11737 + ( temp_output_10_0_g11737 * float2( -1,1 ) ) );
				float2 temp_output_1_0_g11740 = temp_output_1_0_g11738;
				float2 appendResult17_g11738 = (float2(0.0 , temp_output_2_0_g11738));
				float2 appendResult25_g11739 = (float2(_MainTex_TexelSize.x , _MainTex_TexelSize.y));
				float2 temp_output_26_0_g11739 = ( appendResult17_g11738 * appendResult25_g11739 );
				float2 temp_output_1_0_g11739 = temp_output_1_0_g11738;
				float temp_output_2_0_g11744 = temp_output_10_0_g11737;
				float2 appendResult16_g11744 = (float2(temp_output_2_0_g11744 , 0.0));
				float2 appendResult25_g11746 = (float2(_MainTex_TexelSize.x , _MainTex_TexelSize.y));
				float2 temp_output_26_0_g11746 = ( appendResult16_g11744 * appendResult25_g11746 );
				float2 temp_output_1_0_g11744 = ( temp_output_7_0_g11737 + ( temp_output_10_0_g11737 * float2( -1,-1 ) ) );
				float2 temp_output_1_0_g11746 = temp_output_1_0_g11744;
				float2 appendResult17_g11744 = (float2(0.0 , temp_output_2_0_g11744));
				float2 appendResult25_g11745 = (float2(_MainTex_TexelSize.x , _MainTex_TexelSize.y));
				float2 temp_output_26_0_g11745 = ( appendResult17_g11744 * appendResult25_g11745 );
				float2 temp_output_1_0_g11745 = temp_output_1_0_g11744;
				float temp_output_2_0_g11741 = temp_output_10_0_g11737;
				float2 appendResult16_g11741 = (float2(temp_output_2_0_g11741 , 0.0));
				float2 appendResult25_g11743 = (float2(_MainTex_TexelSize.x , _MainTex_TexelSize.y));
				float2 temp_output_26_0_g11743 = ( appendResult16_g11741 * appendResult25_g11743 );
				float2 temp_output_1_0_g11741 = ( temp_output_7_0_g11737 + ( temp_output_10_0_g11737 * float2( 1,-1 ) ) );
				float2 temp_output_1_0_g11743 = temp_output_1_0_g11741;
				float2 appendResult17_g11741 = (float2(0.0 , temp_output_2_0_g11741));
				float2 appendResult25_g11742 = (float2(_MainTex_TexelSize.x , _MainTex_TexelSize.y));
				float2 temp_output_26_0_g11742 = ( appendResult17_g11741 * appendResult25_g11742 );
				float2 temp_output_1_0_g11742 = temp_output_1_0_g11741;
				float4 staticSwitch3_g11735 = ( ( ( ( tex2D( _MainTex, ( temp_output_26_0_g11749 + temp_output_1_0_g11749 ) ) + tex2D( _MainTex, ( -temp_output_26_0_g11749 + temp_output_1_0_g11749 ) ) ) + ( tex2D( _MainTex, ( temp_output_26_0_g11748 + temp_output_1_0_g11748 ) ) + tex2D( _MainTex, ( -temp_output_26_0_g11748 + temp_output_1_0_g11748 ) ) ) ) + ( ( tex2D( _MainTex, ( temp_output_26_0_g11740 + temp_output_1_0_g11740 ) ) + tex2D( _MainTex, ( -temp_output_26_0_g11740 + temp_output_1_0_g11740 ) ) ) + ( tex2D( _MainTex, ( temp_output_26_0_g11739 + temp_output_1_0_g11739 ) ) + tex2D( _MainTex, ( -temp_output_26_0_g11739 + temp_output_1_0_g11739 ) ) ) ) + ( ( tex2D( _MainTex, ( temp_output_26_0_g11746 + temp_output_1_0_g11746 ) ) + tex2D( _MainTex, ( -temp_output_26_0_g11746 + temp_output_1_0_g11746 ) ) ) + ( tex2D( _MainTex, ( temp_output_26_0_g11745 + temp_output_1_0_g11745 ) ) + tex2D( _MainTex, ( -temp_output_26_0_g11745 + temp_output_1_0_g11745 ) ) ) ) + ( ( tex2D( _MainTex, ( temp_output_26_0_g11743 + temp_output_1_0_g11743 ) ) + tex2D( _MainTex, ( -temp_output_26_0_g11743 + temp_output_1_0_g11743 ) ) ) + ( tex2D( _MainTex, ( temp_output_26_0_g11742 + temp_output_1_0_g11742 ) ) + tex2D( _MainTex, ( -temp_output_26_0_g11742 + temp_output_1_0_g11742 ) ) ) ) ) * 0.0625 );
				#else
				float4 staticSwitch3_g11735 = staticSwitch8_g11735;
				#endif
				#ifdef _ENABLESHARPEN_ON
				float2 temp_output_1_0_g11750 = temp_output_1_0_g11735;
				float4 tex2DNode4_g11750 = tex2D( _MainTex, temp_output_1_0_g11750 );
				float temp_output_2_0_g11751 = _SharpenOffset;
				float2 appendResult16_g11751 = (float2(temp_output_2_0_g11751 , 0.0));
				float2 appendResult25_g11753 = (float2(_MainTex_TexelSize.x , _MainTex_TexelSize.y));
				float2 temp_output_26_0_g11753 = ( appendResult16_g11751 * appendResult25_g11753 );
				float2 temp_output_1_0_g11751 = temp_output_1_0_g11750;
				float2 temp_output_1_0_g11753 = temp_output_1_0_g11751;
				float2 appendResult17_g11751 = (float2(0.0 , temp_output_2_0_g11751));
				float2 appendResult25_g11752 = (float2(_MainTex_TexelSize.x , _MainTex_TexelSize.y));
				float2 temp_output_26_0_g11752 = ( appendResult17_g11751 * appendResult25_g11752 );
				float2 temp_output_1_0_g11752 = temp_output_1_0_g11751;
				float4 break22_g11750 = ( tex2DNode4_g11750 - ( ( ( ( ( tex2D( _MainTex, ( temp_output_26_0_g11753 + temp_output_1_0_g11753 ) ) + tex2D( _MainTex, ( -temp_output_26_0_g11753 + temp_output_1_0_g11753 ) ) ) + ( tex2D( _MainTex, ( temp_output_26_0_g11752 + temp_output_1_0_g11752 ) ) + tex2D( _MainTex, ( -temp_output_26_0_g11752 + temp_output_1_0_g11752 ) ) ) ) / 4.0 ) - tex2DNode4_g11750 ) * ( _SharpenFactor * _SharpenFade ) ) );
				float clampResult23_g11750 = clamp( break22_g11750.a , 0.0 , 1.0 );
				float4 appendResult24_g11750 = (float4(break22_g11750.r , break22_g11750.g , break22_g11750.b , clampResult23_g11750));
				float4 staticSwitch12_g11735 = appendResult24_g11750;
				#else
				float4 staticSwitch12_g11735 = staticSwitch3_g11735;
				#endif
				float4 temp_output_471_0 = staticSwitch12_g11735;
				#ifdef _VERTEXTINTFIRST_ON
				float4 temp_output_1_0_g11754 = temp_output_471_0;
				float4 appendResult8_g11754 = (float4(( (temp_output_1_0_g11754).rgb * (IN.color).rgb ) , temp_output_1_0_g11754.a));
				float4 staticSwitch354 = appendResult8_g11754;
				#else
				float4 staticSwitch354 = temp_output_471_0;
				#endif
				float4 originalColor191 = staticSwitch354;
				float4 temp_output_1_0_g11755 = originalColor191;
				float4 temp_output_1_0_g11756 = temp_output_1_0_g11755;
				float2 temp_output_7_0_g11755 = finalUV146;
				#ifdef _ENABLESMOKE_ON
				float2 temp_output_43_0_g11756 = temp_output_7_0_g11755;
				float2 temp_cast_15 = (_SmokeNoiseScale).xx;
				float linValue16_g11757 = tex2D( _UberNoiseTexture, ( ( ( IN.color.r * (( _SmokeVertexSeed )?( 5.0 ):( 0.0 )) ) + temp_output_43_0_g11756 ) * temp_cast_15 ) ).r;
				float localMyCustomExpression16_g11757 = MyCustomExpression16_g11757( linValue16_g11757 );
				float clampResult28_g11756 = clamp( ( ( ( localMyCustomExpression16_g11757 - 1.0 ) * _SmokeNoiseFactor ) + ( ( ( IN.color.a / 2.5 ) - distance( temp_output_43_0_g11756 , float2( 0.5,0.5 ) ) ) * 2.5 * _SmokeSmoothness ) ) , 0.0 , 1.0 );
				float3 lerpResult34_g11756 = lerp( (temp_output_1_0_g11756).rgb , float3( 0,0,0 ) , ( ( 1.0 - clampResult28_g11756 ) * _SmokeDarkEdge ));
				float4 appendResult31_g11756 = (float4(lerpResult34_g11756 , ( clampResult28_g11756 * _SmokeAlpha * temp_output_1_0_g11756.a )));
				float4 staticSwitch2_g11755 = appendResult31_g11756;
				#else
				float4 staticSwitch2_g11755 = temp_output_1_0_g11755;
				#endif
				#ifdef _ENABLECUSTOMFADE_ON
				float4 temp_output_1_0_g11758 = staticSwitch2_g11755;
				float2 temp_output_57_0_g11758 = temp_output_7_0_g11755;
				float4 tex2DNode3_g11758 = tex2D( _CustomFadeFadeMask, temp_output_57_0_g11758 );
				float linValue16_g11759 = tex2D( _UberNoiseTexture, ( temp_output_57_0_g11758 * _CustomFadeNoiseScale ) ).r;
				float localMyCustomExpression16_g11759 = MyCustomExpression16_g11759( linValue16_g11759 );
				float clampResult37_g11758 = clamp( ( ( ( IN.color.a * 2.0 ) - 1.0 ) + ( tex2DNode3_g11758.r + ( localMyCustomExpression16_g11759 * _CustomFadeNoiseFactor ) ) ) , 0.0 , 1.0 );
				float4 appendResult13_g11758 = (float4((temp_output_1_0_g11758).rgb , ( temp_output_1_0_g11758.a * pow( clampResult37_g11758 , ( _CustomFadeSmoothness / max( tex2DNode3_g11758.r , 0.05 ) ) ) * _CustomFadeAlpha )));
				float4 staticSwitch3_g11755 = appendResult13_g11758;
				#else
				float4 staticSwitch3_g11755 = staticSwitch2_g11755;
				#endif
				float4 temp_output_1_0_g11760 = staticSwitch3_g11755;
				#ifdef _ENABLECHECKERBOARD_ON
				float4 temp_output_1_0_g11761 = temp_output_1_0_g11760;
				float2 appendResult4_g11761 = (float2(ase_positionWS.x , ase_positionWS.y));
				float2 temp_output_44_0_g11761 = ( appendResult4_g11761 * _CheckerboardTiling * 0.5 );
				float2 break12_g11761 = step( ( ceil( temp_output_44_0_g11761 ) - temp_output_44_0_g11761 ) , float2( 0.5,0.5 ) );
				float4 appendResult42_g11761 = (float4(( (temp_output_1_0_g11761).rgb * min( ( _CheckerboardDarken + abs( ( -break12_g11761.x + break12_g11761.y ) ) ) , 1.0 ) ) , temp_output_1_0_g11761.a));
				float4 staticSwitch2_g11760 = appendResult42_g11761;
				#else
				float4 staticSwitch2_g11760 = temp_output_1_0_g11760;
				#endif
				#ifdef _ENABLEFLAME_ON
				float2 temp_output_75_0_g11762 = finalUV146;
				float linValue16_g11763 = tex2D( _UberNoiseTexture, ( ( ( shaderTime237 * _FlameSpeed ) + temp_output_75_0_g11762 ) * _FlameNoiseScale ) ).r;
				float localMyCustomExpression16_g11763 = MyCustomExpression16_g11763( linValue16_g11763 );
				float saferPower57_g11762 = abs( max( ( temp_output_75_0_g11762.y - 0.2 ) , 0.0 ) );
				float temp_output_47_0_g11762 = max( _FlameRadius , 0.01 );
				float clampResult70_g11762 = clamp( ( ( ( localMyCustomExpression16_g11763 * pow( saferPower57_g11762 , _FlameNoiseHeightFactor ) * _FlameNoiseFactor ) + ( ( temp_output_47_0_g11762 - distance( temp_output_75_0_g11762 , float2( 0.5,0.4 ) ) ) / temp_output_47_0_g11762 ) ) * _FlameSmooth ) , 0.0 , 1.0 );
				float temp_output_63_0_g11762 = ( clampResult70_g11762 * _FlameBrightness );
				float4 appendResult31_g11762 = (float4(temp_output_63_0_g11762 , temp_output_63_0_g11762 , temp_output_63_0_g11762 , clampResult70_g11762));
				float4 staticSwitch6_g11760 = ( appendResult31_g11762 * staticSwitch2_g11760 );
				#else
				float4 staticSwitch6_g11760 = staticSwitch2_g11760;
				#endif
				float4 temp_output_3_0_g11764 = staticSwitch6_g11760;
				float4 temp_output_1_0_g11796 = temp_output_3_0_g11764;
				float4 appendResult91_g11796 = (float4((temp_output_1_0_g11796).rgb , 1.0));
				float2 temp_output_1_0_g11764 = finalUV146;
				#ifdef _ENABLERECOLORRGB_ON
				#ifdef _RECOLORRGBTEXTURETOGGLE_ON
				float4 staticSwitch81_g11796 = tex2D( _RecolorRGBTexture, temp_output_1_0_g11764 );
				#else
				float4 staticSwitch81_g11796 = appendResult91_g11796;
				#endif
				float3 break82_g11796 = (staticSwitch81_g11796).xyz;
				float temp_output_84_0_g11796 = max( ( break82_g11796.x + break82_g11796.y + break82_g11796.z ) , 0.001 );
				float4 break71_g11796 = ( ( _RecolorRGBRedTint * ( break82_g11796.x / temp_output_84_0_g11796 ) ) + ( _RecolorRGBGreenTint * ( break82_g11796.y / temp_output_84_0_g11796 ) ) + ( ( break82_g11796.z / temp_output_84_0_g11796 ) * _RecolorRGBBlueTint ) );
				float3 appendResult56_g11796 = (float3(break71_g11796.r , break71_g11796.g , break71_g11796.b));
				float4 break2_g11797 = temp_output_1_0_g11796;
				float saferPower57_g11796 = abs( ( ( break2_g11797.x + break2_g11797.x + break2_g11797.y + break2_g11797.y + break2_g11797.y + break2_g11797.z ) / 6.0 ) );
				float3 lerpResult26_g11796 = lerp( (temp_output_1_0_g11796).rgb , ( appendResult56_g11796 * pow( saferPower57_g11796 , ( max( break71_g11796.a , 0.01 ) * 2.0 ) ) ) , ( staticSwitch81_g11796.w * _RecolorRGBFade ));
				float4 appendResult30_g11796 = (float4(lerpResult26_g11796 , temp_output_1_0_g11796.a));
				float4 staticSwitch43_g11764 = appendResult30_g11796;
				#else
				float4 staticSwitch43_g11764 = temp_output_3_0_g11764;
				#endif
				#ifdef _ENABLERECOLORRGBYCP_ON
				float4 temp_output_1_0_g11794 = staticSwitch43_g11764;
				#ifdef _RECOLORRGBYCPTEXTURETOGGLE_ON
				float4 staticSwitch62_g11794 = tex2D( _RecolorRGBYCPTexture, temp_output_1_0_g11764 );
				#else
				float4 staticSwitch62_g11794 = temp_output_1_0_g11794;
				#endif
				float3 hsvTorgb33_g11794 = RGBToHSV( staticSwitch62_g11794.rgb );
				float temp_output_43_0_g11794 = ( ( hsvTorgb33_g11794.x + 0.08333334 ) % 1.0 );
				float4 ifLocalVar46_g11794 = 0;
				if( temp_output_43_0_g11794 >= 0.8333333 )
				ifLocalVar46_g11794 = _RecolorRGBYCPPurpleTint;
				else
				ifLocalVar46_g11794 = _RecolorRGBYCPBlueTint;
				float4 ifLocalVar44_g11794 = 0;
				if( temp_output_43_0_g11794 <= 0.6666667 )
				ifLocalVar44_g11794 = _RecolorRGBYCPCyanTint;
				else
				ifLocalVar44_g11794 = ifLocalVar46_g11794;
				float4 ifLocalVar47_g11794 = 0;
				if( temp_output_43_0_g11794 <= 0.3333333 )
				ifLocalVar47_g11794 = _RecolorRGBYCPYellowTint;
				else
				ifLocalVar47_g11794 = _RecolorRGBYCPGreenTint;
				float4 ifLocalVar45_g11794 = 0;
				if( temp_output_43_0_g11794 <= 0.1666667 )
				ifLocalVar45_g11794 = _RecolorRGBYCPRedTint;
				else
				ifLocalVar45_g11794 = ifLocalVar47_g11794;
				float4 ifLocalVar35_g11794 = 0;
				if( temp_output_43_0_g11794 >= 0.5 )
				ifLocalVar35_g11794 = ifLocalVar44_g11794;
				else
				ifLocalVar35_g11794 = ifLocalVar45_g11794;
				float4 break55_g11794 = ifLocalVar35_g11794;
				float3 appendResult56_g11794 = (float3(break55_g11794.r , break55_g11794.g , break55_g11794.b));
				float4 break2_g11795 = temp_output_1_0_g11794;
				float saferPower57_g11794 = abs( ( ( break2_g11795.x + break2_g11795.x + break2_g11795.y + break2_g11795.y + break2_g11795.y + break2_g11795.z ) / 6.0 ) );
				float3 lerpResult26_g11794 = lerp( (temp_output_1_0_g11794).rgb , ( appendResult56_g11794 * pow( saferPower57_g11794 , max( ( break55_g11794.a * 2.0 ) , 0.01 ) ) ) , ( hsvTorgb33_g11794.z * _RecolorRGBYCPFade ));
				float4 appendResult30_g11794 = (float4(lerpResult26_g11794 , temp_output_1_0_g11794.a));
				float4 staticSwitch9_g11764 = appendResult30_g11794;
				#else
				float4 staticSwitch9_g11764 = staticSwitch43_g11764;
				#endif
				#ifdef _ENABLECOLORREPLACE_ON
				float4 temp_output_1_0_g11768 = staticSwitch9_g11764;
				float3 temp_output_2_0_g11768 = (temp_output_1_0_g11768).rgb;
				float3 In115_g11768 = temp_output_2_0_g11768;
				float3 From115_g11768 = (_ColorReplaceFromColor).rgb;
				float4 break2_g11769 = temp_output_1_0_g11768;
				float3 To115_g11768 = ( pow( max( ( ( break2_g11769.x + break2_g11769.x + break2_g11769.y + break2_g11769.y + break2_g11769.y + break2_g11769.z ) / 6.0 ) , 0.0001 ) , max( _ColorReplaceContrast , 0.0001 ) ) * (_ColorReplaceToColor).rgb );
				float Fuzziness115_g11768 = _ColorReplaceSmoothness;
				float Range115_g11768 = _ColorReplaceRange;
				float3 localMyCustomExpression115_g11768 = MyCustomExpression115_g11768( In115_g11768 , From115_g11768 , To115_g11768 , Fuzziness115_g11768 , Range115_g11768 );
				float3 lerpResult112_g11768 = lerp( temp_output_2_0_g11768 , localMyCustomExpression115_g11768 , _ColorReplaceFade);
				float4 appendResult4_g11768 = (float4(lerpResult112_g11768 , temp_output_1_0_g11768.a));
				float4 staticSwitch29_g11764 = appendResult4_g11768;
				#else
				float4 staticSwitch29_g11764 = staticSwitch9_g11764;
				#endif
				float4 temp_output_1_0_g11781 = staticSwitch29_g11764;
				#ifdef _ENABLENEGATIVE_ON
				float3 temp_output_9_0_g11781 = (temp_output_1_0_g11781).rgb;
				float3 lerpResult3_g11781 = lerp( temp_output_9_0_g11781 , ( 1.0 - temp_output_9_0_g11781 ) , _NegativeFade);
				float4 appendResult8_g11781 = (float4(lerpResult3_g11781 , temp_output_1_0_g11781.a));
				float4 staticSwitch4_g11781 = appendResult8_g11781;
				#else
				float4 staticSwitch4_g11781 = temp_output_1_0_g11781;
				#endif
				float4 temp_output_57_0_g11764 = staticSwitch4_g11781;
				#ifdef _ENABLECONTRAST_ON
				float4 temp_output_1_0_g11804 = temp_output_57_0_g11764;
				float3 temp_cast_30 = (max( _Contrast , 0.0001 )).xxx;
				float4 appendResult4_g11804 = (float4(pow( max( (temp_output_1_0_g11804).rgb , float3( 0.0001,0.0001,0.0001 ) ) , temp_cast_30 ) , temp_output_1_0_g11804.a));
				float4 staticSwitch32_g11764 = appendResult4_g11804;
				#else
				float4 staticSwitch32_g11764 = temp_output_57_0_g11764;
				#endif
				#ifdef _ENABLEBRIGHTNESS_ON
				float4 temp_output_2_0_g11779 = staticSwitch32_g11764;
				float4 appendResult6_g11779 = (float4(( (temp_output_2_0_g11779).rgb * _Brightness ) , temp_output_2_0_g11779.a));
				float4 staticSwitch33_g11764 = appendResult6_g11779;
				#else
				float4 staticSwitch33_g11764 = staticSwitch32_g11764;
				#endif
				#ifdef _ENABLEHUE_ON
				float4 temp_output_2_0_g11780 = staticSwitch33_g11764;
				float3 hsvTorgb1_g11780 = RGBToHSV( temp_output_2_0_g11780.rgb );
				float3 hsvTorgb3_g11780 = HSVToRGB( float3(( hsvTorgb1_g11780.x + _Hue ),hsvTorgb1_g11780.y,hsvTorgb1_g11780.z) );
				float4 appendResult8_g11780 = (float4(hsvTorgb3_g11780 , temp_output_2_0_g11780.a));
				float4 staticSwitch36_g11764 = appendResult8_g11780;
				#else
				float4 staticSwitch36_g11764 = staticSwitch33_g11764;
				#endif
				#ifdef _ENABLESPLITTONING_ON
				float4 temp_output_1_0_g11798 = staticSwitch36_g11764;
				float4 break2_g11799 = temp_output_1_0_g11798;
				float temp_output_3_0_g11798 = ( ( break2_g11799.x + break2_g11799.x + break2_g11799.y + break2_g11799.y + break2_g11799.y + break2_g11799.z ) / 6.0 );
				float clampResult25_g11798 = clamp( ( ( ( ( temp_output_3_0_g11798 + _SplitToningShift ) - 0.5 ) * _SplitToningBalance ) + 0.5 ) , 0.0 , 1.0 );
				float3 lerpResult6_g11798 = lerp( (_SplitToningShadowsColor).rgb , (_SplitToningHighlightsColor).rgb , clampResult25_g11798);
				float3 lerpResult11_g11798 = lerp( (temp_output_1_0_g11798).rgb , ( lerpResult6_g11798 * pow( max( temp_output_3_0_g11798 , 0.0001 ) , max( _SplitToningContrast , 0.0001 ) ) ) , _SplitToningFade);
				float4 appendResult18_g11798 = (float4(lerpResult11_g11798 , temp_output_1_0_g11798.a));
				float4 staticSwitch30_g11764 = appendResult18_g11798;
				#else
				float4 staticSwitch30_g11764 = staticSwitch36_g11764;
				#endif
				#ifdef _ENABLEBLACKTINT_ON
				float4 temp_output_1_0_g11776 = staticSwitch30_g11764;
				float3 temp_output_4_0_g11776 = (temp_output_1_0_g11776).rgb;
				float4 break12_g11776 = temp_output_1_0_g11776;
				float3 lerpResult7_g11776 = lerp( temp_output_4_0_g11776 , ( temp_output_4_0_g11776 + (_BlackTintColor).rgb ) , pow( max( ( 1.0 - min( max( max( break12_g11776.r , break12_g11776.g ) , break12_g11776.b ) , 1.0 ) ) , 0.0001 ) , max( _BlackTintPower , 0.0001 ) ));
				float3 lerpResult13_g11776 = lerp( temp_output_4_0_g11776 , lerpResult7_g11776 , _BlackTintFade);
				float4 appendResult11_g11776 = (float4(lerpResult13_g11776 , break12_g11776.a));
				float4 staticSwitch20_g11764 = appendResult11_g11776;
				#else
				float4 staticSwitch20_g11764 = staticSwitch30_g11764;
				#endif
				#ifdef _ENABLEINKSPREAD_ON
				float4 temp_output_1_0_g11790 = staticSwitch20_g11764;
				float4 break2_g11792 = temp_output_1_0_g11790;
				float2 temp_output_65_0_g11790 = shaderPosition235;
				float linValue16_g11791 = tex2D( _UberNoiseTexture, ( temp_output_65_0_g11790 * _InkSpreadNoiseScale ) ).r;
				float localMyCustomExpression16_g11791 = MyCustomExpression16_g11791( linValue16_g11791 );
				float clampResult53_g11790 = clamp( ( ( ( _InkSpreadDistance - distance( _InkSpreadPosition , temp_output_65_0_g11790 ) ) + ( localMyCustomExpression16_g11791 * _InkSpreadNoiseFactor ) ) / max( _InkSpreadWidth , 0.001 ) ) , 0.0 , 1.0 );
				float3 lerpResult7_g11790 = lerp( (temp_output_1_0_g11790).rgb , ( (_InkSpreadColor).rgb * pow( max( ( ( break2_g11792.x + break2_g11792.x + break2_g11792.y + break2_g11792.y + break2_g11792.y + break2_g11792.z ) / 6.0 ) , 0.0001 ) , max( _InkSpreadContrast , 0.0001 ) ) ) , ( _InkSpreadFade * clampResult53_g11790 ));
				float4 appendResult9_g11790 = (float4(lerpResult7_g11790 , (temp_output_1_0_g11790).a));
				float4 staticSwitch17_g11764 = appendResult9_g11790;
				#else
				float4 staticSwitch17_g11764 = staticSwitch20_g11764;
				#endif
				float temp_output_39_0_g11764 = shaderTime237;
				#ifdef _ENABLESHIFTHUE_ON
				float4 temp_output_1_0_g11782 = staticSwitch17_g11764;
				float3 hsvTorgb15_g11782 = RGBToHSV( (temp_output_1_0_g11782).rgb );
				float3 hsvTorgb19_g11782 = HSVToRGB( float3(( ( temp_output_39_0_g11764 * _ShiftHueSpeed ) + hsvTorgb15_g11782.x ),hsvTorgb15_g11782.y,hsvTorgb15_g11782.z) );
				float4 appendResult6_g11782 = (float4(hsvTorgb19_g11782 , temp_output_1_0_g11782.a));
				float4 staticSwitch19_g11764 = appendResult6_g11782;
				#else
				float4 staticSwitch19_g11764 = staticSwitch17_g11764;
				#endif
				#ifdef _ENABLEADDHUE_ON
				float3 hsvTorgb19_g11786 = HSVToRGB( float3(( ( temp_output_39_0_g11764 * _AddHueSpeed ) % 1.0 ),_AddHueSaturation,_AddHueBrightness) );
				float4 temp_output_1_0_g11786 = staticSwitch19_g11764;
				float4 break2_g11788 = temp_output_1_0_g11786;
				float2 uv_AddHueMask = IN.texcoord.xy * _AddHueMask_ST.xy + _AddHueMask_ST.zw;
				float4 tex2DNode3_g11787 = tex2D( _AddHueMask, uv_AddHueMask );
				#ifdef _ADDHUEMASKTOGGLE_ON
				float staticSwitch33_g11786 = ( _AddHueFade * ( tex2DNode3_g11787.r * tex2DNode3_g11787.a ) );
				#else
				float staticSwitch33_g11786 = _AddHueFade;
				#endif
				float4 appendResult6_g11786 = (float4(( ( hsvTorgb19_g11786 * pow( max( ( ( break2_g11788.x + break2_g11788.x + break2_g11788.y + break2_g11788.y + break2_g11788.y + break2_g11788.z ) / 6.0 ) , 0.0001 ) , max( _AddHueContrast , 0.0001 ) ) * staticSwitch33_g11786 ) + (temp_output_1_0_g11786).rgb ) , temp_output_1_0_g11786.a));
				float4 staticSwitch23_g11764 = appendResult6_g11786;
				#else
				float4 staticSwitch23_g11764 = staticSwitch19_g11764;
				#endif
				#ifdef _ENABLESINEGLOW_ON
				float4 temp_output_1_0_g11783 = staticSwitch23_g11764;
				float4 break2_g11784 = temp_output_1_0_g11783;
				float3 temp_output_13_0_g11783 = (_SineGlowColor).rgb;
				float2 uv_SineGlowMask = IN.texcoord.xy * _SineGlowMask_ST.xy + _SineGlowMask_ST.zw;
				float4 tex2DNode30_g11783 = tex2D( _SineGlowMask, uv_SineGlowMask );
				#ifdef _SINEGLOWMASKTOGGLE_ON
				float3 staticSwitch27_g11783 = ( (tex2DNode30_g11783).rgb * temp_output_13_0_g11783 * tex2DNode30_g11783.a );
				#else
				float3 staticSwitch27_g11783 = temp_output_13_0_g11783;
				#endif
				float4 appendResult21_g11783 = (float4(( (temp_output_1_0_g11783).rgb + ( pow( max( ( ( break2_g11784.x + break2_g11784.x + break2_g11784.y + break2_g11784.y + break2_g11784.y + break2_g11784.z ) / 6.0 ) , 0.0001 ) , max( _SineGlowContrast , 0.0001 ) ) * staticSwitch27_g11783 * _SineGlowFade * ( ( ( sin( ( temp_output_39_0_g11764 * _SineGlowFrequency ) ) + 1.0 ) * ( _SineGlowMax - _SineGlowMin ) ) + _SineGlowMin ) ) ) , temp_output_1_0_g11783.a));
				float4 staticSwitch28_g11764 = appendResult21_g11783;
				#else
				float4 staticSwitch28_g11764 = staticSwitch23_g11764;
				#endif
				#ifdef _ENABLESATURATION_ON
				float4 temp_output_1_0_g11771 = staticSwitch28_g11764;
				float4 break2_g11772 = temp_output_1_0_g11771;
				float3 temp_cast_46 = (( ( break2_g11772.x + break2_g11772.x + break2_g11772.y + break2_g11772.y + break2_g11772.y + break2_g11772.z ) / 6.0 )).xxx;
				float3 lerpResult5_g11771 = lerp( temp_cast_46 , (temp_output_1_0_g11771).rgb , _Saturation);
				float4 appendResult8_g11771 = (float4(lerpResult5_g11771 , temp_output_1_0_g11771.a));
				float4 staticSwitch38_g11764 = appendResult8_g11771;
				#else
				float4 staticSwitch38_g11764 = staticSwitch28_g11764;
				#endif
				#ifdef _ENABLEINNEROUTLINE_ON
				float4 temp_output_15_0_g11773 = staticSwitch38_g11764;
				float3 temp_output_82_0_g11773 = (_InnerOutlineColor).rgb;
				float2 temp_output_7_0_g11773 = temp_output_1_0_g11764;
				float temp_output_179_0_g11773 = temp_output_39_0_g11764;
				#ifdef _INNEROUTLINETEXTURETOGGLE_ON
				float3 staticSwitch187_g11773 = ( (tex2D( _InnerOutlineTintTexture, ( temp_output_7_0_g11773 + ( _InnerOutlineTextureSpeed * temp_output_179_0_g11773 ) ) )).rgb * temp_output_82_0_g11773 );
				#else
				float3 staticSwitch187_g11773 = temp_output_82_0_g11773;
				#endif
				float linValue16_g11775 = tex2D( _UberNoiseTexture, ( ( ( temp_output_179_0_g11773 * _InnerOutlineNoiseSpeed ) + temp_output_7_0_g11773 ) * _InnerOutlineNoiseScale ) ).r;
				float localMyCustomExpression16_g11775 = MyCustomExpression16_g11775( linValue16_g11775 );
				#ifdef _INNEROUTLINEDISTORTIONTOGGLE_ON
				float2 staticSwitch169_g11773 = ( ( localMyCustomExpression16_g11775 - 0.5 ) * _InnerOutlineDistortionIntensity );
				#else
				float2 staticSwitch169_g11773 = float2( 0,0 );
				#endif
				float2 temp_output_131_0_g11773 = ( staticSwitch169_g11773 + temp_output_7_0_g11773 );
				float2 appendResult2_g11774 = (float2(_MainTex_TexelSize.z , _MainTex_TexelSize.w));
				float2 temp_output_25_0_g11773 = ( 100.0 / appendResult2_g11774 );
				float temp_output_178_0_g11773 = ( _InnerOutlineFade * ( 1.0 - min( min( min( min( min( min( min( tex2D( _MainTex, ( temp_output_131_0_g11773 + ( ( _InnerOutlineWidth * float2( 0,-1 ) ) * temp_output_25_0_g11773 ) ) ).a , tex2D( _MainTex, ( temp_output_131_0_g11773 + ( ( _InnerOutlineWidth * float2( 0,1 ) ) * temp_output_25_0_g11773 ) ) ).a ) , tex2D( _MainTex, ( temp_output_131_0_g11773 + ( ( _InnerOutlineWidth * float2( -1,0 ) ) * temp_output_25_0_g11773 ) ) ).a ) , tex2D( _MainTex, ( temp_output_131_0_g11773 + ( ( _InnerOutlineWidth * float2( 1,0 ) ) * temp_output_25_0_g11773 ) ) ).a ) , tex2D( _MainTex, ( temp_output_131_0_g11773 + ( ( _InnerOutlineWidth * float2( 0.705,0.705 ) ) * temp_output_25_0_g11773 ) ) ).a ) , tex2D( _MainTex, ( temp_output_131_0_g11773 + ( ( _InnerOutlineWidth * float2( -0.705,0.705 ) ) * temp_output_25_0_g11773 ) ) ).a ) , tex2D( _MainTex, ( temp_output_131_0_g11773 + ( ( _InnerOutlineWidth * float2( 0.705,-0.705 ) ) * temp_output_25_0_g11773 ) ) ).a ) , tex2D( _MainTex, ( temp_output_131_0_g11773 + ( ( _InnerOutlineWidth * float2( -0.705,-0.705 ) ) * temp_output_25_0_g11773 ) ) ).a ) ) );
				float3 lerpResult176_g11773 = lerp( (temp_output_15_0_g11773).rgb , staticSwitch187_g11773 , temp_output_178_0_g11773);
				#ifdef _INNEROUTLINEOUTLINEONLYTOGGLE_ON
				float staticSwitch188_g11773 = ( temp_output_178_0_g11773 * temp_output_15_0_g11773.a );
				#else
				float staticSwitch188_g11773 = temp_output_15_0_g11773.a;
				#endif
				float4 appendResult177_g11773 = (float4(lerpResult176_g11773 , staticSwitch188_g11773));
				float4 staticSwitch12_g11764 = appendResult177_g11773;
				#else
				float4 staticSwitch12_g11764 = staticSwitch38_g11764;
				#endif
				#ifdef _ENABLEOUTEROUTLINE_ON
				float4 temp_output_15_0_g11801 = staticSwitch12_g11764;
				float3 temp_output_82_0_g11801 = (_OuterOutlineColor).rgb;
				float2 temp_output_7_0_g11801 = temp_output_1_0_g11764;
				float temp_output_186_0_g11801 = temp_output_39_0_g11764;
				#ifdef _OUTEROUTLINETEXTURETOGGLE_ON
				float3 staticSwitch199_g11801 = ( (tex2D( _OuterOutlineTintTexture, ( temp_output_7_0_g11801 + ( _OuterOutlineTextureSpeed * temp_output_186_0_g11801 ) ) )).rgb * temp_output_82_0_g11801 );
				#else
				float3 staticSwitch199_g11801 = temp_output_82_0_g11801;
				#endif
				float temp_output_182_0_g11801 = ( ( 1.0 - temp_output_15_0_g11801.a ) * min( ( _OuterOutlineFade * 3.0 ) , 1.0 ) );
				#ifdef _OUTEROUTLINEOUTLINEONLYTOGGLE_ON
				float staticSwitch203_g11801 = 1.0;
				#else
				float staticSwitch203_g11801 = temp_output_182_0_g11801;
				#endif
				float3 lerpResult178_g11801 = lerp( (temp_output_15_0_g11801).rgb , staticSwitch199_g11801 , staticSwitch203_g11801);
				float3 lerpResult170_g11801 = lerp( lerpResult178_g11801 , staticSwitch199_g11801 , staticSwitch203_g11801);
				float linValue16_g11802 = tex2D( _UberNoiseTexture, ( ( ( temp_output_186_0_g11801 * _OuterOutlineNoiseSpeed ) + temp_output_7_0_g11801 ) * _OuterOutlineNoiseScale ) ).r;
				float localMyCustomExpression16_g11802 = MyCustomExpression16_g11802( linValue16_g11802 );
				#ifdef _OUTEROUTLINEDISTORTIONTOGGLE_ON
				float2 staticSwitch157_g11801 = ( ( localMyCustomExpression16_g11802 - 0.5 ) * _OuterOutlineDistortionIntensity );
				#else
				float2 staticSwitch157_g11801 = float2( 0,0 );
				#endif
				float2 temp_output_131_0_g11801 = ( staticSwitch157_g11801 + temp_output_7_0_g11801 );
				float2 appendResult2_g11803 = (float2(_MainTex_TexelSize.z , _MainTex_TexelSize.w));
				float2 temp_output_25_0_g11801 = ( 100.0 / appendResult2_g11803 );
				float lerpResult168_g11801 = lerp( temp_output_15_0_g11801.a , min( ( max( max( max( max( max( max( max( tex2D( _MainTex, ( temp_output_131_0_g11801 + ( ( _OuterOutlineWidth * float2( 0,-1 ) ) * temp_output_25_0_g11801 ) ) ).a , tex2D( _MainTex, ( temp_output_131_0_g11801 + ( ( _OuterOutlineWidth * float2( 0,1 ) ) * temp_output_25_0_g11801 ) ) ).a ) , tex2D( _MainTex, ( temp_output_131_0_g11801 + ( ( _OuterOutlineWidth * float2( -1,0 ) ) * temp_output_25_0_g11801 ) ) ).a ) , tex2D( _MainTex, ( temp_output_131_0_g11801 + ( ( _OuterOutlineWidth * float2( 1,0 ) ) * temp_output_25_0_g11801 ) ) ).a ) , tex2D( _MainTex, ( temp_output_131_0_g11801 + ( ( _OuterOutlineWidth * float2( 0.705,0.705 ) ) * temp_output_25_0_g11801 ) ) ).a ) , tex2D( _MainTex, ( temp_output_131_0_g11801 + ( ( _OuterOutlineWidth * float2( -0.705,0.705 ) ) * temp_output_25_0_g11801 ) ) ).a ) , tex2D( _MainTex, ( temp_output_131_0_g11801 + ( ( _OuterOutlineWidth * float2( 0.705,-0.705 ) ) * temp_output_25_0_g11801 ) ) ).a ) , tex2D( _MainTex, ( temp_output_131_0_g11801 + ( ( _OuterOutlineWidth * float2( -0.705,-0.705 ) ) * temp_output_25_0_g11801 ) ) ).a ) * 3.0 ) , 1.0 ) , _OuterOutlineFade);
				#ifdef _OUTEROUTLINEOUTLINEONLYTOGGLE_ON
				float staticSwitch200_g11801 = ( temp_output_182_0_g11801 * lerpResult168_g11801 );
				#else
				float staticSwitch200_g11801 = lerpResult168_g11801;
				#endif
				float4 appendResult174_g11801 = (float4(lerpResult170_g11801 , staticSwitch200_g11801));
				float4 staticSwitch13_g11764 = appendResult174_g11801;
				#else
				float4 staticSwitch13_g11764 = staticSwitch12_g11764;
				#endif
				#ifdef _ENABLEPIXELOUTLINE_ON
				float4 temp_output_15_0_g11778 = staticSwitch13_g11764;
				float3 temp_output_82_0_g11778 = (_PixelOutlineColor).rgb;
				float2 temp_output_7_0_g11778 = temp_output_1_0_g11764;
				#ifdef _PIXELOUTLINETEXTURETOGGLE_ON
				float3 staticSwitch199_g11778 = ( (tex2D( _PixelOutlineTintTexture, ( temp_output_7_0_g11778 + ( _PixelOutlineTextureSpeed * temp_output_39_0_g11764 ) ) )).rgb * temp_output_82_0_g11778 );
				#else
				float3 staticSwitch199_g11778 = temp_output_82_0_g11778;
				#endif
				float temp_output_213_0_g11778 = ( _PixelOutlineFade * step( temp_output_15_0_g11778.a , _PixelOutlineAlphaLimit ) );
				float temp_output_182_0_g11778 = ( ( 1.0 - temp_output_15_0_g11778.a ) * min( ( temp_output_213_0_g11778 * 3.0 ) , 1.0 ) );
				#ifdef _PIXELOUTLINEOUTLINEONLYTOGGLE_ON
				float staticSwitch203_g11778 = 1.0;
				#else
				float staticSwitch203_g11778 = temp_output_182_0_g11778;
				#endif
				float3 lerpResult178_g11778 = lerp( (temp_output_15_0_g11778).rgb , staticSwitch199_g11778 , staticSwitch203_g11778);
				float3 lerpResult170_g11778 = lerp( lerpResult178_g11778 , staticSwitch199_g11778 , staticSwitch203_g11778);
				float2 appendResult206_g11778 = (float2(_MainTex_TexelSize.z , _MainTex_TexelSize.w));
				float2 temp_output_209_0_g11778 = ( float2( 1,1 ) / appendResult206_g11778 );
				float lerpResult168_g11778 = lerp( temp_output_15_0_g11778.a , min( ( max( max( max( tex2D( _MainTex, ( temp_output_7_0_g11778 + ( ( _PixelOutlineWidth * float2( 0,-1 ) ) * temp_output_209_0_g11778 ) ) ).a , tex2D( _MainTex, ( temp_output_7_0_g11778 + ( ( _PixelOutlineWidth * float2( 0,1 ) ) * temp_output_209_0_g11778 ) ) ).a ) , tex2D( _MainTex, ( temp_output_7_0_g11778 + ( ( _PixelOutlineWidth * float2( -1,0 ) ) * temp_output_209_0_g11778 ) ) ).a ) , tex2D( _MainTex, ( temp_output_7_0_g11778 + ( ( _PixelOutlineWidth * float2( 1,0 ) ) * temp_output_209_0_g11778 ) ) ).a ) * 3.0 ) , 1.0 ) , temp_output_213_0_g11778);
				#ifdef _PIXELOUTLINEOUTLINEONLYTOGGLE_ON
				float staticSwitch200_g11778 = ( temp_output_182_0_g11778 * lerpResult168_g11778 );
				#else
				float staticSwitch200_g11778 = lerpResult168_g11778;
				#endif
				float4 appendResult174_g11778 = (float4(lerpResult170_g11778 , staticSwitch200_g11778));
				float4 staticSwitch48_g11764 = appendResult174_g11778;
				#else
				float4 staticSwitch48_g11764 = staticSwitch13_g11764;
				#endif
				#ifdef _ENABLEPINGPONGGLOW_ON
				float3 lerpResult15_g11765 = lerp( (_PingPongGlowFrom).rgb , (_PingPongGlowTo).rgb , ( ( sin( ( temp_output_39_0_g11764 * _PingPongGlowFrequency ) ) + 1.0 ) / 2.0 ));
				float4 temp_output_5_0_g11765 = staticSwitch48_g11764;
				float4 break2_g11766 = temp_output_5_0_g11765;
				float4 appendResult12_g11765 = (float4(( ( lerpResult15_g11765 * _PingPongGlowFade * pow( max( ( ( break2_g11766.x + break2_g11766.x + break2_g11766.y + break2_g11766.y + break2_g11766.y + break2_g11766.z ) / 6.0 ) , 0.0001 ) , max( _PingPongGlowContrast , 0.0001 ) ) ) + (temp_output_5_0_g11765).rgb ) , temp_output_5_0_g11765.a));
				float4 staticSwitch46_g11764 = appendResult12_g11765;
				#else
				float4 staticSwitch46_g11764 = staticSwitch48_g11764;
				#endif
				float4 temp_output_361_0 = staticSwitch46_g11764;
				#ifdef _ENABLEHOLOGRAM_ON
				float4 temp_output_1_0_g11806 = temp_output_361_0;
				float4 break2_g11807 = temp_output_1_0_g11806;
				float temp_output_44_0_g11806 = unity_OrthoParams.y;
				float4 appendResult22_g11806 = (float4(( (_HologramTint).rgb * pow( max( ( ( break2_g11807.x + break2_g11807.x + break2_g11807.y + break2_g11807.y + break2_g11807.y + break2_g11807.z ) / 6.0 ) , 0.0001 ) , max( _HologramContrast , 0.0001 ) ) ) , ( max( pow( abs( sin( ( ( ( ( shaderTime237 * ( _HologramLineSpeed * temp_output_44_0_g11806 * 0.2 ) ) + ase_positionWS.y ) / temp_output_44_0_g11806 ) * _HologramLineFrequency ) ) ) , _HologramLineGap ) , _HologramMinAlpha ) * temp_output_1_0_g11806.a )));
				float4 lerpResult37_g11806 = lerp( temp_output_1_0_g11806 , appendResult22_g11806 , hologramFade182);
				float4 staticSwitch56 = lerpResult37_g11806;
				#else
				float4 staticSwitch56 = temp_output_361_0;
				#endif
				#ifdef _ENABLEGLITCH_ON
				float4 temp_output_1_0_g11809 = staticSwitch56;
				float4 break2_g11811 = temp_output_1_0_g11809;
				float temp_output_34_0_g11809 = shaderTime237;
				float linValue16_g11810 = tex2D( _UberNoiseTexture, ( ( glitchPosition154 + ( _GlitchNoiseSpeed * temp_output_34_0_g11809 ) ) * _GlitchNoiseScale ) ).r;
				float localMyCustomExpression16_g11810 = MyCustomExpression16_g11810( linValue16_g11810 );
				float3 hsvTorgb3_g11812 = HSVToRGB( float3(( localMyCustomExpression16_g11810 + ( temp_output_34_0_g11809 * _GlitchHueSpeed ) ),1.0,1.0) );
				float3 lerpResult23_g11809 = lerp( (temp_output_1_0_g11809).rgb , ( ( ( break2_g11811.x + break2_g11811.x + break2_g11811.y + break2_g11811.y + break2_g11811.y + break2_g11811.z ) / 6.0 ) * _GlitchBrightness * hsvTorgb3_g11812 ) , glitchFade152);
				float4 appendResult27_g11809 = (float4(lerpResult23_g11809 , temp_output_1_0_g11809.a));
				float4 staticSwitch57 = appendResult27_g11809;
				#else
				float4 staticSwitch57 = staticSwitch56;
				#endif
				float4 temp_output_3_0_g11813 = staticSwitch57;
				float4 temp_output_1_0_g11843 = temp_output_3_0_g11813;
				float2 temp_output_41_0_g11813 = shaderPosition235;
				float2 temp_output_99_0_g11843 = temp_output_41_0_g11813;
				float temp_output_40_0_g11813 = shaderTime237;
				#ifdef _ENABLECAMOUFLAGE_ON
				float linValue16_g11848 = tex2D( _UberNoiseTexture, ( ( ( temp_output_40_0_g11813 * _CamouflageDistortionSpeed ) + temp_output_99_0_g11843 ) * _CamouflageDistortionScale ) ).r;
				float localMyCustomExpression16_g11848 = MyCustomExpression16_g11848( linValue16_g11848 );
				#ifdef _CAMOUFLAGEANIMATIONTOGGLE_ON
				float2 staticSwitch101_g11843 = ( ( ( localMyCustomExpression16_g11848 - 0.25 ) * _CamouflageDistortionIntensity ) + temp_output_99_0_g11843 );
				#else
				float2 staticSwitch101_g11843 = temp_output_99_0_g11843;
				#endif
				float linValue16_g11845 = tex2D( _UberNoiseTexture, ( staticSwitch101_g11843 * _CamouflageNoiseScaleA ) ).r;
				float localMyCustomExpression16_g11845 = MyCustomExpression16_g11845( linValue16_g11845 );
				float clampResult52_g11843 = clamp( ( ( _CamouflageDensityA - localMyCustomExpression16_g11845 ) / max( _CamouflageSmoothnessA , 0.005 ) ) , 0.0 , 1.0 );
				float4 lerpResult55_g11843 = lerp( _CamouflageBaseColor , ( _CamouflageColorA * clampResult52_g11843 ) , clampResult52_g11843);
				float linValue16_g11847 = tex2D( _UberNoiseTexture, ( ( staticSwitch101_g11843 + float2( 12.3,12.3 ) ) * _CamouflageNoiseScaleB ) ).r;
				float localMyCustomExpression16_g11847 = MyCustomExpression16_g11847( linValue16_g11847 );
				float clampResult65_g11843 = clamp( ( ( _CamouflageDensityB - localMyCustomExpression16_g11847 ) / max( _CamouflageSmoothnessB , 0.005 ) ) , 0.0 , 1.0 );
				float4 lerpResult68_g11843 = lerp( lerpResult55_g11843 , ( _CamouflageColorB * clampResult65_g11843 ) , clampResult65_g11843);
				float4 break2_g11846 = temp_output_1_0_g11843;
				float3 lerpResult4_g11843 = lerp( (temp_output_1_0_g11843).rgb , ( (lerpResult68_g11843).rgb * pow( max( ( ( break2_g11846.x + break2_g11846.x + break2_g11846.y + break2_g11846.y + break2_g11846.y + break2_g11846.z ) / 6.0 ) , 0.0001 ) , max( _CamouflageContrast , 0.0001 ) ) ) , _CamouflageFade);
				float4 appendResult7_g11843 = (float4(lerpResult4_g11843 , temp_output_1_0_g11843.a));
				float4 staticSwitch26_g11813 = appendResult7_g11843;
				#else
				float4 staticSwitch26_g11813 = temp_output_3_0_g11813;
				#endif
				#ifdef _ENABLEMETAL_ON
				float4 temp_output_1_0_g11836 = staticSwitch26_g11813;
				float temp_output_59_0_g11836 = temp_output_40_0_g11813;
				float2 temp_output_58_0_g11836 = temp_output_41_0_g11813;
				float linValue16_g11837 = tex2D( _UberNoiseTexture, ( ( ( temp_output_59_0_g11836 * _MetalNoiseDistortionSpeed ) + temp_output_58_0_g11836 ) * _MetalNoiseDistortionScale ) ).r;
				float localMyCustomExpression16_g11837 = MyCustomExpression16_g11837( linValue16_g11837 );
				float linValue16_g11839 = tex2D( _UberNoiseTexture, ( ( ( ( localMyCustomExpression16_g11837 - 0.25 ) * _MetalNoiseDistortion ) + ( ( temp_output_59_0_g11836 * _MetalNoiseSpeed ) + temp_output_58_0_g11836 ) ) * _MetalNoiseScale ) ).r;
				float localMyCustomExpression16_g11839 = MyCustomExpression16_g11839( linValue16_g11839 );
				float4 break2_g11838 = temp_output_1_0_g11836;
				float temp_output_5_0_g11836 = ( ( break2_g11838.x + break2_g11838.x + break2_g11838.y + break2_g11838.y + break2_g11838.y + break2_g11838.z ) / 6.0 );
				float2 uv_MetalMask = IN.texcoord.xy * _MetalMask_ST.xy + _MetalMask_ST.zw;
				float4 tex2DNode3_g11841 = tex2D( _MetalMask, uv_MetalMask );
				#ifdef _METALMASKTOGGLE_ON
				float staticSwitch60_g11836 = ( _MetalFade * ( tex2DNode3_g11841.r * tex2DNode3_g11841.a ) );
				#else
				float staticSwitch60_g11836 = _MetalFade;
				#endif
				float4 lerpResult45_g11836 = lerp( temp_output_1_0_g11836 , ( ( max( ( ( _MetalHighlightDensity - localMyCustomExpression16_g11839 ) / max( _MetalHighlightDensity , 0.01 ) ) , 0.0 ) * _MetalHighlightColor * pow( max( temp_output_5_0_g11836 , 0.0001 ) , max( _MetalHighlightContrast , 0.0001 ) ) ) + ( pow( max( temp_output_5_0_g11836 , 0.0001 ) , max( _MetalContrast , 0.0001 ) ) * _MetalColor ) ) , staticSwitch60_g11836);
				float4 appendResult8_g11836 = (float4((lerpResult45_g11836).rgb , (temp_output_1_0_g11836).a));
				float4 staticSwitch28_g11813 = appendResult8_g11836;
				#else
				float4 staticSwitch28_g11813 = staticSwitch26_g11813;
				#endif
				#ifdef _ENABLEFROZEN_ON
				float4 temp_output_1_0_g11828 = staticSwitch28_g11813;
				float4 break2_g11829 = temp_output_1_0_g11828;
				float temp_output_7_0_g11828 = ( ( break2_g11829.x + break2_g11829.x + break2_g11829.y + break2_g11829.y + break2_g11829.y + break2_g11829.z ) / 6.0 );
				float2 temp_output_72_0_g11828 = temp_output_41_0_g11813;
				float linValue16_g11830 = tex2D( _UberNoiseTexture, ( temp_output_72_0_g11828 * _FrozenSnowScale ) ).r;
				float localMyCustomExpression16_g11830 = MyCustomExpression16_g11830( linValue16_g11830 );
				float temp_output_73_0_g11828 = temp_output_40_0_g11813;
				float linValue16_g11832 = tex2D( _UberNoiseTexture, ( ( ( temp_output_73_0_g11828 * _FrozenHighlightDistortionSpeed ) + temp_output_72_0_g11828 ) * _FrozenHighlightDistortionScale ) ).r;
				float localMyCustomExpression16_g11832 = MyCustomExpression16_g11832( linValue16_g11832 );
				float linValue16_g11833 = tex2D( _UberNoiseTexture, ( ( ( ( localMyCustomExpression16_g11832 - 0.25 ) * _FrozenHighlightDistortion ) + ( ( temp_output_73_0_g11828 * _FrozenHighlightSpeed ) + temp_output_72_0_g11828 ) ) * _FrozenHighlightScale ) ).r;
				float localMyCustomExpression16_g11833 = MyCustomExpression16_g11833( linValue16_g11833 );
				float3 lerpResult57_g11828 = lerp( (temp_output_1_0_g11828).rgb , ( ( pow( max( temp_output_7_0_g11828 , 0.0001 ) , max( _FrozenContrast , 0.0001 ) ) * (_FrozenTint).rgb ) + ( pow( max( temp_output_7_0_g11828 , 0.0001 ) , max( _FrozenSnowContrast , 0.0001 ) ) * ( (_FrozenSnowColor).rgb * max( ( _FrozenSnowDensity - localMyCustomExpression16_g11830 ) , 0.0 ) ) ) + (( max( ( ( _FrozenHighlightDensity - localMyCustomExpression16_g11833 ) / max( _FrozenHighlightDensity , 0.01 ) ) , 0.0 ) * _FrozenHighlightColor * pow( max( temp_output_7_0_g11828 , 0.0001 ) , max( _FrozenHighlightContrast , 0.0001 ) ) )).rgb ) , _FrozenFade);
				float4 appendResult26_g11828 = (float4(lerpResult57_g11828 , temp_output_1_0_g11828.a));
				float4 staticSwitch29_g11813 = appendResult26_g11828;
				#else
				float4 staticSwitch29_g11813 = staticSwitch28_g11813;
				#endif
				#ifdef _ENABLEBURN_ON
				float4 temp_output_1_0_g11822 = staticSwitch29_g11813;
				float3 temp_output_28_0_g11822 = (temp_output_1_0_g11822).rgb;
				float4 break2_g11826 = float4( temp_output_28_0_g11822 , 0.0 );
				float2 temp_output_72_0_g11822 = temp_output_41_0_g11813;
				float linValue16_g11825 = tex2D( _UberNoiseTexture, ( temp_output_72_0_g11822 * _BurnSwirlNoiseScale ) ).r;
				float localMyCustomExpression16_g11825 = MyCustomExpression16_g11825( linValue16_g11825 );
				float linValue16_g11823 = tex2D( _UberNoiseTexture, ( ( ( ( localMyCustomExpression16_g11825 - 0.5 ) * float2( 1,1 ) * _BurnSwirlFactor ) + temp_output_72_0_g11822 ) * _BurnInsideNoiseScale ) ).r;
				float localMyCustomExpression16_g11823 = MyCustomExpression16_g11823( linValue16_g11823 );
				float clampResult68_g11822 = clamp( ( _BurnInsideNoiseFactor - localMyCustomExpression16_g11823 ) , 0.0 , 1.0 );
				float linValue16_g11824 = tex2D( _UberNoiseTexture, ( temp_output_72_0_g11822 * _BurnEdgeNoiseScale ) ).r;
				float localMyCustomExpression16_g11824 = MyCustomExpression16_g11824( linValue16_g11824 );
				float temp_output_15_0_g11822 = ( ( ( _BurnRadius - distance( temp_output_72_0_g11822 , _BurnPosition ) ) + ( localMyCustomExpression16_g11824 * _BurnEdgeNoiseFactor ) ) / max( _BurnWidth , 0.01 ) );
				float clampResult18_g11822 = clamp( temp_output_15_0_g11822 , 0.0 , 1.0 );
				float3 lerpResult29_g11822 = lerp( temp_output_28_0_g11822 , ( pow( max( ( ( break2_g11826.x + break2_g11826.x + break2_g11826.y + break2_g11826.y + break2_g11826.y + break2_g11826.z ) / 6.0 ) , 0.0001 ) , max( _BurnInsideContrast , 0.0001 ) ) * ( ( (_BurnInsideNoiseColor).rgb * clampResult68_g11822 ) + (_BurnInsideColor).rgb ) ) , clampResult18_g11822);
				float3 lerpResult40_g11822 = lerp( temp_output_28_0_g11822 , ( lerpResult29_g11822 + ( ( step( temp_output_15_0_g11822 , 1.0 ) * step( 0.0 , temp_output_15_0_g11822 ) ) * (_BurnEdgeColor).rgb ) ) , _BurnFade);
				float4 appendResult43_g11822 = (float4(lerpResult40_g11822 , temp_output_1_0_g11822.a));
				float4 staticSwitch32_g11813 = appendResult43_g11822;
				#else
				float4 staticSwitch32_g11813 = staticSwitch29_g11813;
				#endif
				#ifdef _ENABLERAINBOW_ON
				float2 temp_output_42_0_g11818 = temp_output_41_0_g11813;
				float linValue16_g11819 = tex2D( _UberNoiseTexture, ( temp_output_42_0_g11818 * _RainbowNoiseScale ) ).r;
				float localMyCustomExpression16_g11819 = MyCustomExpression16_g11819( linValue16_g11819 );
				float3 hsvTorgb3_g11821 = HSVToRGB( float3(( ( ( distance( temp_output_42_0_g11818 , _RainbowCenter ) + ( localMyCustomExpression16_g11819 * _RainbowNoiseFactor ) ) * _RainbowDensity ) + ( _RainbowSpeed * temp_output_40_0_g11813 ) ),1.0,1.0) );
				float3 hsvTorgb36_g11818 = RGBToHSV( hsvTorgb3_g11821 );
				float3 hsvTorgb37_g11818 = HSVToRGB( float3(hsvTorgb36_g11818.x,_RainbowSaturation,( hsvTorgb36_g11818.z * _RainbowBrightness )) );
				float4 temp_output_1_0_g11818 = staticSwitch32_g11813;
				float4 break2_g11820 = temp_output_1_0_g11818;
				float saferPower24_g11818 = abs( ( ( break2_g11820.x + break2_g11820.x + break2_g11820.y + break2_g11820.y + break2_g11820.y + break2_g11820.z ) / 6.0 ) );
				float4 appendResult29_g11818 = (float4(( ( hsvTorgb37_g11818 * pow( saferPower24_g11818 , max( _RainbowContrast , 0.001 ) ) * _RainbowFade ) + (temp_output_1_0_g11818).rgb ) , temp_output_1_0_g11818.a));
				float4 staticSwitch34_g11813 = appendResult29_g11818;
				#else
				float4 staticSwitch34_g11813 = staticSwitch32_g11813;
				#endif
				#ifdef _ENABLESHINE_ON
				float4 temp_output_1_0_g11814 = staticSwitch34_g11813;
				float3 temp_output_57_0_g11814 = (temp_output_1_0_g11814).rgb;
				float4 break2_g11816 = temp_output_1_0_g11814;
				float3 temp_cast_69 = (( ( break2_g11816.x + break2_g11816.x + break2_g11816.y + break2_g11816.y + break2_g11816.y + break2_g11816.z ) / 6.0 )).xxx;
				float3 lerpResult92_g11814 = lerp( temp_cast_69 , temp_output_57_0_g11814 , _ShineSaturation);
				float3 temp_cast_70 = (max( max( _ShineContrast , 0.001 ) , 0.0001 )).xxx;
				float3 rotatedValue69_g11814 = RotateAroundAxis( float3( 0,0,0 ), float3( ( _ShineFrequency * temp_output_41_0_g11813 ) ,  0.0 ), float3( 0,0,1 ), ( ( _ShineRotation / 180.0 ) * UNITY_PI ) );
				float temp_output_103_0_g11814 = ( _ShineFrequency * _ShineWidth );
				float clampResult80_g11814 = clamp( ( ( ( sin( ( rotatedValue69_g11814.x - ( temp_output_40_0_g11813 * _ShineSpeed * _ShineFrequency ) ) ) - ( 1.0 - temp_output_103_0_g11814 ) ) / temp_output_103_0_g11814 ) * _ShineSmooth ) , 0.0 , 1.0 );
				float2 uv_ShineMask = IN.texcoord.xy * _ShineMask_ST.xy + _ShineMask_ST.zw;
				float4 tex2DNode3_g11815 = tex2D( _ShineMask, uv_ShineMask );
				#ifdef _SHINEMASKTOGGLE_ON
				float staticSwitch98_g11814 = ( _ShineFade * ( tex2DNode3_g11815.r * tex2DNode3_g11815.a ) );
				#else
				float staticSwitch98_g11814 = _ShineFade;
				#endif
				float4 appendResult8_g11814 = (float4(( temp_output_57_0_g11814 + ( ( pow( max( lerpResult92_g11814 , float3( 0.0001,0.0001,0.0001 ) ) , temp_cast_70 ) * (_ShineColor).rgb ) * clampResult80_g11814 * staticSwitch98_g11814 ) ) , (temp_output_1_0_g11814).a));
				float4 staticSwitch36_g11813 = appendResult8_g11814;
				#else
				float4 staticSwitch36_g11813 = staticSwitch34_g11813;
				#endif
				#ifdef _ENABLEPOISON_ON
				float temp_output_41_0_g11849 = temp_output_40_0_g11813;
				float linValue16_g11851 = tex2D( _UberNoiseTexture, ( ( ( temp_output_41_0_g11849 * _PoisonNoiseSpeed ) + temp_output_41_0_g11813 ) * _PoisonNoiseScale ) ).r;
				float localMyCustomExpression16_g11851 = MyCustomExpression16_g11851( linValue16_g11851 );
				float3 temp_output_24_0_g11849 = (_PoisonColor).rgb;
				float4 temp_output_1_0_g11849 = staticSwitch36_g11813;
				float3 temp_output_28_0_g11849 = (temp_output_1_0_g11849).rgb;
				float4 break2_g11850 = float4( temp_output_28_0_g11849 , 0.0 );
				float3 lerpResult32_g11849 = lerp( temp_output_28_0_g11849 , ( temp_output_24_0_g11849 * ( ( break2_g11850.x + break2_g11850.x + break2_g11850.y + break2_g11850.y + break2_g11850.y + break2_g11850.z ) / 6.0 ) ) , ( _PoisonFade * _PoisonRecolorFactor ));
				float4 appendResult27_g11849 = (float4(( ( max( pow( max( abs( ( ( ( localMyCustomExpression16_g11851 + ( temp_output_41_0_g11849 * _PoisonShiftSpeed ) ) % 1.0 ) + -0.5 ) ) , 0.0001 ) , max( _PoisonDensity , 0.0001 ) ) , 0.0 ) * temp_output_24_0_g11849 * _PoisonFade * _PoisonNoiseBrightness ) + lerpResult32_g11849 ) , temp_output_1_0_g11849.a));
				float4 staticSwitch39_g11813 = appendResult27_g11849;
				#else
				float4 staticSwitch39_g11813 = staticSwitch36_g11813;
				#endif
				float4 temp_output_10_0_g11853 = staticSwitch39_g11813;
				#ifdef _ENABLEENCHANTED_ON
				float3 temp_output_12_0_g11853 = (temp_output_10_0_g11853).rgb;
				float2 temp_output_2_0_g11853 = temp_output_41_0_g11813;
				float temp_output_1_0_g11853 = temp_output_40_0_g11813;
				float2 temp_output_6_0_g11853 = ( temp_output_1_0_g11853 * _EnchantedSpeed );
				float linValue16_g11856 = tex2D( _UberNoiseTexture, ( ( ( temp_output_2_0_g11853 - ( ( temp_output_6_0_g11853 + float2( 1.234,5.6789 ) ) * float2( 0.95,1.05 ) ) ) * _EnchantedScale ) * float2( 1,1 ) ) ).r;
				float localMyCustomExpression16_g11856 = MyCustomExpression16_g11856( linValue16_g11856 );
				float linValue16_g11854 = tex2D( _UberNoiseTexture, ( ( ( temp_output_6_0_g11853 + temp_output_2_0_g11853 ) * _EnchantedScale ) * float2( 1,1 ) ) ).r;
				float localMyCustomExpression16_g11854 = MyCustomExpression16_g11854( linValue16_g11854 );
				float temp_output_36_0_g11853 = ( localMyCustomExpression16_g11856 + localMyCustomExpression16_g11854 );
				float temp_output_43_0_g11853 = ( temp_output_36_0_g11853 * 0.5 );
				float3 lerpResult42_g11853 = lerp( (_EnchantedLowColor).rgb , (_EnchantedHighColor).rgb , temp_output_43_0_g11853);
				float3 hsvTorgb53_g11853 = HSVToRGB( float3(( ( temp_output_43_0_g11853 * _EnchantedRainbowDensity ) + ( _EnchantedRainbowSpeed * temp_output_1_0_g11853 ) ),_EnchantedRainbowSaturation,1.0) );
				#ifdef _ENCHANTEDRAINBOWTOGGLE_ON
				float3 staticSwitch50_g11853 = hsvTorgb53_g11853;
				#else
				float3 staticSwitch50_g11853 = lerpResult42_g11853;
				#endif
				float4 break2_g11855 = temp_output_10_0_g11853;
				float3 temp_output_40_0_g11853 = ( staticSwitch50_g11853 * pow( max( ( ( break2_g11855.x + break2_g11855.x + break2_g11855.y + break2_g11855.y + break2_g11855.y + break2_g11855.z ) / 6.0 ) , 0.0001 ) , max( _EnchantedContrast , 0.0001 ) ) * _EnchantedBrightness );
				float temp_output_45_0_g11853 = ( max( ( temp_output_36_0_g11853 - _EnchantedReduce ) , 0.0 ) * _EnchantedFade );
				float3 lerpResult44_g11853 = lerp( temp_output_12_0_g11853 , temp_output_40_0_g11853 , temp_output_45_0_g11853);
				#ifdef _ENCHANTEDLERPTOGGLE_ON
				float3 staticSwitch47_g11853 = lerpResult44_g11853;
				#else
				float3 staticSwitch47_g11853 = ( temp_output_12_0_g11853 + ( temp_output_40_0_g11853 * temp_output_45_0_g11853 ) );
				#endif
				float4 appendResult19_g11853 = (float4(staticSwitch47_g11853 , temp_output_10_0_g11853.a));
				float4 staticSwitch11_g11853 = appendResult19_g11853;
				#else
				float4 staticSwitch11_g11853 = temp_output_10_0_g11853;
				#endif
				float4 temp_output_1_0_g11858 = staticSwitch11_g11853;
				#ifdef _ENABLESHIFTING_ON
				float4 break5_g11858 = temp_output_1_0_g11858;
				float3 appendResult32_g11858 = (float3(break5_g11858.r , break5_g11858.g , break5_g11858.b));
				float4 break2_g11859 = temp_output_1_0_g11858;
				float temp_output_4_0_g11858 = ( ( break2_g11859.x + break2_g11859.x + break2_g11859.y + break2_g11859.y + break2_g11859.y + break2_g11859.z ) / 6.0 );
				float temp_output_11_0_g11858 = ( ( ( temp_output_4_0_g11858 + ( temp_output_40_0_g11813 * _ShiftingSpeed ) ) * _ShiftingDensity ) % 1.0 );
				float3 lerpResult20_g11858 = lerp( (_ShiftingColorA).rgb , (_ShiftingColorB).rgb , ( abs( ( temp_output_11_0_g11858 - 0.5 ) ) * 2.0 ));
				float3 hsvTorgb12_g11858 = HSVToRGB( float3(temp_output_11_0_g11858,_ShiftingSaturation,_ShiftingBrightness) );
				#ifdef _SHIFTINGRAINBOWTOGGLE_ON
				float3 staticSwitch26_g11858 = hsvTorgb12_g11858;
				#else
				float3 staticSwitch26_g11858 = ( lerpResult20_g11858 * _ShiftingBrightness );
				#endif
				float3 lerpResult31_g11858 = lerp( appendResult32_g11858 , ( staticSwitch26_g11858 * pow( max( temp_output_4_0_g11858 , 0.0001 ) , max( _ShiftingContrast , 0.0001 ) ) ) , _ShiftingFade);
				float4 appendResult6_g11858 = (float4(lerpResult31_g11858 , break5_g11858.a));
				float4 staticSwitch33_g11858 = appendResult6_g11858;
				#else
				float4 staticSwitch33_g11858 = temp_output_1_0_g11858;
				#endif
				float4 temp_output_5_0_g11865 = staticSwitch33_g11858;
				#ifdef _ENABLETEXTURELAYER1_ON
				float4 break6_g11865 = temp_output_5_0_g11865;
				float3 appendResult11_g11865 = (float3(break6_g11865.r , break6_g11865.g , break6_g11865.b));
				float temp_output_27_0_g11865 = temp_output_40_0_g11813;
				#ifdef _TEXTURELAYER1SCROLLTOGGLE_ON
				float2 staticSwitch73_g11865 = ( _TextureLayer1Offset + ( _TextureLayer1ScrollSpeed * temp_output_27_0_g11865 ) );
				#else
				float2 staticSwitch73_g11865 = _TextureLayer1Offset;
				#endif
				float2 temp_output_72_0_g11865 = ( ( _TextureLayer1Scale * temp_output_41_0_g11813 ) - staticSwitch73_g11865 );
				float2 temp_cast_79 = (_TextureLayer1EdgeClip).xx;
				float2 UV10_g11866 = ( ( ( ( ( ( ( ( ( temp_output_72_0_g11865 % float2( 1,1 ) ) + float2( 1,1 ) ) % float2( 1,1 ) ) - float2( 0.5,0.5 ) ) * ( float2( 1,1 ) - temp_cast_79 ) ) + float2( 0.5,0.5 ) ) % float2( 1,1 ) ) + float2( 1,1 ) ) % float2( 1,1 ) );
				int Width10_g11866 = _TextureLayer1Columns;
				int Height10_g11866 = _TextureLayer1Rows;
				float Tile10_g11866 = round( ( ( _TextureLayer1Speed * temp_output_27_0_g11865 ) + _TextureLayer1StartFrame ) );
				float2 Invert10_g11866 = float2( 0,1 );
				float2 localMyCustomExpression10_g11866 = MyCustomExpression10_g11866( UV10_g11866 , Width10_g11866 , Height10_g11866 , Tile10_g11866 , Invert10_g11866 );
				#ifdef _TEXTURELAYER1SHEETTOGGLE_ON
				float2 staticSwitch20_g11865 = localMyCustomExpression10_g11866;
				#else
				float2 staticSwitch20_g11865 = temp_output_72_0_g11865;
				#endif
				float4 tex2DNode3_g11865 = tex2D( _TextureLayer1Texture, staticSwitch20_g11865 );
				float3 appendResult13_g11865 = (float3(tex2DNode3_g11865.r , tex2DNode3_g11865.g , tex2DNode3_g11865.b));
				float3 appendResult18_g11865 = (float3(_TextureLayer1Color.r , _TextureLayer1Color.g , _TextureLayer1Color.b));
				float3 temp_output_16_0_g11865 = ( appendResult13_g11865 * appendResult18_g11865 );
				float4 break2_g11867 = temp_output_5_0_g11865;
				#ifdef _TEXTURELAYER1CONTRASTTOGGLE_ON
				float3 staticSwitch80_g11865 = ( pow( max( ( ( break2_g11867.x + break2_g11867.x + break2_g11867.y + break2_g11867.y + break2_g11867.y + break2_g11867.z ) / 6.0 ) , 0.0001 ) , max( _TextureLayer1Contrast , 0.0001 ) ) * temp_output_16_0_g11865 );
				#else
				float3 staticSwitch80_g11865 = temp_output_16_0_g11865;
				#endif
				float3 lerpResult12_g11865 = lerp( appendResult11_g11865 , staticSwitch80_g11865 , ( tex2DNode3_g11865.a * _TextureLayer1Fade ));
				float4 appendResult14_g11865 = (float4(lerpResult12_g11865 , break6_g11865.a));
				float4 staticSwitch15_g11865 = appendResult14_g11865;
				#else
				float4 staticSwitch15_g11865 = temp_output_5_0_g11865;
				#endif
				float4 temp_output_5_0_g11861 = staticSwitch15_g11865;
				#ifdef _ENABLETEXTURELAYER2_ON
				float4 break6_g11861 = temp_output_5_0_g11861;
				float3 appendResult11_g11861 = (float3(break6_g11861.r , break6_g11861.g , break6_g11861.b));
				float temp_output_27_0_g11861 = temp_output_40_0_g11813;
				#ifdef _TEXTURELAYER2SCROLLTOGGLE_ON
				float2 staticSwitch73_g11861 = ( _TextureLayer2Offset + ( _TextureLayer2ScrollSpeed * temp_output_27_0_g11861 ) );
				#else
				float2 staticSwitch73_g11861 = _TextureLayer2Offset;
				#endif
				float2 temp_output_72_0_g11861 = ( ( _TextureLayer2Scale * temp_output_41_0_g11813 ) - staticSwitch73_g11861 );
				float2 temp_cast_82 = (_TextureLayer2EdgeClip).xx;
				float2 UV10_g11862 = ( ( ( ( ( ( ( ( ( temp_output_72_0_g11861 % float2( 1,1 ) ) + float2( 1,1 ) ) % float2( 1,1 ) ) - float2( 0.5,0.5 ) ) * ( float2( 1,1 ) - temp_cast_82 ) ) + float2( 0.5,0.5 ) ) % float2( 1,1 ) ) + float2( 1,1 ) ) % float2( 1,1 ) );
				int Width10_g11862 = _TextureLayer2Columns;
				int Height10_g11862 = _TextureLayer2Rows;
				float Tile10_g11862 = round( ( ( _TextureLayer2Speed * temp_output_27_0_g11861 ) + _TextureLayer2StartFrame ) );
				float2 Invert10_g11862 = float2( 0,1 );
				float2 localMyCustomExpression10_g11862 = MyCustomExpression10_g11862( UV10_g11862 , Width10_g11862 , Height10_g11862 , Tile10_g11862 , Invert10_g11862 );
				#ifdef _TEXTURELAYER2SHEETTOGGLE_ON
				float2 staticSwitch20_g11861 = localMyCustomExpression10_g11862;
				#else
				float2 staticSwitch20_g11861 = temp_output_72_0_g11861;
				#endif
				float4 tex2DNode3_g11861 = tex2D( _TextureLayer2Texture, staticSwitch20_g11861 );
				float3 appendResult13_g11861 = (float3(tex2DNode3_g11861.r , tex2DNode3_g11861.g , tex2DNode3_g11861.b));
				float3 appendResult18_g11861 = (float3(_TextureLayer2Color.r , _TextureLayer2Color.g , _TextureLayer2Color.b));
				float3 temp_output_16_0_g11861 = ( appendResult13_g11861 * appendResult18_g11861 );
				float4 break2_g11863 = temp_output_5_0_g11861;
				#ifdef _TEXTURELAYER2CONTRASTTOGGLE_ON
				float3 staticSwitch84_g11861 = ( pow( max( ( ( break2_g11863.x + break2_g11863.x + break2_g11863.y + break2_g11863.y + break2_g11863.y + break2_g11863.z ) / 6.0 ) , 0.0001 ) , max( _TextureLayer2Contrast , 0.0001 ) ) * temp_output_16_0_g11861 );
				#else
				float3 staticSwitch84_g11861 = temp_output_16_0_g11861;
				#endif
				float3 lerpResult12_g11861 = lerp( appendResult11_g11861 , staticSwitch84_g11861 , ( tex2DNode3_g11861.a * _TextureLayer2Fade ));
				float4 appendResult14_g11861 = (float4(lerpResult12_g11861 , break6_g11861.a));
				float4 staticSwitch15_g11861 = appendResult14_g11861;
				#else
				float4 staticSwitch15_g11861 = temp_output_5_0_g11861;
				#endif
				float4 temp_output_473_0 = staticSwitch15_g11861;
				#ifdef _ENABLEFULLDISTORTION_ON
				float4 break4_g11869 = temp_output_473_0;
				float fullDistortionAlpha164 = _FullDistortionFade;
				float4 appendResult5_g11869 = (float4(break4_g11869.r , break4_g11869.g , break4_g11869.b , ( break4_g11869.a * fullDistortionAlpha164 )));
				float4 staticSwitch77 = appendResult5_g11869;
				#else
				float4 staticSwitch77 = temp_output_473_0;
				#endif
				#ifdef _ENABLEDIRECTIONALDISTORTION_ON
				float4 break4_g11870 = staticSwitch77;
				float directionalDistortionAlpha167 = (( _DirectionalDistortionInvert )?( ( 1.0 - clampResult154_g11670 ) ):( clampResult154_g11670 ));
				float4 appendResult5_g11870 = (float4(break4_g11870.r , break4_g11870.g , break4_g11870.b , ( break4_g11870.a * directionalDistortionAlpha167 )));
				float4 staticSwitch75 = appendResult5_g11870;
				#else
				float4 staticSwitch75 = staticSwitch77;
				#endif
				float4 temp_output_1_0_g11871 = staticSwitch75;
				float4 temp_output_1_0_g11872 = temp_output_1_0_g11871;
#ifdef _ENABLEFULLALPHADISSOLVE_ON
				float temp_output_53_0_g11872 = max( _FullAlphaDissolveWidth , 0.001 );
				#endif
				float2 temp_output_18_0_g11871 = shaderPosition235;
				#ifdef _ENABLEFULLALPHADISSOLVE_ON
				float linValue16_g11873 = tex2D( _UberNoiseTexture, ( temp_output_18_0_g11871 * _FullAlphaDissolveNoiseScale ) ).r;
				float localMyCustomExpression16_g11873 = MyCustomExpression16_g11873( linValue16_g11873 );
				float clampResult17_g11872 = clamp( ( ( ( _FullAlphaDissolveFade * ( 1.0 + temp_output_53_0_g11872 ) ) - localMyCustomExpression16_g11873 ) / temp_output_53_0_g11872 ) , 0.0 , 1.0 );
				float4 appendResult3_g11872 = (float4((temp_output_1_0_g11872).rgb , ( temp_output_1_0_g11872.a * clampResult17_g11872 )));
				float4 staticSwitch3_g11871 = appendResult3_g11872;
				#else
				float4 staticSwitch3_g11871 = temp_output_1_0_g11871;
				#endif
				#ifdef _ENABLEFULLGLOWDISSOLVE_ON
				float linValue16_g11881 = tex2D( _UberNoiseTexture, ( temp_output_18_0_g11871 * _FullGlowDissolveNoiseScale ) ).r;
				float localMyCustomExpression16_g11881 = MyCustomExpression16_g11881( linValue16_g11881 );
				float temp_output_5_0_g11880 = localMyCustomExpression16_g11881;
				float temp_output_61_0_g11880 = step( temp_output_5_0_g11880 , _FullGlowDissolveFade );
				float temp_output_53_0_g11880 = max( ( _FullGlowDissolveFade * _FullGlowDissolveWidth ) , 0.001 );
				float4 temp_output_1_0_g11880 = staticSwitch3_g11871;
				float4 appendResult3_g11880 = (float4(( ( (_FullGlowDissolveEdgeColor).rgb * ( temp_output_61_0_g11880 - step( temp_output_5_0_g11880 , ( ( _FullGlowDissolveFade * ( 1.01 + temp_output_53_0_g11880 ) ) - temp_output_53_0_g11880 ) ) ) ) + (temp_output_1_0_g11880).rgb ) , ( temp_output_1_0_g11880.a * temp_output_61_0_g11880 )));
				float4 staticSwitch5_g11871 = appendResult3_g11880;
				#else
				float4 staticSwitch5_g11871 = staticSwitch3_g11871;
				#endif
				#ifdef _ENABLESOURCEALPHADISSOLVE_ON
				float4 temp_output_1_0_g11882 = staticSwitch5_g11871;
				float2 temp_output_76_0_g11882 = temp_output_18_0_g11871;
				float linValue16_g11883 = tex2D( _UberNoiseTexture, ( temp_output_76_0_g11882 * _SourceAlphaDissolveNoiseScale ) ).r;
				float localMyCustomExpression16_g11883 = MyCustomExpression16_g11883( linValue16_g11883 );
				float clampResult17_g11882 = clamp( ( ( _SourceAlphaDissolveFade - ( distance( _SourceAlphaDissolvePosition , temp_output_76_0_g11882 ) + ( localMyCustomExpression16_g11883 * _SourceAlphaDissolveNoiseFactor ) ) ) / max( _SourceAlphaDissolveWidth , 0.001 ) ) , 0.0 , 1.0 );
				float4 appendResult3_g11882 = (float4((temp_output_1_0_g11882).rgb , ( temp_output_1_0_g11882.a * (( _SourceAlphaDissolveInvert )?( ( 1.0 - clampResult17_g11882 ) ):( clampResult17_g11882 )) )));
				float4 staticSwitch8_g11871 = appendResult3_g11882;
				#else
				float4 staticSwitch8_g11871 = staticSwitch5_g11871;
				#endif
				#ifdef _ENABLESOURCEGLOWDISSOLVE_ON
				float2 temp_output_90_0_g11878 = temp_output_18_0_g11871;
				float linValue16_g11879 = tex2D( _UberNoiseTexture, ( temp_output_90_0_g11878 * _SourceGlowDissolveNoiseScale ) ).r;
				float localMyCustomExpression16_g11879 = MyCustomExpression16_g11879( linValue16_g11879 );
				float temp_output_65_0_g11878 = ( distance( _SourceGlowDissolvePosition , temp_output_90_0_g11878 ) + ( localMyCustomExpression16_g11879 * _SourceGlowDissolveNoiseFactor ) );
				float temp_output_75_0_g11878 = step( temp_output_65_0_g11878 , _SourceGlowDissolveFade );
				float temp_output_76_0_g11878 = step( temp_output_65_0_g11878 , ( _SourceGlowDissolveFade - max( _SourceGlowDissolveWidth , 0.001 ) ) );
				float4 temp_output_1_0_g11878 = staticSwitch8_g11871;
				float4 appendResult3_g11878 = (float4(( ( max( ( temp_output_75_0_g11878 - temp_output_76_0_g11878 ) , 0.0 ) * (_SourceGlowDissolveEdgeColor).rgb ) + (temp_output_1_0_g11878).rgb ) , ( temp_output_1_0_g11878.a * (( _SourceGlowDissolveInvert )?( ( 1.0 - temp_output_76_0_g11878 ) ):( temp_output_75_0_g11878 )) )));
				float4 staticSwitch9_g11871 = appendResult3_g11878;
				#else
				float4 staticSwitch9_g11871 = staticSwitch8_g11871;
				#endif
				#ifdef _ENABLEDIRECTIONALALPHAFADE_ON
				float4 temp_output_1_0_g11874 = staticSwitch9_g11871;
				float2 temp_output_161_0_g11874 = temp_output_18_0_g11871;
				float3 rotatedValue136_g11874 = RotateAroundAxis( float3( 0,0,0 ), float3( temp_output_161_0_g11874 ,  0.0 ), float3( 0,0,1 ), ( ( ( _DirectionalAlphaFadeRotation / 180.0 ) + -0.25 ) * UNITY_PI ) );
				float3 break130_g11874 = rotatedValue136_g11874;
				float linValue16_g11875 = tex2D( _UberNoiseTexture, ( temp_output_161_0_g11874 * _DirectionalAlphaFadeNoiseScale ) ).r;
				float localMyCustomExpression16_g11875 = MyCustomExpression16_g11875( linValue16_g11875 );
				float clampResult154_g11874 = clamp( ( ( break130_g11874.x + break130_g11874.y + _DirectionalAlphaFadeFade + ( localMyCustomExpression16_g11875 * _DirectionalAlphaFadeNoiseFactor ) ) / max( _DirectionalAlphaFadeWidth , 0.001 ) ) , 0.0 , 1.0 );
				float4 appendResult3_g11874 = (float4((temp_output_1_0_g11874).rgb , ( temp_output_1_0_g11874.a * (( _DirectionalAlphaFadeInvert )?( ( 1.0 - clampResult154_g11874 ) ):( clampResult154_g11874 )) )));
				float4 staticSwitch11_g11871 = appendResult3_g11874;
				#else
				float4 staticSwitch11_g11871 = staticSwitch9_g11871;
				#endif
				#ifdef _ENABLEDIRECTIONALGLOWFADE_ON
				float2 temp_output_171_0_g11876 = temp_output_18_0_g11871;
				float3 rotatedValue136_g11876 = RotateAroundAxis( float3( 0,0,0 ), float3( temp_output_171_0_g11876 ,  0.0 ), float3( 0,0,1 ), ( ( ( _DirectionalGlowFadeRotation / 180.0 ) + -0.25 ) * UNITY_PI ) );
				float3 break130_g11876 = rotatedValue136_g11876;
				float linValue16_g11877 = tex2D( _UberNoiseTexture, ( temp_output_171_0_g11876 * _DirectionalGlowFadeNoiseScale ) ).r;
				float localMyCustomExpression16_g11877 = MyCustomExpression16_g11877( linValue16_g11877 );
				float temp_output_168_0_g11876 = max( ( ( break130_g11876.x + break130_g11876.y + _DirectionalGlowFadeFade + ( localMyCustomExpression16_g11877 * _DirectionalGlowFadeNoiseFactor ) ) / max( _DirectionalGlowFadeWidth , 0.001 ) ) , 0.0 );
				float temp_output_161_0_g11876 = step( 0.1 , (( _DirectionalGlowFadeInvert )?( ( 1.0 - temp_output_168_0_g11876 ) ):( temp_output_168_0_g11876 )) );
				float4 temp_output_1_0_g11876 = staticSwitch11_g11871;
				float clampResult154_g11876 = clamp( temp_output_161_0_g11876 , 0.0 , 1.0 );
				float4 appendResult3_g11876 = (float4(( ( (_DirectionalGlowFadeEdgeColor).rgb * ( temp_output_161_0_g11876 - step( 1.0 , (( _DirectionalGlowFadeInvert )?( ( 1.0 - temp_output_168_0_g11876 ) ):( temp_output_168_0_g11876 )) ) ) ) + (temp_output_1_0_g11876).rgb ) , ( temp_output_1_0_g11876.a * clampResult154_g11876 )));
				float4 staticSwitch15_g11871 = appendResult3_g11876;
				#else
				float4 staticSwitch15_g11871 = staticSwitch11_g11871;
				#endif
				#ifdef _ENABLEHALFTONE_ON
				float4 temp_output_1_0_g11884 = staticSwitch15_g11871;
				float2 temp_output_126_0_g11884 = temp_output_18_0_g11871;
				float temp_output_121_0_g11884 = max( ( ( _HalftoneFade - distance( _HalftonePosition , temp_output_126_0_g11884 ) ) / max( 0.01 , _HalftoneFadeWidth ) ) , 0.0 );
				float2 appendResult11_g11885 = (float2(temp_output_121_0_g11884 , temp_output_121_0_g11884));
				float temp_output_17_0_g11885 = length( ( (( ( abs( temp_output_126_0_g11884 ) * _HalftoneTiling ) % float2( 1,1 ) )*2.0 + -1.0) / appendResult11_g11885 ) );
				float clampResult17_g11884 = clamp( saturate( ( ( 1.0 - temp_output_17_0_g11885 ) / fwidth( temp_output_17_0_g11885 ) ) ) , 0.0 , 1.0 );
				float4 appendResult3_g11884 = (float4((temp_output_1_0_g11884).rgb , ( temp_output_1_0_g11884.a * (( _HalftoneInvert )?( ( 1.0 - clampResult17_g11884 ) ):( clampResult17_g11884 )) )));
				float4 staticSwitch13_g11871 = appendResult3_g11884;
				#else
				float4 staticSwitch13_g11871 = staticSwitch15_g11871;
				#endif
				#ifdef _ENABLEADDCOLOR_ON
				float3 temp_output_3_0_g11887 = (_AddColorColor).rgb;
				float2 uv_AddColorMask = IN.texcoord.xy * _AddColorMask_ST.xy + _AddColorMask_ST.zw;
				float4 tex2DNode19_g11887 = tex2D( _AddColorMask, uv_AddColorMask );
				#ifdef _ADDCOLORMASKTOGGLE_ON
				float3 staticSwitch16_g11887 = ( temp_output_3_0_g11887 * ( (tex2DNode19_g11887).rgb * tex2DNode19_g11887.a ) );
				#else
				float3 staticSwitch16_g11887 = temp_output_3_0_g11887;
				#endif
				float4 temp_output_1_0_g11887 = staticSwitch13_g11871;
				float4 break2_g11889 = temp_output_1_0_g11887;
				#ifdef _ADDCOLORCONTRASTTOGGLE_ON
				float3 staticSwitch17_g11887 = ( staticSwitch16_g11887 * pow( max( ( ( break2_g11889.x + break2_g11889.x + break2_g11889.y + break2_g11889.y + break2_g11889.y + break2_g11889.z ) / 6.0 ) , 0.0001 ) , max( _AddColorContrast , 0.0001 ) ) );
				#else
				float3 staticSwitch17_g11887 = staticSwitch16_g11887;
				#endif
				float4 appendResult6_g11887 = (float4(( ( staticSwitch17_g11887 * _AddColorFade ) + (temp_output_1_0_g11887).rgb ) , temp_output_1_0_g11887.a));
				float4 staticSwitch5_g11886 = appendResult6_g11887;
				#else
				float4 staticSwitch5_g11886 = staticSwitch13_g11871;
				#endif
				#ifdef _ENABLEALPHATINT_ON
				float4 temp_output_1_0_g11890 = staticSwitch5_g11886;
				float3 lerpResult4_g11890 = lerp( (temp_output_1_0_g11890).rgb , (_AlphaTintColor).rgb , ( ( 1.0 - temp_output_1_0_g11890.a ) * step( _AlphaTintMinAlpha , temp_output_1_0_g11890.a ) * _AlphaTintFade ));
				float4 appendResult13_g11890 = (float4(lerpResult4_g11890 , temp_output_1_0_g11890.a));
				float4 staticSwitch11_g11886 = appendResult13_g11890;
				#else
				float4 staticSwitch11_g11886 = staticSwitch5_g11886;
				#endif
				#ifdef _ENABLESTRONGTINT_ON
				float4 temp_output_1_0_g11891 = staticSwitch11_g11886;
				float3 temp_output_6_0_g11891 = (_StrongTintTint).rgb;
				float2 uv_StrongTintMask = IN.texcoord.xy * _StrongTintMask_ST.xy + _StrongTintMask_ST.zw;
				float4 tex2DNode23_g11891 = tex2D( _StrongTintMask, uv_StrongTintMask );
				#ifdef _STRONGTINTMASKTOGGLE_ON
				float3 staticSwitch21_g11891 = ( temp_output_6_0_g11891 * ( (tex2DNode23_g11891).rgb * tex2DNode23_g11891.a ) );
				#else
				float3 staticSwitch21_g11891 = temp_output_6_0_g11891;
				#endif
				float4 break2_g11893 = temp_output_1_0_g11891;
				#ifdef _STRONGTINTCONTRASTTOGGLE_ON
				float3 staticSwitch22_g11891 = ( pow( max( ( ( break2_g11893.x + break2_g11893.x + break2_g11893.y + break2_g11893.y + break2_g11893.y + break2_g11893.z ) / 6.0 ) , 0.0001 ) , max( _StrongTintContrast , 0.0001 ) ) * staticSwitch21_g11891 );
				#else
				float3 staticSwitch22_g11891 = staticSwitch21_g11891;
				#endif
				float3 lerpResult7_g11891 = lerp( (temp_output_1_0_g11891).rgb , staticSwitch22_g11891 , _StrongTintFade);
				float4 appendResult9_g11891 = (float4(lerpResult7_g11891 , (temp_output_1_0_g11891).a));
				float4 staticSwitch7_g11886 = appendResult9_g11891;
				#else
				float4 staticSwitch7_g11886 = staticSwitch11_g11886;
				#endif
				float4 temp_output_2_0_g11894 = staticSwitch7_g11886;
				#ifdef _ENABLESHADOW_ON
				float4 break4_g11896 = temp_output_2_0_g11894;
				float3 appendResult5_g11896 = (float3(break4_g11896.r , break4_g11896.g , break4_g11896.b));
				float2 appendResult2_g11895 = (float2(_MainTex_TexelSize.z , _MainTex_TexelSize.w));
				float4 appendResult85_g11894 = (float4(_ShadowColor.r , _ShadowColor.g , _ShadowColor.b , ( _ShadowFade * tex2D( _MainTex, ( finalUV146 - ( ( 100.0 / appendResult2_g11895 ) * _ShadowOffset ) ) ).a )));
				float4 break6_g11896 = appendResult85_g11894;
				float3 appendResult7_g11896 = (float3(break6_g11896.r , break6_g11896.g , break6_g11896.b));
				float temp_output_11_0_g11896 = ( ( 1.0 - break4_g11896.a ) * break6_g11896.a );
				float temp_output_32_0_g11896 = ( break4_g11896.a + temp_output_11_0_g11896 );
				float4 appendResult18_g11896 = (float4(( ( ( appendResult5_g11896 * break4_g11896.a ) + ( appendResult7_g11896 * temp_output_11_0_g11896 ) ) * ( 1.0 / max( temp_output_32_0_g11896 , 0.01 ) ) ) , temp_output_32_0_g11896));
				float4 staticSwitch82_g11894 = appendResult18_g11896;
				#else
				float4 staticSwitch82_g11894 = temp_output_2_0_g11894;
				#endif
				float4 break4_g11897 = staticSwitch82_g11894;
				#ifdef _ENABLECUSTOMFADE_ON
				float staticSwitch8_g11755 = 1.0;
				#else
				float staticSwitch8_g11755 = IN.color.a;
				#endif
				#ifdef _ENABLESMOKE_ON
				float staticSwitch9_g11755 = 1.0;
				#else
				float staticSwitch9_g11755 = staticSwitch8_g11755;
				#endif
				float customVertexAlpha193 = staticSwitch9_g11755;
				float4 appendResult5_g11897 = (float4(break4_g11897.r , break4_g11897.g , break4_g11897.b , ( break4_g11897.a * customVertexAlpha193 )));
				float4 temp_output_344_0 = appendResult5_g11897;
				float4 temp_output_1_0_g11898 = temp_output_344_0;
				float4 appendResult8_g11898 = (float4(( (temp_output_1_0_g11898).rgb * (IN.color).rgb ) , temp_output_1_0_g11898.a));
				#ifdef _VERTEXTINTFIRST_ON
				float4 staticSwitch342 = temp_output_344_0;
				#else
				float4 staticSwitch342 = appendResult8_g11898;
				#endif
				float4 lerpResult125 = lerp( ( originalColor191 * IN.color ) , staticSwitch342 , fullFade123);
				#if defined( _SHADERFADING_NONE )
				float4 staticSwitch143 = staticSwitch342;
				#elif defined( _SHADERFADING_FULL )
				float4 staticSwitch143 = lerpResult125;
				#elif defined( _SHADERFADING_MASK )
				float4 staticSwitch143 = lerpResult125;
				#elif defined( _SHADERFADING_DISSOLVE )
				float4 staticSwitch143 = lerpResult125;
				#elif defined( _SHADERFADING_SPREAD )
				float4 staticSwitch143 = lerpResult125;
				#else
				float4 staticSwitch143 = staticSwitch342;
				#endif
				float4 temp_output_7_0_g11900 = staticSwitch143;
				#ifdef _BAKEDMATERIAL_ON
				float4 appendResult2_g11900 = (float4(( (temp_output_7_0_g11900).rgb / max( temp_output_7_0_g11900.a , 1E-05 ) ) , temp_output_7_0_g11900.a));
				float4 staticSwitch6_g11900 = appendResult2_g11900;
				#else
				float4 staticSwitch6_g11900 = temp_output_7_0_g11900;
				#endif
				float4 temp_output_340_0 = staticSwitch6_g11900;
				float3 lerpResult490 = lerp( (temp_output_340_0).rgb , float3( 1,1,1 ) , ( 1.0 - temp_output_340_0.a ));
				float4 appendResult494 = (float4(lerpResult490 , 1.0));
				
				fixed4 c = appendResult494;
				c.rgb *= c.a;
				return c;
			}
		ENDCG
		}
	}
	CustomEditor "SpriteShadersUltimate.SSUShaderGUI"
	
	Fallback Off
}
/*ASEBEGIN
Version=19801
Node;AmplifyShaderEditor.TemplateShaderPropertyNode;30;1182.59,1001.108;Inherit;False;0;0;_MainTex;Shader;False;0;5;SAMPLER2D;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RelayNode;105;1425.709,1004.581;Inherit;False;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;157;1638.393,1000.485;Inherit;False;spriteTexture;-1;True;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;411;-3081.191,-3627.324;Inherit;False;157;spriteTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;363;-3105.9,-3835.053;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;483;-2758.191,-3709.324;Inherit;False;_ScreenTiling;600;;11656;f5939d1b891718b468aa402ddf2c75e0;0;2;1;FLOAT2;0,0;False;12;SAMPLER2D;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;482;-2458.77,-3622.03;Inherit;False;_WorldTiling;595;;11657;5075a3cd4854af640aa8d277732c8893;0;2;1;FLOAT2;0,0;False;12;SAMPLER2D;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.TexelSizeNode;438;1931.978,1144.547;Inherit;False;-1;Create;1;0;SAMPLER2D;;False;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RegisterLocalVarNode;460;-2186.147,-3620.607;Inherit;False;originalUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;469;-1956.314,-3488.134;Inherit;False;_PixelArtUV_1;-1;;11658;0e4f4d9760e013e4ea49a4cc7c42c155;0;2;1;FLOAT2;0,0;False;2;SAMPLER2D;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector4Node;373;-2003.491,-3335.527;Inherit;False;Property;_SpriteSheetRect;Sprite Sheet Rect;4;0;Create;True;0;0;0;False;0;False;0,0,1,1;0,0,1,1;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;435;2252.064,903.7132;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ComponentMaskNode;432;2227.661,1200.654;Inherit;False;False;False;True;True;1;0;FLOAT4;0,0,0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;375;-1731.491,-3207.527;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;434;2534.932,1066.922;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;374;-1729.456,-3326.936;Inherit;False;FLOAT2;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;449;-1697.482,-3566.466;Inherit;False;Property;_Keyword1;Keyword 1;2;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;427;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;450;-1448.75,-3526.053;Inherit;False;uvAfterPixelArt;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;376;-1493.884,-3326.405;Inherit;False;spriteRectMin;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;377;-1494.584,-3224.105;Inherit;False;spriteRectMax;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FloorOpNode;433;2745.127,1095.848;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleDivideOpNode;436;2945.127,1149.848;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;370;-1198.361,-3311.903;Inherit;False;Remap2D;-1;;11662;f79f855c0a5c94649b58f3d8127375ae;0;5;13;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;1,1;False;5;FLOAT2;0,0;False;6;FLOAT2;1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;341;2716.61,1541.034;Inherit;False;ShaderTime;21;;11663;06a15e67904f217499045f361bad56e7;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;101;2238.417,1562.63;Inherit;True;Property;_UberNoiseTexture;Uber Noise Texture;32;0;Create;True;0;0;0;False;0;False;b8d18cd117976254d94a812a0bfc336e;b8d18cd117976254d94a812a0bfc336e;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.StaticSwitch;366;-905.3608,-3353.903;Inherit;False;Property;_SpriteSheetFix;Sprite Sheet Fix;3;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;237;2948.598,1594.428;Inherit;False;shaderTime;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;441;3148.675,1260.326;Inherit;False;157;spriteTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.StaticSwitch;437;3093.581,1032.267;Inherit;False;Property;_PixelPerfectSpace;Pixel Perfect Space;1;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;439;3389.449,1182.896;Inherit;False;ShaderSpace;8;;11664;be729ef05db9c224caec82a3516038dc;0;2;61;FLOAT2;0,0;False;3;SAMPLER2D;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;475;-584.1226,-3343.809;Inherit;False;fixedUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RelayNode;99;2506.903,1635.005;Inherit;False;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;477;-582.6621,-3244.321;Inherit;False;237;shaderTime;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;365;-372.9774,-3275.82;Inherit;False;_UberInteractive;528;;11665;f8a4d7008519ad249b29e4a9381f963f;0;2;9;FLOAT;0;False;3;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;159;2660.32,1715.519;Inherit;False;uberNoiseTexture;-1;True;1;0;SAMPLER2D;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;235;3662.626,1220.644;Inherit;False;shaderPosition;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;184;-340.3444,-2931.6;Inherit;False;159;uberNoiseTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;253;-334.9839,-3014.146;Inherit;False;235;shaderPosition;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RelayNode;84;-178.5299,-3184.649;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;79;-47.4363,-2946.944;Inherit;False;_FullDistortion;462;;11667;62960fe27c1c398408207bb462ffd10e;0;3;195;FLOAT2;0,0;False;160;FLOAT2;0,0;False;194;SAMPLER2D;;False;2;FLOAT2;174;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;83;355.5295,-3077.305;Inherit;False;Property;_EnableShine;Enable Shine;461;0;Create;True;0;0;0;False;0;False;1;0;0;True;;Toggle;2;Key0;Key1;Reference;77;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;254;496.0161,-2937.146;Inherit;False;235;shaderPosition;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;188;476.926,-2831.78;Inherit;False;159;uberNoiseTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.FunctionNode;81;747.3577,-2918.135;Inherit;False;_DirectionalDistortion;450;;11670;30e6ac39427ee11419083602d572972f;0;3;182;FLOAT2;0,0;False;160;FLOAT2;0,0;False;181;SAMPLER2D;;False;2;FLOAT2;174;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;82;1064.56,-3052.917;Inherit;False;Property;_EnableShine;Enable Shine;449;0;Create;True;0;0;0;False;0;False;1;0;0;True;;Toggle;2;Key0;Key1;Reference;75;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;160;658.3505,-580.0461;Inherit;False;159;uberNoiseTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RangedFloatNode;53;1165.579,-2580.498;Inherit;False;Property;_HologramFade;Hologram: Fade;195;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;244;685.5539,-740.5018;Inherit;False;237;shaderTime;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;243;665.8691,-664.6964;Inherit;False;235;shaderPosition;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;255;1530.016,-2640.146;Inherit;False;237;shaderTime;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;182;1537.252,-2554.561;Inherit;False;hologramFade;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;173;1547.656,-2458.612;Inherit;False;159;uberNoiseTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RelayNode;38;1602.103,-2721.81;Inherit;False;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;174;1562.277,-2362.367;Inherit;False;157;spriteTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.FunctionNode;102;919.0109,-667.4209;Inherit;False;_GlitchPre;210;;11673;b8ad29d751d87bd4d9cbf14898be6163;0;3;19;FLOAT;0;False;18;FLOAT2;0,0;False;16;SAMPLER2D;;False;2;FLOAT;15;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;230;4630.415,2681.855;Inherit;False;Property;_FadingNoiseFactor;Fading: Noise Factor;18;0;Create;True;0;0;0;False;0;False;0.2;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;204;4801.255,1506.884;Inherit;True;Property;_FadingMask;Fading: Mask;20;0;Create;True;0;0;0;False;0;False;None;None;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RegisterLocalVarNode;154;1243.538,-600.6849;Inherit;False;glitchPosition;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;152;1246.533,-755.1426;Inherit;False;glitchFade;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.Vector2Node;208;4401.642,1937.264;Inherit;False;Property;_FadingNoiseScale;Fading: Noise Scale;19;0;Create;True;0;0;0;False;0;False;0.2,0.2;0.2,0.2;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.RangedFloatNode;210;4416.092,2114.768;Inherit;False;Property;_FadingWidth;Fading: Width;17;0;Create;True;0;0;0;False;0;False;0.3;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;219;4515.66,1836.189;Inherit;False;159;uberNoiseTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.Vector2Node;229;4660.594,2553.942;Inherit;False;Property;_FadingPosition;Fading: Position;16;0;Create;True;0;0;0;False;0;False;0,0;0.2,0.2;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.FunctionNode;52;1839.482,-2552.931;Inherit;False;_HologramUV;203;;11675;7c71b1b031ffcbe48805e17b94671163;0;7;77;FLOAT;0;False;55;FLOAT;0;False;76;SAMPLER2D;;False;37;FLOAT2;0,0;False;39;SAMPLER2D;;False;81;FLOAT;0;False;79;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;122;3995.099,1279.389;Inherit;False;Property;_FadingFade;Fading: Fade;15;0;Create;True;0;0;0;False;0;False;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;228;4626.359,2471.966;Inherit;False;159;uberNoiseTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;261;4535.53,1746.504;Inherit;False;235;shaderPosition;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;231;4899.456,2440.854;Inherit;False;_UberSpreadFade;-1;;11714;777ca8ab10170fb48b24b7cd1c44f075;0;7;27;FLOAT2;0,0;False;22;FLOAT;0;False;18;SAMPLER2D;0;False;25;FLOAT2;0,0;False;23;FLOAT2;0,0;False;21;FLOAT;0;False;26;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;223;4905.316,1828.167;Inherit;False;_UberDissolveFade;-1;;11716;cb957eb9b67f4f243aa8ba0547208263;0;5;21;FLOAT2;0,0;False;1;FLOAT;0;False;16;SAMPLER2D;0;False;18;FLOAT2;0,0;False;20;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;59;2242.011,-2636.393;Inherit;False;Property;_EnableShine;Enable Shine;194;0;Create;True;0;0;0;False;0;False;1;0;0;True;;Toggle;2;Key0;Key1;Reference;56;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;256;2394.016,-2741.146;Inherit;False;237;shaderTime;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;292;5091.561,1459.408;Inherit;False;ShaderMasker;-1;;11718;3d25b55dbfdd24f48b9bd371bdde0e97;0;2;1;FLOAT;0;False;2;SAMPLER2D;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;155;2400.558,-2511.178;Inherit;False;154;glitchPosition;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;175;2375.652,-2434.015;Inherit;False;159;uberNoiseTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;153;2413.1,-2367.982;Inherit;False;152;glitchFade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;103;2715.721,-2556.586;Inherit;False;_GlitchUV;222;;11719;2addb21417fb5d745a5abfe02cbcd453;0;5;23;FLOAT;0;False;13;FLOAT2;0,0;False;22;SAMPLER2D;;False;3;FLOAT;0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;139;5964.391,1365.661;Inherit;False;Property;_ShaderFading;Shader Fading;14;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;5;None;Full;Mask;Dissolve;Spread;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;62;3040.934,-2600.272;Inherit;False;Property;_EnableShine;Enable Shine;209;0;Create;True;0;0;0;False;0;False;1;0;0;True;;Toggle;2;Key0;Key1;Reference;57;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;123;6281.453,1414.289;Inherit;False;fullFade;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;259;2999.016,-2403.146;Inherit;False;237;shaderTime;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;177;3015.115,-2149.526;Inherit;False;157;spriteTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;258;2972.016,-2323.146;Inherit;False;235;shaderPosition;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;176;2993.115,-2238.526;Inherit;False;159;uberNoiseTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;131;3266.866,-2134.612;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;129;3305.944,-1988.403;Inherit;False;123;fullFade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;484;3382.41,-2373.518;Inherit;False;_UberTransformUV;467;;11721;894b1de51a5f4c74cbe7828262f1344b;0;5;25;FLOAT;0;False;26;FLOAT2;0,0;False;1;FLOAT2;0,0;False;18;SAMPLER2D;0;False;3;SAMPLER2D;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;130;3651.881,-2106.533;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;145;3940.446,-2146.193;Inherit;False;Property;_UberFading;Uber Fading;14;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;NONE;Key1;Key2;Key3;Reference;139;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleRemainderNode;486;4222.693,-2046.305;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleAddOpNode;487;4449.801,-1972.639;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleRemainderNode;488;4664.06,-2056.074;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;381;5159.958,-1852.951;Inherit;False;377;spriteRectMax;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;485;4859.071,-2156.215;Inherit;False;Property;_TilingFix;Tiling Fix;5;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;380;5166.152,-1941.533;Inherit;False;376;spriteRectMin;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;378;5475.994,-2043.135;Inherit;False;Remap2D;-1;;11733;f79f855c0a5c94649b58f3d8127375ae;0;5;13;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;1,1;False;5;FLOAT2;0,0;False;6;FLOAT2;1,1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;382;5739.72,-1830.532;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMinOpNode;383;5870.72,-1934.532;Inherit;False;2;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;452;6307.805,-1976.09;Inherit;False;450;uvAfterPixelArt;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;371;6107.095,-2156.984;Inherit;False;Property;_SpriteSheetFix1;Sprite Sheet Fix;3;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;366;False;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;442;6299.205,-1884.911;Inherit;False;157;spriteTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;463;6361.842,-2067.504;Inherit;False;460;originalUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;470;6618.802,-2035.91;Inherit;False;_PixelArtUV_2;-1;;11734;4b65626ba2313ca40a96813b19044794;0;4;21;FLOAT2;0,0;False;17;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;SAMPLER2D;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;427;7006.263,-2158.381;Inherit;False;Property;_PixelPerfectUV;Pixel Perfect UV;2;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;146;7280.32,-2157.36;Inherit;False;finalUV;-1;True;1;0;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;147;-2226.428,-390.3136;Inherit;False;146;finalUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;189;-2234.721,-201.4758;Inherit;False;157;spriteTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.FunctionNode;471;-1990.589,-315.832;Inherit;False;_UberSample;566;;11735;1028d755b36e2b04da25c3b882a2e2ec;0;2;1;FLOAT2;0,0;False;2;SAMPLER2D;;False;1;COLOR;0
Node;AmplifyShaderEditor.VertexColorNode;358;-1921.027,-115.7738;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;356;-1686.027,-106.7738;Inherit;False;ColorMultiply;-1;;11754;1f51da7edd80c06488c56d28bc096dec;0;2;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StaticSwitch;354;-1350.718,-125.6577;Inherit;False;Property;_Keyword0;Keyword 0;0;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Reference;342;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;191;-1018.041,-121.917;Inherit;False;originalColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;149;-977.8615,164.14;Inherit;False;146;finalUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;179;-1036.103,27.02582;Inherit;False;159;uberNoiseTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;180;-687.1025,-126.9742;Inherit;False;159;uberNoiseTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;240;-683.451,-246.0232;Inherit;False;237;shaderTime;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;148;-614.0953,-401.0159;Inherit;False;146;finalUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.FunctionNode;343;-737.796,35.8288;Inherit;False;_UberCustomAlpha;577;;11755;d68af6e3188f53845b23cf6e39df15fe;0;3;1;COLOR;0,0,0,0;False;6;SAMPLER2D;0;False;7;FLOAT2;0,0;False;2;FLOAT;12;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;178;-455.0759,-519.7366;Inherit;False;159;uberNoiseTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.FunctionNode;239;-404.7228,-125.1053;Inherit;False;_UberGenerated;551;;11760;52defa3f7cca25740a6a77f065edb382;0;4;10;FLOAT;0;False;8;SAMPLER2D;0;False;7;FLOAT2;0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;242;-432.6598,-617.0601;Inherit;False;235;shaderPosition;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;181;-423.344,-436.9742;Inherit;False;157;spriteTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.FunctionNode;361;-136.8644,-329.1863;Inherit;False;_UberColor;60;;11764;db48f560e502b78409f7fbe481a93597;0;6;39;FLOAT;0;False;40;FLOAT2;0,0;False;1;FLOAT2;0,0;False;24;SAMPLER2D;0;False;3;COLOR;0,0,0,0;False;5;SAMPLER2D;0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;183;-37.83691,-91.99512;Inherit;False;182;hologramFade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;51;183.7499,-168.0946;Inherit;False;_Hologram;196;;11806;76082a965d84d0e4da33b2cff51b3691;0;5;42;FLOAT;0;False;40;FLOAT;0;False;1;COLOR;1,1,1,1;False;43;FLOAT;0;False;44;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;161;687.0067,-317.0453;Inherit;False;154;glitchPosition;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;56;438.7324,-454.4984;Inherit;False;Property;_EnableHologram;Enable Hologram;194;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;163;668.7452,-235.3598;Inherit;False;159;uberNoiseTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.GetLocalVarNode;162;704.0067,-153.0455;Inherit;False;152;glitchFade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;104;973.7388,-316.5438;Inherit;False;_Glitch;216;;11809;97a01281f94bcc04fbb9a7c1cd328f08;0;5;34;FLOAT;0;False;31;FLOAT2;0,0;False;33;SAMPLER2D;;False;29;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;246;1400.383,-493.8317;Inherit;False;235;shaderPosition;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;164;250.219,-2894.672;Inherit;False;fullDistortionAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;171;1364.183,-273.4383;Inherit;False;159;uberNoiseTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.StaticSwitch;57;1278.486,-397.6114;Inherit;False;Property;_EnableGlitch;Enable Glitch;209;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;247;1456.499,-578.4069;Inherit;False;237;shaderTime;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;473;1656.25,-345.9998;Inherit;False;_UberEffect;227;;11813;93c7a07f758a0814998210619e8ad1cb;0;4;40;FLOAT;0;False;41;FLOAT2;0,0;False;3;COLOR;0,0,0,0;False;37;SAMPLER2D;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;166;1853.428,-195.4143;Inherit;False;164;fullDistortionAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;167;1037.158,-2834.03;Inherit;False;directionalDistortionAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;78;2104.106,-267.8359;Inherit;False;AlphaMultiply;-1;;11869;d24974f7959982d48aab81e9e7692f35;0;2;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.StaticSwitch;77;2492.977,-348.4961;Inherit;False;Property;_EnableFullDistortion;Enable Full Distortion;461;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;168;2616.17,-223.2014;Inherit;False;167;directionalDistortionAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;76;3014.405,-219.2272;Inherit;False;AlphaMultiply;-1;;11870;d24974f7959982d48aab81e9e7692f35;0;2;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;249;3627.646,-39.2937;Inherit;False;235;shaderPosition;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.StaticSwitch;75;3434.708,-336.5002;Inherit;False;Property;_EnableDirectionalDistortion;Enable Directional Distortion;449;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;169;3611.012,-138.045;Inherit;False;159;uberNoiseTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;193;-400.3044,37.52343;Inherit;False;customVertexAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;248;3912.165,-179.9706;Inherit;False;_UberFading;390;;11871;f8f5d1f402d6b694f9c47ef65b4ae91d;0;3;18;FLOAT2;0,0;False;1;COLOR;0,0,0,0;False;17;SAMPLER2D;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;480;3955.587,-349.0083;Inherit;False;146;finalUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;479;3931.587,-267.0083;Inherit;False;157;spriteTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.FunctionNode;478;4200.417,-206.2577;Inherit;False;_UberColorFinal;33;;11886;6ac57aba23ea6404ba71b6806ea93971;0;3;14;FLOAT2;0,0;False;15;SAMPLER2D;;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;196;4178.044,-19.14569;Inherit;False;193;customVertexAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;344;4548.086,-90.46628;Inherit;False;AlphaMultiply;-1;;11897;d24974f7959982d48aab81e9e7692f35;0;2;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.VertexColorNode;348;4610.214,-299.2399;Inherit;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.GetLocalVarNode;194;4622.439,201.8054;Inherit;False;191;originalColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;353;4889.3,-222.093;Inherit;False;ColorMultiply;-1;;11898;1f51da7edd80c06488c56d28bc096dec;0;2;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;195;4877.096,136.7432;Inherit;False;TintVertex;-1;;11899;b0b94dd27c0f3da49a89feecae766dcc;0;1;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;342;5134.784,-128.8904;Inherit;False;Property;_VertexTintFirst;Vertex Tint First;0;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;124;4962.062,258.7927;Inherit;False;123;fullFade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;125;5403.405,74.92608;Inherit;False;3;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0,0,0,0;False;2;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;476;3958.333,566.3407;Inherit;False;475;fixedUV;1;0;OBJECT;;False;1;FLOAT2;0
Node;AmplifyShaderEditor.Vector2Node;200;3977.696,393.365;Inherit;False;Constant;_ZeroVector;Zero Vector;67;0;Create;True;0;0;0;False;0;False;0,0;0,0;0;3;FLOAT2;0;FLOAT;1;FLOAT;2
Node;AmplifyShaderEditor.StaticSwitch;143;5663.995,-69.69315;Inherit;False;Property;_UberFading;Uber Fading;14;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;NONE;Key1;Key2;Key3;Reference;139;True;True;All;9;1;FLOAT4;0,0,0,0;False;0;FLOAT4;0,0,0,0;False;2;FLOAT4;0,0,0,0;False;3;FLOAT4;0,0,0,0;False;4;FLOAT4;0,0,0,0;False;5;FLOAT4;0,0,0,0;False;6;FLOAT4;0,0,0,0;False;7;FLOAT4;0,0,0,0;False;8;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;340;6010.595,-19.64009;Inherit;False;BakingHandler;6;;11900;f63dfe0dc7c747c43b593d357b168fa0;0;1;7;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;199;4171.966,521.7499;Inherit;False;_Squish;546;;11901;6d6a73cc3433bad4186f7028cad3d98c;0;2;82;FLOAT2;0,0;False;1;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.BreakToComponentsNode;491;6384.753,25.96123;Inherit;False;COLOR;1;0;COLOR;0,0,0,0;False;16;FLOAT;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4;FLOAT;5;FLOAT;6;FLOAT;7;FLOAT;8;FLOAT;9;FLOAT;10;FLOAT;11;FLOAT;12;FLOAT;13;FLOAT;14;FLOAT;15
Node;AmplifyShaderEditor.GetLocalVarNode;251;4509.569,562.3449;Inherit;False;237;shaderTime;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;198;4453.426,400.9801;Inherit;False;Property;_EnableSquish;Enable Squish;545;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;False;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.GetLocalVarNode;141;4826.724,532.0556;Inherit;False;123;fullFade;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;424;4759.72,401.6135;Inherit;False;_UberTransformOffset;512;;11902;ee5e9e731457b2342bdb306bdb8d2401;0;2;8;FLOAT;0;False;2;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.OneMinusNode;492;6552.106,104.5072;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ComponentMaskNode;493;6316.456,-62.36369;Inherit;False;True;True;True;False;1;0;COLOR;0,0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;121;5091.355,506.223;Inherit;False;3;0;FLOAT2;0,0;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.LerpOp;490;6766.695,-113.1337;Inherit;False;3;0;FLOAT3;0,0,0;False;1;FLOAT3;1,1,1;False;2;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.StaticSwitch;142;5362.269,308.0164;Inherit;False;Property;_UberFading;Uber Fading;14;0;Create;True;0;0;0;False;0;False;0;0;0;True;;KeywordEnum;4;NONE;Key1;Key2;Key3;Reference;139;True;True;All;9;1;FLOAT2;0,0;False;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT2;0,0;False;6;FLOAT2;0,0;False;7;FLOAT2;0,0;False;8;FLOAT2;0,0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.DynamicAppendNode;494;7074.929,-21.12836;Inherit;False;FLOAT4;4;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;1;False;1;FLOAT4;0
Node;AmplifyShaderEditor.GetLocalVarNode;187;489.4036,-2756.916;Inherit;False;157;spriteTexture;1;0;OBJECT;;False;1;SAMPLER2D;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;14;7231.972,58.59605;Float;False;True;-1;2;SpriteShadersUltimate.SSUShaderGUI;0;10;Sprite Shaders Ultimate/Multiplicative SSU;0f8ba0101102bb14ebf021ddadce9b49;True;SubShader 0 Pass 0;0;0;SubShader 0 Pass 0;2;True;True;6;2;False;;0;False;;3;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;True;5;Queue=Transparent=Queue=0;IgnoreProjector=True;RenderType=Transparent=RenderType;PreviewType=Plane;CanUseSpriteAtlas=True;False;False;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;3;False;0;;0;0;Standard;0;0;1;True;False;;False;0
WireConnection;105;0;30;0
WireConnection;157;0;105;0
WireConnection;483;1;363;0
WireConnection;483;12;411;0
WireConnection;482;1;483;0
WireConnection;482;12;411;0
WireConnection;438;0;157;0
WireConnection;460;0;482;0
WireConnection;469;1;460;0
WireConnection;469;2;411;0
WireConnection;432;0;438;0
WireConnection;375;0;373;3
WireConnection;375;1;373;4
WireConnection;434;0;435;0
WireConnection;434;1;432;0
WireConnection;374;0;373;1
WireConnection;374;1;373;2
WireConnection;449;1;460;0
WireConnection;449;0;469;0
WireConnection;450;0;449;0
WireConnection;376;0;374;0
WireConnection;377;0;375;0
WireConnection;433;0;434;0
WireConnection;436;0;433;0
WireConnection;436;1;432;0
WireConnection;370;13;450;0
WireConnection;370;5;376;0
WireConnection;370;6;377;0
WireConnection;366;1;450;0
WireConnection;366;0;370;0
WireConnection;237;0;341;0
WireConnection;437;1;435;0
WireConnection;437;0;436;0
WireConnection;439;61;437;0
WireConnection;439;3;441;0
WireConnection;475;0;366;0
WireConnection;99;0;101;0
WireConnection;365;9;477;0
WireConnection;365;3;475;0
WireConnection;159;0;99;0
WireConnection;235;0;439;0
WireConnection;84;0;365;0
WireConnection;79;195;253;0
WireConnection;79;160;84;0
WireConnection;79;194;184;0
WireConnection;83;1;84;0
WireConnection;83;0;79;174
WireConnection;81;182;254;0
WireConnection;81;160;83;0
WireConnection;81;181;188;0
WireConnection;82;1;83;0
WireConnection;82;0;81;174
WireConnection;182;0;53;0
WireConnection;38;0;82;0
WireConnection;102;19;244;0
WireConnection;102;18;243;0
WireConnection;102;16;160;0
WireConnection;154;0;102;0
WireConnection;152;0;102;15
WireConnection;52;77;255;0
WireConnection;52;55;182;0
WireConnection;52;76;173;0
WireConnection;52;37;38;0
WireConnection;52;39;174;0
WireConnection;231;27;261;0
WireConnection;231;22;122;0
WireConnection;231;18;228;0
WireConnection;231;25;208;0
WireConnection;231;23;229;0
WireConnection;231;21;210;0
WireConnection;231;26;230;0
WireConnection;223;21;261;0
WireConnection;223;1;122;0
WireConnection;223;16;219;0
WireConnection;223;18;208;0
WireConnection;223;20;210;0
WireConnection;59;1;38;0
WireConnection;59;0;52;0
WireConnection;292;1;122;0
WireConnection;292;2;204;0
WireConnection;103;23;256;0
WireConnection;103;13;155;0
WireConnection;103;22;175;0
WireConnection;103;3;153;0
WireConnection;103;1;59;0
WireConnection;139;1;122;0
WireConnection;139;0;122;0
WireConnection;139;2;292;0
WireConnection;139;3;223;0
WireConnection;139;4;231;0
WireConnection;62;1;59;0
WireConnection;62;0;103;0
WireConnection;123;0;139;0
WireConnection;484;25;259;0
WireConnection;484;26;258;0
WireConnection;484;1;62;0
WireConnection;484;18;176;0
WireConnection;484;3;177;0
WireConnection;130;0;131;0
WireConnection;130;1;484;0
WireConnection;130;2;129;0
WireConnection;145;1;484;0
WireConnection;145;0;130;0
WireConnection;145;2;130;0
WireConnection;145;3;130;0
WireConnection;145;4;130;0
WireConnection;486;0;145;0
WireConnection;487;0;486;0
WireConnection;488;0;487;0
WireConnection;485;1;145;0
WireConnection;485;0;488;0
WireConnection;378;13;485;0
WireConnection;378;2;380;0
WireConnection;378;3;381;0
WireConnection;382;0;378;0
WireConnection;382;1;380;0
WireConnection;383;0;382;0
WireConnection;383;1;381;0
WireConnection;371;1;485;0
WireConnection;371;0;383;0
WireConnection;470;21;463;0
WireConnection;470;17;452;0
WireConnection;470;1;371;0
WireConnection;470;2;442;0
WireConnection;427;1;371;0
WireConnection;427;0;470;0
WireConnection;146;0;427;0
WireConnection;471;1;147;0
WireConnection;471;2;189;0
WireConnection;356;1;471;0
WireConnection;356;2;358;0
WireConnection;354;1;471;0
WireConnection;354;0;356;0
WireConnection;191;0;354;0
WireConnection;343;1;191;0
WireConnection;343;6;179;0
WireConnection;343;7;149;0
WireConnection;239;10;240;0
WireConnection;239;8;180;0
WireConnection;239;7;148;0
WireConnection;239;1;343;0
WireConnection;361;39;240;0
WireConnection;361;40;242;0
WireConnection;361;1;148;0
WireConnection;361;24;178;0
WireConnection;361;3;239;0
WireConnection;361;5;181;0
WireConnection;51;42;240;0
WireConnection;51;40;183;0
WireConnection;51;1;361;0
WireConnection;56;1;361;0
WireConnection;56;0;51;0
WireConnection;104;34;244;0
WireConnection;104;31;161;0
WireConnection;104;33;163;0
WireConnection;104;29;162;0
WireConnection;104;1;56;0
WireConnection;164;0;79;0
WireConnection;57;1;56;0
WireConnection;57;0;104;0
WireConnection;473;40;247;0
WireConnection;473;41;246;0
WireConnection;473;3;57;0
WireConnection;473;37;171;0
WireConnection;167;0;81;0
WireConnection;78;1;473;0
WireConnection;78;2;166;0
WireConnection;77;1;473;0
WireConnection;77;0;78;0
WireConnection;76;1;77;0
WireConnection;76;2;168;0
WireConnection;75;1;77;0
WireConnection;75;0;76;0
WireConnection;193;0;343;12
WireConnection;248;18;249;0
WireConnection;248;1;75;0
WireConnection;248;17;169;0
WireConnection;478;14;480;0
WireConnection;478;15;479;0
WireConnection;478;3;248;0
WireConnection;344;1;478;0
WireConnection;344;2;196;0
WireConnection;353;1;344;0
WireConnection;353;2;348;0
WireConnection;195;1;194;0
WireConnection;342;1;353;0
WireConnection;342;0;344;0
WireConnection;125;0;195;0
WireConnection;125;1;342;0
WireConnection;125;2;124;0
WireConnection;143;1;342;0
WireConnection;143;0;125;0
WireConnection;143;2;125;0
WireConnection;143;3;125;0
WireConnection;143;4;125;0
WireConnection;340;7;143;0
WireConnection;199;82;200;0
WireConnection;199;1;476;0
WireConnection;491;0;340;0
WireConnection;198;1;200;0
WireConnection;198;0;199;0
WireConnection;424;8;251;0
WireConnection;424;2;198;0
WireConnection;492;0;491;3
WireConnection;493;0;340;0
WireConnection;121;1;424;0
WireConnection;121;2;141;0
WireConnection;490;0;493;0
WireConnection;490;2;492;0
WireConnection;142;1;424;0
WireConnection;142;0;121;0
WireConnection;142;2;121;0
WireConnection;142;3;121;0
WireConnection;142;4;121;0
WireConnection;494;0;490;0
WireConnection;14;0;494;0
WireConnection;14;1;142;0
ASEEND*/
//CHKSM=44B04B003779452F94955574751B49F7AC4376DD
