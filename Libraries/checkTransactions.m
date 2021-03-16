function TEST = checkTransactions(StartInstruments, TransactionsInstruments,StartCurrency, TransactionCurrency)
%% Insert Currency Selected Data

TEST = zeros(length(TransactionsInstruments),length(StartInstruments));
for i = 1:length(TransactionsInstruments)
    for k = 1:length(StartInstruments)
        if TransactionsInstruments(i)== StartInstruments(k) & TransactionCurrency(i) == StartCurrency(k)
            TEST(i,k) = 1;
        else
            TEST(i,k) = 0;
        end         
    end
end

TEST = logical(TEST);
end