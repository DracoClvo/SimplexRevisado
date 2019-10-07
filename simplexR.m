function simplexR()
    clc;
    %Inicializacion
    Z=input('Z = '); %[-300 -400]; %Se define A como funcion objetivo
    a=input('coeficientes = '); %[ 3 3 ;3 6];     %Se define B como restricciones 
    b=input('b = '); %[ 120; 180];       %Se define C como recursos
    sizea = size(a,1);
    B = eye(sizea);
    A=[a eye(sizea)];
    ln = size(A,2);
    C = [Z zeros(1,ln - size(Z,2))];
    BCol=[size(a,2)+1:ln];
    
    terminar = false;
    
    while ~terminar
        %iteracion 
        CBt = C(BCol(:));
        B1 = inv(B);
        CBtB1 = CBt * B1;
        for i=1:ln
            Zi_Ci(i) = CBtB1 * A(:,i) - C(i);
        end
        Zi_Ci
        %busca los negativos(borrar cometario)
        [Min_in Ind_in] = min(Zi_Ci);
        if Min_in >= 0
            terminar = true;
        end
        %--------------------------------
        fprintf('entra X%d\n',Ind_in);
        B1b = B1 * b;
        B1ai = B1 * A(:,Ind_in);
        divX = DivX(B1b,B1ai);
        [Min_out Ind_out] = min(divX);

        fprintf('sale X%d\n',BCol(Ind_out));
        BCol(Ind_out)= Ind_in;
        B(:,Ind_out) = A(:,Ind_in)
    end
    
    
    
    %Solucion de Z
    Zt= CBt * B1b
end