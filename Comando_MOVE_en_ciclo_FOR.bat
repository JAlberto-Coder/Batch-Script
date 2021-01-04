@echo on

rem **************************************************
rem Version: 1.0.0
rem **************************************************
rem Autor: JAlberto-Coder
rem Fecha: 03-01-2021
rem Descripcion: BAT que copia archivos de un lugar a otro
rem 		Validar antes que existan los directorios
rem **************************************************

rem INICIO: VARIABLES
set RUTA_SOURCE=C:\SQL\Backup\
set RUTA_TARGET=G:\Mi unidad\eCore Respaldos\
set ARCHIVO_CONTROL=Historia.log
set ANIO=%date:~6,4%
set MES=%date:~3,2%
set DIA=%date:~0,2%
set HORA=%time:~0,2%
set HORA=%HORA: =0%
set MINUTO=%time:~3,2%
set SEGUNDO=%time:~6,2% 
rem FIN: VARIABLES

rem INICIO: ARCHIVO LOG
if not exist "%RUTA_TARGET%%ARCHIVO_CONTROL%" (
	echo INICIO %ANIO%%MES%%DIA%_%HORA%%MINUTO%	> "%RUTA_TARGET%%ARCHIVO_CONTROL%"
) else (
	echo INICIO %ANIO%%MES%%DIA%_%HORA%%MINUTO% >> "%RUTA_TARGET%%ARCHIVO_CONTROL%"
)
rem FIN: ARCHIVO LOG

echo " " >> "%RUTA_TARGET%%ARCHIVO_CONTROL%"

rem INICIO: COMANDO MOVE
for /R "%RUTA_SOURCE%" %%v in (*.bak) do (
	echo ARCHIVO A MOVER: %%v >> "%RUTA_TARGET%%ARCHIVO_CONTROL%"
	move %%v "%RUTA_TARGET%" >> "%RUTA_TARGET%%ARCHIVO_CONTROL%"
)
rem FIN: COMANDO MOVE

echo " " >> "%RUTA_TARGET%%ARCHIVO_CONTROL%"
echo FIN >> "%RUTA_TARGET%%ARCHIVO_CONTROL%"
echo " " >> "%RUTA_TARGET%%ARCHIVO_CONTROL%"

exit 0