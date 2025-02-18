function [Dates ,PortPriceValueTS, CostRevTable] = ProfitLoss(PortfolioData, Revenues, CurrencyRev, DatesRev, Costs, CurrencyCost, DatesCost, CurrencySelected)



for i = 1:size(PortfolioData,1)
    Dates(i,1) = PortfolioData{i,1};



Instruments = PortfolioData{i,2};
Pricer = PortfolioData{i,3};
Quantities = PortfolioData{i,4};
Currency = PortfolioData{i,5};
OptionType = PortfolioData{i,6};
CallPut = PortfolioData{i,7};
Strike = PortfolioData{i,8};
Maturity = PortfolioData{i,9};
    
    CurrencyInstruments = Instruments(Currency == CurrencySelected);
    CurrencyQ = Quantities(Currency == CurrencySelected);
    CurrencyPricer = Pricer(Currency == CurrencySelected);
    
    if isempty(CurrencyInstruments) == 1
        PortPriceValueTS(i,1) = 0;
    else
    TempPortfolio = finportfolio(CurrencyInstruments,CurrencyPricer,CurrencyQ);
    
    PortPrice = pricePortfolio(TempPortfolio);
    
    PortPriceValueTS(i,1) = PortPrice;
    end
end


max = length(unique(DatesRev));
Cazzo = unique(DatesRev);
for i = 1:max
   
    TempDatesIDX = (DatesRev == Cazzo(i));
    RevCurrIdx = (CurrencyRev == CurrencySelected) & (TempDatesIDX);
    if nnz(RevCurrIdx) == 0
        TempRev(i,1) = 0;
    else
        TempRev(i,1) = sum(abs(Revenues(RevCurrIdx)));
    end

end


for i = 1:max
   
    TempDatesIDX = (DatesCost == Cazzo(i));
    CostCurrIdx = (CurrencyCost == CurrencySelected) & (TempDatesIDX);
    if nnz(CostCurrIdx) == 0
        TempCost(i,1) = 0;
    else
        TempCost(i,1) = sum(abs(Costs(CostCurrIdx)));
    end

end



CostRevTable = table();
CostRevTable.Dates = Dates;

for i = 1:size(PortfolioData,1)
    
    
    CostRevTable.Revenues(i) = TempRev(i);
   
    
   
    CostRevTable.Cost(i) = TempCost(i);
    
end



    
end