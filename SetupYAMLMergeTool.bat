@echo off
setlocal

rem Modify this to your Unity version
set UNITY_VERSION=6000.0.23f1
set UNITY_PATH=C:\Program Files\Unity\Hub\Editor\%UNITY_VERSION%\Editor\Data\Tools\UnityYAMLMerge.exe

if exist "%UNITY_PATH%" (
    echo Found UnityYAMLMerge at: "%UNITY_PATH%"

    rem Escape path for Git by using double quotes around the whole string and escaped quotes inside
    git config merge.tool unityyamlmerge
    git config mergetool.unityyamlmerge.cmd "\"\"%UNITY_PATH%\"\" merge -p \"%%BASE\" \"%%REMOTE\" \"%%LOCAL\" \"%%MERGED\""
    git config mergetool.unityyamlmerge.trustExitCode true

    echo Git has been configured to use UnityYAMLMerge.
) else (
    powershell -Command "Write-Host 'ERROR: UnityYAMLMerge not found at:' -ForegroundColor Red"
    powershell -Command "Write-Host '%UNITY_PATH%' -ForegroundColor Red"
    powershell -Command "Write-Host 'Please check your Unity version or modify the script.' -ForegroundColor Red"
)

endlocal
pause