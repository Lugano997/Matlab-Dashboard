function SummaryPortStatTable = SummaryTableData(PortfolioData,Currency)

SummaryTable = table();
for i = 1:size(PortfolioData,1)
    Dates(i,1) = PortfolioData{i,1};
end

SummaryTable.Date = Dates;
























for i = 1:size(PortfolioData,1)
    
    TempQ = PortfolioData{i,2};
    TempCurrency = PortfolioData{i,5};
    TempOptionType = PortfolioData{i,6};
    TempCallPut = PortfolioData{i,7};
    TempStrike = PortfolioData{i,8};
    TempMaturity = PortfolioData{i,9};
    
    
    SummaryTable.NetPosition(i) = sum(TempQ(TempCurrency == Currency));
    SummaryTable.LongNumber(i) = nnz(TempQ(TempCurrency == Currency) > 0);
    SummaryTable.ShortNumber(i) = nnz(TempQ(TempCurrency == Currency) < 0);
    SummaryTable.CallNumber(i) = sum(TempQ(TempCallPut == "CALL" & (TempCurrency == Currency)));
    SummaryTable.PutNumber(i) = sum(TempQ((TempCallPut == "PUT") & (TempCurrency == Currency)));
    SummaryTable.MeanExpiration(i) = mean(years(TempMaturity(TempCurrency == Currency)-Dates(i)));
    SummaryTable.VanillaNumber(i) = nnz(TempOptionType(TempCurrency == Currency) == "VANILLA"); 
    SummaryTable.BarrierNumber(i) = nnz(TempOptionType(TempCurrency == Currency) == "BARRIER"); 
    SummaryTable.BinaryNumber(i) = nnz(TempOptionType(TempCurrency == Currency) == "BINARY"); 
    SummaryTable.LookbackNumber(i) = nnz(TempOptionType(TempCurrency == Currency) == "LOOKBACK"); 
    
end


SummaryPortStatTable = SummaryTable;


end

