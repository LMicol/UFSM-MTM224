% M�todo de Newton - Lucas Micol
% Metodos num�ricos computacionais

% Limmpar vari�veis e comandos
clc
clear

%----------------------

% Par�metros
disp('Sua fun��o: ');
f = input('', 's');

disp('Valor inicial: ');
InitVal = input('');

disp('Precis�o: ');
err = input('');
disp('M�ximo de Execu��es: ');
lim = input('');

%----------------------

% Execu��o
fx = subs(f,InitVal);
syms x;
df  = diff(f);
dfx = subs(df,InitVal);

n = 1;

if (abs(dfx) < err)
    disp('O valor do diferencial est� menor que o erro');
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
        disp('O m�todo convergiu pela Imagem');
        fprintf('Solu��o:  %f\n', x1);
        break;
    end      
    
    if( abs(x1-InitVal)/abs(x1) < err)
        disp('O m�todo convergiu pelo Dom�nio');
        fprintf('Solu��o:  %f\n', x1);
        break;
    end
    
    InitVal = x1;
end


























