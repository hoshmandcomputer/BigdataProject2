%如果已经运行了collaborativefiltering.m程序，那就不需要下面这句话，否则取消下面这句load的注释
%load collaborativefiltering
tic
rate = zeros(10000,5); % 10000个用户评1-5分的个数
for i = 1:10000
    s=0;
    for j = 1:5
        rate(i,5-j+1)=length(find(matrix(i,:)==j)); % 第一列至第五列依次存5/4/3/2/1的评分数量，这是为了画图方便
        s = s+rate(i,5-j+1);
    end
    rate(i,:) = rate(i,:)./s; % 转换成百分比
end

bar(100*sortrows(rate(:,:),1),1,'stacked')
legend('Rate 5','Rate 4','Rate 3','Rate 2','Rate 1')
xlabel('Users')
ylabel('Percentage (%)')
set(gca,'fontsize',14)

toc