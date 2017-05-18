addpath('./lib');
% format
root_fm = 'fan_%d';
site_fm = 'site_%d';
root = './test_data';
[output_stats, output_gs] = import_data('./test_data');

csv_dir = ['.' filesep 'output'];

fans = fieldnames(output_gs);

fan_data = output_stats;
