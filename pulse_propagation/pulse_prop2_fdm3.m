clear;
C=Constants_pulse;
N=64;
Ntau=100;
rho11=1/3;
rho12=0;
rho13=0;
rho14=0;
rho22=1/3;
rho23=0;
rho24=0;
rho33=1/3;
rho34=0;
t0=250e-15;
Neps=Ntau;
L=1.6e-3;
T=8*t0;
[x,y] = meshgrid(L/N*linspace(-N/2,N/2-1,N));
tau=T/Ntau*linspace(-Ntau/2,Ntau/2-1,Ntau);
dx=x(1,2)-x(1,1);
dy=y(2,1)-y(1,1);
dtau=abs(tau(2)-tau(1));
dz=C.c*dtau;
l=2;

beta2=385*(1e-15)^2*100;
L_DS=t0^2/abs(beta2);
L_DF=0.15*L_DS;
k=2*pi/C.lambda;
w0=sqrt(2*L_DF/k);
s0=w0;

r=abs((x.^2+y.^2).^0.5);
phi=atan(y./x);
rho_mat=[rho11,rho12,rho13,rho14,rho22,rho23,rho24,rho33,rho34].*ones(Neps,9);
rho11mat=rho11*ones(size(x));
rho12mat=rho12*ones(size(x));
rho13mat=rho13*ones(size(x));
rho14mat=rho14*ones(size(x));
rho22mat=rho22*ones(size(x));
rho23mat=rho23*ones(size(x));
rho24mat=rho24*ones(size(x));
rho33mat=rho33*ones(size(x));
rho34mat=rho34*ones(size(x));

g1mat=zeros(size(x));
g2mat=zeros(size(x));
chi_41=zeros(size(x));
chi_43=zeros(size(x));

for i1=1:Ntau
    rho11mat(:,:,i1)=rho11*ones(size(x));
    rho12mat(:,:,i1)=rho12*ones(size(x));
    rho13mat(:,:,i1)=rho13*ones(size(x));
    rho14mat(:,:,i1)=rho14*ones(size(x));
    rho22mat(:,:,i1)=rho22*ones(size(x));
    rho23mat(:,:,i1)=rho23*ones(size(x));
    rho24mat(:,:,i1)=rho24*ones(size(x));
    rho33mat(:,:,i1)=rho33*ones(size(x));
    rho34mat(:,:,i1)=rho34*ones(size(x));
    g1mat(:,:,i1)=C.g1*exp(-tau(i1)^2/(2*t0^2))*exp(-r.^2/(2*s0^2)).*((r/s0).^abs(l)).*exp(1i*l*phi);
    g2mat(:,:,i1)=C.g2*exp(-tau(i1)^2/(2*t0^2))*exp(-r.^2/(2*s0^2)).*((r/s0).^abs(-l)).*exp(1i*-l*phi);
    chi_41(:,:,i1)=zeros(size(x));
    chi_43(:,:,i1)=zeros(size(x));
end
g1mat(N/2+1,N/2+1,:)=0;
g2mat(N/2+1,N/2+1,:)=0;
eps=0;
pcolor(x,y,abs(g2mat(:,:,Ntau)).^2+abs(g1mat(:,:,Ntau)).^2);
colormap jet
shading interp;
axis([-L/2 L/2 -L/2 L/2])
colorbar

pause(1) 
a=2*pi/L*(-N/2:1:(N/2)-1);
kx=a.*ones(N,N,Neps);
b=transpose(a);
ky=b.*ones(N,N,Neps);
rho11mat(:,:,1)=1/3*ones(N,N);
rho12mat(:,:,1)=zeros(N,N);
rho13mat(:,:,1)=zeros(N,N);
rho14mat(:,:,1)=zeros(N,N);
rho22mat(:,:,1)=1/3*ones(N,N);
rho23mat(:,:,1)=zeros(N,N);
rho24mat(:,:,1)=zeros(N,N);
rho33mat(:,:,1)=1/3*ones(N,N);
rho34mat(:,:,1)=zeros(N,N);
smat=size(g1mat);
for epsnum=1:Neps
    for i1=2:smat(3)
        rhotemp_mat=rk4_rho_main(rho11mat(:,:,i1-1),rho12mat(:,:,i1-1),rho13mat(:,:,i1-1),rho14mat(:,:,i1-1),rho22mat(:,:,i1-1),rho23mat(:,:,i1-1),rho24mat(:,:,i1-1),rho33mat(:,:,i1-1),rho34mat(:,:,i1-1),dtau,g1mat(:,:,i1-1),g1mat(:,:,i1),g2mat(:,:,i1-1),g2mat(:,:,i1));
        rho11mat(:,:,i1)=rho11mat(:,:,i1-1)+rhotemp_mat(:,:,1);
        rho12mat(:,:,i1)=rho12mat(:,:,i1-1)+rhotemp_mat(:,:,2);
        rho13mat(:,:,i1)=rho13mat(:,:,i1-1)+rhotemp_mat(:,:,3);
        rho14mat(:,:,i1)=rho14mat(:,:,i1-1)+rhotemp_mat(:,:,4);
        rho22mat(:,:,i1)=rho22mat(:,:,i1-1)+rhotemp_mat(:,:,5);
        rho23mat(:,:,i1)=rho23mat(:,:,i1-1)+rhotemp_mat(:,:,6);
        rho24mat(:,:,i1)=rho24mat(:,:,i1-1)+rhotemp_mat(:,:,7);
        rho33mat(:,:,i1)=rho33mat(:,:,i1-1)+rhotemp_mat(:,:,8);
        rho34mat(:,:,i1)=rho34mat(:,:,i1-1)+rhotemp_mat(:,:,9);
    end
    G1mat=fftshift(fftn(g1mat));
    G2mat=fftshift(fftn(g2mat));
    g1mat_2=diff(g1mat,2,3)/(C.c*dtau)^2;
    g2mat_2=diff(g2mat,2,3)/(C.c*dtau)^2;
    g1mat_2(:,:,Ntau-1)=zeros(N,N);
    g2mat_2(:,:,Ntau-1)=zeros(N,N);
    g1mat_2=cat(3,zeros(N,N),g1mat_2);
    g2mat_2=cat(3,zeros(N,N),g2mat_2);
%     g1mat_2(:,:,Ntau)=zeros(N,N);
%     g2mat_2(:,:,Ntau)=zeros(N,N);
    g1mat=g1mat+dz*(g1mat_2)*1i/(2*k)+dz*(ifftn(fftshift(-(kx.^2+ky.^2).*G1mat*1i/(2*k)))+(1i/2)*k*(C.N*rho14mat*C.mu^2./(C.epsilon*C.hbar)));
    g2mat=g2mat+dz*(g2mat_2)*1i/(2*k)+dz*(ifftn(fftshift(-(kx.^2+ky.^2).*G2mat*1i/(2*k)))+(1i/2)*k*(C.N*rho34mat*C.mu^2./(C.epsilon*C.hbar)));
    eps=eps+dz;
    pcolor(x,y,abs(g1mat(:,:,Ntau)).^2+abs(g1mat(:,:,Ntau)).^2);
    shading interp;
    colormap jet
    axis([-L/2 L/2 -L/2 L/2])
    colorbar
    pause(0.001) 
    disp(epsnum)
end

for i=1:Ntau
    pcolor(x,y,abs(g1mat(:,:,i)).^2+abs(g2mat(:,:,i)).^2);
    shading interp;
    colormap jet
    axis([-L/2 L/2 -L/2 L/2])
    colorbar
    pause(0.0001)
    disp(i)
    exportgraphics(gcf,'testAnimated.gif','Append',true);
end