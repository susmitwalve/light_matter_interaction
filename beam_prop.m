clear;
C=Constants;
z=0;
L=0.12e-3;
Z=0.5e-3;
N=100;
g00=C.g1;
wp=20e-6;
lambda=C.lambda;
z0=pi*wp^2/lambda;
m=0;
[x,y] = meshgrid(L/N*linspace(-N/2,N/2-1,N));
k=2*pi/lambda;
phi=atan(y./x);
phi(isnan(phi))=0;
r=sqrt(x.^2+y.^2);
% z=1e-2;
wz=wp*sqrt(1+(z/z0)^2);
Rz=z+(z0^2/z);
% l=2;
% 
% g=g00*(wp/wz)*((r.*sqrt(2)/wz).^abs(l)).*exp(1i*l*phi).*exp(-r.^2/(wz^2)).*exp(1i*k*r.^2/(2*Rz)).*exp(-1i*(2*m+l+1)*atan(z/z0));
% pcolor(x,y,abs(g)+abs(g));
% shading interp;

l=2;
g1=g00*((r.*sqrt(2)/wz).^abs(l)).*exp(1i*l*phi).*exp(-r.^2/(wz^2)).*exp(1i*k*r.^2/(2*Rz));
l=-2;
g2=g00*((r.*sqrt(2)/wz).^abs(l)).*exp(1i*l*phi).*exp(-r.^2/(wz^2)).*exp(1i*k*r.^2/(2*Rz));
ini_I=sum(sum(abs(g1).^2+abs(g2).^2));
Nz=100;
a=2*pi/L*(-N/2:1:(N/2)-1);
kx=a.*ones(N);
b=transpose(a);
ky=b.*ones(N);
dz=Z/Nz;
susc_mat41=zeros(N);
susc_mat43=zeros(N);
rho_mat33=zeros(N);
figure;
pcolor(x,y,abs(g1).^2+abs(g2).^2);
colorbar
tempmax=max(max(abs(g1).^2+abs(g2).^2));
clim([0,tempmax]);
shading interp;
colormap hot
pause(0.02)
for jz=1:Nz
    disp(jz)
    for j1=1:N
        for j2=1:N
            sigma=steady_state(g1(j1,j2),g2(j1,j2));
            rho_mat33(j1,j2)=sigma(11);
            susc_mat41(j1,j2)=susc_fx(sigma(13),g1(j1,j2));
            susc_mat43(j1,j2)=susc_fx(sigma(15),g2(j1,j2));
        end
    end
%     susc_mat41=zeros(N);
%     susc_mat43=zeros(N);
    susc_mat43(51,51)=(susc_mat43(50,51)+susc_mat43(52,51)+susc_mat43(51,50)+susc_mat43(51,52))/4;
    susc_mat41(51,51)=(susc_mat41(50,51)+susc_mat41(52,51)+susc_mat41(51,50)+susc_mat41(51,52))/4;
    g1=ssfm(kx,ky,dz,k,susc_mat41,g1);
    g2=ssfm(kx,ky,dz,k,susc_mat43,g2);
    pcolor(x,y,abs(g1).^2+abs(g2).^2);
    colorbar
    clim([0,tempmax]);
    shading interp;
    colormap hot
    pause(0.02)
end
% pcolor(x,y,abs(g1).^2+abs(g2).^2);
% shading interp;
% colormap turbo
fin_I=sum(sum(abs(g1).^2+abs(g2).^2));
pass=(fin_I/ini_I)*100;
disp(pass)