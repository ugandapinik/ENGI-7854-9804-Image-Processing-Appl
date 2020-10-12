function b = ideal_br(M,N,cut_off1,cut_off2)
if nargin ~= 4
    eid = sprintf('Images:%s:wrongNumberOfLowPassInputs',mfilename);
    msg = 'Wrong Number of inputs for ''Ideal Band Reject'' filter.';
    error(eid,'%s',msg);
end
a = ischar(M) || ischar(N) || ischar(cut_off1) || ischar(cut_off2);
if a ~= 0
    eid = sprintf('Images:%s:wrongInputType',mfilename);
    msg = 'Wrong type of Input Arguments for''Ideal BRF';
    error(eid,'%s',msg);
end
if ~cut_off1 > prod(M,N) || ~cut_off2 > prod(M,N)
    eid = sprintf('Images:%s:badCutOffValue',mfilename);
    msg = 'Bad Cut of Value for''Ideal BRF';
    error(eid,'%s',msg);
end
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