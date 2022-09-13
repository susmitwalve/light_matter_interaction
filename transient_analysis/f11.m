function y=f11(rho11,rho12,rho13,rho14,rho22,rho23,rho24,rho33,rho34,g1,g2)
C=Constants_pulse;
y=C.gam41*(1-rho11-rho22-rho33)-1i*C.beta_t*conj(rho12)+1i*C.beta_t*rho12+1i*conj(g1).*conj(rho14)-1i*g1.*rho14-2*C.gamc*rho11+C.gamc*rho22+C.gamc*rho33;
end