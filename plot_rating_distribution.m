%����Ѿ�������collaborativefiltering.m�����ǾͲ���Ҫ������仰������ȡ���������load��ע��
%load collaborativefiltering
tic
rate = zeros(10000,5); % 10000���û���1-5�ֵĸ���
for i = 1:10000
    s=0;
    for j = 1:5
        rate(i,5-j+1)=length(find(matrix(i,:)==j)); % ��һ�������������δ�5/4/3/2/1����������������Ϊ�˻�ͼ����
        s = s+rate(i,5-j+1);
    end
    rate(i,:) = rate(i,:)./s; % ת���ɰٷֱ�
end

bar(100*sortrows(rate(:,:),1),1,'stacked')
legend('Rate 5','Rate 4','Rate 3','Rate 2','Rate 1')
xlabel('Users')
ylabel('Percentage (%)')
set(gca,'fontsize',14)

toc