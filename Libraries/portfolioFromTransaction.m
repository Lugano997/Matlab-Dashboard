function [OutputPortfolio,RevenuesOut,CurrencyRevOut,DatesRevOut,CostsOut,CurrencyCostOut, DatesCostOut] = portfolioFromTransaction(TransactionData,PortfolioData,Revenues,CurrencyRev, DatesRev, Costs, CurrencyCost, DatesCost)
   
    PortLen = size(PortfolioData,1);
    CostLen = size(Costs,1);
    RevLen = size(Revenues,1);
    DateCostLen = size(DatesCost,1);
    DatesRevLen = size(DatesRev,1);
    CurrencyCostLen = size(CurrencyCost,1);
    CurrencyRevLen = size(CurrencyRev,1);
    
    % Ottieni Dati Giorno Precedente
    Date1 = PortfolioData{end,1};
    Instr1 = PortfolioData{end,2};
    Pricer1 = PortfolioData{end,3};
    Q1 = PortfolioData{end,4};
    Currency1 = PortfolioData{end,5};
    OptionType1 = PortfolioData{end,6};
    CallPut1 = PortfolioData{end,7};
    Strike1 = PortfolioData{end,8};
    Maturity1 = PortfolioData{end,9};
    
    %Ottieni dati giorno end
    Date2 = TransactionData{end,1};
    Instr2 = TransactionData{end,2};
    Pricer2 = TransactionData{end,3};
    Q2 = TransactionData{end,4};
    Currency2 = TransactionData{end,5};
    OptionType2 = TransactionData{end,6};
    CallPut2 = TransactionData{end,7};
    Strike2 = TransactionData{end,8};
    Maturity2 = TransactionData{end,9};
    Prices2 = TransactionData{end,10};

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
            if Q2(i) > 0
                Costs(CostLen+i,1) = -Prices2.Price(i);
                CurrencyCost(CurrencyCostLen+i,1) = Currency2(i);
                DatesCost(DateCostLen+i,1) = Date2;
                
                Revenues(RevLen+i,1) = 0;
               CurrencyRev(CurrencyRevLen+i,1) = categorical("NO C");
               DatesRev(DatesRevLen+i,1) = Date2;
            else
               Revenues(RevLen+i,1) = Prices2.Price(i);
               CurrencyRev(CurrencyRevLen+i,1) = Currency2(i);
               DatesRev(DatesRevLen+i,1) = Date2;
               
               Costs(CostLen+i,1) = 0;
                CurrencyCost(CurrencyCostLen+i,1) = categorical("NO C");
                DatesCost(DateCostLen+i,1) = Date2;
            end
            
            
        else if nnz(TEST(i,:)) == 1
           NewQ([TEST(i,:) logical(zeros([1 NewInstADDED_Counter]))]) =  sum([Q1(TEST(i,:)) Q2(i)]);
           
                      if Q2(i) > 0
                Costs(CostLen+i,1) = -Prices2.Price(i);
                CurrencyCost(CurrencyCostLen+i,1) = Currency2(i);
                DatesCost(DateCostLen+i,1) = Date2;
                
                Revenues(RevLen+i,1) = 0;
               CurrencyRev(CurrencyRevLen+i,1) = categorical("NO C");
               DatesRev(DatesRevLen+i,1) = Date2;
            else
               Revenues(RevLen+i,1) = Prices2.Price(i);
               CurrencyRev(CurrencyRevLen+i,1) = Currency2(i);
               DatesRev(DatesRevLen+i,1) = Date2;
               
               Costs(CostLen+i,1) = 0;
                CurrencyCost(CurrencyCostLen+i,1) = categorical("NO C");
                DatesCost(DateCostLen+i,1) = Date2;
            end
            
           
            else if nnz(TEST(i,:)) > 1
                    [~,f] = find(TEST(i,:),length(Instr1));
                    NewZero = zeros([1 length(TEST(i,:))]);
                    NewZero(f(i)) = 1;
                    NewTEST = logical(NewZero);
                    NewQ([ NewTEST logical(zeros([1 NewInstADDED_Counter]))]) =  sum([Q1(NewTEST) Q2(i)]);
                    
                    if Q2(i) > 0
                Costs(CostLen+i,1) = -Prices2.Price(i);
                CurrencyCost(CurrencyCostLen+i,1) = Currency2(i);
                DatesCost(DateCostLen+i,1) = Date2;
                
                Revenues(RevLen+i,1) = 0;
               CurrencyRev(CurrencyRevLen+i,1) = categorical("NO C");
               DatesRev(DatesRevLen+i,1) = Date2;
                    else
               Revenues(RevLen+i,1) = Prices2.Price(i);
               CurrencyRev(CurrencyRevLen+i,1) = Currency2(i);
               DatesRev(DatesRevLen+i,1) = Date2;
               
               Costs(CostLen+i,1) = 0;
                CurrencyCost(CurrencyCostLen+i,1) = categorical("NO C");
                DatesCost(DateCostLen+i,1) = Date2;
                    end
            
                end
            end
        
                   
         end
    end   
           
           
           
        
    
    if Date2 == Date1
             
    PortfolioData{PortLen ,1} = Date2;
    PortfolioData{PortLen ,2} = NewInstr;
    PortfolioData{PortLen ,3} = NewPricer;
    PortfolioData{PortLen ,4} = NewQ;
    PortfolioData{PortLen ,5} = NewCurrency;
    PortfolioData{PortLen ,6} = NewOptionType;
    PortfolioData{PortLen ,7} = NewCallPut;
    PortfolioData{PortLen ,8} = NewStrike;
    PortfolioData{PortLen ,9} = NewMaturity;
    
    else
          
    PortfolioData{PortLen+1,1} = Date2;
    PortfolioData{PortLen+1,2} = NewInstr;
    PortfolioData{PortLen+1,3} = NewPricer;
    PortfolioData{PortLen+1,4} = NewQ;
    PortfolioData{PortLen+1,5} = NewCurrency;
    PortfolioData{PortLen+1,6} = NewOptionType;
    PortfolioData{PortLen+1,7} = NewCallPut;
    PortfolioData{PortLen+1,8} = NewStrike;
    PortfolioData{PortLen+1,9} = NewMaturity;
    
    end

RevenuesOut = Revenues; 
CurrencyCostOut = CurrencyCost;
CurrencyRevOut = CurrencyRev;
DatesRevOut = DatesRev;
DatesCostOut = DatesCost;
CostsOut = Costs;
OutputPortfolio = PortfolioData;
end