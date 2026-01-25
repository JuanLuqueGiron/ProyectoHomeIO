% Espacio de estados

TIL = out.Tgorro;
HIL = out.Ugorro;
TambL = out.Tambgorro;
LumG = out.Lumgorro;
%% 

% Igualar longitudes al tamaño de HI
TIL(size(TIL,1)+1:size(HIL,1)) = TIL(end);
TambL(size(TambL,1)+1:size(HIL,1)) = TambL(end);
LumG(size(LumG,1)+1:size(HIL,1))=LumG(size(LumG,1));


% Datos de identificación (con LumG)
Datos=iddata(TIL,[HIL,TambL,LumG],200);
Datos2=iddata(TIL,[HIL,TambL],200);
% Estimación del sistema en espacio de estados (orden 1)
Sistema = ssest(Datos, 1);
Sistema2 = ssest(Datos2, 1);

% Matrices del modelo
Ass1 = Sistema.A
Bss1 = Sistema.B
Css1 = Sistema.C
Dss1 = Sistema.D

Ass2 = Sistema2.A
Bss2 = Sistema2.B
Css2 = Sistema2.C
Dss2 = Sistema2.D