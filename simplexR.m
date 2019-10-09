function simplexR()
    clc;
    %Inicializacion
    Z=input('Z = '); %[-300 -400]; %Se uncion objetivo
    a=input('coeficientes = '); %[ 3 3 ;3 6];     % restricciones 
    b=input('b = '); %[ 120; 180];       %Se define como recursos
    sizea = size(a,1);
    B = eye(sizea);
    A=[a eye(sizea)];
    
    B1=B;
    ln = size(A,2);
    C = [Z zeros(1,ln - size(Z,2))];
    XB=transpose([size(a,2)+1:ln]);
     
    terminar = false;
    
    while ~terminar
        %iteracion 
        CBt = C(XB(:));
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
        B1b = B1 * b;
        if ~terminar
            fprintf('entra X%d\n',Ind_in);
            p=Ind_in
            tp = B1 * A(:,Ind_in); %tp = B1ai
            divX = DivX(B1b,tp);
            [Min_out Ind_out] = min(divX);
            fprintf('sale X%d\n',XB(Ind_out));
            q=Ind_out
            E = CreaE(tp,q,p)
            B1 = E * B1
            XB(Ind_out)= Ind_in;
            %B(:,Ind_out) = A(:,Ind_in)
        end
    end
    
    %Solucion de Z
    Zt= CBt * B1b
    XB
    CBt
end