addpath('./lib');
% format
root_fm = 'fan_%d';
site_fm = 'site_%d';
root = './raw_data';
[output_stats, output_gs] = import_data('./raw_data');

csv_dir = ['.' filesep 'output'];

fans = fieldnames(output_gs);

fan_data = output_stats;

Jprocess = struct();


previous_params = false;


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

JtweakOptions(Jprocess);

