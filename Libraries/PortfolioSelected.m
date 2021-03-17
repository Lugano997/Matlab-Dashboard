function [Dates, TempInstruments, TempPricer, TempQuantities] = PortfolioSelected(CurrencySelected, PortfolioData,idx)
[Date, Instr,QQ, Pricer, Currency] = ReadSelectedPortfolio(PortfolioData,idx);

            
%CREAZIONE PORTAFOGLIO PER RICAVARE LE OPZIONI DENOMINATE NEL TASSO DI
%CAMBIO SELEZIONATO
for i = 1:length(Instr)
Portfolio{1,i} = Instr(i);
Portfolio{2,i} = QQ(i);
Portfolio{3,i} = Pricer(i);
Portfolio{4,i} = string(char(Currency(i)));
Portfolio{5,i} = replace(Portfolio{4,i},["USD/AUD" "EUR/USD" "USD/GBP" "AUD/GBP" "EUR/GBP" "AUD/EUR"],["1" "2" "3" "4" "5" "6"]);
Portfolio{5,i} = str2double(Portfolio{5,i});
end

%VETTORE LOGICO PER IDENTIFICARLE
for i = 1:size(Portfolio,2)
    if Portfolio{5,i} == CurrencySelected
        TESTV(i) = 1;
    else
        TESTV(i) = 0;
    end
end

%CREAZIONE DEL PORTAFOGLIO CON LE OPZIONI RICHIESTE
Temp_Portfolio = Portfolio(1:3,logical(TESTV));

%CONVERSIONE IN UN PORTAFOGLIO CHE PUò ESSERE PREZZATO CON FINPORTFOLIO
for i = 1:size(Temp_Portfolio,2)
    TempInstruments(1,i) = Temp_Portfolio{1,i}; 
    TempQuantities(1,i) = Temp_Portfolio{2,i};
    TempPricer(1,i) = Temp_Portfolio{3,i};
end


Dates = Date;

end
