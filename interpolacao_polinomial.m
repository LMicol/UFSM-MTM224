%{  
    Lucas Micol - interpolação polinomial
    Métodos Numéricos
%}
% Limpeza de Variáveis
clc
clear

% Leitura dos dados

N = input('Diga o total de pontos a serem aproximados:\n');

%{
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
% Construção de A e B

X = [2.4, 2.6, 2.8, 3.0, 3.2, 3.4, 3.6, 3.8];
Y = [11.02, 13.46, 16.44, 20.08, 24.53, 29.96, 36.59, 44.7];

plot(X,Y,'r*');
hold on;
grid on;

GR = N-1;
gr = GR;

for i=1:N
    gr = GR; 
    for j=1:N
        A(i,j) = (X(i)).^gr;
        gr = gr-1;
    end
end

for i=1:N
    B(i,1) = Y(1,i);
end

% Resolução
solu = A\B;

% Contrução do Polinomio

p = [num2str(solu(1)) '* x^' num2str(GR)];
for i=2:N
    p = [p ' + (' num2str(solu(i)) ')* x^' num2str(N-i)];
end  

disp('O Polinômio é:')
disp(p);

hold on;
grid on;
fplot(p, [min(X), max(X)]);
