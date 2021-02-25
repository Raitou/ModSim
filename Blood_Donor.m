% Excel to Matlab
%   Author: Ken Harvey Oresca (201810379)
%   Contact: 201810379@fit.edu.ph
%
% Description: This program reads an excel file (not recommend by matlab)
% to matrix and calculates the average of the said student.

%Datasets 
bloodDonor = {
    'Zach Victorine', 'B', '-', 100, 70;
    'Lisa Love', 'AB', '+', 80, 60;
    'Horace Carr', 'O', '+', 120, 90;
    'Tracy Cook', 'A', '-', 80, 70;
    'Julio Howell', 'O', '-', 112, 79;
    'Sylvester Ingram', 'A', '+', 75, 50;
    'Julius Banks', 'AB', '+', 90, 59;
    'Mary Gomez', 'A', '-', 130, 77;
    'Joan Phillips', 'O', '+', 75, 70
    };


%Array Cell Converted to Table  
donorTb = cell2table(bloodDonor, 'VariableNames', {'Name', 'Blood Type', 'RH Factor', 'Blood Pressure(Systolic)', 'Blood Pressure(Diatolic)'});

%Save the Table
save('blood-donor-dataset.mat','donorTb', '-mat');

% Read The File
%When you load the .mat table. its value is a struct so i converted it to
%table after being loaded
donorData = struct2table(load('blood-donor-dataset.mat'));


%Display Data
fig = uifigure;
uitable(fig, 'Data', bloodDonor, 'ColumnName', ["Name", "Blood Type", "RH Factor", "Blood Pressure(Systolic)", "Blood Pressure(Diatolic)"], 'position',[20 20 500 400]);
disp(donorData)



