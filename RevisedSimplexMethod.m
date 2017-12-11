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

function RevisedSimplexMethod(A, b, c)

[m n] = size(A);

% Initial Setup
z = 0;
A = [A eye(m)];
c = [c zeros(1, m)];
Binv = eye(m);
xB = Binv*b;
cB = zeros(m, 1);
ObjRow = [1 cB' * Binv]*[-c; A];
[value p] = min(ObjRow);

while value < 0
    tp = Binv*A(:,p);
    thetaratios = xB./tp; % ./ element by element
    q = find(thetaratios > 0, 1);
    cB(q) = c(p);
    
    Eta = -tp/tp(q);
    Eta(q) = 1/tp(q);
    
    E = eye(m);
    E(:, q) = Eta;
    Binv = E * Binv;
    
    M = [1 (cB' * Binv); zeros(m, 1) Binv] * [0; b];
    z = M(1);
    xB = M(2:n);
    
    ObjRow = [1 cB' * Binv]*[-c; A];
    [value p] = min(ObjRow);
    
end
