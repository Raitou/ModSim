% WCF Program
%   Author: Fernad Corbin (201811618)
%   Contact: 201811618@fit.edu.ph
%   Author: Angelito Tangtang (201810037)
%   Contact: 201810037@fit.edu.ph
%
% Description: This program creates a table showing WCF's for temperatur
% ranging from -20 to 55 in steps of five, and wind speeds ranging from 0
% to 55 in steps of five. Then will be written in wcftable.dat

function tab1 = wcf(t,v) %#ok<INUSD,FNDEF>
%Fahrenheit
t = -20:5:55;
%Miles per hour
v = 0:5:55;
numTemps  = length(t);
numSpeeds = length(v);
tab1 = zeros(numTemps,numSpeeds);
%loops to stores data
for i = 1 : numTemps
    for j = 1 : numSpeeds
        tab1(i,j) = 35.7 + 0.6*t(i) - 35.7*(v(j)^0.16) + 0.43*t(i)*(v(j)^0.16);
    end
end
%stores rows and columns
column = {v};
row = {t};
%Creates table showing Wind Chill Factors
wcfTb = uitable('columnname',column,'rowname',row,'data',tab1,'position',[20 20 760 340]); %#ok<NASGU>
%save into .dat file in ascii
save wcftable.dat tab1 -ascii
end
