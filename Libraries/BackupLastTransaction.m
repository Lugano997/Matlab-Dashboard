function PortfolioBackup =  BackupLastTransaction(Instruments,Quantities, Pricers, Counter, DelCounter, TestInstr, ShortInstrCounter,LongInstrumentCounter, OptionTypeCatLong, OptionTypeCatShort,...
LongCategoriesQuant,ShortCategoriesQuant,OptionTypeCategoricalGEN, Currency,InstrSens, PortSens, InstrPrice)
                    
            PortfolioBackup = {};
            
           PortfolioBackup{1,1} = Instruments;
           PortfolioBackup{2,1} = Quantities;
           PortfolioBackup{3,1} = Pricers;
           PortfolioBackup{4,1}= Counter;
            PortfolioBackup{5,1}= DelCounter;
            PortfolioBackup{6,1}= TestInstr;
            PortfolioBackup{7,1}= ShortInstrCounter;
            PortfolioBackup{8,1}= LongInstrumentCounter;
            PortfolioBackup{9,1} = OptionTypeCatLong;
            PortfolioBackup{10,1}= OptionTypeCatShort;
            PortfolioBackup{11,1}= LongCategoriesQuant;
            PortfolioBackup{12,1}= ShortCategoriesQuant;
            PortfolioBackup{13,1}= OptionTypeCategoricalGEN;
            PortfolioBackup{14,1}= Currency;
            PortfolioBackup{15,1} = InstrSens;
            PortfolioBackup{16,1} = PortSens;
            PortfolioBackup{17,1} =  InstrPrice;
            
end
