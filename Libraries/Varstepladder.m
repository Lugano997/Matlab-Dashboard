function [ES, VAR, PortRet, InitialValue] =  Varstepladder(LastPrice, RiskHorizonFactor, Quantili, TempPricer, TempInstruments, TempQuantities, ProgressBar)
ProgressBar.Value = 0;




%A SECONDA DELLA MODALITà SELEZIONATA, ELABORA DEGLI SCENARI DEL TASSO DI
%CAMBIO IN DIMINUZIONE


   
VAR_Scenarios = exp(Quantili.*RiskHorizonFactor)*LastPrice;





VAR_Scenarios_SpotPrice = [VAR_Scenarios ; LastPrice];



SummaryTableVAR = array2table(zeros([length(VAR_Scenarios_SpotPrice) 7])); %PREALLOCAZIONE
for i = 1:length(VAR_Scenarios_SpotPrice)
    ProgressBar.Value = i/length(VAR_Scenarios_SpotPrice);
    
    for k= 1:length(TempPricer) 
        TempPricer(k).SpotPrice = VAR_Scenarios_SpotPrice(i);
    end
    [~, ~, PortSensVAR, ~] = pricePortfolio(finportfolio(TempInstruments,TempPricer,TempQuantities));
    SummaryTableVAR(i,:) = PortSensVAR;
    
end
PortRet = (SummaryTableVAR{1:end-1,1}-SummaryTableVAR{end,1})./SummaryTableVAR{end,1};
[~,sigma] = normfit(PortRet);
p = [ 0.001 0.01 0.05];
VAR = norminv(p).*sigma.* RiskHorizonFactor.* SummaryTableVAR{end,1};
ES = -p.^-1 .* normpdf(norminv(p)).*sigma.*RiskHorizonFactor.* SummaryTableVAR{end,1};

InitialValue = SummaryTableVAR{end,1};
end
