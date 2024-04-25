% 
% syms th1 th1d th2 th2d g m1 l1 m2 l2
% 
% L   = (m1*l1^2*th1d^2 + ...
%      m2*(l1^2*th1d^2 + l2^2*th2d^2 + 2*l1*l2*th1d*th2d*cos(th1 - th2)))/2 + ...
%     (m1 + m2)*g*l1*cos(th1) + m2*g*l2*cos(th2);
% X   = {th1 th1d th2 th2d};
% Q_i = {0 0}; Q_e = {0 0};
% R   = 0;
% par = {g m1 l1 m2 l2};
% VF  = EulerLagrange(L,X,Q_i,Q_e,R,par,'m','s');

syms g m1 m2 l1 l2 I1 I2 x y th1 th2 
q = [x,y,th1,th2];
f = [x+l1/2*cos(th1), y+l1/2*sin(th1), x + l1*cos(th1) + l2/2*cos(th1+th2), y+l1*sin(th1) + l2/2*sin(th1+th2), th1, th1+th2];
dfdq = [1 0 -l1/2*sin(th1) 0;
        0 1 l1/2*cos(th1) 0;
        1 0 -l1*sin(th1)-l2/2*sin(th1+th2) -l2/2*sin(th1+th2);
        0 1 l1*cos(th1)+l2/2*cos(th1+th2) l2/2*cos(th1+th2);
        0 0 1 0
        0 0 1 1];
Mq = [m1 0 m2 0 0 0;
      0 m1 0 m2 0 0;
       ]
%print(VF(1))

% syms g m1 m2 I1 I2 l1 l2 x y dx dy th1 th2 dth1 dth2 tau
% L = 0.5*m1*((- l1/2*dth1*sin(th1))^2 + (l1/2*dth1*cos(th1))^2) + ...
%     0.5*m2*((l1*dth1*sin(th1) - l2/2*dth2*sin(th1+th2))^2 + ...
%     (l1*dth1*cos(th1) + l2/2*dth2*cos(th1+th2))^2) + 0.5*(I1*dth1^2 + I2*dth2^2) - ...
%     g*(m1*(l1/2*sin(th1)) + m2*(l1*sin(th1) + l2/2*sin(th1 + th2)));
% 
% X = {th1 dth1 th2 dth2};
% Q_i = {0 0};Q_e = {0 0};
% R = 0;
% par = {g m1 m2 I1 I2 l1 l2};
% VF = EulerLagrange(L,X,Q_i,Q_e,R,par);