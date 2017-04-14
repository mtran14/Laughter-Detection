# Laughter-Detection-Project

1. Purpose: The purpose of the project is to detect laughter moments in a .wav audio file for the deception project. The output of the codes are the marks of the time when laughters begin and end.

2. Database used:
a/ Laughter Database
- AudioVisual Laughter Cycles Database
24 subjects (15 male and 9 female)
- Mahnob Laughter Database
22 subjects (12 male and 10 female)
-Laughter audio files from 20 Deception Audios
In total, there are about 1600 audio files

b/Talk Database
- Mahnob Laughter Database
- Voxforge English speech files
In total, the speech duration is about 5500 seconds

3. Standardized the audio files :
In order to compare the difference between laughter and speech shape, all the audio files are standardized so that the sampling rate of all audio become 8000 Hz and the amplitudes inside each signal between -1 and 1.

4. Feature extraction :
Extract the Mel Frequency Cepstral Coefficients of each laughter/speech audio files (50 ms frame, no overlap). Then, take 6 sucessive frame (0.3 second length) and compute the average MFCC over this time. Then, shift by 1 frame to get the new average.
Mark each average with 0 or 1 depends on the audio file belongs to Talk or Laughter Database respectively.

5. Classification:
A/ Data used for training:
After extracting features from the two databases, there are about 125000 data points, which is too much. Because the main purpose of the laughter detection is to detect laughter moments in deception audios, the laughter data points from the deception audios will weigh more than other data points (by 20 times). Then, 15000 data points other than the deception ones  are chosen to get a total of about 20000 laughter data points for training. Similarly, another 20000 talking data points are chosen from the 125000 data points for training. So in total, there are 40000 data points for classification (20000 laughters/20000 talking).

B/ Classification methods:
Three different classification methods are used: logistic regression, KNN and Support Vector Machines.
Logistic regression accuracy: 72.74%
KNN (K=10) accuracy: 81.82%
SVM accuracy: 88%

So, SVM ({'C': 1000, 'gamma': 0.001, 'kernel': 'rbf'}) performs best out of the three classification methods.

6. Test on 10 deception audio:
	The laughter detection typically catches half of the laughters and output a lot of false positives.
	After getting the predictions from SVM, remove the classifications from audio parts that are silent (because there is no silence in the training data, the output from the silence parts are nearly random and need to be removed).

