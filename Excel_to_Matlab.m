% Excel to Matlab
%   Author: John Kenneth Andales (201812358)
%   Contact: 201812358@fit.edu.ph
%
% Description: This program reads an excel file (not recommend by matlab)
% to matrix and calculates the average of the said student.

% creates the excel file
grades = [
    1001, 95, 97, 89 ; 
    1002, 92, 85, 91 ; 
    1003, 82, 98, 95
    ];
headers = ["Student ID", "Quiz 1","Quiz 2","Quiz 3"];
xlswrite('Grades.xlsx',[headers; grades]);

% reads the file named Grades.xlsx
filename = "Grades.xlsx";
matGrades = xlsread(filename);

% get the row count and column count for the looping
[iTotalRows, iTotalCols] = size(matGrades);

% creates the student grade matrix and convert it to string matrix
studentGrade = [];
studentGrade = string(studentGrade);

% algorithm part: this loops to every row and generate an average and puts
% it in the end of the student grade table. 
for i = 1:iTotalRows
    grades = [];
    average = [];
    for j = 1:iTotalCols
        if j == 1
            % putting in the first column as student id
            studentGrade(i, j) = string(matGrades(i, 1)); 
            continue
        end
        % added the grades in a linear array
        grades(end+1) = matGrades(i, j); %#ok<SAGROW>
        % put the quiz grades in the 2d array
        studentGrade(i, j) = matGrades(i, j); 
    end
    % generates a mean of the linear array before emptying it
    average(end+1) = mean(grades); %#ok<SAGROW>
    % parsing the average at the end of the average.
    studentGrade(i, iTotalCols+1) = string(average);
end

% generating a header for the table
tOutput = array2table(studentGrade, 'VariableNames', ["Student ID", "Quiz 1", "Quiz 2", "Quiz 3", "Average"]);
% displaying the table
fig = uifigure;
uitable(fig, 'Data', studentGrade, 'ColumnName', ["Student ID", "Quiz 1", "Quiz 2", "Quiz 3", "Average"], 'position',[20 20 500 400]);
display(tOutput)
