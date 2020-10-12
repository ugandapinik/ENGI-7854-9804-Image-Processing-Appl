function b = ideal_lp(M,N,cut_off)
if nargin ~= 3
    eid = sprintf('Images:%s:wrongNumberOfLowPassInputs',mfilename);
    msg = 'Wrong Number of inputs for ''Ideal Low Pass'' filter.';
    error(eid,'%s',msg);
end
a = ischar(M) || ischar(N) || ischar(cut_off);
if a ~= 0
    eid = sprintf('Images:%s:wrongInputType',mfilename);
    msg = 'Wrong type of Input Arguments for''Ideal LPF';
    error(eid,'%s',msg);
end
if cut_off > prod(M,N)
    eid = sprintf('Images:%s:badCutOffValue',mfilename);
    msg = 'Bad Cut of Value for''Ideal LPF';
    error(eid,'%s',msg);
end
dist = distmatrix(M,N);
H = zeros(M,N);
ind = dist<= cut_off;
H(ind) = 1;
b = double(H);