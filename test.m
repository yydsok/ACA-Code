blockSize = 4096;  % 这是音频块的大小，你可以根据需要进行调整
hopSize = 512;     % 这是块之间的重叠大小，同样可以根据需要调整
[audioData, fs] = audioread('C:\Users\10047\Desktop\ACA-Code-master\Data\blues\blues00000.wav');
      
blocks = ToolBlockAudio(audioData, blockSize, hopSize, fs);
features = FeatureSpectralCentroid(blocks, fs);
[T, Bpm] = ComputeBeatHisto(audioData, fs);
[f_0, t_0] = PitchTimeAcf(audioData, blockSize, hopSize, fs);
cNoveltyName = 'Flux';
[d, t, G_T, iPeaks] = ComputeNoveltyFunction(cNoveltyName, audioData, fs);

subplot(3,1,1);
plot(Bpm, T);
xlabel('BPM');
ylabel('Magnitude');
title('Beat Histogram');

subplot(3,1,2);
plot(t_0, f_0);
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('Pitch Tracking Over Time');

subplot(3,1,3);
plot(t, d);
hold on;
plot(t, G_T, 'r--'); % 绘制动态阈值曲线
xlabel('Time (s)');
ylabel('Novelty Function Value');
title('Novelty Function Over Time');
legend('Novelty Function', 'Dynamic Threshold');



