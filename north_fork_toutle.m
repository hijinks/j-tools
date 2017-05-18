% Attempt to replicate the pilot data in Fedele & Paola 2007

xsection_vars = fieldnames(northforksgs);

figure;
for k=1:length(rows)
    xsection = strtrim(rows{k});
    dat = northforksgs.(xsection_vars{k});

    % We need larger grain sizes than 1mm!!

    sdev = northforksdata({xsection},:).std_mm;
    mean_v = northforksdata({xsection},:).mean_mm;
    ss = arrayfun(@(x)((x-mean_v)/sdev),dat);
    ss_x = arrayfun(@(x)((x-mean_v)/sdev),mm_x);
    
    hold on;
    plot(ss_x,ss,'x');
    xlim([-1 4])
end

