% Datos

T1 = [0 1 0 1; 1 0 0 10; 0 0 -1 9; 0 0 0 1 ];
T2 = [1 0 0 -10; 0 -1 0 20; 0 0 -1 10; 0 0 0 1];

%% I Se pide la posicion del tubo respecto a la base.
% como por el grafo sabemos que:
T3 = T2^-1 * T1;
% Luego la posici�n del tubo es:
p = T3(1:3,4:4)

clc
%% II Se pide la matriz de rotacion de T3:

Ttb = T3*rotY(pi);

% Luego la matriz de rotacion ser�:
R3 = Ttb(1:3,1:3)

clc
%% III Se pide la matriz Tcb tras manipular la camara.

% Siguiendo el grafo, seria la inversa de T2 y le hacemos una rotacion en
% Z de 90 grados, como es sobre un eje movil, se postmultiplica.

Tcb =  T2^-1 * rotZ(pi/2) 

clc
%% IV Se pide Ttb tras manipular el tubo.

% Siguiendo el grafo, seria T3 la rotamos y luego desplazamos.
v = [0 4 0];
Ttb =  T3 * rotX(pi/2) * desp(v)

%% V y VI Se pide Ttc tras manipular el tubo y la camara.
% No los entiendo!!!!!! 
% Ttc =   Ttb^-1 * Tcb^-1 ?

