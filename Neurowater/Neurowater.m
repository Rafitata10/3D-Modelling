% Script de análisis para imágenes anatómicas.

% Limpieza del espacio de trabajo.
clear;
clc;

%% Cargar imágenes anatómicas y funcionales.
t1File = 'C:/Users/rafar/OneDrive - Universidad de Málaga/Escritorio/University/Matlab/Neurowater/sources/sub-10_T1w.nii';              % Imagen anatómica
boldFile = 'C:/Users/rafar/OneDrive - Universidad de Málaga/Escritorio/University/Matlab/Neurowater/sources/sub-10_task-MSG_bold.nii'; % Imagen funcional

% Cargar las imágenes.
t1Volume = niftiread(t1File);
boldVolume = niftiread(boldFile);

%% Visualización de la imagen anatómica T1w.
figure('Name', 'Imagen Anatómica T1w', 'NumberTitle', 'off', 'Color', [1 1 1], 'WindowStyle', 'normal');

% Verificar si la imagen es 3D.
if ndims(t1Volume) == 3
    hT1Volume = volshow(t1Volume); % Mostrar la imagen anatómica en 3D.
    title('Visualización 3D de la imagen anatómica T1w');
else
    error('La imagen anatómica T1w no es un volumen 3D válido.');
end

%% Visualización de la imagen funcional BOLD.
figure('Name', 'Imagen Funcional BOLD', 'NumberTitle', 'off', 'Color', [1 1 1], 'WindowStyle', 'normal');

% Comprobar si el volumen BOLD es 4D (tamaño [x, y, z, t]).
if ndims(boldVolume) == 4
    sliceIndex = 1; % Seleccionar un corte específico del volumen BOLD.
    boldSlice = squeeze(boldVolume(:, :, :, sliceIndex)); % Extraer un volumen 3D.
    volshow(boldSlice); % Mostrar la imagen funcional en 3D.
    title(['Visualización 3D de la imagen funcional BOLD en el tiempo ', num2str(sliceIndex)]);
else
    error('La imagen funcional BOLD no es un volumen 4D válido.');
end

%% Visualización de cortes anatómicos y funcionales.
figure('Name', 'Cortes Axiales, Sagitales y Coronales', 'NumberTitle', 'off', 'Color', [1 1 1], 'WindowStyle', 'normal');

% Cortes Axiales.
subplot(2, 2, 1);
imshow(squeeze(t1Volume(:, :, round(size(t1Volume, 3)/2))), []);  % Ajuste automático de la escala de intensidad
title('Corte Axial Anatómico');
axis on;

% Cortes Sagitales.
subplot(2, 2, 2);
imshow(squeeze(t1Volume(round(size(t1Volume, 1)/2), :, :)), []);  % Ajuste automático de la escala de intensidad
title('Corte Sagital Anatómico');
axis on;

% Cortes Coronales.
subplot(2, 2, 3);
imshow(squeeze(t1Volume(:, round(size(t1Volume, 2)/2), :)), []);  % Ajuste automático de la escala de intensidad
title('Corte Coronal Anatómico');
axis on;

% Cortes del BOLD en el tiempo seleccionado.
subplot(2, 2, 4);
imshow(squeeze(boldSlice(:, :, round(size(boldSlice, 3)/2))), []);  % Ajuste automático de la escala de intensidad
title(['Corte Axial BOLD - Tiempo ', num2str(sliceIndex)]);
axis on;

%% Estadísticas Básicas.
disp('--- Estadísticas Anatómicas ---');
fprintf('Valor medio: %.2f\n', mean(t1Volume(:)));
fprintf('Valor máximo: %.2f\n', max(t1Volume(:)));

disp('--- Estadísticas Funcionales ---');
fprintf('Valor medio: %.2f\n', mean(boldVolume(:)));
fprintf('Valor máximo: %.2f\n', max(boldVolume(:)));

%% Visualización de histogramas.
figure('Name', 'Histogramas de las Imágenes', 'NumberTitle', 'off', 'Color', [1 1 1], 'WindowStyle', 'normal');

% Histograma de la imagen anatómica T1w.
subplot(1, 2, 1);
histogram(t1Volume(:), 50);
title('Histograma de la Imagen Anatómica T1w');
xlabel('Intensidad');
ylabel('Frecuencia');

% Histograma de la imagen funcional BOLD.
subplot(1, 2, 2);
histogram(boldVolume(:), 50);
title('Histograma de la Imagen Funcional BOLD');
xlabel('Intensidad');
ylabel('Frecuencia');

%% Animación del volumen funcional BOLD (recorrer el tiempo).
figure('Name', 'Animación del Volumen BOLD', 'NumberTitle', 'off', 'Color', [1 1 1], 'WindowStyle', 'normal');

% Verificar si el volumen funcional es 4D.
if ndims(boldVolume) == 4
    for t = 1:size(boldVolume, 4)
        boldSlice = squeeze(boldVolume(:, :, :, t)); % Extraer un volumen 3D en cada tiempo.
        imshow(squeeze(boldSlice(:, :, round(size(boldSlice, 3)/2))), []);  % Ajuste automático de la escala de intensidad
        title(['Corte Axial BOLD - Tiempo ', num2str(t)]);
        pause(0.1); % Pausa para la animación.
    end
else
    error('La imagen funcional BOLD no es un volumen 4D válido.');
end

%% Finalizar el script.
disp('Análisis completado.');
