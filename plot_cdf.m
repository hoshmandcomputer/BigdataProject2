%����Ѿ�������collaborativefiltering.m�����ǾͲ���Ҫ������仰������ȡ���������load��ע��
%load collaborativefiltering


cnt_rate_per_movie = sum(matrix~=0,1);
cnt_rate_per_user = sum(matrix~=0,2);

figure(1)
cdfplot(cnt_rate_per_user);
hold on
cdfplot(cnt_rate_per_movie);
set(findall(gcf,'type','line'),'linewidth',3)
set(gca,'fontsize',14)
xlabel('# of rate')
ylabel('CDF')
title('')

legend('User','Movie')