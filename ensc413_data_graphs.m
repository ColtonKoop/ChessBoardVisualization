close all; clear; clc;

categories = categorical(["BB" "BK" "BN" "BP" "BQ" "BR" "Empty" "WB" "WK" "WN" "WP" "WQ" "WR"]);
categories = reordercats(categories, ["BB" "BK" "BN" "BP" "BQ" "BR" "Empty" "WB" "WK" "WN" "WP" "WQ" "WR"]);
real100p = [0.29 0.93 0.86 0.86 0.81 0.90 0.99 0.88 0.89 0.90 0.94 0.82 0.90];
% 
% % realTrain 100p unity Train Vary
real100p_unity1_5625 = [0.88 0.93 0.92 0.94 0.85 0.85 1.00 0.90 0.97 0.89 0.95 0.85 0.86];
real100p_unity3_125 = [0.95 0.91 0.92 0.97 0.83 0.94 1.00 0.93 0.95 0.89 0.97 0.87 0.92];
real100p_unity6_25 = [0.86 0.94 0.94 0.96 0.85 0.96 0.99 0.88 0.96 0.85 0.94 0.79 0.89];
% 
 Y = [real100p; real100p_unity1_5625; real100p_unity3_125; real100p_unity6_25];
 figure
 bar(categories, Y)
 legend("Real Only", "~1250 Unity Images", "~2500 Unity Images", "~5000 Unity Images", "location", "southeast")
 ylim([0,1])
 title("F1 Scores Varying Unity Data")
 ylabel("F1 Score (higher is better)")
 xlabel("Piece Type")

%realTrain Vary unity Train 6.25
real3_125p_unity6_25 = [0.09 0.25 0.73 0.84 0.00 0.48 0.99 0.31 0.26 0.73 0.84 0.00 0.19];
real6_25p_unity6_25 = [0.20 0.80 0.77 0.82 0.00 0.36 0.99 0.49 0.74 0.67 0.73 0.16 0.00];
real12_5p_unity6_25 = [0.14 0.61 0.75 0.93 0.00 0.60 0.99 0.60 0.51 0.52 0.94 0.41 0.36];
real25p_unity6_25 = [0.85 0.84 0.81 0.81 0.62 0.71 0.99 0.74 0.94 0.35 0.86 0.73 0.61];
real37_5p_unity6_25 = [0.92 0.87 0.92 0.92 0.80 0.89 0.99 0.67 0.80 0.80 0.96 0.74 0.77];
real50p_unity6_25 = [0.88 0.91 0.93 0.94 0.81 0.85 0.99 0.78 0.84 0.83 0.91 0.70 0.81];

%Y = [real100p; real3_125p_unity6_25; real6_25p_unity6_25; real12_5p_unity6_25; real25p_unity6_25; real37_5p_unity6_25; real50p_unity6_25];
Y = [real12_5p_unity6_25; real37_5p_unity6_25; real50p_unity6_25; real100p_unity6_25];
figure
bar(categories, Y)
%legend("3.125", "6.25", "12.5", "25", "37.5", "50", "Real Only", "location", "south")
legend("~1500 Real Images", "~2250 Real Images", "~3000 Real Images", "~6000 Real Images", "location", "southeast")
ylim([0,1])
title("F1 Scores Varying Real Data")
ylabel("F1 Score (higher is better)")
xlabel("Piece Type")

unityBaseF1 = 0.24;
unityBaseMCC = 0.5477259712083662;
epochs = [2, 3, 4, 5, 6, 7];
realTrain_afterUnity_F1 = [0.88, 0.89, 0.93, 0.93, 0.84, 0.88];
realTrain_afterUnity_MCC = [0.934719882587441, 0.9323666564465107, 0.9510226956626701, 0.9550161155793667, 0.9058837847157607, 0.9365346674598035];
realTrain_noUnity_F1 = [0.84, 0.83, 0.91, 0.89, 0.93, 0.88];
realTrain_noUnity_MCC = [0.9086690924237043, 0.8665196695766354, 0.9456035950734089, 0.9272531891502223, 0.949567364574977, 0.9098335563480747];
realTrain25p_afterUnity_F1 = [0.65, 0.69, 0.79, 0.76, 0.78, 0.84, 0.77];
realTrain25p_afterUnity_MCC = [0.8323082875344938, 0.8556396055385843, 0.8808381164620847, 0.8596980247241557, 0.8717739402958014, 0.8891534380412692];
realTrain25p_noUnity_F1 = [0.59 0.73 0.74 0.79 0.66 0.77];
realTrain25p_noUnity_MCC = [0.7779271148922347 0.8550454894272246 0.8670450832018782 0.8699142934437619 0.8227746159656448 0.8373652552624573];

hold on
plot(epochs, realTrain25p_afterUnity_MCC, "linewidth", 2)
plot(epochs, realTrain25p_noUnity_MCC, "linewidth", 2)
hold off
legend("3 Unity Epochs First", "No Unity Epochs First", "location", "southeast")
ylim([0,1])
xlim([2,7])
title("MCC Scores for Training")
xlabel("Epochs")
ylabel("MCC Score")

figure
hold on
plot(epochs, realTrain_noUnity_F1, "linewidth", 2)
plot(epochs, realTrain_afterUnity_F1, "linewidth", 2)
hold off
title("F1 Scores")
legend("No Unity", "With Unity", "location", "southeast")
axis([2 7 0 1])
xlabel("Epochs")
ylabel("F1 Score")

figure
hold on
plot(epochs, realTrain_noUnity_MCC)
plot(epochs, realTrain_afterUnity_MCC)
hold off
title("MCC Scores")
legend("No Unity", "With Unity", "location", "southeast")
axis([2 7 0 1])
xlabel("Epochs")
ylabel("MCC Score")





