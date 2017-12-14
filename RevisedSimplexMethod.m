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

function [z, xB, xB_idx] = RevisedSimplexMethod(A, b, c)

tol=1e-15;
[m,n] = size(A);

% Initial Setup
z = 0;
A = [A eye(m)];
c = [c zeros(1, m)];
Binv = eye(m);
xB = Binv*b;
xB_idx = n+1:n+m;
cB = zeros(m, 1);
ObjRow = [1 cB' * Binv]*[-c; A];
[value,p] = min(ObjRow);

while value < -tol    
    % Step 2
    tp = Binv*A(:,p);
    Idx = find(tp>0);
    
    thetaratios = xB(Idx)./tp(Idx); % ./ element by element
   
    [~,q1] = min(thetaratios);
    q = Idx(q1);
    
    if (isempty(q))
        error('NO FINITE OPTIMAL SOLUTIONS')
    end
        
    % Step 3
    cB(q) = c(p);
    xB_idx(q) = p;
    
    % Step 4
    Eta = -tp/tp(q);
    Eta(q) = 1/tp(q);
    
    E = eye(m);
    E(:, q) = Eta;
    Binv = E * Binv;
    
    M = [1 (cB' * Binv); zeros(m, 1) Binv] * [0; b];
    z = M(1);
    xB = M(2:end);
    
    % Step 1
    ObjRow = [1 cB' * Binv]*[-c; A];
    [value,p] = min(ObjRow);
end
