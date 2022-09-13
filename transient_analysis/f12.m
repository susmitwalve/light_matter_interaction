function y=f12(rho11,rho12,rho13,rho14,rho22,rho23,rho24,rho33,rho34,g1,g2)
C=Constants_pulse;
y=1i*C.beta_l*rho12-1i*C.beta_t*(rho22-rho11)+1i*C.beta_t*rho13+1i*conj(g1).*conj(rho24)-2*C.gamc*rho12;
end