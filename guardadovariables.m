%% Guardado de variables
% Este script se encarga únicamente de extraer y guardar las variables de la simulación.

%% PID con antiwindup clamping
tiempowu = out.tout;
Usatwu = out.Usaturada;
Twu = out.Treal;
Refwu = out.Referencia;
Errorwu = out.Error;
Potenciawu = out.Potencia;
a=2;
save('mis_datos_completo.mat');

%% PID con antiwindup clamping (FeedForward)
tiempoff = out.tout;
Usatff = out.Usaturada;
Tff = out.Treal;
Refff = out.Referencia;
Errorff = out.Error;
Potenciaff = out.Potencia;
a=3;
save('mis_datos_completo.mat');

%% MPC
tiempompc = out.tout;
Usatmpc = out.Usaturada;
Tmpc = out.Treal;
Refmpc = out.Referencia;
Errormpc = out.Error;
Potenciampc = out.Potencia;
a=4;
save('mis_datos_completo.mat');
