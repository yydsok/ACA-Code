function features = ExtractFeaturesFromFile(filePath)
    [audioData, fs] = audioread(filePath);
    audioData = ToolNormalizeAudio(audioData(:,1));

    % 特征参数
    frameSize = round(0.03 * fs);
    hopSize = round(0.015 * fs);

    % MFCC 特征
    [mfccs, deltas, deltaDeltas] = ToolMfccFb(audioData, fs, frameSize, hopSize);

    % 增加GammaTone频率滤波器特征
    gammatoneCoeffs = ToolGammatoneFb(audioData, fs, frameSize, hopSize);

    % 计算增强的MFCC特征
    enhancedMFCC = [mean(mfccs, 1), mean(deltas, 1), mean(deltaDeltas, 1)];

    % 使用Bark和Mel频率转换
    barkBands = ToolFreq2Bark(fs);
    melBands = ToolFreq2Mel(fs);

    % Spectral Rolloff 和 Zero Crossing Rate
    sRolloff = FeatureSpectralRolloff(audioData, fs, frameSize, hopSize);
    zcr = FeatureTimeZeroCrossingRate(audioData, fs, frameSize, hopSize);

    % 光谱质心
    spectralCentroid = FeatureSpectralCentroid(audioData, fs, frameSize, hopSize);

    % 光谱通量
    spectralFlux = FeatureSpectralFlux(audioData, fs, frameSize, hopSize);

    % RMS特征
    rms = FeatureTimeRms(audioData, fs, frameSize, hopSize);

    % 音高色度
    pitchChroma = FeatureSpectralPitchChroma(audioData, fs, frameSize, hopSize);

    % 特征标准化
    normSRolloff = ToolResample(sRolloff);
    normZCR = ToolResample(zcr);
    normSpectralCentroid = ToolResample(spectralCentroid);
    normSpectralFlux = ToolResample(spectralFlux);
    normRMS = ToolResample(rms);
    normPitchChroma = ToolResample(pitchChroma);

    % 合并所有特征
    features = [enhancedMFCC, barkBands, melBands, normSRolloff, normZCR, ...
                normSpectralCentroid, normSpectralFlux, normRMS, normPitchChroma];
            
   [coeff, score, latent] = pca(features);

    % 选择解释了大部分变异的主成分
    explainedVariance = cumsum(latent)./sum(latent);
    numComponents = find(explainedVariance >= 0.95, 1); % 保留95%的方差

    % 将特征降维到numComponents个主成分
    reducedFeatures = score(:,1:numComponents);
    % 如果需要的话，也可以返回PCA模型参数和解释的方差
    varargout{1} = coeff;
    varargout{2} = explainedVariance;    
  
end
