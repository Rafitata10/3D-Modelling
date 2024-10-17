% Script de análisis para imágenes 3D de circuitos de Fórmula 1.

%% Limpieza del espacio de trabajo.
clear;
clc;

%% Ruta del archivo STL.
stlFile = 'C:/Users/rafar/OneDrive - Universidad de Málaga/Escritorio/University/Matlab/F1/sources/monaco_circuit.stl';

% Leer el archivo STL.
fv = stlread(stlFile); % Leer el archivo STL como una estructura de vértices y caras.

% Visualización del circuito de Mónaco.
figure('Name', 'Circuito de Mónaco 3D', 'NumberTitle', 'off', 'Color', [1 1 1]);

% Usar trisurf para visualizar la malla triangular.
trisurf(fv.ConnectivityList, fv.Points(:, 1), fv.Points(:, 2), fv.Points(:, 3), ...
    'FaceColor', [1, 1, 1], 'EdgeColor', 'none');

% Ajustar la visualización.
axis equal;  % Ejes con escalas proporcionales.
xlabel('X');
ylabel('Y');
zlabel('Z');
title('Circuito de Mónaco en 3D');

% Ajustes visuales.
lighting gouraud;      % Sombreado suave.
camlight headlight;    % Luz de la cámara.
material shiny;        % Material brillante para el objeto.
rotate3d on;           % Habilitar rotación 3D con el ratón.

%% Finalizar el script.
disp('Visualización del circuito de Mónaco completada.');
