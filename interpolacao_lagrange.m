%{  
    Lucas Micol - interpolação lagrange
    Métodos Numéricos
%}
% Limpeza de Variáveis
clc
clear

% Leitura dos dados
%{
N = input('Diga o total de pontos a serem aproximados:\n');


X = zeros(1,N);
Y = zeros(1,N);

for i=1:N
    prompt1 = ['Qual o Valor de x(', num2str(i) ,'): '];
    prompt2 = ['Qual o Valor de y(', num2str(i) ,'): '];
    a = input(prompt1); 
    b = input(prompt2);
    X(i) = a;
    Y(i) = b;
end
%}

N = 3;
GR = N-1;

X = [1,2,3];
Y = [-1,3,-5];

plot(X,Y,'r*');
hold on;
grid on;

p = 'a';
num = 'a';
den = 1;

for i=1:N
    den = 1;
    num = 'a';
    L = 'a';
    for j=1:N
        if i~=j
            if (num ~= 'a')
                num = [num ' * (x -' num2str(X(j))  ')'];
                den = den * (X(i) - X(j));
            else
                num = ['(x -' num2str(X(j)) ')'];
                den = den * (X(i) - X(j));            
            end
        end
    end
    L = [num ')/(' num2str(den)];
   
    if(p ~= 'a')
        p = [p ' + ' num2str(Y(i)) ' * (' L ') '];
    else
        p = [num2str(Y(i)) ' * (' L ')'];
    end
end

disp('O Polinômio é:')
disp(p);

hold on;
grid on;
fplot(p, [min(X), max(X)]);





