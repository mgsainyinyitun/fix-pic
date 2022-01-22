function result = CalcMeasures(Y, predY)
% result = [AC, nmi_value, f_score, error_cnt, ARI];
if size(Y,2) ~= 1
    Y = Y';
end;
if size(predY,2) ~= 1
    predY = predY';
end;

PredLabel = predY;
predLidx = unique(predY); pred_classnum = length(predLidx);
% bestMap
predY = bestMap(Y, predY);
if size(Y)~=size(predY)
    predY=predY';
end
if size(Y)~=size(PredLabel)
    PredLabel=PredLabel';
end

error_cnt = sum(Y ~= predY);
AC = length(find(Y == predY))/length(Y);
[~,nmi_value,~] = compute_nmi(Y', PredLabel');
f_score = compute_f(Y', predY');
[ARI,~,~,~] = valid_RandIndex(Y', PredLabel');

correnum = 0;
for ci = 1:pred_classnum
    incluster = Y(find(predY == predLidx(ci)));
%     cnub = unique(incluster);
%     inclunub = 0;
%     for cnubi = 1:length(cnub)
%         inclunub(cnubi) = length(find(incluster == cnub(cnubi)));
%     end;
    inclunub = hist(incluster, 1:max(incluster)); if isempty(inclunub) inclunub=0;end;
    correnum = correnum + max(inclunub);
end;
Purity = correnum/length(predY);



result = [AC, nmi_value, Purity, error_cnt, ARI];
