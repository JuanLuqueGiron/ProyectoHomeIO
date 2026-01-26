%% Cálculo de Métricas de Rendimiento (Original de guardadovariables.m)
% Este script calcula errores medios, potencias y métricas IAE/ITAE/ITSE.

start_idx =  floor(58000/200);

%% --- CÁLCULO DE ERRORES MEDIOS Y POTENCIAS ---

%% Error PID con WU (Antiwindup)
Errorwum = Errorwu(58000/200:end);
PotErrorwum = Errorwum.^2;
PotTotalwum = Potenciawu(58000/200:end);
ErrorAcumuladowum=0; PotErrorAcumuladawum=0; PotAcumuladawum = 0;
aux=1;
for i=1:size(Errorwum)
    ErrorAcumuladowum=ErrorAcumuladowum+abs(Errorwum(i));
    PotErrorAcumuladawum=PotErrorAcumuladawum+PotErrorwum(i);
    PotAcumuladawum = PotAcumuladawum + PotTotalwum(i);
    aux=aux+1;
end
ErrorMediowum=ErrorAcumuladowum/(aux-1);
PotErrorMediawum=PotErrorAcumuladawum/(aux-1);
PotenciaMediaAcumuladawum=PotAcumuladawum/(aux-1);

%% Error PID con FF
Errorffm = Errorff(58000/200:end);
PotErrorffm = Errorffm.^2;
PotTotalffm = Potenciaff(58000/200:end);
ErrorAcumuladoffm=0; PotErrorAcumuladaffm=0; PotAcumuladaffm = 0;
aux=1;
for i=1:size(Errorffm)
    ErrorAcumuladoffm=ErrorAcumuladoffm+abs(Errorffm(i));
    PotErrorAcumuladaffm=PotErrorAcumuladaffm+PotErrorffm(i);
    PotAcumuladaffm = PotAcumuladaffm + PotTotalffm(i);
    aux=aux+1;
end
ErrorMedioffm=ErrorAcumuladoffm/(aux-1);
PotErrorMediaffm=PotErrorAcumuladaffm/(aux-1);
PotenciaMediaAcumuladaffm=PotAcumuladaffm/(aux-1);

%% Error MPC
Errormpcm = Errormpc(58000/200:end);
PotErrormpcm = Errormpcm.^2;
PotTotalmpcm = Potenciampc(58000/200:end);
ErrorAcumuladompcm=0; PotErrorAcumuladampcm=0; PotAcumuladampcm = 0;
aux=1;
for i=1:size(Errormpcm)
    ErrorAcumuladompcm=ErrorAcumuladompcm+abs(Errormpcm(i));
    PotErrorAcumuladampcm=PotErrorAcumuladampcm+PotErrormpcm(i);
    PotAcumuladampcm = PotAcumuladampcm + PotTotalmpcm(i);
    aux=aux+1;
end
ErrorMediompcm=ErrorAcumuladompcm/(aux-1);
PotErrorMediampcm=PotErrorAcumuladampcm/(aux-1);
PotenciaMediaAcumuladampcm=PotAcumuladampcm/(aux-1);

%% --- CÁLCULO DE ÍNDICES IAE, ITAE, ITSE ---

% 1. Extraer los datos
twu = tiempowu; ewu = Errorwu;
tff = tiempoff; eff = Errorff;
tmpc = tiempompc; empc = Errormpc;

% 2. Calcular valor absoluto
abs_ewu = abs(ewu); abs_eff = abs(eff); abs_empc = abs(empc);

% 3. Calcular integrales (trapz)
IAEwu = trapz(twu, abs_ewu);
IAEff = trapz(tff, abs_eff);
IAEmpc = trapz(tmpc, abs_empc);

ITAE_wu  = trapz(twu,  twu  .* abs(ewu));
ITAE_ff  = trapz(tff,  tff  .* abs(eff));
ITAE_mpc = trapz(tmpc, tmpc .* abs(empc));

ITSE_wu  = trapz(twu,  twu  .* (ewu.^2));
ITSE_ff  = trapz(tff,  tff  .* (eff.^2));
ITSE_mpc = trapz(tmpc, tmpc .* (empc.^2));

% Mostrar resultados
fprintf('--- Resultados IAE ---\n');
fprintf('WU:  %.4f\nFF:  %.4f\nMPC: %.4f\n\n', IAEwu, IAEff, IAEmpc);

fprintf('--- Resultados ITAE ---\n');
fprintf('WU:  %.4f\nFF:  %.4f\nMPC: %.4f\n\n', ITAE_wu, ITAE_ff, ITAE_mpc);

fprintf('--- Resultados ITSE ---\n');
fprintf('WU:  %.4f\nFF:  %.4f\nMPC: %.4f\n', ITSE_wu, ITSE_ff, ITSE_mpc);
