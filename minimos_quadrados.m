%{
    Método dos Mínimos quadrados
    Lucas Micol
    Métodos Numéricos - 2018/2
%}
% Clear
clear
clc
format long

% Leitura
n = input('Diga o total de pontos a serem aproximados:\n');

x = zeros(1,n);
y = zeros(1,n);

M1 = zeros(2,2);
M2 = zeros(2,1);
Yzero = zeros(1, n);

for i=1:n
    prompt1 = ['Qual o Valor de x(', num2str(i) ,'): '];
    prompt2 = ['Qual o Valor de y(', num2str(i) ,'): '];
    a = input(prompt1); 
    b = input(prompt2);
    x(i) = a;
    y(i) = b;
end

fprintf('\n1 - Ajuste polinomial\n2 - Hiperbolico\n3 - Exponencial de base e\n4 - Exponencial de base qualquer\n5 - Geométrico\n');
switch_ = input('Entre com a opção desejada: ');

switch switch_
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Caso polinomial%
    case 1
        m = input('\nInsira o Grau do Polinômio:\n');
        A = zeros(m+1,m+1);
        b = zeros(m+1, 1);

        for i=1:(m+1)
            g = 2*m - (i-1);
            for j=1:(m+1)
                A(i,j) = sum(x.^g);
                g = g-1;
            end
        end

        g=m;
        for i=1:(m+1)
            b(i) = sum(y.*(x.^g)); 
            g = g-1;
        end

        mat = [A b];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Caso Hiperbólico%
    case 2
        for i=1:n
            X(i) = x(i);
            Yzero(i) = 1/y(i);
        end

        for i=2:-1:1
            g = 2+(i-1);
            for j=2:-1:1
                g = g-1;
                M1(i,j) = sum(x.^g);
            end
            M2(i) = sum((x.^g).*Yzero);
        end

        mat = [M1 M2];
        m=1;
        n=2;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Casos Exponenciais%
    case 3
        n = length(y);
        for i=1:n
            X(i) = x(i);
            Yzero(i) = log(y(i));
        end

        for i=2:-1:1
            g = 2+(i-1);
            for j=2:-1:1
                g = g-1;
                M1(i,j) = sum(x.^g);
            end
            M2(i) = sum((x.^g).*Yzero);
        end

        mat = [M1 M2];
        m = 1;
        n = 2;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Casos Exponenciais%
    case 4
        n = length(y);
        for i=1:n
            X(i) = x(i);
            Yzero(i) = log(y(i));
        end

        for i=2:-1:1
            g = 2+(i-1);
            for j=2:-1:1
                g = g-1;
                M1(i,j) = sum(x.^g);
            end
            M2(i) = sum((x.^g).*Yzero);
        end

        mat = [M1 M2];
        m = 1;
        n = 2;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %Casos Geométricos%
    case 5
        n = length(y);
        for i=1:n
            X(i) = log(x(i));
            Yzero(i) = log(y(i));
        end

        for i=2:-1:1
            g = 2+(i-1);
            for j=2:-1:1
                g = g-1;
                M1(i,j) = sum(x.^g);
            end
            M2(i) = sum((x.^g).*Yzero);
        end

        mat = [M1 M2];
        m = 1;
        n = 2;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
end


%%% Solução do sistema linear 2x2
for j=1:(m+1)  
        for i=j+1:(m+1)
            me = mat(i, j)/mat(j, j);
            mat(i, :) = mat(i, :) - me*mat(j, :);
        end
end

sol(m+1) = mat(m+1,m+2)/mat(m+1,m+1);
soma = 0;
for i=m:-1:1
    soma = 0;
    for j=i+1:(m+1)
         soma = soma + mat(i, j)*sol(j);
    end
    sol(i)=(mat(i,m+1)-soma)/mat(i,i);
end


%%% Transformações de Alfa e Beta para os casos precisos
switch switch_ 
    case 3
        aux = sol(2);
        sol(2) = exp(sol(1));
        sol(1) = aux;
    case 4
        aux = sol(1);
        sol(1) = exp(sol(2));
        sol(2) = exp(aux);
    case 5
        aux = sol(2);
        sol(2) = exp(sol(1));
        sol(1) = aux;
end


%%% Concatenação de String
p = [num2str(sol(1))];
for i=2:m+1
    switch switch_
        case  3
            p = [p ' * e^(' num2str(sol(i)) '* x^' num2str(i-1) ')'];
        case 4
            p = [p ' * (' num2str(sol(i)) ')^x'];
        case 5
            p = [p ' * x^(' num2str(sol(i)) ')'];
        otherwise
            p = [p ' + (' num2str(sol(i)) ')* x^' num2str(i-1)];
    end
end

disp(p);
ezplot(p);
grid on;


