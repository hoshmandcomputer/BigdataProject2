%����Ѿ�������collaborativefiltering.m�����ǾͲ���Ҫ������仰������ȡ���������load��ע��
%load collaborativefiltering

rate = zeros(5,1);
for i = 1:5
    rate(i)=length(find(training_data(:,3)==i));
end

bar(rate)
xlabel('User rating')
ylabel('Count')

set(gca,'fontsize',14)