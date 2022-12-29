
%read the original  file and convert it to a variable
[x, f] =audioread('sound.wav');

%chosing a block size 
windowSize = 8192;

%changing compression  percentages
samplesHalf = windowSize / 2;
samplesQuarter = windowSize / 4;
samplesEighth = windowSize / 8;

%initializing compressed matrices
xCompressed2 = [];
xCompressed4 = [];
xCompressed8 = [];

%actual compression processing
for i=1:windowSize:length(x)-windowSize
    windowDCT = dct(x(i:i+windowSize-1));
    xCompressed2(i:i+windowSize-1) = idct(windowDCT(1:samplesHalf), windowSize);
    xCompressed4(i:i+windowSize-1) = idct(windowDCT(1:samplesQuarter), windowSize);
    xCompressed8(i:i+windowSize-1) = idct(windowDCT(1:samplesEighth), windowSize);
end

%plotting signals
figure(1)
h1 = subplot(2,1,1);
plot(x), title('Original ');
subplot(2,1,2)
plot(xCompressed2), title('Compression Factor 2'), axis(axis(h1));
pause(2);
figure(2)
h2 = subplot(2,1,1);
plot(xCompressed4), title('Compression Factor 4'), axis(axis(h2));
subplot(2,1,2)
plot(xCompressed8), title('Compression Factor 8'), axis(axis(h2));

%saving audio files
audiowrite('Compressed_file_factor_2.wav',xCompressed2,f);
audiowrite('Compressed_file factor_4.flac',xCompressed4,f);
audiowrite('Compressed_file factor_8.oga',xCompressed8,f);

