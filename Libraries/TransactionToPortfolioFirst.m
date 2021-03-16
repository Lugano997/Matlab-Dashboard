function [OutputPortfolio,EntrataOut,CurrencyRevOut, DatesRevOut, UscitaOut, CurrencyCostOut, DatesCostOut] = TransactionToPortfolioFirst(TransactionData)

    St = datetime("today");
    Dates = linspace(St,St + size(TransactionData,1),size(TransactionData,1))';
for i = 1:size(TransactionData,1)
    Dates(i,1) = TransactionData{i,1};
end
  Date1 = Dates(1);

Entrata = [];
Uscita = [];
CurrencyCost = categorical();
CurrencyRev = categorical();
DatesRevenue = datetime("today");
DatesCosts = datetime("today");


                 
                 
                InstrDAY1 = TransactionData{1,2};
                PricerDAY1 = TransactionData{1,3};
                QDAY1 = TransactionData{1,4};
                CurrencyDAY1 = TransactionData{1,5};
                OptionTypeDAY1 = TransactionData{1,6};
                CallPutDAY1 = TransactionData{1,7};
                StrikeDAY1 = TransactionData{1,8};
                MaturityDAY1 = TransactionData{1,9};
                InstrumentPrice1 = TransactionData{1,10};
    
    
    %Inizializza il nuovo cell array dati portafoglio
     for i = 1:length(InstrumentPrice1.Price)       
            if InstrumentPrice1.Price(i) < 0
                Entrata(i,1) = -InstrumentPrice1.Price(i);
                CurrencyRev(i,1) = CurrencyDAY1(i);
                DatesRevenue(i,1) = Date1;
                
                Uscita(i,1) = 0;
                CurrencyCost(i,1) = categorical("NO C");
                DatesCosts(i,1) = Date1;
            else
                Uscita(i,1) = InstrumentPrice1.Price(i);
                CurrencyCost(i,1) = CurrencyDAY1(i);
                DatesCosts(i,1) = Date1;
                
                Entrata(i,1) = 0;
                CurrencyRev(i,1) = categorical("NO C");
                DatesRevenue(i,1) = Date1;
            end
     end
    
    
    
       
    PortfolioData{1,1} = Date1;
    PortfolioData{1,2} = InstrDAY1;
    PortfolioData{1,3} = PricerDAY1;
    PortfolioData{1,4} = QDAY1;
    PortfolioData{1,5} = CurrencyDAY1;
    PortfolioData{1,6} = OptionTypeDAY1;
    PortfolioData{1,7} = CallPutDAY1;
    PortfolioData{1,8} = StrikeDAY1;
    PortfolioData{1,9} = MaturityDAY1;
                 
             

OutputPortfolio = PortfolioData;
EntrataOut = Entrata;
UscitaOut = Uscita;
CurrencyCostOut = CurrencyCost;
CurrencyRevOut = CurrencyRev;
DatesRevOut = DatesRevenue;
DatesCostOut = DatesCosts;

end

