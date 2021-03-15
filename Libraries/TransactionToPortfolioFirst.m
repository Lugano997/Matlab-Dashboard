function [OutputPortfolio,EntrataOut, UscitaOut] = TransactionToPortfolioFirst(TransactionData)

    St = datetime("today");
    Dates = linspace(St,St + size(TransactionData,1),size(TransactionData,1))';
for i = 1:size(TransactionData,1)
    Dates(i,1) = TransactionData{i,1};
end
  
Uscita = {};
Entrata = {};

                 
                 
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
                Entrata{1,size(Entrata,2)+1} = -InstrumentPrice1.Price(i);
                Entrata{2,size(Entrata,2)+1} = CurrencyDAY1(i);
            else
                Uscita{1,size(Uscita,2)+1} = InstrumentPrice1.Price(i);
                Uscita{2,size(Uscita,2)+1} = CurrencyDAY1(i);
            end
     end
    
    
    Date1 = Dates(1);
       
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

end

