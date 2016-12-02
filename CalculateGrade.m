function [G] = CalculateGrade(F,M,labs)
    E1 = F*50/70 + M*20/70;
    
    if M >= F 
        E = E1;
    else
        E = E1 + (F-M)*20/70/2;
    end
    
    labsWeGood = true;
    labSum = 0;
    
    for i=1:(size(labs,1)-1)
        if labs(i,1) < 70
            labsWeGood = false;
        else
            labSum = labSum + labs(i,1);
        end
    end
    
    if labsWeGood
        L = labSum/12 + labs(7,1)/2;
    else
        L = labSum/12;
    end
    
    if E < 50 || L < 50
        if E < L
            G = E;
        else
            G = L;
        end
    else
        if 50 <= E && E <= 65
            G = E*((70+30*((65-E)/15))/100) + L*((30*((E-50)/15))/100);
        else
            G = E*70/100 + L*30/100;
        end
    end
end

