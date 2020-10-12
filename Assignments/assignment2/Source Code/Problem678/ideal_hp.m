function b = ideal_hp(M,N,cut_off)
    dist = distmatrix(M,N);
    H = ones(M,N);
    ind = dist<= cut_off;
    H(ind) = 0;
    b = double(H);
end