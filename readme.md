# Script de Procesamiento por Lotes para Archivos de Video

## Descripción

Este script automatiza el proceso de manejo y conversión de archivos de video. Organiza los videos en carpetas específicas, extrae información de audio de archivos MKV y convierte flujos seleccionados al formato MP4. El script maneja específicamente la extracción de flujos de audio etiquetados con 'spa' (español), asegurando que estos flujos se incluyan en los archivos MP4 de salida.

## Estructura de Carpetas

El script crea una estructura de directorios bajo la ruta base `Videos` con carpetas separadas para registros, videos MKV, videos MP4 e información de audio extraída de los videos MKV.

- `Videos/`
  - `logs/` - Contiene archivos de registro que documentan errores durante la creación de carpetas.
  - `videos_mkv/` - Destinado para archivos de video MKV.
  - `videos_mp4/` - Destino para videos convertidos a MP4.
  - `audio_videos_mp4/` - Almacena información de los flujos de audio extraídos de los archivos MKV.

## Requisitos

- Sistema operativo Windows con acceso a la línea de comandos.
- FFmpeg debe estar instalado y disponible en el PATH del sistema para ejecutar comandos de conversión y extracción.

## Cómo Usar

1. Coloca tus archivos MKV en el directorio `Videos/videos_mkv/`.
2. Ejecuta el script a través de la línea de comandos navegando al directorio del script y escribiendo `nombre_del_script.bat`.
3. Los archivos MP4 procesados se guardarán en el directorio `Videos/videos_mp4/` con pistas de audio que tienen la etiqueta 'spa', si están disponibles.

## Operaciones del Script

- **Creación de Directorios:** Verifica y crea los directorios necesarios.
- **Manejo de Errores:** Registra errores durante la creación de directorios en `Videos/logs/`.
- **Extracción de Audio:** Utiliza FFprobe para extraer información de audio de archivos MKV y la guarda.
- **Conversión de Video:** Convierte archivos MKV a formato MP4, copiando selectivamente flujos de video y flujos de audio en español basados en la información extraída.

## Notas

- Asegúrate de que FFmpeg esté correctamente instalado y que sus ejecutables (`ffmpeg`, `ffprobe`) sean accesibles desde la línea de comandos.
- El script asume que los archivos MKV se almacenan en el directorio especificado y no buscará en subdirectorios.
- Este script procesa específicamente flujos de audio etiquetados con 'spa'. Para otros idiomas, modifica la parte del script `findstr "spa"` según sea necesario.
