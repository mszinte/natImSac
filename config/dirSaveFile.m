function [const] = dirSaveFile(const)
% ----------------------------------------------------------------------
% [const] = dirSaveFile(const)
% ----------------------------------------------------------------------
% Goal of the function :
% Make directory and saving files name and fid.
% ----------------------------------------------------------------------
% Input(s) :
% const : struct containing constant configurations
% ----------------------------------------------------------------------
% Output(s):
% const : struct containing constant configurations
% ----------------------------------------------------------------------
% Function created by Martin SZINTE (martin.szinte@gmail.com)
% Last update : 27 / 07 / 2020
% Project :     natImSac
% Version :     1.0
% ----------------------------------------------------------------------

% Create data directory 
if ~isdir(sprintf('data/%s/func/',const.sjct))
    mkdir(sprintf('data/%s/func/',const.sjct))
end

% Define directory
const.dat_output_file   =   sprintf('data/%s/func/%s_task-%s_%s',const.sjct,const.sjct,const.cond1_txt,const.run_txt);

% Eye data
const.eyelink_temp_file =   'XX.edf';
const.eyelink_local_file=   sprintf('%s_eyeData.edf',const.dat_output_file);

% Behavioral data
const.behav_file        =   sprintf('%s_events.tsv',const.dat_output_file);
if const.expStart
    if exist(const.behav_file,'file')
        aswErase = upper(strtrim(input(sprintf('\n\tThis file allready exist, do you want to erase it ? (Y or N): '),'s')));
        if upper(aswErase) == 'N'
            error('Please restart the program with correct input.')
        elseif upper(aswErase) == 'Y'
        else
            error('Incorrect input => Please restart the program with correct input.')
        end
    end
end
const.behav_file_fid    =   fopen(const.behav_file,'w');

% Create additional info directory
if ~isdir(sprintf('data/%s/add/',const.sjct))
    mkdir(sprintf('data/%s/add/',const.sjct))
end

% Define directory
const.add_output_file   =   sprintf('data/%s/add/%s_task-%s_%s',const.sjct,const.sjct,const.cond1_txt,const.run_txt);

% Define .mat saving file
const.mat_file          =   sprintf('%s_matFile.mat',const.add_output_file);

% experimental matrix file
const.expMat_file    =   sprintf('data/%s/add/%s_expMat.mat',const.sjct,const.sjct);

% Log file
if const.writeLogTxt
    const.log_file          =   sprintf('%s_logData.txt',const.add_output_file);
    const.log_file_fid      =   fopen(const.log_file,'w');
end

% Movie file
if const.mkVideo
    if ~isdir(sprintf('others/%s_vid/',const.cond1_txt))
        mkdir(sprintf('others/%s_vid/',const.cond1_txt))
    end
    const.movie_image_file  =   sprintf('others/%s_vid/%s_vid',const.cond1_txt,const.cond1_txt);
    const.movie_file        =   sprintf('others/%s_vid.mp4',const.cond1_txt);
end

end