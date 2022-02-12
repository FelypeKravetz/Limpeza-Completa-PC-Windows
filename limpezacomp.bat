:: somente fiz a automatização dos scripts enviados, como nao tinha creditos não coloquei
@echo off
title [Limpador de Flagrantes  by:phoor]
color 0B
if "%1" neq "" ( goto %1)
:Menu
cls
:::              _ _,---._
:::           ,-','       `-.___
:::          /-;'               `._
:::         /\/          ._   _,'o \
:::        ( /\       _,--'\,','"`. )
:::         |\      ,'o     \'    //\
:::         |      \        /   ,--'""`-.
:::         :       \_    _/ ,-'         `-._
:::          \        `--'  /                )
:::           `.  \`._    ,'     ________,','
:::             .--`     ,'  ,--` __\___,;'
:::              \`.,-- ,' ,`_)--'  /`.,'
:::               \( ;  | | )      (`-/
:::                 `--'| |)       |-/
:::                   | | |        | |
:::                   | | |,.,-.   | |_
:::                   | `./ /   )---`  )
:::                  _|  /    ,',   ,-'
:::                 ,'|_(    /-<._,' |--,
:::                 |    `--'---.     \/ \
:::                 |          / \    /\  \
:::               ,-^---._     |  \  /  \  \
:::            ,-'        \----'   \/    \--`.
:::
:::       ._  |_   _   _  ._   | o ._   _  
:::       |_) | | (_) (_) |    | | |_) (/_ 
:::       |                        |     
:::      
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo 1. Iniciar Limpeza IP 
echo 2. Iniciar Limpeza TMP
echo 3. Iniciar Limpeza Registro
echo 4. Iniciar Limpeza TMP (Advanced)
echo 5. Creditos
echo 6. Sair
echo.
set /p resposta=Digite a tarefa a ser executada e pressione Enter:
if %resposta%==1 goto Iniciar_1
if %resposta%==2 goto Iniciar_2
if %resposta%==3 goto Iniciar_3
if %resposta%==4 goto Iniciar_4
if %resposta%==5 goto Creditos
if %resposta%==6 goto Sair
:Sair
cls
echo Saindo obrigado por usar!
pause
exit /b
:Creditos
cls
echo Creditos
echo.
echo.
echo Recebi alguns scripts e resolvi juntar todos eles
echo Somente para ficar mais facil a execucao
echo como nao tinha creditos fica anonimo 
echo 				by:Phoor
pause
goto Menu
:Iniciar_1
cls
echo Iniciando Limpeza de IP!
IPCONFIG /RELEASE
IPCONFIG /FLUSHDNS
NET STOP DNSCACHE
NET STOP DHCP
NET START DNSCACHE
NET START DHCP
IPCONFIG /REGISTERDNS
IPCONFIG /RENEW
arp -a -d
netsh interface ip delete arpcache
netsh interface ip delete destinationcache
nbtstat -R
nbtstat -RR
netsh int ip reset
netsh winsock reset catalog
goto Menu
:Iniciar_2
del *.tmp /s
DEL /S /Q /F "%TEMP%\*.*"  
FOR /D %%d IN ("%TEMP%\*.*") DO RD /S /Q "%%d"  
DEL /S /Q /F "%Userprofile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*"  
FOR /D %%d IN ("%Userprofile%\AppData\Local\Microsoft\Windows\Temporary Internet Files\*.*") DO RD /S /Q "%%d"  
DEL /S /Q /F "%userprofile%\Recent\*.*"  
FOR /D %%d IN ("%Userprofile%\Recent\*.*") DO RD /S /Q "%%d"  
DEL /S /Q /F "%Userprofile%\Configurações locais\Temporary Internet Files\*.*"  
FOR /D %%d IN ("%Userprofile%\Configurações locais\Temporary Internet Files\*.*") DO RD /S /Q "%%d"  
DEL /S /Q /F "%userprofile%\Recent\*.*"  
FOR /D %%d IN ("%Userprofile%\Recent\*.*") DO RD /S /Q "%%d"  
DEL /F/S/Q %WINDIR%\*.TMP  
DEL /F/S/Q %WINDIR%\TEMP\*.*  
FOR /D %%d IN ("%WINDIR%\TEMP\*.*") DO RD /S /Q "%%d"  
DEL /F/S/Q %WINDIR%\Prefetch\*.*  
net stop spooler
cd %systemroot%\system32\spool\PRINTERS
del /f /s *.SHD
del /f /s *.SPL
net start spooler
REG ADD "HKLM\System\CurrentControlSet\Serices\SharedAccess\Parameters\FirewallPolicy\StandardProfile" /v EnableFirewall /t REG_DWORD /d 0x00000000 /f
REG ADD "HKLM\Software\Policies\Microsoft\Messenger\Client " /v PreventRun /t REG_DWORD /d 0x00000001 /f
REG ADD "HKLM\Software\Microsoft\Windows NT\CurrentVersion\EFS" /v EfsConfiguratiom /t REG_DWORD /d 0x00000001 /f
REG ADD "HKLM\Software\Microsoft\Security Center" /v UpdatesDisableNotify /t REG_DWORD /d 0x00000001 /f
REG ADD "HKLM\Software\Microsoft\Security Center" /v FirewallDisableNotify /t REG_DWORD /d 0x00000001 /f
REG ADD "HKLM\Software\Microsoft\Security Center" /v AntiVirusDisableNotify /t REG_DWORD /d 0x00000001 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Cache" /v Persistent /t REG_DWORD /d 0x00000000 /f
REG ADD "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v ClearPageFileATShutdown /t REG_SZ /d 1 /f
REG ADD "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v AlwaysUnloadDLL /t REG_SZ /d 1 /f
REG ADD "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 100 /f 
REG ADD "HKU\.DEFAULT\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 100 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoAutoUpdate /t REG_DWORD /d 0x00000001 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v ClearRecentDocsOnExit /t REG_DWORD /d 0x00000001 /f
goto Menu
:Iniciar_3
%homedrive%
cd %USERPROFILE%
cd..
set profiles=%cd%

for /f "tokens=* delims= " %%u in ('dir /b/ad') do (

cls
title Limpador de Flagrantes  [by:phoor] Excluindo %%u COOKIES. . .
if exist "%profiles%\%%u\cookies" echo Excluindo....
if exist "%profiles%\%%u\cookies" cd "%profiles%\%%u\cookies"
if exist "%profiles%\%%u\cookies" del *.* /F /S /Q /A: R /A: H /A: A

cls
title Limpador de Flagrantes  [by:phoor] Excluindo %%u Temp Files. . .
if exist "%profiles%\%%u\Local Settings\Temp" echo Excluindo....
if exist "%profiles%\%%u\Local Settings\Temp" cd "%profiles%\%%u\Local Settings\Temp"
if exist "%profiles%\%%u\Local Settings\Temp" del *.* /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\Local Settings\Temp" rmdir /s /q "%profiles%\%%u\Local Settings\Temp"

cls
title Limpador de Flagrantes  [by:phoor] Excluindo %%u Temp Files. . .
if exist "%profiles%\%%u\AppData\Local\Temp" echo Excluindo....
if exist "%profiles%\%%u\AppData\Local\Temp" cd "%profiles%\%%u\AppData\Local\Temp"
if exist "%profiles%\%%u\AppData\Local\Temp" del *.* /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Temp" rmdir /s /q "%profiles%\%%u\AppData\Local\Temp"

cls
title Limpador de Flagrantes  [by:phoor] Excluindo %%u Temporary Internet Files. . .
if exist "%profiles%\%%u\Local Settings\Temporary Internet Files" echo Excluindo....
if exist "%profiles%\%%u\Local Settings\Temporary Internet Files" cd "%profiles%\%%u\Local Settings\Temporary Internet Files"
if exist "%profiles%\%%u\Local Settings\Temporary Internet Files" del *.* /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\Local Settings\Temporary Internet Files" rmdir /s /q "%profiles%\%%u\Local Settings\Temporary Internet Files"

cls
title Limpador de Flagrantes  [by:phoor] Excluindo %%u Temporary Internet Files. . .
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" echo Excluindo....
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" cd "%profiles%\%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files"
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" del *.* /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files" rmdir /s /q "%profiles%\%%u\AppData\Local\Microsoft\Windows\Temporary Internet Files"

cls
title Limpador de Flagrantes  [by:phoor] Excluindo %%u WER Files. . .
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" echo Excluindo....
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" cd "%profiles%\%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive"
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" del *.* /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive" rmdir /s /q "%profiles%\%%u\AppData\Local\Microsoft\Windows\WER\ReportArchive"


cls
title Limpador de Flagrantes  [by:phoor] Excluindo %Systemroot%\Temp
if exist "%Systemroot%\Temp" echo Excluindo....
if exist "%Systemroot%\Temp" cd "%Systemroot%\Temp"
if exist "%Systemroot%\Temp" del *.* /F /S /Q /A: R /A: H /A: A
if exist "%Systemroot%\Temp" rmdir /s /q "%Systemroot%\Temp"

cls
title Limpador de Flagrantes  [by:phoor] Excluindo %SYSTEMDRIVE%\Temp
if exist "%SYSTEMDRIVE%\Temp" echo Excluindo....
if exist "%SYSTEMDRIVE%\Temp" cd "%SYSTEMDRIVE%\Temp"
if exist "%SYSTEMDRIVE%\Temp" del *.* /F /S /Q /A: R /A: H /A: A
if exist "%SYSTEMDRIVE%\Temp" rmdir /s /q "%Systemroot%\Temp"

cls
title Limpador de Flagrantes  [by:phoor] Excluindo %%u FIREFOX TEMP. . .
if exist "%profiles%\%%u\AppData\Local\Mozilla\Firefox\Profiles" echo Excluindo....
if exist "%profiles%\%%u\AppData\Local\Mozilla\Firefox\Profiles" cd "%profiles%\%%u\AppData\Local\Mozilla\Firefox\Profiles"
if exist "%profiles%\%%u\AppData\Local\Mozilla\Firefox\Profiles" del *.* /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Mozilla\Firefox\Profiles" rmdir /s /q "%profiles%\%%u\AppData\Local\Mozilla\Firefox\Profiles"
FOR /D %%p IN ("C:\Users\CENTRALDEVENDAS\AppData\Roaming\Mozilla") DO rmdir "%%p" /s /q
FOR /D %%p IN ("C:\Users\CENTRALDEVENDAS\AppData\Local\Mozilla") DO rmdir "%%p" /s /q
FOR /D %%p IN ("C:\Users\CENTRALDEVENDAS\AppData\Local\Temp") DO rmdir "%%p" /s /q
FOR /D %%p IN ("C:\Users\CENTRALDEVENDAS\AppData\LocalLow\Mozilla") DO rmdir "%%p" /s /q

cls
title Limpador de Flagrantes  [by:phoor] Excluindo %%u CHROME TEMP. . .
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" echo Excluindo....
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" cd "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache"
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" del *.* /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache" rmdir /s /q "%profiles%\%%u\AppData\Local\Google\Chrome\User Data\Default\Cache"

cls
title Limpador de Flagrantes  [by:phoor] Excluindo %%u EDGE TEMP. . .
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCache" echo Excluindo....
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCache" cd "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCache"
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCache" del *.* /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCache" rmdir /s /q "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCache"

cls
title Limpador de Flagrantes  [by:phoor] Excluindo %%u EDGE COOKIES. . .
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCookies" echo Excluindo....
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCookies" cd "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCookies"
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCookies" del *.* /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCookies" rmdir /s /q "%profiles%\%%u\AppData\Local\Microsoft\Windows\INetCookies"

cls
title Limpador de Flagrantes  [by:phoor] Excluindo %%u RDP TEMP. . .
if exist "%profiles%\%%u\AppData\Local\Microsoft\Terminal Server Client\Cache" echo Excluindo....
if exist "%profiles%\%%u\AppData\Local\Microsoft\Terminal Server Client\Cache" cd "%profiles%\%%u\AppData\Local\Microsoft\Terminal Server Client\Cache"
if exist "%profiles%\%%u\AppData\Local\Microsoft\Terminal Server Client\Cache" del *.* /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Microsoft\Terminal Server Client\Cache" rmdir /s /q "%profiles%\%%u\AppData\Local\Microsoft\Terminal Server Client\Cache"

cls
title Limpador de Flagrantes  [by:phoor] Excluindo %%u OPERA TEMP. . .
if exist "%profiles%\%%u\AppData\Local\Opera Software\Opera Next\Cache" echo Excluindo....
if exist "%profiles%\%%u\AppData\Local\Opera Software\Opera Next\Cache" cd "%profiles%\%%u\AppData\Local\Opera Software\Opera Next\Cache"
if exist "%profiles%\%%u\AppData\Local\Opera Software\Opera Next\Caches" del *.* /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Opera Software\Opera Next\Cache" rmdir /s /q "%profiles%\%%u\AppData\Local\Opera Software\Opera Next\Cache"


cls
title Limpador de Flagrantes  [by:phoor] Excluindo %%u VIVALDI TEMP. . .
if exist "%profiles%\%%u\AppData\Local\Vivaldi\User Data\Default\Cache" echo Excluindo....
if exist "%profiles%\%%u\AppData\Local\Vivaldi\User Data\Default\Cache" cd "%profiles%\%%u\AppData\Local\Vivaldi\User Data\Default\Cache"
if exist "%profiles%\%%u\AppData\Local\Vivaldi\User Data\Default\Cache" del *.* /F /S /Q /A: R /A: H /A: A
if exist "%profiles%\%%u\AppData\Local\Vivaldi\User Data\Default\Cache" rmdir /s /q "%profiles%\%%u\AppData\Local\Vivaldi\User Data\Default\Cache"

)
cls
goto Menu
:Iniciar_4
cls
DEL /F /S /Q %HOMEPATH%\Config~1\Temp\*.*
DEL /F /S /Q C:\WINDOWS\Temp\*.*
DEL /F /S /Q C:\WINDOWS\%Temp%\*.*
DEL /F /S /Q C:\WINDOWS\Prefetch\*.*
DEL "%WINDIR%\Tempor~1\*.*" /F /S /Q
RD /S /Q "%HOMEPATH%\Config~1\Temp"
MD "%HOMEPATH%\Config~1\Temp"
RD /S /Q C:\WINDOWS\Temp\
MD C:\WINDOWS\Temp
RD /S /Q C:\WINDOWS\Prefetch\
MD C:\WINDOWS\Prefetch
DEL /F /S /Q %HOMEPATH%\Config~1\Temp\*.*
DEL /F /S /Q C:\WINDOWS\Temp\*.*
DEL /F /S /Q C:\WINDOWS\%Temp%\*.*
DEL /F /S /Q C:\WINDOWS\Prefetch\*.*
DEL "%WINDIR%\Tempor~1\*.*" /F /S /Q
RD /S /Q "%HOMEPATH%\Config~1\Temp"
MD "%HOMEPATH%\Config~1\Temp"
RD /S /Q C:\WINDOWS\Temp\
MD C:\WINDOWS\Temp
RD /S /Q C:\WINDOWS\Prefetch\
MD C:\WINDOWS\Prefetch
goto Menu