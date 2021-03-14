function SummaryPortStatTable = SummaryTableData(PortfolioData,Currency)
    
    NewPortfolio = {};
    SummaryTable = table();


    SummaryTable.Date = Dates;

% INIZIALIZZAZIONE
    TempInstr = PortfolioData{1,4};
    TempPricer = PortfolioData{1,3};
    TempQ = PortfolioData{1,2};
    TempCurrency = PortfolioData{1,5};
    TempOptionType = PortfolioData{1,6};
    TempCallPut = PortfolioData{1,7};
    TempStrike = PortfolioData{1,8};
    TempMaturity = PortfolioData{1,9};
    

    
    
    SummaryTable.NetPosition(1) = sum(TempQ(TempCurrency == Currency));
    SummaryTable.LongNumber(1) = nnz(TempQ(TempCurrency == Currency) > 0);
    SummaryTable.ShortNumber(1) = nnz(TempQ(TempCurrency == Currency) < 0);
    SummaryTable.CallNumber(1) = sum(TempQ(TempCallPut == "CALL" & (TempCurrency == Currency)));
    SummaryTable.PutNumber(1) = sum(TempQ((TempCallPut == "PUT") & (TempCurrency == Currency)));
    SummaryTable.MeanExpiration(1) = mean(years(TempMaturity(TempCurrency == Currency)-Dates(1)));
    SummaryTable.VanillaNumber(1) = nnz(TempOptionType(TempCurrency == Currency) == "VANILLA"); 
    SummaryTable.BarrierNumber(1) = nnz(TempOptionType(TempCurrency == Currency) == "BARRIER"); 
    SummaryTable.BinaryNumber(1) = nnz(TempOptionType(TempCurrency == Currency) == "BINARY"); 
    SummaryTable.LookbackNumber(1) = nnz(TempOptionType(TempCurrency == Currency) == "LOOKBACK"); 


% CONTROLLO ALTRI GIORNI

    
    
    CurrencyQ1 = Q1(Currency1 == Currency);
    CurrencyInstr1 = Instr1(Currency1 == Currency);
    CurrencyPricer = TempPricer(Currency1 == Currency);
    
    CurrencyQ2 = Q2(Currency2 == Currency);
    CurrencyInstr2 = Instr2(Currency2 == Currency);
    CurrencyPricer = TempPricer(Currency2 == Currency);




    

        
    
    
    
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

