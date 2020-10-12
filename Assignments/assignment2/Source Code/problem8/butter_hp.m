function b = butter_hp(M,N,cut_off,ord)
if nargin ~= 4
    eid = sprintf('Images:%s:wrongNumberOfLowPassInputs',mfilename);
    msg = 'Wrong Number of inputs for ''Butterworth High Pass'' filter.';
    error(eid,'%s',msg);
end
a = ischar(M) || ischar(N) || ischar(cut_off) || ischar(ord);
if a ~= 0
    eid = sprintf('Images:%s:wrongInputType',mfilename);
    msg = 'Wrong type of Input Arguments for''Butterworth HPF';
    error(eid,'%s',msg);
end
if cut_off > prod(M,N) 
    eid = sprintf('Images:%s:badCutOffValue',mfilename);
    msg = 'Bad Cut of Value for''Ideal LPF';
    error(eid,'%s',msg);
end
dist = distmatrix(M,N);
b = 1 ./ (1 + (cut_off ./ dist) .^ (2 * ord));