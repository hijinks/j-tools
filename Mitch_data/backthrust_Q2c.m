function [stats, gs_cell] = backthrust_Q2c(varargin)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [VARNAME80,VARNAME84,VARNAME88,VARNAME92,VARNAME96,VARNAME100,VARNAME104,VARNAME108,VARNAME112,VARNAME116,VARNAME120,VARNAME124,VARNAME128,VARNAME132,VARNAME136,VARNAME140,VARNAME144,VARNAME148,VARNAME152,VARNAME156,VARNAME160]
%   = IMPORTFILE(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [VARNAME80,VARNAME84,VARNAME88,VARNAME92,VARNAME96,VARNAME100,VARNAME104,VARNAME108,VARNAME112,VARNAME116,VARNAME120,VARNAME124,VARNAME128,VARNAME132,VARNAME136,VARNAME140,VARNAME144,VARNAME148,VARNAME152,VARNAME156,VARNAME160]
%   = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [VarName80,VarName84,VarName88,VarName92,VarName96,VarName100,VarName104,VarName108,VarName112,VarName116,VarName120,VarName124,VarName128,VarName132,VarName136,VarName140,VarName144,VarName148,VarName152,VarName156,VarName160] = importfile('Backthrust_canyon_gs.csv',14, 2614);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2016/10/19 11:04:49

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 14;
    endRow = inf;
end

%% Read columns of data as strings:
% For more information, see the TEXTSCAN documentation.
formatSpec = '%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%*s%*s%*s%s%[^\n\r]';

%% Open the text file.
filename = './Mitch_data/Backthrust_canyon_gs.csv';
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Convert the contents of columns containing numeric strings to numbers.
% Replace non-numeric strings with NaN.
raw = repmat({''},length(dataArray{1}),length(dataArray)-1);
for col=1:length(dataArray)-1
    raw(1:length(dataArray{col}),col) = dataArray{col};
end
numericData = NaN(size(dataArray{1},1),size(dataArray,2));

for col=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21]
    % Converts strings in the input cell array to numbers. Replaced non-numeric
    % strings with NaN.
    rawData = dataArray{col};
    for row=1:size(rawData, 1);
        % Create a regular expression to detect and remove non-numeric prefixes and
        % suffixes.
        regexstr = '(?<prefix>.*?)(?<numbers>([-]*(\d+[\,]*)+[\.]{0,1}\d*[eEdD]{0,1}[-+]*\d*[i]{0,1})|([-]*(\d+[\,]*)*[\.]{1,1}\d+[eEdD]{0,1}[-+]*\d*[i]{0,1}))(?<suffix>.*)';
        try
            result = regexp(rawData{row}, regexstr, 'names');
            numbers = result.numbers;
            
            % Detected commas in non-thousand locations.
            invalidThousandsSeparator = false;
            if any(numbers==',');
                thousandsRegExp = '^\d+?(\,\d{3})*\.{0,1}\d*$';
                if isempty(regexp(numbers, thousandsRegExp, 'once'));
                    numbers = NaN;
                    invalidThousandsSeparator = true;
                end
            end
            % Convert numeric strings to numbers.
            if ~invalidThousandsSeparator;
                numbers = textscan(strrep(numbers, ',', ''), '%f');
                numericData(row, col) = numbers{1};
                raw{row, col} = numbers{1};
            end
        catch me
        end
    end
end


%% Replace non-numeric cells with NaN
R = cellfun(@(x) ~isnumeric(x) && ~islogical(x),raw); % Find non-numeric cells
raw(R) = {NaN}; % Replace non-numeric cells

%% Allocate imported array to column variable names
VarName80 = cell2mat(raw(:, 1));
VarName84 = cell2mat(raw(:, 2));
VarName88 = cell2mat(raw(:, 3));
VarName92 = cell2mat(raw(:, 4));
VarName96 = cell2mat(raw(:, 5));
VarName100 = cell2mat(raw(:, 6));
VarName104 = cell2mat(raw(:, 7));
VarName108 = cell2mat(raw(:, 8));
VarName112 = cell2mat(raw(:, 9));
VarName116 = cell2mat(raw(:, 10));
VarName120 = cell2mat(raw(:, 11));
VarName124 = cell2mat(raw(:, 12));
VarName128 = cell2mat(raw(:, 13));
VarName132 = cell2mat(raw(:, 14));
VarName136 = cell2mat(raw(:, 15));
VarName140 = cell2mat(raw(:, 16));
VarName144 = cell2mat(raw(:, 17));
VarName148 = cell2mat(raw(:, 18));
VarName152 = cell2mat(raw(:, 19));
VarName156 = cell2mat(raw(:, 20));
VarName160 = cell2mat(raw(:, 21));

gs = [VarName80,VarName84,VarName88,VarName92,VarName96,VarName100,VarName104,VarName108,VarName112,VarName116,VarName120,VarName124,VarName128,VarName132,VarName136,VarName140,VarName144,VarName148,VarName152,VarName156,VarName160];
gs_s = size(gs);
gs_cell = cell(gs_s(2),3);
max = 1;

w = [];
means = [];
d84s = [];
d50s = [];
stdevs = [];
cvs = [];

wolmans = {};
sss = {};

for l=1:gs_s(2)
    c = gs(:,l);
    c(isnan(c(:,1)),:)=[];
    m = mean(c);
    d50 = prctile(c, 50);
    d84 = prctile(c, 84);
    stdev = std(c);
    cv_mean = stdev/m;
    
    w = [w;c];
    sorted_data = sort(c);
    ss_data = arrayfun(@(x)((x-m)/stdev),sorted_data);

    if length(c) > max
       max = length(c); 
    end
    gs_cell{l,2} = c;
    
    means = [means,m];
    d84s = [d84s,d84];
    d50s = [d50s,d50];
    stdevs = [stdevs,stdev];
    cvs = [cvs,cv_mean];
    wolmans = [wolmans, c];
    sss = [sss, ss_data];
end

stats.name = 'Q2c';
stats.d84 = d84s;
stats.d50 = d50s;
stats.mean = means;
stats.stdev = stdevs;
stats.wolmans = wolmans;
stats.cv_mean = cvs;
stats.ss = sss;
