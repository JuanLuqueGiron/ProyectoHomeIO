
%%Parámetros de mis modelos en el espacio de estados.

sys=ss(Ass1,Bss1,Css1,Dss1);
Ts=200;
sysd=c2d(sys,Ts);
Ad=sysd.A;Bd=sysd.B;Cd=sysd.C;

PLANTA=sysd;
PLANTA = setmpcsignals(PLANTA,'MV',1,'MD',[2 3]);
hpred=25;hcont=4;
Weights=struct('ManipulatedVariables',[0],'ManipulatedVariablesRate',[2],'OutputVariables',1);
MV=struct('Min',0,'Max',10,'Ratemin',-inf,'Ratemax',inf);
MPCOBJ = mpc(PLANTA,Ts,hpred,hcont,Weights,MV);

% Inicialización de variables
uk=0;uk1=0;yk1=0;yk2=0;yk=0;du=0;
xk1=0;xk=0;yk=0;Tamb=0;Lum=0;
xc=mpcstate(MPCOBJ);
dk=0;M=[];Yk=[];

for i=1:1000
    referencia=5;
    if(i>500)
        referencia=10;
    end
    if(i==150)
        Tamb=-5;
        Lum=2;
    end
    uk=mpcmove(MPCOBJ,xc,yk,referencia,[Tamb Lum]);


    x=Ad*xk1+Bd*[uk;Tamb;Lum];
    yk=Cd*x;

    ref(i)=referencia;
    dib(i)=yk;
    cont(i)=uk;

    xk1=x;
end
figure()
plot(dib),hold,plot(ref,'r'),plot(cont,'g')
grid on;

