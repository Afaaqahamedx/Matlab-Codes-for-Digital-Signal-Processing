BW = "1 octave";  % Bandwidth
N  = 8;           % Filter order
F0 = 1000;        % Center frequency (Hz)
Fs = 48000;       % Sampling frequency (Hz)
of = octaveFilter(FilterOrder=N,CenterFrequency=F0,  ...
                  Bandwidth=BW,SampleRate=Fs);
Nx = 100000;
scope1 = spectrumAnalyzer(SampleRate=Fs,Method="filter-bank", ...
    AveragingMethod="exponential",PlotAsTwoSidedSpectrum=false, ...
    FrequencyScale="log",FrequencySpan="start-and-stop-frequencies", ...
    StartFrequency=1,StopFrequency=Fs/2,YLimits=[-60 10], ...
    RBWSource="property",RBW=1);
tic
while toc < 20
    % Run for 20 seconds
    x1 = randn(Nx,1);
    y1 = of(x1);
    scope1(y1)
end
ofb = octaveFilterBank("1/3 octave",Fs,FilterOrder=N);
freqz(ofb,NFFT=2^16)   % Increase FFT length for better low-frequency resolution
set(gca,XScale="log")
axis([20 Fs/2 -50 5])
title("1/3-Octave Filter Bank Magnitude Response")

pinkNoise = dsp.ColoredNoise(Color="pink", ...
                             SamplesPerFrame=Nx, ...
                             NumChannels=1);

scope2 = spectrumAnalyzer(SampleRate=Fs,Method="filter-bank", ...
    AveragingMethod="exponential",PlotAsTwoSidedSpectrum=false, ...
    FrequencyScale="log",FrequencySpan="start-and-stop-frequencies", ...
    StartFrequency=20,StopFrequency=Fs/2,YLimits=[-40 30], ...
    RBWSource="property",RBW=10);

centerOct = getCenterFrequencies(ofb);
nbOct = numel(centerOct);
bandPower = zeros(1,nbOct);
nbSamples = 0;

tic
while toc < 10
    xp = pinkNoise();
    yp = ofb(xp);
    bandPower = bandPower + sum(yp.^2,1);
    nbSamples = nbSamples + Nx;
    scope2(yp)    
end
b = 10^(3/10); % base-10 octave ratio
% Compute power (including pressure reference)
octPower = 10*log10(bandPower/nbSamples/4e-10);

bar(log(centerOct)/log(b),octPower);
set(gca,Xticklabel=round(b.^get(gca,"Xtick"),2,"significant"));
title("1/3-Octave Power Spectrum")
xlabel("Octave Frequency Band (Hz)")
ylabel("Power (dB)")

spl = splMeter(Bandwidth="1/3 octave", ...
               OctaveFilterOrder=N, ...
               SampleRate=Fs, ...
               FrequencyWeighting="z-weighting");

scope3 = dsp.ArrayPlot(Title="Pink Noise SPL", ...
                       XLabel="Octave Frequency Band Number", ...
                       YLabel="Power (dB)",YLimits=[0 100]);
tic
while toc < 10
    xp = pinkNoise();
    yp = spl(xp);
    ypm = mean(yp,1).';
    scope3(ypm)
end