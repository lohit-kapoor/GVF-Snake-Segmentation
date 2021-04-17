function Eextern = ExternalForceImage(I,Wline, Wedge, Wterm,Sigma)

Ix=ImageDerivatives(I,Sigma,'x');
Iy=ImageDerivatives(I,Sigma,'y');
Ixx=ImageDerivatives(I,Sigma,'xx');
Ixy=ImageDerivatives(I,Sigma,'xy');
Iyy=ImageDerivatives(I,Sigma,'yy');


Eline = imgaussian(I,Sigma);
Eterm = (Iyy.*Ix.^2 -2*Ixy.*Ix.*Iy + Ixx.*Iy.^2)./((1+Ix.^2 + Iy.^2).^(3/2));
Eedge = sqrt(Ix.^2 + Iy.^2); 

Eextern= (Wline*Eline - Wedge*Eedge -Wterm * Eterm); 

