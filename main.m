%% Use this to check if you passed MTE 220

% Instructions
% Mode 1: Calculate the absolute minimum grade to pass
% Mode 2: Calculate what you need on finals to get a specified final grade

mode = str2double(input('Enter a mode ','s'));

labs = zeros(7,1);
for i=1:7
    invalidNum = 1;
    while invalidNum
        val = str2double(input(['Enter your lab ',int2str(i),' mark '],'s'));
        if val <= 100 && val >= 0
            invalidNum = 0;
            labs(i,1) = val;
        else
            disp('Pls enter a valid score');
        end
    end
end

invalidNum = 1;
while invalidNum
    val = str2double(input('Enter your midterm mark ','s'));
    if val <= 100 && val >= 0
        invalidNum = 0;
        M = val;
    else
        disp('Pls enter a valid score');
    end
end
    
if mode == 1
    % Find the lowest mark you possibly need to pass
    for i=0:0.5:100
        G = CalculateGrade(i,M,labs);
        if G > 50
            disp(['The lowest mark you need to pass is ',num2str(i),' bruh']);
            disp(['This will give you a final grade of ',num2str(G),'. Good luck!']);
            break
        end
    end
elseif mode == 2
    myGrade = str2double(input('Enter the grade you want ','s'));
    for i=0:0.5:100
        G = CalculateGrade(i,M,labs);
        if G > myGrade
            disp(['You need about ',num2str(i),' on the final to get a final grade of ',num2str(myGrade),' . Good luck!']);
            break
        end
    end
end