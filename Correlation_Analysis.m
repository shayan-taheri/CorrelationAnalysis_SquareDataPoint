% The script for correlation analysis of images of different datasets!
clear all; close all; clc;

corr_IVsP = zeros(1,10);
corr_IVsF = zeros(1,10);
corr_PVsF = zeros(1,10);

for ix = 1:10
    if (ix < 10)
        imI=imread(strcat('C:\Users\shaya\Desktop\Images\I_0',num2str(ix),'.jpg'));
        imP=imread(strcat('C:\Users\shaya\Desktop\Images\P_0',num2str(ix),'.jpg'));
        imF=imread(strcat('C:\Users\shaya\Desktop\Images\F_0',num2str(ix),'.bmp'));
    else
        imI=imread(strcat('C:\Users\shaya\Desktop\Images\I_',num2str(ix),'.jpg'));
        imP=imread(strcat('C:\Users\shaya\Desktop\Images\P_',num2str(ix),'.jpg'));
        imF=imread(strcat('C:\Users\shaya\Desktop\Images\F_',num2str(ix),'.bmp'));
    end
    
    imI = imresize(imI,[280 280]);
    imP = imresize((rgb2gray(imP)),[280 280]);
    imF = imresize(imF,[280 280]);
    imI_Vs_imP=abs(corr2(imI,imP));
    imI_Vs_imF=abs(corr2(imI,imF));
    imP_Vs_imF=abs(corr2(imP,imF));
    
    corr_IVsP(ix) = imI_Vs_imP;
    corr_IVsF(ix) = imI_Vs_imF;
    corr_PVsF(ix) = imP_Vs_imF;
end

figure();
plot(corr_IVsP,'s','MarkerSize',10,...
    'MarkerEdgeColor','red',...
    'MarkerFaceColor',[1 0.5 0.5]);

title('Analysis of Similarities Among Iris and Pill Images','FontSize',14);
ylim([-0.1,0.5]);
xlim([-1,11]);
ylabel('Correlation Cofficient','FontSize',12);
xlabel('Sample Index','FontSize',12);

figure();
plot(corr_IVsF,'s','MarkerSize',10,...
    'MarkerEdgeColor','blue',...
    'MarkerFaceColor',[0.5 0.5 1]);

title('Analysis of Similarities Among Iris and Fingerprint Images','FontSize',14);
ylim([-0.1,0.5]);
xlim([-1,11]);
ylabel('Correlation Cofficient','FontSize',12);
xlabel('Sample Index','FontSize',12);

figure();
plot(corr_PVsF,'s','MarkerSize',10,...
    'MarkerEdgeColor','black',...
    'MarkerFaceColor',[0.5 0.5 0.5]);

title('Analysis of Similarities Among Pill and Fingerprint Images','FontSize',14);
ylim([-0.1,0.5]);
xlim([-1,11]);
ylabel('Correlation Cofficient','FontSize',12);
xlabel('Sample Index','FontSize',12);