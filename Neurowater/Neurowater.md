# Proyecto: Análisis de Imágenes Anatómicas y Funcionales en Neurociencia

Este proyecto tiene como objetivo analizar y visualizar imágenes anatómicas y funcionales obtenidas de estudios de neurociencia. Se utilizan imágenes en formato NIfTI (.nii), comúnmente usadas en investigaciones de neuroimagen, para estudiar la anatomía cerebral y la actividad funcional del cerebro durante una tarea específica.

## Contenido del Proyecto

### 1. Imágenes Utilizadas
- **sub-10_T1w.nii**: Imagen anatómica en formato NIfTI que representa la estructura cerebral del sujeto.
- **sub-10_task-MSG_bold.nii**: Imagen funcional BOLD (Blood Oxygen Level Dependent) que muestra la actividad cerebral del sujeto durante una tarea específica.

### Archivo de Código
- **Neurowater.m**: Script principal para cargar, visualizar y analizar las imágenes anatómicas y funcionales.

## Descripción de la Visualización

El script proporciona las siguientes visualizaciones:

- **Imagen Anatómica T1w**: Visualización 3D de la imagen anatómica del cerebro.
- **Imagen Funcional BOLD**: Visualización 3D de la imagen funcional, mostrando la actividad cerebral en el tiempo seleccionado.
- **Cortes Axiales, Sagitales y Coronales**: Muestra diferentes cortes de la imagen anatómica y funcional para una mejor comprensión.
- **Histogramas de Intensidad**: Representación gráfica de la distribución de la intensidad de píxeles en las imágenes anatómicas y funcionales.
- **Animación del Volumen BOLD**: Recorrido visual a través del volumen funcional BOLD a lo largo del tiempo.

## Análisis Estadístico

Se incluyen estadísticas básicas de las imágenes:
- Valor medio y valor máximo de las intensidades en las imágenes anatómicas y funcionales, que se muestran en la consola de MATLAB.

## Notas

- Asegúrate de que los archivos de imagen estén en formato NIfTI y sean válidos para evitar errores al cargar los datos.
- Puedes modificar el script para analizar diferentes sujetos o imágenes cambiando las rutas de los archivos al inicio del script.

## Contacto
- **Rafael Ramírez Salas**  
  Universidad de Málaga
