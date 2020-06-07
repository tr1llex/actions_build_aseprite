powershell.exe ./install.ps1
call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\Common7\Tools\VsDevCmd.bat" -arch=x64
cd tmp
for /F %%i in ('chdir') do ( set workdir=%%i)
cd aseprite
cd build
cmake -DCMAKE_C_COMPILER=cl -DCMAKE_CXX_COMPILER=cl -DCMAKE_BUILD_TYPE=Release -DLAF_BACKEND=skia -DSKIA_DIR=%workdir%\skia -DSKIA_LIBRARY_DIR=%workdir%\skia\out\Release-x64 -G Ninja ..
ninja aseprite
cd bin
7z a aseprite-win64.zip * -mx0
mv aseprite-win64.zip %workdir%\..
rmdir /s /q %workdir%