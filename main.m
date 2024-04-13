% genres = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
% baseDir = 'C:\Users\10047\Desktop\ACA-Code-master\Data';
% averageSpectralCentroids = zeros(1, length(genres)); % 存储每种流派的平均频谱质心
% 
% % 计算每种流派的频谱质心平均值
% for i = 1:length(genres)
%     audioFile = fullfile(baseDir, genres{i}, [genres{i} '00002.wav']);
%     [y, fs] = audioread(audioFile);
%     
%     % 将音频信号转换为单声道
%     y = mean(y, 2);
%     
%     % 对音频信号执行FFT
%     Y = fft(y);
%     Y = Y(1:ceil(length(Y)/2)); % 仅使用前一半的FFT结果
%     X = abs(Y); % 获取频谱幅度
% 
%     % 计算频谱质心
%     vsc = FeatureSpectralCentroid(X, fs);
% 
%     % 计算平均频谱质心值
%     averageSpectralCentroids(i) = mean(vsc);
% end
% maxCentroid = max(averageSpectralCentroids);
% % 绘制柱形图
% figure;
% b = bar(averageSpectralCentroids, 'FaceColor', 'flat');
% 
% % 自定义颜色
% colors = lines(length(genres));
% for k = 1:length(b.CData)
%     b.CData(k,:) = colors(k,:);
% end
% 
% % 设置图表的样式
% set(gca, 'FontSize', 10); % 设置字体大小
% set(gca, 'XTick', 1:length(genres), 'XTickLabel', genres); % 设置X轴的刻度标签
% xtickangle(45); % X轴标签倾斜，防止重叠
% ylabel('Average Spectral Centroid (Hz)', 'FontSize', 12); % 设置Y轴标签
% title('Average Spectral Centroid Across Music Genres', 'FontSize', 12); % 设置标题
% 
% % 设置Y轴的范围，以便更好地展示条形图
% ylim([0, maxCentroid * 1.1]); % 设置Y轴的上限为最大值的110%
% 
% % 添加网格线增强可读性
% grid on;
% set(gca, 'GridLineStyle', '--'); % 设置网格线的样式
% 
% % 在每个条形上添加文本标签
% for i = 1:length(averageSpectralCentroids)
%     text(i, averageSpectralCentroids(i), ...
%         num2str(averageSpectralCentroids(i), '%0.2f'), ...
%         'FontSize', 8, 'HorizontalAlignment', 'center', ...
%         'VerticalAlignment', 'bottom');
% end

% genres = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
% baseDir = 'C:\Users\10047\Desktop\ACA-Code-master\Data';
% averageSpectralSpreads = zeros(1, length(genres)); % 存储每种流派的平均频谱扩散
% 
% % 计算每种流派的频谱扩散平均值
% for i = 1:length(genres)
%     audioFile = fullfile(baseDir, genres{i}, [genres{i} '00002.wav']);
%     [y, fs] = audioread(audioFile);
%     
%     % 将音频信号转换为单声道
%     y = mean(y, 2);
%     
%     % 对音频信号执行FFT
%     Y = fft(y);
%     Y = Y(1:ceil(length(Y)/2)); % 仅使用前一半的FFT结果
%     X = abs(Y); % 获取频谱幅度
% 
%     % 计算频谱扩散
%     vss = FeatureSpectralSpread(X, fs);
% 
%     % 计算平均频谱扩散值
%     averageSpectralSpreads(i) = mean(vss);
% end
% 
% maxSpread = max(averageSpectralSpreads);
% 
% figure;
% b = bar(averageSpectralSpreads, 'FaceColor', 'flat');
% 
% % 自定义颜色
% colors = lines(length(genres));
% for k = 1:length(b.CData)
%     b.CData(k,:) = colors(k,:);
% end
% 
% % 设置图表的样式
% set(gca, 'FontSize', 10); % 设置字体大小
% set(gca, 'XTick', 1:length(genres), 'XTickLabel', genres); % 设置X轴的刻度标签
% xtickangle(45); % X轴标签倾斜，防止重叠
% ylabel('Average Spectral Spread (Hz)', 'FontSize', 12); % 设置Y轴标签
% title('Average Spectral Spread Across Music Genres', 'FontSize', 12); % 设置标题
% 
% % 设置Y轴的范围，以便更好地展示条形图
% ylim([0, maxSpread * 1.1]); % 设置Y轴的上限为最大值的110%
% 
% % 添加网格线增强可读性
% grid on;
% set(gca, 'GridLineStyle', '--'); % 设置网格线的样式
% 
% % 在每个条形上添加文本标签
% for i = 1:length(averageSpectralSpreads)
%     text(i, averageSpectralSpreads(i), ...
%         num2str(averageSpectralSpreads(i), '%0.2f'), ...
%         'FontSize', 8, 'HorizontalAlignment', 'center', ...
%         'VerticalAlignment', 'bottom');
% end

% genres = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
% baseDir = 'C:\Users\10047\Desktop\ACA-Code-master\Data';
% averageSpectralFlatness = zeros(1, length(genres)); % 存储每种流派的平均频谱平坦度
% 
% % 计算每种流派的频谱平坦度平均值
% for i = 1:length(genres)
%     audioFile = fullfile(baseDir, genres{i}, [genres{i} '00002.wav']);
%     [y, fs] = audioread(audioFile);
%     
%     % 将音频信号转换为单声道
%     y = mean(y, 2);
%     
%     % 对音频信号执行FFT
%     Y = fft(y);
%     Y = Y(1:ceil(length(Y)/2)); % 仅使用前一半的FFT结果
%     X = abs(Y); % 获取频谱幅度
% 
%     % 计算频谱平坦度
%     sf = FeatureSpectralFlatness(X, fs);
% 
%     % 计算平均频谱平坦度值
%     averageSpectralFlatness(i) = mean(sf);
% end
% 
% maxFlatness = max(averageSpectralFlatness);
% 
% figure;
% b = bar(averageSpectralFlatness, 'FaceColor', 'flat');
% 
% % 使用自定义的鲜艳颜色方案
% customColors = [
%     0.8500, 0.3250, 0.0980; % 更鲜艳的红色
%     0.9290, 0.6940, 0.1250; % 更鲜艳的黄色
%     0.4940, 0.1840, 0.5560; % 更鲜艳的紫色
%     0.4660, 0.6740, 0.1880; % 更鲜艳的绿色
%     0.3010, 0.7450, 0.9330; % 更鲜艳的蓝色
%     0.6350, 0.0780, 0.1840; % 更深的红色
%     0.9290, 0.8470, 0.5570; % 柔和的黄色
%     0.6690, 0.4260, 0.6780; % 柔和的紫色
%     0.4660, 0.7740, 0.1880; % 柔和的绿色
%     0.3010, 0.7450, 0.9330  % 柔和的蓝色
% ];
% 
% for k = 1:length(b.CData)
%     b.CData(k, :) = customColors(k, :);
% end
% 
% % 设置图表的样式
% set(gca, 'FontSize', 12, 'FontName', 'Helvetica'); % 增加字体大小
% set(gca, 'XTick', 1:length(genres), 'XTickLabel', genres);
% xtickangle(45); % X轴标签倾斜，防止重叠
% ylabel('Average Spectral Flatness', 'FontSize', 12, 'FontWeight', 'bold'); % 增加Y轴标签的大小和加粗
% title('Average Spectral Flatness Across Music Genres', 'FontSize', 12, 'FontWeight', 'bold'); % 增加标题的大小和加粗
% 
% % 设置Y轴的范围，以便更好地展示条形图
% ylim([0, maxFlatness * 1.1]); % 设置Y轴的上限为最大值的110%
% 
% % 添加网格线增强可读性
% grid on;
% set(gca, 'GridLineStyle', '--', 'GridColor', 'k', 'GridAlpha', 0.25); % 设置网格线的样式为更加明显
% 
% % 在每个条形上添加文本标签，增加字体大小
% for i = 1:length(averageSpectralFlatness)
%     text(i, averageSpectralFlatness(i), ...
%         num2str(averageSpectralFlatness(i), '%0.2f'), ...
%         'FontSize', 10, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', ...
%         'VerticalAlignment', 'bottom');
% end

% genres = {'blues', 'classical', 'country', 'disco', 'hiphop', 'jazz', 'metal', 'pop', 'reggae', 'rock'};
% baseDir = 'C:\Users\10047\Desktop\ACA-Code-master\Data';
% averageSpectralFlux = zeros(1, length(genres)); % 存储每种流派的平均光谱流动性
% 
% % 计算每种流派的光谱流动性平均值
% for i = 1:length(genres)
%     audioFile = fullfile(baseDir, genres{i}, [genres{i} '00002.wav']); % 假设每个流派都有一个名为genres{i}00002.wav的样本文件
%     [y, fs] = audioread(audioFile);
%     
%     % 将音频信号转换为单声道
%     y = mean(y, 2);
%     
%     % 对音频信号执行短时傅里叶变换（STFT），得到频谱
%     X = abs(spectrogram(y));
%     
%     % 调用FeatureSpectralFlux函数
%     vsf = FeatureSpectralFlux(X, fs);
%     
%     % 计算平均光谱流动性值
%     averageSpectralFlux(i) = mean(vsf);
% end
% 
% % 绘制结果
% figure;
% b = bar(averageSpectralFlux, 'FaceColor', 'flat');
% 
% % 使用自定义的鲜艳颜色方案
% customColors = [
%     0.8500, 0.3250, 0.0980; % 更鲜艳的红色
%     0.9290, 0.6940, 0.1250; % 更鲜艳的黄色
%     0.4940, 0.1840, 0.5560; % 更鲜艳的紫色
%     0.4660, 0.6740, 0.1880; % 更鲜艳的绿色
%     0.3010, 0.7450, 0.9330; % 更鲜艳的蓝色
%     0.6350, 0.0780, 0.1840; % 更深的红色
%     0.9290, 0.8470, 0.5570; % 柔和的黄色
%     0.6690, 0.4260, 0.6780; % 柔和的紫色
%     0.4660, 0.7740, 0.1880; % 柔和的绿色
%     0.3010, 0.7450, 0.9330  % 柔和的蓝色
% ];
% 
% for k = 1:length(b.CData)
%     b.CData(k, :) = customColors(k, :);
% end
% 
% % 设置图表的样式
% set(gca, 'FontSize', 12, 'FontName', 'Helvetica');
% set(gca, 'XTick', 1:length(genres), 'XTickLabel', genres);
% xtickangle(45);
% ylabel('Average Spectral Flux', 'FontSize', 12, 'FontWeight', 'bold');
% title('Average Spectral Flux Across Music Genres', 'FontSize', 12, 'FontWeight', 'bold');
% 
% ylim([0, max(averageSpectralFlux) * 1.1]); % 设置Y轴的上限
% grid on;
% set(gca, 'GridLineStyle', '--', 'GridColor', 'k', 'GridAlpha', 0.25);
% 
% % 在每个条形上添加文本标签
% for i = 1:length(averageSpectralFlux)
%     text(i, averageSpectralFlux(i), ...
%         num2str(averageSpectralFlux(i), '%0.4f'), ...
%         'FontSize', 10, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', ...
%         'VerticalAlignment', 'bottom');
% end




