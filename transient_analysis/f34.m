function y=f34(rho11,rho12,rho13,rho14,rho22,rho23,rho24,rho33,rho34,g1,g2)
C=Constants_pulse;
y=-1i*(C.deltap+C.beta_l)*rho34-1i*C.beta_t*rho24+1i*conj(g2).*(1-rho11-rho22-2*rho33)-1i*conj(g1).*conj(rho13)-C.tau43*rho34;
end