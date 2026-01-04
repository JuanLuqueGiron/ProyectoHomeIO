plot(out.Tambgorro); hold on;
plot(out.Tgorro)
hold
grid 

length(out.Tgorro)
length(out.Tambgorro)
%% 

out.Ugorro=out.Ugorro(1:2251)
systemIdentification

%Identificar fdt de temperatura ambiente frente a temperatura del baño
% cambiar rangos de temperatura ambiente

% Las simulaciones están hechas a 15/10/2025

%% 

TIL = out.Tgorro;
HIL = out.Ugorro;
TambL = out.Tambgorro;

% Igualar longitudes al tamaño de HI
TIL(size(TIL,1)+1:size(HIL,1)) = TIL(end);
TambL(size(TambL,1)+1:size(HIL,1)) = TambL(end);

% Datos de identificación (sin LumG)
Datos = iddata(TIL, [HIL, TambL], 200);

% Estimación del sistema en espacio de estados (orden 1)
Sistema = ssest(Datos, 1);

% Matrices del modelo
Ass1 = Sistema.A
Bss1 = Sistema.B
Css1 = Sistema.C
Dss1 = Sistema.D