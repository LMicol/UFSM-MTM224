%{  
    Lucas Micol - interpolação Newton
    Métodos Numéricos
%}

% Limpeza de Variáveis
clc;
clear;
format short g

%Leitura dos dados
%{
N = input('Diga o total de pontos a serem aproximados:\n');

X = zeros(1,N);
Y = zeros(1,N);

for i=1:N
    prompt1 = ['Qual o Valor de x(', num2str(i) ,'): '];
    prompt2 = ['Qual o Valor de y(', num2str(i) ,'): '];
    q = input(prompt1); 
    X(i) = q;
    q = input(prompt2);
    Y(i) = q;
end
%}
N = 5;
X = [-2,-1,0,1,2];
Y = [-4, 0, 5, 30, 80];

plot(X, Y, 'r*');
grid on;
hold on;

A = zeros(N,N+1);
A(:,1) = X;
A(:,2) = Y;


loop = 1;
tam = N-1;

for j=3:(N+1)
    for i=1:tam
        A(i,j) = (A(i+1,j-1) - A(i,j-1))/(A(i+loop,1) - A(i,1));
    end
    loop = loop+1;
    tam = tam-1;
end

p = [num2str(A(1,2)) ' + (x - ' num2str(A(1,2)) ')'];
for i=3:N+1
    p = [p ' * ' num2str(A(1,i))];
    if i==(N+1)
        break;
    end
    for j=2:i
        if j==2
            p = [p ' + (x - ' num2str(A(j-1,1)) ')' ];
        else
            p = [p ' * (x - ' num2str(A(j-1,1)) ')'];
        end
    end
end

disp(p);
fplot(p, [min(X),max(X)]);















