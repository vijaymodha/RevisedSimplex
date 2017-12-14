% RevisedSimplexMethod solves Linear Programming Problems (LPP) in canonical 
% form of LPP in standard form:
% 
% Max  $$ z = \mathbf{c}^T*\mathbf{x} $$
% 
% subject to
% 
% $$ \mathbf{A*x} \leq \mathbf{b} $$
% 
% $$ \mathbf{x} \geq \mathbf{0} $$
% 
% INPUT: A, b, and c

%A = [4 3 -1; 2 3 3];
%b = [6; 4];
%c = [2 1 3];

%A=[2, -1, 3; 1, 3, 5; 2, 0, 1];
%b=[6; 10; 7];
%c=[2, 1, 3];

%A = [1, -1, -1, 0; -2, 5, -3, -3; 2, -5, 0, 1];
%b = [2; 10; 5];
%c = [2, 3, 1, 1];


function [z, x] = RevisedSimplexMethod%(A, b, c)
A = [4 3 -1; 2 3 3];
b = [6; 4];
c = [2 1 3];


tol=1e-15;
[m,n] = size(A);

% Initial Setup
z = 0;
A = [A eye(m)];
c = [c zeros(1, m)];
Binv = eye(m);
xB = Binv*b;
x = [zeros(1, n), xB'];
cB = zeros(m, 1);
ObjRow = [1 cB' * Binv]*[-c; A];
[value,p] = min(ObjRow);

while value < -tol    
    % Step 2
    tp = Binv*A(:,p);
    Idx = find(tp>0);
    
    thetaratios = xB(Idx)./tp(Idx); % ./ element by element %INF APPEARS HERE    
   
    [~,q1] = min(thetaratios);
    q = Idx(q1);
    
    if (isempty(q))
        error('NO FINITE OPTIMAL SOLUTIONS')
    end
        
    % Step 3
    cB(q) = c(p);
    
    % Step 4
    Eta = -tp/tp(q);
    Eta(q) = 1/tp(q);
    
    E = eye(m);
    E(:, q) = Eta;
    Binv = E * Binv;
    
    M = [1 (cB' * Binv); zeros(m, 1) Binv] * [0; b];
    z = M(1);
    xB = M(2:end);
    
    x(p) = xB(q);
    
    % Step 1
     cB' * Binv
    ObjRow = [1 cB' * Binv]*[-c; A];
    [value,p] = min(ObjRow);
end
%x = x(1:n);