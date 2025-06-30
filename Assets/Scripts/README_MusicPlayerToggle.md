# Music Player Toggle Component

A Unity component that integrates Doozy UI Toggle with background music playback functionality. This component allows you to control music playback through a toggle UI element, with music persisting across scene changes.

## Features

- ✅ **Toggle Control**: Music plays when toggle is ON, pauses when toggle is OFF
- ✅ **Scene Persistence**: Music continues playing across different scenes when toggle is ON
- ✅ **Doozy UI Integration**: Works seamlessly with Doozy UI Toggle components
- ✅ **Audio Mixer Integration**: Integrates with Feel/MMTools audio system
- ✅ **State Memory**: Remembers music position when paused
- ✅ **Singleton Pattern**: Ensures only one music player exists across scenes
- ✅ **Debug Support**: Optional debug logging for troubleshooting

## Requirements

- Unity 2021.3 or later
- Doozy UI System (already included in your project)
- Feel/MMTools Audio System (already included in your project)

## Setup Instructions

### 1. Create the Music Player GameObject

1. Create an empty GameObject in your scene
2. Name it "MusicPlayer" or "BackgroundMusic"
3. Add a **UIToggle** component to this GameObject
4. Add the **MusicPlayerToggle** component to the same GameObject

### 2. Configure the MusicPlayerToggle Component

In the Inspector, configure the following settings:

#### Music Settings
- **Background Music**: Assign your audio clip here
- **Music Volume**: Set the volume level (0-1)
- **Loop Music**: Enable if you want the music to loop
- **Persistent Music**: Enable to keep music playing across scenes

#### Toggle Settings
- **Start With Music On**: Set the initial state of the toggle

#### Debug
- **Enable Debug Logs**: Enable for troubleshooting

### 3. Configure the UIToggle Component

1. Set up the UIToggle's visual elements (background, checkmark, etc.)
2. Configure the toggle's behavior in the Doozy UI settings
3. The MusicPlayerToggle will automatically connect to the UIToggle

### 4. Audio Mixer Setup (Optional)

If you want to use the Feel/MMTools audio mixer:
1. Ensure MMSoundManager is set up in your scene
2. The music will automatically be routed to the Music track
3. You can control volume through the audio mixer

## Usage

### Basic Usage

Once set up, the component works automatically:
- When the toggle is turned ON → Music resumes playing
- When the toggle is turned OFF → Music pauses
- When changing scenes with toggle ON → Music continues playing
- When changing scenes with toggle OFF → Music stays paused

### Programmatic Control

You can also control the music programmatically:

```csharp
// Get reference to the music player
MusicPlayerToggle musicPlayer = FindObjectOfType<MusicPlayerToggle>();

// Check if music is playing
bool isPlaying = musicPlayer.IsMusicPlaying();

// Check toggle state
bool isToggleOn = musicPlayer.IsToggleOn();

// Set music state
musicPlayer.SetMusicState(true);  // Turn music on
musicPlayer.SetMusicState(false); // Turn music off

// Set volume
musicPlayer.SetMusicVolume(0.5f);
```

### UI Button Integration

You can connect UI buttons to control the music:

1. Add the `MusicPlayerToggleExample` component to a GameObject
2. Assign the MusicPlayerToggle reference
3. Connect UI buttons to the public methods:
   - `ToggleMusic()` - Toggles music on/off
   - `TurnMusicOn()` - Turns music on
   - `TurnMusicOff()` - Turns music off

## Example Scene Setup

Here's a complete example of how to set up a scene:

1. **Create Music Player GameObject**:
   ```
   MusicPlayer (Empty GameObject)
   ├── UIToggle Component
   └── MusicPlayerToggle Component
   ```

2. **Configure UIToggle**:
   - Add visual elements (background image, checkmark icon)
   - Set up animations if desired
   - Configure the toggle's appearance

3. **Configure MusicPlayerToggle**:
   - Assign your background music audio clip
   - Set volume and loop settings
   - Enable debug logs for testing

4. **Test the Setup**:
   - Play the scene
   - Toggle the UI element
   - Verify music plays/pauses
   - Test scene transitions

## Advanced Configuration

### Custom Audio Source

If you want to use a custom AudioSource instead of the auto-created one, you can modify the script to reference an existing AudioSource component.

### Multiple Music Tracks

For multiple music tracks, you can create multiple MusicPlayerToggle instances with different audio clips and toggle them independently.

### Integration with Other Audio Systems

The component is designed to work with Feel/MMTools but can be easily modified to work with other audio systems by changing the audio mixer group assignment.

## Troubleshooting

### Common Issues

1. **Music doesn't play**:
   - Check that the audio clip is assigned
   - Verify the AudioSource component is created
   - Check the volume settings

2. **Toggle doesn't work**:
   - Ensure UIToggle component is on the same GameObject
   - Check that the toggle is properly configured
   - Enable debug logs to see what's happening

3. **Music doesn't persist across scenes**:
   - Make sure the GameObject has DontDestroyOnLoad
   - Check that the singleton pattern is working
   - Verify scene loading events are properly handled

### Debug Information

Enable debug logs to see detailed information about:
- Component initialization
- Toggle state changes
- Music play/pause events
- Scene loading events

## API Reference

### Public Methods

- `SetMusicState(bool playMusic)` - Set music on/off
- `IsMusicPlaying()` - Check if music is currently playing
- `IsToggleOn()` - Check current toggle state
- `SetMusicVolume(float volume)` - Set music volume

### Properties

- `backgroundMusic` - The audio clip to play
- `musicVolume` - Volume level (0-1)
- `loopMusic` - Whether music should loop
- `persistentMusic` - Whether music persists across scenes
- `startWithMusicOn` - Initial toggle state
- `enableDebugLogs` - Enable debug logging

## License

This component is part of the CGJ2025 project and follows the same licensing terms as the main project.

## Support

For issues or questions about this component, please refer to the project documentation or contact the development team. 