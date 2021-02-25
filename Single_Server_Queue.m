% Single Server Queue Program
%   Author: John Kenneth Andales (201812358)
%   Contact: 201812358@fit.edu.ph
%
% Description: This program calculates and shows how single server queue
%              works. It shows the output in a table fashioned manner.
%              This program is written for Technical Assessment 1. GNU
%              Public Licensed v3 applied.

% initiate input matrix and constant named columns
matQueue = [
 1 0 0 4;
 2 8 8 1;
 3 6 14 4;
 4 1 15 3;
 5 8 23 2;
 6 3 26 4;
 7 8 34 5;
 8 7 41 4;
 9 2 43 5;
 10 3 46 3;
];
CUST = 1; % Customer
IAT = 2; % Inter-arrival time
AT = 3; % Arrival Time
ST = 4; % Service Time

% initiate iterator variable
[iTotalRows, iTotalCols] = size(matQueue);

% inititate output matrix and constant named columns
matSim = zeros(iTotalCols, 5);
TSB = 1; % Time Service Begin
TSE = 2; % Time Service Ends
TCW = 3; % Time Customer Waits
TCS = 4; % Time Customer Spends
TSI = 5; % Time System Idle

for i = 1:iTotalRows
    for j = 1:iTotalCols
        
        %Step 1: Time Service Begin
        if i == 1
           % nop: the first entry will always be 0
        else
            matSim(i, TSB) = max(matQueue(i, AT), matSim(i-1, TSE));
        end
        %Step 1 end
        
        %Step 2: Time Service Ends
        matSim(i, TSE) = matSim(i, TSB) + matQueue(i, ST);
        %Step 2 end
        
        %Step 3: Time Customer Wait
        matSim(i, TCW) = abs(matSim(i, TSB) - matQueue(i, AT));
        %Step 3 end
        
        %Step 4: Time Customer Spends
        matSim(i, TCS) = matSim(i, TSE) - matQueue(i, AT);
        %Step 4 end
        
        %Step 5: Time System Idle
        if i == 1
           % nop: the first entry will always be 0
        else            
            if isreal(matSim(i, TSB) -  matSim(i-1, TSE))
                matSim(i, TSI) = matSim(i, TSB) - matSim(i-1, TSE);
            else
                % nop: the entry will be 0
            end
        end
        %Step 5 end
        
    end
end

% Output Generation

% Making a total sum for specific columns that needed one
matTotal = [ "Total", sum(matQueue(:,IAT)), "-", sum(matQueue(:,ST)), "-", sum(matSim(:,TSE)), "-", sum(matSim(:,TCS)), sum(matSim(:,TSI))];

% Contactination of Queue input and Simulation output with addtition to the
% total row in matOutput
matOutput = [matQueue, matSim ; matTotal];

% Generation of table with matOutput and its table header with tOutput
tOutput = array2table(matOutput, 'VariableNames', ["Customer", "IAT", "AT", "ST", "TSB", "TSE", "TCW", "TCS", "TSI"]);
tOutput.Properties.Description = 'Single Server Program';

% Displaying tOutput
disp(tOutput);


