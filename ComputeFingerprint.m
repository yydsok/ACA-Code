% ======================================================================
%> @brief computes a fingerprint audio data (only the subfingerprint, one
%fingerprint is comprised of 256 consecutive subfingerprint.
%>
%> @param afAudioData: time domain sample data, dimension channels X samples
%> @param f_s: sample rate of audio data
%>
%> @retval F series of subfingerprints
%> @retval tf time stamp for the subfingerprints
% ======================================================================
function [SubFingerprint, tf] = ComputeFingerprint (afAudioData, f_s)

    % set default parameters
    target_fs = 5000;
    iBlockLength = 2048;
    iHopLength = 64;
  
    % pre-processing: down-mixing
    afAudioData = ToolDownmix(afAudioData);

    % pre-processing: normalization (not really necessary here but shouldn't hurt)
    afAudioData = ToolNormalizeAudio(afAudioData);

    % pre-processing: downsampling to target sample rate
    if (f_s ~= target_fs)
        afAudioData = resample(afAudioData,target_fs,f_s);
    end

    % initialization: generate transformation matrix for 33 frequency bands
    H = genBands(iBlockLength, target_fs);
    
    % initialization: generate FFT window
    afWindow    = hann(iBlockLength,'periodic');
    if (length(afWindow) ~= iBlockLength)
        error('window length mismatch');
    end                        

    % in the real world, we would do this block by block...
    [X,f,tf]     = spectrogram(  afAudioData,...
                                afWindow,...
                                iBlockLength-iHopLength,...
                                iBlockLength,...
                                f_s);

    % power spectrum
    X           = abs(X)*2/iBlockLength;
    X([1 end],:)= X([1 end],:)/sqrt(2); %let's be pedantic about normalization
    X = abs(X).^2;
    
    % group spectral bins in bands
    E = H*X;
    
    % extract fingerprint through diff (both time and freq)
    SubFingerprint = diff(diff(E,1,1),1,2);
    tf = tf(1:end-1) + iHopLength/2*target_fs;

    % quantize fingerprint
    SubFingerprint(SubFingerprint<0) = 0;
    SubFingerprint(SubFingerprint>0) = 1;
end

function [H] = genBands(iFFTLength, fs)

    % constants
    iNumBands = 33;
    f_max = 2000;
    f_min = 300;
    
    % initialize
    f_band_bounds = f_min*exp(log(f_max/f_min)*(0:iNumBands)/iNumBands);
    f_fft = linspace(0, fs/2, iFFTLength/2+1);
    H = zeros(iNumBands, iFFTLength/2+1);
    idx = zeros(length(f_band_bounds),2);

    % get indices falling into each band
    for k = 1:length(f_band_bounds)-1
        idx(k,1) = find(f_fft > f_band_bounds(k), 1, 'first' );
        idx(k,2) = find(f_fft < f_band_bounds(k+1), 1, 'last' );
        H(k,idx(k,1):idx(k,2)) = 1;
    end
end