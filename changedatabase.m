clear
clc
%load('./database/bbcsport4vbigRnSp.mat');
%load('./database/100Leaves.mat');
%load('./database/ORL.mat');
%load('./database/mfeatRnSp.mat');
%load('./database/WebKB.mat');
%load('./database/orlRnSp.mat');
load('./database/caltech7.mat');
%load('./database/buaaRnSp.mat');
%load('./database/Mfeat.mat');
%load('./database/3sources.mat');
f = 1;
X = data; % complete data
folds = miss50;
ind_folds = folds{f};
truthF = truth;
numClust = length(unique(truthF));
num_view = length(X);

for iv = 1:num_view
    X1 = X{iv}';
    ind_0 = find(ind_folds(:,iv) == 0);
    index{iv} = find(ind_folds(:,iv) == 1);
    X1(ind_0,:) = NaN;         % incomplete data  
    Y{iv} = X1';              % incomplete data           
    truelabel{iv} = truth';
end
data = Y;

clearvars -except data truelabel index

save('fixed_data/50missing/caltech7.mat');


