%{
    Método 1/3 de Simpson
    Lucas Micol
%}  

% limpeza de variaveis
clc;
clear;

% Leitura de dados
syms x;
fx = input('Digite sua função:\n');
a  = input('Digite o ponto inicial:\n');
b  = input('Digite o ponto final:\n');
n  = input('Digite o numero de intervalos:\n');

if(mod(n,2) ~= 0)
    disp('numero de intervalos nao eh par');
    return;
end

% Execução

h = (b-a)/n;

A = subs(fx,a) + subs(fx,b);
dist = a+h;

for i=2:n
    if(mod(i,2) == 0)
        A = A + (4*(subs(fx, dist)));
    else
        A = A + (2*(subs(fx, dist)));
    end
    dist = dist+h;
end

A = A*(h/3);

disp(A);



