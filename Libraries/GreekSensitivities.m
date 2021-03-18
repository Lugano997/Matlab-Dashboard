function [Gamma, Delta, Prices, Maturities] =  GreekSensitivities(PriceMatrix, SelettoreSerieNum , SelettoreSerieChar, PortfolioData)

[Instruments,Quantities,Pricer, Currency,~, ~ ,~ , ~] = ReadLatestPortfolio(PortfolioData);

SelectedSerie = PriceMatrix(:,SelettoreSerieNum);
Min = min(SelectedSerie);
Max = max(SelectedSerie);

Prices = linspace(Min,Max,100);
Maturities = 30:30:365;

Idx = Currency == SelettoreSerieChar;
CurrencyInstr = Instruments(Idx);
CurrencyPricer = Pricer(Idx);
CurrencyQuantities = Quantities(Idx);

Gamma = zeros(length(Prices),length(Maturities));
Delta = zeros(length(Prices),length(Maturities));

for i = 1:length(CurrencyInstr)
    MatDa(i) = CurrencyInstr(i).ExerciseDate;
end





for j = 1:length(Prices)
for k = 1:length(Maturities) 
for i = 1:length(CurrencyInstr)
    
    CurrencyInstr(i).ExerciseDate = MatDa(i)  + Maturities(k);
    CurrencyPricer(i).SpotPrice = Prices(j);
    
    
end

[~, ~, PortSens, ~] = pricePortfolio(finportfolio(CurrencyInstr,CurrencyPricer, CurrencyQuantities));
Gamma(j,k) = PortSens.Gamma;
Delta(j,k) = PortSens.Delta;
end
end






end
