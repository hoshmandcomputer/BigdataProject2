%如果已经运行了collaborativefiltering.m程序，那就不需要下面这句话，否则取消下面这句load的注释
%load collaborativefiltering

rate = zeros(5,1);
for i = 1:5
    rate(i)=length(find(training_data(:,3)==i));
end

bar(rate)
xlabel('User rating')
ylabel('Count')

set(gca,'fontsize',14)