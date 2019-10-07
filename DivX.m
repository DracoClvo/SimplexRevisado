function divXelm = DivX(a,b)
    for i=1:size(a)
        if b(i) < 0
           divXelm(i) = inf; 
        else
            divXelm(i) = a(i)/b(i);
        end
        
    end
end