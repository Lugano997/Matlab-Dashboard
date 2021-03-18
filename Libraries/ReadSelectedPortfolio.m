function [Date, Instruments,Quantities,Pricer, Currency, OptionType, ...
    CallPut, Strike, Maturity] = ReadSelectedPortfolio(Portfolio,idx)

Date = Portfolio{idx,1};
Instruments = Portfolio{idx,2};
Pricer = Portfolio{idx,3};
Quantities = Portfolio{idx,4};
Currency = Portfolio{idx,5};
OptionType = Portfolio{idx,6};
CallPut = Portfolio{idx,7};
Strike = Portfolio{idx,8};
Maturity = Portfolio{idx,9};


end