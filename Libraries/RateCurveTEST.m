function TEST = RateCurveTEST(EUROCurve,USDCurve, AUDCurve, GBPCurve)


            if isempty(EUROCurve) == 1
                TEST(1) = 0;
            else
                TEST(1) = 1;
            end
            
            if isempty(USDCurve) == 1
                TEST(2) = 0;
            else
                TEST(2) = 1;
            end
            
            if isempty(AUDCurve) == 1
                TEST(3) = 0;
            else
                TEST(3) = 1;
            end
            
            if isempty(GBPCurve) == 1
                TEST(4) = 0;
            else
                TEST(4) = 1;
            end
end