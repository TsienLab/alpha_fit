function [beta,t,alphafun]=alpha_fit(data,SF)%SF is sampling frequency
opts = statset('nlinfit');
opts.RobustWgtFun = 'bisquare';
t=(1:length(data))*(1/SF);
alphafun=@(b,t)b(1)*(exp(-t/b(2))-exp(-t/b(3)));
beta0=[-10;1;10];%guess for starting point of optimization
beta=nlinfit(t,data,alphafun,beta0,opts);
figure;
plot((1:length(data))*(1/SF),data,'b');hold on;
plot((1:length(data))*(1/SF),alphafun(beta,t),'r');
legend('original data','alpha function fit');







end