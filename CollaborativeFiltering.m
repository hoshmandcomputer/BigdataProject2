clear 
clc

load inputdata

tic

SIMmatrix = zeros(10000,10000); % Similarity matrix

score = zeros(num_of_testing_row,1);

for i=1:num_of_testing_row
    uid = testing_data(i,1);
    mid = testing_data(i,2);
    rate = testing_data(i,3);
    date = testing_data(i,4);
    
    userid = id_hashtable(uid);
    
    for j=1:10000
        if j==userid
            continue
        end
        
        if SIMmatrix(userid,j) ~= 0
            sim = SIMmatrix(userid,j);
        else
            sim = cosine(matrix(userid,:),matrix(j,:));
            SIMmatrix(userid,j) = sim;
            SIMmatrix(j,userid) = sim;
        end
    end
    
    %预测结果有一些skewed，集中在1~3这个范围内，因此要将结果线性映射到1~5区间
    tmpsum = sum(SIMmatrix(userid,:));
    if tmpsum~=0
        score(i) = SIMmatrix(userid,:)*matrix(:,mid)/tmpsum;    
    else
        score(i) = 1;
    end
    
    if mod(i,100)==0
        fprintf('%d\n',i); %每隔100行输出当前运行的进度
    end
end

minscore = min(score);
maxscore = max(score);
score = round(ones(num_of_testing_row,1)+4*(score-minscore*ones(num_of_testing_row,1))/(maxscore-minscore));

RMSE = sqrt(sum((score-testing_data(:,3)).^2)/num_of_testing_row)

toc