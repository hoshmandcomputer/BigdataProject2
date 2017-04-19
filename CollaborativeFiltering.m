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
    
    %Ԥ������һЩskewed��������1~3�����Χ�ڣ����Ҫ���������ӳ�䵽1~5����
    tmpsum = sum(SIMmatrix(userid,:));
    if tmpsum~=0
        score(i) = SIMmatrix(userid,:)*matrix(:,mid)/tmpsum;    
    else
        score(i) = 1;
    end
    
    if mod(i,100)==0
        fprintf('%d\n',i); %ÿ��100�������ǰ���еĽ���
    end
end

minscore = min(score);
maxscore = max(score);
score = round(ones(num_of_testing_row,1)+4*(score-minscore*ones(num_of_testing_row,1))/(maxscore-minscore));

RMSE = sqrt(sum((score-testing_data(:,3)).^2)/num_of_testing_row)

toc