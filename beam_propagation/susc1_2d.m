clear;
phi=linspace(0,2*pi,1000);
sigma=zeros(15,length(phi));
N=2e17;
gamma=38.11e6;
epsilon=8.854e-12;
hbar=6.626e-34/(2*pi);
lambda=780.032e-9;
mu=(1/sqrt(6))*3.584e-29;
C=Constants;
[X,Y] = meshgrid(-8:.1:8);
Z=zeros(size(Y));
l=2;
for i=1:length(X)
    for j=1:length(Y)
        phi=atan(Y(i,j)/X(i,j));        
        k=steady_state(C.g1*exp(1i*l*phi),C.g2*exp(-1i*l*phi));
        susc1=(N*k(13)*(mu^2))./(gamma*epsilon*hbar*C.g1*exp(1i*l*phi));
        Z(i,j)=imag(susc1);
    end
end
figure;
pcolor(X,Y,Z);
shading interp;
colormap hot