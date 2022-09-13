function y=f13(rho11,rho12,rho13,rho14,rho22,rho23,rho24,rho33,rho34,g1,g2)
C=Constants_pulse;
y=2*1i*C.beta_l*rho13-1i*C.beta_t*(rho23-rho12)+1i*conj(g1).*conj(rho34)-1i*g2.*rho14-2*C.gamc*rho13;
end