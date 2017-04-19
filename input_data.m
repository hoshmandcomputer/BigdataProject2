clear 
clc

fprintf('Loading data...\n')
tic

user_id = load('users.txt');

id_hashtable = zeros(max(user_id),1);

for i=1:10000
    id_hashtable(user_id(i))=i;
end

training_data = load('netflix_train.txt');
num_of_training_row = size(training_data,1);

testing_data = load('netflix_test.txt');
num_of_testing_row = size(testing_data,1);

matrix = zeros(10000,10000); % row: user, column: movie

for i = 1:num_of_training_row
    uid = training_data(i,1);  %user id
    mid = training_data(i,2);  %movie id
    rate = training_data(i,3); %rating
    date = training_data(i,4); %date
    matrix(id_hashtable(uid),mid) = rate;
end

toc
fprintf('Finish loading!\n')

save inputdata