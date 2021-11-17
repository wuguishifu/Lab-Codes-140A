    function targMap = targDataMap(),

    ;%***********************
    ;% Create Parameter Map *
    ;%***********************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 1;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc paramMap
        ;%
        paramMap.nSections           = nTotSects;
        paramMap.sectIdxOffset       = sectIdxOffset;
            paramMap.sections(nTotSects) = dumSection; %prealloc
        paramMap.nTotData            = -1;

        ;%
        ;% Auto data (rtP)
        ;%
            section.nData     = 10;
            section.data(10)  = dumData; %prealloc

                    ;% rtP.TFwhentau04min_A
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtP.TFwhentau04min_C
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% rtP.TFwhentau1min_A
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% rtP.TFwhentau1min_C
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

                    ;% rtP.TFwhentau3min_A
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 4;

                    ;% rtP.TFwhentau3min_C
                    section.data(6).logicalSrcIdx = 5;
                    section.data(6).dtTransOffset = 5;

                    ;% rtP.A1kWf5sec1_Amp
                    section.data(7).logicalSrcIdx = 6;
                    section.data(7).dtTransOffset = 6;

                    ;% rtP.A1kWf5sec1_Bias
                    section.data(8).logicalSrcIdx = 7;
                    section.data(8).dtTransOffset = 7;

                    ;% rtP.A1kWf5sec1_Freq
                    section.data(9).logicalSrcIdx = 8;
                    section.data(9).dtTransOffset = 8;

                    ;% rtP.A1kWf5sec1_Phase
                    section.data(10).logicalSrcIdx = 9;
                    section.data(10).dtTransOffset = 9;

            nTotData = nTotData + section.nData;
            paramMap.sections(1) = section;
            clear section


            ;%
            ;% Non-auto Data (parameter)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        paramMap.nTotData = nTotData;



    ;%**************************
    ;% Create Block Output Map *
    ;%**************************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 1;
        sectIdxOffset = 0;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc sigMap
        ;%
        sigMap.nSections           = nTotSects;
        sigMap.sectIdxOffset       = sectIdxOffset;
            sigMap.sections(nTotSects) = dumSection; %prealloc
        sigMap.nTotData            = -1;

        ;%
        ;% Auto data (rtB)
        ;%
            section.nData     = 4;
            section.data(4)  = dumData; %prealloc

                    ;% rtB.fn0unh2ha3
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtB.i3f0e0wt1y
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 1;

                    ;% rtB.no4iv1d1om
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 2;

                    ;% rtB.dgrpt01040
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 3;

            nTotData = nTotData + section.nData;
            sigMap.sections(1) = section;
            clear section


            ;%
            ;% Non-auto Data (signal)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        sigMap.nTotData = nTotData;



    ;%*******************
    ;% Create DWork Map *
    ;%*******************
    
        nTotData      = 0; %add to this count as we go
        nTotSects     = 1;
        sectIdxOffset = 1;

        ;%
        ;% Define dummy sections & preallocate arrays
        ;%
        dumSection.nData = -1;
        dumSection.data  = [];

        dumData.logicalSrcIdx = -1;
        dumData.dtTransOffset = -1;

        ;%
        ;% Init/prealloc dworkMap
        ;%
        dworkMap.nSections           = nTotSects;
        dworkMap.sectIdxOffset       = sectIdxOffset;
            dworkMap.sections(nTotSects) = dumSection; %prealloc
        dworkMap.nTotData            = -1;

        ;%
        ;% Auto data (rtDW)
        ;%
            section.nData     = 5;
            section.data(5)  = dumData; %prealloc

                    ;% rtDW.i4nd2wja0w.LoggedData
                    section.data(1).logicalSrcIdx = 0;
                    section.data(1).dtTransOffset = 0;

                    ;% rtDW.eifc5ijtmv.AQHandles
                    section.data(2).logicalSrcIdx = 1;
                    section.data(2).dtTransOffset = 3;

                    ;% rtDW.lornky1dlc.AQHandles
                    section.data(3).logicalSrcIdx = 2;
                    section.data(3).dtTransOffset = 4;

                    ;% rtDW.lzd3oqczul.AQHandles
                    section.data(4).logicalSrcIdx = 3;
                    section.data(4).dtTransOffset = 5;

                    ;% rtDW.fdree3snwc.AQHandles
                    section.data(5).logicalSrcIdx = 4;
                    section.data(5).dtTransOffset = 6;

            nTotData = nTotData + section.nData;
            dworkMap.sections(1) = section;
            clear section


            ;%
            ;% Non-auto Data (dwork)
            ;%


        ;%
        ;% Add final counts to struct.
        ;%
        dworkMap.nTotData = nTotData;



    ;%
    ;% Add individual maps to base struct.
    ;%

    targMap.paramMap  = paramMap;
    targMap.signalMap = sigMap;
    targMap.dworkMap  = dworkMap;

    ;%
    ;% Add checksums to base struct.
    ;%


    targMap.checksum0 = 2724720971;
    targMap.checksum1 = 1380425682;
    targMap.checksum2 = 3633746294;
    targMap.checksum3 = 2249175974;

