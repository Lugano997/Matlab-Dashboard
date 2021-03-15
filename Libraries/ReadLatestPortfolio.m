function[Instruments,Quantities,Pricer, Currency, OptionType, CallPut, Strike, Maturity] = ReadLatestPortfolio(Portfolio)

Instruments = Portfolio{end,2};
Pricer = Portfolio{end,3};
Quantities = Portfolio{end,4};
Currency = Portfolio{end,5};
OptionType = Portfolio{end,6};
CallPut = Portfolio{end,7};
Strike = Portfolio{end,8};
Maturity = Portfolio{end,9};

end