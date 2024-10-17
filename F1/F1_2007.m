% Script de análisis para imágenes 3D de Fórmula 1.

%% Limpieza del espacio de trabajo.
clear;
clc;

%% Ruta del archivo STL.
stlFile = 'C:/Users/rafar/OneDrive - Universidad de Málaga/Escritorio/University/Matlab/F1/sources/F1_2007_Car.stl';

% Leer el archivo STL.
fv = stlread(stlFile); % Leer el archivo STL como una estructura de vértices y caras.

% Obtener los límites del modelo.
modelLimitsX = [min(fv.Points(:, 1)), max(fv.Points(:, 1))];
modelLimitsY = [min(fv.Points(:, 2)), max(fv.Points(:, 2))];
modelLimitsZ = [min(fv.Points(:, 3)), max(fv.Points(:, 3))];

% Imprimir los límites del modelo para revisar.
disp(['Límites del modelo en X: ', num2str(modelLimitsX)]);
disp(['Límites del modelo en Y: ', num2str(modelLimitsY)]);
disp(['Límites del modelo en Z: ', num2str(modelLimitsZ)]);

% Definir el valor de corte para el plano Z basado en los límites.
cutPlaneZ = mean(modelLimitsX);  % Valor medio en X para cortar el modelo en el plano Z
cutPlaneY = mean(modelLimitsY);  % Valor medio en Y para cortar el modelo en el plano Y

% Visualización del modelo 3D original.
figure('Name', '2007 F1 car 3D Model Original', 'NumberTitle', 'off', 'Color', [1 1 1]);

% Usar trisurf para visualizar la malla triangular.
trisurf(fv.ConnectivityList, fv.Points(:, 1), fv.Points(:, 2), fv.Points(:, 3), ...
    'FaceColor', 'cyan', 'EdgeColor', 'none'); % Visualizar sin bordes y con color.

% Ajustar la visualización.
axis equal;  % Ejes con escalas proporcionales.
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Modelo 3D original del F1 2007');

% Ajustes visuales.
lighting gouraud;      % Sombreado suave.
camlight headlight;     % Luz de la cámara.
material shiny;         % Material brillante para el objeto.
rotate3d on;            % Habilitar rotación 3D con el ratón.

%% Añadir corte horizontal en Y (Plano Y-Z).

% Definir el plano de corte horizontal (Y-Z).
disp(['Aplicando el corte horizontal en Y a Y = ', num2str(cutPlaneY)]);

% Obtener los índices de los vértices que están por encima del corte en Y.
indicesPorEncimaY = fv.Points(:, 2) >= cutPlaneY;  % Corte horizontal en el plano Y-Z.

% Filtrar las caras cuyas vértices están por encima del plano de corte.
carasCortadasY = all(indicesPorEncimaY(fv.ConnectivityList), 2);

% Verificar si hay caras seleccionadas para el corte.
if isempty(carasCortadasY) || all(carasCortadasY == 0)
    disp('No se encontraron caras que estén por encima del plano de corte Y.');
else
    % Crear una nueva lista de puntos y caras, eliminando los puntos no utilizados.
    nuevasCarasY = fv.ConnectivityList(carasCortadasY, :);
    nuevosPuntosY = fv.Points(unique(nuevasCarasY(:)), :);

    % Ajustar la conectividad de las caras para la nueva lista de puntos.
    [~, nuevasCarasY] = ismember(nuevasCarasY, unique(nuevasCarasY(:)));

    % Crear una nueva malla solo con las caras por encima del corte en Y.
    fvCortadoY = triangulation(nuevasCarasY, nuevosPuntosY);

    % Visualización del modelo cortado en el plano Y-Z (horizontal).
    figure('Name', 'Modelo Cortado con Plano en Y (Horizontal)', 'NumberTitle', 'off', 'Color', [1 1 1]);
    trisurf(fvCortadoY.ConnectivityList, fvCortadoY.Points(:, 1), fvCortadoY.Points(:, 2), fvCortadoY.Points(:, 3), ...
        'FaceColor', [204/255, 0, 0], 'EdgeColor', 'none');  % Color rojo
    axis equal;
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title(['Modelo F1 2007 cortado en Y (Plano Y-Z) = ', num2str(cutPlaneY)]);
    lighting gouraud;
    camlight headlight;
    material shiny;
    rotate3d on;
end

%% Añadir corte vertical en Z (Plano X-Z).

% Visualizar el corte vertical en Z.
disp(['Aplicando el corte en Z a X = ', num2str(cutPlaneZ)]);

% Obtener los índices de los vértices que están a la derecha del corte Z (X-Z).
indicesPorEncimaZ = fv.Points(:, 1) >= cutPlaneZ;  % Corte vertical en el plano X-Z.

% Filtrar las caras cuyas vértices están a la derecha del corte Z.
carasCortadasZ = all(indicesPorEncimaZ(fv.ConnectivityList), 2);

% Verificar si hay caras seleccionadas para el corte.
if isempty(carasCortadasZ) || all(carasCortadasZ == 0)
    disp('No se encontraron caras que estén a la derecha del plano de corte Z.');
else
    % Crear una nueva lista de puntos y caras, eliminando los puntos no utilizados.
    nuevasCarasZ = fv.ConnectivityList(carasCortadasZ, :);
    nuevosPuntosZ = fv.Points(unique(nuevasCarasZ(:)), :);

    % Ajustar la conectividad de las caras para la nueva lista de puntos.
    [~, nuevasCarasZ] = ismember(nuevasCarasZ, unique(nuevasCarasZ(:)));

    % Crear una nueva malla solo con las caras a la derecha del corte Z.
    fvCortadoZ = triangulation(nuevasCarasZ, nuevosPuntosZ);

    % Visualización del modelo cortado en Z (vertical, X-Z).
    figure('Name', 'Modelo Cortado con Plano en Z (Vertical X-Z)', 'NumberTitle', 'off', 'Color', [1 1 1]);
    trisurf(fvCortadoZ.ConnectivityList, fvCortadoZ.Points(:, 1), fvCortadoZ.Points(:, 2), fvCortadoZ.Points(:, 3), ...
        'FaceColor', [0, 66/255, 37/255], 'EdgeColor', 'none');
    axis equal;
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    title(['Modelo F1 2007 cortado en Z (Plano X-Z) = ', num2str(cutPlaneZ)]);
    lighting gouraud;
    camlight headlight;
    material shiny;
    rotate3d on;

    % Obtener los límites del modelo original.
    xLimitsZ = xlim;
    zLimitsZ = zlim;

    % Crear un parche para el plano de corte en Z (vertical).
    hold on;
    patch([cutPlaneZ cutPlaneZ cutPlaneZ cutPlaneZ], ...  % Coordenadas X para plano vertical.
          [zLimitsZ(1) zLimitsZ(2) zLimitsZ(2) zLimitsZ(1)], ... % Coordenadas Z.
          [xLimitsZ(1) xLimitsZ(2) xLimitsZ(2) xLimitsZ(1)], 'r', 'FaceAlpha', 0.3); % Plano de corte visualizado.
end

%% Finalizar el script.
disp('Análisis completado.');
