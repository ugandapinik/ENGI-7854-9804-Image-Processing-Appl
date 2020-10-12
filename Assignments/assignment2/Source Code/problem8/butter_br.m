function b = butter_br(M,N,cut_off1,cut_off2,ord)
if nargin ~= 5
    eid = sprintf('Images:%s:wrongNumberOfBandRejectInputs',mfilename);
    msg = 'Wrong Number of inputs for ''Gaussian Band Reject'' filter.';
    error(eid,'%s',msg);
end
a = ischar(M) || ischar(N) || ischar(cut_off1) || ischar(cut_off2) || ischar(ord);
if a ~= 0
    eid = sprintf('Images:%s:wrongInputType',mfilename);
    msg = 'Wrong type of Input Arguments for''Butterworth BRF';
    error(eid,'%s',msg);
end
if ~cut_off1 > prod(M,N) || ~cut_off2 > prod(M,N)
    eid = sprintf('Images:%s:badCutOffValue',mfilename);
    msg = 'Bad Cut of Value for''Butterworth BRF';
    error(eid,'%s',msg);
end
if cut_off1 > cut_off2
    h_cut_off = cut_off1;
    l_cut_off = cut_off2;
else
    h_cut_off = cut_off2;
    l_cut_off = cut_off1;
end
W = h_cut_off - l_cut_off;
D0 = l_cut_off;
dist = distmatrix(M,N);
Hbr = 1 ./ (1+((dist*W)./((dist.^2)-(D0^2))).^(2*ord));
b = Hbr;