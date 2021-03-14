function SummaryPortStatTable = SummaryTableData(PortfolioData,Currency)
    
    NewPortfolio = {};
    SummaryTable = table();
for i = 1:size(PortfolioData,1)
    Dates(i,1) = PortfolioData{i,1};
end

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
if size(PortfolioData,1) > 1
else
    
    for i = 2:size(PortfolioData,1)    
    
    % Ottieni Dati Giorno Precedente
    Instr1 = PortfolioData{i-1,4};
    Pricer1 = PortfolioData{i-1,3};
    Q1 = PortfolioData{i-1,2};
    Currency1 = PortfolioData{i-1,5};
    OptionType1 = PortfolioData{i-1,6};
    CallPut1 = PortfolioData{i-1,7};
    Strike1 = PortfolioData{i-1,8};
    Maturity1 = PortfolioData{i-1,9};
    
    %Ottieni dati giorno i
    Instr2 = PortfolioData{i,4};
    Pricer2 = PortfolioData{i,3};
    Q2 = PortfolioData{i,2};
    Currency2 = PortfolioData{i,5};
    OptionType2 = PortfolioData{i,6};
    CallPut2 = PortfolioData{i,7};
    Strike2 = PortfolioData{i,8};
    Maturity2 = PortfolioData{i,9};
    
    
    CurrencyQ1 = Q1(Currency1 == Currency);
    CurrencyInstr1 = Instr1(Currency1 == Currency);
    CurrencyPricer = TempPricer(Currency1 == Currency);
    
    CurrencyQ2 = Q2(Currency2 == Currency);
    CurrencyInstr2 = Instr2(Currency2 == Currency);
    CurrencyPricer = TempPricer(Currency2 == Currency);

TEST = zeros(length(CurrencyInstr1),length(CurrencyInstr2));
for i = 1:length(CurrencyInstr2)
    for k = 1:length(CurrencyInstr1)
        if CurrencyInstr2(i)== CurrencyInstr1(k)
            TEST(i,k) = 1;
        else
            TEST(i,k) = 0;
        end         
    end
end

for i = 1:length(CurrencyQ2)
UpdatedQuant(i) = sum([CurrencyQ2(i) CurrencyQ1(TEST(i,:))]);
end
    
    NewInstr = Instr1;
    NewQ = CurrencyQ1;
    NewInstADDED_Counter = 0;
    for i = 1:length(Instr2)
        if nnz(TEST(i,:)) == 0
            NewInstr(length(NewInstr)+1) = Instr2(i);
            NewPricer(length(NewPricer)+1) = Pricer2(i);
            NewQ(length(NewQ)+1) = CurrencyQ2(i);
            NewInstADDED_Counter = NewInstADDED_Counter +1; 
        else
           NewQ([TEST(i,:) logical(zeros([1 NewInstADDED_Counter]))) =  sum([CurrencyQ1(TEST(i,:)) CurrencyQ2(i)]);
    end
        
    
    
    
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

