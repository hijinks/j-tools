addpath('./lib');
% format
import_mitch;


csv_dir = ['.' filesep 'output'];

fans = fieldnames(output_gs);

Jprocess = struct();


previous_params = false;

auto = 0;

% if exist(csv_dir, 'dir')
%    dir_search = subdir(csv_dir);
%    previous_params = struct();
%    for l=1:length(dir_search)
%         [pathstr,fname,ext] = fileparts(dir_search(l).name);
%         if strcmp('.csv', ext) > 0
%             fpath = dir_search(l).name;
%             delimiter = ',';
%             formatSpec = '%*q%*q%*q%*q%*q%*q%*q%*q%*q%*q%q%q%q%*s%*s%*s%[^\n\r]';
%             fileID = fopen(fpath,'r');
%             dataArray = textscan(fileID, formatSpec, 'Delimiter', delimiter,  'ReturnOnError', false);
% 
%             fclose(fileID);
% 
%             ag = dataArray{:, 1};
%             bg = dataArray{:, 2};
%             cg = dataArray{:, 3};
% 
%             previous_params.(fname) = struct('ag',str2num(ag{2}),...
%                 'bg',str2num(bg{2}),'cg',str2num(cg{2}));
% 
%             %% Clear temporary variables
%             clearvars filename delimiter formatSpec fileID dataArray ans;
%    
%         end
%    end
% end



for u=1:length(fans)
    fan_surfaces = output_gs.(fans{u});
    current_fan = fan_data{u};
    surfaces_names = fieldnames(fan_surfaces);
    for w=1:length(surfaces_names)
        ds_surface = fan_surfaces.(surfaces_names{w});
        surface_data = current_fan{w};
        surface_name = [fans{u} '_' surface_data.name];
        
        if isstruct(previous_params)
            if isfield(previous_params,surface_name)
                Jprocess.(surface_name) = {ds_surface,surface_data, previous_params.(surface_name)};
            else
                Jprocess.(surface_name) = {ds_surface,surface_data};
            end
        else
            Jprocess.(surface_name) = {ds_surface,surface_data};
        end
    end
end

if auto > 0
    AutoJ(Jprocess);
else
    JtweakOptions(Jprocess);
end
