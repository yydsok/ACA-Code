function features = extractFeaturesMFCC(audioData, fs)
    % 计算MFCC特征
 coefficients = mfcc(audioData, fs, 'NumCoeffs', 20);
    % 将平均值作为特征返回
    features = mean(coefficients, 1);
end
