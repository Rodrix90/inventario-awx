@echo off
echo -------------------------------------------
echo GENERADOR DE INVENTARIO (SIN CREDENCIALES)
echo -------------------------------------------

:: Verifica si Python está disponible
where python >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python no está instalado o no está en el PATH.
    pause
    exit /b 1
)

:: Ejecuta el script Python
python generar_inventario.py
if %errorlevel% neq 0 (
    echo ❌ Error al generar el archivo hosts.yml desde el Excel.
    pause
    exit /b 1
)

cd "C:\Users\ragonzalez\Documents\inventario-awx\awx_generador_ruta_personalizada"

:: Subir a GitHub
git add hosts.yml
git commit -m "Inventario actualizado (sin credenciales)"
git push origin main

if %errorlevel% equ 0 (
    echo ✅ Inventario subido correctamente a GitHub.
) else (
    echo ❌ Error al hacer push a GitHub.
)

pause
