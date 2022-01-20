function metric = printResult(X, label, K, kmeansFlag)

if kmeansFlag == 1
    indic = litekmeans(X, K, 'Replicates', 20);
else
    [~, indic] = max(X, [] ,2);
end
metric = CalcMeasures(label, indic);
fprintf('ac: %0.4f\tnmi: %0.4f\t \tpur:%0.4f', metric(1)*100, metric(2)*100,metric(3)*100);