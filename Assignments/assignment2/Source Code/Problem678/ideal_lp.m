function b = ideal_lp(M,N,cut_off)
    dist = distmatrix(M,N);
    H = zeros(M,N);
    ind = dist <= cut_off;
    H(ind) = 1;
    b = double(H);
end