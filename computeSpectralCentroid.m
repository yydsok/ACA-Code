function spectralCentroid = computeSpectralCentroid(audioData, fs)
    % 计算信号的FFT的一半
    audioData = audioData(:,1); % 确保audioData是单声道
    X = fft(audioData);
    X = abs(X(1:floor(end/2)+1)); % 只取FFT的前半部分
    
    % 生成对应的频率向量
    n = length(X);
    f = (0:n-1)*(fs/length(audioData)/2);
    
    % 计算频谱质心
    numerator = sum(X .* f');
    denominator = sum(X);
    
    % 防止分母为0
    if denominator == 0
        spectralCentroid = 0;
    else
        spectralCentroid = numerator / denominator;
    end
end
