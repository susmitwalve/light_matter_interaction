function y=f22(rho11,rho12,rho13,rho14,rho22,rho23,rho24,rho33,rho34,g1,g2)
C=Constants_pulse;
y=C.gam42*(1-rho11-rho22-rho33)-1i*C.beta_t*(rho12-conj(rho12))-1i*C.beta_t*(conj(rho23)-rho23)+C.gamc*rho11-2*C.gamc*rho22+C.gamc*rho33;
end