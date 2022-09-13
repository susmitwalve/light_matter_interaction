function res=steady_state(g1,g2)
C=Constants;

gam41=C.gam41;
gam42=C.gam42;
gam43=C.gam43;
tau41=C.tau41;
tau42=C.tau42;
tau43=C.tau43;
deltap=C.deltap;
beta0=C.beta0;
gamc=C.gamc;
theta=C.theta;
beta_l=C.beta_l;
beta_t=C.beta_t;

% Matrix is like
% 
% [   ....    ....        ....    ] [rho11]           [c1]
% |   ....    ....        ....    | |rho12]           [c2]
% |   ....    ....        ....    | |rho13]           [c3]
% |   ....    ....        ....    | |rho14]           [  ]
% |   ....    ....        ....    | |rho21]           [  ]
% |   ....    ....        ....    | |rho22]           [  ]
% |   ....    ....        ....    | |rho23]           [  ]
% |   ....    ....        ....    | |rho24]           [  ]
% |   ....    ....        ....    | |rho31]       =   [  ]  
% |   ....    ....        ....    | |rho32]           [  ]
% |   ....    ....        ....    | |rho33]           [  ]
% |   ....    ....        ....    | |rho34]           [  ]
% |   ....    ....        ....    | |rho41]           [  ]
% |   ....    ....        ....    | |rho42]           [  ]
% |   ....    ....        ....    | |rho43]           [  ]

rho_mat=zeros(15,15);
rho_mat(1,1)=-gam41-2*gamc;
rho_mat(1,6)=-gam41+gamc;
rho_mat(1,11)=-gam41+gamc;
rho_mat(1,5)=-1i*beta_t;
rho_mat(1,2)=1i*beta_t;
rho_mat(1,13)=1i*conj(g1);
rho_mat(1,4)=-1i*g1;

rho_mat(2,2)=1i*beta_l-2*gamc;
rho_mat(2,6)=-1i*beta_t;
rho_mat(2,1)=1i*beta_t;
rho_mat(2,3)=1i*beta_t;
rho_mat(2,14)=1i*conj(g1);

rho_mat(3,3)=2*1i*beta_l-2*gamc;
rho_mat(3,7)=-1i*beta_t;
rho_mat(3,2)=1i*beta_t;
rho_mat(3,15)=1i*conj(g1);
rho_mat(3,4)=-1i*g2;

rho_mat(4,4)=-1i*(deltap-beta_l)-tau41;
rho_mat(4,8)=-1i*beta_t;
rho_mat(4,1)=-2*1i*conj(g1);
rho_mat(4,6)=-1i*conj(g1);
rho_mat(4,11)=-1i*conj(g1);
rho_mat(4,3)=-1i*conj(g2);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rho_mat(5,5)=1i*beta_l-2*gamc;
rho_mat(5,6)=-1i*beta_t;
rho_mat(5,1)=1i*beta_t;
rho_mat(5,9)=1i*beta_t;
rho_mat(5,8)=1i*conj(g1);

rho_mat(5,:)=conj(rho_mat(5,:));
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
rho_mat(6,1)=-gam42+gamc;
rho_mat(6,6)=-gam42-2*gamc;
rho_mat(6,11)=-gam42+gamc;
rho_mat(6,2)=-1i*beta_t;
rho_mat(6,5)=1i*beta_t;
rho_mat(6,10)=-1i*beta_t;
rho_mat(6,7)=1i*beta_t;

rho_mat(7,7)=1i*beta_l-2*gamc;
rho_mat(7,3)=-1i*beta_t;
rho_mat(7,11)=-1i*beta_t;
rho_mat(7,6)=1i*beta_t;
rho_mat(7,8)=-1i*g2;
%%%
rho_mat(8,8)=-1i*deltap-tau42;
rho_mat(8,4)=-1i*beta_t;
rho_mat(8,12)=-1i*beta_t;
rho_mat(8,5)=-1i*conj(g1);
rho_mat(8,7)=-1i*conj(g2);
%%%%%%%%%%%
rho_mat(9,9)=2*1i*beta_l-2*gamc;
rho_mat(9,10)=-1i*beta_t;
rho_mat(9,5)=1i*beta_t;
rho_mat(9,12)=1i*conj(g1);
rho_mat(9,13)=-1i*g2;

rho_mat(9,:)=conj(rho_mat(9,:));


rho_mat(10,10)=1i*beta_l-2*gamc;
rho_mat(10,9)=-1i*beta_t;
rho_mat(10,11)=-1i*beta_t;
rho_mat(10,6)=1i*beta_t;
rho_mat(10,14)=-1i*g2;

rho_mat(10,:)=conj(rho_mat(10,:));
%%%%%%%%%%%
rho_mat(11,1)=-gam43+gamc;
rho_mat(11,6)=-gam43+gamc;
rho_mat(11,11)=-gam43-2*gamc;
rho_mat(11,7)=-1i*beta_t;
rho_mat(11,10)=1i*beta_t;
rho_mat(11,15)=1i*conj(g2);
rho_mat(11,12)=-1i*g2;

rho_mat(12,12)=-1i*(deltap+beta_l)-tau43;
rho_mat(12,8)=-1i*beta_t;
rho_mat(12,9)=-1i*conj(g1);
rho_mat(12,1)=-1i*conj(g2);
rho_mat(12,6)=-1i*conj(g2);
rho_mat(12,11)=-2*1i*conj(g2);

%%%%%%%%%%%
rho_mat(13,13)=-1i*(deltap-beta_l)-tau41;
rho_mat(13,14)=-1i*beta_t;
rho_mat(13,1)=-2*1i*conj(g1);
rho_mat(13,6)=-1i*conj(g1);
rho_mat(13,11)=-1i*conj(g1);
rho_mat(13,9)=-1i*conj(g2);

rho_mat(13,:)=conj(rho_mat(13,:));


rho_mat(14,14)=-1i*deltap-tau42;
rho_mat(14,13)=-1i*beta_t;
rho_mat(14,15)=-1i*beta_t;
rho_mat(14,2)=-1i*conj(g1);
rho_mat(14,10)=-1i*conj(g2);

rho_mat(14,:)=conj(rho_mat(14,:));


rho_mat(15,15)=-1i*(deltap+beta_l)-tau43;
rho_mat(15,14)=-1i*beta_t;
rho_mat(15,3)=-1i*conj(g1);
rho_mat(15,1)=-1i*conj(g2);
rho_mat(15,6)=-1i*conj(g2);
rho_mat(15,11)=-2*1i*conj(g2);

rho_mat(15,:)=conj(rho_mat(15,:));
%%%%%%%%%%%
% disp(rho_mat)
%(rho_mat)*rho+c=0
c=zeros(15,1);
c(1)=gam41;
c(4)=1i*conj(g1);
c(13)=conj(1i*conj(g1));
c(6)=gam42;
c(11)=gam43;
c(12)=1i*conj(g2);
c(15)=conj(1i*conj(g2));


res=-inv(rho_mat)*c;
% disp(res)
% writematrix(res,'rho.txt')
end