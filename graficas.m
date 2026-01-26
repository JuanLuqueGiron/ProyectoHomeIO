%% Temperatura frente a tensión para el punto de operación
length(out.tout)
length(out.Tpeq)
length(out.Uescalonparapuntoeq)
out.tout=out.tout(1:2251)
out.Uescalonparapuntoeq=out.Uescalonparapuntoeq(1:2251)
% 2. Creamos la figura
figure('Name', 'Ejemplo de Subplot Asimétrico', 'Color', 'w');
sgtitle('Identificación del punto de operación (Tamb = [0,30])', 'FontSize', 20, 'FontWeight', 'bold');

% --- GRÁFICA 1 (Ocupa 2/3 del espacio) ---
% Usamos una rejilla de 3 filas, y unimos las posiciones [1 y 2]
subplot(3, 1, [1, 2]);
plot(out.tout,out.Tpeq, 'r', 'LineWidth', 2); % 'r' = rojo
grid on;
title('Temperatura en la habitación L');
ylabel('T [ºC]');
% Opcional: quitamos las etiquetas X de la gráfica de arriba para limpiar
set(gca, 'XTickLabel', []);

% --- GRÁFICA 2 (Ocupa 1/3 del espacio) ---
% Ocupa la posición 3 de la rejilla
subplot(3, 1, 3);
plot(out.tout, out.Uescalonparapuntoeq, 'b', 'LineWidth', 2); % 'b' = azul
grid on;
title('Tensión aplicada al calefactor');
xlabel('Tiempo [s]');
ylabel('Tensión [V]');

%% Temperatura frente a tensión con Tamb=[16,17]
length(out.tout)
%length(out.T)
length(out.Tgorro)
length(out.Ugorro)
out.tout=out.tout(1:2251)
out.Ugorro=out.Ugorro(1:2251)
out.Tmodelo=out.Tmodelo(1:2251)
% 2. Creamos la figura
figure('Name', 'Ejemplo de Subplot Asimétrico', 'Color', 'w');
sgtitle('Modelo de Tensión-Temperatura vs Sistema Real (Tamb = [16,17])', 'FontSize', 20, 'FontWeight', 'bold');

% --- GRÁFICA 1 (Ocupa 2/3 del espacio) ---
% Usamos una rejilla de 3 filas, y unimos las posiciones [1 y 2]
subplot(3, 1, [1, 2]);
plot(out.tout,out.T, 'r', 'LineWidth', 2); hold on;% 'r' = rojo
plot(out.tout,out.Tmodelo, 'Color','#00CC66', 'LineWidth', 2); hold on;% 'r' = rojo
grid on;
title('Temperatura en la habitación L');
ylabel('T [ºC]');
legend('Sistema Real', 'Modelo Tensión-Temperatura');
% Opcional: quitamos las etiquetas X de la gráfica de arriba para limpiar
set(gca, 'XTickLabel', []);

% --- GRÁFICA 2 (Ocupa 1/3 del espacio) ---
% Ocupa la posición 3 de la rejilla
subplot(3, 1, 3);
plot(out.tout, out.Ugorro, 'b', 'LineWidth', 2); % 'b' = azul
grid on;
title('Tensión aplicada al calefactor');
xlabel('Tiempo [s]');
ylabel('Tensión [V]');

%% Modelo de Tamb-T frente al sistema real (Tamb = [0,30])
length(out.tout)
%length(out.T)
length(out.Tambgorro)
length(out.Tgorro)
out.tout=out.tout(1:2251)
out.Tmodelo=out.Tmodelo(1:2251)
out.Tamb=out.Tamb(1:2251)
out.T=out.T(1:2251)
% 2. Creamos la figura
figure('Name', 'Ejemplo de Subplot Asimétrico', 'Color', 'w');
sgtitle('Modelo de Tamb-T frente al sistema real (Tamb = [0,30])', 'FontSize', 20, 'FontWeight', 'bold');

% --- GRÁFICA 1 (Ocupa 2/3 del espacio) ---
% Usamos una rejilla de 3 filas, y unimos las posiciones [1 y 2]
subplot(4, 1, [1, 2, 3, 4]);
plot(out.tout,out.T, 'r', 'LineWidth', 2); hold on;% 'r' = rojo
plot(out.tout,out.Tmodelo, 'Color','#00CC66', 'LineWidth', 2); hold on;% 'r' = rojo
plot(out.tout, out.Tamb, 'b', 'LineWidth', 2); % 'b' = azul
grid on;
title('Temperatura');
ylabel('T [ºC]');
xlabel('Tiempo [s]');
legend('Temp Habitación', 'Temp Modelo','Temp Ambiente');
% Opcional: quitamos las etiquetas X de la gráfica de arriba para limpiar
set(gca, 'XTickLabel', []);

%% Luinosidad y Modelos de espacio de estados
length(out.tout)
%length(out.T)
%length(out.Tambgorro)
%length(out.Tgorro)
out.tout=out.tout(1:2251)
out.Tmodelo=out.Tmodelo(1:2251)
out.Treal=out.Treal(1:2251)
out.TmodeloTamb=out.TmodeloTamb(1:2251)
out.Tcompleta=out.Tcompleta(1:2251)
out.Ugorro = out.Ugorro(1:2251)
out.Tss2=out.Tss2(1:2251)
out.Tss3=out.Tss3(1:2251)
% 2. Creamos la figura
figure('Name', 'Ejemplo de Subplot Asimétrico', 'Color', 'w');
sgtitle('Modelos de espacio de estados frente al sistema real (Tamb = [0,30])', 'FontSize', 20, 'FontWeight', 'bold');

% --- GRÁFICA 1 (Ocupa 2/3 del espacio) ---
% Usamos una rejilla de 3 filas, y unimos las posiciones [1 y 2]
subplot(4, 1, [1, 2, 3]);
plot(out.tout,out.Treal, 'r', 'LineWidth', 2); hold on;% 'r' = rojo
% plot(out.tout,out.Tmodelo, 'Color','#00CC66', 'LineWidth', 2); hold on;% 'r' = rojo
% plot(out.tout, out.TmodeloTamb, 'Color','#009999' , 'LineWidth', 2); % 'b' = azul
% plot(out.tout, out.Tcompleta, 'Color','#CCCC00', 'LineWidth', 2); % 'b' = azul
plot(out.tout, out.Tss2, 'Color','#0066CC', 'LineWidth', 2); % 'b' = azul
plot(out.tout, out.Tss3, 'Color','#00994C', 'LineWidth', 2); % 'b' = azul
grid on;
title('Temperatura');
ylabel('T [ºC]');
xlabel('Tiempo [s]');
legend('Temp Habitación', 'Temp SS2', 'Temp SS3'); %, 'Temp Modelo','Temp Ambiente');
% Opcional: quitamos las etiquetas X de la gráfica de arriba para limpiar
set(gca, 'XTickLabel', []);

% --- GRÁFICA 2 (Ocupa 1/3 del espacio) ---
% Ocupa la posición 3 de la rejilla
subplot(4, 1, 4);
plot(out.tout, out.Ugorro, 'b', 'LineWidth', 2); % 'b' = azul
grid on;
title('Tensión aplicada en el calefactor');
xlabel('Tiempo [s]');
ylabel('Tensión [V]');



%% Control PID Básico
figure('Name', 'Ejemplo de Subplot Asimétrico', 'Color', 'w');
sgtitle('Control PID Básico (Tamb = [0,30])', 'FontSize', 20, 'FontWeight', 'bold');

% --- GRÁFICA 1 (Ocupa 2/3 del espacio) ---
subplot(4, 1, [1, 2, 3]);
plot(out.tout,Ref, 'r', 'LineWidth', 2); hold on;
plot(out.tout, T, 'Color','#0066CC', 'LineWidth', 2);
grid on;
title('Temperatura');
ylabel('T [ºC]');
xlabel('Tiempo [s]');
legend('Referencia', 'Temperatura de la habitación');
set(gca, 'XTickLabel', []);

% --- GRÁFICA 2 (Ocupa 1/3 del espacio) ---
subplot(4, 1, 4);
plot(out.tout, Usat,'Color', '#0066CC', 'LineWidth', 2); hold on;
grid on;
title('Tensión aplicada en el calefactor');
xlabel('Tiempo [s]');
ylabel('Tensión [V]');

%% Control PID con Antiwindup Clamping
figure('Name', 'Ejemplo de Subplot Asimétrico', 'Color', 'w');
sgtitle('Control PID con Antiwindup Clamping (Tamb = [10,23])', 'FontSize', 20, 'FontWeight', 'bold');

% --- GRÁFICA 1 (Ocupa 2/3 del espacio) ---
subplot(4, 1, [1, 2, 3]);
plot(out.tout,Ref, 'r', 'LineWidth', 2); hold on;
plot(out.tout, Tff, 'Color','#0066CC', 'LineWidth', 2);
plot(out.tout, Twu, 'Color','#00994C', 'LineWidth', 2);
grid on;
title('Temperatura');
ylabel('T [ºC]');
xlabel('Tiempo [s]');
legend('Referencia', 'Temperatura ff ', 'Temperatura sin ff ');
set(gca, 'XTickLabel', []);

% --- GRÁFICA 2 (Ocupa 1/3 del espacio) ---
subplot(4, 1, 4);
plot(out.tout, Usatff,'Color', '#0066CC', 'LineWidth', 2); hold on;
plot(out.tout, Usatwu, 'Color','#00994C', 'LineWidth', 2);
grid on;
title('Tensión aplicada en el calefactor');
xlabel('Tiempo [s]');
ylabel('Tensión [V]');

%% Control PID con feed forward
figure('Name', 'Ejemplo de Subplot Asimétrico', 'Color', 'w');
sgtitle('Control PID con feed forward (Tamb = [10,23])', 'FontSize', 20, 'FontWeight', 'bold');

% --- GRÁFICA 1 (Ocupa 2/3 del espacio) ---
subplot(4, 1, [1, 2, 3]);
plot(out.tout,Refff, 'r', 'LineWidth', 2); hold on;
plot(out.tout, Tff, 'Color','#D4A420', 'LineWidth', 2);
grid on;
title('Temperatura');
ylabel('T [ºC]');
xlabel('Tiempo [s]');
legend('Referencia', 'Temperatura ff ');
set(gca, 'XTickLabel', []);

% --- GRÁFICA 2 (Ocupa 1/3 del espacio) ---
subplot(4, 1, 4);
plot(out.tout, Usatff,'Color', '#0066CC', 'LineWidth', 2); hold on;
grid on;
title('Tensión aplicada en el calefactor');
xlabel('Tiempo [s]');
ylabel('Tensión [V]');


%% Gráfica MPC
figure('Name', 'Ejemplo de Subplot Asimétrico', 'Color', 'w');
sgtitle('Control MPC (Tamb = [10,23])', 'FontSize', 20, 'FontWeight', 'bold');

% --- GRÁFICA 1 (Ocupa 2/3 del espacio) ---
subplot(4, 1, [1, 2, 3]);
plot(out.tout,Refmpc, 'r', 'LineWidth', 2); hold on;
plot(out.tout, Tmpc, 'Color','#CCCC00', 'LineWidth', 2);
grid on;
title('Temperatura');
ylabel('T [ºC]');
xlabel('Tiempo [s]');
legend('Referencia', 'Temperatura MPC');
set(gca, 'XTickLabel', []);

% --- GRÁFICA 2 (Ocupa 1/3 del espacio) ---
subplot(4, 1, 4);
plot(out.tout, Usatmpc,'Color', '#0066CC', 'LineWidth', 2); hold on;
grid on;
title('Tensión aplicada en el calefactor');
xlabel('Tiempo [s]');
ylabel('Tensión [V]');


%% Comparativa diferentes controladores
figure('Name', 'Ejemplo de Subplot Asimétrico', 'Color', 'w');
sgtitle('Comparativa diferentes controladores (Tamb = [10,23])', 'FontSize', 20, 'FontWeight', 'bold');

% --- GRÁFICA 1 (Ocupa 2/3 del espacio) ---
subplot(4, 1, [1, 2, 3]);
plot(out.tout,Refmpc, 'r', 'LineWidth', 2); hold on;
plot(out.tout, Tff, 'Color','#0066CC', 'LineWidth', 2);
plot(out.tout, Twu, 'Color','#00994C', 'LineWidth', 2);
plot(out.tout, Tmpc, 'Color','#CCCC00', 'LineWidth', 2);
grid on;
title('Temperatura');
ylabel('T [ºC]');
xlabel('Tiempo [s]');
legend('Referencia', 'Temperatura ff ', 'Temperatura sin ff ', 'Temperatura MPC');
set(gca, 'XTickLabel', []);

% --- GRÁFICA 2 (Ocupa 1/3 del espacio) ---
subplot(4, 1, 4);
plot(out.tout, Usatff,'Color', '#0066CC', 'LineWidth', 2); hold on;
plot(out.tout, Usatwu, 'Color','#00994C', 'LineWidth', 2);
plot(out.tout, Usatmpc, 'Color','#CCCC00', 'LineWidth', 2);
grid on;
title('Tensión aplicada en el calefactor');
xlabel('Tiempo [s]');
ylabel('Tensión [V]');

%% Potencia vs error
errores = [0.8955, 0.8681, 0.8302];    % Error medio en ºC
potencias = [194.6609, 195.6859, 176.2972];   % Potencia media en W
nombres = {'PID sin FF', 'PID con FF', 'MPC'};

figure;
hold on;
colores = ['r', 'b', 'g']; % Rojo, Azul, Verde
marcadores = ['s', 's', 's'];

for i = 1:length(errores)
    plot(errores(i), potencias(i), marcadores(i), ...
        'MarkerEdgeColor', colores(i), ...
        'MarkerFaceColor', colores(i), ...
        'MarkerSize', 10, ...
        'LineWidth', 1.5);
end

grid on;
xlabel('Error Medio (ºC)', 'FontSize', 12);
ylabel('Potencia Media (W)', 'FontSize', 12);
title('Comparativa de Controladores: Error medio frente a potencia media consumida', 'FontSize', 14);
legend(nombres, 'Location', 'best');
xlim([min(errores)*0.8, max(errores)*1.2]);
ylim([min(potencias)*0.8, max(potencias)*1.2]);
hold off;
