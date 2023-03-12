# Operation-Research
## Linear Programming
### [Simplex method](https://github.com/RezkyAgungArdiansyah/Operation-Research/blob/main/LPSimpleksMethod) 
The simplex method is an algorithm used to solve linear programming problems. It is a widely used optimization technique in operations research and management science.

The simplex method works by starting with an initial feasible solution to the problem, which is a set of values for the variables that satisfies all of the constraints. The algorithm then repeatedly iterates through a set of steps, called the simplex tableau, to find an optimal solution.

At each iteration, the simplex tableau is updated to improve the objective function value. The tableau is a matrix that represents the linear programming problem in standard form, with the constraints written as equations and the variables expressed as non-negative. The algorithm selects a pivot element, which is a non-zero element in the tableau, and uses row operations to transform the tableau so that the pivot element becomes 1 and all other elements in the pivot column become 0. This operation is called a pivot step.

The simplex method continues iterating through the tableau until it finds the optimal solution. The optimal solution is reached when all coefficients in the objective function are non-negative, and there are no other feasible solutions with a better objective function value.

The simplex method is an efficient algorithm for solving large-scale linear programming problems, but it can be computationally expensive for certain classes of problems. In these cases, other optimization techniques such as interior-point methods or decomposition methods may be more suitable.

#### the step to use this code is :
1. it will ask to how many the constraints do you have..
2. next it will ask you to input what is your objective function, eg. 2x1+3x2 ==> [2 3]
3. next u input your constraint, eg. 3x1+4x2 < 5 ==> [3 4 5] ==> '<'
4. now search for biggest negative number in last row of an column
5. now choose the smallest positive number on ratio
6. repeat step 4 until u get the last row don't have any negative number
7. if u want stop just type 0 and u will stop

[Big - M Method](https://github.com/RezkyAgungArdiansyah/Operation-Research/blob/main/LPBigMMethod)

The Big-M method is an algorithm used to solve linear programming problems, particularly those with constraints that are not in standard form. The method involves adding a new set of variables, called slack variables, to the problem, and then introducing an artificial variable, M, that is very large in absolute value.

The objective is to minimize the value of the artificial variable, M, subject to the original constraints and the additional constraints that enforce the slack variables to be non-negative. The method works by iteratively solving a sequence of linear programming subproblems, where each subproblem involves adding the artificial variable and using it to find an initial feasible solution.

At each iteration, the objective function is modified to include the artificial variable with a large coefficient, M, and the problem is solved using the Simplex method. If the optimal solution has a non-zero value for the artificial variable, the problem is infeasible, and M is increased until a feasible solution is found. Once a feasible solution is found, the artificial variable and its associated constraints are removed, and the problem is solved using the Simplex method again to obtain the optimal solution.

Big-M method is particularly useful for solving linear programming problems with non-standard form constraints, such as inequality and mixed constraints. However, the method can be computationally expensive if the value of M is too large, and it may not converge if the initial value of M is not chosen appropriately. As such, other optimization techniques such as interior-point methods or decomposition methods may be more suitable for certain classes of problems.

Big-M method is an alternative technique to the Simplex method for solving linear programming problems, particularly those with constraints that are not in standard form. The main advantage of the Big-M method over the Simplex method is that it can handle constraints with inequalities and mixed constraints more easily. Simplex method is more efficient for problems in standard form, the Big-M method is more flexible and versatile in handling a wider range of linear programming problems.


#### for the M - method it's same like simpleks method but the M variabel we assume that is infinity

## Integer Programming
### [Cutting Plane Method](https://github.com/RezkyAgungArdiansyah/Operation-Research/blob/main/IPCuttingPlane.m)
The cutting plane method is a mathematical optimization technique used to solve linear programming problems. It is also known as the method of feasible directions or the method of separating hyperplanes.

The method involves iteratively solving a sequence of linear programming subproblems, where each subproblem involves adding a new linear constraint to the original problem. These constraints are known as cutting planes or separating hyperplanes, and they are used to eliminate solutions that are not feasible.

The cutting plane method works by starting with an initial feasible solution and then adding cutting planes until an optimal solution is found. Each new cutting plane is generated by finding a violated constraint, which is a linear inequality that holds for all feasible solutions except for the current one. The new cutting plane is then added to the problem as a new constraint, and the process is repeated until no more violated constraints can be found.

The cutting plane method is particularly useful when the number of variables or constraints in a linear programming problem is very large, as it can help to reduce the size of the problem by eliminating infeasible solutions. It is also an important technique for solving mixed-integer linear programming problems, where some or all of the variables are constrained to be integers.

### if u have any question or something want to ask leave it on comment
