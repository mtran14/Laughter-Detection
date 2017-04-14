function [ output_args ] = Untitled3( input_args )
signalName={'S_audio1.wav.mfcc.csv';'S_audio2.wav.mfcc.csv';'S_audio3.wav.mfcc.csv';'S_audio4.wav.mfcc.csv';'S_audio5.wav.mfcc.csv';'S_audio6.wav.mfcc.csv';'S_audio7.wav.mfcc.csv';'S_audio8.wav.mfcc.csv';'S_audio9.wav.mfcc.csv';'S_audio10.wav.mfcc.csv'};

for(i=1:10)
    mfcc=csvread(char(signalName(i)));
    [row column]=size(mfcc);
    
    if(row<=6)
        filename=strcat(char(signalName(1)),'_1.csv');
        csvwrite(filename,mfcc);
    else
        for(j=1:(row-5))
            filename=strcat(char(signalName(i)),'_',num2str(j),'.csv');
            current=mfcc(j:(j+5),:);
            current_name=strcat('MFCC_Windows',num2str(i));
            path=strcat('C:\Users\Minh\Documents\MATLAB\Taylan10AudioProcessing\',current_name);
            csvwrite(fullfile(path,filename),current);
        end
        
    end
end


end

