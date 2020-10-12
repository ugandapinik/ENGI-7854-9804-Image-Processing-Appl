function b = gaussian_br(M,N,cut_off1,cut_off2)

if cut_off1 > cut_off2
    h_cut_off = cut_off1;
    l_cut_off = cut_off2;
else
    h_cut_off = cut_off2;
    l_cut_off = cut_off1;
end
dist = distmatrix(M,N);
W = h_cut_off - l_cut_off;
D0 = l_cut_off;
Hbr = 1 - exp((-1/2)*(((dist.^2)-(D0^2))./ (dist*W)).^2);
b = Hbr;
end