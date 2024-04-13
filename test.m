% blockSize = 4096;  % 这是音频块的大小，你可以根据需要进行调整
% hopSize = 512;     % 这是块之间的重叠大小，同样可以根据需要调整
% [audioData, fs] = audioread('C:\Users\10047\Desktop\ACA-Code-master\Data\blues\blues00000.wav');
%       
% blocks = ToolBlockAudio(audioData, blockSize, hopSize, fs);
% features = FeatureSpectralCentroid(blocks, fs);
% [T, Bpm] = ComputeBeatHisto(audioData, fs);
% [f_0, t_0] = PitchTimeAcf(audioData, blockSize, hopSize, fs);
% cNoveltyName = 'Flux';
% [d, t, G_T, iPeaks] = ComputeNoveltyFunction(cNoveltyName, audioData, fs);
% 
% subplot(3,1,1);
% plot(Bpm, T);
% xlabel('BPM');
% ylabel('Magnitude');
% title('Beat Histogram');
% 
% subplot(3,1,2);
% plot(t_0, f_0);
% xlabel('Time (s)');
% ylabel('Frequency (Hz)');
% title('Pitch Tracking Over Time');
% 
% subplot(3,1,3);
% plot(t, d);
% hold on;
% plot(t, G_T, 'r--'); % 绘制动态阈值曲线
% xlabel('Time (s)');
% ylabel('Novelty Function Value');
% title('Novelty Function Over Time');
% legend('Novelty Function', 'Dynamic Threshold');

% genres = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
% baseDir = 'C:\Users\10047\Desktop\ACA-Code-master\Data';
% 
% figure;
% 
% % 循环遍历每种音乐流派
% for i = 1:length(genres)
%     % 构建音频文件的路径
%     audioFile = fullfile(baseDir, genres{i}, [genres{i} '00000.wav']);
%     
%     % 读取音频文件
%     [y, fs] = audioread(audioFile);
%     
%     % 如果音频信号有多个通道，则下混为单声道
%     if size(y, 2) > 1
%         y = ToolDownmix(y);
%     end
% 
%     % 归一化音频信号
%     y = ToolNormalizeAudio(y);
% 
%     % 计算时间轴
%     t = (0:length(y) - 1) / fs;
%     
%     % 选择子图位置
%     subplot(5, 2, i);
%     
%     % 绘制波形
%     plot(t, y);
%     xlabel('Time (s)');
%     ylabel('Amplitude');
%     title(genres{i});
%     
%     % 设置x轴显示范围为前31秒
%     xlim([0 31]);
% end
% 
% % 添加总标题
% sgtitle('Waveforms of Different Music Genres','FontSize', 12);


% iBlockLength = 4096;
% iHopLength = 128; % 调整为256以展示不同的重叠程度
% 
% genres = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
% baseDir = 'C:\Users\10047\Desktop\ACA-Code-master\Data';
% 
% % 创建一个新的图形窗口并设置尺寸
% figure('Position', [100, 100, 1200, 600]);
% 
% % 遍历所有音乐流派
% for i = 1:length(genres)
%     audioFile = fullfile(baseDir, genres{i}, [genres{i} '00000.wav']);
%     [y, fs] = audioread(audioFile);
%     if size(y, 2) > 1
%         y = ToolDownmix(y);
%     end
%     y = ToolNormalizeAudio(y);
% 
%     stdValue = FeatureTimeStd(y, iBlockLength, iHopLength, fs);
%     
%     subplot(5, 2, i);
%     bar(stdValue, 'FaceColor', rand(1,3)); % 为每个条形图指定随机颜色
%     xlabel('Time Frame');
%     
%   
%     ylabel('Standard Deviation');
%     title(genres{i});
%     
%     xlim([0.5 1.5]); % 保持原有的限制，以突出单个数值的条形图
%     set(gca, 'FontSize', 7); % 调整字体大小以提高可读性
%     grid on; % 添加网格线以提高可读性
% end
% % 添加总标题
% sgtitle('Standard Deviation of Audio Signals Across Music Genres', 'FontSize', 14);

% iBlockLength = 4096;
% iHopLength = 128; % 调整为256以展示不同的重叠程度
% 
% genres = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
% baseDir = 'C:\Users\10047\Desktop\ACA-Code-master\Data';
% 
% % 创建一个新的图形窗口并设置尺寸
% figure('Position', [100, 100, 1200, 600]);
% 
% % 遍历所有音乐流派
% for i = 1:length(genres)
%     audioFile = fullfile(baseDir, genres{i}, [genres{i} '00002.wav']);
%     [y, fs] = audioread(audioFile);
%     if size(y, 2) > 1
%         y = ToolDownmix(y);
%     end
%     y = ToolNormalizeAudio(y);
% 
%     % 使用FeatureTimeZeroCrossingRate计算零交叉率
%     zcrValue = FeatureTimeZeroCrossingRate(y, iBlockLength, iHopLength, fs);
%     
%     subplot(5, 2, i);
%     plot(zcrValue, 'LineWidth', 2, 'Color', rand(1,3)); % 使用plot绘制零交叉率，指定线宽和随机颜色
%     xlabel('Frame');
%     ylabel('Zero Crossing Rate');
%     title(genres{i});
%     
%     xlim([1 length(zcrValue)]); % 根据零交叉率数据点的数量调整x轴显示范围
%     set(gca, 'FontSize', 7); % 调整字体大小以提高可读性
%     grid on; % 添加网格线以提高可读性
% end

% 添加总标题
% sgtitle('Zero Crossing Rate of Audio Signals Across Music Genres', 'FontSize', 14);

% iBlockLength = 4096;
% iHopLength = 128;
% 
% genres = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
% baseDir = 'C:\Users\10047\Desktop\ACA-Code-master\Data';
% 
% % 创建一个新的图形窗口并设置尺寸
% figure('Position', [100, 100, 1200, 600]);
% 
% % 初始化一个向量存储平均RMS值
% avgRmsValues = zeros(length(genres), 1);
% 
% % 遍历所有音乐流派
% for i = 1:length(genres)
%     audioFile = fullfile(baseDir, genres{i}, [genres{i} '00002.wav']);
%     [y, fs] = audioread(audioFile);
%     if size(y, 2) > 1
%         y = ToolDownmix(y);
%     end
%     y = ToolNormalizeAudio(y);
% 
%     % 计算RMS值
%     rmsValue = FeatureTimeRms(y, iBlockLength, iHopLength, fs);
%     avgRmsValues(i) = mean(rmsValue(:)); % 计算平均RMS值，并确保它是一个标量
% end
% 
% % 选择一个好看的配色方案
% colormap = jet(length(genres));
% 
% % 画出平均RMS值的条形图
% bar(avgRmsValues, 'FaceColor', 'flat', 'CData', colormap, 'EdgeColor', 'k');
% xticks(1:length(genres));
% xticklabels(genres);
% xtickangle(45); % 倾斜标签以防重叠
% ylabel('Average RMS Value (dB)');
% title('Average RMS of Audio Signals Across Music Genres', 'FontSize', 14);
% 
% % 在条形图顶部添加数值标签
% for i = 1:length(avgRmsValues)
%     text(i, avgRmsValues(i), sprintf('%.2f dB', avgRmsValues(i)), ...
%          'HorizontalAlignment', 'center', ...
%          'VerticalAlignment', 'bottom', ...
%          'FontSize', 8);
% end
% 
% set(gca, 'FontSize', 10); % 调整字体大小以提高可读性
% grid on;

% iBlockLength = 4096;
% iHopLength = 128; % 为展示不同的重叠程度调整为256
% 
% genres = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
% baseDir = 'C:\Users\10047\Desktop\ACA-Code-master\Data';
% 
% % 创建一个新的图形窗口并设置尺寸
% figure('Position', [100, 100, 1200, 600]);
% 
% % 为了计算频谱特征，需要定义一个窗函数
% afWindow = hann(iBlockLength, 'periodic');
% 
% % 遍历所有音乐流派
% for i = 1:length(genres)
%     audioFile = fullfile(baseDir, genres{i}, [genres{i} '00002.wav']);
%     [y, fs] = audioread(audioFile);
%     
%     % 调用ComputeFeature来计算特征
%     % 例如，这里计算每个流派的'TimeZeroCrossingRate'特征
%     [featureValue, ~] = ComputeFeature('TimeZeroCrossingRate', y, fs, afWindow, iBlockLength, iHopLength);
%     
%     subplot(5, 2, i);
%     plot(featureValue, 'LineWidth', 2, 'Color', rand(1,3)); % 使用plot绘制特征值
%     xlabel('Frame');
%     ylabel('Feature Value');
%     title(genres{i});
%     
%     xlim([1 length(featureValue)]);
%     set(gca, 'FontSize', 7); % 调整字体大小以提高可读性
%     grid on; % 添加网格线以提高可读性
% end
% % 添加总标题
% sgtitle('Feature Values of Audio Signals Across Music Genres', 'FontSize', 14);

% iBlockLength = 1024;
% iHopLength = 256; % 调整为256以展示不同的重叠程度
% 
% genres = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
% baseDir = 'C:\Users\10047\Desktop\ACA-Code-master\Data';
% 
% % 创建一个新的图形窗口并设置尺寸
% figure('Position', [100, 100, 1200, 600]);
% 
% % 为了计算频谱特征，需要定义一个窗函数
% afWindow = hann(iBlockLength, 'periodic');
% 
% % 遍历所有音乐流派
% for i = 1:length(genres)
%     audioFile = fullfile(baseDir, genres{i}, [genres{i} '00002.wav']);
%     [y, fs] = audioread(audioFile);
%     
%     % 调用ComputeSpectrogram来计算频谱图
%     [X, f, t] = ComputeSpectrogram(y, fs, afWindow, iBlockLength, iHopLength);
%     
%     % 检查频谱图的大小
%     disp(['Size of X for ', genres{i}, ': ', num2str(size(X))]);
%     
%     % 将频谱图转换为分贝单位
%     XdB = 10*log10(abs(X) + eps); % 避免对0取对数
%     
%     % 在指定的subplot中绘制频谱图
%     subplot(5, 2, i);
%     imagesc(t, f, XdB); % 展示频谱图
%     axis xy; % 翻转y轴，使频率从低到高排列
%     xlabel('Time (s)');
%     ylabel('Frequency (Hz)');
%     title(genres{i});
%     colorbar; % 显示色标
%     set(gca, 'FontSize', 7); % 调整字体大小以提高可读性
% end
% sgtitle('Spectrogram of Audio Signals Across Music Genres', 'FontSize', 14);


% genres = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
% baseDir = 'C:\Users\10047\Desktop\ACA-Code-master\Data';
% iNumMelBands = 128;
% % 创建一个新的图形窗口并设置尺寸
% figure('Position', [100, 100, 1200, 600]);
% 
% % 为了计算梅尔频谱特征，需要定义一个窗函数
% afWindow = hann(iBlockLength, 'periodic');
% 
% % 遍历所有音乐流派
% for i = 1:length(genres)
%     audioFile = fullfile(baseDir, genres{i}, [genres{i} '00002.wav']);
%     [y, fs] = audioread(audioFile);
%     
%     % 调用ComputeMelSpectrogram来计算梅尔频谱图
%     [M, f_c, t] = ComputeMelSpectrogram(y, fs, true, afWindow, iBlockLength, iHopLength, iNumMelBands, fs/2);
%     
%     % 检查梅尔频谱图的大小
%     disp(['Size of M for ', genres{i}, ': ', num2str(size(M))]);
%     
%     % 将梅尔频谱图转换为分贝单位
%     MdB = M; % ComputeMelSpectrogram函数已经将幅度转换为了分贝
%     
%     % 在指定的subplot中绘制梅尔频谱图
%     subplot(5, 2, i);
%     imagesc(t, f_c, MdB); % 展示梅尔频谱图
%     axis xy; % 翻转y轴，使频率从低到高排列
%     xlabel('Time (s)');
%     ylabel('Frequency (Mel)');
%     title(genres{i});
%     colorbar; % 显示色标
%     set(gca, 'FontSize', 7); % 调整字体大小以提高可读性
% end
% sgtitle('Mel Spectrogram of Audio Signals Across Music Genres', 'FontSize', 14);


% genres = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
% baseDir = 'C:\Users\10047\Desktop\ACA-Code-master\Data';
% 
% % 设置窗函数和块参数
% iBlockLength = 2048;
% iHopLength = 128;
% afWindow = hann(iBlockLength, 'periodic');
% 
% % 初始化图形窗口，并设置大小
% figure('Position', [100, 100, 1200, 900]);
% 
% % 遍历所有流派
% for i = 1:length(genres)
%     % 构建文件路径
%     audioFile = fullfile(baseDir, genres{i}, [genres{i} '00002.wav']);  % 假设每个流派都有一个命名为 genres{i}00002.wav 的文件
%     
%     % 读取音频文件
%     [x, f_s] = audioread(audioFile);
%     
%     % 设置新颖性函数的名称，这里以“Flux”为例
%     cNoveltyName = 'Flux';
%     
%     % 调用 ComputeNoveltyFunction 函数
%     [d, t, G_T, iPeaks] = ComputeNoveltyFunction(cNoveltyName, x, f_s, afWindow, iBlockLength, iHopLength);
%     
%     % 在subplot中绘制新颖性函数
%     subplot(5, 2, i);  % 调整这里为五行两列的子图
%     plot(t, d, 'LineWidth', 1); hold on;
%     plot(t, G_T, 'r--', 'LineWidth', 1); % 绘制阈值，使用虚线
%     scatter(t(iPeaks), d(iPeaks), 15, 'MarkerEdgeColor', 'k', 'MarkerFaceColor', [0 .7 .7], 'LineWidth', 1.5); % 标记峰值，调整大小和颜色
%     title([genres{i} ' Novelty Function'], 'FontSize', 10);
%     xlabel('Time (s)', 'FontSize', 9);
%     ylabel('Novelty', 'FontSize', 9);
%     xlim([t(1) t(end)]);
%     grid on; % 添加网格
%     hold off;
% end
% 
% % 设置总标题
% sgtitle('Novelty Functions Across Different Music Genres', 'FontSize', 14);


% 定义音乐流派和基础目录
% genres = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
% baseDir = 'C:\Users\10047\Desktop\ACA-Code-master\Data';
% 
% % 定义颜色方案，每种音乐流派对应一种颜色
% colors = lines(length(genres)); % 'lines'是Matlab提供的一种颜色映射
% 
% % 初始化图形窗口，并设置大小
% figure('Position', [100, 100, 1200, 900]);
% 
% % 循环遍历每个流派
% for i = 1:length(genres)
%     % 构建音频文件路径
%     audioFile = fullfile(baseDir, genres{i}, [genres{i} '00002.wav']);
%     
%     % 读取音频文件
%     [x, f_s] = audioread(audioFile);
%     
%     % 设置FFT窗口和参数
%     iBlockLength = 4096;
%     iHopLength = 256;
%     afWindow = hann(iBlockLength, 'periodic');
%     
%     % 计算音高
%     [f, t] = ComputePitch('TimeAuditory', x, f_s, afWindow, iBlockLength, iHopLength);
%     
%     % 画图
%     subplot(5, 2, i);
%     plot(t, f, 'LineWidth', 2, 'Color', colors(i,:)); % 使用预定义颜色和增加线宽
%     title([genres{i}], 'FontSize', 12);
%     xlabel('Time (s)', 'FontSize', 10);
%     ylabel('Frequency (Hz)', 'FontSize', 10);
%     xlim([t(1) t(end)]);
%     grid on; % 添加网格
% end
% 
% % 设置总标题
% sgtitle('Pitch Analysis Across Different Music Genres', 'FontSize', 16);


% genres = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
% baseDir = 'C:\Users\10047\Desktop\ACA-Code-master\Data';
% colors = lines(length(genres));  % 生成与流派数相同的颜色
% 
% % 创建一个新的图形窗口
% figure;
% 
% % 定义显示的 Y 轴标签
% chordLabelsFull = {'C Maj','C# Maj','D Maj','D# Maj','E Maj','F Maj',...
%                    'F# Maj','G Maj','G# Maj','A Maj','A# Maj','B Maj', ...
%                    'c min','c# min','d min','d# min','e min','f min',...
%                    'f# min','g min','g# min','a min','a# min','b min'};
% 
% % 计算 Y 轴标签的间隔
% nLabels = 6; % 假设我们想在 Y 轴上显示 6 个标签
% stepSize = floor(length(chordLabelsFull) / nLabels); % 计算步长
% yTicks = 1:stepSize:length(chordLabelsFull); % 计算间隔位置
% chordLabels = chordLabelsFull(yTicks); % 获取对应位置的标签
% 
% % 设置每个流派的音频文件
% for i = 1:length(genres)
%     genre = genres{i};
%     filePath = fullfile(baseDir, genre, [genre '00027.wav']);  % 假设每个流派的目录中有一个名为 genre00001.wav 的文件
% 
%     % 检查文件是否存在
%     if ~isfile(filePath)
%         warning('File does not exist: %s', filePath);
%         continue;
%     end
% 
%     % 读取音频文件
%     [x, fs] = audioread(filePath);
% 
%     % 调用 ComputeChords 函数处理音频数据
%     [~, iChordIdx, t, ~] = ComputeChords(x, fs);
% 
%     % 绘制和弦索引图
%     subplot(5, 2, i); % 定义一个 5 行 2 列的子图
%     plot(t, iChordIdx(2,:) + 1, 'o-', 'Color', colors(i,:),'MarkerSize', 4);  % 使用不同的颜色
%     xlabel('Time (s)');
%     ylabel('Chord Index');
%     title([genre ' - Chord Sequence']);
%     set(gca, 'YTick', yTicks, 'YTickLabel', chordLabels, 'FontSize', 8);  % 减少 Y 轴标签数量并调整字体大小
%     grid on;
% end
% 
% % 设置整个图形的标题
% sgtitle('Most Likely Chord Sequences Across Genres');










