% Método de Newton - Lucas Micol
% Metodos numéricos computacionais

% Limmpar variáveis e comandos
clc
clear

%----------------------

% Parámetros
disp('Sua função: ');
f = input('', 's');

disp('Valor inicial: ');
InitVal = input('');

disp('Precisão: ');
err = input('');
disp('Máximo de Execuções: ');
lim = input('');

%----------------------

% Execução
fx = subs(f,InitVal);
syms x;
df  = diff(f);
dfx = subs(df,InitVal);

n = 1;

if (abs(dfx) < err)
    disp('O valor do diferencial está menor que o erro');
    return;
end

flag = 0;
dfxA = dfx;

while (n <= lim)

    %-----------------------------
    
    x1 = InitVal - (fx/dfx);
    fx = subs(f, x1);
    
    if (flag == 0)
        dfx = subs(df, x1);
    end
    
    if(abs(dfx) > err)
        dfxA = dfx;
    else
        dfx = dfxA;
        flag = 1;
    end
    
    n = n +1; 
    
    fprintf('f(x1): %f | x1: %f | x: %f | diff: %f | flag: %d\n', fx, x1, InitVal, dfx, flag);
    
    %-----------------------------
    
    if(abs(fx) < err)
        disp('O método convergiu pela Imagem');
        fprintf('Solução:  %f\n', x1);
        break;
    end      
    
    if( abs(x1-InitVal)/abs(x1) < err)
        disp('O método convergiu pelo Domínio');
        fprintf('Solução:  %f\n', x1);
        break;
    end
    
    InitVal = x1;
end


























