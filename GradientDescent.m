clear 
clc

load inputdata



n = 10000;
k = 50; 
alpha = 0.002;
lambda = 0.01;
RegulatoryFactor = 1e4;

A = zeros(size(matrix));
A(find(matrix~=0)) = 1;

U = rand(n,k);
V = rand(n,k);

ITER_TIMES = 100;
J = zeros(ITER_TIMES,1);

RMSE = zeros(ITER_TIMES,1);

for i=1:ITER_TIMES
    %% iteration
    fprintf('current iteration times: %d\n',i);
    
    UV = U*V';
    
    UV = MatrixLinearTransform(UV,1,5);
    
    delta = A.*(matrix-UV);
    J(i) = 0.5*norm(delta,'fro')^2 + lambda*norm(U,'fro')^2 + lambda*norm(V,'fro')^2;
 
    derivative_J_U = -(delta) *V + 2*lambda*U;
    derivative_J_V = -(delta)'*U + 2*lambda*V;

    derivative_J_U = derivative_J_U/RegulatoryFactor;
    derivative_J_V = derivative_J_V/RegulatoryFactor;
    
    U = U - alpha*derivative_J_U;
    V = V - alpha*derivative_J_V;
   
    %% calcute RMSE
    s = 0;
    for j = 1:num_of_testing_row
        uid = id_hashtable(testing_data(j,1));
        mid = testing_data(j,2);
        s = s + (UV(uid,mid) - testing_data(j,3)).^2;
    end
    RMSE(i) = sqrt(s/num_of_testing_row);
    
    RMSE(i)
    
end

figure
plot(RMSE)
xlabel('# of Iteration')
ylabel('RMSE')
set(findall(gcf,'type','line'),'linewidth',3)
set(gca,'fontsize',14)
title('')


figure
plot(J)
xlabel('# of Iteration')
ylabel('Objective Function')
set(findall(gcf,'type','line'),'linewidth',3)
set(gca,'fontsize',14)
title('')
