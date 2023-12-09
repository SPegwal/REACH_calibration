classdef REACHcal

    properties

    end

    properties (SetAccess = private)
        dataPath(1,:) char
        dataPathMS3(1,:) char   % Path to the MS-3 2-port measured data
        

        Nf(1,1) double = 201
        fmin(1,1) double = 50  % in MHz
        fmax(1,1) double = 200 % in MHz

        % Resistors
        r36_vals = [3.8492 21.0167 4.5243 36.8479];
        r36_unitScales = [1e-12,1e-9,1e-12,1];
        r36_max = [20,40,10,38];
        r36_min = [0,0,0,34];
        r36_optFlag = [1,1,1,1];

        r27_vals = [4.4148 24.1903 9.0568 27.3331];
        r27_unitScales = [1e-12,1e-9,1e-12,1];
        r27_max = [20,40,20,29];
        r27_min = [0,0,0,25];
        r27_optFlag = [1,1,1,1];

        r69_vals = [7.2883 36.4569 4.6570 69.9235];
        r69_unitScales = [1e-12,1e-9,1e-12,1];
        r69_max = [20,60,20,72];
        r69_min = [0,0,0,66];
        r69_optFlag = [1,1,1,1];

        r91_vals = [8.3539 49.6584 3.7671 93.1463];
        r91_unitScales = [1e-12,1e-9,1e-12,1];
        r91_max = [20,80,20,95];
        r91_min = [0,0,0,86];
        r91_optFlag = [1,1,1,1];

        rOpen_vals = [3.3378 52.2454 3.7027 391.5123];
        rOpen_unitScales = [1e-12,1e-9,1e-12,1e6];
        rOpen_max = [20,150,20,1000];
        rOpen_min = [0,0,0,5];
        rOpen_optFlag = [1,1,1,1];

        rShort_vals = [7.9373 18.6394 9.9928 0.3677];
        rShort_unitScales = [1e-12,1e-9,1e-12,1];
        rShort_max = [50,80,20,2];
        rShort_min = [0,0,0,0];
        rShort_optFlag = [1,1,1,1];

        r10_vals = [5.3058 20.9861 10.7688 10.3533];
        r10_unitScales = [1e-12,1e-9,1e-12,1];
        r10_max = [20,80,20,11];
        r10_min = [0,0,0,9];
        r10_optFlag = [1,1,1,1];

        r250_vals = [4.5536 21.6320 3.5899 254.1647];
        r250_unitScales = [1e-12,1e-9,1e-12,1];
        r250_max = [20,80,20,270];
        r250_min = [0,0,0,240];
        r250_optFlag = [1,1,1,1];

        rCold_vals = [0.3876 2.0638 0.0537 50.2550];
        rCold_unitScales = [1e-12,1e-9,1e-12,1];
        rCold_max = [1,5,1,51];
        rCold_min = [0,0,0,49];
        rCold_optFlag = [1,1,1,1];

        rHot_vals = [3.7886 9.7978 0.9865 50.8162];
        rHot_unitScales = [1e-12,1e-9,1e-12,1];
        rHot_max = [10,20,10,51];
        rHot_min = [0,0,0,49];
        rHot_optFlag = [1,1,1,1];

        r25_vals = [16.1297 9.6251 5.2162 25.1860];
        r25_unitScales = [1e-12,1e-9,1e-12,1];
        r25_max = [20,80,20,27];
        r25_min = [0,0,0,23];
        r25_optFlag = [1,1,1,1];

        r100_vals = [7.3128e-05 44.9274 2.6004 101.7963];
        r100_unitScales = [1e-12,1e-9,1e-12,1];
        r100_max = [5,100,5,103];
        r100_min = [0,0,0,97];
        r100_optFlag = [1,1,1,1];


        % Cables
        c2_vals = [49.4791 1.9407 0.0214 1.3723 0.0088 0.0093 0.0323 0.6720];
        c2_unitScales = [1,1,1,1,1,1,1,1];
        c2_max = [52,2.1,0.1,1.9,0.1,0.01,0.1,2];
        c2_min = [48,1.9,-0.1,1.3,-0.1,0,-0.1,0];
        c2_optFlag = [1,1,1,1,1,1,1,1].*0;

        c10_vals = [49.7610 9.9198 -0.0118 1.4059 -0.0014 0.0068 0.0074 0.4267];
        c10_unitScales = [1,1,1,1,1,1,1,1];
        c10_max = [52,10.1,0.1,1.5,0.1,0.01,0.1,2];
        c10_min = [48,9.9,-0.1,1.4,-0.1,0,-0.1,0];
        c10_optFlag = [1,1,1,1,1,1,1,1];

        % Mechanical switches
        ms1_vals = [51.7101 13.3335 1.7260 0.0052 4.4804];
        ms1_unitScales = [1,1e-3,1,1,1];
        ms1_max = [52,18,1.9,0.01,10];
        ms1_min = [48,9,1.5,0,0];
        ms1_optFlag = [1,1,1,1,1];

        ms3_vals = [50.0232 13.3749 1.6933 0.0051 4.4749];
        ms3_unitScales = [1,1e-3,1,1,1];
        ms3_max = [52,18,1.9,0.01,10];
        ms3_min = [48,9,1.5,0,0];
        ms3_optFlag = [1,1,1,1,1];

        ms4_vals = [50.0232 13.3749 1.6933 0.0051 4.4749];
        ms4_unitScales = [1,1e-3,1,1,1];
        ms4_max = [53,20,1.9,0.01,10];
        ms4_min = [47,9,1.5,0,0];
        ms4_optFlag = [1,1,1,1,1];

        mts_vals = [50.9304 113.2259 1.6351 0.0059 3.9662];
        mts_unitScales = [1,1e-3,1,1,1];
        mts_max = [52,140,1.9,0.01,10];
        mts_min = [48,100,1.5,0,0];
        mts_optFlag = [1,1,1,1,1];

        % Semi-ridged links
        sr_mtsj2_vals = [48.4377 125.1712 2.0504 2.5188e-04 0.9629];
        sr_mtsj2_unitScales = [1,1e-3,1,1,1];
        sr_mtsj2_max = [52,130,2.1,0.0005,2];
        sr_mtsj2_min = [48,120,2.0,0,0];
        sr_mtsj2_optFlag = [1,1,1,1,1];

        sr_mtsj1_vals = [49.2178 124.9098 2.0459 2.5273e-04 1.0101];
        sr_mtsj1_unitScales = [1,1e-3,1,1,1];
        sr_mtsj1_max = [52,130,2.1,0.0005,2];
        sr_mtsj1_min = [48,120,2.0,0,0];
        sr_mtsj1_optFlag = [1,1,1,1,1];

        sr_ms1j2_vals = [54.4476 114.7614 2.0523 2.9177e-04 1.0598];
        sr_ms1j2_unitScales = [1,1e-3,1,1,1];
        sr_ms1j2_max = [55,130,2.1,0.0005,2];
        sr_ms1j2_min = [48,110,2.0,0,0];
        sr_ms1j2_optFlag = [1,1,1,1,1];

%         sr_mtsj2_vals = [48.8300 125.1396 0.0015 2.0486 -5.7059e-04 2.5002e-04 -9.5231e-05 0.9733];
%         sr_mtsj2_unitScales = [1,1e-3,1,1,1,1,1,1];
%         sr_mtsj2_max = [52,140,0.1,2.1,0.1,0.0005,0.1,2];
%         sr_mtsj2_min = [48,110,-0.1,2.0,-0.1,0,-0.1,0];
%         sr_mtsj2_optFlag = [1,1,1,1,1,1,1,1];
% 
%         sr_mtsj1_vals = [49.4063 125.0864 -8.4874e-04 2.0482 -0.0069 2.5001e-04 -7.5998e-05 0.9702];
%         sr_mtsj1_unitScales = [1,1e-3,1,1,1,1,1,1];
%         sr_mtsj1_max = [52,140,0.1,2.1,0.1,0.0005,0.1,2];
%         sr_mtsj1_min = [48,110,-0.1,2.0,-0.1,0,-0.1,0];
%         sr_mtsj1_optFlag = [1,1,1,1,1,1,1,1];

        % Adaptors (not used at present)
        a_ms3_vals = [1.2110 0.0845 0.6999];
        a_ms3_unitScales = [1e-12 1e-9 1e-12];
        a_ms3_max = [3 1 2];
        a_ms3_min = [0 0 0];
        a_ms3_optFlag = [1 1 1];

        a_ms1j7_vals = [1.2110 0.0845 0.6999];
        a_ms1j7_unitScales = [1e-12 1e-9 1e-12];
        a_ms1j7_max = [3 1 2];
        a_ms1j7_min = [0 0 0];
        a_ms1j7_optFlag = [1 1 1];

        a_ms1_vals = [0 0 0] + eps;
        a_ms1_unitScales = [1e-12 1e-9 1e-12];
        a_ms1_max = [3 1 2];
        a_ms1_min = [0 0 0];
        a_ms1_optFlag = [1 1 1];

        % Measured Data
        S11_meas_c12r36
        S11_meas_c12r27
        S11_meas_c12r69
        S11_meas_c12r91
        S11_meas_c25open
        S11_meas_c25short
        S11_meas_c25r10
        S11_meas_c25r250
        S11_meas_cold
        S11_meas_hot
        S11_meas_r25
        S11_meas_r100

        S_meas_MS3_J1
        S_meas_MS3_J2
        S_meas_MS3_J3
        S_meas_MS3_J4

        

    end

    properties (SetAccess = private, Hidden = true)
        % Optimization book-keeping
        optVect_Nvars(1,:) double {mustBeInteger,mustBeNonnegative}
        optVect_Ne(1,1) double {mustBeInteger,mustBePositive} = 10
        optW_RIA(1,2) double {mustBeNonnegative} = [2 1]   % Weights of the real-imag and dB20 differences in the error functions
        optW(1,:) double {mustBeNonnegative} = [1 1 1 1 1 1 1 1 1 1 1 1]
        
    end

    properties (Dependent = true)
        freq(1,:) double
        r36(1,1) struct
        r27(1,1) struct
        r69(1,1) struct
        r91(1,1) struct
        rOpen(1,1) struct
        rShort(1,1) struct
        r10(1,1) struct
        r250(1,1) struct
        rCold(1,1) struct
        rHot(1,1) struct
        r25(1,1) struct
        r100(1,1) struct
        c2(1,1) struct
        c10(1,1) struct
        ms1(1,1) struct
        ms3(1,1) struct
        ms4(1,1) struct
        mts(1,1) struct
        sr_mtsj2(1,1) struct
        sr_mtsj1(1,1) struct
        sr_ms1j2(1,1) struct
        a_ms3(1,1) struct
        a_ms1j7(1,1) struct
        a_ms1(1,1) struct

        Sr36(1,1) struct
        Sr27(1,1) struct
        Sr69(1,1) struct
        Sr91(1,1) struct
        SrOpen(1,1) struct
        SrShort(1,1) struct
        Sr10(1,1) struct
        Sr250(1,1) struct
        SrCold(1,1) struct
        SrHot(1,1) struct
        Sr25(1,1) struct
        Sr100(1,1) struct

    end

    properties (Dependent = true, Hidden = true)
        freqHz

        optStruct
        err_source_r36
        err_source_r27
        err_source_r69
        err_source_r91
        err_source_rOpen
        err_source_rShort
        err_source_r10
        err_source_r250
        err_source_rCold
        err_source_rHot
        err_source_r25
        err_source_r100

        % Lower level error functions
        err_ms3


    end

    properties (Constant = true)
        sourceNames = {'cold','hot','r25','r100','c12r27','c12r36','c12r69','c12r91','c25open','c25short','c25r10','c25r250'}
        freqUnit = 'MHz'

        rVarNames = {'C1','L1','C2','R'};
        cVarNames = {'Z0','L','eps_r_slope','eps_r_const','tan_d_slope','tan_d_const','r_prime_slope','r_prime_const'};
        cShortVarNames = {'Z0','L','eps_r','tan_d','r_prime'};
        adaptVarNames = {'C1','L1','C2'};

        optVectElements = {'r36','r27','r69','r91','rOpen','rShort','r10','r250','rCold','rHot','r25','r100','ms1','ms3','ms4','mts','sr_mtsj1','sr_mtsj2','sr_ms1j2','c2','c10'};
        optErrElements = {'r36','r27','r69','r91','rOpen','rShort','r10','r250','rCold','rHot','r25','r100'};
    end

    methods
        function obj = REACHcal(dataPath)
            % REACHcal constructor function

            p = mfilename("fullpath");
            if nargin < 1 || isempty(dataPath)
                obj.dataPath = [fileparts(p),'\..\data\calibration\'];
            else
                obj.dataPath = dataPath;
            end
            % MS3 dataPath
            obj.dataPathMS3 = [fileparts(p),'\..\data\MS-3\'];

            % Read the data
            obj.S11_meas_c12r36 = obj.readSourceS11('c12r36');
            obj.S11_meas_c12r27 = obj.readSourceS11('c12r27');
            obj.S11_meas_c12r69 = obj.readSourceS11('c12r69');
            obj.S11_meas_c12r91 = obj.readSourceS11('c12r91');
            obj.S11_meas_c25r10 = obj.readSourceS11('c25r10');
            obj.S11_meas_c25r250 = obj.readSourceS11('c25r250');
            obj.S11_meas_c25open = obj.readSourceS11('c25open');
            obj.S11_meas_c25short = obj.readSourceS11('c25short');
            obj.S11_meas_cold = obj.readSourceS11('cold');
            obj.S11_meas_hot = obj.readSourceS11('hot');
            obj.S11_meas_r25 = obj.readSourceS11('r25');
            obj.S11_meas_r100 = obj.readSourceS11('r100');

            % Read the MS3 data - only for the active through paths
            obj.S_meas_MS3_J1 = TwoPort.readTouchStone([obj.dataPathMS3,'P2_J1\J1_ON.s2p'],2,obj.freqHz);
            obj.S_meas_MS3_J2 = TwoPort.readTouchStone([obj.dataPathMS3,'P2_J2\J2_ON.s2p'],2,obj.freqHz);
            obj.S_meas_MS3_J3 = TwoPort.readTouchStone([obj.dataPathMS3,'P2_J3\J3_ON.s2p'],2,obj.freqHz);
            obj.S_meas_MS3_J4 = TwoPort.readTouchStone([obj.dataPathMS3,'P2_J4\J4_ON.s2p'],2,obj.freqHz);
%             obj.S_meas_MS3_J1 = TwoPort.readTouchStone([obj.dataPathMS3,'P2_J1\J1_ON.s2p']);
%             obj.S_meas_MS3_J2 = TwoPort.readTouchStone([obj.dataPathMS3,'P2_J2\J2_ON.s2p']);
%             obj.S_meas_MS3_J3 = TwoPort.readTouchStone([obj.dataPathMS3,'P2_J3\J3_ON.s2p']);
%             obj.S_meas_MS3_J4 = TwoPort.readTouchStone([obj.dataPathMS3,'P2_J4\J4_ON.s2p']);
            obj.S_meas_MS3_J1 = obj.S_meas_MS3_J1.freqChangeUnit(obj.freqUnit);
            obj.S_meas_MS3_J2 = obj.S_meas_MS3_J2.freqChangeUnit(obj.freqUnit);
            obj.S_meas_MS3_J3 = obj.S_meas_MS3_J3.freqChangeUnit(obj.freqUnit);
            obj.S_meas_MS3_J4 = obj.S_meas_MS3_J4.freqChangeUnit(obj.freqUnit);



            % Set up optimization preliminaries
            obj.optVect_Ne = length(obj.optVectElements);
            % First get the number of variables in the full vector
            obj.optVect_Nvars = zeros(1,obj.optVect_Ne);
            for ii = 1:obj.optVect_Ne
                obj.optVect_Nvars(ii) = length(obj.(obj.optVectElements{ii}).vals);
            end 
            
        end

        % Dependent getters
        function freq = get.freq(obj)
            freq = linspace(obj.fmin,obj.fmax,obj.Nf);
        end

        function freqHz = get.freqHz(obj)
            freqHz = obj.freq.*1e6;
        end

        function r36 = get.r36(obj)
            r36 = obj.buildRstruct(obj.r36_vals,obj.r36_unitScales,obj.r36_max,obj.r36_min,obj.r36_optFlag);
        end

        function r27 = get.r27(obj)
            r27 = obj.buildRstruct(obj.r27_vals,obj.r27_unitScales,obj.r27_max,obj.r27_min,obj.r27_optFlag);
        end

        function r69 = get.r69(obj)
            r69 = obj.buildRstruct(obj.r69_vals,obj.r69_unitScales,obj.r69_max,obj.r69_min,obj.r69_optFlag);
        end

        function r91 = get.r91(obj)
            r91 = obj.buildRstruct(obj.r91_vals,obj.r91_unitScales,obj.r91_max,obj.r91_min,obj.r91_optFlag);
        end

        function rOpen = get.rOpen(obj)
            rOpen = obj.buildRstruct(obj.rOpen_vals,obj.rOpen_unitScales,obj.rOpen_max,obj.rOpen_min,obj.rOpen_optFlag);
        end

        function rShort = get.rShort(obj)
            rShort = obj.buildRstruct(obj.rShort_vals,obj.rShort_unitScales,obj.rShort_max,obj.rShort_min,obj.rShort_optFlag);
        end

        function r10 = get.r10(obj)
            r10 = obj.buildRstruct(obj.r10_vals,obj.r10_unitScales,obj.r10_max,obj.r10_min,obj.r10_optFlag);
        end

        function r250 = get.r250(obj)
            r250 = obj.buildRstruct(obj.r250_vals,obj.r250_unitScales,obj.r250_max,obj.r250_min,obj.r250_optFlag);
        end

        function rCold = get.rCold(obj)
            rCold = obj.buildRstruct(obj.rCold_vals,obj.rCold_unitScales,obj.rCold_max,obj.rCold_min,obj.rCold_optFlag);
        end

        function rHot = get.rHot(obj)
            rHot = obj.buildRstruct(obj.rHot_vals,obj.rHot_unitScales,obj.rHot_max,obj.rHot_min,obj.rHot_optFlag);
        end

        function r25 = get.r25(obj)
            r25 = obj.buildRstruct(obj.r25_vals,obj.r25_unitScales,obj.r25_max,obj.r25_min,obj.r25_optFlag);
        end

        function r100 = get.r100(obj)
            r100 = obj.buildRstruct(obj.r100_vals,obj.r100_unitScales,obj.r100_max,obj.r100_min,obj.r100_optFlag);
        end

        function c2 = get.c2(obj)
            c2 = obj.buildCableStruct(obj.c2_vals,obj.c2_unitScales,obj.c2_max,obj.c2_min,obj.c2_optFlag);
        end

        function c10 = get.c10(obj)
            c10 = obj.buildCableStruct(obj.c10_vals,obj.c10_unitScales,obj.c10_max,obj.c10_min,obj.c10_optFlag);
        end

        function ms1 = get.ms1(obj)
            ms1 = obj.buildShortCableStruct(obj.ms1_vals,obj.ms1_unitScales,obj.ms1_max,obj.ms1_min,obj.ms1_optFlag);
        end

        function ms3 = get.ms3(obj)
            ms3 = obj.buildShortCableStruct(obj.ms3_vals,obj.ms3_unitScales,obj.ms3_max,obj.ms3_min,obj.ms3_optFlag);
        end

        function ms4 = get.ms4(obj)
            ms4 = obj.buildShortCableStruct(obj.ms4_vals,obj.ms4_unitScales,obj.ms4_max,obj.ms4_min,obj.ms4_optFlag);
        end

        function mts = get.mts(obj)
            mts = obj.buildShortCableStruct(obj.mts_vals,obj.mts_unitScales,obj.mts_max,obj.mts_min,obj.mts_optFlag);
        end

        function sr_mtsj1 = get.sr_mtsj1(obj)
            sr_mtsj1 = obj.buildShortCableStruct(obj.sr_mtsj1_vals,obj.sr_mtsj1_unitScales,obj.sr_mtsj1_max,obj.sr_mtsj1_min,obj.sr_mtsj1_optFlag);
%             sr_mtsj1 = obj.buildCableStruct(obj.sr_mtsj1_vals,obj.sr_mtsj1_unitScales,obj.sr_mtsj1_max,obj.sr_mtsj1_min,obj.sr_mtsj1_optFlag);
        end

        function sr_mtsj2 = get.sr_mtsj2(obj)
            sr_mtsj2 = obj.buildShortCableStruct(obj.sr_mtsj2_vals,obj.sr_mtsj2_unitScales,obj.sr_mtsj2_max,obj.sr_mtsj2_min,obj.sr_mtsj2_optFlag);
%             sr_mtsj2 = obj.buildCableStruct(obj.sr_mtsj2_vals,obj.sr_mtsj2_unitScales,obj.sr_mtsj2_max,obj.sr_mtsj2_min,obj.sr_mtsj2_optFlag);
        end

        function sr_ms1j2 = get.sr_ms1j2(obj)
            sr_ms1j2 = obj.buildShortCableStruct(obj.sr_ms1j2_vals,obj.sr_ms1j2_unitScales,obj.sr_ms1j2_max,obj.sr_ms1j2_min,obj.sr_ms1j2_optFlag);
        end

        function a_ms3 = get.a_ms3(obj)
            a_ms3 = obj.buildAdaptStruct(obj.a_ms3_vals,obj.a_ms3_unitScales,obj.a_ms3_max,obj.a_ms3_min,obj.a_ms3_optFlag);
        end

        function a_ms1j7 = get.a_ms1j7(obj)
            a_ms1j7 = obj.buildAdaptStruct(obj.a_ms1j7_vals,obj.a_ms1j7_unitScales,obj.a_ms1j7_max,obj.a_ms1j7_min,obj.a_ms1j7_optFlag);
        end

        function a_ms1 = get.a_ms1(obj)
            a_ms1 = obj.buildAdaptStruct(obj.a_ms1_vals,obj.a_ms1_unitScales,obj.a_ms1_max,obj.a_ms1_min,obj.a_ms1_optFlag);
        end
        
        function Sr36 = get.Sr36(obj)
            Sr36 = obj.buildSourceStruct({'sr_mtsj1','mts','sr_mtsj2','ms1','c2','ms3','r36'});
        end

        function Sr27 = get.Sr27(obj)
            Sr27 = obj.buildSourceStruct({'sr_mtsj1','mts','sr_mtsj2','ms1','c2','ms3','r27'});
        end

        function Sr69 = get.Sr69(obj)
            Sr69 = obj.buildSourceStruct({'sr_mtsj1','mts','sr_mtsj2','ms1','c2','ms3','r69'});
        end

        function Sr91 = get.Sr91(obj)
            Sr91 = obj.buildSourceStruct({'sr_mtsj1','mts','sr_mtsj2','ms1','c2','ms3','r91'});
        end

        function SrOpen = get.SrOpen(obj)
            SrOpen = obj.buildSourceStruct({'sr_mtsj1','mts','sr_mtsj2','ms1','c10','ms4','rOpen'});
        end

        function SrShort = get.SrShort(obj)
            SrShort = obj.buildSourceStruct({'sr_mtsj1','mts','sr_mtsj2','ms1','c10','ms4','rShort'});
        end

        function Sr10 = get.Sr10(obj)
            Sr10 = obj.buildSourceStruct({'sr_mtsj1','mts','sr_mtsj2','ms1','c10','ms4','r10'});
        end

        function Sr250 = get.Sr250(obj)
            Sr250 = obj.buildSourceStruct({'sr_mtsj1','mts','sr_mtsj2','ms1','c10','ms4','r250'});
        end

        function SrCold = get.SrCold(obj)
            SrCold = obj.buildSourceStruct({'sr_mtsj1','mts','sr_mtsj2','ms1','rCold'});
        end

        function SrHot = get.SrHot(obj)
            SrHot = obj.buildSourceStruct({'sr_mtsj1','mts','sr_mtsj2','ms1','sr_ms1j2','rHot'});
        end

        function Sr25 = get.Sr25(obj)
            Sr25 = obj.buildSourceStruct({'sr_mtsj1','mts','sr_mtsj2','ms1','r25'});
        end

        function Sr100 = get.Sr100(obj)
            Sr100 = obj.buildSourceStruct({'sr_mtsj1','mts','sr_mtsj2','ms1','r100'});
        end

        function err_source_r36 = get.err_source_r36(obj)
            err_source_r36 = obj.errRIA(obj.S11_meas_c12r36,obj.Sr36.network.getS.d11);
        end

        function err_source_r27 = get.err_source_r27(obj)
            err_source_r27 = obj.errRIA(obj.S11_meas_c12r27,obj.Sr27.network.getS.d11);
        end

        function err_source_r69 = get.err_source_r69(obj)
            err_source_r69 = obj.errRIA(obj.S11_meas_c12r69,obj.Sr69.network.getS.d11);
        end

        function err_source_r91 = get.err_source_r91(obj)
            err_source_r91 = obj.errRIA(obj.S11_meas_c12r91,obj.Sr91.network.getS.d11);
        end

        function err_source_rOpen = get.err_source_rOpen(obj)
            err_source_rOpen = obj.errRIA(obj.S11_meas_c25open,obj.SrOpen.network.getS.d11);
        end

        function err_source_rShort = get.err_source_rShort(obj)
            err_source_rShort = obj.errRIA(obj.S11_meas_c25short,obj.SrShort.network.getS.d11);
        end

        function err_source_r10 = get.err_source_r10(obj)
            err_source_r10 = obj.errRIA(obj.S11_meas_c25r10,obj.Sr10.network.getS.d11);
        end

        function err_source_r250 = get.err_source_r250(obj)
            err_source_r250 = obj.errRIA(obj.S11_meas_c25r250,obj.Sr250.network.getS.d11);
        end

        function err_source_rCold = get.err_source_rCold(obj)
            err_source_rCold = obj.errRIA(obj.S11_meas_cold,obj.SrCold.network.getS.d11);
        end

        function err_source_rHot = get.err_source_rHot(obj)
            err_source_rHot = obj.errRIA(obj.S11_meas_hot,obj.SrHot.network.getS.d11);
        end

        function err_source_r25 = get.err_source_r25(obj)
            err_source_r25 = obj.errRIA(obj.S11_meas_r25,obj.Sr25.network.getS.d11);
        end

        function err_source_r100 = get.err_source_r100(obj)
            err_source_r100 = obj.errRIA(obj.S11_meas_r100,obj.Sr100.network.getS.d11);
        end

        function err_ms3 = get.err_ms3(obj)
%             obj.Nf = length(obj.S_meas_MS3_J1.freq);
%             obj.fmin = min(obj.S_meas_MS3_J1.freqHz)./1e6;
%             obj.fmax = max(obj.S_meas_MS3_J1.freqHz)./1e6;
            meas21 = obj.S_meas_MS3_J1.d21;
            mod21 = obj.ms3.network.getS.d21;
            err_ms3 = sqrt(sum(abs(meas21 - mod21).^2))./obj.Nf;
        end

        function optStruct = get.optStruct(obj)
            valMat = zeros(4,sum(obj.optVect_Nvars));
            for ii = 1:obj.optVect_Ne
                element_ = obj.(obj.optVectElements{ii});
                valMat(:,(sum(obj.optVect_Nvars(1:(ii-1)))+1):sum(obj.optVect_Nvars(1:ii))) = [element_.vals; ...
                    element_.max; ...
                    element_.min; ...
                    element_.optFlag];
            end
            optStruct.vals = valMat(1,:);
            optStruct.max = valMat(2,:);
            optStruct.min = valMat(3,:);
            optStruct.optFlag = valMat(4,:);
        end

        % Measurement data
        function [S11,freq] = readSourceS11(obj,sourceName,interpFlag)
            % READSOURCES11 returns the measured source S11 in a vector
            % Also interpolates onto the object frequencies

            if nargin < 3 || isempty(interpFlag), interpFlag = true; end

            assert(ismember(sourceName,obj.sourceNames),'Unknown source name - check REACHcal.sourceNames')
            [S11,freq] = touchread([obj.dataPath,sourceName,'\',sourceName,'.s1p']);
            S11 = squeeze(S11(1,1,:));
            if interpFlag
                S11 = interp1(freq,S11,obj.freqHz,'linear');
                freq = obj.freqHz;
            end
        end

        % Optimization
        function obj = optimConfig(obj,configName,optElements,errElements)
            % OPTIMCONFIG configures the optimization routine settings

            % Start with all false
            optFlagVect = zeros(1,sum(obj.optVect_Nvars));
            for ii = 1:obj.optVect_Ne
                obj.([obj.optVectElements{ii},'_optFlag']) = optFlagVect((sum(obj.optVect_Nvars(1:(ii-1)))+1):sum(obj.optVect_Nvars(1:ii)));
            end
            obj.optW = obj.optW.*0;

            switch lower(configName)
                case {'r36'}
                    optElements = obj.Sr36.elements;
                    errElements = {'r36'};
                case {'r27'}
                    optElements = obj.Sr27.elements;
                    errElements = {'r27'};
                case {'r69'}
                    optElements = obj.Sr69.elements;
                    errElements = {'r69'};
                case {'r91'}
                    optElements = obj.Sr91.elements;
                    errElements = {'r91'};
                case {'ropen','open'}
                    optElements = obj.SrOpen.elements;
                    errElements = {'rOpen'};
                case {'rshort','short'}
                    optElements = obj.SrShort.elements;
                    errElements = {'rShort'};
                case {'r10'}
                    optElements = obj.Sr10.elements;
                    errElements = {'r10'};
                case {'r250'}
                    optElements = obj.Sr250.elements;
                    errElements = {'r250'};
                case {'rcold'}
                    optElements = obj.SrCold.elements;
                    errElements = {'rCold'};
                case {'rhot'}
                    optElements = obj.SrHot.elements;
                    errElements = {'rHot'};
                case {'r25'}
                    optElements = obj.Sr25.elements;
                    errElements = {'r25'};
                case {'r100'}
                    optElements = obj.Sr100.elements;
                    errElements = {'r100'};
                case {'ms3set'}
                    optElements = {'r36','r27','r69','r91','ms3','c2','ms1','sr_mtsj2','mts','sr_mtsj1'};
                    errElements = {'r36','r27','r69','r91'};
                case {'ms3set_lim'}
                    optElements = {'r36','r27','r69','r91','ms3','c2'};
                    errElements = {'r36','r27','r69','r91'};
                case {'ms4set'}
                    optElements = {'rOpen','rShort','r10','r250','ms4','c10','ms1','sr_mtsj2','mts','sr_mtsj1'};
                    errElements = {'rOpen','rShort','r10','r250'};
                case {'ms4set_lim'}
                    optElements = {'rOpen','rShort','r10','r250','ms4','c10','ms1'};
                    errElements = {'rOpen','rShort','r10','r250'};
                case {'ms4set_lim_10_250'}
                    optElements = {'r10','r250','ms4','c10'};
                    errElements = {'r10','r250'};
                
                case 'custom'
                    assert(all(contains(optElements,obj.optVectElements)),'Found unknown optElement - please check')
                    assert(all(contains(errElements,obj.optErrElements)),'Found unknown errElement - please check')
                otherwise
                    error(['Unknown configName: ',configName])
            end

            for ii = 1:length(optElements)
                obj.([optElements{ii},'_optFlag']) = ones(1,length(obj.([optElements{ii},'_optFlag'])));
            end

            for jj = 1:length(errElements)
                obj.optW = obj.optW | strcmp(errElements{jj},obj.optErrElements);
            end
           

        end

        function obj = fitParams(obj,solver,options)
            % FITPARAMS is the main fitting optimization function

            if nargin < 2 || isempty(solver), solver = 'fmincon'; end

            idx = find(obj.optStruct.optFlag == 1);
            X0 = obj.optStruct.vals(idx);
            LB = obj.optStruct.min(idx);
            UB = obj.optStruct.max(idx);

            switch solver
                case 'fmincon'
                    if nargin < 3 || isempty(options), options = optimoptions('fmincon','display','iter','MaxFunctionEvaluations',10000); end
                    optVals = fmincon(@(x) errFunc(obj,x),X0,[],[],[],[],LB,UB,[],options);
                case 'ga'
                    if nargin < 3 || isempty(options), options = optimoptions('ga','display','iter'); end
                    optVals = ga(@(x) errFunc(obj,x),length(X0),[],[],[],[],LB,UB,[],options);
                otherwise
                    error(['Unknown solver: ',solver]);
            end

            [~,obj] = obj.errFunc(optVals);
        end

        function [err,obj] = errFunc(obj,x)
            % ERRFUNC is the fitting optimization error function

            X = obj.optStruct.vals;
            X(obj.optStruct.optFlag == 1) = x;

            for ii = 1:obj.optVect_Ne
                obj.([obj.optVectElements{ii},'_vals']) = X((sum(obj.optVect_Nvars(1:(ii-1)))+1):sum(obj.optVect_Nvars(1:ii)));
            end

            Ne = length(obj.optW);
            eV = zeros(Ne,1);
            for ii = 1:Ne
                eV(ii) = obj.(['err_source_',obj.optErrElements{ii}]);
            end
            
            w = obj.optW./norm(obj.optW,1);
            err = w*eV;
        end

        function obj = fitMS3(obj)
            % FITMS3 is a componennt-level function to fit the MS3 model

            X0 = obj.ms3_vals;
            LB = obj.ms3_min;
            UB = obj.ms3_max;
            options = optimoptions('fmincon','display','iter','MaxIterations',1000);
            optVals = fmincon(@(x) errFuncMS3(obj,x),X0,[],[],[],[],LB,UB,[],options);
            [~,obj] = errFuncMS3(obj,optVals);

            function [err, obj] = errFuncMS3(obj,x)
                obj.ms3_vals = x;
                err = obj.err_ms3;
            end
        end


        % Plotting
        function plotCablePars(obj,cVals,cUnitScales)
            % PLOTCABLEPARS Plots the requested cable parameters over frequency

            [Z0,L,~,eps_r,tan_delta,r_prime] = getCablePars(obj,cVals,cUnitScales);

            figure
            subplot 411
            if length(Z0) == 1, Z0 = ones(1,obj.Nf).*Z0; end
            plot(obj.freq,Z0,'k'), grid on
            ylabel('Z_0 (\Omega)')
            title(['L = ',num2str(L),' m'])

            subplot 412
            if length(eps_r) == 1, eps_r = ones(1,obj.Nf).*eps_r; end
            plot(obj.freq,eps_r,'k'), grid on
            ylabel('\epsilon_r')

            subplot 413
            if length(tan_delta) == 1, tan_delta = ones(1,obj.Nf).*tan_delta; end
            plot(obj.freq,tan_delta,'k'), grid on
            ylabel('tan(\delta)')

            subplot 414
            if length(r_prime) == 1, r_prime = ones(1,obj.Nf).*r_prime; end
            plot(obj.freq,r_prime,'k'), grid on
            ylabel("R' (\Omega/m)")
        end

%         function plotSourceModels(obj)
%             % PLOTSOURCEMODELS plots all the current source models with measured data
% 
%             Svect = [obj.Sr36,obj.Sr27,obj.Sr69,obj.Sr91];
%             measVect = {obj.S11_meas_c12r36,obj.S11_meas_c12r27,obj.S11_meas_c12r69,obj.S11_meas_c12r91};
%             nameVect = {'r36','r27','r69','r91'};
% 
%             for ii = 1:length(Svect)
%                 figure
%                 subplot(2,2,1:2)
%                 Svect(ii).network.getS.plot11dB
%                 plot(obj.freq,dB20(measVect{ii}),'r--')
%                 title(nameVect{ii})
%                 subplot(2,2,3)
%                 Svect(ii).network.getS.plot11real
%                 plot(obj.freq,real(measVect{ii}),'r--')
%                 subplot(2,2,4)
%                 Svect(ii).network.getS.plot11imag
%                 plot(obj.freq,imag(measVect{ii}),'r--')
%             end
%         end

        function plotSourceAllS11(obj,plotFlag,style)
            % PLOTSOURCEALLS11 plots all the S11 responses on the current figure

            % plotFlag: 1 = model; 2 = measure; 3 = both

            if nargin < 2 || isempty(plotFlag), plotFlag = 3; end
            if nargin < 3 || isempty(style), style = 'k'; end

            Svect = [obj.Sr36,obj.Sr27,obj.Sr69,obj.Sr91,...
                    obj.SrOpen,obj.SrShort,obj.Sr10,obj.Sr250,...
                    obj.SrCold,obj.SrHot,obj.Sr25,obj.Sr100];
            measVect = {obj.S11_meas_c12r36,obj.S11_meas_c12r27,obj.S11_meas_c12r69,obj.S11_meas_c12r91,...
                obj.S11_meas_c25open,obj.S11_meas_c25short,obj.S11_meas_c25r10,obj.S11_meas_c25r250,...
                obj.S11_meas_cold,obj.S11_meas_hot,obj.S11_meas_r25,obj.S11_meas_r100};
            nameVect = {'r36','r27','r69','r91','Open','Short','r10','r250','cold','hot','r25','r100'};

            if ~iscell(style), style = {style,style}; end
            if plotFlag == 3, style = {'r','k'}; end

            for ii = 1:length(Svect)
                row1 = floor((ii-1)/4);
                col1 = mod((ii-1),4);
                subplot(8,8,(2*row1*8 + [1:2] + 2*col1))
                grid on, hold on
                if mod(plotFlag,2) ~= 0, Svect(ii).network.getS.plot11dB(style{1}); end
                if plotFlag > 1, plot(obj.freq,dB20(measVect{ii}),style{2}); end
                title(nameVect{ii})
                subplot(8,8,((2*row1+1)*8 + 1 + 2*col1))
                grid on, hold on
                if mod(plotFlag,2) ~= 0, Svect(ii).network.getS.plot11real(style{1}); end
                if plotFlag > 1, plot(obj.freq,real(measVect{ii}),style{2}); end
                subplot(8,8,((2*row1+1)*8 + 2 + 2*col1))
                grid on, hold on
                if mod(plotFlag,2) ~= 0, Svect(ii).network.getS.plot11imag(style{1}); end
                if plotFlag > 1, plot(obj.freq,imag(measVect{ii}),style{2}); end
            end
        end

        function plotAllParameters(obj,style)
            % PLOTALLPARAMETERS plots the full set of normalised model parameters

            if nargin < 2 || isempty(style), style = 'k*'; end

            y = (obj.optStruct.vals - obj.optStruct.min)./(obj.optStruct.max - obj.optStruct.min);
            plot(y,style), grid on, hold on

            xTicLab = cell(1,sum(obj.optVect_Nvars));
            for ii = 1:obj.optVect_Ne
                if mod(ii,2) == 0, cScale = 0.8; else, cScale = 0.2; end 
                x_start = sum(obj.optVect_Nvars(1:ii-1)) + 0.5;
                x_stop = sum(obj.optVect_Nvars(1:ii)) + 0.5;
                p = patch([x_start x_stop x_stop x_start],[0 0 1 1],[1 1 1].*cScale);
                p.FaceAlpha = 0.3;
                p.EdgeColor = 'none';

                switch lower(obj.optVectElements{ii}(1))
                    case 'r'
                        labels = obj.rVarNames;
                    case {'m','s'}
                        labels = obj.cShortVarNames;
                    case {'c'}
                        labels = obj.cVarNames;
                    case 'a'
                        labels = obj.adaptVarNames;
                end

                for jj = 1:length(labels)
                    labels{jj} = strrep(labels{jj},'_','\_');
                end

                xTicLab(x_start+0.5:x_stop-0.5) = labels;

                text(x_start+0.5,1.02,strrep(obj.optVectElements{ii},'_','\_'));
            end

            ylabel('Normalised Value')

            xtickangle(90);
            xticks([1:sum(obj.optVect_Nvars)]);
            xticklabels(xTicLab);

            
        end

    end

    methods (Access = private)
        function err = errRIA(obj,S11meas,S11model)
            % ERRRIA combines the real-imag and absolute parts of the difference error

            w = obj.optW_RIA./norm(obj.optW_RIA,1);
            err_ri = sqrt(sum(abs(S11meas(:) - S11model(:)).^2));
            err_a = sqrt(sum(abs(dB20(S11meas(:)) - dB20(S11model(:))).^2));
            err = w*[err_ri;err_a]./obj.Nf; 
        end

        function [Z0,L,freq,eps_r,tan_delta,r_prime] = getCablePars(obj,c_vals,c_unitScales)
            % GETCABLEPARS Calculates the frequency dependent Tline parameters

            cVals = c_vals.*c_unitScales;

            Z0 = cVals(1);
            L = cVals(2);
            freq = obj.freqHz;

            fn = (freq - min(freq))./(max(freq) - min(freq));
            eps_r = cVals(3).*fn + cVals(4);
            tan_delta = cVals(5).*fn + cVals(6);
            r_prime = cVals(7).*fn + cVals(8);
        end

        function cable = buildCableStruct(obj,c_vals,c_unitScales,c_max,c_min,c_optFlag)
            % BUILDCABLESTRUCT builds a general cable structure

            [Z0,L,f,eps_r,tan_delta,r_prime] = obj.getCablePars(c_vals,c_unitScales);
            cable.network = TwoPort.Tline(Z0,L,f,eps_r,tan_delta,r_prime);
            cable.network = cable.network.freqChangeUnit(obj.freqUnit);
            cable.vals = c_vals;
            cable.unitScales = c_unitScales;
            cable.max = c_max;
            cable.min = c_min;
            cable.optFlag = c_optFlag;
        end

        function r = buildRstruct(obj,r_vals,r_unitScales,r_max,r_min,r_optFlag)
            % BUILDRSTRUCT builds a general resistor structure

            r.vals = r_vals;
            r.unitScales = r_unitScales;
            r.max = r_max;
            r.min = r_min;
            r.optFlag = r_optFlag;
            parVals = r.vals.*r.unitScales;
            r.network = TwoPort.PI_CLC(parVals(1),parVals(2),parVals(3),obj.freqHz,[],parVals(4));
            r.network = r.network.freqChangeUnit(obj.freqUnit);
        end

%         function sr = buildSRstruct(obj,sr_vals,sr_unitScales,sr_max,sr_min,sr_optFlag)
%             % BUILDSRSTRUCT builds a general semi-rigid structure
% 
%             sr.vals = sr_vals;
%             sr.unitScales = sr_unitScales;
%             sr.max = sr_max;
%             sr.min = sr_min;
%             sr.optFlag = sr_optFlag;
%             parVals = sr.vals.*sr.unitScales;
%             sr.network = TwoPort.Tline(parVals(1),parVals(2),obj.freqHz,parVals(3),parVals(4),parVals(5));
%             sr.network = sr.network.freqChangeUnit(obj.freqUnit);
%         end
% 
%         function ms = buildMSstruct(obj,ms_vals,ms_unitScales,ms_max,ms_min,ms_optFlag)
%             % BUILDMSSTRUCT builds a general mechanical switch structure
% 
%             ms.vals = ms_vals;
%             ms.unitScales = ms_unitScales;
%             ms.max = ms_max;
%             ms.min = ms_min;
%             ms.optFlag = ms_optFlag;
%             parVals = ms.vals.*ms.unitScales;
%             ms.network = TwoPort.Tline(parVals(1),parVals(2),obj.freqHz,parVals(3),parVals(4),parVals(5));
%             ms.network = ms.network.freqChangeUnit(obj.freqUnit);
%         end

        function sc = buildShortCableStruct(obj,sc_vals,sc_unitScales,sc_max,sc_min,sc_optFlag)
            % BUILDMSSTRUCT builds a general short cable structure

            sc.vals = sc_vals;
            sc.unitScales = sc_unitScales;
            sc.max = sc_max;
            sc.min = sc_min;
            sc.optFlag = sc_optFlag;
            parVals = sc.vals.*sc.unitScales;
            sc.network = TwoPort.Tline(parVals(1),parVals(2),obj.freqHz,parVals(3),parVals(4),parVals(5));
            sc.network = sc.network.freqChangeUnit(obj.freqUnit);
        end

        function a = buildAdaptStruct(obj,a_vals,a_unitScales,a_max,a_min,a_optFlag)
            % BUILDADAPTSTRUCT builds an adaptor struct

            a.vals = a_vals;
            a.unitScales = a_unitScales;
            a.max = a_max;
            a.min = a_min;
            a.optFlag = a_optFlag;
            parVals = a.vals.*a.unitScales;
            a.network = TwoPort.PI_CLC(parVals(1),parVals(2),parVals(3),obj.freqHz);
            a.network = a.network.freqChangeUnit(obj.freqUnit);
        end
        

        function S_struct = buildSourceStruct(obj,elementNameVect)
            % BUILDSOURCESTRUCT builds a general source structure

            S_struct.elements = elementNameVect;
            Ne = length(S_struct.elements);
            % First get the number of variables in the cascade
            S_struct.Nvars = zeros(1,Ne);
            networkVect = TwoPort.empty(0,Ne);
            for ii = 1:Ne
                S_struct.Nvars(ii) = length(obj.(S_struct.elements{ii}).vals);
                networkVect(ii) = obj.(S_struct.elements{ii}).network;
            end
            % Run the loop again, and allocate the long vectors
            valMat = zeros(5,sum(S_struct.Nvars));
            for ii = 1:Ne
                element_ = obj.(S_struct.elements{ii});
                valMat(:,(sum(S_struct.Nvars(1:(ii-1)))+1):sum(S_struct.Nvars(1:ii))) = [element_.vals; ...
                    element_.unitScales; ...
                    element_.max; ...
                    element_.min; ...
                    element_.optFlag];
            end
            S_struct.network = cascade(networkVect);
            S_struct.network = S_struct.network.getS([],networkVect(Ne).Zport2);
            S_struct.vals = valMat(1,:);
            S_struct.unitScales = valMat(2,:);
            S_struct.max = valMat(3,:);
            S_struct.min = valMat(4,:);
            S_struct.optFlag = valMat(5,:);
            
        end

    end

    methods (Static = true)

%         function R = buildResistor(types,vals,unitScales,freq)
%             % BUILDRESISTOR makes a load model from the internal description
%             % Not doing any error checking here for speed
%             %
%             % Returns:
%             % R - TwoPort S parameters
%             %
%             % Inputs:
%             % types - row cell vector containing {'Cpar'|'Lser'|'Load'}
%             % vals - row vector of corresponding values of the elements
%             % unitScales - in the specified unit scaling
%             % freq - frequency vector in Hz
% 
%             nComp = numel(types);
%             tp = TwoPort.empty(0,nComp-1);
%             for ii = 1:nComp-1
%                 funcType = str2func(['TwoPort.',types{ii}]);
%                 tp(ii) = funcType(vals(ii).*unitScales(ii),freq);
%             end
%             R = cascade(tp);
%             R = R.getS([],vals(end).*unitScales(end));
%         end
    end

end