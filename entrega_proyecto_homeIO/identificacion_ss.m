%% Identificación de Modelos en Espacio de Estados
% Se separa la identificación con 2 variables y con 3 variables usando el código original.

%% 1. IDENTIFICACIÓN CON 2 VARIABLES (Tensión + Temp. Ambiente)
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

%% 2. IDENTIFICACIÓN CON 3 VARIABLES (Tensión + Temp. Ambiente + Luminosidad)
TIL = out.Tgorro;
HIL = out.Ugorro;
TambL = out.Tambgorro;
LumG = out.Lumgorro;

% Igualar longitudes al tamaño de HI
TIL(size(TIL,1)+1:size(HIL,1)) = TIL(end);
TambL(size(TambL,1)+1:size(HIL,1)) = TambL(end);
LumG(size(LumG,1)+1:size(HIL,1))=LumG(size(LumG,1));

% Datos de identificación (con LumG)
Datos3v=iddata(TIL,[HIL,TambL,LumG],200);

% Estimación del sistema en espacio de estados (orden 1)
Sistema3v = ssest(Datos3v, 1);

% Matrices del modelo
Ass2 = Sistema3v.A
Bss2 = Sistema3v.B
Css2 = Sistema3v.C
Dss2 = Sistema3v.D
