% Método das Cordas - Lucas Micol
% Metodos numéricos computacionais

% Limmpar variáveis e comandos
clc
clear
syms x;
% Parámetros
disp('Sua função: ');
f = input('', 's');

disp('Limite inferior: ');
a = input('');

disp('Limite superior: ');
b = input('');

if(a > b)
    disp('Limites mal inseridos');
    return
end  

disp('Precisão: ');
err = input('');

disp('Máximo de Execuções: ');
lim = input('');

fa = subs(f,a);
fb = subs(f,b);


% Execução

if fa*fb < 0
    i_atual = 1;
    while i_atual < lim
        fa = subs(f,a);
        fb = subs(f,b);
        x = ((a*fb)-(b*fa))/(fb-fa);
        fx = subs(f, x);
        
        pause on;
        fplot(f, [a,b]);
        grid on;
        pause(2);
        
        fprintf('f(a): %f | f(b): %f | x: %f | f(x): %f\n', fa, fb, x, fx);
        
        if (abs(fx) < err)
            fprintf('Solução encontrada.');
            disp(x);
            return
        end
        
        if (fx)*(fb) < 0
            a = x;
        else
            b = x;
        end
        i_atual = i_atual+1;
    end
else
    if fa*fb == 0
        if fa == 0
            fprintf('O limite inferior é a solução');
            disp(a);
            return;
        else
            fprintf('O limite superior é a solução');
            disp(b);
            return;
        end
    end
end    
