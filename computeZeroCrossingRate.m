function zcr = computeZeroCrossingRate(audioData)
    % 计算每个样本与其前一个样本的符号是否不同
    sign_changes = diff(sign(audioData));
    % 符号改变的次数就是零交叉的次数
    zero_crossings = sum(abs(sign_changes) == 2);
    % 零交叉率是零交叉次数除以总样本数
    zcr = zero_crossings / length(audioData);
end

