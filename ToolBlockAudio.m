%blocks audio signal into overlapping blocks
%>
%> @param x: audio signal (dimension length x 1)
%> @param iBlockLength: target block size
%> @param iHopLength: target hopsize
%> @param f_s: sample rate
%>
%> @retval x_b (dimension iNumOfBlocks x iBlockLength)
%> @retval t time stamps for blocks
% ======================================================================
function [x_b, t] = ToolBlockAudio(x, iBlockLength, iHopLength, f_s)
    
    % 预分配块的数量
    iNumBlocks = ceil((size(x, 1) - iBlockLength)/iHopLength) + 1;
    
    % 每个块开始的时间戳向量
    t = ((0:iNumBlocks-1) * iHopLength) / f_s;
    
    % 添加零以确保最后一个块完整
    iNumZerosToPad = iBlockLength + (iNumBlocks-1) * iHopLength - size(x, 1);
    xPadded = [x; zeros(iNumZerosToPad, 1)];
 
    % 预分配矩阵以保存所有块
    x_b = zeros(iNumBlocks, iBlockLength);
    
    % 使用填充信号填充矩阵
    for n = 1:iNumBlocks
        iStart = (n-1)*iHopLength + 1;
        x_b(n,:) = xPadded(iStart:iStart+iBlockLength-1);
    end
end
