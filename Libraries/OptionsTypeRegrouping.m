function [ShortQ, LongQ, LongLabels, ShortLabels] = OptionsTypeRegrouping(CounterLong, CounterShort , LongTypeString, LongTypeQuantities, ShortTypeString, ShortTypeQuantities)


% Creazione Variabili
Labels = ["Vanilla" "Binary" "Barrier" "Lookback"];
cellQuant_Long = {};
LabelsLong =[];
cellQuant_Short = {};
LabelsShort =[];
QLONG = [];
QSHORT = [];
LabelsLong = [];
LabelsShort = [];

% Controllo Presenza strumenti LONG e trasformazione dei dati in vettori
% riga contententi le etichette e le quantità degli strumenti presenti
if CounterLong > 0
    IDXLongVanilla = LongTypeString == "Vanilla";
    IDXLongBarrier = LongTypeString == "Barrier";
    IDXLongBinary = LongTypeString == "Binary";
    IDXLongLookback = LongTypeString == "Lookback";


    QVanillaTemp = LongTypeQuantities(IDXLongVanilla);
    QVanillaLong = sum(QVanillaTemp);
        if QVanillaLong == 0
            QVanillaLong = nan;
        end

    QBinaryTemp = LongTypeQuantities(IDXLongBinary);
    QBinaryLong = sum(QBinaryTemp);
        if QBinaryLong == 0
            QBinaryLong = nan;
        end

    QBarrierTemp = LongTypeQuantities(IDXLongBarrier);
    QBarrierLong = sum(QBarrierTemp);
        if QBarrierLong == 0
            QBarrierLong = nan;
        end

    QLookbackTemp = LongTypeQuantities(IDXLongLookback);
    QLookbackLong = sum(QLookbackTemp);
        if QLookbackLong == 0
            QLookbackLong = nan;
        end

    cellQuant_Long{1} = QVanillaLong;
    cellQuant_Long{2} = QBinaryLong;
    cellQuant_Long{3} = QBarrierLong;
    cellQuant_Long{4} = QLookbackLong;

    for i = 1:4
        if isnan(cellQuant_Long{i}) == 0
            LabelsLong = [LabelsLong Labels(i) ];
        end
    end

    QLONG = [cellQuant_Long{1} cellQuant_Long{2} cellQuant_Long{3} cellQuant_Long{4}];

end

 
% Controllo Presenza strumenti SHORT e trasformazione dei dati in vettori
% riga contententi le etichette e le quantità degli strumenti presenti
if CounterShort > 0
IDXShortVanilla = ShortTypeString == "Vanilla";
IDXShortBarrier = ShortTypeString == "Barrier";
IDXShortBinary = ShortTypeString == "Binary";
IDXShortLookback = ShortTypeString == "Lookback";


QVanillaTemp = ShortTypeQuantities(IDXShortVanilla);
QVanillaShort = sum(QVanillaTemp);
if QVanillaShort == 0
    QVanillaShort = nan;
end

QBinaryTemp = ShortTypeQuantities(IDXShortBinary);
QBinaryShort = sum(QBinaryTemp);
if QBinaryShort == 0
    QBinaryShort = nan;
end

QBarrierTemp = ShortTypeQuantities(IDXShortBarrier);
QBarrierShort = sum(QBarrierTemp);
if QBarrierShort == 0
    QBarrierShort = nan;
end

QLookbackTemp = ShortTypeQuantities(IDXShortLookback);
QLookbackShort = sum(QLookbackTemp);
if QLookbackShort == 0
    QLookbackShort = nan;
end







cellQuant_Short{1} = QVanillaShort;
cellQuant_Short{2} = QBinaryShort;
cellQuant_Short{3} = QBarrierShort;
cellQuant_Short{4} = QLookbackShort;




for i = 1:4
    if isnan(cellQuant_Short{i}) == 0
        LabelsShort = [LabelsShort Labels(i) ];
    end
end

QSHORT = [cellQuant_Short{1} cellQuant_Short{2} cellQuant_Short{3} cellQuant_Short{4}];

end


ShortQ = QSHORT;
LongQ = QLONG;
LongLabels = LabelsLong;
ShortLabels = LabelsShort;


end