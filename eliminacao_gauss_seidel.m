% Limpar variáveis
clc
clear
format long

% Leitura
A = input('Insira sua matriz A:\n');
b = input('Insira sua matriz b:\n');
%A = rand(10,10);
%b = rand (10,1);
lim = input('Insira o n.máximo de iterações:\n');
tol = input('Insira sua tolerância:\n');
x = input('Insira seu vetor inicial:\n');
%x = rand (10,1);

% Construção C & g
[n,m] = size(A);

if(n~=m)
    return
end

%for i=1:n
%    for j=1:n
%       if i == j
%           A(i,j) =  A(i,j)*1000;
%       end
%    end
%end

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


% Convergência
b1 = sum(abs(C(1,1:n)));
B(1) = b1;

for i=2:n
    bj = 0;
    cij = 0;
    for j=1:i-1
        bj = bj + B(j)* abs(C(i,j));
    end
    for j=i+1:n
        cij = cij + abs(C(i,j));
    end
    B(i) = bj + cij;
end

maximmoB = max(max(B));

if maximoB < 1
    fprintf('Não há garantias de Convergência\n');
    return;
end


% Método Iterativo

while (n < lim && erro > tol)
    
    x1 = C*x0 + g;
    erro = (norm(x0-x1, inf)) / (norm(x1, inf));
    if (erro <= tol)
        fprintf('Solução encontrada:\n');
        disp(x1);
        return;
    end
    x0 = x1;
end

fprintf('O limite de Execução estourou, a solução aproximada foi:\n');
disp(x1);













