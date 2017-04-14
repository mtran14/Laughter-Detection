function [ output_args ] = Untitled2( input_args )
fileName={'S_audio1.wav';'S_audio10.wav';'S_audio2.wav';'S_audio3.wav';'S_audio4.wav';'S_audio5.wav';'S_audio6.wav';'S_audio7.wav';'S_audio8.wav';'S_audio9.wav'};

for(i=1:10)
   a=miraudio(fileName(i));
   mfcc=mirgetdata(mirmfcc(a,'Frame',0.05,'s',20,'Hz'));
   mfcc=mfcc';
   filename=strcat(fileName(i),'.mfcc.csv');
   filename=char(filename);
   csvwrite(filename,mfcc);
end


end

