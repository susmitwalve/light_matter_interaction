clear;
C=Constants;
l=2;
phi=linspace(0,2*pi,1000);
rho11=(C.beta_t/C.beta_l)^2;
rho33=rho11;
rho22=1-2*rho11;
rho44=0;
rho21=C.beta_l*C.beta_t*(rho22-rho11)/(C.beta_l^2-C.beta_t^2);
rho31=-C.beta_t^2*(rho22-rho11)/(C.beta_l^2-C.beta_t^2);
rho32=-C.beta_l*C.beta_t*(rho22-rho11)/(C.beta_l^2-C.beta_t^2);
N1=(-(C.tau42+1i*C.deltap)*(rho44-rho11)/C.beta_t)-1i*rho21-(C.beta_t*(rho44-rho11+rho31)/(C.tau43+1i*(C.deltap+C.beta_l)));
D=((-(C.tau42+1i*C.deltap)*(C.tau41+1i*(C.deltap-C.beta_l)))/(1i*C.beta_t))+(1i*C.beta_t)+(1i*C.beta_t*(C.tau41+1i*(C.deltap-C.beta_l))/(C.tau43+1i*(C.deltap+C.beta_l)));
N2=((C.tau42+1i*C.deltap)/C.beta_t)*rho31+C.beta_t*(rho31+rho44-rho33)/(C.tau43+1i*(C.deltap+C.beta_l))-1i*rho32;

susc41=((C.N*(C.mu^2))/(C.epsilon*C.hbar))*(conj(N1/D)+conj(N2/D)*exp(-2*1i*l*phi));
plot(phi,imag(susc41))
hold on
plot(phi,real(susc41))
% axis([0 2*pi -5e-5 20e-5])