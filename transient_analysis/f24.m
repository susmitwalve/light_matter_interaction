function y=f24(rho11,rho12,rho13,rho14,rho22,rho23,rho24,rho33,rho34,g1,g2)
C=Constants_pulse;
y=-1i*C.deltap*rho24-1i*C.beta_t*(rho14+rho34)-1i*conj(g1).*conj(rho12)-C.tau42*rho24-1i*conj(g2).*rho23;
end