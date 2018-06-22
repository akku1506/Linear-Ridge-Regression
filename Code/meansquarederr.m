function err= meansquarederr(T, Tdash)
    N=size(T,1);
    error_mat=(T-Tdash)'*(T-Tdash);
    err= error_mat/N;

end