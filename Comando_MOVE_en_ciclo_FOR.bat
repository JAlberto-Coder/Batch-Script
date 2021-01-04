@echo on

REM **************************************************
REM Version: 1.0.0
REM **************************************************
REM Autor: JAlberto-Coder
REM Fecha: 03-01-2021
REM Descripcion: BAT que copia archivos de un lugar a otro
REM 			 Validar antes que existan los directorios
REM **************************************************

REM INICIO: VARIABLES
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
REM FIN: VARIABLES

REM INICIO: ARCHIVO LOG
if not exist "%RUTA_TARGET%%ARCHIVO_CONTROL%" (
	echo INICIO %ANIO%%MES%%DIA%_%HORA%%MINUTO%	> "%RUTA_TARGET%%ARCHIVO_CONTROL%"
) else (
	echo INICIO %ANIO%%MES%%DIA%_%HORA%%MINUTO% >> "%RUTA_TARGET%%ARCHIVO_CONTROL%"
)
REM FIN: ARCHIVO LOG

echo " " >> "%RUTA_TARGET%%ARCHIVO_CONTROL%"

REM INICIO: COMANDO MOVE
for /R "%RUTA_SOURCE%" %%v in (*.bak) do (
	echo ARCHIVO A MOVER: %%v >> "%RUTA_TARGET%%ARCHIVO_CONTROL%"
	move %%v "%RUTA_TARGET%" >> "%RUTA_TARGET%%ARCHIVO_CONTROL%"
)
REM FIN: COMANDO MOVE

echo " " >> "%RUTA_TARGET%%ARCHIVO_CONTROL%"
echo FIN >> "%RUTA_TARGET%%ARCHIVO_CONTROL%"
echo " " >> "%RUTA_TARGET%%ARCHIVO_CONTROL%"

exit 0