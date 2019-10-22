function E = CreaE(tp,q,p)
    E = eye(size(tp,1));
    for i=1:size(tp,1)
        if(i == q)
            sus(i) = 1 / tp(q);
        else
            sus(i) = - tp(i) / tp(q);
        end
    end
    E(:,q) = sus;
end