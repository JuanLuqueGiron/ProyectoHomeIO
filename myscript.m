plot(out.Tgorro)
hold
grid 

length(out.Tgorro)
length(out.Ugorro)
%% 

out.Ugorro=out.Ugorro(1:2251)
systemIdentification

%Identificar fdt de temperatura ambiente frente a temperatura del baño
% cambiar rangos de temperatura ambiente

% Las simulaciones están hechas a 15/10/2025