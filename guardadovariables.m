% Contrtoladores

%% Guardado de variables


%% PID con antiwindup clamping
tiempowu = out.tout;
Usatwu = out.Usaturada;
Twu = out.Treal;
Refwu = out.Referencia;
Errorwu = out.Error;
Potenciawu = out.Potencia;
a=2
save('mis_datos_completo.mat');
%% PID con antiwindup clamping
tiempoff = out.tout;
Usatff = out.Usaturada;
Tff = out.Treal;
Refff = out.Referencia;
Errorff = out.Error;
Potenciaff = out.Potencia;
a=3
save('mis_datos_completo.mat');

%% MPC
tiempompc = out.tout;
Usatmpc = out.Usaturada;
Tmpc = out.Treal;
Refmpc = out.Referencia;
Errormpc = out.Error;
Potenciampc = out.Potencia;
a=4
save('mis_datos_completo.mat');

%% Luminosidad
length(out.tout)
length(Usatwu)
length(Usat)
length(T)
length(Twu)
length(Ref)

%% 


figure('Name', 'Ejemplo de Subplot Asimétrico', 'Color', 'w');
sgtitle('Control PID Básico (Tamb = [0,30])', 'FontSize', 20, 'FontWeight', 'bold');

% --- GRÁFICA 1 (Ocupa 2/3 del espacio) ---
% Usamos una rejilla de 3 filas, y unimos las posiciones [1 y 2]
subplot(4, 1, [1, 2, 3]); 
plot(out.tout,Ref, 'r', 'LineWidth', 2); hold on;% 'r' = rojo 
% plot(out.tout,out.Tmodelo, 'Color','#00CC66', 'LineWidth', 2); hold on;% 'r' = rojo 
% plot(out.tout, out.TmodeloTamb, 'Color','#009999' , 'LineWidth', 2); % 'b' = azul
% plot(out.tout, out.Tcompleta, 'Color','#CCCC00', 'LineWidth', 2); % 'b' = azul
plot(out.tout, T, 'Color','#0066CC', 'LineWidth', 2); % 'b' = azul
%plot(out.tout, Twu, 'Color','#00994C', 'LineWidth', 2); % 'b' = azul
grid on;
title('Temperatura');
ylabel('T [ºC]');
xlabel('Tiempo [s]');
legend('Referencia', 'Temperatura de la habitación'); %, 'Temp Modelo','Temp Ambiente');
% Opcional: quitamos las etiquetas X de la gráfica de arriba para limpiar
set(gca, 'XTickLabel', []); 

% --- GRÁFICA 2 (Ocupa 1/3 del espacio) ---
% Ocupa la posición 3 de la rejilla
subplot(4, 1, 4); 
plot(out.tout, Usat,'Color', '#0066CC', 'LineWidth', 2); hold on; % 'b' = azul hold on; 
%plot(out.tout, Usatwu, 'k', 'LineWidth', 2); % 'b' = azul
grid on;
title('Tensión aplicada en el calefactor');
xlabel('Tiempo [s]');
ylabel('Tensión [V]');



%% 
figure('Name', 'Ejemplo de Subplot Asimétrico', 'Color', 'w');
sgtitle('Control PID con Antiwindup Clamping (Tamb = [10,23])', 'FontSize', 20, 'FontWeight', 'bold');

% --- GRÁFICA 1 (Ocupa 2/3 del espacio) ---
% Usamos una rejilla de 3 filas, y unimos las posiciones [1 y 2]
subplot(4, 1, [1, 2, 3]); 
plot(out.tout,Ref, 'r', 'LineWidth', 2); hold on;% 'r' = rojo 
% plot(out.tout,out.Tmodelo, 'Color','#00CC66', 'LineWidth', 2); hold on;% 'r' = rojo 
% plot(out.tout, out.TmodeloTamb, 'Color','#009999' , 'LineWidth', 2); % 'b' = azul
% plot(out.tout, out.Tcompleta, 'Color','#CCCC00', 'LineWidth', 2); % 'b' = azul
plot(out.tout, Tff, 'Color','#0066CC', 'LineWidth', 2); % 'b' = azul
plot(out.tout, Twu, 'Color','#00994C', 'LineWidth', 2); % 'b' = azul
grid on;
title('Temperatura');
ylabel('T [ºC]');
xlabel('Tiempo [s]');
legend('Referencia', 'Temperatura ff ', 'Temperatura sin ff '); %, 'Temp Modelo','Temp Ambiente');
% Opcional: quitamos las etiquetas X de la gráfica de arriba para limpiar
set(gca, 'XTickLabel', []); 

% --- GRÁFICA 2 (Ocupa 1/3 del espacio) ---
% Ocupa la posición 3 de la rejilla
subplot(4, 1, 4); 
plot(out.tout, Usatff,'Color', '#0066CC', 'LineWidth', 2); hold on; % 'b' = azul hold on; 
plot(out.tout, Usatwu, 'Color','#00994C', 'LineWidth', 2); % 'b' = azul
grid on;
title('Tensión aplicada en el calefactor');
xlabel('Tiempo [s]');
ylabel('Tensión [V]');


%% 
figure('Name', 'Ejemplo de Subplot Asimétrico', 'Color', 'w');
sgtitle('Comparativa diferentes controladores (Tamb = [10,23])', 'FontSize', 20, 'FontWeight', 'bold');

% --- GRÁFICA 1 (Ocupa 2/3 del espacio) ---
% Usamos una rejilla de 3 filas, y unimos las posiciones [1 y 2]
subplot(4, 1, [1, 2, 3]); 
plot(out.tout,Refmpc, 'r', 'LineWidth', 2); hold on;% 'r' = rojo 
% plot(out.tout,out.Tmodelo, 'Color','#00CC66', 'LineWidth', 2); hold on;% 'r' = rojo 
% plot(out.tout, out.TmodeloTamb, 'Color','#009999' , 'LineWidth', 2); % 'b' = azul
% plot(out.tout, out.Tcompleta, 'Color','#CCCC00', 'LineWidth', 2); % 'b' = azul
plot(out.tout, Tff, 'Color','#0066CC', 'LineWidth', 2); % 'b' = azul
plot(out.tout, Twu, 'Color','#00994C', 'LineWidth', 2); % 'b' = azul
plot(out.tout, Tmpc, 'Color','#CCCC00', 'LineWidth', 2); % 'b' = azul
grid on;
title('Temperatura');
ylabel('T [ºC]');
xlabel('Tiempo [s]');
legend('Referencia', 'Temperatura ff ', 'Temperatura sin ff ', 'Temperatura MPC'); %, 'Temp Modelo','Temp Ambiente');
% Opcional: quitamos las etiquetas X de la gráfica de arriba para limpiar
set(gca, 'XTickLabel', []); 

% --- GRÁFICA 2 (Ocupa 1/3 del espacio) ---
% Ocupa la posición 3 de la rejilla
subplot(4, 1, 4); 
plot(out.tout, Usatff,'Color', '#0066CC', 'LineWidth', 2); hold on; % 'b' = azul hold on; 
plot(out.tout, Usatwu, 'Color','#00994C', 'LineWidth', 2); % 'b' = azul
plot(out.tout, Usatmpc, 'Color','#CCCC00', 'LineWidth', 2);
grid on;
title('Tensión aplicada en el calefactor');
xlabel('Tiempo [s]');
ylabel('Tensión [V]');


%% Error PID sin FF
ErrorpidNoFF = out.Error(58000/200:end);
PotErrorTotalpidNoFF = ErrorpidNoFF.^2;
PotTotalpidNoFF = out.Potencia(58000/200:end);
ErrorAcumulado=0;
PotErrorAcumulada=0;
PotAcumulada = 0;
aux=1;
for i=1:size(ErrorpidNoFF)
    
        ErrorAcumulado=ErrorAcumulado+abs(ErrorpidNoFF(i));
        PotErrorAcumulada=PotErrorAcumulada+PotErrorTotalpidNoFF(i);
        PotAcumulada = PotAcumulada + PotTotalpidNoFF(i);
        aux=aux+1;
end
ErrorMedioPIDNoFF=ErrorAcumulado/(aux-1)
PotPIDNoFF=PotErrorAcumulada/(aux-1)
PotenciaMediaAcumulada=PotAcumulada/(aux-1)

%% Error PID sin FF
Errorwum = Errorwu(58000/200:end);
PotErrorwum = Errorwum.^2;
PotTotalwum = Potenciawu(58000/200:end);
ErrorAcumuladowum=0;
PotErrorAcumuladawum=0;
PotAcumuladawum = 0;
aux=1;
for i=1:size(Errorwum)
    
        ErrorAcumuladowum=ErrorAcumuladowum+abs(Errorwum(i));
        PotErrorAcumuladawum=PotErrorAcumuladawum+PotErrorwum(i);
        PotAcumuladawum = PotAcumuladawum + PotTotalwum(i);
        aux=aux+1;
end
ErrorMediowum=ErrorAcumuladowum/(aux-1)
PotErrorMediawum=PotErrorAcumuladawum/(aux-1)
PotenciaMediaAcumuladawum=PotAcumuladawum/(aux-1)

%% Error PID con FF
Errorffm = Errorff(58000/200:end);
PotErrorffm = Errorffm.^2;
PotTotalffm = Potenciaff(58000/200:end);
ErrorAcumuladoffm=0;
PotErrorAcumuladaffm=0;
PotAcumuladaffm = 0;
aux=1;
for i=1:size(Errorffm)
    
        ErrorAcumuladoffm=ErrorAcumuladoffm+abs(Errorffm(i));
        PotErrorAcumuladaffm=PotErrorAcumuladaffm+PotErrorffm(i);
        PotAcumuladaffm = PotAcumuladaffm + PotTotalffm(i);
        aux=aux+1;
end
ErrorMedioffm=ErrorAcumuladoffm/(aux-1)
PotErrorMediaffm=PotErrorAcumuladaffm/(aux-1)
PotenciaMediaAcumuladaffm=PotAcumuladaffm/(aux-1)


%% Error MPC
Errormpcm = Errormpc(58000/200:end);
PotErrormpcm = Errormpcm.^2;
PotTotalmpcm = Potenciampc(58000/200:end);
ErrorAcumuladompcm=0;
PotErrorAcumuladampcm=0;
PotAcumuladampcm = 0;
aux=1;
for i=1:size(Errormpcm)
    
        ErrorAcumuladompcm=ErrorAcumuladompcm+abs(Errormpcm(i));
        PotErrorAcumuladampcm=PotErrorAcumuladampcm+PotErrormpcm(i);
        PotAcumuladampcm = PotAcumuladampcm + PotTotalmpcm(i);
        aux=aux+1;
end
ErrorMediompcm=ErrorAcumuladompcm/(aux-1)
PotErrorMediampcm=PotErrorAcumuladampcm/(aux-1)
PotenciaMediaAcumuladampcm=PotAcumuladampcm/(aux-1)



%% Potencia vs error

errores = [0.8955, 0.8681, 0.8302];    % Error medio en ºC 
potencias = [194.6609, 195.6859, 176.2972];   % Potencia media en W 
nombres = {'PID sin FF', 'PID con FF', 'MPC'};

% 2. Crear la figura
figure;
hold on; % Permite dibujar varios puntos uno por uno

% 3. Graficar cada controlador con un marcador diferente
colores = ['r', 'b', 'g']; % Rojo, Azul, Verde
marcadores = ['s', 's', 's']; 

for i = 1:length(errores)
    plot(errores(i), potencias(i), marcadores(i), ...
        'MarkerEdgeColor', colores(i), ...
        'MarkerFaceColor', colores(i), ...
        'MarkerSize', 10, ...
        'LineWidth', 1.5);
end

% 4. Configurar etiquetas y formato
grid on; % Añadir cuadrícula para mejor lectura
xlabel('Error Medio (ºC)', 'FontSize', 12);
ylabel('Potencia Media (W)', 'FontSize', 12);
title('Comparativa de Controladores: Error medio frente a potencia media consumida', 'FontSize', 14);

% 5. Añadir la leyenda
legend(nombres, 'Location', 'best');

% 6. Opcional: Ajustar los límites de los ejes para que los puntos no queden pegados al borde
xlim([min(errores)*0.8, max(errores)*1.2]);
ylim([min(potencias)*0.8, max(potencias)*1.2]);

hold off;


%% 

% 1. Extraer los datos (si están dentro de la estructura out)
twu = tiempowu;          % Vector de tiempo
ewu = Errorwu;         % Vector de error (Setpoint - Temperatura)
tff = tiempoff;          % Vector de tiempo
eff = Errorff;         % Vector de error (Setpoint - Temperatura)
tmpc = tiempompc;          % Vector de tiempo
empc = Errormpc;         % Vector de error (Setpoint - Temperatura)

% 2. Calcular el valor absoluto del error
abs_ewu = abs(ewu);
abs_eff = abs(eff);
abs_empc = abs(empc);

% 3. Calcular la integral usando la regla trapezoidal (trapz)
%    'trapz' es ideal porque maneja bien los pasos de tiempo variables
IAEwu = trapz(twu, abs_ewu)
IAEff = trapz(tff, abs_eff)
IAEmpc = trapz(tmpc, abs_empc)


ITAE_wu  = trapz(twu,  twu  .* abs(ewu));
ITAE_ff  = trapz(tff,  tff  .* abs(eff));
ITAE_mpc = trapz(tmpc, tmpc .* abs(empc));


ITSE_wu  = trapz(twu,  twu  .* (ewu.^2));
ITSE_ff  = trapz(tff,  tff  .* (eff.^2));
ITSE_mpc = trapz(tmpc, tmpc .* (empc.^2));

fprintf('--- Resultados IAE ---\n');
fprintf('WU:  %.4f\nFF:  %.4f\nMPC: %.4f\n\n', IAEwu, IAEff, IAEmpc);


fprintf('--- Resultados ITAE ---\n');
fprintf('WU:  %.4f\nFF:  %.4f\nMPC: %.4f\n\n', ITAE_wu, ITAE_ff, ITAE_mpc);

fprintf('--- Resultados ITSE ---\n');
fprintf('WU:  %.4f\nFF:  %.4f\nMPC: %.4f\n', ITSE_wu, ITSE_ff, ITSE_mpc);

