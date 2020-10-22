%% General experimenter launcher
%  =============================
% By :      Martin SZINTE
% Projet :  natImSac
% With :    Guillaume MASSON, Jason Samonds & Nicholas Priebe
% Version:  1.0

% Version description
% ===================
% Experiment in which human participant free view natural images to 
% determine saccade and fixation statistics

% design idea
% -----------
% 20 blocks of 9 trials (4:46 min, about 2h total)
% 80 trials of 40 dva width images
% 80 trials of 20 dva width images
% 10 trials of 40 dva width dark gray images
% 10 trials of 20 dva width dark gray images
% trials of 30 seconds freeview
% inter-trial intervals of 2 seconds each
% binocular recordings

% First settings
% --------------
Screen('CloseAll');clear all;clear mex;clear functions;close all;home;AssertOpenGL;

% General settings
% ----------------
const.expName           =   'natImaSac';    % experiment name
const.expStart          =   1;              % Start of a recording exp                          0 = NO  , 1 = YES
const.checkTrial        =   0;              % Print trial conditions (for debugging)            0 = NO  , 1 = YES
const.writeLogTxt       =   0;              % write a log file in addition to eyelink file      0 = NO  , 1 = YES
const.mkVideo           =   0;              % Make a video of a run                             0 = NO  , 1 = YES

% External controls
% -----------------
const.tracker           =   1;              % run with eye tracker                              0 = NO  , 1 = YES

% Run order and number per condition
% ----------------------------------
const.cond_run_order    =   [01;01;01;01;01;01;01;01;01;01;...
                             01;01;01;01;01;01;01;01;01;01];
const.cond_run_num      =   [01;02;03;04;05;06;07;08;09;10;...
                             11;12;13;14;15;16;17;18;19;20];

% Desired screen setting
% ----------------------
const.desiredFD         =   120;            % Desired refresh rate
%fprintf(1,'\n\n\tDon''t forget to change before testing\n');
const.desiredRes        =   [1920,1080];    % Desired resolution

% Path
% ----
dir                     =   (which('expLauncher'));
cd(dir(1:end-18));

% Add Matlab path
% ---------------
addpath('config','main','conversion','eyeTracking','instructions','trials','stim','stats');

% Subject configuration
% ---------------------
[const]                 =   sbjConfig(const);
                        
% Main run
% --------
main(const);
