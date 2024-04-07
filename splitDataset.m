function [trainSet, testSet, trainLabels, testLabels] = splitDataset(featureMatrix, labels)
    % 获取样本总数
    nSamples = size(featureMatrix, 1);
    
    % 确保索引不会超出数组边界
    cv = cvpartition(nSamples, 'HoldOut', 0.3); % 保留30%的数据作为测试集
    
    % 生成逻辑索引
    idxTrain = training(cv); % 训练集索引
    idxTest = test(cv); % 测试集索引
    
    trainSet = featureMatrix(idxTrain, :);
    testSet = featureMatrix(idxTest, :);
    [trainSet, mu, sigma] = zscore(trainSet); % 对训练集标准化

    testSet = bsxfun(@minus, testSet, mu);
    testSet = bsxfun(@rdivide, testSet, sigma);
    trainLabels = labels(idxTrain, :);
    testLabels = labels(idxTest, :);
end
