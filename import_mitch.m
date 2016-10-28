% Import script for Mitch D'Arcy's northern Death Valley grain size data
addpath('./Mitch_data');

Backthrust = {};
Moonlight = {};

[backthrust_modern_data, backthrust_modern_gs] = backthrust_modern;
[backthrust_Q2c_data, backthrust_Q2c_gs] = backthrust_Q2c;
[Moonlight_modern_data, Moonlight_modern_gs] = Moonlight_modern;
[Moonlight_Q2c_data, Moonlight_Q2c_gs] = Moonlight_Q2c;

Backthrust = {backthrust_modern_data, backthrust_Q2c_data};
Moonlight = {Moonlight_modern_data, Moonlight_Q2c_data};
moonlight_gs = struct();
moonlight_gs.Modern =  Moonlight_modern_gs;
moonlight_gs.Q2c =  Moonlight_Q2c_gs;

backthrust_gs = struct();
backthrust_gs.Modern =  backthrust_modern_gs;
backthrust_gs.Q2c =  backthrust_Q2c_gs;

output_gs = struct();
output_gs.Backthrust = backthrust_gs;
output_gs.Moonlight = moonlight_gs;

fan_data = {Backthrust, Moonlight};