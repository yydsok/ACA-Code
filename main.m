blockSize = 4096;  % 这是音频块的大小，你可以根据需要进行调整
hopSize = 512;     % 这是块之间的重叠大小，同样可以根据需要调整
[audioData, fs] = audioread('C:\Users\10047\Desktop\ACA-Code-master\Data\blues\blues00000.wav');

spectralCentroid = ComputeFeature('SpectralCentroid', audioData, fs);
T = (0:hopSize:length(audioData)-blockSize) / fs;
T = T(1:size(spectralCentroid, 2)); 
hold on;
subplot(311)
plot(T, spectralCentroid);
xlabel('Time (s)');
ylabel('Spectral Centroid (Hz)');
title('Spectral Centroid over Time');

[S, F, T] = ComputeSpectrogram(audioData, fs);
subplot(312)
imagesc(T, F, log(S)); 
axis xy; 
xlabel('Time (s)'); 
ylabel('Frequency (Hz)');

beatHistogram = ComputeBeatHisto(audioData, fs);
subplot(313)
bar(beatHistogram); 
xlabel('BPM');
ylabel('Amplitude');


novelty = NoveltyFlux(audioData, fs);
pitch = PitchSpectralAcf(audioData, fs);
disp(novelty)
disp(pitch)

% ExampleGenreClassification();
