function y=f33(rho11,rho12,rho13,rho14,rho22,rho23,rho24,rho33,rho34,g1,g2)
C=Constants_pulse;
y=C.gam43*(1-rho11-rho22-rho33)-1i*C.beta_t*(rho23-conj(rho23))+1i*conj(g2).*conj(rho34)-1i*g2.*rho34+C.gamc*rho11+C.gamc*rho22-2*C.gamc*rho33;
end