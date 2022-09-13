classdef Constants
    properties( Constant = true )
        gamma=38.11e6;
        gam41=1/3*38.11e6;
        gam42=1/3*38.11e6;
        gam43=1/3*38.11e6;
        tau41=0.5*38.11e6;
        tau42=0.5*38.11e6;
        tau43=0.5*38.11e6;
        deltap=0*38.11e6;
        beta0=0.01*38.11e6;
        gamc=1e-7*38.11e6;
        g2=0.01*38.11e6;
        g1=0.01*38.11e6;
        theta=0;
        beta_l=0.01*cos(pi/14)*38.11e6;
        beta_t=0.01*sin(pi/14)/sqrt(2)*38.11e6;
        N=2e17;
        
        epsilon=8.854e-12;
        hbar=6.626e-34/(2*pi);
        lambda=780.032e-9;
        mu=(1/sqrt(6))*3.584e-29;
    end
end