% Elimina��o de Gauss - Lucas Micol
% Metodos num�ricos computacionais

% Limpar vari�veis
clc
clear
format short

% Leitura
A = input('Insira sua matriz A:\n');
b = input('Insira sua matriz b:\n');

% Aumentada
Ab = [A b];

%Elimina��o de Gaus
[n k] = size(A);

if n ~= k
    return;
end

for  j = 1 : n-1
    for i = j+1 : n
        Mij(i,j) = Ab(i,j)/Ab(j,j);
        Ab(i,:) = Ab(i,:) - Mij(i,j)*Ab(j,:);
    end
end        
    
% Resolu��o
x(n) = Ab(n,n+1)/Ab(n,n);

for i=n-1:-1:1
    soma = 0;
    for j=i+1:n
        soma = soma + Ab(i,j)*x(j);
    end
    
    if Ab(i,i) ~= 0
        x(i) = (Ab(i, n+1) - soma)/Ab(i,i);
    else
        fprintf('\n\nO problema N�o possui solu��o\n');
        return;
    end
end        
   
fprintf('\n\nA Solu��o do problema �: \n');
for i = 1:n
    fprintf('x(%d) = %f \n', i, x(i))
end        