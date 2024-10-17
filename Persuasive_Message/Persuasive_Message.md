# Proyecto: Deciphering the Neural Responses to a Naturalistic Persuasive Message

## Descripción del Proyecto
Este proyecto investiga las respuestas neurales a un mensaje persuasivo sobre la alimentación saludable, basado en un estudio realizado por Ioannis Ntoumanis, Julia Sheronova, Alina Davydova, Maria Dolgaleva, Iiro P. Jääskeläinen, Vladimir Kosonogov, Anna N. Shestakova y Vasily Klucharev.

Cincuenta participantes sanos escucharon un mensaje persuasivo sobre alimentación saludable durante la resonancia magnética funcional (fMRI). Antes y después de la narrativa, realizaron una tarea de pujas, la cual determinó qué participantes fueron persuadidos por el mensaje sobre alimentación saludable y cuáles no.

Este estudio investiga la base neural del cambio de valoración inducido por un mensaje persuasivo sobre la alimentación saludable, empleando estímulos naturalistas. Los participantes realizaron dos bloques de una tarea de pujas, donde pujaban por productos que contenían azúcar, sin azúcar y no comestibles, durante la fMRI. Después del primer bloque, escucharon un mensaje persuasivo que influyó en su comportamiento de pujas.

### Hallazgos
- Los participantes que resistieron la persuasión exhibieron una sincronización aumentada de la actividad cerebral en varias regiones, incluidas estructuras de la red de modo predeterminado.
- La conectividad funcional entre estas regiones cerebrales era más débil en individuos persuadidos.
- Estos resultados apoyan la idea de adaptar mensajes persuasivos para campañas de promoción de la salud, mostrando cómo las respuestas cerebrales pueden predecir la efectividad del mensaje.

## Contenido del Proyecto

### 1. Imágenes Utilizadas
- **sub-33_T1w.nii**: Imagen anatómica en formato NIfTI que representa la estructura cerebral del sujeto.
- **sub-33_task-narrative_bold.nii.gz**: Imagen funcional BOLD que muestra la actividad cerebral del sujeto durante la tarea de pujas.
- **sub-33_task-narrative_events.tsv**: Archivo de eventos que contiene información sobre los tiempos y tipos de eventos durante la tarea.

### 2. Archivos de Código
- **Persuasive_Message.m**: Script principal para cargar, visualizar y analizar las imágenes anatómicas y funcionales.

## Descripción de la Visualización

El script proporciona las siguientes visualizaciones:

- **Imagen Anatómica T1w**: Visualización 3D de la imagen anatómica del cerebro.
- **Imagen Funcional BOLD**: Visualización 3D de la imagen funcional, mostrando la actividad cerebral en el tiempo seleccionado.
- **Cortes Axiales, Sagitales y Coronales**: Se muestran diferentes cortes de la imagen anatómica y funcional para una mejor comprensión.

## Análisis de Eventos

- Se cargan y muestran los eventos de la tarea a partir del archivo `.tsv`, incluyendo los tiempos y tipos de eventos.
- Se imprime el número total de eventos en la consola de MATLAB, proporcionando información sobre la duración y frecuencia de los eventos presentados.

## Notas
- Asegúrate de que los archivos de imagen estén en formato NIfTI y sean válidos para evitar errores al cargar los datos.
- Puedes modificar el script para analizar diferentes sujetos o imágenes cambiando las rutas de los archivos al inicio del script.

## Contacto
- **Rafael Ramírez Salas**  
  Universidad de Málaga
