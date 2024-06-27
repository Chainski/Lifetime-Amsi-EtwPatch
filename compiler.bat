:: https://github.com/Chainski/Lifetime-Amsi-EtwPatch
@echo off
:: Download a nim compiler from here https://nim-lang.org/install.html along with its C compiler https://nim-lang.org/download/mingw64.7z
:: After installing both, add them to your environment variables 
:: rundll32 sysdm.cpl,EditEnvironmentVariables
:: After running the command above as admin go to system variables and select path click edit, select new then input the path to the downloaded binaries. 
color 4
REM Check if Nim is on the PATH
where nim > nul 2>&1
if "%errorlevel%" neq "0" (
    echo "Nim is not found on the PATH. Please add Nim to your PATH environment variable."
    pause
    exit /b 1
)
REM Check if GCC (or another C compiler) is on the PATH
where gcc > nul 2>&1
if "%errorlevel%" neq "0" (
    echo "GCC (or another C compiler) is not found on the PATH. Please install GCC and add it to your PATH."
    pause
    exit /b 1
)
color 7
nim c -d:release --passL:"-s" --cpu=amd64 --out=lifetime_patch main.nim 
pause
