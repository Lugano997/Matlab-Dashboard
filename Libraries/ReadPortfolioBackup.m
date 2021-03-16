function [Instruments,Quantities, Pricers, Counter, DelCounter, TestInstr, ShortInstrCounter,LongInstrumentCounter, OptionTypeCatLong, OptionTypeCatShort,...
LongCategoriesQuant,ShortCategoriesQuant,OptionTypeCategoricalGEN, Currency,InstrSens, PortSens, InstrPrice] = ReadPortfolioBackup(PortfolioBackup)

            Instruments = PortfolioBackup{1,1};
            Quantities = PortfolioBackup{2,1};
            Pricers = PortfolioBackup{3,1};
            Counter = PortfolioBackup{4,1};
            DelCounter = PortfolioBackup{5,1};
            TestInstr = PortfolioBackup{6,1};
            ShortInstrCounter = PortfolioBackup{7,1};
            LongInstrumentCounter = PortfolioBackup{8,1};
            OptionTypeCatLong = PortfolioBackup{9,1};
            OptionTypeCatShort = PortfolioBackup{10,1};
            LongCategoriesQuant = PortfolioBackup{11,1};
            ShortCategoriesQuant = PortfolioBackup{12,1};
            OptionTypeCategoricalGEN = PortfolioBackup{13,1};
            Currency = PortfolioBackup{14,1};
            InstrSens = PortfolioBackup{15,1};
            PortSens = PortfolioBackup{16,1};
            InstrPrice = PortfolioBackup{17,1};

end
