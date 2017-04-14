function [ output_args ] = Untitled( input_args )
fileName={'S_2016-03-15_19-10-47-33-W-B-Rosethorn.wav','S_2016-03-16_10-05-49-922-W-T-tarples.wav'};

for(i=1:2)
    [segments, fs, voice] = detectVoiced(char(fileName(i)));
    signal_time=[voice]/8000;
    [row column]=size(signal_time);
    matrix=[];
    matrix=[matrix;0 signal_time(1)];
    for(j=2:column-1)
        if(mod(j,2)==0)
        matrix=[matrix;signal_time(j) signal_time(j+1)];
        end
    end
    disp(matrix)
    filename=strcat(char(fileName(i)),'_silence.csv');
    path='C:\Users\Minh\Documents\MATLAB\Deception_LaughTest\Standardized-Audio';
    csvwrite(fullfile(path,filename),matrix);
end

end

