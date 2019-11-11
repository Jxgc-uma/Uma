%% Ej1: Obtencion de los angulos alfa y beta de las coordenadas esfericas.

% Sea el punto P(x,y,z) con {x, y, z} mis parametros.

% Introducimos los valores de nuestros parametros.
% prompt = 'Introduzca el valor de x ';
% x = input(prompt);
% prompt = 'Introduzca el valor de y ';
% y = input(prompt);
% prompt = 'Introduzca el valor de z ';
% z = input(prompt);
x = 100, y = 70, z = 150;
% Sean K y L las hipotenusas de ambos triangulos rectangulos
L = sqrt(x^2 + y^2);
K = sqrt(L^2 + z^2);

% Calculamos alfa a traves del seno, coseno y atan2(sen,cos)
S_alfa = y / L;
C_alfa = x / L;
Alfa = atan2(S_alfa,C_alfa);
% Calculamos beta a traves del seno, coseno y atan2(sen,cos)
S_beta = z / K;
C_beta = L / K;
Beta = atan2(S_beta,C_beta);

Angulos = [Alfa, Beta]

% Desplazamiento y rotacion del eje (usando createframe)

% Mis parametros
P = [x,y,z];
Z = [0 0 0];
T1 = eye(4);
T2 = desp(P) * rotZ(Alfa) * rotY(-(Beta + pi/2));
c1 = 'b';
c2 = 'r';
Etiqueta1 = 'A';
Etiqueta2 = 'B';
L = 200;

% Create frame

createFRAME(T1,c1,Etiqueta1,L)
createFRAME(T2,c2,Etiqueta2,L)
grid on;

%% Ej2: Problema inverso respecto a la orientacion.
% Defino mis variables simbolicas
syms alpha beta gamma O A T real;

% Matriz inicial
To = eye(4);

% Matriz de rotacion b respecto a h.
Rbh = rotY(gamma) * rotX(alpha) * To * rotZ(beta);

% Matriz de rotacion OAT.
Roat = [cos(O) * sin(T) - sin(O) * sin(A) * cos(T) sin(T) * sin(A) * sin(O) + cos(O) * cos(T) cos(A) * sin(O);
        sin(O) * sin(T) + cos(O) * sin(A) * cos(T) cos(T) * sin(O) - cos(O) * sin(T) * sin(A) (-cos(O)) * cos(A);
        -cos(A) * cos(T) sin(T) * cos(A) (-sin(A))];

Rbh_rot = Rbh(1:3,1:3);
% pretty(Rbh);
% Para obtener la matriz en latex se usa:
l1 = latex(Rbh_rot);
l2 = latex(Roat);

% Sustituyo los valores de alga beta y gamma.
Rbh_rot = subs(Rbh_rot,{alpha,beta,gamma},{degtorad(45),degtorad(30),degtorad(60)});
% pretty(Rbh_rot);
latex(Rbh_rot);
% Resulevo el sistema igualando los valores de ambas matrices con el
% siguiente comando:

% eqn = Roat(3,3) == Rbh_rot(3,3);
% Sa = solve(eqn,A)
% 
% eqn2 = Roat(1,3)^2 + Roat(2,3)^2 == Rbh_rot(1,3)^2 + Rbh_rot(2,3)^2;
% sa2 = solve(eqn2,A)

% Como me da dos soluciones tengo que ver el cuadrante en el que estoy:
A = atan2(-sqrt(2)/2,sqrt(7/8));

O = atan2(sqrt(6)/(4*cos(A)),sqrt(2)/(2*cos(A)));

T = atan2(((sqrt(6)/8) + (sqrt(3)/4))/cos(A),((sqrt(2)/8)- 3/4)/cos(A));

Voat = [O,A,T]