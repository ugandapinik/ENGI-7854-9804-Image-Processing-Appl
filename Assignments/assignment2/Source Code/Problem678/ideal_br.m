function b = ideal_br(M,N,cut_off1,cut_off2)
    if cut_off1 > cut_off2
        h_cut_off = cut_off1;
        l_cut_off = cut_off2;
    else
        h_cut_off = cut_off2;
        l_cut_off = cut_off1;
    end
    H1 = ideal_hp(M,N,l_cut_off);
    H2 = ideal_lp(M,N,h_cut_off);
    Hbr = H2 - H1;
    ind = Hbr == -1;
    Hbr(ind) = 1;
    b = Hbr;
end
