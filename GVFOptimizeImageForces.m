function Fext=GVFOptimizeImageForces(Fext, Mu, Iterations, Sigma)

% Squared magnitude of force field
Fx= Fext(:,:,1);
Fy= Fext(:,:,2);

% Calculate magnitude
sMag = Fx.^2+ Fy.^2;

% Set new vector-field to initial field
u=Fx;  v=Fy;
  
% Iteratively perform the Gradient Vector Flow (GVF)
for i=1:Iterations,
  % Calculate Laplacian
  Uxx=ImageDerivatives2D(u,Sigma,'xx');
  Uyy=ImageDerivatives2D(u,Sigma,'yy');
  
  Vxx=ImageDerivatives2D(v,Sigma,'xx');
  Vyy=ImageDerivatives2D(v,Sigma,'yy');

  % Update the vector field
  u = u + Mu*(Uxx+Uyy) - sMag.*(u-Fx);
  v = v + Mu*(Vxx+Vyy) - sMag.*(v-Fy);
end

Fext(:,:,1) = u;
Fext(:,:,2) = v;
