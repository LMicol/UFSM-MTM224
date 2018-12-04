%{  
    Lucas Micol - trapezios generalizados
    Métodos Numéricos
%}

%Limpeza das variáveis
clc;
clear;
format short g

%Leitura de dados
f = input('Digite a sua funcao: ', 's');
if f(1) == 'e'
    f = 'exp(x)';
end
A = input('Entre com o ponto a: ');
B = input('Entre com o ponto b: ');

N = input('Entre com o número de subintervalos: ');

H = (B-A)/N;

K=1;

for i=A:H:B
    X(K) = i;
    K = K+1;
end

for i=1:N+1
    Y(i) = subs(f,X(i));
end

sum = 0;

for i=1:(N+1)
    if i~=1 && i~=(N+1)
        sum = sum + 2*Y(i);
    else
        sum = sum + Y(i);
    end
end

res = (H/2) * sum;

disp(res);