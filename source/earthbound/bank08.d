module earthbound.bank08;

import earthbound.commondefs;

immutable ubyte* TEXT_NPC_0212;
immutable ubyte* TEXT_BLOCK_C80027;
immutable ubyte* TEXT_BLOCK_C800AC;
immutable ubyte* TEXT_BLOCK_C800B2;
immutable ubyte* TEXT_BLOCK_C800C1;
immutable ubyte* TEXT_BLOCK_C800F5;
immutable ubyte* TEXT_BLOCK_C80140;
immutable ubyte* TEXT_BLOCK_C80146;
immutable ubyte* TEXT_BLOCK_C8015A;
immutable ubyte* TEXT_BLOCK_C80276;
immutable ubyte* TEXT_BLOCK_C80277;
immutable ubyte* TEXT_BLOCK_C802B9;
immutable ubyte* TEXT_BLOCK_C802E6;
immutable ubyte* TEXT_BLOCK_C8034D;
immutable ubyte* TEXT_BLOCK_C8037F;
immutable ubyte* TEXT_BLOCK_C803AC;
immutable ubyte* TEXT_BLOCK_C803F8;
immutable ubyte* TEXT_BLOCK_C80416;
immutable ubyte* TEXT_BLOCK_C8041C;
immutable ubyte* TEXT_BLOCK_C8042B;
immutable ubyte* TEXT_BLOCK_C8045B;
immutable ubyte* TEXT_NPC_0213;
immutable ubyte* TEXT_BLOCK_C8054D;
immutable ubyte* TEXT_BLOCK_C80579;
immutable ubyte* TEXT_BLOCK_C805BA;
immutable ubyte* TEXT_BLOCK_C80673;
immutable ubyte* TEXT_BLOCK_C806BB;
immutable ubyte* TEXT_BLOCK_C80718;
immutable ubyte* TEXT_BLOCK_C807AC;
immutable ubyte* TEXT_BLOCK_C807BA;
immutable ubyte* TEXT_BLOCK_C807BC;
immutable ubyte* TEXT_BLOCK_C8082A;
immutable ubyte* TEXT_BLOCK_C8087A;
immutable ubyte* TEXT_BLOCK_C808BD;
immutable ubyte* TEXT_NPC_0341;
immutable ubyte* TEXT_BLOCK_C8097B;
immutable ubyte* TEXT_BLOCK_C80997;
immutable ubyte* TEXT_NPC_0214;
immutable ubyte* TEXT_BLOCK_C809FC;
immutable ubyte* TEXT_BLOCK_C80A2C;
immutable ubyte* TEXT_BLOCK_C80A47;
immutable ubyte* TEXT_NPC_0215;
immutable ubyte* TEXT_BLOCK_C80B02;
immutable ubyte* TEXT_BLOCK_C80B4B;
immutable ubyte* TEXT_NPC_0216;
immutable ubyte* TEXT_BLOCK_C80BC6;
immutable ubyte* TEXT_BLOCK_C80BE4;
immutable ubyte* TEXT_BLOCK_C80BF2;
immutable ubyte* TEXT_NPC_0217;
immutable ubyte* TEXT_BLOCK_C80CBF;
immutable ubyte* TEXT_BLOCK_C80CC5;
immutable ubyte* TEXT_BLOCK_C80CD4;
immutable ubyte* TEXT_BLOCK_C80DAB;
immutable ubyte* TEXT_BLOCK_C80DD8;
immutable ubyte* TEXT_BLOCK_C80E03;
immutable ubyte* TEXT_BLOCK_C80E61;
immutable ubyte* TEXT_BLOCK_C80EAE;
immutable ubyte* TEXT_BLOCK_C80EB4;
immutable ubyte* TEXT_BLOCK_C80EC3;
immutable ubyte* TEXT_BLOCK_C80EF3;
immutable ubyte* TEXT_BLOCK_C80F1C;
immutable ubyte* TEXT_BLOCK_C80F94;
immutable ubyte* TEXT_BLOCK_C81027;
immutable ubyte* TEXT_BLOCK_C81087;
immutable ubyte* TEXT_NPC_0220;
immutable ubyte* TEXT_BLOCK_C81248;
immutable ubyte* TEXT_BLOCK_C8124E;
immutable ubyte* TEXT_BLOCK_C8125D;
immutable ubyte* TEXT_BLOCK_C81286;
immutable ubyte* TEXT_BLOCK_C812B5;
immutable ubyte* TEXT_BLOCK_C812BB;
immutable ubyte* TEXT_BLOCK_C812D1;
immutable ubyte* TEXT_BLOCK_C812E6;
immutable ubyte* TEXT_BLOCK_C81318;
immutable ubyte* TEXT_BLOCK_C81392;
immutable ubyte* TEXT_BLOCK_C813D4;
immutable ubyte* TEXT_BLOCK_C81418;
immutable ubyte* TEXT_BLOCK_C81475;
immutable ubyte* TEXT_BLOCK_C814B9;
immutable ubyte* TEXT_BLOCK_C81528;
immutable ubyte* TEXT_BLOCK_C8152E;
immutable ubyte* TEXT_BLOCK_C8153D;
immutable ubyte* TEXT_BLOCK_C81585;
immutable ubyte* TEXT_BLOCK_C8159F;
immutable ubyte* TEXT_BLOCK_C815F9;
immutable ubyte* TEXT_NPC_0221;
immutable ubyte* TEXT_BLOCK_C81751;
immutable ubyte* TEXT_BLOCK_C81789;
immutable ubyte* TEXT_BLOCK_C817DC;
immutable ubyte* TEXT_BLOCK_C8180C;
immutable ubyte* TEXT_BLOCK_C81848;
immutable ubyte* TEXT_BLOCK_C818A2;
immutable ubyte* TEXT_BLOCK_C818B9;
immutable ubyte* TEXT_BLOCK_C818DD;
immutable ubyte* TEXT_BLOCK_C818F1;
immutable ubyte* TEXT_BLOCK_C81913;
immutable ubyte* TEXT_BLOCK_C81915;
immutable ubyte* TEXT_NPC_0222;
immutable ubyte* TEXT_BLOCK_C81945;
immutable ubyte* TEXT_BLOCK_C81970;
immutable ubyte* TEXT_BLOCK_C819F1;
immutable ubyte* TEXT_BLOCK_C81A26;
immutable ubyte* TEXT_BLOCK_C81A5D;
immutable ubyte* TEXT_BLOCK_C81A84;
immutable ubyte* TEXT_NPC_0226;
immutable ubyte* TEXT_BLOCK_C81AC4;
immutable ubyte* TEXT_BLOCK_C81ADE;
immutable ubyte* TEXT_BLOCK_C81AFB;
immutable ubyte* TEXT_BLOCK_C81B04;
immutable ubyte* TEXT_NPC_0226_ALT;
immutable ubyte* TEXT_BLOCK_C81B50;
immutable ubyte* TEXT_BLOCK_C81B9B;
immutable ubyte* TEXT_BLOCK_C81BAF;
immutable ubyte* TEXT_NPC_0228;
immutable ubyte* TEXT_NPC_0227;
immutable ubyte* TEXT_BLOCK_C81C2F;
immutable ubyte* TEXT_NPC_0340;
immutable ubyte* TEXT_NPC_0335;
immutable ubyte* TEXT_NPC_0229;
immutable ubyte* TEXT_BLOCK_C81DB5;
immutable ubyte* TEXT_BLOCK_C81DC3;
immutable ubyte* TEXT_NPC_0232;
immutable ubyte* TEXT_NPC_0233;
immutable ubyte* TEXT_BLOCK_C81E23;
immutable ubyte* TEXT_BLOCK_C81E29;
immutable ubyte* TEXT_BLOCK_C81E38;
immutable ubyte* TEXT_BLOCK_C81E7A;
immutable ubyte* TEXT_BLOCK_C81EA3;
immutable ubyte* TEXT_NPC_0234;
immutable ubyte* TEXT_NPC_0235;
immutable ubyte* TEXT_NPC_0336;
immutable ubyte* TEXT_BLOCK_C82049;
immutable ubyte* TEXT_BLOCK_C8207C;
immutable ubyte* TEXT_NPC_0906;
immutable ubyte* TEXT_BLOCK_C8219E;
immutable ubyte* TEXT_BLOCK_C821A3;
immutable ubyte* TEXT_BLOCK_C821B2;
immutable ubyte* TEXT_BLOCK_C821FE;
immutable ubyte* TEXT_BLOCK_C82250;
immutable ubyte* TEXT_BLOCK_C82285;
immutable ubyte* TEXT_NPC_0908;
immutable ubyte* TEXT_BLOCK_C82468;
immutable ubyte* TEXT_BLOCK_C82565;
immutable ubyte* TEXT_NPC_0908_ALT;
immutable ubyte* TEXT_BLOCK_C8259F;
immutable ubyte* TEXT_NPC_0909;
immutable ubyte* TEXT_BLOCK_C826C8;
immutable ubyte* TEXT_NPC_0910;
immutable ubyte* TEXT_NPC_0911;
immutable ubyte* TEXT_NPC_0912;
immutable ubyte* TEXT_NPC_0914;
immutable ubyte* TEXT_NPC_0916;
immutable ubyte* TEXT_NPC_0917;
immutable ubyte* TEXT_BLOCK_C82862;
immutable ubyte* TEXT_BLOCK_C82868;
immutable ubyte* TEXT_BLOCK_C8286E;
immutable ubyte* TEXT_NPC_0920;
immutable ubyte* TEXT_NPC_0921;
immutable ubyte* TEXT_BLOCK_C8289F;
immutable ubyte* TEXT_BLOCK_C828A4;
immutable ubyte* TEXT_BLOCK_C828B3;
immutable ubyte* TEXT_BLOCK_C828CA;
immutable ubyte* TEXT_BLOCK_C8292C;
immutable ubyte* TEXT_BLOCK_C82931;
immutable ubyte* TEXT_BLOCK_C82945;
immutable ubyte* TEXT_BLOCK_C82986;
immutable ubyte* TEXT_BLOCK_C829DF;
immutable ubyte* TEXT_NPC_0922;
immutable ubyte* TEXT_NPC_0923;
immutable ubyte* TEXT_NPC_0924;
immutable ubyte* TEXT_BLOCK_C82A34;
immutable ubyte* TEXT_NPC_0932;
immutable ubyte* TEXT_NPC_0926;
immutable ubyte* TEXT_NPC_0927;
immutable ubyte* TEXT_BLOCK_C82AA8;
immutable ubyte* TEXT_NPC_0928;
immutable ubyte* TEXT_BLOCK_C82B27;
immutable ubyte* TEXT_NPC_0929;
immutable ubyte* TEXT_BLOCK_C82BA8;
immutable ubyte* TEXT_BLOCK_C82BAD;
immutable ubyte* TEXT_BLOCK_C82BBC;
immutable ubyte* TEXT_BLOCK_C82BEB;
immutable ubyte* TEXT_NPC_0930;
immutable ubyte* TEXT_BLOCK_C82C48;
immutable ubyte* TEXT_NPC_0941;
immutable ubyte* TEXT_NPC_0942;
immutable ubyte* TEXT_BLOCK_C82DC7;
immutable ubyte* TEXT_BLOCK_C82DEA;
immutable ubyte* TEXT_NPC_0943;
immutable ubyte* TEXT_BLOCK_C82E8C;
immutable ubyte* TEXT_BLOCK_C82EB1;
immutable ubyte* TEXT_NPC_0944;
immutable ubyte* TEXT_BLOCK_C82F71;
immutable ubyte* TEXT_NPC_0945;
immutable ubyte* TEXT_BLOCK_C82FE7;
immutable ubyte* TEXT_NPC_0946;
immutable ubyte* TEXT_BLOCK_C83060;
immutable ubyte* TEXT_NPC_0947;
immutable ubyte* TEXT_BLOCK_C830F6;
immutable ubyte* TEXT_BLOCK_C83131;
immutable ubyte* TEXT_NPC_0948;
immutable ubyte* TEXT_BLOCK_C83254;
immutable ubyte* TEXT_NPC_0949;
immutable ubyte* TEXT_BLOCK_C8332B;
immutable ubyte* TEXT_BLOCK_C8337E;
immutable ubyte* TEXT_NPC_0950;
immutable ubyte* TEXT_BLOCK_C83457;
immutable ubyte* TEXT_BLOCK_C834A8;
immutable ubyte* TEXT_NPC_0951;
immutable ubyte* TEXT_BLOCK_C83515;
immutable ubyte* TEXT_BLOCK_C8361B;
immutable ubyte* TEXT_NPC_0952;
immutable ubyte* TEXT_BLOCK_C838A0;
immutable ubyte* TEXT_BLOCK_C838A5;
immutable ubyte* TEXT_BLOCK_C838B9;
immutable ubyte* TEXT_BLOCK_C83916;
immutable ubyte* TEXT_BLOCK_C8391B;
immutable ubyte* TEXT_BLOCK_C8392F;
immutable ubyte* TEXT_BLOCK_C83957;
immutable ubyte* TEXT_NPC_0953;
immutable ubyte* TEXT_BLOCK_C83A24;
immutable ubyte* TEXT_NPC_0954;
immutable ubyte* TEXT_BLOCK_C83A6A;
immutable ubyte* TEXT_NPC_0955;
immutable ubyte* TEXT_BLOCK_C83AB3;
immutable ubyte* TEXT_NPC_0956;
immutable ubyte* TEXT_BLOCK_C83B46;
immutable ubyte* TEXT_BLOCK_C83B4B;
immutable ubyte* TEXT_BLOCK_C83B5A;
immutable ubyte* TEXT_BLOCK_C83B7B;
immutable ubyte* TEXT_BLOCK_C83BAF;
immutable ubyte* TEXT_BLOCK_C83BB4;
immutable ubyte* TEXT_BLOCK_C83BC3;
immutable ubyte* TEXT_BLOCK_C83BFC;
immutable ubyte* TEXT_BLOCK_C83C1E;
immutable ubyte* TEXT_BLOCK_C83C2D;
immutable ubyte* TEXT_BLOCK_C83C5D;
immutable ubyte* TEXT_NPC_0957;
immutable ubyte* TEXT_BLOCK_C83CC8;
immutable ubyte* TEXT_NPC_0958;
immutable ubyte* TEXT_BLOCK_C83CF9;
immutable ubyte* TEXT_NPC_0936;
immutable ubyte* TEXT_NPC_0959;
immutable ubyte* TEXT_NPC_0995;
immutable ubyte* TEXT_NPC_0961;
immutable ubyte* TEXT_BLOCK_C83E3C;
immutable ubyte* TEXT_NPC_0962;
immutable ubyte* TEXT_NPC_0963;
immutable ubyte* TEXT_NPC_0964;
immutable ubyte* TEXT_NPC_0965;
immutable ubyte* TEXT_NPC_0966;
immutable ubyte* TEXT_NPC_0904;
immutable ubyte* TEXT_BLOCK_C83FAF;
immutable ubyte* TEXT_NPC_0860;
immutable ubyte* TEXT_BLOCK_C83FE6;
immutable ubyte* TEXT_NPC_0902;
immutable ubyte* TEXT_NPC_0851;
immutable ubyte* TEXT_NPC_0852;
immutable ubyte* TEXT_NPC_0969;
immutable ubyte* TEXT_BLOCK_C841DE;
immutable ubyte* TEXT_BLOCK_C842A5;
immutable ubyte* TEXT_BLOCK_C842A8;
immutable ubyte* TEXT_BLOCK_C842AB;
immutable ubyte* TEXT_BLOCK_C842AE;
immutable ubyte* TEXT_BLOCK_C842B1;
immutable ubyte* TEXT_BLOCK_C842B4;
immutable ubyte* TEXT_BLOCK_C842B7;
immutable ubyte* TEXT_BLOCK_C842BA;
immutable ubyte* TEXT_BLOCK_C842BD;
immutable ubyte* TEXT_BLOCK_C842C0;
immutable ubyte* TEXT_BLOCK_C842C3;
immutable ubyte* TEXT_BLOCK_C842C6;
immutable ubyte* TEXT_BLOCK_C842C9;
immutable ubyte* TEXT_BLOCK_C842CC;
immutable ubyte* TEXT_BLOCK_C842CF;
immutable ubyte* TEXT_BLOCK_C842D2;
immutable ubyte* TEXT_BLOCK_C842D5;
immutable ubyte* TEXT_BLOCK_C842D8;
immutable ubyte* TEXT_BLOCK_C842DB;
immutable ubyte* TEXT_BLOCK_C842DE;
immutable ubyte* TEXT_BLOCK_C842E1;
immutable ubyte* TEXT_BLOCK_C842E4;
immutable ubyte* TEXT_BLOCK_C842E7;
immutable ubyte* TEXT_BLOCK_C842EA;
immutable ubyte* TEXT_BLOCK_C842ED;
immutable ubyte* TEXT_BLOCK_C842F0;
immutable ubyte* TEXT_BLOCK_C842F3;
immutable ubyte* TEXT_BLOCK_C842F6;
immutable ubyte* TEXT_NPC_0064;
immutable ubyte* TEXT_BLOCK_C8437A;
immutable ubyte* TEXT_BLOCK_C843A7;
immutable ubyte* TEXT_BLOCK_C843C8;
immutable ubyte* TEXT_BLOCK_C843F6;
immutable ubyte* TEXT_BLOCK_C8442C;
immutable ubyte* TEXT_BLOCK_C8444C;
immutable ubyte* TEXT_BLOCK_C84485;
immutable ubyte* TEXT_BLOCK_C844BD;
immutable ubyte* TEXT_BLOCK_C844EA;
immutable ubyte* TEXT_BLOCK_C84525;
immutable ubyte* TEXT_BLOCK_C8455F;
immutable ubyte* TEXT_BLOCK_C84608;
immutable ubyte* TEXT_BLOCK_C84657;
immutable ubyte* TEXT_BLOCK_C84693;
immutable ubyte* TEXT_BLOCK_C846B6;
immutable ubyte* TEXT_BLOCK_C846FC;
immutable ubyte* TEXT_BLOCK_C84728;
immutable ubyte* TEXT_BLOCK_C8474D;
immutable ubyte* TEXT_BLOCK_C8477F;
immutable ubyte* TEXT_BLOCK_C847E6;
immutable ubyte* TEXT_BLOCK_C8481A;
immutable ubyte* TEXT_BLOCK_C8484C;
immutable ubyte* TEXT_BLOCK_C848A4;
immutable ubyte* TEXT_BLOCK_C848DB;
immutable ubyte* TEXT_BLOCK_C84930;
immutable ubyte* TEXT_BLOCK_C84973;
immutable ubyte* TEXT_BLOCK_C849AA;
immutable ubyte* TEXT_NPC_0260;
immutable ubyte* TEXT_BLOCK_C84A6E;
immutable ubyte* TEXT_BLOCK_C84A8A;
immutable ubyte* TEXT_BLOCK_C84AAD;
immutable ubyte* TEXT_BLOCK_C84AD7;
immutable ubyte* TEXT_BLOCK_C84B3F;
immutable ubyte* TEXT_BLOCK_C84B5E;
immutable ubyte* TEXT_BLOCK_C84BBB;
immutable ubyte* TEXT_BLOCK_C84BEE;
immutable ubyte* TEXT_BLOCK_C84C1B;
immutable ubyte* TEXT_BLOCK_C84CAC;
immutable ubyte* TEXT_BLOCK_C84CFA;
immutable ubyte* TEXT_BLOCK_C84D38;
immutable ubyte* TEXT_BLOCK_C84D6B;
immutable ubyte* TEXT_BLOCK_C84D9C;
immutable ubyte* TEXT_BLOCK_C84DBC;
immutable ubyte* TEXT_BLOCK_C84DEB;
immutable ubyte* TEXT_BLOCK_C84E1F;
immutable ubyte* TEXT_BLOCK_C84E64;
immutable ubyte* TEXT_BLOCK_C84F19;
immutable ubyte* TEXT_BLOCK_C84F55;
immutable ubyte* TEXT_BLOCK_C84F98;
immutable ubyte* TEXT_NPC_0490;
immutable ubyte* TEXT_BLOCK_C85059;
immutable ubyte* TEXT_BLOCK_C85065;
immutable ubyte* TEXT_BLOCK_C850D8;
immutable ubyte* TEXT_BLOCK_C850E6;
immutable ubyte* TEXT_BLOCK_C850FF;
immutable ubyte* TEXT_BLOCK_C8514F;
immutable ubyte* TEXT_BLOCK_C8519E;
immutable ubyte* TEXT_BLOCK_C851E9;
immutable ubyte* TEXT_BLOCK_C8522F;
immutable ubyte* TEXT_BLOCK_C85291;
immutable ubyte* TEXT_BLOCK_C852F0;
immutable ubyte* TEXT_BLOCK_C8533A;
immutable ubyte* TEXT_BLOCK_C85370;
immutable ubyte* TEXT_BLOCK_C853B0;
immutable ubyte* TEXT_BLOCK_C8544C;
immutable ubyte* TEXT_BLOCK_C8549D;
immutable ubyte* TEXT_BLOCK_C854CC;
immutable ubyte* TEXT_BLOCK_C85507;
immutable ubyte* TEXT_BLOCK_C85548;
immutable ubyte* TEXT_BLOCK_C855D4;
immutable ubyte* TEXT_BLOCK_C85610;
immutable ubyte* TEXT_BLOCK_C85651;
immutable ubyte* TEXT_NPC_0895;
immutable ubyte* TEXT_BLOCK_C856FC;
immutable ubyte* TEXT_BLOCK_C8574A;
immutable ubyte* TEXT_BLOCK_C85767;
immutable ubyte* TEXT_BLOCK_C85791;
immutable ubyte* TEXT_BLOCK_C857BB;
immutable ubyte* TEXT_BLOCK_C8581B;
immutable ubyte* TEXT_BLOCK_C858BA;
immutable ubyte* TEXT_BLOCK_C858F0;
immutable ubyte* TEXT_BLOCK_C85985;
immutable ubyte* TEXT_BLOCK_C859B5;
immutable ubyte* TEXT_BLOCK_C85A11;
immutable ubyte* TEXT_BLOCK_C85A6C;
immutable ubyte* TEXT_BLOCK_C85AD8;
immutable ubyte* TEXT_BLOCK_C85B55;
immutable ubyte* TEXT_BLOCK_C85BAB;
immutable ubyte* TEXT_NPC_1019;
immutable ubyte* TEXT_BLOCK_C85C55;
immutable ubyte* TEXT_BLOCK_C85C76;
immutable ubyte* TEXT_BLOCK_C85C99;
immutable ubyte* TEXT_BLOCK_C85CD3;
immutable ubyte* TEXT_BLOCK_C85D13;
immutable ubyte* TEXT_BLOCK_C85D45;
immutable ubyte* TEXT_BLOCK_C85DE3;
immutable ubyte* TEXT_BLOCK_C85E27;
immutable ubyte* TEXT_BLOCK_C85E65;
immutable ubyte* TEXT_BLOCK_C85EB1;
immutable ubyte* TEXT_BLOCK_C85F32;
immutable ubyte* TEXT_NPC_1126;
immutable ubyte* TEXT_BLOCK_C85FF7;
immutable ubyte* TEXT_BLOCK_C8603C;
immutable ubyte* TEXT_BLOCK_C86059;
immutable ubyte* TEXT_BLOCK_C86088;
immutable ubyte* TEXT_BLOCK_C860B9;
immutable ubyte* TEXT_BLOCK_C860E4;
immutable ubyte* TEXT_BLOCK_C86112;
immutable ubyte* TEXT_BLOCK_C86147;
immutable ubyte* TEXT_BLOCK_C86186;
immutable ubyte* TEXT_NPC_1373;
immutable ubyte* TEXT_DOOR_150;
immutable ubyte* TEXT_BLOCK_C862B8;
immutable ubyte* TEXT_BLOCK_C862E3;
immutable ubyte* TEXT_BLOCK_C862E8;
immutable ubyte* TEXT_BLOCK_C862F7;
immutable ubyte* TEXT_BLOCK_C862F8;
immutable ubyte* TEXT_BLOCK_C86311;
immutable ubyte* TEXT_BLOCK_C86320;
immutable ubyte* TEXT_DOOR_128;
immutable ubyte* TEXT_DOOR_129;
immutable ubyte* TEXT_DOOR_131;
immutable ubyte* TEXT_DOOR_133;
immutable ubyte* TEXT_DOOR_135;
immutable ubyte* TEXT_DOOR_136;
immutable ubyte* TEXT_DOOR_137;
immutable ubyte* TEXT_DOOR_138;
immutable ubyte* TEXT_DOOR_144;
immutable ubyte* TEXT_DOOR_145;
immutable ubyte* TEXT_DOOR_148;
immutable ubyte* TEXT_DOOR_149;
immutable ubyte* TEXT_DOOR_274;
immutable ubyte* TEXT_DOOR_275;
immutable ubyte* TEXT_BLOCK_C86591;
immutable ubyte* TEXT_DOOR_241;
immutable ubyte* TEXT_BLOCK_C865F3;
immutable ubyte* TEXT_DOOR_245;
immutable ubyte* TEXT_BLOCK_C86646;
immutable ubyte* TEXT_DOOR_246;
immutable ubyte* TEXT_DOOR_247;
immutable ubyte* TEXT_NPC_0365;
immutable ubyte* TEXT_NPC_0361;
immutable ubyte* TEXT_DOOR_364;
immutable ubyte* TEXT_DOOR_363;
immutable ubyte* TEXT_BLOCK_C8672B;
immutable ubyte* TEXT_DOOR_356;
immutable ubyte* TEXT_DOOR_360;
immutable ubyte* TEXT_DOOR_361;
immutable ubyte* TEXT_DOOR_358;
immutable ubyte* TEXT_DOOR_347;
immutable ubyte* TEXT_BLOCK_C8688E;
immutable ubyte* TEXT_BLOCK_C8689C;
immutable ubyte* TEXT_DOOR_672;
immutable ubyte* TEXT_DOOR_673;
immutable ubyte* TEXT_DOOR_674;
immutable ubyte* TEXT_DOOR_976;
immutable ubyte* TEXT_DOOR_957;
immutable ubyte* TEXT_DOOR_958;
immutable ubyte* TEXT_DOOR_741;
immutable ubyte* TEXT_DOOR_676;
immutable ubyte* TEXT_DOOR_677;
immutable ubyte* TEXT_DOOR_678;
immutable ubyte* TEXT_DOOR_155;
immutable ubyte* TEXT_DOOR_156;
immutable ubyte* TEXT_BLOCK_C86B8F;
immutable ubyte* TEXT_DOOR_737;
immutable ubyte* TEXT_DOOR_348;
immutable ubyte* TEXT_DOOR_248;
immutable ubyte* TEXT_DOOR_679;
immutable ubyte* TEXT_DOOR_680;
immutable ubyte* TEXT_BLOCK_C86E14;
immutable ubyte* TEXT_BLOCK_C86E2F;
immutable ubyte* TEXT_DOOR_736;
immutable ubyte* TEXT_BLOCK_C86E58;
immutable ubyte* TEXT_BLOCK_C87099;
immutable ubyte* TEXT_BLOCK_C8709B;
immutable ubyte* TEXT_BLOCK_C8709D;
immutable ubyte* TEXT_BLOCK_C870A4;
immutable ubyte* TEXT_DOOR_730;
immutable ubyte* TEXT_DOOR_731;
immutable ubyte* TEXT_DOOR_734;
immutable ubyte* TEXT_DOOR_732;
immutable ubyte* TEXT_DOOR_733;
immutable ubyte* TEXT_DOOR_735;
immutable ubyte* TEXT_DOOR_774;
immutable ubyte* TEXT_BLOCK_C87220;
immutable ubyte* TEXT_BLOCK_C87280;
immutable ubyte* TEXT_DOOR_840;
immutable ubyte* TEXT_DOOR_841;
immutable ubyte* TEXT_DOOR_842;
immutable ubyte* TEXT_DOOR_843;
immutable ubyte* TEXT_DOOR_844;
immutable ubyte* TEXT_DOOR_845;
immutable ubyte* TEXT_DOOR_846;
immutable ubyte* TEXT_DOOR_847;
immutable ubyte* TEXT_DOOR_848;
immutable ubyte* TEXT_DOOR_849;
immutable ubyte* TEXT_DOOR_850;
immutable ubyte* TEXT_DOOR_851;
immutable ubyte* TEXT_DOOR_852;
immutable ubyte* TEXT_DOOR_853;
immutable ubyte* TEXT_DOOR_854;
immutable ubyte* TEXT_DOOR_855;
immutable ubyte* TEXT_DOOR_856;
immutable ubyte* TEXT_DOOR_857;
immutable ubyte* TEXT_DOOR_858;
immutable ubyte* TEXT_DOOR_859;
immutable ubyte* TEXT_DOOR_860;
immutable ubyte* TEXT_DOOR_861;
immutable ubyte* TEXT_DOOR_863;
immutable ubyte* TEXT_DOOR_864;
immutable ubyte* TEXT_DOOR_865;
immutable ubyte* TEXT_DOOR_866;
immutable ubyte* TEXT_DOOR_867;
immutable ubyte* TEXT_DOOR_868;
immutable ubyte* TEXT_DOOR_869;
immutable ubyte* TEXT_DOOR_870;
immutable ubyte* TEXT_DOOR_871;
immutable ubyte* TEXT_DOOR_872;
immutable ubyte* TEXT_DOOR_873;
immutable ubyte* TEXT_DOOR_874;
immutable ubyte* TEXT_DOOR_875;
immutable ubyte* TEXT_DOOR_876;
immutable ubyte* TEXT_DOOR_877;
immutable ubyte* TEXT_DOOR_878;
immutable ubyte* TEXT_DOOR_879;
immutable ubyte* TEXT_DOOR_880;
immutable ubyte* TEXT_DOOR_881;
immutable ubyte* TEXT_DOOR_882;
immutable ubyte* TEXT_DOOR_883;
immutable ubyte* TEXT_NPC_0685;
immutable ubyte* TEXT_NPC_0686;
immutable ubyte* TEXT_NPC_0687;
immutable ubyte* TEXT_DOOR_462;
immutable ubyte* TEXT_DOOR_910;
immutable ubyte* TEXT_NPC_1267;
immutable ubyte* TEXT_DOOR_911;
immutable ubyte* TEXT_DOOR_912;
immutable ubyte* TEXT_DOOR_130;
immutable ubyte* TEXT_DOOR_132;
immutable ubyte* TEXT_DOOR_134;
immutable ubyte* TEXT_DOOR_143;
immutable ubyte* TEXT_DOOR_146;
immutable ubyte* TEXT_DOOR_147;
immutable ubyte* TEXT_DOOR_242;
immutable ubyte* TEXT_DOOR_243;
immutable ubyte* TEXT_DOOR_244;
immutable ubyte* TEXT_DOOR_357;
immutable ubyte* TEXT_DOOR_359;
immutable ubyte* TEXT_DOOR_362;
immutable ubyte* TEXT_DOOR_157;
immutable ubyte* TEXT_BLOCK_C87E13;
immutable ubyte* TEXT_DOOR_160;
immutable ubyte* TEXT_BLOCK_C87E4C;
immutable ubyte* TEXT_BLOCK_C87E8E;
immutable ubyte* TEXT_BLOCK_C87EB2;
immutable ubyte* TEXT_DOOR_862;
immutable ubyte* TEXT_NPC_1208;
immutable ubyte* TEXT_BLOCK_C87F23;
immutable ubyte* TEXT_BLOCK_C88000;
immutable ubyte* TEXT_BLOCK_C8807D;
immutable ubyte* TEXT_BLOCK_C880B9;
immutable ubyte* TEXT_BLOCK_C88103;
immutable ubyte* TEXT_BLOCK_C8824A;
immutable ubyte* TEXT_EVENT_284;
immutable ubyte* TEXT_EVENT_137_138;
immutable ubyte* TEXT_BLOCK_C88386;
immutable ubyte* TEXT_EVENT_137;
immutable ubyte* TEXT_BLOCK_C884D0;
immutable ubyte* TEXT_BLOCK_C885CB;
immutable ubyte* TEXT_BLOCK_C885D1;
immutable ubyte* TEXT_BLOCK_C885E0;
immutable ubyte* TEXT_BLOCK_C88636;
immutable ubyte* TEXT_BLOCK_C8863C;
immutable ubyte* TEXT_BLOCK_C88650;
immutable ubyte* TEXT_BLOCK_C886D7;
immutable ubyte* TEXT_BLOCK_C886F5;
immutable ubyte* TEXT_BLOCK_C886F9;
immutable ubyte* TEXT_EVENT_591;
immutable ubyte* TEXT_BLOCK_C88761;
immutable ubyte* TEXT_BLOCK_C88772;
immutable ubyte* TEXT_BLOCK_C8886A;
immutable ubyte* TEXT_BLOCK_C88875;
immutable ubyte* TEXT_EVENT_317;
immutable ubyte* TEXT_EVENT_210;
immutable ubyte* TEXT_EVENT_216;
immutable ubyte* TEXT_BLOCK_C8897F;
immutable ubyte* TEXT_BLOCK_C88988;
immutable ubyte* TEXT_BLOCK_C88991;
immutable ubyte* VENUS_CONCERT_MAIN;
immutable ubyte* VENUS_CONCERT_CLEANUP;
immutable ubyte* TEXT_BLOCK_C88A47;
immutable ubyte* TEXT_BLOCK_C88B6D;
immutable ubyte* TEXT_BLOCK_C88D91;
immutable ubyte* TEXT_EVENT_372;
immutable ubyte* TEXT_EVENT_400;
immutable ubyte* TEXT_BLOCK_C88F35;
immutable ubyte* TEXT_BLOCK_C88FB2;
immutable ubyte* TEXT_BLOCK_C89032;
immutable ubyte* TEXT_EVENT_256;
immutable ubyte* TEXT_NPC_0770;
immutable ubyte* TEXT_BLOCK_C89078;
immutable ubyte* TEXT_BLOCK_C89160;
immutable ubyte* TEXT_BLOCK_C89180;
immutable ubyte* TEXT_BLOCK_C891B7;
immutable ubyte* TEXT_BLOCK_C89238;
immutable ubyte* TEXT_EVENT_401;
immutable ubyte* TEXT_EVENT_437;
immutable ubyte* TEXT_BLOCK_C894AC;
immutable ubyte* TEXT_BLOCK_C89530;
immutable ubyte* TEXT_BLOCK_C8955A;
immutable ubyte* TEXT_BLOCK_C89566;
immutable ubyte* TEXT_BLOCK_C89580;
immutable ubyte* TEXT_BLOCK_C896A7;
immutable ubyte* TEXT_BLOCK_C896F0;
immutable ubyte* TEXT_NPC_0931;
immutable ubyte* TEXT_BLOCK_C89758;
immutable ubyte* TEXT_BLOCK_C897A4;
immutable ubyte* TEXT_BLOCK_C897F3;
immutable ubyte* TEXT_BLOCK_C8982A;
immutable ubyte* TEXT_BLOCK_C8983B;
immutable ubyte* TEXT_NPC_0884;
immutable ubyte* TEXT_NPC_0885;
immutable ubyte* TEXT_NPC_0887;
immutable ubyte* TEXT_NPC_0888;
immutable ubyte* TEXT_NPC_0886;
immutable ubyte* TEXT_EVENT_700;
immutable ubyte* TEXT_BLOCK_C899A6;
immutable ubyte* TEXT_BLOCK_C89A71;
immutable ubyte* TEXT_NPC_0960;
immutable ubyte* TEXT_BLOCK_C89B4F;
immutable ubyte* TEXT_EVENT_190;
immutable ubyte* TEXT_EVENT_193;
immutable ubyte* TEXT_EVENT_194;
immutable ubyte* TEXT_EVENT_195;
immutable ubyte* TEXT_EVENT_196;
immutable ubyte* TEXT_EVENT_197;
immutable ubyte* TEXT_EVENT_198;
immutable ubyte* TEXT_EVENT_199;
immutable ubyte* TEXT_EVENT_200;
immutable ubyte* TEXT_EVENT_201;
immutable ubyte* TEXT_BLOCK_C89D0A;
immutable ubyte* TEXT_NPC_0996;
immutable ubyte* TEXT_NPC_0997;
immutable ubyte* TEXT_NPC_0998;
immutable ubyte* TEXT_NPC_0999;
immutable ubyte* TEXT_BLOCK_C8A023;
immutable ubyte* TEXT_NPC_1000;
immutable ubyte* TEXT_NPC_1001;
immutable ubyte* TEXT_BLOCK_C8A174;
immutable ubyte* TEXT_NPC_1003;
immutable ubyte* TEXT_NPC_1004;
immutable ubyte* TEXT_NPC_1005;
immutable ubyte* TEXT_BLOCK_C8A2D5;
immutable ubyte* TEXT_NPC_1006;
immutable ubyte* TEXT_NPC_1007;
immutable ubyte* TEXT_NPC_1008;
immutable ubyte* TEXT_NPC_1011;
immutable ubyte* TEXT_NPC_1012;
immutable ubyte* TEXT_NPC_1013;
immutable ubyte* TEXT_BLOCK_C8A39B;
immutable ubyte* TEXT_BLOCK_C8A3DD;
immutable ubyte* TEXT_NPC_1016;
immutable ubyte* TEXT_NPC_1017;
immutable ubyte* TEXT_NPC_1018;
immutable ubyte* TEXT_BLOCK_C8A4F0;
immutable ubyte* TEXT_BLOCK_C8A50C;
immutable ubyte* TEXT_NPC_1024;
immutable ubyte* TEXT_BLOCK_C8A58F;
immutable ubyte* TEXT_NPC_1021;
immutable ubyte* TEXT_BLOCK_C8A5BC;
immutable ubyte* TEXT_BLOCK_C8A5C8;
immutable ubyte* TEXT_NPC_1025;
immutable ubyte* TEXT_NPC_1026;
immutable ubyte* TEXT_NPC_1027;
immutable ubyte* TEXT_NPC_1028;
immutable ubyte* TEXT_NPC_1029;
immutable ubyte* TEXT_NPC_1030;
immutable ubyte* TEXT_NPC_1033;
immutable ubyte* TEXT_BLOCK_C8A77E;
immutable ubyte* TEXT_BLOCK_C8A783;
immutable ubyte* TEXT_BLOCK_C8A792;
immutable ubyte* TEXT_BLOCK_C8A7C5;
immutable ubyte* TEXT_BLOCK_C8A7EC;
immutable ubyte* TEXT_BLOCK_C8A7F1;
immutable ubyte* TEXT_BLOCK_C8A805;
immutable ubyte* TEXT_BLOCK_C8A82E;
immutable ubyte* TEXT_BLOCK_C8A88C;
immutable ubyte* TEXT_NPC_1037;
immutable ubyte* TEXT_BLOCK_C8A8E7;
immutable ubyte* TEXT_NPC_1037_ALT;
immutable ubyte* TEXT_BLOCK_C8A997;
immutable ubyte* TEXT_BLOCK_C8A9D8;
immutable ubyte* TEXT_BLOCK_C8A9DD;
immutable ubyte* TEXT_BLOCK_C8A9EC;
immutable ubyte* TEXT_BLOCK_C8AA7F;
immutable ubyte* TEXT_BLOCK_C8AABE;
immutable ubyte* TEXT_BLOCK_C8AACC;
immutable ubyte* TEXT_BLOCK_C8AACF;
immutable ubyte* TEXT_NPC_1038;
immutable ubyte* TEXT_BLOCK_C8ABB0;
immutable ubyte* TEXT_BLOCK_C8AC30;
immutable ubyte* TEXT_BLOCK_C8AC6F;
immutable ubyte* TEXT_BLOCK_C8AD22;
immutable ubyte* TEXT_NPC_1035;
immutable ubyte* TEXT_BLOCK_C8AE3B;
immutable ubyte* TEXT_BLOCK_C8AE72;
immutable ubyte* TEXT_NPC_1036;
immutable ubyte* TEXT_BLOCK_C8AF0F;
immutable ubyte* TEXT_NPC_1047;
immutable ubyte* TEXT_NPC_1049;
immutable ubyte* TEXT_NPC_1050;
immutable ubyte* TEXT_NPC_1051;
immutable ubyte* TEXT_NPC_1052;
immutable ubyte* TEXT_NPC_1053;
immutable ubyte* TEXT_NPC_1054;
immutable ubyte* TEXT_NPC_1055;
immutable ubyte* TEXT_NPC_1056;
immutable ubyte* TEXT_BLOCK_C8B137;
immutable ubyte* TEXT_BLOCK_C8B158;
immutable ubyte* TEXT_NPC_1069;
immutable ubyte* TEXT_BLOCK_C8B22F;
immutable ubyte* TEXT_BLOCK_C8B292;
immutable ubyte* TEXT_NPC_1057;
immutable ubyte* TEXT_NPC_1058;
immutable ubyte* TEXT_NPC_1059;
immutable ubyte* TEXT_NPC_1060;
immutable ubyte* TEXT_BLOCK_C8B3C0;
immutable ubyte* TEXT_NPC_1062;
immutable ubyte* TEXT_NPC_1063;
immutable ubyte* TEXT_BLOCK_C8B460;
immutable ubyte* TEXT_NPC_1064;
immutable ubyte* TEXT_NPC_1065;
immutable ubyte* TEXT_BLOCK_C8B554;
immutable ubyte* TEXT_BLOCK_C8B559;
immutable ubyte* TEXT_BLOCK_C8B568;
immutable ubyte* TEXT_BLOCK_C8B57C;
immutable ubyte* TEXT_BLOCK_C8B57E;
immutable ubyte* TEXT_BLOCK_C8B64E;
immutable ubyte* TEXT_BLOCK_C8B667;
immutable ubyte* TEXT_BLOCK_C8B66C;
immutable ubyte* TEXT_BLOCK_C8B680;
immutable ubyte* TEXT_BLOCK_C8B6D5;
immutable ubyte* TEXT_BLOCK_C8B77B;
immutable ubyte* TEXT_BLOCK_C8B7A0;
immutable ubyte* TEXT_BLOCK_C8B7A5;
immutable ubyte* TEXT_BLOCK_C8B7B4;
immutable ubyte* TEXT_BLOCK_C8B7E4;
immutable ubyte* TEXT_BLOCK_C8B82E;
immutable ubyte* TEXT_BLOCK_C8B851;
immutable ubyte* TEXT_NPC_1067;
immutable ubyte* TEXT_NPC_1068;
immutable ubyte* TEXT_NPC_1002;
immutable ubyte* TEXT_BLOCK_C8B9C4;
immutable ubyte* TEXT_BLOCK_C8B9FE;
immutable ubyte* TEXT_BLOCK_C8BA03;
immutable ubyte* TEXT_BLOCK_C8BA12;
immutable ubyte* TEXT_BLOCK_C8BA45;
immutable ubyte* TEXT_NPC_1066;
immutable ubyte* TEXT_NPC_1070;
immutable ubyte* TEXT_NPC_1031;
immutable ubyte* TEXT_NPC_1077;
immutable ubyte* TEXT_DOOR_740;
immutable ubyte* TEXT_DOOR_742;


immutable ubyte[][256][3] compressedText = [
[
	EBString("                "),
	EBString(" in the "),
	EBString(" that "),
	EBString("..."),
	EBString(" and "),
	EBString(" this "),
	EBString(" to the "),
	EBString(" about "),
	EBString(" just "),
	EBString(" of the "),
	EBString(" something "),
	EBString(" going to "),
	EBString(" to "),
	EBString(" you have "),
	EBString(" your "),
	EBString(" for "),
	EBString(" you're "),
	EBString("@You "),
	EBString(" really "),
	EBString(" don't "),
	EBString("@The "),
	EBString("e the "),
	EBString("e you "),
	EBString("... "),
	EBString(" the "),
	EBString(" will "),
	EBString("   ...Brick Road"),
	EBString("ing "),
	EBString(" some "),
	EBString("              "),
	EBString("@Do you want to "),
	EBString(" like "),
	EBString("ou don't have "),
	EBString(" is "),
	EBString(" you "),
	EBString(" you"),
	EBString(" anything else"),
	EBString(" the"),
	EBString(" you want to "),
	EBString(" for the "),
	EBString(" friend"),
	EBString(" at the "),
	EBString("ould you like "),
	EBString(" from "),
	EBString(" would "),
	EBString("he Runaway Five"),
	EBString(" with "),
	EBString(" want to "),
	EBString("@If you "),
	EBString(" you don't "),
	EBString("s the "),
	EBString("ed to "),
	EBString("e..."),
	EBString(" something"),
	EBString("t the "),
	EBString("@..."),
	EBString("@Please "),
	EBString("'s "),
	EBString(" of your "),
	EBString("@It's "),
	EBString("@Thank you "),
	EBString("@I "),
	EBString(" here."),
	EBString(" in "),
	EBString("@Do you "),
	EBString(" I'll "),
	EBString(" have "),
	EBString("e of "),
	EBString("d you "),
	EBString("@I'm "),
	EBString("me to "),
	EBString("@I don't "),
	EBString("@Well, "),
	EBString("@This is "),
	EBString("ed the "),
	EBString("@You're "),
	EBString(" for a "),
	EBString(" anything"),
	EBString("ing"),
	EBString(" of "),
	EBString(" you should "),
	EBString(" I "),
	EBString(" from the "),
	EBString("s..."),
	EBString(" it's "),
	EBString(" time"),
	EBString("e to "),
	EBString("ed "),
	EBString("e of the "),
	EBString(" to you"),
	EBString("n't you "),
	EBString(" again"),
	EBString(" for you."),
	EBString("other "),
	EBString("ation"),
	EBString(" little "),
	EBString("ing to "),
	EBString(" can't "),
	EBString(" much"),
	EBString(" someone "),
	EBString(" on the "),
	EBString(" looks like"),
	EBString(" don't you "),
	EBString(" very "),
	EBString("the "),
	EBString(" can "),
	EBString("you"),
	EBString(" that you "),
	EBString(" it"),
	EBString(" you want"),
	EBString("ou can't "),
	EBString(" able to "),
	EBString(" already "),
	EBString(" give you "),
	EBString("understand"),
	EBString("       "),
	EBString(" my "),
	EBString(" you can "),
	EBString(" that"),
	EBString(" what "),
	EBString("here's "),
	EBString(" there "),
	EBString("n the "),
	EBString("@What "),
	EBString("Thank you"),
	EBString(" I can't "),
	EBString("one"),
	EBString("@The"),
	EBString(" thought"),
	EBString(" not "),
	EBString("You should"),
	EBString("ou know"),
	EBString(" has "),
	EBString(" back"),
	EBString(" of"),
	EBString("ve been "),
	EBString(" I'm "),
	EBString(" there"),
	EBString(" with you"),
	EBString("@I heard "),
	EBString(" in"),
	EBString(" here "),
	EBString(" Fourside"),
	EBString("I wonder "),
	EBString(" to"),
	EBString(" could "),
	EBString(" think "),
	EBString(" out"),
	EBString(" good "),
	EBString("  the "),
	EBString("  You "),
	EBString(" too much"),
	EBString("ome back"),
	EBString("t..."),
	EBString(" here"),
	EBString("thing"),
	EBString("come "),
	EBString("ly "),
	EBString("ent"),
	EBString(" strong"),
	EBString(" money."),
	EBString("@I'll "),
	EBString("an "),
	EBString("ou must "),
	EBString(" are you "),
	EBString(" with the"),
	EBString(" on your "),
	EBString("too many "),
	EBString(" you."),
	EBString("know"),
	EBString(" to be "),
	EBString(" around "),
	EBString(" if you "),
	EBString("@Are you "),
	EBString("ome again"),
	EBString("e and "),
	EBString(" more "),
	EBString("think"),
	EBString("e your "),
	EBString("@Don't "),
	EBString("nd the "),
	EBString("t to "),
	EBString("rea"),
	EBString(" he"),
	EBString(" me"),
	EBString(" strange"),
	EBString(" for you"),
	EBString("ight"),
	EBString(" a "),
	EBString(" be"),
	EBString("ther"),
	EBString("all "),
	EBString(" cannot "),
	EBString("here is "),
	EBString("You have"),
	EBString("Monotoli"),
	EBString(" was "),
	EBString("ll you "),
	EBString("hat "),
	EBString(", but "),
	EBString(" stuff"),
	EBString("eep"),
	EBString(" it "),
	EBString(" didn't "),
	EBString(" like th"),
	EBString("ll right"),
	EBString(" should"),
	EBString(" over"),
	EBString("@Oh, "),
	EBString(" hear"),
	EBString(" every"),
	EBString("I'm not "),
	EBString(" about t"),
	EBString(" zombies"),
	EBString(" damage"),
	EBString("his is "),
	EBString("all"),
	EBString(" some"),
	EBString("@It "),
	EBString(" attack"),
	EBString(" right "),
	EBString("ally "),
	EBString("orry"),
	EBString("ess"),
	EBString("er "),
	EBString("@That's "),
	EBString("carry it"),
	EBString("ake"),
	EBString("t was "),
	EBString(", the "),
	EBString("n you "),
	EBString("sn't "),
	EBString(" help"),
	EBString("king "),
	EBString("ear"),
	EBString("ing the"),
	EBString("  It's "),
	EBString("very"),
	EBString(" talking"),
	EBString("ou've "),
	EBString("that's "),
	EBString(" to me"),
	EBString("@Hello"),
	EBString(" enemy"),
	EBString(" you are"),
	EBString(" by "),
	EBString(" IBNT"),
	EBString("ight "),
	EBString("on't "),
	EBString("est"),
	EBString("ick"),
	EBString(" power "),
	EBString("s that "),
	EBString("s are "),
	EBString(" call"),
	EBString("t is "),
], [
	EBString(" is"),
	EBString("age"),
	EBString(", and "),
	EBString(" great "),
	EBString("@Thanks"),
	EBString(" people"),
	EBString("ter"),
	EBString("not"),
	EBString("ill"),
	EBString("ness"),
	EBString("@This "),
	EBString(" into "),
	EBString(" ha"),
	EBString(" I can "),
	EBString("t your "),
	EBString(" before"),
	EBString(" things"),
	EBString("tion"),
	EBString(" for"),
	EBString("be "),
	EBString(" this"),
	EBString("Happy"),
	EBString("  You"),
	EBString("out"),
	EBString("enough"),
	EBString("  I'm "),
	EBString("@You"),
	EBString(" go"),
	EBString("for"),
	EBString(" all th"),
	EBString(" though"),
	EBString("ing you"),
	EBString("e you"),
	EBString("ring "),
	EBString("one "),
	EBString("get"),
	EBString("t you "),
	EBString("@I'm s"),
	EBString(" the s"),
	EBString("e's "),
	EBString("port"),
	EBString("d..."),
	EBString(" out "),
	EBString("@What"),
	EBString(" get "),
	EBString("I have "),
	EBString("looking"),
	EBString("n this "),
	EBString(" of my "),
	EBString(" have a"),
	EBString("ent "),
	EBString(" do"),
	EBString("d of "),
	EBString("ting"),
	EBString("ncrease"),
	EBString(" Twoson"),
	EBString("through"),
	EBString("s your "),
	EBString("ou'll "),
	EBString(" place"),
	EBString(" right"),
	EBString(" Onett"),
	EBString("     "),
	EBString(" our "),
	EBString(" too"),
	EBString("ater"),
	EBString(" be "),
	EBString("ain"),
	EBString("ing."),
	EBString("take "),
	EBString("e is "),
	EBString("the"),
	EBString(" please"),
	EBString(" do you"),
	EBString("need"),
	EBString("use"),
	EBString(" now."),
	EBString(" got "),
	EBString("   "),
	EBString("and "),
	EBString("ning"),
	EBString(" sta"),
	EBString(" the t"),
	EBString("I was "),
	EBString("y the "),
	EBString("his"),
	EBString("appe"),
	EBString("con"),
	EBString(" ho"),
	EBString("hat's "),
	EBString("Threed"),
	EBString("get "),
	EBString("s of "),
	EBString("inter"),
	EBString("talk"),
	EBString(" man"),
	EBString("day"),
	EBString("ove"),
	EBString(" ha ha"),
	EBString("inally"),
	EBString("monkey"),
	EBString("s and "),
	EBString("ate"),
	EBString("see"),
	EBString("town"),
	EBString("side"),
	EBString("y to "),
	EBString("ever "),
	EBString("equip"),
	EBString(" than"),
	EBString(" who"),
	EBString("long"),
	EBString("care"),
	EBString("room"),
	EBString("e are "),
	EBString("ard"),
	EBString("end"),
	EBString(", you "),
	EBString(" the b"),
	EBString("I know"),
	EBString("think "),
	EBString("s you "),
	EBString("time"),
	EBString("ment"),
	EBString(" so"),
	EBString("!  "),
	EBString("I've "),
	EBString("ell"),
	EBString(" wa"),
	EBString("ious"),
	EBString("reat"),
	EBString("live"),
	EBString("ange"),
	EBString(" we"),
	EBString("ble"),
	EBString("@....."),
	EBString("ecover"),
	EBString(" only "),
	EBString("thing "),
	EBString("er..."),
	EBString("Mr. "),
	EBString("ough"),
	EBString(" now"),
	EBString("  I"),
	EBString("wor"),
	EBString("to "),
	EBString("ed."),
	EBString("  I "),
	EBString("'re "),
	EBString(" give "),
	EBString("ing a "),
	EBString("return"),
	EBString("better"),
	EBString("ince "),
	EBString(" well"),
	EBString(" one "),
	EBString("still"),
	EBString("ying "),
	EBString("me..."),
	EBString("sta"),
	EBString("ust "),
	EBString("per"),
	EBString("lease"),
	EBString("ling "),
	EBString("point"),
	EBString("ect"),
	EBString("ast"),
	EBString("pretty"),
	EBString("Giygas"),
	EBString("ecause"),
	EBString("member"),
	EBString("carry "),
	EBString(" used "),
	EBString("elieve"),
	EBString(" money"),
	EBString("pres"),
	EBString("way"),
	EBString(" di"),
	EBString(" even"),
	EBString("ound "),
	EBString("s to "),
	EBString("ting "),
	EBString("ted "),
	EBString("oing"),
	EBString(" and"),
	EBString("ine"),
	EBString("  T"),
	EBString("sure"),
	EBString(" on "),
	EBString("@...I"),
	EBString("while"),
	EBString("@but "),
	EBString("@We"),
	EBString("ice"),
	EBString("se "),
	EBString("ive "),
	EBString(" rea"),
	EBString(" com"),
	EBString("est "),
	EBString("have"),
	EBString(" but"),
	EBString("away"),
	EBString("here"),
	EBString(" must"),
	EBString(" but "),
	EBString(" want"),
	EBString("ready"),
	EBString("I'm"),
	EBString("carr"),
	EBString("my "),
	EBString("ay..."),
	EBString(" are "),
	EBString("@Hey,"),
	EBString("world"),
	EBString("ing a"),
	EBString(" happ"),
	EBString(" seem"),
	EBString(" his "),
	EBString("nder"),
	EBString(" se"),
	EBString("ant"),
	EBString("item"),
	EBString("@But"),
	EBString(" sho"),
	EBString("in a "),
	EBString("made "),
	EBString("night"),
	EBString("et's "),
	EBString(" like"),
	EBString("  The"),
	EBString("che"),
	EBString(" de"),
	EBString("ful"),
	EBString("hat"),
	EBString("and"),
	EBString("self"),
	EBString("ould"),
	EBString("@No"),
	EBString("car"),
	EBString(" tr"),
	EBString(" good"),
	EBString(" stor"),
	EBString("ombie"),
	EBString("@Oh"),
	EBString("@It"),
	EBString("s a "),
	EBString("vent"),
	EBString("ant "),
	EBString(" so "),
	EBString("olla"),
	EBString("ree"),
	EBString("Your "),
	EBString("make "),
	EBString(" work"),
	EBString("power"),
	EBString(" home"),
], [
	EBString("also"),
	EBString("ance"),
	EBString("@How"),
	EBString("h..."),
	EBString("@If"),
	EBString("ple"),
	EBString("buy"),
	EBString("e, "),
	EBString("n't"),
	EBString("oke"),
	EBString("n't "),
	EBString("more"),
	EBString("Good"),
	EBString("t a "),
	EBString(" all"),
	EBString("take"),
	EBString("round"),
	EBString(" when"),
	EBString(" name"),
	EBString("being"),
	EBString("attle"),
	EBString("ite"),
	EBString("ack"),
	EBString("y..."),
	EBString("@Whe"),
	EBString("with"),
	EBString("al "),
	EBString("have "),
	EBString(" look"),
	EBString("t of "),
	EBString("aster"),
	EBString(" a lo"),
	EBString(" feel"),
	EBString("here "),
	EBString("count"),
	EBString("monst"),
	EBString("now"),
	EBString("ark"),
	EBString("ous"),
	EBString("'ll"),
	EBString(" bus"),
	EBString("head"),
	EBString(" any "),
	EBString("t you"),
	EBString("erson"),
	EBString("after"),
	EBString("ummer"),
	EBString(" hard"),
	EBString("ful "),
	EBString("ever"),
	EBString(" kid"),
	EBString(" a b"),
	EBString("kay"),
	EBString("tra"),
	EBString("pla"),
	EBString("ook"),
	EBString("ome"),
	EBString("eat"),
	EBString("@Wel"),
	EBString(" off"),
	EBString("turn"),
	EBString("I am"),
	EBString("oney"),
	EBString(" any"),
	EBString("ave"),
	EBString("any "),
	EBString("enem"),
	EBString(" con"),
	EBString(" me "),
	EBString("red"),
	EBString("en "),
	EBString(" bo"),
	EBString(" re"),
	EBString("ell "),
	EBString("sell"),
	EBString("what"),
	EBString("next"),
	EBString("ure"),
	EBString(" bu"),
	EBString("pro"),
	EBString(" on"),
	EBString("res"),
	EBString("es "),
	EBString(" lo"),
	EBString("our"),
	EBString("use "),
	EBString("iste"),
	EBString("ood"),
	EBString(" no"),
	EBString("ope"),
	EBString("ock"),
	EBString("row"),
	EBString("@He"),
	EBString("how"),
	EBString(" may"),
	EBString(" as "),
	EBString("stor"),
	EBString(" are"),
	EBString("ost "),
	EBString("mean"),
	EBString("  We"),
	EBString("  He"),
	EBString("@An"),
	EBString("it "),
	EBString("in "),
	EBString("ound"),
	EBString("one."),
	EBString("come"),
	EBString("blue"),
	EBString("way,"),
	EBString(" or "),
	EBString(" mo"),
	EBString(".  "),
	EBString("each"),
	EBString("some"),
	EBString("@(Th"),
	EBString("otel"),
	EBString("hand"),
	EBString("came"),
	EBString(" ca"),
	EBString("ame"),
	EBString("@Hey"),
	EBString("een "),
	EBString("spec"),
	EBString("red "),
	EBString("ing!"),
	EBString(" ..."),
	EBString("hose"),
	EBString("ind "),
	EBString("ice "),
	EBString("ver"),
	EBString("  W"),
	EBString("min"),
	EBString("et "),
	EBString("on "),
	EBString("ace"),
	EBString("er."),
	EBString("are "),
	EBString("nter"),
	EBString("o..."),
	EBString("were"),
	EBString("help"),
	EBString("old "),
	EBString(" it."),
	EBString("hear"),
	EBString("stop"),
	EBString("look"),
	EBString("com"),
	EBString("@Do"),
	EBString(" her"),
	EBString(" pro"),
	EBString("chin"),
	EBString("ble "),
	EBString("e a "),
	EBString("girl"),
	EBString("luck"),
	EBString("  B"),
	EBString("act"),
	EBString("ike"),
	EBString("down"),
	EBString("part"),
	EBString(" see"),
	EBString(" use"),
	EBString("uch "),
	EBString("from"),
	EBString("just"),
	EBString("llow"),
	EBString("@Her"),
	EBString(" at "),
	EBString("@So,"),
	EBString(" ye"),
	EBString("ser"),
	EBString("ying"),
	EBString("ring"),
	EBString("eave"),
	EBString("big "),
	EBString("ried"),
	EBString(" was"),
	EBString(" say"),
	EBString(" su"),
	EBString("her"),
	EBString("it."),
	EBString("Man"),
	EBString("kin"),
	EBString(" up"),
	EBString("ers"),
	EBString("@Why"),
	EBString("p..."),
	EBString("cour"),
	EBString(" him"),
	EBString("agic"),
	EBString("any"),
	EBString("fin"),
	EBString("eal"),
	EBString("he "),
	EBString("ide"),
	EBString("oor"),
	EBString("ity"),
	EBString("got"),
	EBString("ens"),
	EBString("ish"),
	EBString("ive"),
	EBString(" sa"),
	EBString("oon"),
	EBString("fee"),
	EBString("s a"),
	EBString("nce"),
	EBString("  D"),
	EBString("uck"),
	EBString("ass"),
	EBString("man"),
	EBString("a p"),
	EBString("@(I"),
	EBString("@Wh"),
	EBString(" gu"),
	EBString("  ("),
	EBString("bus"),
	EBString("los"),
	EBString("ts "),
	EBString(" ba"),
	EBString("  S"),
	EBString(" if"),
	EBString("@Ha"),
	EBString(" ma"),
	EBString("unn"),
	EBString("ay "),
	EBString("ner"),
	EBString("@A "),
	EBString("or "),
	EBString("stu"),
	EBString("ust"),
	EBString("kya"),
	EBString("shi"),
	EBString("pos"),
	EBString("  A"),
	EBString("int"),
	EBString(" le"),
	EBString("ary"),
	EBString("ven"),
	EBString(" ch"),
	EBString("own"),
	EBString(" hu"),
	EBString("@My"),
	EBString("@So"),
	EBString(" sp"),
	EBString(" sh"),
	EBString("wan"),
	EBString("ool"),
	EBString("  Y"),
	EBString("old"),
	EBString("eas"),
	EBString(", I"),
	EBString("iki"),
	EBString("@Ky"),
	EBString("@Ye"),
	EBString("spi"),
]
];

immutable ubyte* TEXT_NPC_0456;
immutable ubyte* TEXT_BLOCK_C8DA31;
immutable ubyte* TEXT_BLOCK_C8DA5D;
immutable ubyte* TEXT_NPC_0542;
immutable ubyte* TEXT_BLOCK_C8DAD5;
immutable ubyte* TEXT_BLOCK_C8DAEE;
immutable ubyte* TEXT_NPC_0457;
immutable ubyte* TEXT_BLOCK_C8DB92;
immutable ubyte* TEXT_BLOCK_C8DBBE;
immutable ubyte* TEXT_NPC_0540;
immutable ubyte* TEXT_BLOCK_C8DC2F;
immutable ubyte* TEXT_NPC_0458;
immutable ubyte* TEXT_BLOCK_C8DC8D;
immutable ubyte* TEXT_BLOCK_C8DCB2;
immutable ubyte* TEXT_NPC_0541;
immutable ubyte* TEXT_BLOCK_C8DCF9;
immutable ubyte* TEXT_BLOCK_C8DD12;
immutable ubyte* TEXT_NPC_0459;
immutable ubyte* TEXT_BLOCK_C8DD98;
immutable ubyte* TEXT_BLOCK_C8DE13;
immutable ubyte* TEXT_BLOCK_C8DE2C;
immutable ubyte* TEXT_NPC_0539;
immutable ubyte* TEXT_BLOCK_C8DE88;
immutable ubyte* TEXT_BLOCK_C8DEE1;
immutable ubyte* TEXT_BLOCK_C8DEE7;
immutable ubyte* TEXT_BLOCK_C8DEF6;
immutable ubyte* TEXT_BLOCK_C8DF0D;
immutable ubyte* TEXT_BLOCK_C8DF28;
immutable ubyte* TEXT_NPC_0477;
immutable ubyte* TEXT_NPC_0478;
immutable ubyte* TEXT_BLOCK_C8DFBB;
immutable ubyte* TEXT_NPC_0498;
immutable ubyte* TEXT_BLOCK_C8DFF7;
immutable ubyte* TEXT_NPC_0499;
immutable ubyte* TEXT_NPC_0500;
immutable ubyte* TEXT_BLOCK_C8E07C;
immutable ubyte* TEXT_NPC_0502;
immutable ubyte* TEXT_BLOCK_C8E0D8;
immutable ubyte* TEXT_NPC_0503;
immutable ubyte* TEXT_NPC_0504;
immutable ubyte* TEXT_NPC_0505;
immutable ubyte* TEXT_NPC_0509;
immutable ubyte* TEXT_NPC_0515;
immutable ubyte* TEXT_BLOCK_C8E176;
immutable ubyte* TEXT_NPC_0516;
immutable ubyte* TEXT_BLOCK_C8E218;
immutable ubyte* TEXT_BLOCK_C8E251;
immutable ubyte* TEXT_NPC_0517;
immutable ubyte* TEXT_BLOCK_C8E2C7;
immutable ubyte* TEXT_NPC_0518;
immutable ubyte* TEXT_BLOCK_C8E33B;
immutable ubyte* TEXT_NPC_0519;
immutable ubyte* TEXT_BLOCK_C8E3FB;
immutable ubyte* TEXT_BLOCK_C8E42A;
immutable ubyte* TEXT_NPC_0520;
immutable ubyte* TEXT_BLOCK_C8E501;
immutable ubyte* TEXT_NPC_0521;
immutable ubyte* TEXT_BLOCK_C8E576;
immutable ubyte* TEXT_BLOCK_C8E5A4;
immutable ubyte* TEXT_NPC_0522;
immutable ubyte* TEXT_BLOCK_C8E5F7;
immutable ubyte* TEXT_NPC_0511;
immutable ubyte* TEXT_NPC_0523;
immutable ubyte* TEXT_NPC_0524;
immutable ubyte* TEXT_NPC_0525;
immutable ubyte* TEXT_BLOCK_C8E715;
immutable ubyte* TEXT_NPC_0526;
immutable ubyte* TEXT_BLOCK_C8E7B3;
immutable ubyte* TEXT_NPC_0527;
immutable ubyte* TEXT_BLOCK_C8E95B;
immutable ubyte* TEXT_BLOCK_C8E95D;
immutable ubyte* TEXT_BLOCK_C8E9E8;
immutable ubyte* TEXT_BLOCK_C8EA55;
immutable ubyte* TEXT_BLOCK_C8EA5B;
immutable ubyte* TEXT_BLOCK_C8EA6A;
immutable ubyte* TEXT_BLOCK_C8EA79;
immutable ubyte* TEXT_NPC_0528;
immutable ubyte* TEXT_NPC_0529;
immutable ubyte* TEXT_NPC_0530;
immutable ubyte* TEXT_BLOCK_C8EB75;
immutable ubyte* TEXT_BLOCK_C8EBDD;
immutable ubyte* TEXT_NPC_0534;
immutable ubyte* TEXT_EVENT_758;
immutable ubyte* TEXT_NPC_0535;
immutable ubyte* TEXT_NPC_0536;
immutable ubyte* TEXT_NPC_0537;
immutable ubyte* TEXT_NPC_0513;
immutable ubyte* TEXT_BLOCK_C8ED87;
immutable ubyte* TEXT_BLOCK_C8EDCC;
immutable ubyte* TEXT_NPC_0514;
immutable ubyte* TEXT_BLOCK_C8EE6E;
immutable ubyte* TEXT_BLOCK_C8EEB4;
immutable ubyte* TEXT_NPC_0512;
immutable ubyte* TEXT_NPC_0551;
immutable ubyte* TEXT_NPC_0475;
immutable ubyte* TEXT_BLOCK_C8F031;
immutable ubyte* TEXT_BLOCK_C8F066;
immutable ubyte* TEXT_BLOCK_C8F086;
immutable ubyte* TEXT_BLOCK_C8F0D2;
immutable ubyte* TEXT_NPC_0476;
immutable ubyte* TEXT_BLOCK_C8F193;
immutable ubyte* TEXT_BLOCK_C8F1B5;
immutable ubyte* TEXT_BLOCK_C8F208;
immutable ubyte* TEXT_NPC_0491;
immutable ubyte* TEXT_BLOCK_C8F296;
immutable ubyte* TEXT_NPC_0552;
immutable ubyte* TEXT_NPC_0553;
immutable ubyte* TEXT_NPC_0554;
immutable ubyte* TEXT_NPC_0555;
immutable ubyte* TEXT_NPC_0556;
immutable ubyte* TEXT_NPC_0557;
immutable ubyte* TEXT_NPC_0558;
immutable ubyte* TEXT_NPC_0559;
immutable ubyte* TEXT_NPC_0560;
immutable ubyte* TEXT_NPC_0561;
immutable ubyte* TEXT_NPC_0485;
immutable ubyte* TEXT_NPC_0486;
immutable ubyte* TEXT_BLOCK_C8F4D8;
immutable ubyte* TEXT_NPC_0562;
immutable ubyte* TEXT_BLOCK_C8F590;
immutable ubyte* TEXT_NPC_0563;
immutable ubyte* TEXT_BLOCK_C8F638;
immutable ubyte* TEXT_BLOCK_C8F63E;
immutable ubyte* TEXT_BLOCK_C8F64D;
immutable ubyte* TEXT_BLOCK_C8F656;
immutable ubyte* TEXT_NPC_0464;
immutable ubyte* TEXT_NPC_0460;
immutable ubyte* TEXT_NPC_0461;
immutable ubyte* TEXT_NPC_0462;
immutable ubyte* TEXT_NPC_0470;
immutable ubyte* TEXT_NPC_0471;
immutable ubyte* TEXT_NPC_0472;
immutable ubyte* TEXT_NPC_0474;
immutable ubyte* TEXT_BLOCK_C8F748;
immutable ubyte* TEXT_NPC_0481;
immutable ubyte* TextBattleOffenseWentUp;
immutable ubyte* TextBattleDefenseWentUp;
immutable ubyte* TextBattleIQWentUp;
immutable ubyte* TextBattleGutsWentUp;
immutable ubyte* TextBattleGutsWentDown;
immutable ubyte* TextBattleGutsBecame;
immutable ubyte* TextBattleSpeedWentUp;
immutable ubyte* TextBattleVitalityWentUp;
immutable ubyte* TextBattleLuckWentUp;
immutable ubyte* TextBattleOffenseWentDown;
immutable ubyte* TextBattleDefenseWentDown;
immutable ubyte* TextBattleFlyHoneyBelch;
immutable ubyte* TextBattleFlyHoneyNormal;
immutable ubyte* TEXT_MYSTERIOUS_LIGHT;
immutable ubyte* TEXT_WARM_LIGHT;
immutable ubyte* TEXT_DAZZLING_LIGHT_ENVELOPED;
immutable ubyte* TEXT_HEAVY_AIR;
immutable ubyte* TEXT_DAZZLING_LIGHT_CHASED;
immutable ubyte* TEXT_SUBTLE_LIGHT;
immutable ubyte* TEXT_GOLDEN_LIGHT;
immutable ubyte* TEXT_RAINBOW_LIGHT;
immutable ubyte* TEXT_MYSTERIOUS_AROMA;
immutable ubyte* TEXT_HEAVEN_RENDING_SOUND;
immutable ubyte* TEXT_BLOCK_C8FA7B;
immutable ubyte* TEXT_BLOCK_C8FA90;
immutable ubyte* TEXT_NOT_ENOUGH_PP;
immutable ubyte* TextBattleUsedPSI;
immutable ubyte* TEXT_BLOCK_C8FACA;
immutable ubyte* TEXT_BLOCK_C8FACD;
immutable ubyte* TEXT_BATTLE_IT_DIDNT_HIT_ANYONE;
immutable ubyte* TEXT_BATTLE_DOES_NOT_HAVE_ANY_PP;
immutable ubyte* TextAction275;
immutable ubyte* TextPokeySpeech3;
immutable ubyte* TextPokeySpeech4;
immutable ubyte* TextBattlePokeyFlees;
immutable ubyte* TEXT_BLOCK_C8FFF3;
