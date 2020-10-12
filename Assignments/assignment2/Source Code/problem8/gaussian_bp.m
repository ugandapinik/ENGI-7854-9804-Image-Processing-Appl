function b = gaussian_bp(M,N,cut_off1,cut_off2)
if nargin ~= 4
    eid = sprintf('Images:%s:wrongNumberOfBnadPassInputs',mfilename);
    msg = 'Wrong Number of inputs for ''Gaussian Band Pass'' filter.';
    error(eid,'%s',msg);
end
a = ischar(M) || ischar(N) || ischar(cut_off1) || ischar(cut_off2);
if a ~= 0
    eid = sprintf('Images:%s:wrongInputType',mfilename);
    msg = 'Wrong type of Input Arguments for''Gaussian BPF';
    error(eid,'%s',msg);
end
if ~cut_off1 > prod(M,N) || ~cut_off2 > prod(M,N)
    eid = sprintf('Images:%s:badCutOffValue',mfilename);
    msg = 'Bad Cut of Value for''Gaussian BPF';
    error(eid,'%s',msg);
end
if cut_off1 > cut_off2
    h_cut_off = cut_off1;
    l_cut_off = cut_off2;
else
    h_cut_off = cut_off2;
    l_cut_off = cut_off1;
end
dist = distmatrix(M,N);
W = h_cut_off-l_cut_off;
D0 = l_cut_off;
numrator = (dist.^2)-(D0^2);
denom = dist*W;
val = (numrator./denom).^2;
Hbp = exp((-1/2)*val);
b = Hbp;