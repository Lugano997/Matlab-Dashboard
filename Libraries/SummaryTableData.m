function SummaryPortStatTable = SummaryTableData(PortfolioData,Currency)
    
   
   for i = 1:size(PortfolioData,1)
       DatesVector(i,1) = PortfolioData{i,1};
   end


    SummaryTable = table();


    SummaryTable.Date = DatesVector;

% INIZIALIZZAZIONE
    TempInstr = PortfolioData{1,2}';
    TempPricer = PortfolioData{1,3}';
    TempQ = PortfolioData{1,4}';
    TempCurrency = PortfolioData{1,5};
    TempOptionType = PortfolioData{1,6};
    TempCallPut = PortfolioData{1,7};
    TempStrike = PortfolioData{1,8};
    TempMaturity = PortfolioData{1,9};
    
    

    
    
    SummaryTable.NetPosition(1) = sum(TempQ(TempCurrency == Currency));
    SummaryTable.LongNumber(1) = sum(TempQ(TempCurrency == Currency & TempQ > 0));
    SummaryTable.ShortNumber(1) = sum(TempQ(TempCurrency == Currency & TempQ < 0));
    SummaryTable.CallNumber(1) = sum(TempQ(TempCallPut == "CALL" & (TempCurrency == Currency)));
    SummaryTable.PutNumber(1) = sum(TempQ((TempCallPut == "PUT") & (TempCurrency == Currency)));
    SummaryTable.MeanExpiration(1) = mean(years(TempMaturity(TempCurrency == Currency)-DatesVector(1)));
    SummaryTable.VanillaNumber(1) = sum(TempQ(TempCurrency == Currency & TempOptionType == "VANILLA")); 
    SummaryTable.BarrierNumber(1) = sum(TempQ(TempCurrency == Currency & TempOptionType == "BARRIER")); 
    SummaryTable.BinaryNumber(1) = sum(TempQ(TempCurrency == Currency & TempOptionType == "BINARY")); 
    SummaryTable.LookbackNumber(1) = sum(TempQ(TempCurrency == Currency & TempOptionType == "LOOKBACK")); 


% CONTROLLO ALTRI GIORNI

if size(PortfolioData,1) > 1    
    for i = 2:size(PortfolioData,1)
        
    TempInstr = PortfolioData{i,2}';
    TempPricer = PortfolioData{i,3}';
    TempQ = PortfolioData{i,4}';
    TempCurrency = PortfolioData{i,5};
    TempOptionType = PortfolioData{i,6};
    TempCallPut = PortfolioData{i,7};
    TempStrike = PortfolioData{i,8};
    TempMaturity = PortfolioData{i,9};
    
    

    
    
   SummaryTable.NetPosition(i) = sum(TempQ(TempCurrency == Currency));
    SummaryTable.LongNumber(i) = sum(TempQ(TempCurrency == Currency & TempQ > 0));
    SummaryTable.ShortNumber(i) = sum(TempQ(TempCurrency == Currency & TempQ < 0));
    SummaryTable.CallNumber(i) = sum(TempQ(TempCallPut == "CALL" & (TempCurrency == Currency)));
    SummaryTable.PutNumber(i) = sum(TempQ((TempCallPut == "PUT") & (TempCurrency == Currency)));
    SummaryTable.MeanExpiration(i) = mean(years(TempMaturity(TempCurrency == Currency)-DatesVector(i)));
    SummaryTable.VanillaNumber(i) = sum(TempQ(TempCurrency == Currency & TempOptionType == "VANILLA")); 
    SummaryTable.BarrierNumber(i) = sum(TempQ(TempCurrency == Currency & TempOptionType == "BARRIER")); 
    SummaryTable.BinaryNumber(i) = sum(TempQ(TempCurrency == Currency & TempOptionType == "BINARY")); 
    SummaryTable.LookbackNumber(i) = sum(TempQ(TempCurrency == Currency & TempOptionType == "LOOKBACK"));  
    
    end
end 


SummaryPortStatTable = SummaryTable;


end

