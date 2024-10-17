% Script de análisis para imágenes anatómicas.

% Limpieza del espacio de trabajo.
clear;
clc;

%% Cargar imágenes anatómicas y funcionales.
t1File = 'C:/Users/rafar/OneDrive - Universidad de Málaga/Escritorio/University/Matlab/Persuasive_Message/sources/sub-33_T1w.nii';              % Imagen anatómica
boldFile = 'C:/Users/rafar/OneDrive - Universidad de Málaga/Escritorio/University/Matlab/Persuasive_Message/sources/sub-33_task-narrative_bold.nii.gz'; % Imagen funcional
eventFile = 'C:/Users/rafar/OneDrive - Universidad de Málaga/Escritorio/University/Matlab/Persuasive_Message/sources/sub-33_task-narrative_events.tsv';   % Archivo de eventos

% Cargar las imágenes.
t1Volume = niftiread(t1File);
boldVolume = niftiread(boldFile);
events = tdfread(eventFile);

%% Visualización de la imagen anatómica T1w.
% Crear una figura y establecer el color de fondo.
figure('Name', 'Imagen Anatómica T1w', 'NumberTitle', 'off', 'Color', [1 1 1]);
volshow(t1Volume); % Mostrar la imagen anatómica en 3D.
title('Visualización 3D de la imagen anatómica T1w');

% Cambiar el color del fondo del viewer a blanco.
hT1Volume = gcf; % Obtén la figura actual.
hT1Volume.Children.Color = [1 1 1]; % Cambia el fondo a blanco.

%% Visualización de la imagen funcional BOLD.
% Crear una figura y establecer el color de fondo.
figure('Name', 'Imagen Funcional BOLD', 'NumberTitle', 'off', 'Color', [1 1 1]);
sliceIndex = 1; % Seleccionar un corte específico del volumen BOLD.
boldSlice = squeeze(boldVolume(:, :, :, sliceIndex)); % Extraer un volumen 3D.

% Mostrar el corte seleccionado en 3D.
volshow(boldSlice); % Mostrar la imagen funcional en 3D.
title(['Visualización 3D de la imagen funcional BOLD en el tiempo ', num2str(sliceIndex)]);

% Cambiar el color del fondo del viewer a blanco.
hBoldVolume = gcf; % Obtén la figura actual.
hBoldVolume.Children.Color = [1 1 1]; % Cambia el fondo a blanco.

%% Visualización de cortes.
% Crear figura para los cortes.
figure('Name', 'Cortes Axiales, Sagitales y Coronales', 'NumberTitle', 'off', 'Color', [1 1 1]);

% Cortes Axiales.
subplot(2, 2, 1);
imshow(squeeze(t1Volume(:, :, round(size(t1Volume, 3)/2))), []);
title('Corte Axial');
axis on;

% Cortes Sagitales.
subplot(2, 2, 2);
imshow(squeeze(t1Volume(round(size(t1Volume, 1)/2), :, :)), []);
title('Corte Sagital');
axis on;

% Cortes Coronales.
subplot(2, 2, 3);
imshow(squeeze(t1Volume(:, round(size(t1Volume, 2)/2), :)), []);
title('Corte Coronal');
axis on;

% Cortes del BOLD.
subplot(2, 2, 4);
imshow(squeeze(boldSlice(:, :, round(size(boldSlice, 3)/2))), []);
title('Corte Axial BOLD');
axis on;

%% Mostrar los eventos de la tarea.
disp('Eventos de la tarea:');
disp(events); % Esto mostrará los tiempos y tipos de eventos.

%% Análisis simple: Visualización de un evento.
% Visualizar un evento específico en función del tiempo.
eventTime = events.onset; % Suponiendo que 'onset' es una de las columnas en el archivo TSV.

% Verificar la longitud del tiempo de eventos.
numEvents = length(eventTime);
fprintf('Número de eventos: %d\n', numEvents);

%% Finalizar el script.
disp('Análisis completado.');

