function [ output_args ] = Untitled( input_args )
fileName={'audio1.wav';'audio10.wav';'audio2.wav';'audio3.wav';'audio4.wav';'audio5.wav';'audio6.wav';'audio7.wav';'audio8.wav';'audio9.wav'};

for(i=1:10)
    signal=mirgetdata(miraudio(fileName(i),'Sampling',8000));
    maxAmp=max(signal);
    minAmp=min(signal);
    
    divideFactor=max(abs(maxAmp),abs(minAmp));
    [row column]=size(signal);
    
    for(j=1:row)
        signal(j)=signal(j)/divideFactor;
    end
    path='C:\Users\Minh\Documents\MATLAB\Taylan10AudioProcessing\Standardized signal';
    filename=char(strcat('S_',fileName(i)));
    audiowrite(fullfile(path,filename),signal,8000); 
end


end

