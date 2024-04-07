function ExampleGenreClassification(cDatasetPath)
    if nargin < 1
        % 替换为您的数据集路径
        cDatasetPath = 'C:\Users\10047\Desktop\ACA-Code-master\Data'; 
    end
    
    if ~exist('ComputeFeature', 'file')
        error('Please add the ACA scripts to your path!');
    end
    
    genres = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
    iNumGenres = numel(genres);
    
    featureMatrix = [];
    labels = [];
    
    for iGenre = 1:iNumGenres
    genre = genres{iGenre};
    files = dir(fullfile(cDatasetPath, genre, '*.wav'));
    for iFile = 1:numel(files)
        filePath = fullfile(cDatasetPath, genre, files(iFile).name);
        features = ExtractFeaturesFromFile(filePath); % 确保这返回一个矩阵，每行是一个特征向量
        if ~isempty(features)
            featureMatrix = [featureMatrix; features]; % 添加所有特征向量
            labels = [labels; repmat(iGenre, size(features, 1), 1)]; % 为每个特征向量添加标签
        else
            warning('跳过无法读取的文件：%s', filePath);
        end
    end
end

    
    % 划分数据集为训练集和测试集
    disp(['featureMatrix size: ', num2str(size(featureMatrix, 1))]);
    disp(['labels size: ', num2str(length(labels))]);
    [trainSet, testSet, trainLabels, testLabels] = splitDataset(featureMatrix, labels);
  
    % 训练分类器
    model = fitcecoc(trainSet, trainLabels);
    
    % 预测测试集
    predictions = predict(model, testSet);
    
    accuracy = sum(predictions == testLabels) / numel(testLabels);
    disp(['Accuracy: ', num2str(accuracy)]);
    
    % 显示混淆矩阵
    confusionMatrix = confusionmat(testLabels, predictions);
    disp('Confusion Matrix:');
    disp(confusionMatrix);
end

function features = ExtractFeaturesFromFile(filePath)
    fprintf('正在读取文件：%s\n', filePath); % 增加日志输出以监控哪些文件被读取
    try
        [audioData, fs] = audioread(filePath);
        features = extractFeaturesMFCC(audioData, fs);
    catch ME
        warning('无法读取文件：%s，原因：%s', filePath, ME.message);
        features = []; % 如果读取或特征提取失败，返回空数组
    end
end

