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

%% Luinosidad
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
sgtitle('Control PID con Antiwindup Clamping (Tamb = [0,30])', 'FontSize', 20, 'FontWeight', 'bold');

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
for i=1:size(ErrorpidNoFF)
    
        ErrorAcumuladowum=ErrorAcumuladowum+abs(Errorwum(i));
        PotErrorAcumuladawum=PotErrorAcumuladawum+PotErrorwum(i);
        PotAcumuladawum = PotAcumuladawum + PotTotalwum(i);
        aux=aux+1;
end
ErrorMediowum=ErrorAcumuladowum/(aux-1)
PotErrorMediawum=PotErrorAcumuladawum/(aux-1)
PotenciaMediaAcumuladawum=PotAcumuladawum/(aux-1)

%% Error PID sin FF
Errorffm = Errorff(58000/200:end);
PotErrorffm = Errorffm.^2;
PotTotalffm = Potenciaff(58000/200:end);
ErrorAcumuladoffm=0;
PotErrorAcumuladaffm=0;
PotAcumuladaffm = 0;
aux=1;
for i=1:size(ErrorpidNoFF)
    
        ErrorAcumuladoffm=ErrorAcumuladoffm+abs(Errorffm(i));
        PotErrorAcumuladaffm=PotErrorAcumuladaffm+PotErrorffm(i);
        PotAcumuladaffm = PotAcumuladaffm + PotTotalffm(i);
        aux=aux+1;
end
ErrorMedioffm=ErrorAcumuladoffm/(aux-1)
PotErrorMediaffm=PotErrorAcumuladaffm/(aux-1)
PotenciaMediaAcumuladaffm=PotAcumuladaffm/(aux-1)


