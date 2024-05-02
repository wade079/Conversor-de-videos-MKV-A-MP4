@echo off
SET "basePath=Videos"

REM Create main and logs folder structure
mkdir "%basePath%"
mkdir "%basePath%\logs"

REM Error checking for main directories creation
if %errorlevel% neq 0 (
    echo Error creating main or logs folder "%basePath%".
    echo Error creating main or logs folder "%basePath%" > "%basePath%\logs\error_log.txt"
)

REM Create subfolder for MKV videos
mkdir "%basePath%\videos_mkv"
if %errorlevel% neq 0 (
    echo Error creating subfolder videos_mkv in "%basePath%\videos_mkv".
    echo Error creating subfolder videos_mkv in "%basePath%\videos_mkv" >> "%basePath%\logs\error_log.txt"
)

REM Create subfolder for MP4 videos
mkdir "%basePath%\videos_mp4"
if %errorlevel% neq 0 (
    echo Error creating subfolder videos_mp4 in "%basePath%\videos_mp4".
    echo Error creating subfolder videos_mp4 in "%basePath%\videos_mp4" >> "%basePath%\logs\error_log.txt"
)

REM Create folder for audio information
mkdir "%basePath%\audio_videos_mp4"
if %errorlevel% neq 0 (
    echo Error creating subfolder audio_videos_mp4 in "%basePath%\audio_videos_mp4".
    echo Error creating subfolder audio_videos_mp4 in "%basePath%\audio_videos_mp4" >> "%basePath%\logs\error_log.txt"
)

echo Folder structure created successfully.

REM Process MKV videos to extract audio information
echo Processing MKV videos to extract audio information.
cd "%basePath%\videos_mkv"

FOR %%A IN (*.mkv) DO (
    ffprobe -loglevel error -select_streams a -show_entries stream=index:stream_tags=language -of csv=p=0 "%%A" > "..\audio_videos_mp4\%%~nA_audio_info.txt"
    for /F "tokens=1,2 delims=," %%I in ('type "..\audio_videos_mp4\%%~nA_audio_info.txt" ^| findstr "spa"') do (
        ffmpeg -i "%%A" -map 0:v -map 0:%%I -c:v copy -c:a ac3 "..\videos_mp4\%%~nA.mp4"
    )
)

echo Audio information extracted and videos converted for all MKV files.
pause

:end
REM End of script


