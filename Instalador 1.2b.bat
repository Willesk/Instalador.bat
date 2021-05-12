@echo off
chcp 1252 > nul
cls

title 	INSTALADOR DE PROGRAMAS 1.2b

echo.
color 0A
echo.
echo 				Instalador Criado Por: William Sartori
echo.
set 		data=%date:~0,2%-%date:~3,2%-%date:~6,4%
set 		hora=%time:~0,2%:%time:~3,2%
echo 					Data atual: %data%
echo 					Hora Atual: %hora%
echo.
echo 		   	   Computador: %computername%  -  Usuario: %username% 
echo.                        
echo 			   	   ==========================
echo 				   ==	   Iniciando...    ==
echo				           ==                      ==
echo				           ==========================
echo.
echo.
pause


:MENU
cls
title MENU
echo.
echo.
echo               ====================== MENU ======================
echo              ^|--------------------------------------------------^|
echo              ^|                                                  ^|	
echo              ^|    1 - UAC                                       ^|	
echo              ^|    2 - Instalar Programas                        ^|
echo              ^|    0 - Exit                                      ^|
echo              ^|                                                  ^|
echo              ^|--------------------------------------------------^|
echo.

set /p opcao= Escolha uma opcao 
if %opcao% equ 1 goto UAC
if %opcao% equ 2 goto INSTALL
if %opcao% equ 0 goto FIM

:INSTALL
title instalando
cd \
if exist "%ProgramFiles%\7-Zip\7z.exe" (goto 7z-OK) ELSE (goto 7z-NO)
:7z-No
echo instalando...
cd \
cd /d H:\Programas
start /wait 7z1900-x64.exe /S
echo 7z Instalado!
echo.

:2
cd \
if exist "C:\Windows\Microsoft.NET\Framework\v3.5" (goto .NET-OK) ELSE (goto .NET-no)
:.NET-no
echo instalando .NET 3.5...
cd \
cd /d H:\Programas
start /wait dotnetfx35.exe /q /norestart
echo .NET Instalado!
echo.


:3
cd \
if exist "%ProgramFiles%\Mozilla Firefox\firefox.exe" (goto Firefox-OK) ELSE (goto Firefox-NO)
:Firefox-NO
echo Instalando Firefox 88.0...
cd \
cd /d H:\Programas
start /wait Firefox88.0.exe -ms -ma
echo Firefox Instalado!
echo.

:4
cd \
if exist "%ProgramFiles%\Google\Chrome\Application\chrome.exe" (goto CHROME-OK) ELSE (goto CHROME-NO)
:CHROME-NO
echo Instalando Google Chrome...
cd \
cd /d H:\Programas
start /wait ChromeStandaloneSetup64.exe /silent /install
echo Google Chrome Instalado!
echo.

:5
cd \
if exist "C:\Program Files (x86)\K-Lite Codec Pack\MPC-HC64\mpc-hc64.exe" (goto K-OK) ELSE (goto K-NO)
:K-NO
echo Instalando K-lite Mega Codec Pack...
cd \
cd /d H:\Programas
start /wait K-Lite_Codec_Pack_1612_Mega.exe /VERYSILENT /NORESTART
start /wait klcp_update_1614_20210422.exe /VERYSILENT /NORESTART
echo K-lite Mega Codec Pack Instalado!
echo.

:6
if exist "%ProgramFiles%\VideoLAN\VLC\vlc.exe" (goto VLC-OK) ELSE (goto VLC-NO)
:VLC-NO
echo Instalando VLC Player...
cd \
cd /d H:Programas
start /wait vlc-3.0.12-win64.exe /S
echo VLC Player Instalado!
echo.

:7
if exist "%ProgramFiles%\qBittorrent\qbittorrent.exe" (goto Qbit-OK) ELSE (goto Qbit-NO)
:Qbit-NO
echo Instalando Qbittorrent...
cd \
cd /d H:\Programas
start /wait qbittorrent_4.3.4.1_x64_setup.exe /S
echo Qbittorrent Instalado!
echo.


:8
if exist "%ProgramFiles%\Java\jre1.8.0_291" (goto JAVA-OK) ELSE (goto JAVA-NO)
:JAVA-NO
echo Instalanddo Java...
cd \
cd /d H:\Programas
start /wait jre-8u291-windows-x64.exe /s
echo Java Instalado!
echo.


:9
if exist "C:\Program Files (x86)\AnyDesk\AnyDesk.exe" (goto AnyDesk-OK) ELSE (goto AnyDesk-NO)
:AnyDesk-NO
echo Instalando AnyDesk...
cd \
cd /d H:\Programas
start /wait AnyDesk.exe --start-with-win --create-shortcuts --create-desktop-icon --silent
echo. AnyDesk Instalado!
echo.
echo Programas Instalados.
echo.
pause
goto MENU

:UAC
title UAC
cls
echo.
echo.
echo               ======================  UAC  ======================
echo              ^|--------------------------------------------------^|
echo              ^|                                                  ^|	
echo              ^|    1 - Desabilitar UAC                           ^|	
echo              ^|    2 - Habilitar UAC                             ^|
echo              ^|    0 - Voltar                                    ^|
echo              ^|                                                  ^|
echo              ^|--------------------------------------------------^|
echo.

set /p opcao= Escolha uma opcao 
if %opcao% equ 1 goto DESABILITA UAC
if %opcao% equ 2 goto HABILITA UAC
if %opcao% equ 0 goto MENU

:DESABILITA UAC
echo desabilitando UAC...
@echo off
%windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 0 /f
msg * Para que as alterações tenham efeito, seu computador será reiniciado.
echo UAC desabilitado. Reiniciando...
pause
c \
shutdown -r
goto FIM

:HABILITA UAC
echo Habilitando UAC...
@echo off
%windir%\System32\reg.exe ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f
msg * Para que as alterações tenham efeito, seu computador será reiniciado.
echo UAC Habilitado. Reiniciando...
pause
c \
shutdown -r
goto FIM

:FIM
cls
exit


:7z-OK
echo 7zip OK
echo.
goto 2

:.NET-OK
echo .NET OK
echo.
goto 3

:Firefox-OK
echo Firefox OK
echo.
goto 4


:CHROME-OK
echo Google Chrome OK
echo.
goto 5

:K-OK
echo K-lite Mega Codec Pack OK
echo.
goto 6

:VLC-OK
echo VLC Player OK
echo.
goto 7

:Qbit-OK
echo Qbittorrent OK
echo.
goto 8

:JAVA-OK
echo JAVA Ok
echo.
goto 9

:AnyDesk-OK
echo AnyDesk OK
echo.
pause
goto MENU