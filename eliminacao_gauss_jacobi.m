% Elimina��o de Gauss-Jacobi - Lucas Micol
% Metodos num�ricos computacionais

% Limpar vari�veis
clc
clear
format long

% Leitura
%A = input('Insira sua matriz A:\n');
%b = input('Insira sua matriz b:\n');
A = rand(10,10);
b = rand (10,1);
max = input('Insira o n.m�ximo de itera��es:\n');
tol = input('Insira sua toler�ncia:\n');
%x = input('Insira seu vetor inicial:\n');
x = rand (10,1);

% Constru��o C & g
[n,m] = size(A);

if(n~=m)
    return
end

for i=1:n
    for j=1:n
       if i == j
           A(i,j) =  A(i,j)*1000;
       end
    end
end

C = [n,m];
g = (n);

for i=1:n
   for j=1:n 
        if  (i == j)
            C(i,j) = 0;
        else
            C(i,j) = (-A(i,j)/A(i,i));
        end
   end
   g(1,i) = (b(i)/A(i,i));
end

g = transpose(g);

% Converg�ncia
if (norm(C,inf) >= 1)
    if (norm(C,1) >= 1)
        fprintf('N�o h� garantias de Converg�ncia\n');
        return
    end
end

% M�todo Iterativo
x0 = x;
for i=1:max
    x1 = C*x0 + g;
    if ( (norm(x0-x1, inf)) / (norm(x1, inf)) <= tol)
        fprintf('Solu��o encontrada:\n');
        disp(x1);
        return;
    end
    x0 = x1;
end
fprintf('O limite de Execu��o estourou, a solu��o aproximada foi:\n');
disp(x1);