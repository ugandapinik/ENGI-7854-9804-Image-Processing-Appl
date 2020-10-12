function b = gaussian_hp(M,N,sigma)
if nargin ~= 3
    eid = sprintf('Images:%s:wrongNumberOfLowPassInputs',mfilename);
    msg = 'Wrong Number of inputs for ''Gaussian High Pass'' filter.';
    error(eid,'%s',msg);
end
a = ischar(M) || ischar(N) || ischar(sigma);
if a ~= 0
    eid = sprintf('Images:%s:wrongInputType',mfilename);
    msg = 'Wrong type of Input Arguments for''Gaussian HPF';
    error(eid,'%s',msg);
end
if sigma > prod(M,N)
    eid = sprintf('Images:%s:badCutOffValue',mfilename);
    msg = 'Bad Cut of Value for''Gaussian HPF';
    error(eid,'%s',msg);
end
dist = distmatrix(M,N);
b = 1 - exp(-(dist.^2)/(2 * (sigma ^ 2)));