function I=imgaussian(I,sigma,siz)

if(~exist('siz','var')), siz=sigma*6; end

if(sigma>0)
    % Make 1D Gaussian kernel
    x=-ceil(siz/2):ceil(siz/2);
    H = exp(-(x.^2/(2*sigma^2)));
    H = H/sum(H(:));

    % Filter each dimension with the 1D Gaussian kernels\
    if(ndims(I)==1)
        I=imfilter(I,H, 'same' ,'replicate');
    elseif(ndims(I)==2)
        Hx=reshape(H,[length(H) 1]);
        Hy=reshape(H,[1 length(H)]);
        I=imfilter(imfilter(I,Hx, 'same' ,'replicate'),Hy, 'same' ,'replicate');
        else
        error('imgaussian:input','unsupported input dimension');
    end
end