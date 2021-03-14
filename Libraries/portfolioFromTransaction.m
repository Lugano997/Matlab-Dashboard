function [OutputPortfolio,Revenues,CurrencyRev,Costs,CurrencyCosts] = portfolioFromTransaction(TransactionData)
   
% Initializing Final Struct
    
    Entrata = [];
    CurrencyEntrata = [];
    Uscita = [];
    CurrencyUscita = [];

    St = datetime("today");
    Dates = linspace(St,St + size(TransactionData,1),size(TransactionData,1))';
for i = 1:size(TransactionData,1)
    Dates(i,1) = TransactionData{i,1};
end

        
    InstrDAY1 = TransactionData{1,2};
    PricerDAY1 = TransactionData{1,3};
    QDAY1 = TransactionData{1,4};
    CurrencyDAY1 = TransactionData{1,5};
    OptionTypeDAY1 = TransactionData{1,6};
    CallPutDAY1 = TransactionData{1,7};
    StrikeDAY1 = TransactionData{1,8};
    MaturityDAY1 = TransactionData{1,9};
    
    
    %Inizializza il nuovo cell array dati portafoglio
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
    
    
    

if size(TransactionData,1) > 1
    
    for day = 2:size(TransactionData,1)    
    
    % Ottieni Dati Giorno Precedente
    Date1 = PortfolioData{day-1,1};
    Instr1 = PortfolioData{day-1,2};
    Pricer1 = PortfolioData{day-1,3};
    Q1 = PortfolioData{day-1,4};
    Currency1 = PortfolioData{day-1,5};
    OptionType1 = PortfolioData{day-1,6};
    CallPut1 = PortfolioData{day-1,7};
    Strike1 = PortfolioData{day-1,8};
    Maturity1 = PortfolioData{day-1,9};
    
    %Ottieni dati giorno day
    Date2 = TransactionData{day,1};
    Instr2 = TransactionData{day,2};
    Pricer2 = TransactionData{day,3};
    Q2 = TransactionData{day,4};
    Currency2 = TransactionData{day,5};
    OptionType2 = TransactionData{day,6};
    CallPut2 = TransactionData{day,7};
    Strike2 = TransactionData{day,8};
    Maturity2 = TransactionData{day,9};
    Prices2 = TransactionData{day,10};

    %RICHIAMO FUNZIONE CHECK STRUMENTI UGUALI
TEST = checkTransactions(Instr1, Instr2,Currency1,Currency2);

    NewInstr = Instr1;
    NewQ = Q1;
    NewPricer = Pricer1;
    NewCurrency = Currency1;
    NewOptionType = OptionType1;
    NewMaturity = Maturity1;
    NewInstADDED_Counter = 0;
    NewCallPut = CallPut1;
    NewStrike = Strike1;
    
    for i = 1:length(Instr2)
        if nnz(TEST(i,:)) == 0
            NewInstr(length(NewInstr)+1) = Instr2(i);
            NewPricer(length(NewPricer)+1) = Pricer2(i);
            NewQ(length(NewQ)+1) = Q2(i);
            NewCurrency(length(NewCurrency)+1) = Currency2(i);
            NewOptionType(length(NewOptionType)+1) = OptionType2(i);
            NewCallPut(length(NewCallPut)+1) = CallPut2(i);
            NewStrike(length(NewStrike)+1) = Strike2(i);
            NewMaturity(length(NewMaturity)+1) = Maturity2(i); 
            %MANCA PREZZI
            NewInstADDED_Counter = NewInstADDED_Counter +1; 
        else
           NewQ([TEST(i,:) logical(zeros([1 NewInstADDED_Counter]))]) =  sum([Q1(TEST(i,:)) Q2(i)]);
           
           if Q2(i) > 0
                Uscita(day,i) = -Prices2.Price(i);
                CurrencyUscita(day,i) = Currency2(i); 
           else
               Entrata(day,i) = Prices2.Price(i);
               CurrencyEntrata(day,i) = Currency2(i);
           end
                   
         end
    end   
           
           
           
        
    
    
    
    PortfolioData{day,1} = Dates(day);
    PortfolioData{day,2} = NewInstr;
    PortfolioData{day,3} = NewPricer;
    PortfolioData{day,4} = NewQ;
    PortfolioData{day,5} = NewCurrency;
    PortfolioData{day,6} = NewOptionType;
    PortfolioData{day,7} = NewCallPut;
    PortfolioData{day,8} = NewStrike;
    PortfolioData{day,9} = NewMaturity;
    
    
    end
    
end


   Revenues = Entrata;
   CurrencyRev = CurrencyEntrata;
   Costs = Uscita;
   CurrencyCosts = CurrencyUscita;    

OutputPortfolio = PortfolioData;
end