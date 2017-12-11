function RevisedSimplexMethod

%% RevisedSimplexMethod
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
% 
% Notice that in order to know who is the entering and departing variable
% we must instruct the computer which element we mean, for that reason we
% must know their position and how to indicate it. THe first step then is
% to know the index of the slack variables, for that you need to know how
% many variables you have and how many slack variables you need to add.
% 
% Go to the command window of Matlab and type: 
% A = [1 2 3; 4 5 6; 7 8 9]
% 
% b = [1;2;5;7;-5]
% 
% b(1:3)
% 
% Idx = find(b<0)
% 
% A(:,2)
% 
% A(3,:)
% 
% [m,n] = size(A)
% Id = eye(3)
% 
% We will need $$ B^{-1} $$. Who is $$ B^{-1} $$ at the start? Which size
% it it? (You will need the "eye" command here)
% 
% We need to indicate the vector $$ c_B $$. Who is it at the start?
% 
% What is the initial value of z? Who is the initial x? Who is xB? Define
% them.
% 
% * STEP1 Determine entering variable: 
% Here you must compute the objective
% row and apply the optimality criterion, this means, that you must check
% if there are negative entries in your objective row. Define as $$ p $$ to
% index of the most negative entry in the objective row (remember that
% several of them could be given, thus instruct the computer to take the
% first one).
% 
% * STEP2 Determine departing variable
% You will need here the pivotal column $$ t_p $$ and the vector of basic
% variable $$ x_B $$.
% Define the pivotal column: Who is it in terms of $$ B^{-1} $$ and $$ A
% $$?. Compute the theta-ratios: $$ Minimum{x_{jB}/t_{jp} : t_{jp}>0} $$.
% Define by $$ q $$ to the index of element in $$ x_B $$ such that $$
% x_{qB}/t_{qp} $$ is the minimum theta-ratio
% 
% 
% * STEP3 Update value of $$ c_B $$
% Update the q-entry of vector $$ c_B $$ with the p-entry of vector $$ c
% $$.
% 
% * STEP4 Define the eta-vector:
% $$ \eta = -t_p/t_{qp} $$. We still need to fix one entry, since the q-th
% entry of eta must be $$ 1/t_{pq} $$.
% 
% * STEP5 Update $$ B^{-1} $$ by $$ B^{-1} = E*B^{-1} $$
% Define Matrix E as the identity matrix (be careful to use the correct
% size for the matrix E). Update the value of the matrix E by changing the
% q-th column of E with the eta-vector.
% Update $$ B^{-1} = E*B^{-1} $$. 
% 
% * STEP6 Update the values of z and x using the matrix $$ M^{-1} $$.
% 
% 
% If ObjRow >= 0, STOP. or even if the min value of the objective row >= 0
% Use display to write line
