/// actionscripts, misc things
module earthbound.bank03;

import earthbound.commondefs;
import earthbound.bank00;
import earthbound.bank01;
import earthbound.bank02;
import earthbound.bank04;
import earthbound.bank05;
import earthbound.bank15;
import earthbound.bank18;
import earthbound.bank20;
import earthbound.bank21;
import earthbound.bank2F;
import earthbound.globals;
import core.stdc.string;

//$C30000
immutable ushort[16][8] SpriteGroupPalettes;

/// $C30100
void DisplayAntiPiracyScreen() {
	UnknownC40B51();
	Decomp(&AntiPiracyNoticeGraphics[0], &Unknown7F0000[0]);
	Decomp(&AntiPiracyNoticeArrangement[0], &Unknown7F0000[0x4000]);
	UnknownC40B75();
}

/// $C30142
void DisplayFaultyGamepakScreen() {
	UnknownC40B51();
	Decomp(&FaultyGamepakGraphics[0], &Unknown7F0000[0]);
	Decomp(&FaultyGamepakArrangement[0], &Unknown7F0000[0x4000]);
	UnknownC40B75();
}

/// $C30186
immutable NessPajamaFlag = EventFlag.NessPajamas;


immutable ubyte[0] Event0;
immutable ubyte[0] Event1;
immutable ubyte[0] Event2;
immutable ubyte[0] Event3;
immutable ubyte[0] Event4;
immutable ubyte[0] Event5;
immutable ubyte[0] Event7;
immutable ubyte[0] Event8;
immutable ubyte[0] Event9;
immutable ubyte[0] Event10_11;
immutable ubyte[0] Event6_12;
immutable ubyte[0] Event13;
immutable ubyte[0] Event14;
immutable ubyte[0] Event15;
immutable ubyte[0] Event16;
immutable ubyte[0] Event17;
immutable ubyte[0] Event18;
immutable ubyte[0] Event19;
immutable ubyte[0] Event20;
immutable ubyte[0] Event21;
immutable ubyte[0] Event22;
immutable ubyte[0] Event23;
immutable ubyte[0] Event24;
immutable ubyte[0] Event25;
immutable ubyte[0] Event26;
immutable ubyte[0] Event27;
immutable ubyte[0] Event28;
immutable ubyte[0] Event29;
immutable ubyte[0] Event30;
immutable ubyte[0] Event31;
immutable ubyte[0] Event32;
immutable ubyte[0] Event33;
immutable ubyte[0] Event34;
immutable ubyte[0] Event35;
immutable ubyte[0] Event36;
immutable ubyte[0] Event37;
immutable ubyte[0] Event38;
immutable ubyte[0] Event39;
immutable ubyte[0] Event40;
immutable ubyte[0] Event41;
immutable ubyte[0] Event42;
immutable ubyte[0] Event43;
immutable ubyte[0] Event44;
immutable ubyte[0] Event45;
immutable ubyte[0] Event46;
immutable ubyte[0] Event47;
immutable ubyte[0] Event48;
immutable ubyte[0] Event49;
immutable ubyte[0] Event50;
immutable ubyte[0] Event51;
immutable ubyte[0] Event52;
immutable ubyte[0] Event53;
immutable ubyte[0] Event54;
immutable ubyte[0] Event55;
immutable ubyte[0] Event56;
immutable ubyte[0] Event57;
immutable ubyte[0] Event58;
immutable ubyte[0] Event59;
immutable ubyte[0] Event60;
immutable ubyte[0] Event61;
immutable ubyte[0] Event62;
immutable ubyte[0] Event63;
immutable ubyte[0] Event64;
immutable ubyte[0] Event65;
immutable ubyte[0] Event66;
immutable ubyte[0] Event67;
immutable ubyte[0] Event68;
immutable ubyte[0] Event69;
immutable ubyte[0] Event70;
immutable ubyte[0] Event71;
immutable ubyte[0] Event72;
immutable ubyte[0] Event73;
immutable ubyte[0] Event74;
immutable ubyte[0] Event75;
immutable ubyte[0] Event76;
immutable ubyte[0] Event77;
immutable ubyte[0] Event78;
immutable ubyte[0] Event79;
immutable ubyte[0] Event80;
immutable ubyte[0] Event81;
immutable ubyte[0] Event82;
immutable ubyte[0] Event83;
immutable ubyte[0] Event84;
immutable ubyte[0] Event85;
immutable ubyte[0] Event86;
immutable ubyte[0] Event87;
immutable ubyte[0] Event88;
immutable ubyte[0] Event89;
immutable ubyte[0] Event90;
immutable ubyte[0] Event91;
immutable ubyte[0] Event92;
immutable ubyte[0] Event93;
immutable ubyte[0] Event94;
immutable ubyte[0] Event95;
immutable ubyte[0] Event96;
immutable ubyte[0] Event97;
immutable ubyte[0] Event98;
immutable ubyte[0] Event99;
immutable ubyte[0] Event100;
immutable ubyte[0] Event101;
immutable ubyte[0] Event102;
immutable ubyte[0] Event103;
immutable ubyte[0] Event104;
immutable ubyte[0] Event105;
immutable ubyte[0] Event106;
immutable ubyte[0] Event107;
immutable ubyte[0] Event108;
immutable ubyte[0] Event109;
immutable ubyte[0] Event110;
immutable ubyte[0] Event111;
immutable ubyte[0] Event112;
immutable ubyte[0] Event113;
immutable ubyte[0] Event114;
immutable ubyte[0] Event115;
immutable ubyte[0] Event116;
immutable ubyte[0] Event117;
immutable ubyte[0] Event118;
immutable ubyte[0] Event119;
immutable ubyte[0] Event120;
immutable ubyte[0] Event121;
immutable ubyte[0] Event122;
immutable ubyte[0] Event123;
immutable ubyte[0] Event124;
immutable ubyte[0] Event125;
immutable ubyte[0] Event126;
immutable ubyte[0] Event127;
immutable ubyte[0] Event128;
immutable ubyte[0] Event129;
immutable ubyte[0] Event130;
immutable ubyte[0] Event131;
immutable ubyte[0] Event132;
immutable ubyte[0] Event133;
immutable ubyte[0] Event134;
immutable ubyte[0] Event135;
immutable ubyte[0] Event136;
immutable ubyte[0] Event137;
immutable ubyte[0] Event138;
immutable ubyte[0] Event139;
immutable ubyte[0] Event140;
immutable ubyte[0] Event141;
immutable ubyte[0] Event142;
immutable ubyte[0] Event143;
immutable ubyte[0] Event144;
immutable ubyte[0] Event145;
immutable ubyte[0] Event146;
immutable ubyte[0] Event147;
immutable ubyte[0] Event148;
immutable ubyte[0] Event149;
immutable ubyte[0] Event150;
immutable ubyte[0] Event151;
immutable ubyte[0] Event152;
immutable ubyte[0] Event153;
immutable ubyte[0] Event154;
immutable ubyte[0] Event155;
immutable ubyte[0] Event156;
immutable ubyte[0] Event157;
immutable ubyte[0] Event158;
immutable ubyte[0] Event159;
immutable ubyte[0] Event160;
immutable ubyte[0] Event161;
immutable ubyte[0] Event162;
immutable ubyte[0] Event163;
immutable ubyte[0] Event164;
immutable ubyte[0] Event165;
immutable ubyte[0] Event166;
immutable ubyte[0] Event167;
immutable ubyte[0] Event168;
immutable ubyte[0] Event169;
immutable ubyte[0] Event170;
immutable ubyte[0] Event171;
immutable ubyte[0] Event172;
immutable ubyte[0] Event173;
immutable ubyte[0] Event174;
immutable ubyte[0] Event175;
immutable ubyte[0] Event176;
immutable ubyte[0] Event177;
immutable ubyte[0] Event178;
immutable ubyte[0] Event179;
immutable ubyte[0] Event180;
immutable ubyte[0] Event181;
immutable ubyte[0] Event182;
immutable ubyte[0] Event183;
immutable ubyte[0] Event184;
immutable ubyte[0] Event185;
immutable ubyte[0] Event186;
immutable ubyte[0] Event187;
immutable ubyte[0] Event188;
immutable ubyte[0] Event189;
immutable ubyte[0] Event190;
immutable ubyte[0] Event191;
immutable ubyte[0] Event192;
immutable ubyte[0] Event193;
immutable ubyte[0] Event194;
immutable ubyte[0] Event195;
immutable ubyte[0] Event196;
immutable ubyte[0] Event197;
immutable ubyte[0] Event198;
immutable ubyte[0] Event199;
immutable ubyte[0] Event200;
immutable ubyte[0] Event201;
immutable ubyte[0] Event202;
immutable ubyte[0] Event203;
immutable ubyte[0] Event204;
immutable ubyte[0] Event205;
immutable ubyte[0] Event206;
immutable ubyte[0] Event207;
immutable ubyte[0] Event208;
immutable ubyte[0] Event209;
immutable ubyte[0] Event210;
immutable ubyte[0] Event211;
immutable ubyte[0] Event212;
immutable ubyte[0] Event213;
immutable ubyte[0] Event214;
immutable ubyte[0] Event215;
immutable ubyte[0] Event216;
immutable ubyte[0] Event217;
immutable ubyte[0] Event218;
immutable ubyte[0] Event219;
immutable ubyte[0] Event220;
immutable ubyte[0] Event221;
immutable ubyte[0] Event222;
immutable ubyte[0] Event223;
immutable ubyte[0] Event224;
immutable ubyte[0] Event225_226_227;
immutable ubyte[0] Event228;
immutable ubyte[0] Event229;
immutable ubyte[0] Event230;
immutable ubyte[0] Event231;
immutable ubyte[0] Event232;
immutable ubyte[0] Event233_234_235_236_237;
immutable ubyte[0] Event238;
immutable ubyte[0] Event239;
immutable ubyte[0] Event240;
immutable ubyte[0] Event241;
immutable ubyte[0] Event242_243;
immutable ubyte[0] Event244;
immutable ubyte[0] Event245;
immutable ubyte[0] Event246;
immutable ubyte[0] Event247_248;
immutable ubyte[0] Event249;
immutable ubyte[0] Event250;
immutable ubyte[0] Event251;
immutable ubyte[0] Event252;
immutable ubyte[0] Event253;
immutable ubyte[0] Event254;
immutable ubyte[0] Event255;
immutable ubyte[0] Event256;
immutable ubyte[0] Event257;
immutable ubyte[0] Event258;
immutable ubyte[0] Event259;
immutable ubyte[0] Event260;
immutable ubyte[0] Event261;
immutable ubyte[0] Event262;
immutable ubyte[0] Event263;
immutable ubyte[0] Event264;
immutable ubyte[0] Event265;
immutable ubyte[0] Event266;
immutable ubyte[0] Event267;
immutable ubyte[0] Event268;
immutable ubyte[0] Event269;
immutable ubyte[0] Event270;
immutable ubyte[0] Event271;
immutable ubyte[0] Event272;
immutable ubyte[0] Event273;
immutable ubyte[0] Event274_275_276;
immutable ubyte[0] Event277;
immutable ubyte[0] Event278;
immutable ubyte[0] Event279;
immutable ubyte[0] Event280;
immutable ubyte[0] Event281;
immutable ubyte[0] Event282;
immutable ubyte[0] Event283;
immutable ubyte[0] Event284;
immutable ubyte[0] Event285;
immutable ubyte[0] Event286;
immutable ubyte[0] Event287;
immutable ubyte[0] Event288;
immutable ubyte[0] Event289;
immutable ubyte[0] Event290;
immutable ubyte[0] Event291;
immutable ubyte[0] Event292;
immutable ubyte[0] Event293;
immutable ubyte[0] Event294;
immutable ubyte[0] Event295;
immutable ubyte[0] Event296;
immutable ubyte[0] Event297;
immutable ubyte[0] Event298;
immutable ubyte[0] Event299;
immutable ubyte[0] Event300;
immutable ubyte[0] Event301;
immutable ubyte[0] Event302;
immutable ubyte[0] Event303;
immutable ubyte[0] Event304;
immutable ubyte[0] Event305;
immutable ubyte[0] Event306;
immutable ubyte[0] Event307;
immutable ubyte[0] Event308;
immutable ubyte[0] Event309;
immutable ubyte[0] Event310;
immutable ubyte[0] Event311;
immutable ubyte[0] Event312;
immutable ubyte[0] Event313;
immutable ubyte[0] Event314;
immutable ubyte[0] Event315;
immutable ubyte[0] Event316;
immutable ubyte[0] Event317;
immutable ubyte[0] Event318;
immutable ubyte[0] Event319;
immutable ubyte[0] Event320;
immutable ubyte[0] Event321;
immutable ubyte[0] Event322;
immutable ubyte[0] Event323;
immutable ubyte[0] Event324;
immutable ubyte[0] Event325;
immutable ubyte[0] Event326;
immutable ubyte[0] Event327;
immutable ubyte[0] Event328;
immutable ubyte[0] Event329;
immutable ubyte[0] Event330;
immutable ubyte[0] Event331;
immutable ubyte[0] Event332;
immutable ubyte[0] Event333;
immutable ubyte[0] Event334;
immutable ubyte[0] Event335;
immutable ubyte[0] Event336;
immutable ubyte[0] Event337;
immutable ubyte[0] Event338;
immutable ubyte[0] Event339;
immutable ubyte[0] Event340;
immutable ubyte[0] Event341;
immutable ubyte[0] Event342;
immutable ubyte[0] Event343;
immutable ubyte[0] Event344;
immutable ubyte[0] Event345;
immutable ubyte[0] Event346;
immutable ubyte[0] Event347;
immutable ubyte[0] Event348_349;
immutable ubyte[0] Event350;
immutable ubyte[0] Event351;
immutable ubyte[0] Event352;
immutable ubyte[0] Event353;
immutable ubyte[0] Event354;
immutable ubyte[0] Event355;
immutable ubyte[0] Event356;
immutable ubyte[0] Event357;
immutable ubyte[0] Event358;
immutable ubyte[0] Event359;
immutable ubyte[0] Event360;
immutable ubyte[0] Event361;
immutable ubyte[0] Event362;
immutable ubyte[0] Event363;
immutable ubyte[0] Event364;
immutable ubyte[0] Event365;
immutable ubyte[0] Event366;
immutable ubyte[0] Event367;
immutable ubyte[0] Event368;
immutable ubyte[0] Event369;
immutable ubyte[0] Event370;
immutable ubyte[0] Event371;
immutable ubyte[0] Event372;
immutable ubyte[0] Event373;
immutable ubyte[0] Event374;
immutable ubyte[0] Event375_404;
immutable ubyte[0] Event376_405;
immutable ubyte[0] Event377_406;
immutable ubyte[0] Event378_407;
immutable ubyte[0] Event379_408;
immutable ubyte[0] Event380;
immutable ubyte[0] Event381;
immutable ubyte[0] Event382;
immutable ubyte[0] Event383;
immutable ubyte[0] Event384;
immutable ubyte[0] Event385;
immutable ubyte[0] Event386;
immutable ubyte[0] Event387;
immutable ubyte[0] Event388;
immutable ubyte[0] Event389_393;
immutable ubyte[0] Event390_394;
immutable ubyte[0] Event391;
immutable ubyte[0] Event392;
immutable ubyte[0] Event395;
immutable ubyte[0] Event396;
immutable ubyte[0] Event397;
immutable ubyte[0] Event398;
immutable ubyte[0] Event399;
immutable ubyte[0] Event400;
immutable ubyte[0] Event401;
immutable ubyte[0] Event402;
immutable ubyte[0] Event403;
immutable ubyte[0] Event409;
immutable ubyte[0] Event410;
immutable ubyte[0] Event411;
immutable ubyte[0] Event412;
immutable ubyte[0] Event413;
immutable ubyte[0] Event414;
immutable ubyte[0] Event415;
immutable ubyte[0] Event416;
immutable ubyte[0] Event417;
immutable ubyte[0] Event418;
immutable ubyte[0] Event419;
immutable ubyte[0] Event420;
immutable ubyte[0] Event421;
immutable ubyte[0] Event422;
immutable ubyte[0] Event423;
immutable ubyte[0] Event424;
immutable ubyte[0] Event425;
immutable ubyte[0] Event426;
immutable ubyte[0] Event427;
immutable ubyte[0] Event428;
immutable ubyte[0] Event429;
immutable ubyte[0] Event430;
immutable ubyte[0] Event431_432_433_434;
immutable ubyte[0] Event435;
immutable ubyte[0] Event436;
immutable ubyte[0] Event437;
immutable ubyte[0] Event438;
immutable ubyte[0] Event439;
immutable ubyte[0] Event440;
immutable ubyte[0] Event441;
immutable ubyte[0] Event442;
immutable ubyte[0] Event443;
immutable ubyte[0] Event444;
immutable ubyte[0] Event445;
immutable ubyte[0] Event446;
immutable ubyte[0] Event447;
immutable ubyte[0] Event448;
immutable ubyte[0] Event449;
immutable ubyte[0] Event450;
immutable ubyte[0] Event451;
immutable ubyte[0] Event452;
immutable ubyte[0] Event453;
immutable ubyte[0] Event454;
immutable ubyte[0] Event455;
immutable ubyte[0] Event456;
immutable ubyte[0] Event457;
immutable ubyte[0] Event458;
immutable ubyte[0] Event459;
immutable ubyte[0] Event460;
immutable ubyte[0] Event461;
immutable ubyte[0] Event462;
immutable ubyte[0] Event463;
immutable ubyte[0] Event464;
immutable ubyte[0] Event465;
immutable ubyte[0] Event466;
immutable ubyte[0] Event467;
immutable ubyte[0] Event468;
immutable ubyte[0] Event469;
immutable ubyte[0] Event470;
immutable ubyte[0] Event471;
immutable ubyte[0] Event472;
immutable ubyte[0] Event473;
immutable ubyte[0] Event474;
immutable ubyte[0] Event475;
immutable ubyte[0] Event476;
immutable ubyte[0] Event477;
immutable ubyte[0] Event478;
immutable ubyte[0] Event479;
immutable ubyte[0] Event480;
immutable ubyte[0] Event481;
immutable ubyte[0] Event482;
immutable ubyte[0] Event483;
immutable ubyte[0] Event484;
immutable ubyte[0] Event485;
immutable ubyte[0] Event486;
immutable ubyte[0] Event487;
immutable ubyte[0] Event488;
immutable ubyte[0] Event489;
immutable ubyte[0] Event490;
immutable ubyte[0] Event491;
immutable ubyte[0] Event492;
immutable ubyte[0] Event493;
immutable ubyte[0] Event494;
immutable ubyte[0] Event495;
immutable ubyte[0] Event496;
immutable ubyte[0] Event497;
immutable ubyte[0] Event498;
immutable ubyte[0] Event499;
immutable ubyte[0] Event500;
immutable ubyte[0] Event501;
immutable ubyte[0] Event502;
immutable ubyte[0] Event503;
immutable ubyte[0] Event504;
immutable ubyte[0] Event505;
immutable ubyte[0] Event506;
immutable ubyte[0] Event507;
immutable ubyte[0] Event508;
immutable ubyte[0] Event509;
immutable ubyte[0] Event510;
immutable ubyte[0] Event511;
immutable ubyte[0] Event512;
immutable ubyte[0] Event513;
immutable ubyte[0] Event514;
immutable ubyte[0] Event515;
immutable ubyte[0] Event516;
immutable ubyte[0] Event517;
immutable ubyte[0] Event518;
immutable ubyte[0] Event519;
immutable ubyte[0] Event520;
immutable ubyte[0] Event521;
immutable ubyte[0] Event522;
immutable ubyte[0] Event523;
immutable ubyte[0] Event524;
immutable ubyte[0] Event525;
immutable ubyte[0] Event526;
immutable ubyte[0] Event527;
immutable ubyte[0] Event528;
immutable ubyte[0] Event529;
immutable ubyte[0] Event530;
immutable ubyte[0] Event531;
immutable ubyte[0] Event532;
immutable ubyte[0] Event533;
immutable ubyte[0] Event534;
immutable ubyte[0] Event535;
immutable ubyte[0] Event536;
immutable ubyte[0] Event537;
immutable ubyte[0] Event538;
immutable ubyte[0] Event539;
immutable ubyte[0] Event540;
immutable ubyte[0] Event541;
immutable ubyte[0] Event542;
immutable ubyte[0] Event543;
immutable ubyte[0] Event544;
immutable ubyte[0] Event545;
immutable ubyte[0] Event546;
immutable ubyte[0] Event547;
immutable ubyte[0] Event548;
immutable ubyte[0] Event549;
immutable ubyte[0] Event550;
immutable ubyte[0] Event551;
immutable ubyte[0] Event552;
immutable ubyte[0] Event553;
immutable ubyte[0] Event554;
immutable ubyte[0] Event555;
immutable ubyte[0] Event556;
immutable ubyte[0] Event557;
immutable ubyte[0] Event558;
immutable ubyte[0] Event559;
immutable ubyte[0] Event560;
immutable ubyte[0] Event561;
immutable ubyte[0] Event562;
immutable ubyte[0] Event563;
immutable ubyte[0] Event564;
immutable ubyte[0] Event565;
immutable ubyte[0] Event566;
immutable ubyte[0] Event567;
immutable ubyte[0] Event568;
immutable ubyte[0] Event569;
immutable ubyte[0] Event570;
immutable ubyte[0] Event571;
immutable ubyte[0] Event572;
immutable ubyte[0] Event573;
immutable ubyte[0] Event574;
immutable ubyte[0] Event575;
immutable ubyte[0] Event576;
immutable ubyte[0] Event577;
immutable ubyte[0] Event578;
immutable ubyte[0] Event579;
immutable ubyte[0] Event580;
immutable ubyte[0] Event581;
immutable ubyte[0] Event582;
immutable ubyte[0] Event583;
immutable ubyte[0] Event584;
immutable ubyte[0] Event585;
immutable ubyte[0] Event586;
immutable ubyte[0] Event587;
immutable ubyte[0] Event588;
immutable ubyte[0] Event589;
immutable ubyte[0] Event590;
immutable ubyte[0] Event591;
immutable ubyte[0] Event592;
immutable ubyte[0] Event593;
immutable ubyte[0] Event594;
immutable ubyte[0] Event595;
immutable ubyte[0] Event596;
immutable ubyte[0] Event597;
immutable ubyte[0] Event598;
immutable ubyte[0] Event599;
immutable ubyte[0] Event600;
immutable ubyte[0] Event601;
immutable ubyte[0] Event602;
immutable ubyte[0] Event603;
immutable ubyte[0] Event604;
immutable ubyte[0] Event605;
immutable ubyte[0] Event606;
immutable ubyte[0] Event607;
immutable ubyte[0] Event608;
immutable ubyte[0] Event609;
immutable ubyte[0] Event610;
immutable ubyte[0] Event611;
immutable ubyte[0] Event612;
immutable ubyte[0] Event613;
immutable ubyte[0] Event614;
immutable ubyte[0] Event615;
immutable ubyte[0] Event616;
immutable ubyte[0] Event617;
immutable ubyte[0] Event618;
immutable ubyte[0] Event619;
immutable ubyte[0] Event620;
immutable ubyte[0] Event621;
immutable ubyte[0] Event622;
immutable ubyte[0] Event623;
immutable ubyte[0] Event624;
immutable ubyte[0] Event625;
immutable ubyte[0] Event626;
immutable ubyte[0] Event627;
immutable ubyte[0] Event628;
immutable ubyte[0] Event629;
immutable ubyte[0] Event630;
immutable ubyte[0] Event631;
immutable ubyte[0] Event632;
immutable ubyte[0] Event633;
immutable ubyte[0] Event634;
immutable ubyte[0] Event635;
immutable ubyte[0] Event636;
immutable ubyte[0] Event637;
immutable ubyte[0] Event638;
immutable ubyte[0] Event639;
immutable ubyte[0] Event640;
immutable ubyte[0] Event641;
immutable ubyte[0] Event642;
immutable ubyte[0] Event643;
immutable ubyte[0] Event644;
immutable ubyte[0] Event645;
immutable ubyte[0] Event646;
immutable ubyte[0] Event647;
immutable ubyte[0] Event648;
immutable ubyte[0] Event649;
immutable ubyte[0] Event650;
immutable ubyte[0] Event651;
immutable ubyte[0] Event652;
immutable ubyte[0] Event653;
immutable ubyte[0] Event654;
immutable ubyte[0] Event655;
immutable ubyte[0] Event656;
immutable ubyte[0] Event657;
immutable ubyte[0] Event658;
immutable ubyte[0] Event659;
immutable ubyte[0] Event660;
immutable ubyte[0] Event661;
immutable ubyte[0] Event662;
immutable ubyte[0] Event663;
immutable ubyte[0] Event664;
immutable ubyte[0] Event665;
immutable ubyte[0] Event666;
immutable ubyte[0] Event667;
immutable ubyte[0] Event668;
immutable ubyte[0] Event669;
immutable ubyte[0] Event670;
immutable ubyte[0] Event671;
immutable ubyte[0] Event672;
immutable ubyte[0] Event673;
immutable ubyte[0] Event674;
immutable ubyte[0] Event675;
immutable ubyte[0] Event676;
immutable ubyte[0] Event677;
immutable ubyte[0] Event678;
immutable ubyte[0] Event679;
immutable ubyte[0] Event680;
immutable ubyte[0] Event681;
immutable ubyte[0] Event682;
immutable ubyte[0] Event683;
immutable ubyte[0] Event684;
immutable ubyte[0] Event685;
immutable ubyte[0] Event686;
immutable ubyte[0] Event687;
immutable ubyte[0] Event688;
immutable ubyte[0] Event689;
immutable ubyte[0] Event690;
immutable ubyte[0] Event691;
immutable ubyte[0] Event692;
immutable ubyte[0] Event693;
immutable ubyte[0] Event694;
immutable ubyte[0] Event695;
immutable ubyte[0] Event696;
immutable ubyte[0] Event697;
immutable ubyte[0] Event698;
immutable ubyte[0] Event699;
immutable ubyte[0] Event700;
immutable ubyte[0] Event701;
immutable ubyte[0] Event702;
immutable ubyte[0] Event703;
immutable ubyte[0] Event704;
immutable ubyte[0] Event705;
immutable ubyte[0] Event706;
immutable ubyte[0] Event707;
immutable ubyte[0] Event708;
immutable ubyte[0] Event709;
immutable ubyte[0] Event710;
immutable ubyte[0] Event711;
immutable ubyte[0] Event712;
immutable ubyte[0] Event713;
immutable ubyte[0] Event714;
immutable ubyte[0] Event715;
immutable ubyte[0] Event716;
immutable ubyte[0] Event717;
immutable ubyte[0] Event718;
immutable ubyte[0] Event719;
immutable ubyte[0] Event720;
immutable ubyte[0] Event721;
immutable ubyte[0] Event722;
immutable ubyte[0] Event723;
immutable ubyte[0] Event724;
immutable ubyte[0] Event725;
immutable ubyte[0] Event726;
immutable ubyte[0] Event727;
immutable ubyte[0] Event728;
immutable ubyte[0] Event729;
immutable ubyte[0] Event730;
immutable ubyte[0] Event731;
immutable ubyte[0] Event732;
immutable ubyte[0] Event733;
immutable ubyte[0] Event734;
immutable ubyte[0] Event735;
immutable ubyte[0] Event736;
immutable ubyte[0] Event737;
immutable ubyte[0] Event738;
immutable ubyte[0] Event739;
immutable ubyte[0] Event740;
immutable ubyte[0] Event741;
immutable ubyte[0] Event742;
immutable ubyte[0] Event743;
immutable ubyte[0] Event744;
immutable ubyte[0] Event745;
immutable ubyte[0] Event746;
immutable ubyte[0] Event747;
immutable ubyte[0] Event748;
immutable ubyte[0] Event749;
immutable ubyte[0] Event750;
immutable ubyte[0] Event751;
immutable ubyte[0] Event752;
immutable ubyte[0] Event753;
immutable ubyte[0] Event754;
immutable ubyte[0] Event755;
immutable ubyte[0] Event756;
immutable ubyte[0] Event757;
immutable ubyte[0] Event758;
immutable ubyte[0] Event759;
immutable ubyte[0] Event760;
immutable ubyte[0] Event761;
immutable ubyte[0] Event762;
immutable ubyte[0] Event763;
immutable ubyte[0] Event764;
immutable ubyte[0] Event765;
immutable ubyte[0] Event766;
immutable ubyte[0] Event767;
immutable ubyte[0] Event768;
immutable ubyte[0] Event769;
immutable ubyte[0] Event770;
immutable ubyte[0] Event771;
immutable ubyte[0] Event772;
immutable ubyte[0] Event773;
immutable ubyte[0] Event774;
immutable ubyte[0] Event775;
immutable ubyte[0] Event776;
immutable ubyte[0] Event777;
immutable ubyte[0] Event778;
immutable ubyte[0] Event779;
immutable ubyte[0] Event780;
immutable ubyte[0] Event781;
immutable ubyte[0] Event782;
immutable ubyte[0] Event783;
immutable ubyte[0] Event784;
immutable ubyte[0] Event785;
immutable ubyte[0] Event786;
immutable ubyte[0] Event787;
immutable ubyte[0] Event788;
immutable ubyte[0] Event789;
immutable ubyte[0] Event790;
immutable ubyte[0] Event791;
immutable ubyte[0] Event792;
immutable ubyte[0] Event793;
immutable ubyte[0] Event794;
immutable ubyte[0] Event795;
immutable ubyte[0] Event796;
immutable ubyte[0] Event797;
immutable ubyte[0] Event798;
immutable ubyte[0] Event799;
immutable ubyte[0] Event800;
immutable ubyte[0] Event801;
immutable ubyte[0] Event802;
immutable ubyte[0] Event803;
immutable ubyte[0] Event804;
immutable ubyte[0] Event805;
immutable ubyte[0] Event806;
immutable ubyte[0] Event807;
immutable ubyte[0] Event808;
immutable ubyte[0] Event809;
immutable ubyte[0] Event810;
immutable ubyte[0] Event811;
immutable ubyte[0] Event812;
immutable ubyte[0] Event813;
immutable ubyte[0] Event814;
immutable ubyte[0] Event815;
immutable ubyte[0] Event816;
immutable ubyte[0] Event817;
immutable ubyte[0] Event818;
immutable ubyte[0] Event819;
immutable ubyte[0] Event820;
immutable ubyte[0] Event821;
immutable ubyte[0] Event822;
immutable ubyte[0] Event823;
immutable ubyte[0] Event824;
immutable ubyte[0] Event825;
immutable ubyte[0] Event826;
immutable ubyte[0] Event827;
immutable ubyte[0] Event828;
immutable ubyte[0] Event829;
immutable ubyte[0] Event830;
immutable ubyte[0] Event831;
immutable ubyte[0] Event832;
immutable ubyte[0] Event833;
immutable ubyte[0] Event834;
immutable ubyte[0] Event835;
immutable ubyte[0] Event836;
immutable ubyte[0] Event837;
immutable ubyte[0] Event838;
immutable ubyte[0] Event839;
immutable ubyte[0] Event840;
immutable ubyte[0] Event841;
immutable ubyte[0] Event842;
immutable ubyte[0] Event843;
immutable ubyte[0] Event844;
immutable ubyte[0] Event845;
immutable ubyte[0] Event846;
immutable ubyte[0] Event847;
immutable ubyte[0] Event848;
immutable ubyte[0] Event849;
immutable ubyte[0] Event850;
immutable ubyte[0] Event851;
immutable ubyte[0] Event852;
immutable ubyte[0] Event853;
immutable ubyte[0] Event854;
immutable ubyte[0] Event855;
immutable ubyte[0] Event856;
immutable ubyte[0] Event857;
immutable ubyte[0] Event858;
immutable ubyte[0] Event859;
immutable ubyte[0] Event860;
immutable ubyte[0] Event861;
immutable ubyte[0] Event862;
immutable ubyte[0] Event863;
immutable ubyte[0] Event864;
immutable ubyte[0] Event865;
immutable ubyte[0] Event866;
immutable ubyte[0] Event867;
immutable ubyte[0] Event868;
immutable ubyte[0] Event869;
immutable ubyte[0] Event870;
immutable ubyte[0] Event871;
immutable ubyte[0] Event872;
immutable ubyte[0] Event873;
immutable ubyte[0] Event874;
immutable ubyte[0] Event875;
immutable ubyte[0] Event876;
immutable ubyte[0] Event877;
immutable ubyte[0] Event878;
immutable ubyte[0] Event879;
immutable ubyte[0] Event880;
immutable ubyte[0] Event881;
immutable ubyte[0] Event882;
immutable ubyte[0] Event883;
immutable ubyte[0] Event884;
immutable ubyte[0] Event885;
immutable ubyte[0] Event886;
immutable ubyte[0] Event887;
immutable ubyte[0] Event888;
immutable ubyte[0] Event889;
immutable ubyte[0] Event890;
immutable ubyte[0] Event891;
immutable ubyte[0] Event892;
immutable ubyte[0] Event893;
immutable ubyte[0] Event894;
immutable ubyte[0] UnknownC3A209;

/// $C3E012
immutable CharacterInitialEntityDataEntry[17] CharacterInitialEntityData = [
	CharacterInitialEntityDataEntry(OverworldSprite.Ness, OverworldSprite.LilNess, ActionScript.Unknown002, 0x0018),
	CharacterInitialEntityDataEntry(OverworldSprite.Paula, OverworldSprite.LilPaula, ActionScript.Unknown002, 0x0019),
	CharacterInitialEntityDataEntry(OverworldSprite.Jeff, OverworldSprite.LilJeff, ActionScript.Unknown002, 0x001A),
	CharacterInitialEntityDataEntry(OverworldSprite.Poo, OverworldSprite.LilPoo, ActionScript.Unknown002, 0x001B),
	CharacterInitialEntityDataEntry(OverworldSprite.Pokey, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.Picky, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.King, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.Tony, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.BubbleMonkey, OverworldSprite.Invalid, ActionScript.Unknown003, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.DungeonMan, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.FlyingMan, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.FlyingMan, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.FlyingMan, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.FlyingMan, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.FlyingMan, OverworldSprite.Invalid, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.TeddyBearParty, OverworldSprite.LilTeddyBear, ActionScript.Unknown002, 0x001C),
	CharacterInitialEntityDataEntry(OverworldSprite.TeddyBearParty, OverworldSprite.LilTeddyBear, ActionScript.Unknown002, 0x001C),
];

/// $C3E09A
immutable ushort[17] CharacterSizes = [
	0,
	0,
	0,
	0,
	0,
	0,
	4,
	0,
	0,
	10,
	0,
	0,
	0,
	0,
	0,
	0,
	0,
];

/// $C3E0BC
immutable FixedPoint1616[14] defaultMovementSpeeds = [
	FixedPoint1616(0x6000, 1), //NORMAL
	FixedPoint1616(0x6000, 1), //UNKNOWN_01
	FixedPoint1616(0x6000, 1), //UNKNOWN_02
	FixedPoint1616(0xCCCC, 1), //BICYCLE
	FixedPoint1616(0x0000, 1), //GHOST
	FixedPoint1616(0x0000, 0), //UNKNOWN_05
	FixedPoint1616(0x0000, 1), //SLOWER
	FixedPoint1616(0xCCCC, 0), //LADDER
	FixedPoint1616(0xCCCC, 0), //ROPE
	FixedPoint1616(0x0000, 0), //UNKNOWN_09
	FixedPoint1616(0x8000, 0), //SLOWEST
	FixedPoint1616(0x0000, 0), //UNKNOWN_0B
	FixedPoint1616(0xCCCC, 0), //ESCALATOR
	FixedPoint1616(0xCCCC, 0), //STAIRS
];
immutable FixedPoint1616[14] defaultMovementSpeedsDiagonal = [
	FixedPoint1616(0xF8E6, 0), //NORMAL
	FixedPoint1616(0xF8E6, 0), //UNKNOWN_01
	FixedPoint1616(0xF8E6, 0), //UNKNOWN_02
	FixedPoint1616(0x45D5, 1), //BICYCLE
	FixedPoint1616(0xB505, 0), //GHOST
	FixedPoint1616(0x0000, 0), //UNKNOWN_05
	FixedPoint1616(0xB505, 0), //SLOWER
	FixedPoint1616(0x90D0, 0), //LADDER
	FixedPoint1616(0x90D0, 0), //ROPE
	FixedPoint1616(0x0000, 0), //UNKNOWN_09
	FixedPoint1616(0x5A82, 0), //SLOWEST
	FixedPoint1616(0x0000, 0), //UNKNOWN_0B
	FixedPoint1616(0x90D0, 0), //ESCALATOR
	FixedPoint1616(0x90D0, 0), //STAIRS
];

/// $C3E12C
immutable ushort[] AllowedInputDirections = [
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //NORMAL
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //UNKNOWN_01
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //UNKNOWN_02
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //BICYCLE
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //GHOST
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //UNKNOWN_05
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //SLOWER
	DirectionMask.Up | DirectionMask.Down, //LADDER
	DirectionMask.Up | DirectionMask.Down, //ROPE
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //UNKNOWN_09
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //SLOWEST
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft, //UNKNOWN_0B
	0, //ESCALATOR
	DirectionMask.Up | DirectionMask.UpRight | DirectionMask.Right | DirectionMask.DownRight | DirectionMask.Down | DirectionMask.DownLeft | DirectionMask.DownLeft | DirectionMask.Left | DirectionMask.UpLeft //STAIRS
];

/// $C3E148
immutable short[8] UnknownC3E148 = [0, 0, 10, 0, 0, 0, -10, 0];

/// $C3E158
immutable short[8] UnknownC3E158 = [-5, -5, 0, 5, 5, 5, 0, -5];

/// $C3E1D8
immutable short[4] UnknownC3E1D8 = [4, 0, 2, 6];

/// $C3E1E0
//wonder what this is...?
immutable short[4][4] UnknownC3E1E0 = [[0, 0, 4, 0], [0, 0, -4, 0], [-4, 0, 0, 0], [4, 0, 0, 0]];

/// $C3E200
immutable short[4] UnknownC3E200 = [7, 1, 5, 3];

/// $C3E208
immutable short[4] UnknownC3E208 = [2, 6, 2, 6];

/// $C3E210
immutable short[4] UnknownC3E210 = [0, 8, 0, 8];

/// $C3E218
immutable short[4] UnknownC3E218 = [0, 0, 8, 8];

/// $C3E220
immutable short[4] UnknownC3E220 = [8, 0, 8, 0];

/// $C3E228
immutable short[4] UnknownC3E228 = [8, 8, 0, 0];

/// $C3E230
immutable short[8] UnknownC3E230 = [0, 1, 1, 1, 0, -1, -1, -1];

/// $C3E240
immutable short[8] UnknownC3E240 = [-1, -1, 0, 1, 1, 1, 0, -1];

/// $C3E250
immutable WindowConfig[53] WindowConfigurationTable = [
	WindowConfig(0x0001, 0x0001, 0x000D, 0x0008),
	WindowConfig(0x000C, 0x0001, 0x0013, 0x0008), // Out-of-battle text
	WindowConfig(0x0007, 0x0001, 0x0018, 0x0010), // Main inventory window
	WindowConfig(0x0001, 0x0001, 0x0006, 0x000A), // Inventory menu
	WindowConfig(0x0001, 0x0003, 0x000B, 0x0006),
	WindowConfig(0x0014, 0x0001, 0x000B, 0x0010), // Phone menu
	WindowConfig(0x0008, 0x0001, 0x0014, 0x000A), // Equip menu
	WindowConfig(0x0012, 0x0001, 0x000D, 0x0010), // Item list for equip menu
	WindowConfig(0x0001, 0x0001, 0x001E, 0x0012), // Status menu
	WindowConfig(0x000C, 0x0001, 0x0013, 0x0012), // Used by status screen?
	WindowConfig(0x0001, 0x000A, 0x0008, 0x0004), // Carried money window
	WindowConfig(0x0001, 0x000F, 0x000B, 0x0004), // Used by status screen?
	WindowConfig(0x000C, 0x0001, 0x0013, 0x0010),
	WindowConfig(0x0007, 0x0001, 0x0018, 0x0010),
	WindowConfig(0x0004, 0x0001, 0x0018, 0x0006), // In-battle text
	WindowConfig(0x0001, 0x0001, 0x0015, 0x0006), // Normal battle menu
	WindowConfig(0x0004, 0x0001, 0x0008, 0x0008),
	WindowConfig(0x000C, 0x0001, 0x000C, 0x0004),
	WindowConfig(0x0001, 0x0001, 0x000E, 0x0006), // Jeff' s Battle menu
	WindowConfig(0x0001, 0x0002, 0x001E, 0x0008), // File Select
	WindowConfig(0x0005, 0x0009, 0x0016, 0x0004), // Overworld Menu
	WindowConfig(0x000A, 0x0010, 0x000C, 0x0008), // Copy Menu (2 choices)
	WindowConfig(0x000A, 0x0010, 0x000C, 0x0006), // Copy Menu (1 choice)
	WindowConfig(0x0006, 0x0011, 0x0015, 0x000A), // Delete confirmation
	WindowConfig(0x0003, 0x000E, 0x0010, 0x000A), // Text Speed
	WindowConfig(0x0008, 0x000F, 0x0012, 0x0008), // Music Mode
	WindowConfig(0x0005, 0x0004, 0x0008, 0x0004), // Naming Box
	WindowConfig(0x000D, 0x0004, 0x0011, 0x0004), // "Name This Friend"
	WindowConfig(0x0001, 0x0009, 0x001E, 0x0010), // Name input box
	WindowConfig(0x0007, 0x0003, 0x0007, 0x0004), // Ness's Name
	WindowConfig(0x0007, 0x0007, 0x0007, 0x0004), // Paula's Name
	WindowConfig(0x0007, 0x000B, 0x0007, 0x0004), // Jeff's Name
	WindowConfig(0x0007, 0x000F, 0x0007, 0x0004), // Poo's Name
	WindowConfig(0x0014, 0x0003, 0x0008, 0x0004), // King's Name
	WindowConfig(0x000F, 0x0007, 0x000D, 0x0006), // Favourite Food
	WindowConfig(0x000F, 0x000D, 0x000D, 0x0006), // Favourite Thing
	WindowConfig(0x0004, 0x0015, 0x0018, 0x0004), // "Are you sure?"
	WindowConfig(0x0012, 0x0006, 0x000D, 0x0008),
	WindowConfig(0x000C, 0x0001, 0x000C, 0x0004),
	WindowConfig(0x0003, 0x0003, 0x001A, 0x0006),
	WindowConfig(0x0001, 0x0001, 0x0007, 0x0004),
	WindowConfig(0x0010, 0x0008, 0x000F, 0x0004),
	WindowConfig(0x000A, 0x0008, 0x0015, 0x0004),
	WindowConfig(0x0004, 0x0008, 0x001B, 0x0004),
	WindowConfig(0x0008, 0x0002, 0x0018, 0x0010),
	WindowConfig(0x0003, 0x000B, 0x000F, 0x0006),
	WindowConfig(0x0004, 0x0001, 0x0008, 0x000A),
	WindowConfig(0x0001, 0x0009, 0x001E, 0x000A),
	WindowConfig(0x0001, 0x0001, 0x001C, 0x0006),
	WindowConfig(0x000A, 0x0004, 0x0014, 0x0004),
	WindowConfig(0x000E, 0x000B, 0x000F, 0x0010), // File select: flavour selection
	WindowConfig(0x0016, 0x0008, 0x0009, 0x0004),
	WindowConfig(0x0007, 0x0009, 0x0012, 0x0012),
];

/// $C3E3F8
immutable ubyte[14] UnknownC3E3F8 = [0x08, 0x09, 0x18, 0x19, 0x0A, 0x09, 0x1A, 0x19, 0x15, 0x24, 0x16, 0x24, 0x15, 0x64];

/// $C3E406
immutable ushort[2] arrC3E406 = [ 0x2441, 0x268D ];

/// $C3E40A
immutable ushort[2] arrC3E40A = [ 0x2451, 0x269D ];

/// $C3E40E
immutable ushort[4] UnknownC3E40E = [ 0x3A69, 0x3A6A, 0x3A6B, 0x3A6C ];

/// $C3E416
immutable ushort[3] BlinkingTriangleTiles = [ 0x3C14, 0x3C15, 0xBC11 ];

/// $C3E43C
immutable ushort[][4] UnknownC3E41CPointerTable = [
	[0x3C16, 0x2E6D, 0x2E6E, 0x7C16],
	[0x3C16, 0x2E7D, 0x2E7E, 0x7C16],
	[0x3C16, 0x2E6D, 0x2C40, 0x7C16],
	[0x3C16, 0x2C40, 0x2E6E, 0x7C16],
];

/// $C3E44C
immutable ubyte[4] UnknownC3E44C = EBString!4("そのた"); //tx6 in EB

/// $C3E450
void UnknownC3E450() {
	const(RGB)* x06;
	if ((Unknown7E0002 & 4) != 0) {
		x06 = &TextWindowFlavourPalettes[TextWindowProperties[gameState.textFlavour].offset / 0x40][4];
	} else {
		x06 = &TextWindowFlavourPalettes[TextWindowProperties[gameState.textFlavour].offset / 0x40][20];
	}
	memcpy(&palettes[1][4], x06, 8);
	Unknown7E0030 = 0x18;
}

/// $C3E4CA - Clear the instant text print flag
void ClearInstantPrinting() {
	InstantPrinting = 0;
}

/// $C3E4D4 - Set the instant text print flag
void SetInstantPrinting() {
	InstantPrinting = 1;
}

/// $C3E4E0
void WindowTickWithoutInstantPrinting() {
	ClearInstantPrinting();
	WindowTick();
	SetInstantPrinting();
}

/// $C3E4EF
short UnknownC3E4EF() {
	for (short i = 0; i != 8; i++) {
		if (WindowStats[i].window_id == -1) {
			return i;
		}
	}
	return -1;
}

/// $C3E521
void CloseWindow(short arg1) {
	if (arg1 == -1) {
		return;
	}
	if (WindowTable[arg1] == -1) {
		return;
	}
	if (CurrentFocusWindow == arg1) {
		CurrentFocusWindow = -1;
	}
	UnknownC3E7E3(arg1);
	short x14 = WindowStats[WindowTable[arg1]].next;
	short x12 = WindowStats[WindowTable[arg1]].prev;
	if (x14 == -1) {
		window_tail = x12;
	} else {
		WindowStats[x14].prev = x12;
	}
	if (x12 == -1) {
		window_head = x14;
	} else {
		WindowStats[x12].next = x14;
	}
	WindowStats[WindowTable[arg1]].window_id = -1;
	WindowTable[arg1] = -1;
	ushort* x0E = &bg2Buffer[WindowStats[WindowTable[arg1]].y * 32 + WindowStats[WindowTable[arg1]].x];
	ushort* x14_2 = WindowStats[WindowTable[arg1]].tilemapBuffer;
	for (short i = 0; i < WindowStats[WindowTable[arg1]].width * WindowStats[WindowTable[arg1]].height; i++) {
		if ((x14_2[0] == 0x40) || (x14_2[0] == 0)) {
			UnknownC44AF7(x14_2[0]);
		}
		x14_2[0] = 0x40;
		x14_2++;
	}
	for (short i = 0; i != WindowStats[WindowTable[arg1]].height + 2; i++) {
		for (short j = 0; j != WindowStats[WindowTable[arg1]].width + 2; j++) {
			*(x0E++) = 0;
		}
		x0E += 32 - WindowStats[WindowTable[arg1]].width - 2;
	}
	UnknownC45E96();
	if (WindowStats[WindowTable[arg1]].title_id != 0) {
		Unknown7E894E[WindowStats[WindowTable[arg1]].title_id - 1] = -1;
	}
	WindowStats[WindowTable[arg1]].title_id = 0;
	Unknown7E9623 = 1;
	if (Unknown7E5E7A == arg1) {
		Unknown7E5E7A = -1;
	}
	if (Unknown7E5E70 == 0) {
		WindowTickWithoutInstantPrinting();
		ClearInstantPrinting();
	}
	Unknown7E5E75 = 0;
}

/// $C3E6F8
void UnknownC3E6F8() {
	if (BattleMenuCurrentCharacterID == -1) {
		return;
	}
	WaitUntilNextFrame();

	ushort* y = &Unknown7E827E[0x10 - (BattleMenuCurrentCharacterID * 7) + (gameState.playerControlledPartyMemberCount * 7) / 2];
	for (short i = 7; i != 0; i--) {
		*y = 0;
		y++;
	}
	BattleMenuCurrentCharacterID = -1;
	Unknown7E9623 = 1;
}

/// $C3E75D
void UnknownC3E75D(short arg1) {
	short a;
	if (arg1 == 0) {
		if (Unknown7E9658 == -1) {
			Unknown7E5E77 = 0;
			return;
		}
		if (Unknown7E5E77 == 0) {
			return;
		}
		a = Unknown7E9658;
	} else {
		if (Unknown7E965A == -1) {
			Unknown7E5E78 = 0;
			return;
		}
		if (Unknown7E5E78 == 0) {
			return;
		}
		a = Unknown7E965A;
	}
	if (EnemyConfigurationTable[a].theFlag != 0) {
		if (Unknown7E5E76 == EBChar('@')) {
			UnknownC447FB(4, &Thethe[0][0]);
		} else {
			UnknownC447FB(4, &Thethe[1][0]);
		}
	}
}

/// $C3E7E3
void UnknownC3E7E3(short arg1) {
	if (arg1 == -1) {
		return;
	}
	if (WindowStats[WindowTable[arg1]].current_option == -1) {
		return;
	}
	MenuOpt* x = &MenuOptions[WindowStats[WindowTable[arg1]].current_option];
	while (true) {
		x.field00 = 0;
		if (x.next == -1) {
			break;
		}
		x++;
	}
	WindowStats[WindowTable[arg1]].selected_option = -1;
	WindowStats[WindowTable[arg1]].option_count = -1;
	WindowStats[WindowTable[arg1]].current_option = -1;
	WindowStats[WindowTable[arg1]].menu_columns = 1;
	WindowStats[WindowTable[arg1]].menu_page = 1;
}

/// $C3E84E
immutable ushort[10] UnknownC3E84E = [ 0x0130, 0x0131, 0x0132, 0x0133, 0x0134, 0x0135, 0x0136, 0x0137, 0x0138, 0x0000 ];

/// $C3E862
immutable ushort[9] UnknownC3E862 = [ 0x0140, 0x0141, 0x0142, 0x0143, 0x0144, 0x0145, 0x0146, 0x0147, 0x0148 ];

/// $C3E874
immutable ubyte[10][24] DebugMenuText = [
	EBString!10("Flag"),
	EBString!10("Goods"),
	EBString!10("Save"),
	EBString!10("Apple"),
	EBString!10("Banana"),
	EBString!10("TV"),
	EBString!10("Event"),
	EBString!10("Warp"),
	EBString!10("Tea"),
	EBString!10("テレポ"), //Teleport
	EBString!10("スターα"), //Star α
	EBString!10("スターβ"), //Star β
	EBString!10("プレーヤー0"), //Player 0
	EBString!10("プレーヤー1"), //Player 1
	EBString!10("GUIDE"),
	EBString!10("TRACK"),
	EBString!10("CAST"),
	EBString!10("STONE"),
	EBString!10("STAFF"),
	EBString!10("メーター"), //Meter
	EBString!10("REPLAY"),
	EBString!10("TEST1"),
	EBString!10("TEST2"),
	EBString!10(""),
];

/// $C3E970
immutable ubyte[3] DebugOnText = EBStringz("ON");

/// $C3E973
immutable ubyte[4] DebugOffText = EBStringz("OFF");

/// $C3E977
short GetCharacterItem(short arg1, short arg2) {
	return PartyCharacters[arg1 - 1].items[arg2 - 1];
}

/// $C3E9F7
short UnknownC3E9F7(short arg1, short arg2) {
	arg1--;
	if (PartyCharacters[arg1].equipment[EquipmentSlot.Weapon] != 0) {
		if (PartyCharacters[arg1].items[PartyCharacters[arg1].equipment[EquipmentSlot.Weapon] - 1] == arg2) {
			return 1;
		}
		if (PartyCharacters[arg1].items[PartyCharacters[arg1].equipment[EquipmentSlot.Body] - 1] == arg2) {
			return 1;
		}
		if (PartyCharacters[arg1].items[PartyCharacters[arg1].equipment[EquipmentSlot.Arms] - 1] == arg2) {
			return 1;
		}
		if (PartyCharacters[arg1].items[PartyCharacters[arg1].equipment[EquipmentSlot.Other] - 1] == arg2) {
			return 1;
		}
	}
	return 0;
}

/// $C3E9A0
short CheckItemEquipped(short arg1, short arg2) {
	if (PartyCharacters[arg1 - 1].equipment[0] == arg2) {
		return 1;
	}
	if (PartyCharacters[arg1 - 1].equipment[1] == arg2) {
		return 1;
	}
	if (PartyCharacters[arg1 - 1].equipment[2] == arg2) {
		return 1;
	}
	if (PartyCharacters[arg1 - 1].equipment[3] == arg2) {
		return 1;
	}
	return 0;
}

/// $C3EAD0
void UnknownC3EAD0(short arg1) {
	for (short i = 0; TimedItemTransformationTable[i].item != 0; i++) {
		if (arg1 != TimedItemTransformationTable[i].item) {
			continue;
		}
		if (IsValidItemTransformation(i) != 0) {
			return;
		}
		InitializeItemTransformation(i);
		return;
	}
}

/// $C3EB1C
void UnknownC3EB1C(short arg1) {
	short x14 = 0;
	for (; (TimedItemTransformationTable[x14].sfx != 0) && (TimedItemTransformationTable[x14].item != arg1); x14++) {}
	UnknownC48F98(arg1);
	for (short x12 = 0; x12 < gameState.playerControlledPartyMemberCount; x12++) {
		for (short x10 = 0; (x10 < 14) && (PartyCharacters[gameState.partyMembers[x12] - 1].items[x10] != 0); x10++) {
			if (PartyCharacters[gameState.partyMembers[x12] - 1].items[x10] != arg1) {
				InitializeItemTransformation(x14);
				return;
			}
		}
	}
}

/// $C3EBCA
void UnknownC3EBCA() {
	for (short i = 0; TimedItemTransformationTable[i].item != 0; i++) {
		if (FindItemInInventory2(0xFF, TimedItemTransformationTable[i].item) != 0) {
			UnknownC3EAD0(TimedItemTransformationTable[i].item);
		} else {
			UnknownC3EB1C(TimedItemTransformationTable[i].item);
		}
	}
}

/// $C3EC1F
void UnknownC3EC1F(short arg1, short arg2, short arg3) {
	if (arg1 == 0) {
		return;
	}
	if (arg3 == 0) {
		arg2 = cast(short)((arg2 * PartyCharacters[arg1 - 1].maxHP) / 100);
	}
	PartyCharacters[arg1 - 1].hp.target -= arg2;
	if (PartyCharacters[arg1 - 1].hp.target > PartyCharacters[arg1 - 1].maxHP) {
		PartyCharacters[arg1 - 1].hp.target = 0;
	}
}

/// $C3EC8B
void UnknownC3EC8B(short arg1, short arg2, short arg3) {
	if (arg1 == 0) {
		return;
	}
	if (arg3 == 0) {
		arg2 = cast(short)((arg2 * PartyCharacters[arg1 - 1].maxHP) / 100);
	}
	PartyCharacters[arg1 - 1].hp.target += arg2;
	if (PartyCharacters[arg1 - 1].hp.current.integer == 0) {
		PartyCharacters[arg1 - 1].hp.current.integer = 1;
	}
	if (PartyCharacters[arg1 - 1].hp.target > PartyCharacters[arg1 - 1].maxHP) {
		PartyCharacters[arg1 - 1].hp.target = PartyCharacters[arg1 - 1].maxHP;
	}
}

/// $C3ED2C
void UnknownC3ED2C(short arg1, short arg2, short arg3) {
	if (arg1 == 0) {
		return;
	}
	if (arg3 == 0) {
		arg2 = cast(short)((arg2 * PartyCharacters[arg1 - 1].maxPP) / 100);
	}
	PartyCharacters[arg1 - 1].pp.target -= arg2;
	if (PartyCharacters[arg1 - 1].pp.target > PartyCharacters[arg1 - 1].maxPP) {
		PartyCharacters[arg1 - 1].pp.target = 0;
	}
}

/// $C3ED98
void UnknownC3ED98(short arg1, short arg2, short arg3) {
	if (arg1 == 0) {
		return;
	}
	if (arg3 == 0) {
		arg2 = cast(short)((arg2 * PartyCharacters[arg1 - 1].maxPP) / 100);
	}
	PartyCharacters[arg1 - 1].pp.target += arg2;
	if (PartyCharacters[arg1 - 1].pp.target > PartyCharacters[arg1 - 1].maxPP) {
		PartyCharacters[arg1 - 1].pp.target = PartyCharacters[arg1 - 1].maxPP;
	}
}

/// $C3EE14
short UnknownC3EE14(short arg1, short arg2) {
	if ((ItemData[arg2].flags & ItemUsableFlags[arg1]) != 0) {
		return 1;
	} else {
		return 0;
	}
}

/// $C3EE4D
void UnknownC3EE4D() {
	UpdateParty();
	UnknownC07B52();
	UnknownC1004E();
	UnknownC0943C();
	if (Unknown7EB4A8 == -1) {
		return;
	}
	EntityTickCallbackFlags[Unknown7EB4A8] &= 0xFFFF ^ (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED);
}

/// $C3EE7A
WorkingMemory UnknownC3EE7A(short arg1) {
	WorkingMemory result;
	if ((CC1C01Table[arg1].size & 0x80) != 0) {
		switch (CC1C01Table[arg1].size & 0x7F) {
			case 1:
				result.integer = *cast(ubyte*)CC1C01Table[arg1].address;
				break;
			case 2:
				result.integer = *cast(ushort*)CC1C01Table[arg1].address;
				break;
			default:
				result.integer = *cast(uint*)CC1C01Table[arg1].address;
				break;
		}
	} else {
		result.pointer = cast(void*)CC1C01Table[arg1].address;
	}
	return result;
}

/// $C3EF23
void NullC3EF23(short) {
	//do nothing
}

/// $C3F054
immutable FontConfig[5] FontConfigTable = [
	FontConfig(null, null, 32, 16), //main font
	FontConfig(null, null, 32, 16), //mr saturn font
	FontConfig(null, null, 16, 16), //battle font
	FontConfig(null, null, 8, 8), //tiny font
	FontConfig(null, null, 32, 16), //large font
];

/// $C3F112
immutable ubyte[2][5] PSISuffixes = [
	EBString!2("~"),
	EBString!2("^"),
	EBString!2("["),
	EBString!2("]"),
	EBString!2("#"),
];

/// $C3F1EC
short UnknownC3F1EC(short arg1) {
	if (UnknownC2239D(3) == 0) {
		return 0;
	}
	for (short i = 0; (i < 14) && (PartyCharacters[3].items[i] != 0); i++) {
		short x0E = PartyCharacters[3].items[i];
		if (ItemData[x0E].type != 8) {
			continue;
		}
		if (ItemData[x0E].parameters.epi > PartyCharacters[3].iq) {
			continue;
		}
		if (randMod(99) >= arg1) {
			continue;
		}
		PartyCharacters[3].items[i] = ItemData[x0E].parameters.ep;
		return x0E;
	}
	return 0;
}

/// $C3F2B1
immutable ubyte[4] UnknownC3F2B1 = [8, 4, 4, 4];

/// $C3F2B5
immutable ushort[8][17] PartyCharacterGraphicsTable = [
	[
		OverworldSprite.Ness,
		OverworldSprite.NessAngel,
		OverworldSprite.NessClimbingUp,
		OverworldSprite.NessClimbingDown,
		OverworldSprite.LilNess,
		OverworldSprite.LilAngel,
		OverworldSprite.NessRobot,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.Paula,
		OverworldSprite.PaulaAngel,
		OverworldSprite.PaulaClimbingUp,
		OverworldSprite.PaulaClimbingDown,
		OverworldSprite.LilPaula,
		OverworldSprite.LilAngel,
		OverworldSprite.Robot,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.Jeff,
		OverworldSprite.JeffAngel,
		OverworldSprite.JeffClimbingUp,
		OverworldSprite.JeffClimbingDown,
		OverworldSprite.LilJeff,
		OverworldSprite.LilAngel,
		OverworldSprite.Robot,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.Poo,
		OverworldSprite.PooAngel,
		OverworldSprite.PooClimbingUp,
		OverworldSprite.PooClimbingDown,
		OverworldSprite.LilPoo,
		OverworldSprite.LilAngel,
		OverworldSprite.Robot,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.Pokey,
		OverworldSprite.Pokey,
		OverworldSprite.Pokey,
		OverworldSprite.Pokey,
		OverworldSprite.Pokey,
		OverworldSprite.Pokey,
		OverworldSprite.Pokey,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.Picky,
		OverworldSprite.Picky,
		OverworldSprite.Picky,
		OverworldSprite.Picky,
		OverworldSprite.Picky,
		OverworldSprite.Picky,
		OverworldSprite.Picky,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.King,
		OverworldSprite.King,
		OverworldSprite.KingClimbingUp,
		OverworldSprite.KingClimbingDown,
		OverworldSprite.King,
		OverworldSprite.King,
		OverworldSprite.King,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.Tony,
		OverworldSprite.Tony,
		OverworldSprite.Tony,
		OverworldSprite.Tony,
		OverworldSprite.Tony,
		OverworldSprite.Tony,
		OverworldSprite.Tony,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.BubbleMonkey,
		OverworldSprite.BubbleMonkey,
		OverworldSprite.BubbleMonkey,
		OverworldSprite.BubbleMonkeyClimbingUp,
		OverworldSprite.BubbleMonkey,
		OverworldSprite.BubbleMonkey,
		OverworldSprite.BubbleMonkey,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.DungeonMan,
		OverworldSprite.DungeonMan,
		OverworldSprite.DungeonMan,
		OverworldSprite.DungeonMan,
		OverworldSprite.DungeonMan,
		OverworldSprite.DungeonMan,
		OverworldSprite.DungeonMan,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.FlyingMan,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.TeddyBearParty,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.LilTeddyBear,
		OverworldSprite.LilTeddyBear,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.Invalid,
	],
	[
		OverworldSprite.TeddyBearParty,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.LilTeddyBear,
		OverworldSprite.LilTeddyBear,
		OverworldSprite.TeddyBearParty,
		OverworldSprite.Invalid,
	]
];

/// $C3F3C5
short ShowTitleScreen(short arg1) {
	Unknown7E9F75 = arg1;
	short x04 = 0;
	UnknownC08726();
	UnknownC0927C();
	if (0) { //interesting... this is unreachable and the entry statement seems to have been optimized out, but the body, condition and post-body statement remain
		for (short i = 0; i < 30; i++) {
			EntitySpriteMapFlags[i] |= 0x8000;
		}
	}
	UnknownC08D79(11);
	SetOAMSize(3);
	SetBG1VRAMLocation(BGTileMapSize.normal, 0x5800, 0);
	BG3_X_POS = 0;
	BG3_Y_POS = 0;
	BG2_X_POS = 0;
	BG2_Y_POS = 0;
	BG1_X_POS = 0;
	BG1_Y_POS = 0;
	UpdateScreen();
	BG3_X_POS = 0;
	BG3_Y_POS = 0;
	BG2_X_POS = 0;
	BG2_Y_POS = 0;
	BG1_X_POS = 0;
	BG1_Y_POS = 0;
	UpdateScreen();
	UnknownC0EBE0();
	TM_MIRROR = 0x11;
	OAMClear();
	InitEntityWipe(ActionScript.TitleScreen1, 0, 0);
	Unknown7E9641 = 0;
	if (Unknown7E9F75 == 0) {
		memset(&palettes[0][0], 0, 0x200);
		Unknown7E0030 = 0x18;
		UnknownC08744();
		INIDISP_MIRROR = 0xF;
		WaitUntilNextFrame();
		Unknown7E0030 = 0;
		Decomp(&UnknownE1AE7C[0], &palettes[8][0]);
		UnknownC496F9();
		memset(&palettes[0][0], 0, 0x200);
		UnknownC496E7(0x3C, 0x100);
		Unknown7E0030 = 0x18;
		for (short i = 0; 0x3C < i; i++) {
			UnknownC426ED();
			UnknownC1004E();
		}
	} else {
		FadeIn(4, 1);
		for (short i = 0; 0x3C > i; i++) {
			UnknownC1004E();
		}
	}
	short x02 = 0;
	while ((Unknown7E9641 == 0) || (Unknown7E9641 == 2)) {
		if (x04 == 0) {
			if (((pad_press[0] & PAD_A) != 0) || ((pad_press[0] & PAD_B) != 0) || ((pad_press[0] & PAD_START) != 0)) {
				x02 = 1;
				break;
			}
		}
		UnknownC1004E();
	}
	if ((Unknown7E9F75 == 0) && (Unknown7E9641 == 0)) {
		x02 = UnknownEF04DC();
	}
	FadeOutWithMosaic(1, 4, 0);
	if (x04 == 0) {
		Unknown7E9641 = 0;
		UnknownC474A8(/+0+/);
		UnknownC0927C();
		return x02;
	}
	for (short i = 0; i < 0x1E; i++) {
		if ((EntityScriptTable[i] >= ActionScript.TitleScreen1) && (EntityScriptTable[i] <= ActionScript.TitleScreen11)) {
			UnknownC09C35(i);
		}
		EntitySpriteMapFlags[i] &= 0x7FFF;
	}
	UnknownC08726();
	ReloadMap();
	UndrawFlyoverText();
	TM_MIRROR = 0x17;
	FadeIn(1, 1);
	//the original code may not have had an explicit return, but this is what effectively happens
	return 1;
}

/// $C3F819
immutable(Unknown7EAECCEntry)[4] UnknownC3F819 = [
	Unknown7EAECCEntry(0x3C, 0x00, 0x0080, 0x0070, 0x9800, 0x7F00, 0x0000, 0x0000, 0xFF20, 0xFF49, 0xFFFC, 0xFFFD),
	Unknown7EAECCEntry(0x3C, 0x00, 0x0080, 0x0070, 0x8000, 0x8000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000),
	Unknown7EAECCEntry(0x3C, 0x00, 0x0080, 0x0070, 0x8000, 0x8000, 0x0000, 0x0000, 0xFF38, 0xFF50, 0xFFFC, 0xFFFD),
	Unknown7EAECCEntry(0x00, 0x00, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000),
];

/// $C3F871
immutable ushort[32] UnknownC3F871 = [
	0x0000,
	0x0080,
	0x0100,
	0x0180,

	0x0800,
	0x0880,
	0x0900,
	0x0980,
	0x1000,
	0x1080,
	0x1100,
	0x1180,

	0x1800,
	0x1880,
	0x1900,
	0x1980,
	0x2000,
	0x2080,
	0x2100,
	0x2180,

	0x2800,
	0x2880,
	0x2900,
	0x2980,
	0x3000,
	0x3080,
	0x3100,
	0x3180,

	0x3800,
	0x3880,
	0x3900,
	0x3980,
];

/// $C3F8B1
immutable ushort[32] UnknownC3F8B1 = [
	0x0000,
	0x0004,
	0x0008,
	0x000C,

	0x0040,
	0x0044,
	0x0048,
	0x004C,

	0x0080,
	0x0084,
	0x0088,
	0x008C,

	0x00C0,
	0x00C4,
	0x00C8,
	0x00CC,

	0x0100,
	0x0104,
	0x0108,
	0x010C,

	0x0140,
	0x0144,
	0x0148,
	0x014C,

	0x0180,
	0x0184,
	0x0188,
	0x018C,
	0x01C0,
	0x01C4,
	0x01C8,
	0x01CC,
];

/// $C3F8F1
immutable RGB[16][3] UnknownC3F8F1 = [
	[
		RGB(0, 0, 0),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(27, 28, 29),
		RGB(15, 13, 13),
	], [
		RGB(0, 0, 0),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 29, 2),
		RGB(31, 3, 11),
	], [
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(0, 0, 0),
		RGB(15, 13, 13),
	]
];

/// $C3F951
immutable ubyte[3][11] UnknownC3F951 = [
	[31, 0, 0],
	[18, 6, 0],
	[16, 6, 0],
	[0, 0, 10],
	[29, 29, 29],
	[0, 0, 31],
	[26, 14, 14],
	[0, 10, 4],
	[18, 18, 18],
	[18, 18, 31],
	[31, 31, 11],
];

/// $C3F951
immutable ubyte[3][5] UnknownC3F972 = [
	[15, 15, 15],
	[15, 15, 0],
	[15, 7, 15],
	[0, 0, 15],
	[31, 0, 12],
];

/// $C3F981
void UnknownC3F981(short arg1) {
	if (arg1 < 35) {
		ShowPSIAnimation(arg1);
		return;
	}
	if (arg1 < 46) {
		UnknownC2DE0F();
		SetColData(UnknownC3F951[arg1 - 35][0], UnknownC3F951[arg1 - 35][1], UnknownC3F951[arg1 - 35][2]);
		SetColourAddSubMode(0x10, 0x3F);
		UnknownC4A67E(5, 7);
	} else if (arg1 < 49) {
		switch (arg1 + 1) {
			case 47:
				WobbleDuration = 144;
				break;
			case 48:
				ShakeDuration = 300;
				break;
			case 49:
			default:
				break;
		}
	} else if (arg1 < 54) {
		UnknownC2DE0F();
		SetColData(UnknownC3F972[arg1 - 49][0], UnknownC3F972[arg1 - 49][1], UnknownC3F972[arg1 - 49][2]);
		SetColourAddSubMode(0x10, 0x3F);
		if (arg1 < 53) {
			UnknownC4A67E(4, 5);
		} else {
			UnknownC4A67E(2, 4);
		}
	}
}

/// $C3FB09
short UnknownC3FB09() {
	if (currentAttacker.allyOrEnemy == 0) {
		return 0;
	}
	return 1;
}

/// $C3FB2B
immutable ubyte[26] NameRegistryRequestString = EBString!26("Register your name, please");

/// $C3FB45
immutable ubyte[10][26] UnknownC3FB45 = [
	[0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
	[0xAA, 0x00, 0x6A, 0x00, 0x7A, 0x00, 0x8A, 0x00, 0x9A, 0x00],
	[0x62, 0x00, 0x74, 0x00, 0x82, 0x00, 0x94, 0x00, 0xA2, 0x00],
	[0x97, 0x00, 0x97, 0x71, 0x97, 0x8E, 0xA7, 0x00, 0x67, 0x00],
	[0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
	[0x89, 0x61, 0x89, 0x71, 0x89, 0x00, 0x89, 0x91, 0x89, 0xA1],
	[0x93, 0x00, 0xA3, 0x00, 0x63, 0x00, 0x73, 0x00, 0x83, 0x00],
	[0x89, 0x00, 0x89, 0x00, 0x89, 0x00, 0x89, 0x00, 0x89, 0x00],
	[0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
	[0x75, 0x6E, 0x75, 0x00, 0x75, 0x8E, 0x75, 0x91, 0x75, 0xAE],
	[0x63, 0x00, 0x73, 0x00, 0x83, 0x00, 0x93, 0x00, 0xA3, 0x00],
	[0x7F, 0x00, 0x8F, 0x00, 0x9F, 0x00, 0xAF, 0x00, 0x6F, 0x00],
	[0xAC, 0x00, 0x9C, 0x00, 0x9C, 0x00, 0xAC, 0x00, 0x9C, 0x00],
	[0x6C, 0x00, 0x7C, 0x00, 0x8C, 0x00, 0x9C, 0x00, 0xAC, 0x00],
	[0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
	[0x6B, 0x00, 0x7B, 0x00, 0x8B, 0x00, 0x9B, 0x00, 0xAB, 0x00],
	[0x82, 0x61, 0x82, 0x71, 0x82, 0x81, 0x82, 0x91, 0x82, 0xA1],
	[0x9F, 0x00, 0x9F, 0x00, 0x9F, 0x00, 0x9F, 0x00, 0x9F, 0x00],
	[0x94, 0x00, 0xA4, 0x00, 0x64, 0x00, 0x74, 0x00, 0x84, 0x00],
	[0x96, 0x00, 0x96, 0x71, 0xA6, 0x81, 0x96, 0x71, 0x66, 0x81],
	[0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00],
	[0x6A, 0x00, 0x7A, 0x00, 0x8A, 0x00, 0x9A, 0x00, 0xAA, 0x00],
	[0x80, 0x71, 0x80, 0x71, 0x80, 0x00, 0x80, 0x91, 0x80, 0x71],
	[0x65, 0x00, 0x85, 0x71, 0x85, 0x00, 0x95, 0x00, 0xA5, 0x00],
	[0x7D, 0x00, 0x70, 0x00, 0x80, 0x00, 0x70, 0x91, 0x9E, 0x00],
	[0xA5, 0x00, 0x65, 0x00, 0x75, 0x00, 0x85, 0x00, 0x95, 0x00],
];

/// $C3FAC9
short UnknownC3FAC9(short arg1, short arg2) {
	if (currentTarget.npcID == EnemyID.TinyLilGhost) {
		return 1;
	}
	if (currentTarget.allyOrEnemy == 0) {
		UnknownC3F981(arg1);
		return 0;
	}
	UnknownC3F981(arg2);
	return 1;
}

/// $C3FB1F
immutable uint[3] UnknownC3FB1F = [
	0x12000,
	0x11800,
	0x11000,
];

/// $C3FD2D
immutable NamingScreenEntity[][14] UnknownC3FD2D = [
	[
		NamingScreenEntity(OverworldSprite.Ness, ActionScript.Unknown502),
		NamingScreenEntity(OverworldSprite.NessPosing, ActionScript.Unknown503),
		NamingScreenEntity(OverworldSprite.NESS_SURPRISED, ActionScript.Unknown504),
		NamingScreenEntity(OverworldSprite.SMALL_SHADOW, ActionScript.Unknown505),
		NamingScreenEntity(OverworldSprite.SURPRISE_MARK, ActionScript.Unknown506),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.Paula, ActionScript.Unknown507),
		NamingScreenEntity(OverworldSprite.PAULA_SURPRISED, ActionScript.Unknown508),
		NamingScreenEntity(OverworldSprite.SMALL_SHADOW, ActionScript.Unknown509),
		NamingScreenEntity(OverworldSprite.MUSIC_NOTES, ActionScript.Unknown510),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.Jeff, ActionScript.Unknown511),
		NamingScreenEntity(OverworldSprite.SURPRISE_MARK, ActionScript.Unknown512),
		NamingScreenEntity(OverworldSprite.Sweat, ActionScript.Unknown513),
		NamingScreenEntity(OverworldSprite.LIGHT_BULB, ActionScript.Unknown514),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.Poo, ActionScript.Unknown515),
		NamingScreenEntity(OverworldSprite.POO_MEDITATING, ActionScript.Unknown516),
		NamingScreenEntity(OverworldSprite.PooClimbingUp, ActionScript.Unknown517),
		NamingScreenEntity(OverworldSprite.STAR_MASTERS_POOF_CLOUD, ActionScript.Unknown518),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.King, ActionScript.Unknown521),
		NamingScreenEntity(OverworldSprite.NessDogSleeping, ActionScript.Unknown522),
		NamingScreenEntity(OverworldSprite.Ness, ActionScript.Unknown520),
		NamingScreenEntity(OverworldSprite.ZZZ, ActionScript.Unknown523),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.FRENCH_KISS_OF_DEATH, ActionScript.Unknown524),
		NamingScreenEntity(OverworldSprite.A_PLATE, ActionScript.Unknown526),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.FRENCH_KISS_OF_DEATH, ActionScript.Unknown528),
		NamingScreenEntity(OverworldSprite.TWINKLING_STARS, ActionScript.Unknown530),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.Ness, ActionScript.Unknown532),
		NamingScreenEntity(OverworldSprite.NessPosing, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.NESS_SURPRISED, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.SMALL_SHADOW, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.SURPRISE_MARK, ActionScript.Unknown035),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.Paula, ActionScript.Unknown532),
		NamingScreenEntity(OverworldSprite.PAULA_SURPRISED, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.SMALL_SHADOW, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.MUSIC_NOTES, ActionScript.Unknown035),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.Jeff, ActionScript.Unknown532),
		NamingScreenEntity(OverworldSprite.SURPRISE_MARK, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.Sweat, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.LIGHT_BULB, ActionScript.Unknown035),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.Poo, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.POO_MEDITATING, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.PooClimbingUp, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.STAR_MASTERS_POOF_CLOUD, ActionScript.Unknown519),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.King, ActionScript.Unknown533),
		NamingScreenEntity(OverworldSprite.NessDogSleeping, ActionScript.Unknown035),
		NamingScreenEntity(OverworldSprite.Ness, ActionScript.Unknown532),
		NamingScreenEntity(OverworldSprite.ZZZ, ActionScript.Unknown035),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.FRENCH_KISS_OF_DEATH, ActionScript.Unknown525),
		NamingScreenEntity(OverworldSprite.A_PLATE, ActionScript.Unknown527),
		NamingScreenEntity(0x0000)
	],	[
		NamingScreenEntity(OverworldSprite.FRENCH_KISS_OF_DEATH, ActionScript.Unknown529),
		NamingScreenEntity(OverworldSprite.TWINKLING_STARS, ActionScript.Unknown035),
		NamingScreenEntity(0x0000)
	]
];

/// $C3FD65
immutable FileSelectSummarySpriteConfigEntry[5] FileSelectSummarySpriteConfig = [
	FileSelectSummarySpriteConfigEntry(OverworldSprite.Ness, ActionScript.Unknown861, 40, 44),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.Paula, ActionScript.Unknown861, 40, 76),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.Jeff, ActionScript.Unknown861, 40, 108),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.Poo, ActionScript.Unknown861, 40, 140),
	FileSelectSummarySpriteConfigEntry(OverworldSprite.NessDogSleeping, ActionScript.Unknown534, 136, 40)
];

/// $C3FD8D
immutable ubyte[][10] AttractModeText = [
	TextAttractMode0,
	TextAttractMode1,
	TextAttractMode2,
	TextAttractMode3,
	TextAttractMode4,
	TextAttractMode5,
	TextAttractMode6,
	TextAttractMode7,
	TextAttractMode8,
	TextAttractMode9,
];

/// $C3FDBD
immutable ushort[4] UnusedForSaleSignSpriteTable = [
	OverworldSprite.GuyInBlueClothes,
	OverworldSprite.JamaicanGuy,
	OverworldSprite.MrT,
	OverworldSprite.OldGuyWithCane,
];

/// $C3FDB5
immutable ushort[4] UnknownC3FDB5 = [
	0x180,
	0x190,
	0x1A0,
	0x1B0,
];

/// $C3FDC5
short UnknownC3FDC5() {
	//nope. not doing this one, sorry
	return 0;
}
