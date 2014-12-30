echo 'Installing 7zip'
choco install 7zip.commandline

echo 'Installing Java JDK'
choco install java.jdk

echo 'Installing .NET Framework (needed by Growl)'
choco install DotNet3.5

echo 'Installing Growl for Windows'
choco install Growl

echo 'Installing Wget'
choco install Wget

echo 'Installing Notifu'
wget -O %TEMP%\notifu.zip http://www.paralint.com/projects/notifu/dl/notifu-1.6.zip
if exist c:\notifu rd /s /q c:\notifu
mkdir c:\notifu
7za x %TEMP%\notifu.zip -oc:\notifu -r
setx PATH "%PATH%;c:\notifu"

echo 'Installing Snarl'
wget -O %TEMP%\melon.exe http://sourceforge.net/projects/snarlwin/files/Goodies/setup-minimal.exe/download
%TEMP%\melon.exe /S
wget -O %TEMP%\snarl.exe http://sourceforge.net/projects/snarlwin/files/latest/download?source=files

if NOT %ERRORLEVEL% == 0 exit /B %ERRORLEVEL%
%TEMP%\snarl.exe /S
if %ERRORLEVEL% == 1223 exit /B 0
