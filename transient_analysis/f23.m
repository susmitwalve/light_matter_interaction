function y=f23(rho11,rho12,rho13,rho14,rho22,rho23,rho24,rho33,rho34,g1,g2)
C=Constants_pulse;
y=1i*C.beta_l*rho23-1i*C.beta_t*rho13-1i*C.beta_t*(rho33-rho22)-1i*g2.*rho24-2*C.gamc*rho23;
end