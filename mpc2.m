%% 

%%ParÃ¡metros de mis model en el espacio de estados. AQUÃ? EL ALUMNO DEBE
%%INCL
A= [-3.8669886e-5];
B=[-1.450262318829149e-06,-6.531519388547637e-07];
C=-71.051001498443750;
D=[0,0];
sys=ss(A,B,C,D);
%%Discretizamos el sistema:
Ts=200; %%TIEMPO DE MUESTREO: ELEGIR UNO ADECUADO. EL QUE ESTÁ NO ES ADECUADO
sysd=c2d(sys,Ts);
Ad=sysd.A;Bd=sysd.B;Cd=sysd.C;

 PLANTA=sysd;
 PLANTA = setmpcsignals(PLANTA,'MV',1,'MD',2); %%CONFIGURAR VARIABLES MANIPULABLES Y MANIPULADAS: manipulables: el radiador: manipuladas: Tamb y Lum
%%HORIZONTES DE CONTROL Y PREDICCIÃ“N: PARÁMETROS DE SELECCIÓN. PROBAR
 hpred=10;hcont=8;
 Weights=struct('ManipulatedVariables',[0],'ManipulatedVariablesRate',[2],'OutputVariables',1); %%PESOS, MANIPULATED VARIABLES=0, OUTPUT VARIABLES=1
 %%PROBAR QUÉ PASA CON LOS DISTINTOS PESOS: NO CAMBIAR EL PESO DE
 %%MANIPULATED VARIABLES.
 MV=struct('Min',0,'Max',10,'Ratemin',-inf,'Ratemax',inf); %%restricciones en las variables manipulables: máximo, mínimo, y minimo y máximo slew rate
 MPCOBJ = mpc(PLANTA,Ts,hpred,hcont,Weights,MV); %CREAR EL OBJETO



 uk=0;uk1=0;yk1=0;yk2=0;yk=0;du=0;
 xk1=0;xk=0;yk=0;Tamb=0;Lum=0;
% %%Estado del control mpc
xc=mpcstate(MPCOBJ);
 %%Defines el estado del controlador mpc xc (estado estimado)
 dk=0;M=[];Yk=[];
% %%mpcmove
% 
 for i=1:1000
     referencia=5;
     if(i>500)
         referencia=10;
     end
   if(i==150)
       Tamb=-5;
       Lum=2;
   end
   %MPCMOVE: proyecta el mpc para resolver el problema de optimización y
   %devuelve la variable de control a aplicar en el momento actual
   uk=mpcmove(MPCOBJ,xc,yk,referencia,Tamb);


   x=Ad*xk1+Bd*[uk;Tamb];
   yk=Cd*x;

   ref(i)=referencia;
   dib(i)=yk;
   cont(i)=uk;
   %%ACTUALIZACIÓN DE VALORES

   xk1=x;
 end
% 
 figure()
 plot(dib),hold,plot(ref,'r'),plot(cont,'g')
 grid on;


 % Potencia acumulada mejor que potencia media. 

 % Pot instantanea dir 141 en WATTS. Para hacer los calculos dividirlos entre 1000