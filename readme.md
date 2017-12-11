Here are some functions you can use when coding the Revised Simplex, check them to know what they do and how to use them.

You want to be sure that your b>=0, otherwise, it will not solve it. Thus, you must instruct the computer to detect if b<0:

	isempty    
	find

(You can use this commands also to check if your objective row has negative values or not, so you can apply your optimality criterion). For objective row also check:

	sort

(this will help, you in some way, to find the position of your pivotal column).
 
You need to know the size of your matrix A:

	size


NOTE: You start with a LPP in standard form (so your constraints look like Ax <= b) but your code must be able to rearrange it into canonical form: Ax = b  (So, your code will update A and, by consequence, your vector c as well)

Remember, you need an initial feasible solution x (How does it look like?) Instruct the computer to assign these values to x. Please check what all this instruction do (give a value to n,m. They must be positive integer numbers since they represent the size of the vector or matrix):

	zeros(n,m)    
	ones(n,m)  
	eye(n)    
	x = zeros(5,1); 
	x = zeros(10,2);  What does it do?
	x = [1;2;3;4;1;3;5;6;-8];
	x(1:5)
	x(5:end)
	A = [1 4 5;-1 -3 -5; 0 1 1]
	A(1:2,3)
	A(2,:)
	A(3,end)
	A = [A eye(3)]

If you already checked that your objective row has negative entries, then you need to find your pivotal column: tp = Binv*Ap. Check this instructions:

	Define x = [1;2;3;4;1;3;5;6;-8];

	check the command: x = x<0 and  x = x>0

	min(x)
	min(A) 

