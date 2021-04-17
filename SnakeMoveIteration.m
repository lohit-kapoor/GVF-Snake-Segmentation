function P=SnakeMoveIteration(B,P,Fext,gamma,kappa,delta)

% Clamp contour to boundary
P(:,1)=min(max(P(:,1),1),size(Fext,1));
P(:,2)=min(max(P(:,2),1),size(Fext,2));

% Get image force on the contour points
Fext1(:,1)=kappa*interp2(Fext(:,:,1),P(:,2),P(:,1));
Fext1(:,2)=kappa*interp2(Fext(:,:,2),P(:,2),P(:,1));
% Interp2, can give nan's if contour close to border
Fext1(isnan(Fext1))=0;

% Calculate the baloonforce on the contour points
N=GetContourNormals(P);
Fext2=delta*N;

% Update contour positions
ssx = gamma*P(:,1) + Fext1(:,1) + Fext2(:,1);
ssy = gamma*P(:,2) + Fext1(:,2) + Fext2(:,2);
P(:,1) = B * ssx;
P(:,2) = B * ssy;

% Clamp contour to boundary
P(:,1)=min(max(P(:,1),1),size(Fext,1));
P(:,2)=min(max(P(:,2),1),size(Fext,2));

    
