N = 99;
[LPAnalysis, HPAnalysis, LPSynthsis, HPSynthesis] = firpr2chfb(N, 0.45);
fvt = fvtool(LPAnalysis,1, HPAnalysis,1, LPSynthsis,1, HPSynthesis,1);
fvt.Color = [1,1,1];
legend(fvt,'Hlp Lowpass Decimator','Hhp Highpass Decimator',...
    'Glp Lowpass Interpolator','Ghp Highpass Interpolator');
% Analysis section
analysisFilter = dsp.SubbandAnalysisFilter(LPAnalysis, HPAnalysis);
% Synthesis section
synthFilter = dsp.SubbandSynthesisFilter(LPSynthsis, HPSynthesis);
x = zeros(50,1);
x(1:3)   = 1;
x(8:10)  = 2;
x(16:18) = 3;
x(24:26) = 4;
x(32:34) = 3;
x(40:42) = 2;
x(48:50) = 1;
sigsource = dsp.SignalSource('SignalEndAction', 'Cyclic repetition',...
    'SamplesPerFrame', 50);
sigsource.Signal = x;

% Scope to compare input signal with reconstructed output
sigcompare = dsp.ArrayPlot('NumInputPorts', 2, 'ShowLegend', true,...
    'Title', 'Input and reconstructed signals',...
    'ChannelNames',{'Input signal','Reconstructed signal'});

% Scope to plot the RMS error between the input and reconstructed signals
errorPlot = timescope('Title', 'RMS Error', 'SampleRate', 1, ...
    'TimeUnits', 'seconds', 'YLimits', [-0.5 2],...
    'TimeSpanSource', 'property','TimeSpan',100,...
    'TimeSpanOverrunAction','scroll');

% To calculate the transfer function of the cascade of Analysis and
% Synthesis subband filters
tfestimate = dsp.TransferFunctionEstimator('FrequencyRange','centered',...
    'SpectralAverages', 50);
% Scope to plot the magnitude response of the estimated transfer function
magplot = dsp.ArrayPlot('PlotType','Line', ...
    'YLabel', 'Magnitude Response (dB)',...
    'Title','Magnitude response of the estimated transfer function',...
    'XOffset',-25, 'XLabel','Frequency (Hz)',...
    'YLimits',[-5 5]);
% Scope to plot the phase response of the estimated transfer function
phaseplot = dsp.ArrayPlot('PlotType','Line', ...
    'YLabel', 'Phase Response (degrees)',...
    'Title','Phase response of the estimated transfer function',...
    'XOffset',-25, 'XLabel','Frequency (Hz)',...
    'YLimits',[-180 180]);

for i = 1:100
    % Use the same signal as input in each iteration.
    input = sigsource();
    % Analysis
    [hi, lo] = analysisFilter(input);
    % Synthesis
    reconstructed = synthFilter(hi, lo);

    % Compensate for the delay caused by the filters and compare the
    % signals. Since input signal is periodic, compare the current
    % frames of input and output signals.
    sigcompare(input(2:end), reconstructed(1:end-1));

    % Plot error between signals
    err = rms(input(2:end) - reconstructed(1:end-1));
    errorPlot(err);

    % Estimate transfer function of cascade
    Txy = tfestimate(input(2:end), reconstructed(1:end-1));
    magplot(20*log10(abs(Txy)));
    phaseplot(angle(Txy)*180/pi);
end
