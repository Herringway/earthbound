/// Game logic (ActionScript)
module earthbound.actionscripts;

import earthbound.commondefs;
import earthbound.globals;
import earthbound.bank00;
import earthbound.bank01;
import earthbound.bank02;
import earthbound.bank03;
import earthbound.bank04;
import earthbound.text;
import earthbound.bank21;
import earthbound.bank2F;
import replatform64.snes;

static assert((void function()).sizeof == (const(void)*).sizeof, "Error: Script sizing currently depends on data and function pointers being equal sizes");

alias ScriptPointer = string;

/// $C400D4
immutable ubyte[][895] actionScriptScriptPointers;
shared static this() {
	actionScriptScriptPointers = [
		actionScriptDebugCursor[],
		actionScriptPartyLeader[],
		actionScriptPartyMember[],
		actionScriptPartyMemberBMonkey[],
		actionScriptCharacterViewer[],
		actionScriptStaticEnemy[],
		actionScriptPeopleWalk1[],
		actionScriptBillboard[],
		actionScriptMapObjStill[],
		actionScript9[],
		actionScriptPeopleWalk0[],
		actionScriptPeopleWalk0[],
		actionScriptPeopleWalk1[],
		actionScriptPeopleWalk1Narrow[],
		actionScriptPeopleWalk1MediumSquare[],
		actionScriptPeopleWalk1LargeSquare[],
		actionScriptPeopleWalk1Wide[],
		actionScriptPeopleWalk1Wide2[],
		actionScriptKing1[],
		actionScriptDefaultEnemy[],
		actionScript20[],
		actionScript21[],
		actionScript22[],
		actionScriptFlyingInanimateEnemy[],
		actionScript24[],
		actionScriptFlyingEnemy[],
		actionScript26[],
		actionScript27[],
		actionScript28[],
		actionScript29[],
		actionScript30[],
		actionScript31[],
		actionScriptMagicButterfly[],
		actionScriptMagicButterflyOut[],
		actionScriptMagicButterflyApproach[],
		actionScriptTerminate[],
		actionScriptNesHomeYure[],
		actionScript37[],
		actionScriptKnockDoor[],
		actionScriptNessTobinoku[],
		actionScript40[],
		actionScriptTelRing[],
		actionScriptPeopleWalk0Live[],
		actionScriptPeopleWalk1Live[],
		actionScriptMapObjStillLive[],
		actionScript45[],
		actionScriptReturnDog[],
		actionScriptAddParty[],
		actionScriptAddPartyViaLeader[],
		actionScriptAddPartyBMonkey[],
		actionScriptBunbunAppear[],
		actionScriptBunbuun[],
		actionScriptBunbunDie[],
		actionScript53[],
		actionScriptBunbuunBeam[],
		actionScript55[],
		actionScriptMizunoA[],
		actionScript57[],
		actionScript58[],
		actionScript59[],
		actionScript60[],
		actionScriptHallMayorC[],
		actionScriptGetOutHallMayor[],
		actionScript63[],
		actionScriptBusTwsnThrkIn[],
		actionScript65[],
		actionScript66[],
		actionScriptBusTwsnTunnel[],
		actionScriptBusReturnTwsn[],
		actionScriptBusReturnTwsnB[],
		actionScriptBusIntoThrk[],
		actionScriptOutBusR[],
		actionScriptOutBusL[],
		actionScriptIntoBus[],
		actionScriptOutTBusR[],
		actionScriptOutTBusGorgeous[],
		actionScriptIntoTBusGorgeous[],
		actionScript77[],
		actionScript78[],
		actionScript79[],
		actionScript80[],
		actionScriptOshiokiPokey[],
		actionScriptOshiokiPickey[],
		actionScriptOshiokiMince[],
		actionScriptLardnaKee[],
		actionScript85[],
		actionScript86[],
		actionScript87[],
		actionScript88[],
		actionScript89[],
		actionScript90[],
		actionScriptGhostPlus1[],
		actionScriptGhostPlus2[],
		actionScriptRetGhostTunnel[],
		actionScript94[],
		actionScript95[],
		actionScript96[],
		actionScript97[],
		actionScript98[],
		actionScriptGhostThrkPlus1[],
		actionScriptGhostThrkPlus2[],
		actionScriptMouseDoor[],
		actionScript102[],
		actionScript103[],
		actionScript104[],
		actionScript105[],
		actionScript106[],
		actionScript107[],
		actionScript108[],
		actionScriptMichikoIntoRoom[],
		actionScriptMichikoIntoRoomB[],
		actionScriptFollowToMichiko[],
		actionScriptFollowToMichikoB[],
		actionScript113[],
		actionScriptWakeUpTony[],
		actionScriptGorgeousFree[],
		actionScriptLuckyFree[],
		actionScriptNiceFree[],
		actionScriptOKFree[],
		actionScriptGrooveFree[],
		actionScriptMogiriToRight[],
		actionScriptMogiriToDown[],
		actionScriptMonotoryOutAGorgeous[],
		actionScriptMonotoryOutALucky[],
		actionScriptMonotoryOutANice[],
		actionScriptMonotoryOutAOK[],
		actionScriptMonotoryOutAGroove[],
		actionScript127[],
		actionScript128[],
		actionScript129[],
		actionScript130[],
		actionScript131[],
		actionScript132[],
		actionScriptGiantStepCop[],
		actionScript134[],
		actionScriptKifuyaTukimatou[],
		actionScriptFatherCallPaula[],
		actionScriptSwWins[],
		actionScriptSw2Wins[],
		actionScriptNearAndoughnut[],
		actionScriptAndoughnutMessage[],
		actionScriptWinsNearKanai[],
		actionScriptWinsNearBMonkey[],
		actionScriptWinsAwayKanai[],
		actionScriptWinsAwayBMonkey[],
		actionScriptIntoSwWins[],
		actionScriptSwWinsA[],
		actionScriptSwSkyA[],
		actionScriptSwSkyB[],
		actionScriptSwSkyC[],
		actionScriptSwSkyD[],
		actionScriptSwSkyE[],
		actionScriptSwSkyF[],
		actionScriptSwFourA[],
		actionScriptSwFourB[],
		actionScriptSwFourShadowA[],
		actionScriptSwFourShadowB[],
		actionScriptSwDsrtA[],
		actionScriptSwDsrtB[],
		actionScriptSwDsrtShadowA[],
		actionScriptSwDsrtShadowB[],
		actionScriptSwThrkA[],
		actionScriptSwThrkB[],
		actionScriptSwWinsShadowA[],
		actionScriptSwThrkShadowA[],
		actionScriptSwThrkShadowB[],
		actionScriptSwWinsLand[],
		actionScriptSwWinsLand2[],
		actionScriptWinsSkywalkerShadow[],
		actionScriptOutSkywalker[],
		actionScriptSwSumsA[],
		actionScriptSwSumsShadowA[],
		actionScriptSwSplinter1[],
		actionScriptSwSplinter2[],
		actionScriptSwSplinter3[],
		actionScriptOdorokiNesPola[],
		actionScriptKurokogeJeff[],
		actionScriptJeffAddParty[],
		actionScript178[],
		actionScriptGorgeousChaous[],
		actionScriptToGorgeousChaous[],
		actionScriptTonzuraBusChaous[],
		actionScriptIntoTonzuraBusChaous[],
		actionScriptGorgeousChaousRide[],
		actionScriptTonzuraBusToThrk[],
		actionScriptTBusToThrkTunnel[],
		actionScriptTBusIntoThrk[],
		actionScriptGorgeousMono[],
		actionScript188[],
		actionScriptTBusRideMono[],
		actionScript190[],
		actionScriptIntoTonzuraBusMono[],
		actionScriptGorgeousMonoRide[],
		actionScriptTBusToFourTunnel[],
		actionScriptTBusFourTunnel[],
		actionScriptTBusTunnelBrdg[],
		actionScriptTBusBrdgTunnel[],
		actionScriptTBusTunnelDsrt[],
		actionScriptTBusDsrtTunnel[],
		actionScriptTBusTunnelHwayL[],
		actionScriptTBusHwayTunnelL[],
		actionScriptTBusTunnelThrkL[],
		actionScriptBusThrkTwsnIn[],
		actionScriptBusToThrkTunnel[],
		actionScriptBusThrkTunnel[],
		actionScriptBusTunnelTwsn[],
		actionScriptBusThrkDsrtIn[],
		actionScriptBusThrkToDsrt[],
		actionScriptBusThrkTunnelR[],
		actionScriptBusTunnelHwayR[],
		actionScriptBusHwayTunnelR[],
		actionScriptBusTunnelDsrtR[],
		actionScriptBusDsrtTunnelR[],
		actionScriptBusTunnelBrdgR[],
		actionScriptBusBrdgTunnelR[],
		actionScriptBusTunnelFour[],
		actionScriptBusTunnelDsrtRJ[],
		actionScriptBusDsrtThrkIn[],
		actionScriptBusDsrtToThrk[],
		actionScriptBusDsrtFourIn[],
		actionScriptBusDsrtToFour[],
		actionScript221[],
		actionScriptSyochoA[],
		actionScriptSyochoB[],
		actionScriptSyochoC[],
		actionScriptFollowToSyocho[],
		actionScriptFollowToSyocho[],
		actionScriptFollowToSyocho[],
		actionScriptCop5A[],
		actionScriptCop5B[],
		actionScriptCop5C[],
		actionScriptCop5D[],
		actionScriptCop5E[],
		actionScriptCop5ToNessA[],
		actionScriptCop5ToNessB[],
		actionScriptCop5ToNessC[],
		actionScriptCop5ToNessD[],
		actionScriptCop5ToNessE[],
		actionScriptCop5Escape[],
		actionScriptSyochoToNess[],
		actionScript240[],
		actionScriptGrfdPolaAddParty[],
		actionScriptTopolloHallA[],
		actionScriptMuseumKomorita[],
		actionScriptFrsdFieldO[],
		actionScriptFrsdFieldL[],
		actionScriptFrsdFieldM[],
		actionScriptFrsdFieldP[],
		actionScriptFrsdFieldQ[],
		actionScriptTonchiki[],
		actionScript250[],
		actionScriptTacyNearBMonkey[],
		actionScriptBMonkeyGum[],
		actionScriptBMonkeyGum1[],
		actionScriptBMonkeyFly[],
		actionScriptBMonkeyFlyS[],
		actionScript256[],
		actionScriptYunboBack[],
		actionScript258[],
		actionScriptSigeYunboMove[],
		actionScript260[],
		actionScriptBMonkeyRope[],
		actionScriptBMonkeyRopeS[],
		actionScriptBMonkeyRopeOrosu[],
		actionScriptBMonkeyRopeDown[],
		actionScriptBMonkeyRopeGood[],
		actionScriptDashTony[],
		actionScriptJumpJef[],
		actionScriptJumpJefS[],
		actionScriptOutTony[],
		actionScriptJefIntoSwThrk[],
		actionScriptIntoSwThrk[],
		actionScriptSwToSums1[],
		actionScript273[],
		actionScriptKoya[],
		actionScriptKoya[],
		actionScriptKoya[],
		actionScriptCarpDungL[],
		actionScriptCarpDungR[],
		actionScriptCircleCultistNorthwest[],
		actionScriptCircleCultistNortheast[],
		actionScriptCircleCultistEast[],
		actionScriptCircleCultistSouth[],
		actionScriptCircleCultistWest[],
		actionScript284[],
		actionScriptBMonkeyBye[],
		actionScript286[],
		actionScriptDoseSpaceTunnel[],
		actionScriptIntoStKurokoge[],
		actionScriptOutStKurokoge[],
		actionScriptAndDose[],
		actionScriptIntoShip[],
		actionScriptToSailor[],
		actionScriptShipToSkrb1[],
		actionScriptShipSmall[],
		actionScriptEvtKrakenApproach[],
		actionScriptShipToSkrb2[],
		actionScriptOutShip[],
		actionScriptSubmarine1[],
		actionScriptSubmarine2[],
		actionScriptOutSubmarine[],
		actionScriptGuardA1[],
		actionScriptGuardA2[],
		actionScriptGuardB1[],
		actionScriptGuardB2[],
		actionScriptGuard3[],
		actionScriptToGuard[],
		actionScriptMochi1[],
		actionScriptMochiYunbo[],
		actionScriptMochi2[],
		actionScriptStSt3[],
		actionScriptDoseiSt3[],
		actionScriptAndSt31[],
		actionScriptAndSt32[],
		actionScriptKidSt3[],
		actionScriptAndNearSt3[],
		actionScriptOutSt3[],
		actionScriptGeppuPass[],
		actionScriptMaboroshiIn[],
		actionScriptPooToOldman[],
		actionScriptMaboroshiOut1[],
		actionScriptMaboroshiOut2[],
		actionScriptHoihoiA[],
		actionScriptHoihoiB[],
		actionScriptHoihoiC[],
		actionScriptHoihoiD[],
		actionScriptHoihoiE[],
		actionScriptHoihoiF[],
		actionScriptHoihoiG[],
		actionScriptHoihoiH[],
		actionScriptHoihoiI[],
		actionScriptHoihoiJ[],
		actionScriptHoihoiK[],
		actionScriptHoihoiL[],
		actionScriptHoihoiM[],
		actionScript335[],
		actionScriptIntoSt2[],
		actionScriptChkaSt2Still[],
		actionScriptOutSt2[],
		actionScriptPooSyugyou1[],
		actionScriptPooSyugyou2[],
		actionScriptMessenger[],
		actionScriptSenzo1[],
		actionScriptSenzo2[],
		actionScriptPooTeleport[],
		actionScriptSyugyouAddPoo[],
		actionScriptKaitenNess[],
		actionScriptNessAwake[],
		actionScriptTalkPaulaJeff[],
		actionScriptTalkPaulaJeff[],
		actionScriptTalkPoo[],
		actionScriptBGChange[],
		actionScriptPowspot[],
		actionScriptKoke[],
		actionScriptMonoRMan[],
		actionScriptStageParty[],
		actionScriptStageFadeout[],
		actionScriptTStage1Scr1[],
		actionScriptTStage1Thank[],
		actionScriptTStage1OK[],
		actionScript360[],
		actionScriptTStage1MikeL[],
		actionScriptTStage1MikeR[],
		actionScriptTStage1Nice[],
		actionScriptTStage1Groove[],
		actionScriptTStage1Gorgeous[],
		actionScriptTStage1LuckyDance[],
		actionScriptTStage1GorgeousDance[],
		actionScriptTStage1Lucky[],
		actionScriptTStage1Scr2[],
		actionScriptTStage1Flip[],
		actionScriptTStage1FlipTurn[],
		actionScriptTStage2Scr1[],
		actionScriptTStage2MikeL[],
		actionScriptTStage2MikeR[],
		actionScriptTStage23Thank[],
		actionScriptTStage23OK[],
		actionScriptTStage23Nice[],
		actionScriptTStage23Groove[],
		actionScriptTStage23HighHat[],
		actionScriptTStage2SpotInitPlayer[],
		actionScriptTStage2Player[],
		actionScriptTStage2Spotlight[],
		actionScriptTStage2Gorgeous[],
		actionScriptTStage2Lucky[],
		actionScriptTStage2GorgeousWalk[],
		actionScriptTStage2LuckyWalk[],
		actionScriptTStage2GorgeousDance[],
		actionScriptTStage2LuckyDance[],
		actionScriptTStage2GorgeousDance35[],
		actionScriptTStage2LuckyDance35[],
		actionScriptTStage2GorgeousDance4[],
		actionScriptTStage2LuckyDance4[],
		actionScriptTStage2GorgeousDance35[],
		actionScriptTStage2LuckyDance35[],
		actionScriptTStage2GorgeousDance6[],
		actionScriptTStage2LuckyDance6[],
		actionScriptTStage2SpotA[],
		actionScriptTStage2SpotB[],
		actionScriptTStage2GrooveAdlib[],
		actionScriptTStage2Scr2[],
		actionScriptTStage3Scr1[],
		actionScriptTStage3MikeL[],
		actionScriptTStage3MikeR[],
		actionScriptTStage23Thank[],
		actionScriptTStage23OK[],
		actionScriptTStage23Nice[],
		actionScriptTStage23Groove[],
		actionScriptTStage23HighHat[],
		actionScriptTStage3Band[],
		actionScriptTStage3Lucky1[],
		actionScriptTStage3Gorgeous1[],
		actionScriptTStage3Lucky2[],
		actionScriptTStage3Gorgeous2[],
		actionScriptTStage3Lucky3[],
		actionScriptTStage3Gorgeous3[],
		actionScriptTStage3Lucky4[],
		actionScriptTStage3Gorgeous4[],
		actionScriptTStage3Lucky5[],
		actionScriptTStage3Gorgeous5[],
		actionScriptTStage3Lucky6[],
		actionScriptTStage3Gorgeous6[],
		actionScriptTStage3Lucky7[],
		actionScriptTStage3Gorgeous7[],
		actionScriptTStage3Lucky8[],
		actionScriptTStage3Gorgeous8[],
		actionScriptTStage3Lucky9[],
		actionScriptTStage3Gorgeous9[],
		actionScriptTStage3Lucky10[],
		actionScriptTStage3Gorgeous10[],
		actionScriptTStage3Thank3[],
		actionScriptTStage3OK3Nice3Groove3HighHat3[],
		actionScriptTStage3OK3Nice3Groove3HighHat3[],
		actionScriptTStage3OK3Nice3Groove3HighHat3[],
		actionScriptTStage3OK3Nice3Groove3HighHat3[],
		actionScriptTStage3Venus[],
		actionScriptTStage3TBus[],
		actionScript437[],
		actionScriptVStage1Scr1[],
		actionScriptVStage1VenusStill[],
		actionScriptVStage1VenusLight1[],
		actionScriptVStage1VenusLight2[],
		actionScriptVStage1Venus[],
		actionScriptVStage1KomoritaCross[],
		actionScriptVStage1KomoritaAppear[],
		actionScriptVStage1BodyguardL[],
		actionScriptVStage1BodyguardR[],
		actionScriptVStage1Scr2[],
		actionScriptPhotographer[],
		actionScriptPhotographerS[],
		actionScriptNesPeace[],
		actionScriptNesPeaceSaikyou[],
		actionScriptCameraEye[],
		actionScriptBusDriverL[],
		actionScriptBusDriverR[],
		actionScriptBusFourThrkIn[],
		actionScriptBusFourThrkGo[],
		actionScriptBusFourTunnel[],
		actionScriptBusTunnelBrdgL[],
		actionScriptBusBrdgTunnelL[],
		actionScriptBusTunnelDsrtL[],
		actionScriptBusDsrtTunnelL[],
		actionScriptBusTunnelHwayL[],
		actionScriptBusHwayTunnelL[],
		actionScriptBusTunnelThrkL[],
		actionScriptTeleportFail[],
		actionScriptTeleportSuccess[],
		actionScript467[],
		actionScriptGorgeousFree2A[],
		actionScriptLuckyFree2A[],
		actionScriptNiceFree2A[],
		actionScriptOKFree2A[],
		actionScriptGrooveFree2A[],
		actionScriptTonzuraFree2B[],
		actionScriptGrooveFree2B[],
		actionScriptGorgeousFree2C[],
		actionScriptProloguePokey1[],
		actionScriptProloguePokey2[],
		actionScriptProloguePokey3[],
		actionScriptBMonkeyTassi1A[],
		actionScriptTassi1[],
		actionScriptBMonkeyTassi1B[],
		actionScriptBMonkeyTassi1C[],
		actionScriptRideTassi1[],
		actionScriptOutTassi1[],
		actionScriptUzu1[],
		actionScriptUzu2[],
		actionScriptTacyMask1[],
		actionScriptTacyMask2[],
		actionScriptTacyMask3[],
		actionScriptTacyMask4[],
		actionScriptUzu1TassiBye[],
		actionScriptUzu2TassiBye[],
		actionScriptUzu3TassiByeU[],
		actionScriptUzu3TassiByeL[],
		actionScriptLeaf1[],
		actionScriptLeaf2[],
		actionScript497[],
		actionScript498[],
		actionScriptFreshDelivery[],
		actionScriptRespawnedDelivery[],
		actionScript501[],
		actionScript502[],
		actionScript503[],
		actionScript504[],
		actionScript505[],
		actionScript506[],
		actionScript507[],
		actionScript508[],
		actionScript509[],
		actionScript510[],
		actionScript511[],
		actionScript512[],
		actionScript513[],
		actionScript514[],
		actionScript515[],
		actionScript516[],
		actionScript517[],
		actionScript518[],
		actionScript519[],
		actionScript520[],
		actionScript521[],
		actionScript522[],
		actionScript523[],
		actionScript524[],
		actionScript525[],
		actionScript526[],
		actionScript527[],
		actionScript528[],
		actionScript529[],
		actionScript530[],
		actionScript531[],
		actionScript532[],
		actionScript533[],
		actionScriptKingSleepingNameSummary[],
		actionScriptMdToto[],
		actionScriptMdThrk[],
		actionScriptMdMakyo[],
		actionScriptMdMakyoRafuresia[],
		actionScriptMdHashiBus[],
		actionScriptMdHashiYunbo[],
		actionScriptMdDung[],
		actionScriptMdTwsn[],
		actionScriptMdSkrb[],
		actionScriptMdFrsd[],
		actionScriptMdSums[],
		actionScriptMdOnet[],
		actionScriptLastBattle[],
		actionScriptNesFace[],
		actionScriptLastBattlePokey[],
		actionScript550[],
		actionScriptSpiritReturnNes[],
		actionScriptSpiritReturnPola[],
		actionScriptSpiritReturnJef[],
		actionScriptSpiritReturnPoo[],
		actionScriptWhiteout[],
		actionScriptSpiritReturnNes2[],
		actionScriptSpiritReturnPola2[],
		actionScriptSpiritReturnJef2[],
		actionScriptSpiritReturnPoo2[],
		actionScriptComeBackNes[],
		actionScriptComeBackPola[],
		actionScriptComeBackJef[],
		actionScriptComeBackPoo[],
		actionScriptPooExplosion[],
		actionScriptDoseAndonutEnd[],
		actionScriptDoseDoseiEnd[],
		actionScriptPolaPolastarReturn[],
		actionScriptPolaPolastarReturnL[],
		actionScriptPolaPolastarReturnR[],
		actionScriptPresentBoxFall1[],
		actionScriptPresentBoxFall2[],
		actionScriptPresentBoxFall3[],
		actionScriptPresentBoxShadow1[],
		actionScriptPresentBoxShadow2[],
		actionScriptPresentBoxShadow3[],
		actionScript576[],
		actionScriptDoseiNesDown[],
		actionScriptDoseiPolaDown[],
		actionScriptDoseiJefDown[],
		actionScriptDoseiPooDown[],
		actionScript581[],
		actionScriptElevaterUp[],
		actionScriptElevaterDown[],
		actionScript584[],
		actionScript585[],
		actionScript586[],
		actionScript587[],
		actionScript588[],
		actionScript589[],
		actionScript590[],
		actionScript591[],
		actionScript592[],
		actionScriptMatentAwayZombi1[],
		actionScriptMatentAwayZombi2[],
		actionScript595[],
		actionScriptGumiStoneRise[],
		actionScript597[],
		actionScriptTowardsPlayer[],
		actionScript599[],
		actionScript600[],
		actionScript601[],
		actionScript602[],
		actionScript603[],
		actionScriptAppleMouseStepback[],
		actionScriptMapObjTBack[],
		actionScriptPeopleTBack[],
		actionScript607[],
		actionScript608[],
		actionScript609[],
		actionScript610[],
		actionScriptFourMuseumBilk[],
		actionScriptFourMuseumRid[],
		actionScriptFourFollowMuseumA[],
		actionScriptFourMuseumReturn[],
		actionScriptSumsMuseumBilk[],
		actionScriptSumsMuseumRid[],
		actionScriptSumsFollowMuseumA[],
		actionScriptSumsMuseumReturn[],
		actionScriptSyochoEscape[],
		actionScriptSaiteiMaboroshiIn[],
		actionScriptSaiteiMaboroshiOut[],
		actionScriptInsekiStarman[],
		actionScriptAkanbePokey[],
		actionScript624[],
		actionScriptMouseAddParty[],
		actionScriptInsekiWakeupWalk[],
		actionScriptPeopleSleep[],
		actionScript628[],
		actionScript629[],
		actionScriptLardnaSlapBunbuun[],
		actionScript631[],
		actionScript632[],
		actionScriptIntoNight[],
		actionScriptBlackout[],
		actionScriptBlinkSuicide[],
		actionScriptButukarizaru[],
		actionScriptLeaveButukarizaru[],
		actionScriptUkkariCarrier[],
		actionScriptLeaveUkkariCarrier[],
		actionScriptApproachContScript[],
		actionScriptEavesMaid[],
		actionScript642[],
		actionScriptPanningWinters1[],
		actionScriptPanningWinters2[],
		actionScriptPanningRamma1[],
		actionScriptPanningRamma2[],
		actionScript647[],
		actionScriptJumpTonchiki[],
		actionScriptJumpTonchikiShadow[],
		actionScriptTonchikiEnterHouse[],
		actionScriptStrikeNess[],
		actionScriptTakeNessKatacomb1A[],
		actionScriptTakeNessKatacomb1B[],
		actionScriptTakeNessKatacomb1C[],
		actionScriptTakeNessKatacomb2A[],
		actionScriptTakeNessKatacomb2B[],
		actionScriptTakeNessKatacomb2C[],
		actionScriptNessFollowZombi1[],
		actionScriptNessFollowZombi2[],
		actionScriptPaulaFollowZombi1[],
		actionScriptPaulaFollowZombi2[],
		actionScriptNessStill[],
		actionScriptPaulaStill[],
		actionScriptBikiniLookNess[],
		actionScriptAyasii[],
		actionScript666[],
		actionScriptMuMaboroshiOut[],
		actionScriptLeaveSarusensei[],
		actionScriptLeadSarusensei[],
		actionScriptTeleportSarusensei[],
		actionScriptReturnSarusensei[],
		actionScript672[],
		actionScript673[],
		actionScript674[],
		actionScriptChiteiQuake[],
		actionScriptToFountainA[],
		actionScriptToFountainB[],
		actionScriptToFountainC[],
		actionScriptLiftByFountain[],
		actionScriptMaidIntoBuilding[],
		actionScriptMakyoDoctorApproach[],
		actionScriptGoOutCakeWife[],
		actionScript683[],
		actionScript684[],
		actionScriptSlotBrosRotateL[],
		actionScriptSlotBrosRotateM[],
		actionScriptSlotBrosRotateN[],
		actionScriptSlotBrosStopL[],
		actionScriptSlotBrosStopM[],
		actionScriptSlotBrosStopN[],
		actionScriptSlotBrosStopNReach[],
		actionScriptSlotBrosPresent[],
		actionScript693[],
		actionScript694[],
		actionScriptEvtIntoPsychoMyHome[],
		actionScriptEvtPsychoMyHome1f[],
		actionScriptEvtPsychoMyHomeRouka[],
		actionScriptEvtPsychoMyRoom[],
		actionScript699[],
		actionScript700[],
		actionScriptEvtMonotolyGoSwitch[],
		actionScriptEvtMonokumaMove[],
		actionScriptEvtMonokabeMove[],
		actionScript704[],
		actionScriptCarpainterThunder[],
		actionScriptCarpainterThunderhead[],
		actionScript707[],
		actionScript708[],
		actionScript709[],
		actionScript710[],
		actionScript711[],
		actionScriptEvtMonoHeliBoatman[],
		actionScriptEvtHeliFWingStart[],
		actionScriptEvtHeliRWingStart[],
		actionScriptEvtMonoHeliShadow[],
		actionScriptHeliPokeyFace[],
		actionScriptEvtPray1Mama[],
		actionScriptEvtPray1Tracy[],
		actionScriptEvtPray1Dog[],
		actionScriptEvtPray2Bikini[],
		actionScriptEvtPray2Nice[],
		actionScriptEvtPray2Okay[],
		actionScriptEvtPray2Groovy[],
		actionScriptEvtPray3Polapapa[],
		actionScriptEvtPray3Polamama[],
		actionScriptEvtPray3ChildA[],
		actionScriptEvtPray3ChildB[],
		actionScriptEvtPray3ChildD[],
		actionScriptEvtPray4Tony[],
		actionScriptEvtPray4GazeTony[],
		actionScriptEvtPray4PupilA[],
		actionScriptEvtPray4PupilB[],
		actionScriptEvtPray4PupilC[],
		actionScriptEvtPray4PupilD[],
		actionScriptEvtPray4Gaus[],
		actionScriptEvtPray4Explain[],
		actionScriptEvtPray4DirDown[],
		actionScriptEvtPray4DirLeft[],
		actionScriptEvtPray4DirRight[],
		actionScript740[],
		actionScriptEvtPray5GirlA[],
		actionScriptEvtPray5GirlB[],
		actionScriptEvtPray5GirlC[],
		actionScriptEvtPray6Frank[],
		actionScript745[],
		actionScriptEvtPray7STunnel[],
		actionScriptEvtPray7Andoughnut[],
		actionScriptEvtPray7Andoughnut2[],
		actionScriptEvtPray7Applekid[],
		actionScriptEvtPray7Dosei[],
		actionScriptEvtPray7DoseiA[],
		actionScriptEvtPray7DoseiB[],
		actionScriptEvtPray7DoseiC[],
		actionScriptEvtPray7DoseiD[],
		actionScriptEvtPray7Kyorokyoro[],
		actionScriptEvtPray7Motchy[],
		actionScriptEvtPrayOvalWindow[],
		actionScript758[],
		actionScriptBlockZombiB[],
		actionScriptEndPhotoman[],
		actionScriptEndShadow[],
		actionScriptEndCamera[],
		actionScriptEvtEatMagicCake[],
		actionScriptEvtPoolaaa[],
		actionScriptKanjiAtTheNight[],
		actionScriptEvtFeelDiggy[],
		actionScript767[],
		actionScriptEvtFluctuateMagicant[],
		actionScript769[],
		actionScriptOmarGiveHierogriph[],
		actionScript771[],
		actionScriptOpenGateGumi[],
		actionScriptPossessPCAllStill[],
		actionScriptTracyAppear[],
		actionScriptToBeContOvalClose[],
		actionScriptToBeContTitle[],
		actionScriptForbidControl[],
		actionScriptPermitControl[],
		actionScriptSealPCAllDirLeft[],
		actionScriptSealPCAllDirDown[],
		actionScriptSealPCPaulaDirDown[],
		actionScriptRemodelOperation[],
		actionScript783[],
		actionScript784[],
		actionScript785[],
		actionScriptMiniGhost[],
		actionScript787[],
		actionScriptTitleScreen1[],
		actionScriptTitleScreen2[],
		actionScriptTitleScreen3[],
		actionScriptTitleScreen4[],
		actionScriptTitleScreen5[],
		actionScriptTitleScreen6[],
		actionScriptTitleScreen7[],
		actionScriptTitleScreen8[],
		actionScriptTitleScreen9[],
		actionScriptTitleScreen10[],
		actionScriptTitleScreen11[],
		actionScriptCreditsObject[],
		actionScriptCreditsPartyMember[],
		actionScriptCastScene[],
		actionScript802[],
		actionScript803[],
		actionScript804[],
		actionScript805[],
		actionScript806[],
		actionScriptCastScenePhaseDistorter[],
		actionScript808[],
		actionScript809[],
		actionScript810[],
		actionScript811[],
		actionScript812[],
		actionScript813[],
		actionScript814[],
		actionScript815[],
		actionScript816[],
		actionScript817[],
		actionScript818[],
		actionScript819[],
		actionScript820[],
		actionScript821[],
		actionScript822[],
		actionScript823[],
		actionScript824[],
		actionScript825[],
		actionScript826[],
		actionScript827[],
		actionScript828[],
		actionScript829[],
		actionScript830[],
		actionScript831[],
		actionScript832[],
		actionScript833[],
		actionScript834[],
		actionScript835[],
		actionScript836[],
		actionScript837[],
		actionScript838[],
		actionScript839[],
		actionScript840[],
		actionScript841[],
		actionScript842[],
		actionScript843[],
		actionScript844[],
		actionScript845[],
		actionScript846[],
		actionScript847[],
		actionScript848[],
		actionScript849[],
		actionScript850[],
		actionScript851[],
		actionScript852[],
		actionScript853[],
		actionScript854[],
		actionScript855[],
		actionScript856[],
		actionScript857[],
		actionScript858[],
		actionScript859[],
		actionScriptGasStationFlashing[],
		actionScriptPeopleWalk0NameSummary[],
		actionScript862[],
		actionScript863[],
		actionScript864[],
		actionScript865[],
		actionScript866[],
		actionScript867[],
		actionScript868[],
		actionScript869[],
		actionScript870[],
		actionScript871[],
		actionScript872[],
		actionScript873[],
		actionScript874[],
		actionScript875[],
		actionScript876[],
		actionScript877[],
		actionScript878[],
		actionScript879[],
		actionScript880[],
		actionScript881[],
		actionScript882[],
		actionScript883[],
		actionScript884[],
		actionScript885[],
		actionScript886[],
		actionScript887[],
		actionScript888[],
		actionScript889[],
		actionScript890[],
		actionScript891[],
		actionScript892[],
		actionScript893[],
		actionScriptUnused894[],
	];
}
// does not exist in vanilla game
debug immutable ubyte[][string] otherScripts;
shared static this() {
	debug otherScripts = [
		"unknownC30295": unknownC30295[],
		"unknownC30A1F": unknownC30A1F[],
		"unknownC30C55": unknownC30C55[],
		"unknownC30C67": unknownC30C67[],
		"unknownC30C7F": unknownC30C7F[],
		"unknownC30C97": unknownC30C97[],
		"unknownC30CAF": unknownC30CAF[],
		"unknownC30CC7": unknownC30CC7[],
		"unknownC31D2D": unknownC31D2D[],
		"unknownC31D4F": unknownC31D4F[],
		"unknownC31DF4": unknownC31DF4[],
		"unknownC31E2D": unknownC31E2D[],
		"unknownC31EC1": unknownC31EC1[],
		"unknownC31ED8": unknownC31ED8[],
		"unknownC31EEF": unknownC31EEF[],
		"unknownC32138": unknownC32138[],
		"unknownC32CD2": unknownC32CD2[],
		"unknownC33399": unknownC33399[],
		"unknownC333AA": unknownC333AA[],
		"unknownC333BB": unknownC333BB[],
		"unknownC333CC": unknownC333CC[],
		"unknownC333DD": unknownC333DD[],
		"unknownC33549": unknownC33549[],
		"unknownC33BFB": unknownC33BFB[],
		"unknownC33C18": unknownC33C18[],
		"unknownC33C1D": unknownC33C1D[],
		"unknownC33DBE": unknownC33DBE[],
		"unknownC34392": unknownC34392[],
		"unknownC343AE": unknownC343AE[],
		"unknownC343DB": unknownC343DB[],
		"unknownC348C4": unknownC348C4[],
		"unknownC34964": unknownC34964[],
		"unknownC34A61": unknownC34A61[],
		"unknownC34B62": unknownC34B62[],
		"unknownC34D39": unknownC34D39[],
		"unknownC34E73": unknownC34E73[],
		"waitCreditsTiles": waitCreditsTiles[],
		"animateCastSpriteTask": animateCastSpriteTask[],
		"castSceneStandInPlace": castSceneStandInPlace[],
		"unknownC35FCD": unknownC35FCD[],
		"unknownC362C0": unknownC362C0[],
		"unknownC36834": unknownC36834[],
		"unknownC36A3E": unknownC36A3E[],
		"unknownC36A41": unknownC36A41[],
		"unknownC36BB4": unknownC36BB4[],
		"unknownC36BEA": unknownC36BEA[],
		"actionScriptTriggerTalkTextOnCollisionTask": actionScriptTriggerTalkTextOnCollisionTask[],
		"unknownC36E41": unknownC36E41[],
		"unknownC37439": unknownC37439[],
		"unknownC37545": unknownC37545[],
		"unknownC37559": unknownC37559[],
		"unknownC37A7C": unknownC37A7C[],
		"unknownC3835D": unknownC3835D[],
		"unknownC383BC": unknownC383BC[],
		"unknownC38978": unknownC38978[],
		"unknownC3899E": unknownC3899E[],
		"unknownC39ABB": unknownC39ABB[],
		"unknownC39AC7": unknownC39AC7[],
		"actionScriptWaitBattleFinished": actionScriptWaitBattleFinished[],
		"actionScriptUnusedC3A07F": actionScriptUnusedC3A07F[],
		"animateD8F2": animateD8F2[],
		"animateD24F2": animateD24F2[],
		"animateD12F2": animateD12F2[],
		"animateD9F2": animateD9F2[],
		"animateD6F2": animateD6F2[],
		"animateD2F2": animateD2F2[],
		"animateD8F2Toggle": animateD8F2Toggle[],
		"animateDVAR4F2": animateDVAR4F2[],
		"unknownC3A15E": unknownC3A15E[],
		"unknownC3A17B": unknownC3A17B[],
		"actionScriptSetWalkingSpeedSlowAnimationTask": actionScriptSetWalkingSpeedSlowAnimationTask[],
		"actionScriptSetWalkingSpeedNormalAnimationTask": actionScriptSetWalkingSpeedNormalAnimationTask[],
		"actionScriptSetWalkingSpeedFastAnimationTask": actionScriptSetWalkingSpeedFastAnimationTask[],
		"actionScriptSetWalkingSpeedVeryFastAnimationTask": actionScriptSetWalkingSpeedVeryFastAnimationTask[],
		"actionScriptSetWalkingSpeedExtremelyFastAnimationTask": actionScriptSetWalkingSpeedExtremelyFastAnimationTask[],
		"unknownC3A1F3": unknownC3A1F3[],
		"fadeWaitScript": fadeWaitScript[],
		"unknownC3A20E": unknownC3A20E[],
		"checkCollisionTask": checkCollisionTask[],
		"actionScriptEnemyInitialize": actionScriptEnemyInitialize[],
		"actionScriptGroundedEnemyInitialize": actionScriptGroundedEnemyInitialize[],
		"actionScriptFlyingEnemyInitialize": actionScriptFlyingEnemyInitialize[],
		"enemyBattleCommonTask": enemyBattleCommonTask[],
		"enemyFlyingBattleCommonTask": enemyFlyingBattleCommonTask[],
		"actionScriptHandleBattleCleanup": actionScriptHandleBattleCleanup[],
		"actionScriptDeleteEnemy": actionScriptDeleteEnemy[],
		"actionScriptMoveInDirection": actionScriptMoveInDirection[],
		"unknownC3AA2B": unknownC3AA2B[],
		"unknownC3AA38": unknownC3AA38[],
		"unknownC3AA46": unknownC3AA46[],
		"unknownC3AA5A": unknownC3AA5A[],
		"unknownC3AA6E": unknownC3AA6E[],
		"unknownC3AA82": unknownC3AA82[],
		"unknownC3AA96": unknownC3AA96[],
		"unknownC3AAAA": unknownC3AAAA[],
		"unknownC3AAB8": unknownC3AAB8[],
		"actionScriptSetWalkingSpeedSlow": actionScriptSetWalkingSpeedSlow[],
		"actionScriptSetWalkingSpeedNormal": actionScriptSetWalkingSpeedNormal[],
		"actionScriptSetWalkingSpeedFast": actionScriptSetWalkingSpeedFast[],
		"actionScriptSetWalkingSpeedVeryFast": actionScriptSetWalkingSpeedVeryFast[],
		"actionScriptSetWalkingSpeedExtremelyFast": actionScriptSetWalkingSpeedExtremelyFast[],
		"unknownC3AB26": unknownC3AB26[],
		"actionScriptMakeIntangible": actionScriptMakeIntangible[],
		"actionScriptTakeStepTowardsDestination": actionScriptTakeStepTowardsDestination[],
		"actionScriptMoveToLocation": actionScriptMoveToLocation[],
		"actionScriptMoveToLocationBackwards": actionScriptMoveToLocationBackwards[],
		"actionScriptWaitForLeaderApproach": actionScriptWaitForLeaderApproach[],
		"actionScriptWaitForLeaderToLeaveArea": actionScriptWaitForLeaderToLeaveArea[],
		"actionScriptWanderWithinBounds": actionScriptWanderWithinBounds[],
		"waitForFadeEnd": waitForFadeEnd[],
		"unknownC3AFA3": unknownC3AFA3[],
		"unknownC3B0B6": unknownC3B0B6[],
		"unknownC3B431": unknownC3B431[],
		"unknownC3B70C": unknownC3B70C[],
		"unknownC3BAA3": unknownC3BAA3[],
		"unknownC3BAC4": unknownC3BAC4[],
		"unknownC3BAD7": unknownC3BAD7[],
		"unknownC3BB5C": unknownC3BB5C[],
		"unknownC3BB73": unknownC3BB73[],
		"unknownC3BD03": unknownC3BD03[],
		"unknownC3BEA4": unknownC3BEA4[],
		"unknownC3BED4": unknownC3BED4[],
		"unknownC3C143": unknownC3C143[],
		"unknownC3C1E0": unknownC3C1E0[],
		"unknownC3C20F": unknownC3C20F[],
		"unknownC3C227": unknownC3C227[],
		"unknownC3C35D": unknownC3C35D[],
		"unknownC3C810": unknownC3C810[],
		"unknownC3C81A": unknownC3C81A[],
		"unknownC3C824": unknownC3C824[],
		"unknownC3C871": unknownC3C871[],
		"unknownC3C8FD": unknownC3C8FD[],
		"unknownC3C90C": unknownC3C90C[],
		"unknownC3C94E": unknownC3C94E[],
		"unknownC3CC24": unknownC3CC24[],
		"unknownC3CC5C": unknownC3CC5C[],
		"unknownC3CC94": unknownC3CC94[],
		"unknownC3CCA8": unknownC3CCA8[],
		"unknownC3CEA2": unknownC3CEA2[],
		"unknownC3CEB9": unknownC3CEB9[],
		"unknownC3D0A4": unknownC3D0A4[],
		"unknownC3D913": unknownC3D913[],
		"unknownC3DB7A": unknownC3DB7A[],
		"unknownC3DBDB": unknownC3DBDB[],
		"unknownC3DF90": unknownC3DF90[],
		"unknownC3DFB5": unknownC3DFB5[],
		"unknownC3DFD4": unknownC3DFD4[],
		"unknownC40F18": unknownC40F18[],
		"unknownC40F45": unknownC40F45[],
		"unknownC40F4A": unknownC40F4A[],
		"unknownC40F59": unknownC40F59[],
		"unknownC41036": unknownC41036[],
		"unknownC4116C": unknownC4116C[],
		"unknownC4119D": unknownC4119D[],
		"unknownC411EB": unknownC411EB[],
		"unknownC4121F": unknownC4121F[],
		"unknownC41253": unknownC41253[],
		"unknownC41382": unknownC41382[],
		"unknownC413D6": unknownC413D6[],
		"unknownC41402": unknownC41402[],
		"unknownC4144C": unknownC4144C[],
		"unknownC4152A": unknownC4152A[],
		"unknownC4154E": unknownC4154E[],
		"unknownC4158A": unknownC4158A[],
		"unknownC415BA": unknownC415BA[],
		"unknownC415E7": unknownC415E7[],
		"unknownC4160A": unknownC4160A[],
		"unknownC4163F": unknownC4163F[],
		"unknownC416AC": unknownC416AC[],
		"unknownC4170E": unknownC4170E[],
		"unknownC41822": unknownC41822[],
		"unknownC41900": unknownC41900[],
		"unknownC41938": unknownC41938[],
		"unknownC41974": unknownC41974[],
		"unknownC4198D": unknownC4198D[],
		"unknownC419B2": unknownC419B2[],
		"unknownC419BF": unknownC419BF[],
		"unknownC41A2A": unknownC41A2A[],
		"unknownC41A7D": unknownC41A7D[],
		"actionScriptTitleScreenCommonInit": actionScriptTitleScreenCommonInit[],
		"actionScriptTitleScreenFlashTask": actionScriptTitleScreenFlashTask[],
		"animateCompletedTitleScreen": animateCompletedTitleScreen[],
		"actionScriptRunFadeEffect": actionScriptRunFadeEffect[],
		"actionScriptRunBlinkEffect": actionScriptRunBlinkEffect[],
		"actionScriptRunHStripeEffect": actionScriptRunHStripeEffect[],
		"actionScriptRunVStripeEffect": actionScriptRunVStripeEffect[],
		"actionScriptRunDotsEffect": actionScriptRunDotsEffect[],
		"actionScriptMagicButterflyTask1": actionScriptMagicButterflyTask1[],
		"actionScriptMagicButterflyTask2": actionScriptMagicButterflyTask2[],
		"actionScriptMagicButterflyTask3": actionScriptMagicButterflyTask3[],
	];
}
/** ActionScript 786 - Flies around the party leader in an oval
 * Original_Address: $(DOLLAR)C0AD8A
 */
immutable ubyte[9 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptMiniGhost;
shared static this() {
	actionScriptMiniGhost = initializeScript!actionScriptMiniGhost(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&unknownC0A26B),
		PAUSE(8),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
	LABEL("UNKNOWN0"),
		UPDATE_MINI_GHOST_POSITION_WAIT(1),
		SHORTJUMP("actionScriptMiniGhost.UNKNOWN0"),
	);
}
/** ActionScript 0 - Controls the debug cursor. Basically just a static image, the actual movement is handled externally
 * Original_Address: $(DOLLAR)C2FFB7
 */
immutable ubyte[9 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptDebugCursor;
shared static this() {
	actionScriptDebugCursor = initializeScript!actionScriptDebugCursor(
		SET_ANIMATION_POINTER(&debugCursorSpritemap[0]),
		SET_POSITION_CHANGE_CALLBACK(&updateEntityPositionAbsolute),
		SET_DRAW_CALLBACK(&unknownC0A0FA),
		SET_ANIMATION(0),
	LABEL("UNKNOWN1"),
		PAUSE(5),
		LOAD_DEBUG_CURSOR_GRAPHICS(),
		SHORTJUMP("actionScriptDebugCursor.UNKNOWN1"),
	);
}
/** ActionScript 221 - Script for paula's dad indoors. Stands still most of the time, but when Paula has been rescued, enters the room and thanks Ness.
 * Original_Address: $(DOLLAR)C30195
 */
immutable ubyte[95 + 14 * (const(void)*).sizeof + 1 * string.sizeof + 10 * ScriptPointer.sizeof] actionScript221;
shared static this() {
	actionScript221 = initializeScript!actionScript221(
		GET_EVENT_FLAG(EventFlag.pola),
		JUMP_IF_TRUE("actionScriptMapObjStill"),
		GET_EVENT_FLAG(EventFlag.polaGrfd),
		JUMP_IF_FALSE("actionScriptMapObjStill"),
		// wait for leader to enter center of room
		SHORTCALL("unknownC3AA38"),
		SET_ANIMATION(255),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_VAR(ActionScriptVars.v4, 1),
		SET_VAR(ActionScriptVars.v0, 6800),
		SET_VAR(ActionScriptVars.v1, 7776),
		SET_VAR(ActionScriptVars.v2, 8),
		SET_VAR(ActionScriptVars.v3, 192),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		// appear at doorway, first message
		SET_X(6888),
		SET_Y(7784),
		SET_ANIMATION(0),
		CLEAR_CURRENT_ENTITY_COLLISION2(),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PLAY_SFX(Sfx.doorClose),
		PAUSE(1),
		QUEUE_TEXT_SCRIPT("MSG_EVT_PAURA_FATHER_WAKARE"),
		// move 18 pixels ahead of party
		PAUSE(1),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_VAR(ActionScriptVars.v5, 1),
		START_TASK("unknownC3AFA3"),
		GET_POSITION_OF_PARTY_MEMBER(255),
		ADD(ActionScriptVars.v6, -18),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		END_LAST_TASK(),
		// next part of dialogue
		YIELD_TO_TEXT(),
		// follow paula around the room
		PAUSE(1),
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		START_TASK("animateD8F2"),
		START_TASK("checkCollisionTask"),
		SET_VAR(ActionScriptVars.v5, 21),
		GET_POSITION_OF_PARTY_MEMBER(254),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		GET_POSITION_OF_PARTY_MEMBER(2),
		MOVE_TOWARDS_DESTINATION(),
		SHORTJUMP("actionScript221.UNKNOWN1"),
	);
}
/// $C30235
immutable ubyte[14 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptSyochoA;
shared static this() {
	actionScriptSyochoA = initializeScript!actionScriptSyochoA(
		WRITE_WORD_WRAM(&pendingInteractions, 1),
		SET_VAR(ActionScriptVars.v6, 6928),
		SET_VAR(ActionScriptVars.v7, 392),
		SHORTCALL("unknownC30295"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3024A
immutable ubyte[17 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptSyochoB;
shared static this() {
	actionScriptSyochoB = initializeScript!actionScriptSyochoB(
		SET_X(8168),
		SET_Y(104),
		SET_VAR(ActionScriptVars.v6, 7960),
		SET_VAR(ActionScriptVars.v7, 104),
		SHORTCALL("unknownC30295"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C30260
immutable ubyte[35 + 5 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSyochoC;
shared static this() {
	actionScriptSyochoC = initializeScript!actionScriptSyochoC(
		SET_X(7632),
		SET_Y(216),
		SET_VAR(ActionScriptVars.v6, 7552),
		SET_VAR(ActionScriptVars.v7, 216),
		SHORTCALL("unknownC30295"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		YIELD_TO_TEXT(),
		PAUSE(1),
		WRITE_WORD_WRAM(&pendingInteractions, 0),
		SET_VAR(ActionScriptVars.v6, 7632),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C30295 - vars 6 and 7
immutable ubyte[13 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC30295;
shared static this() {
	unknownC30295 = initializeScript!unknownC30295(
		SHORTCALL("unknownC3AA38"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORT_RETURN(),
	);
}
/// $C302AC
immutable ubyte[22 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptFollowToSyocho;
shared static this() {
	actionScriptFollowToSyocho = initializeScript!actionScriptFollowToSyocho(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("actionScriptMakeIntangible"),
		SET_VAR(ActionScriptVars.v5, 17),
		SET_SPRITE_DESTINATION(OverworldSprite.captainStrong),
		SET_MOVEMENT_SPEED(256),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		SET_SPRITE_DESTINATION(OverworldSprite.captainStrong),
		MOVE_TOWARDS_DESTINATION(),
		SHORTJUMP("actionScriptFollowToSyocho.UNKNOWN0"),
	);
}
/// $C302D7
immutable ubyte[19 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptCop5A;
shared static this() {
	actionScriptCop5A = initializeScript!actionScriptCop5A(
		SET_VAR(ActionScriptVars.v6, 7496),
		SET_VAR(ActionScriptVars.v7, 248),
		SET_VAR(ActionScriptVars.v0, 7560),
		SET_VAR(ActionScriptVars.v1, 248),
		SHORTCALL("actionScript228_229_230_231_232Common"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C302EF
immutable ubyte[18 + 1 * ScriptPointer.sizeof] actionScriptCop5B;
shared static this() {
	actionScriptCop5B = initializeScript!actionScriptCop5B(
		SET_VAR(ActionScriptVars.v6, 7512),
		SET_VAR(ActionScriptVars.v7, 232),
		SET_VAR(ActionScriptVars.v0, 7496),
		SET_VAR(ActionScriptVars.v1, 232),
		SHORTCALL("actionScript228_229_230_231_232Common"),
		HALT(),
	);
}
/// $C30303
immutable ubyte[18 + 1 * ScriptPointer.sizeof] actionScriptCop5C;
shared static this() {
	actionScriptCop5C = initializeScript!actionScriptCop5C(
		SET_VAR(ActionScriptVars.v6, 7528),
		SET_VAR(ActionScriptVars.v7, 216),
		SET_VAR(ActionScriptVars.v0, 7472),
		SET_VAR(ActionScriptVars.v1, 216),
		SHORTCALL("actionScript228_229_230_231_232Common"),
		HALT(),
	);
}
/// $C30317
immutable ubyte[18 + 1 * ScriptPointer.sizeof] actionScriptCop5D;
shared static this() {
	actionScriptCop5D = initializeScript!actionScriptCop5D(
		SET_VAR(ActionScriptVars.v6, 7544),
		SET_VAR(ActionScriptVars.v7, 200),
		SET_VAR(ActionScriptVars.v0, 7504),
		SET_VAR(ActionScriptVars.v1, 200),
		SHORTCALL("actionScript228_229_230_231_232Common"),
		HALT(),
	);
}
/// $C3032B
immutable ubyte[18 + 1 * ScriptPointer.sizeof] actionScriptCop5E;
shared static this() {
	actionScriptCop5E = initializeScript!actionScriptCop5E(
		SET_VAR(ActionScriptVars.v6, 7560),
		SET_VAR(ActionScriptVars.v7, 192),
		SET_VAR(ActionScriptVars.v0, 7536),
		SET_VAR(ActionScriptVars.v1, 192),
		SHORTCALL("actionScript228_229_230_231_232Common"),
		HALT(),
	);
}
/// $C3033F
immutable ubyte[30 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript228_229_230_231_232Common;
shared static this() {
	actionScript228_229_230_231_232Common = initializeScript!actionScript228_229_230_231_232Common(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 14),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v6),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v7),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		GET_DIRECTION_FROM_PLAYER_TO_ENTITY(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORT_RETURN(),
	);
}
/// $C3036F
immutable ubyte[22 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptCop5ToNessA;
shared static this() {
	actionScriptCop5ToNessA = initializeScript!actionScriptCop5ToNessA(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 8),
		START_TASK("unknownC3AFA3"),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 20),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
alias actionScriptCop5ToNessB = actionScriptCop5ToNessA;
alias actionScriptCop5ToNessC = actionScriptCop5ToNessA;
alias actionScriptCop5ToNessD = actionScriptCop5ToNessA;
alias actionScriptCop5ToNessE = actionScriptCop5ToNessA;
/// $C30394
immutable ubyte[27 + 3 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptCop5Escape;
shared static this() {
	actionScriptCop5Escape = initializeScript!actionScriptCop5Escape(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 6),
		START_TASK("unknownC3AFA3"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 7632),
		SET_VAR(ActionScriptVars.v7, 216),
		SHORTCALL("actionScriptMoveToLocation"),
		PLAY_SFX(Sfx.doorClose),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C303C0
immutable ubyte[22 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptSyochoToNess;
shared static this() {
	actionScriptSyochoToNess = initializeScript!actionScriptSyochoToNess(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 18),
		START_TASK("unknownC3AFA3"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 19),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C303E5
immutable ubyte[92 + 11 * (const(void)*).sizeof + 11 * ScriptPointer.sizeof] actionScript240;
shared static this() {
	actionScript240 = initializeScript!actionScript240(
		SHORTCALL("unknownC3AA38"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 7009),
		SET_VAR(ActionScriptVars.v1, 9800),
		SET_VAR(ActionScriptVars.v2, 56),
		SET_VAR(ActionScriptVars.v3, 24),
	LABEL("UNKNOWN1"),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		PAUSE(4),
		JUMP_IF_FALSE("actionScript240.UNKNOWN1"),
	LABEL("UNKNOWN2"),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(9798),
		TEST_ENTITY_BELOW_Y_COORD(),
		JUMP_IF_TRUE("actionScript240.UNKNOWN3"),
		SET_Y_VELOCITY(128),
	LABEL("UNKNOWN3"),
		GET_POSITION_OF_PARTY_MEMBER(255),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v6),
		ADD_TEMPVAR(4),
		TEST_ENTITY_RIGHT_OF_X_COORD(),
		JUMP_IF_FALSE("actionScript240.UNKNOWN4"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		SET_X_VELOCITY(-128),
		WRITE_WORD_TEMPVAR(6968),
		TEST_ENTITY_RIGHT_OF_X_COORD(),
		JUMP_IF_TRUE("actionScript240.UNKNOWN5"),
		SET_X_VELOCITY(0),
		SHORTJUMP("actionScript240.UNKNOWN6"),
	LABEL("UNKNOWN4"),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v6),
		ADD_TEMPVAR(-4),
		TEST_ENTITY_RIGHT_OF_X_COORD(),
		JUMP_IF_TRUE("actionScript240.UNKNOWN6"),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		SET_X_VELOCITY(128),
		WRITE_WORD_TEMPVAR(7048),
		TEST_ENTITY_RIGHT_OF_X_COORD(),
		JUMP_IF_FALSE("actionScript240.UNKNOWN5"),
		SET_X_VELOCITY(0),
		SHORTJUMP("actionScript240.UNKNOWN6"),
	LABEL("UNKNOWN5"),
		PAUSE(1),
		SHORTJUMP("actionScript240.UNKNOWN2"),
	LABEL("UNKNOWN6"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		PAUSE(1),
		SHORTJUMP("actionScript240.UNKNOWN0"),
	);
}
/// $C30478
immutable ubyte[91 + 9 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptGrfdPolaAddParty;
shared static this() {
	actionScriptGrfdPolaAddParty = initializeScript!actionScriptGrfdPolaAddParty(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 0),
		PAUSE(4),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(4),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 0),
		PAUSE(4),
		SET_VAR(ActionScriptVars.v4, 18),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7000),
		SET_VAR(ActionScriptVars.v7, 9792),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7040),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		YIELD_TO_TEXT(),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 0),
		PAUSE(4),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(4),
		SET_VAR(ActionScriptVars.v4, 18),
		SET_VAR(ActionScriptVars.v6, 6996),
		SET_VAR(ActionScriptVars.v7, 9800),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 9816),
		SHORTCALL("actionScriptMoveToLocation"),
		GET_POSITION_OF_PARTY_MEMBER(254),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/** ActionScript 242 - The NPC guarding the Topolla Theater's backstage moving out of your way
 * Original_Address: $(DOLLAR)C304FA
 */
immutable ubyte[17 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptTopolloHallA;
shared static this() {
	actionScriptTopolloHallA = initializeScript!actionScriptTopolloHallA(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(128),
		GET_UR_DL_DIRECTION(),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(44),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		END_LAST_TASK(),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
alias actionScriptMuseumKomorita = actionScriptTopolloHallA;
/// $C30520
immutable ubyte[14 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptFrsdFieldO;
shared static this() {
	actionScriptFrsdFieldO = initializeScript!actionScriptFrsdFieldO(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(32),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		END_LAST_TASK(),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C3053A
immutable ubyte[13 + 1 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptFrsdFieldL;
shared static this() {
	actionScriptFrsdFieldL = initializeScript!actionScriptFrsdFieldL(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(32),
		SET_VELOCITIES_ZERO(),
		END_LAST_TASK(),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C30550
immutable ubyte[19 + 1 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptFrsdFieldM;
shared static this() {
	actionScriptFrsdFieldM = initializeScript!actionScriptFrsdFieldM(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(32),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(32),
		SET_VELOCITIES_ZERO(),
		END_LAST_TASK(),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C3056E
immutable ubyte[18 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptFrsdFieldP;
shared static this() {
	actionScriptFrsdFieldP = initializeScript!actionScriptFrsdFieldP(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		WRITE_WORD_TEMPVAR(Direction.right),
		MOVE_IN_DIRECTION(),
		PAUSE(32),
		SET_VELOCITIES_ZERO(),
		END_LAST_TASK(),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
alias actionScriptFrsdFieldQ = actionScriptFrsdFieldP;
/// $C30590
immutable ubyte[61 + 6 * (const(void)*).sizeof + 8 * ScriptPointer.sizeof] actionScriptTonchiki;
shared static this() {
	actionScriptTonchiki = initializeScript!actionScriptTonchiki(
		SHORTCALL("unknownC3AA38"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_FALSE("actionScriptTonchiki.UNKNOWN1"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 2640),
		SET_VAR(ActionScriptVars.v7, 3928),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2592),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2584),
		SET_VAR(ActionScriptVars.v7, 3912),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2608),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(32),
		SET_VAR(ActionScriptVars.v6, 2544),
		SET_VAR(ActionScriptVars.v7, 3880),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C305EF
immutable ubyte[85 + 9 * (const(void)*).sizeof + 1 * string.sizeof + 7 * ScriptPointer.sizeof] actionScript250;
shared static this() {
	actionScript250 = initializeScript!actionScript250(
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SHORTCALL("unknownC3AAAA"),
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v4, 0),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 64),
		SET_VAR(ActionScriptVars.v3, 160),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		PLAY_SFX(Sfx.unknown61),
		PAUSE(5),
		SET_ANIMATION(0),
		SET_VAR(ActionScriptVars.v4, 5),
		SET_X(6928),
		SET_Y(744),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 6944),
		SET_VAR(ActionScriptVars.v7, 744),
		SHORTCALL("actionScriptMoveToLocation"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_LIBRARY_TOILET"),
		START_TASK("unknownC3AFA3"),
		SET_VAR(ActionScriptVars.v6, 7104),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7152),
		SET_VAR(ActionScriptVars.v7, 696),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		END_LAST_TASK(),
		PLAY_SFX(Sfx.doorOpen),
		PAUSE(10),
		PLAY_SFX(Sfx.doorClose),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.libraryToilet),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30671
immutable ubyte[24 + 6 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTacyNearBMonkey;
shared static this() {
	actionScriptTacyNearBMonkey = initializeScript!actionScriptTacyNearBMonkey(
		MOVE_TO_PARTY_MEMBER(PartyMember.bubbleMonkey),
		SHORTCALL("unknownC3AB26"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 20),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3069F
immutable ubyte[16 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptBMonkeyGum;
shared static this() {
	actionScriptBMonkeyGum = initializeScript!actionScriptBMonkeyGum(
		SET_X_RELATIVE(-7),
		SHORTCALL("unknownC3AA38"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(30),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C306BA
immutable ubyte[18 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptBMonkeyGum1;
shared static this() {
	actionScriptBMonkeyGum1 = initializeScript!actionScriptBMonkeyGum1(
		MOVE_TO_PARTY_MEMBER(PartyMember.bubbleMonkey),
		SET_X_RELATIVE(-7),
		SHORTCALL("unknownC3AA38"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(30),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C306DA
immutable ubyte[29 + 5 * (const(void)*).sizeof] actionScriptBMonkeyFly;
shared static this() {
	actionScriptBMonkeyFly = initializeScript!actionScriptBMonkeyFly(
		SET_X_RELATIVE(7),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3DIgnoreSurface),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_Z(8),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_Z_VELOCITY(128),
		PAUSE(64),
		SET_VELOCITIES_ZERO(),
		PAUSE(24),
		SET_Z_VELOCITY(-128),
		PAUSE(64),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C30704
immutable ubyte[10 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptBMonkeyFlyS;
shared static this() {
	actionScriptBMonkeyFlyS = initializeScript!actionScriptBMonkeyFlyS(
		SET_X_RELATIVE(7),
		SHORTCALL("unknownC3AA38"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C30716
immutable ubyte[59 + 9 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript256;
shared static this() {
	actionScript256 = initializeScript!actionScript256(
		GET_EVENT_FLAG(EventFlag.unknown0144),
		JUMP_IF_TRUE("actionScriptMapObjStill"),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		START_TASK("actionScriptMapObjStillEntry2"),
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v0, 5096),
		SET_VAR(ActionScriptVars.v1, 10016),
		SET_VAR(ActionScriptVars.v2, 8),
		SET_VAR(ActionScriptVars.v3, 40),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_YUNBO_APPEAR"),
		PAUSE(1),
		CLEAR_CURRENT_ENTITY_COLLISION2(),
		SET_X(4928),
		SET_Y(10000),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5008),
		SET_VAR(ActionScriptVars.v7, 10000),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C30776
immutable ubyte[20 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptYunboBack;
shared static this() {
	actionScriptYunboBack = initializeScript!actionScriptYunboBack(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 4864),
		SET_VAR(ActionScriptVars.v7, 10000),
		SHORTCALL("actionScriptMoveToLocationBackwards"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30796
immutable ubyte[9 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript258;
shared static this() {
	actionScript258 = initializeScript!actionScript258(
		GET_EVENT_FLAG(EventFlag.unknown0144),
		JUMP_IF_TRUE("actionScriptMapObjStill"),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(255),
		SHORTJUMP("actionScriptMapObjStillEntry2"),
	);
}
/// $C307AB
immutable ubyte[82 + 13 * (const(void)*).sizeof + 7 * ScriptPointer.sizeof] actionScriptSigeYunboMove;
shared static this() {
	actionScriptSigeYunboMove = initializeScript!actionScriptSigeYunboMove(
		MOVE_TO_SPRITE(OverworldSprite.bigDirtScooper),
		SET_X_RELATIVE(-8),
		SET_Y_RELATIVE(-8),
		CLEAR_CURRENT_ENTITY_COLLISION2(),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 12),
		START_TASK("unknownC3AFA3"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_NPC_DESTINATION(NPCID.unknown0795),
		ADD(ActionScriptVars.v6, -8),
		ADD(ActionScriptVars.v7, 8),
		SHORTCALL("actionScriptMoveToLocation"),
		GET_POSITION_OF_PARTY_MEMBER(255),
		ADD(ActionScriptVars.v6, 17),
		SHORTCALL("actionScriptMoveToLocation"),
		GET_DIRECTION_FROM_PLAYER_TO_ENTITY(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(1),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_NPC_DESTINATION(NPCID.unknown0795),
		ADD(ActionScriptVars.v6, -8),
		ADD(ActionScriptVars.v7, 8),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		ADD(ActionScriptVars.v7, -16),
		SHORTCALL("actionScriptMoveToLocation"),
		PLAY_SFX(Sfx.menuOpenClose),
		END_LAST_TASK(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30832
immutable ubyte[33 + 5 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript260;
shared static this() {
	actionScript260 = initializeScript!actionScript260(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		START_TASK("actionScriptMapObjStillEntry2"),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS_OFFSET(0, 64),
		SET_VAR(ActionScriptVars.v2, 32),
		SET_VAR(ActionScriptVars.v3, 32),
	LABEL("UNKNOWN1"),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.bMonkeyRope),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		WRITE_WORD_TEMPVAR(0),
		SET_EVENT_FLAG(EventFlag.bMonkeyRope),
		SHORTJUMP("actionScript260.UNKNOWN1"),
	);
}
/// $C30869
immutable ubyte[61 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptBMonkeyRope;
shared static this() {
	actionScriptBMonkeyRope = initializeScript!actionScriptBMonkeyRope(
		SET_X_RELATIVE(7),
		SHORTCALL("unknownC3AB26"),
		PLAY_SFX(Sfx.unknown0E),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_Z_VELOCITY(128),
		PAUSE(160),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5032),
		SET_VAR(ActionScriptVars.v7, 392),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_X(5032),
		SET_Y(336),
		SET_Z_RELATIVE(-56),
		SET_VAR(ActionScriptVars.v6, 5032),
		SET_VAR(ActionScriptVars.v7, 320),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_Z_VELOCITY(-128),
		PAUSE(48),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C308BB
immutable ubyte[33 + 1 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptBMonkeyRopeS;
shared static this() {
	actionScriptBMonkeyRopeS = initializeScript!actionScriptBMonkeyRopeS(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5032),
		SET_VAR(ActionScriptVars.v7, 392),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_X(5032),
		SET_Y(336),
		SET_VAR(ActionScriptVars.v6, 5032),
		SET_VAR(ActionScriptVars.v7, 320),
		SHORTCALL("actionScriptMoveToLocation"),
		HALT(),
	);
}
/// $C308E5
immutable ubyte[84 + 9 * (const(void)*).sizeof + 7 * ScriptPointer.sizeof] actionScriptBMonkeyRopeOrosu;
shared static this() {
	actionScriptBMonkeyRopeOrosu = initializeScript!actionScriptBMonkeyRopeOrosu(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(0),
		SET_VAR(ActionScriptVars.v4, 1),
		LOOP(2),
			WRITE_WORD_TEMPVAR(Direction.down),
			SHORTCALL("actionScriptMoveInDirection"),
			PAUSE(17),
			WRITE_WORD_TEMPVAR(Direction.left),
			SHORTCALL("actionScriptMoveInDirection"),
			PAUSE(19),
			WRITE_WORD_TEMPVAR(Direction.down),
			SHORTCALL("actionScriptMoveInDirection"),
			PAUSE(17),
			WRITE_WORD_TEMPVAR(Direction.right),
			SHORTCALL("actionScriptMoveInDirection"),
			PAUSE(19),
		LOOP_END(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.winsRopeSwitch),
		PLAY_SFX(Sfx.falling),
		RELOAD_MAP_BLOCK_EVENT_CHANGES(),
		WRITE_WORD_TEMPVAR(41),
		LOOP(10),
			RERENDER_ROW(),
			ADD_TEMPVAR(1),
			PAUSE(4),
		LOOP_END(),
		RELOAD_MAP(),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(16),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C30962
immutable ubyte[13 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptBMonkeyRopeDown;
shared static this() {
	actionScriptBMonkeyRopeDown = initializeScript!actionScriptBMonkeyRopeDown(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(112),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C30979
immutable ubyte[13 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptBMonkeyRopeGood;
shared static this() {
	actionScriptBMonkeyRopeGood = initializeScript!actionScriptBMonkeyRopeGood(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		GET_POSITION_OF_PARTY_MEMBER(9),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C30993
immutable ubyte[19 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptDashTony;
shared static this() {
	actionScriptDashTony = initializeScript!actionScriptDashTony(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 496),
		SET_VAR(ActionScriptVars.v7, 2280),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C309B0
immutable ubyte[80 + 7 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptJumpJef;
shared static this() {
	actionScriptJumpJef = initializeScript!actionScriptJumpJef(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AB26"),
		SET_MOVEMENT_SPEED(256),
		START_TASK("unknownC30A1F"),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 496),
		SET_VAR(ActionScriptVars.v7, 2280),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		MOVE_TOWARDS_DESTINATION(),
		JUMP_IF_FALSE("actionScriptJumpJef.UNKNOWN1"),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
		PAUSE(20),
		YIELD_TO_TEXT(),
		PAUSE(1),
		PLAY_SFX(Sfx.falling),
		SET_Y_VELOCITY(256),
		SET_X_VELOCITY(-64),
		SET_Z_VELOCITY(768),
		PAUSE(4),
		SET_Z_VELOCITY(512),
		PAUSE(4),
		SET_Z_VELOCITY(256),
		PAUSE(4),
		SET_Z_VELOCITY(0),
		PAUSE(4),
		SET_Z_VELOCITY(-256),
		PAUSE(10),
		SET_Z_VELOCITY(-512),
		PAUSE(12),
		PLAY_SFX(Sfx.tookDamage),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30A1F
immutable ubyte[19] unknownC30A1F;
shared static this() {
	unknownC30A1F = initializeScript!unknownC30A1F(
		SET_Z_VELOCITY(512),
		PAUSE(8),
		SET_Z_VELOCITY(0),
		PAUSE(4),
		SET_Z_VELOCITY(-256),
		PAUSE(6),
		SET_Z_VELOCITY(0),
		END_TASK(),
	);
}
/// $C30A32
immutable ubyte[51 + 5 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptJumpJefS;
shared static this() {
	actionScriptJumpJefS = initializeScript!actionScriptJumpJefS(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 496),
		SET_VAR(ActionScriptVars.v7, 2280),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(20),
		PAUSE(1),
		SET_ANIMATION(0),
		SET_Y_VELOCITY(256),
		SET_X_VELOCITY(-64),
		PAUSE(4),
		PAUSE(4),
		PAUSE(4),
		PAUSE(4),
		PAUSE(10),
		PAUSE(12),
		SET_VELOCITIES_ZERO(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30A76
immutable ubyte[18 + 1 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptOutTony;
shared static this() {
	actionScriptOutTony = initializeScript!actionScriptOutTony(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 496),
		SET_VAR(ActionScriptVars.v7, 2184),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30A91
immutable ubyte[32 + 6 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptJefIntoSwThrk;
shared static this() {
	actionScriptJefIntoSwThrk = initializeScript!actionScriptJefIntoSwThrk(
		MOVE_TO_PARTY_MEMBER(PartyMember.jeff),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_NPC_DESTINATION(NPCID.unknown0482),
		ADD(ActionScriptVars.v7, 8),
		SHORTCALL("actionScriptMoveToLocation"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v5, 1),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30ACB
immutable ubyte[24 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptIntoSwThrk;
shared static this() {
	actionScriptIntoSwThrk = initializeScript!actionScriptIntoSwThrk(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_NPC_DESTINATION(NPCID.unknown0482),
		ADD(ActionScriptVars.v7, 8),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_NPC_DESTINATION(NPCID.unknown0482),
		SHORTCALL("unknownC3B70C"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30AF8
immutable ubyte[78 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptSwToSums1;
shared static this() {
	actionScriptSwToSums1 = initializeScript!actionScriptSwToSums1(
		SHORTCALL("unknownC3AA38"),
		LOOP(14),
			SET_X_RELATIVE(2),
			PAUSE(3),
			SET_X_RELATIVE(-2),
			PAUSE(3),
			SET_Y_RELATIVE(-2),
			PAUSE(3),
			SET_Y_RELATIVE(2),
			PAUSE(3),
		LOOP_END(),
		YIELD_TO_TEXT(),
		PAUSE(1),
		LOOP(10),
			SET_X_RELATIVE(2),
			PAUSE(4),
			SET_X_RELATIVE(-2),
			PAUSE(4),
			SET_X_RELATIVE(-2),
			PAUSE(4),
			SET_X_RELATIVE(2),
			PAUSE(4),
			SET_Y_RELATIVE(-2),
			PAUSE(4),
			SET_Y_RELATIVE(2),
			PAUSE(4),
			SET_Y_RELATIVE(2),
			PAUSE(4),
			SET_Y_RELATIVE(-2),
			PAUSE(4),
		LOOP_END(),
		YIELD_TO_TEXT(),
		SET_Y_VELOCITY(-512),
		PAUSE(80),
		SET_VELOCITIES_ZERO(),
		HALT(),
	);
}
/// $C30B4E
immutable ubyte[108 + 8 * (const(void)*).sizeof + 1 * string.sizeof + 10 * ScriptPointer.sizeof] actionScript273;
shared static this() {
	actionScript273 = initializeScript!actionScript273(
		SHORTCALL("unknownC3AAAA"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_VAR(ActionScriptVars.v0, 5824),
		SET_VAR(ActionScriptVars.v1, 1232),
		SET_VAR(ActionScriptVars.v2, 16),
		SET_VAR(ActionScriptVars.v3, 16),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_KOYA_POKEY_BATTLE"),
		PAUSE(1),
		START_TASK("unknownC3AFA3"),
		SET_VAR(ActionScriptVars.v4, 14),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 17),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v4, 7),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5824),
		SET_VAR(ActionScriptVars.v7, 1288),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v4, 5),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v6, 5920),
		SET_VAR(ActionScriptVars.v7, 1288),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5976),
		SET_VAR(ActionScriptVars.v7, 1216),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 1128),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5952),
		SET_VAR(ActionScriptVars.v7, 1096),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30BEA
immutable ubyte[18 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptKoya;
shared static this() {
	actionScriptKoya = initializeScript!actionScriptKoya(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 7),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 18),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C30C09
immutable ubyte[13 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptCarpDungL;
shared static this() {
	actionScriptCarpDungL = initializeScript!actionScriptCarpDungL(
		SHORTCALL("unknownC3AAB8"),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(32),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C30C20
immutable ubyte[13 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptCarpDungR;
shared static this() {
	actionScriptCarpDungR = initializeScript!actionScriptCarpDungR(
		SHORTCALL("unknownC3AAB8"),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(32),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C30C37
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScriptCircleCultistNorthwest;
shared static this() {
	actionScriptCircleCultistNorthwest = initializeScript!actionScriptCircleCultistNorthwest(
		SHORTCALL("unknownC30C55"),
		SHORTJUMP("unknownC30C67"),
	);
}
/// $C30C3D
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScriptCircleCultistNortheast;
shared static this() {
	actionScriptCircleCultistNortheast = initializeScript!actionScriptCircleCultistNortheast(
		SHORTCALL("unknownC30C55"),
		SHORTJUMP("unknownC30C7F"),
	);
}
/// $C30C43
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScriptCircleCultistEast;
shared static this() {
	actionScriptCircleCultistEast = initializeScript!actionScriptCircleCultistEast(
		SHORTCALL("unknownC30C55"),
		SHORTJUMP("unknownC30C97"),
	);
}
/// $C30C49
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScriptCircleCultistSouth;
shared static this() {
	actionScriptCircleCultistSouth = initializeScript!actionScriptCircleCultistSouth(
		SHORTCALL("unknownC30C55"),
		SHORTJUMP("unknownC30CAF"),
	);
}
/// $C30C4F
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScriptCircleCultistWest;
shared static this() {
	actionScriptCircleCultistWest = initializeScript!actionScriptCircleCultistWest(
		SHORTCALL("unknownC30C55"),
		SHORTJUMP("unknownC30CC7"),
	);
}
/// $C30C55
immutable ubyte[10 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC30C55;
shared static this() {
	unknownC30C55 = initializeScript!unknownC30C55(
		SHORTCALL("unknownC3AA2B"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORT_RETURN(),
	);
}
/// $C30C67
immutable ubyte[21 + 3 * ScriptPointer.sizeof] unknownC30C67;
shared static this() {
	unknownC30C67 = initializeScript!unknownC30C67(
		PAUSE(60),
		SET_VAR(ActionScriptVars.v6, 7696),
		SET_VAR(ActionScriptVars.v7, 2280),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7736),
		SET_VAR(ActionScriptVars.v7, 2288),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("unknownC30C7F"),
	);
}
/// $C30C7F
immutable ubyte[21 + 3 * ScriptPointer.sizeof] unknownC30C7F;
shared static this() {
	unknownC30C7F = initializeScript!unknownC30C7F(
		PAUSE(60),
		SET_VAR(ActionScriptVars.v6, 7760),
		SET_VAR(ActionScriptVars.v7, 2320),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7776),
		SET_VAR(ActionScriptVars.v7, 2360),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("unknownC30C97"),
	);
}
/// $C30C97
immutable ubyte[21 + 3 * ScriptPointer.sizeof] unknownC30C97;
shared static this() {
	unknownC30C97 = initializeScript!unknownC30C97(
		PAUSE(60),
		SET_VAR(ActionScriptVars.v6, 7752),
		SET_VAR(ActionScriptVars.v7, 2392),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7712),
		SET_VAR(ActionScriptVars.v7, 2416),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("unknownC30CAF"),
	);
}
/// $C30CAF
immutable ubyte[21 + 3 * ScriptPointer.sizeof] unknownC30CAF;
shared static this() {
	unknownC30CAF = initializeScript!unknownC30CAF(
		PAUSE(60),
		SET_VAR(ActionScriptVars.v6, 7648),
		SET_VAR(ActionScriptVars.v7, 2408),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7616),
		SET_VAR(ActionScriptVars.v7, 2352),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("unknownC30CC7"),
	);
}
/// $C30CC7
immutable ubyte[21 + 3 * ScriptPointer.sizeof] unknownC30CC7;
shared static this() {
	unknownC30CC7 = initializeScript!unknownC30CC7(
		PAUSE(60),
		SET_VAR(ActionScriptVars.v6, 7632),
		SET_VAR(ActionScriptVars.v7, 2312),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7656),
		SET_VAR(ActionScriptVars.v7, 2288),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("unknownC30C67"),
	);
}
/// $C30CE2
immutable ubyte[39 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript284;
shared static this() {
	actionScript284 = initializeScript!actionScript284(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 12),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v0, 432),
		SET_VAR(ActionScriptVars.v1, 4264),
		SET_VAR(ActionScriptVars.v2, 16),
		SET_VAR(ActionScriptVars.v3, 24),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_52_BMONKEY_BYE"),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v4, 11),
		SET_MOVEMENT_SPEED(288),
		SET_VAR(ActionScriptVars.v5, 2),
		SHORTCALL("actionScriptBMonkeyByeUnknownRoutine"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30D1E
immutable ubyte[16 + 2 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptBMonkeyBye;
shared static this() {
	actionScriptBMonkeyBye = initializeScript!actionScriptBMonkeyBye(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 11),
		START_TASK("unknownC3AFA3"),
		SET_MOVEMENT_SPEED(288),
		SET_VAR(ActionScriptVars.v5, 2),
		SHORTCALL("actionScriptBMonkeyByeUnknownRoutine"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30D3C
immutable ubyte[100 + 11 * ScriptPointer.sizeof] actionScriptBMonkeyByeUnknownRoutine;
shared static this() {
	actionScriptBMonkeyByeUnknownRoutine = initializeScript!actionScriptBMonkeyByeUnknownRoutine(
		SET_VAR(ActionScriptVars.v6, 432),
		SET_VAR(ActionScriptVars.v7, 4336),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 488),
		SET_VAR(ActionScriptVars.v7, 4392),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 488),
		SET_VAR(ActionScriptVars.v7, 4448),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 544),
		SET_VAR(ActionScriptVars.v7, 4448),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 544),
		SET_VAR(ActionScriptVars.v7, 4360),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 560),
		SET_VAR(ActionScriptVars.v7, 4344),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 560),
		SET_VAR(ActionScriptVars.v7, 4328),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 520),
		SET_VAR(ActionScriptVars.v7, 4280),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 504),
		SET_VAR(ActionScriptVars.v7, 4224),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 464),
		SET_VAR(ActionScriptVars.v7, 4184),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 240),
		SET_VAR(ActionScriptVars.v7, 4184),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORT_RETURN(),
	);
}
/// $C30DB6
immutable ubyte[11 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript286;
shared static this() {
	actionScript286 = initializeScript!actionScript286(
		GET_EVENT_FLAG(EventFlag.winGiegu),
		JUMP_IF_FALSE("actionScriptMapObjStill"),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(255),
		PAUSE(10),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30DCD
immutable ubyte[54 + 7 * (const(void)*).sizeof + 1 * string.sizeof + 3 * ScriptPointer.sizeof] actionScriptDoseSpaceTunnel;
shared static this() {
	actionScriptDoseSpaceTunnel = initializeScript!actionScriptDoseSpaceTunnel(
		GET_EVENT_FLAG(EventFlag.xyzOk),
		JUMP_IF_TRUE("actionScript335"),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		START_TASK("actionScriptMapObjStillEntry2"),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS_OFFSET(0, 8),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 8),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_SPACETUNNEL_KUROKOGE"),
		PAUSE(1),
		LOOP(10),
			SET_X_RELATIVE(2),
			PAUSE(4),
			SET_X_RELATIVE(-2),
			PAUSE(4),
			SET_X_RELATIVE(-2),
			PAUSE(4),
			SET_X_RELATIVE(2),
			PAUSE(4),
		LOOP_END(),
		YIELD_TO_TEXT(),
		SET_VELOCITIES_ZERO(),
		HALT(),
	);
}
/// $C30E21
immutable ubyte[25 + 6 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptIntoStKurokoge;
shared static this() {
	actionScriptIntoStKurokoge = initializeScript!actionScriptIntoStKurokoge(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_NPC_DESTINATION(NPCID.unknown0741),
		ADD(ActionScriptVars.v7, 8),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_NPC_DESTINATION(NPCID.unknown0741),
		SHORTCALL("unknownC3B70C"),
		YIELD_TO_TEXT(),
		MOVE_PARTY_TO_LEADER_POSITION(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30E52
immutable ubyte[25 + 6 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptOutStKurokoge;
shared static this() {
	actionScriptOutStKurokoge = initializeScript!actionScriptOutStKurokoge(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_VAR(ActionScriptVars.v6, 384),
		SET_VAR(ActionScriptVars.v7, 7624),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_MOVEMENT_SPEED(128),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30E7F
immutable ubyte[13 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptAndDose;
shared static this() {
	actionScriptAndDose = initializeScript!actionScriptAndDose(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(176),
		SET_VAR(ActionScriptVars.v5, 17),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C30E99
immutable ubyte[16 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptIntoShip;
shared static this() {
	actionScriptIntoShip = initializeScript!actionScriptIntoShip(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(150),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30EB9
immutable ubyte[63 + 12 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptToSailor;
shared static this() {
	actionScriptToSailor = initializeScript!actionScriptToSailor(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7264),
		SET_VAR(ActionScriptVars.v7, 2928),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(115),
		SET_NPC_DESTINATION(NPCID.unknown1088),
		ADD(ActionScriptVars.v7, -1),
		SHORTCALL("actionScriptMoveToLocation"),
		GET_PARTY_COUNT(),
		LOOP_TEMPVAR(),
			LOOP(12),
				SET_X_VELOCITY(1),
				PAUSE(1),
				SET_X_VELOCITY(-1),
				PAUSE(1),
			LOOP_END(),
		LOOP_END(),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		MOVE_PARTY_TO_LEADER_POSITION(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C30F20
immutable ubyte[93 + 4 * (const(void)*).sizeof + 10 * ScriptPointer.sizeof] actionScriptShipToSkrb1;
shared static this() {
	actionScriptShipToSkrb1 = initializeScript!actionScriptShipToSkrb1(
		SHORTCALL("unknownC3AA38"),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7216),
		SET_VAR(ActionScriptVars.v7, 2984),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7224),
		SET_VAR(ActionScriptVars.v7, 3024),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7216),
		SET_VAR(ActionScriptVars.v7, 3064),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7208),
		SET_VAR(ActionScriptVars.v7, 3104),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7216),
		SET_VAR(ActionScriptVars.v7, 3144),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7224),
		SET_VAR(ActionScriptVars.v7, 3184),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7216),
		SET_VAR(ActionScriptVars.v7, 3224),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7208),
		SET_VAR(ActionScriptVars.v7, 3264),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7216),
		SET_VAR(ActionScriptVars.v7, 3304),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C30F9C
immutable ubyte[130 + 10 * (const(void)*).sizeof + 14 * ScriptPointer.sizeof] actionScriptShipSmall;
shared static this() {
	actionScriptShipSmall = initializeScript!actionScriptShipSmall(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AA38"),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(160),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 96),
		SET_VAR(ActionScriptVars.v7, 8504),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 128),
		SET_VAR(ActionScriptVars.v7, 8712),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 112),
		SET_VAR(ActionScriptVars.v7, 8832),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v6, 184),
		SET_VAR(ActionScriptVars.v7, 9024),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 120),
		SET_VAR(ActionScriptVars.v7, 9336),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 160),
		SET_VAR(ActionScriptVars.v7, 9552),
		SHORTCALL("actionScriptMoveToLocation"),
		GET_EVENT_FLAG(EventFlag.tlptSkrb),
		JUMP_IF_TRUE("actionScriptShipSmall.UNKNOWN1"),
		START_TASK("actionScriptShipSmallTask"),
	LABEL("UNKNOWN1"),
		SET_VAR(ActionScriptVars.v6, 168),
		SET_VAR(ActionScriptVars.v7, 9648),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 208),
		SET_VAR(ActionScriptVars.v7, 9728),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v6, 152),
		SET_VAR(ActionScriptVars.v7, 9832),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 128),
		SET_VAR(ActionScriptVars.v7, 10000),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 152),
		SET_VAR(ActionScriptVars.v7, 10168),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_WRAM(&currentTeleportDestinationX, 189),
		WRITE_WORD_WRAM(&currentTeleportDestinationY, 483),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C31055
immutable ubyte[16 + 1 * (const(void)*).sizeof] actionScriptShipSmallTask;
shared static this() {
	actionScriptShipSmallTask = initializeScript!actionScriptShipSmallTask(
		SET_VAR(ActionScriptVars.v0, 0),
		LOOP(12),
			ADD(ActionScriptVars.v0, -1),
			DO_PALETTES_FADE_STEP(),
			PAUSE(8),
		LOOP_END(),
		END_TASK(),
	);
}
/// $C31068
immutable ubyte[44 + 7 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptEvtKrakenApproach;
shared static this() {
	actionScriptEvtKrakenApproach = initializeScript!actionScriptEvtKrakenApproach(
		SET_X(360),
		SET_Y(9936),
		SHORTCALL("unknownC3AAAA"),
		SET_ANIMATION(0),
		SET_VAR(ActionScriptVars.v4, 9),
		GET_EVENT_FLAG(EventFlag.tlptSkrb),
		JUMP_IF_FALSE("actionScriptEvtKrakenApproach.UNKNOWN0"),
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v4, 0),
	LABEL("UNKNOWN0"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 16),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		GET_POSITION_OF_PARTY_MEMBER(255),
		MOVE_TOWARDS_DESTINATION(),
		JUMP_IF_FALSE("actionScriptEvtKrakenApproach.UNKNOWN1"),
		END_LAST_TASK(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C310B1
immutable ubyte[73 + 5 * (const(void)*).sizeof + 7 * ScriptPointer.sizeof] actionScriptShipToSkrb2;
shared static this() {
	actionScriptShipToSkrb2 = initializeScript!actionScriptShipToSkrb2(
		SET_X(1560),
		SET_Y(3672),
		SHORTCALL("unknownC3AA38"),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 1560),
		SET_VAR(ActionScriptVars.v7, 3672),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1544),
		SET_VAR(ActionScriptVars.v7, 3720),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1528),
		SET_VAR(ActionScriptVars.v7, 3768),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1544),
		SET_VAR(ActionScriptVars.v7, 3816),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1560),
		SET_VAR(ActionScriptVars.v7, 3864),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1544),
		SET_VAR(ActionScriptVars.v7, 3912),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG12D),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C31115
immutable ubyte[20 + 7 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptOutShip;
shared static this() {
	actionScriptOutShip = initializeScript!actionScriptOutShip(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		MOVE_PARTY_TO_LEADER_POSITION(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(192),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(112),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C31140
immutable ubyte[39 + 8 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptSubmarine1;
shared static this() {
	actionScriptSubmarine1 = initializeScript!actionScriptSubmarine1(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AA38"),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 1248),
		SET_VAR(ActionScriptVars.v7, 5712),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 856),
		SET_VAR(ActionScriptVars.v7, 6104),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_WRAM(&currentTeleportDestinationX, 695),
		WRITE_WORD_WRAM(&currentTeleportDestinationY, 886),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C31182
immutable ubyte[32 + 5 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSubmarine2;
shared static this() {
	actionScriptSubmarine2 = initializeScript!actionScriptSubmarine2(
		SET_X(5856),
		SET_Y(6792),
		SHORTCALL("unknownC3AA38"),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5560),
		SET_VAR(ActionScriptVars.v7, 7088),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C311B4
immutable ubyte[20 + 7 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptOutSubmarine;
shared static this() {
	actionScriptOutSubmarine = initializeScript!actionScriptOutSubmarine(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		MOVE_PARTY_TO_LEADER_POSITION(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(192),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(112),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C311DF
immutable ubyte[41 + 5 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptGuardA1;
shared static this() {
	actionScriptGuardA1 = initializeScript!actionScriptGuardA1(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(20),
		SET_VAR(ActionScriptVars.v5, 15),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_FALSE("actionScriptGuardA1.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5704),
		SET_VAR(ActionScriptVars.v7, 5640),
		SHORTCALL("actionScriptMoveToLocation"),
		PLAY_SFX(Sfx.doorOpen),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C31221
immutable ubyte[51 + 6 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptGuardA2;
shared static this() {
	actionScriptGuardA2 = initializeScript!actionScriptGuardA2(
		PLAY_SFX(Sfx.doorClose),
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5616),
		SET_VAR(ActionScriptVars.v7, 4968),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5624),
		SET_VAR(ActionScriptVars.v7, 4976),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5688),
		SET_VAR(ActionScriptVars.v7, 4976),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(25),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(35),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3126E
immutable ubyte[33 + 6 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptGuardB1;
shared static this() {
	actionScriptGuardB1 = initializeScript!actionScriptGuardB1(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(20),
		SET_VAR(ActionScriptVars.v5, 15),
		GET_POSITION_OF_PARTY_MEMBER(254),
		SHORTCALL("actionScriptMoveToLocation"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp2),
		JUMP_IF_FALSE("actionScriptGuardB1.UNKNOWN0"),
	LABEL("UNKNOWN1"),
		GET_POSITION_OF_PARTY_MEMBER(254),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN2"),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		GET_POSITION_OF_PARTY_MEMBER(254),
		MOVE_TOWARDS_DESTINATION(),
		SHORTJUMP("actionScriptGuardB1.UNKNOWN2"),
	);
}
/// $C312AD
immutable ubyte[11 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptGuardB2;
shared static this() {
	actionScriptGuardB2 = initializeScript!actionScriptGuardB2(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 15),
		SHORTJUMP("actionScriptGuardB1.UNKNOWN1"),
	);
}
/// $C312C2
immutable ubyte[22 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptGuard3;
shared static this() {
	actionScriptGuard3 = initializeScript!actionScriptGuard3(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5648),
		SET_VAR(ActionScriptVars.v7, 4944),
		SHORTCALL("actionScriptMoveToLocation"),
		PLAY_SFX(Sfx.doorClose),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C312E7
immutable ubyte[26 + 8 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptToGuard;
shared static this() {
	actionScriptToGuard = initializeScript!actionScriptToGuard(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 15),
		SET_NPC_DESTINATION(NPCID.unknown0866),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		SET_NPC_DESTINATION(NPCID.unknown0866),
		MOVE_TOWARDS_DESTINATION(),
		SHORTJUMP("actionScriptToGuard.UNKNOWN0"),
	);
}
/// $C3131B
immutable ubyte[19 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptMochi1;
shared static this() {
	actionScriptMochi1 = initializeScript!actionScriptMochi1(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(208),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 3616),
		SET_VAR(ActionScriptVars.v7, 9680),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3133A
immutable ubyte[19 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptMochiYunbo;
shared static this() {
	actionScriptMochiYunbo = initializeScript!actionScriptMochiYunbo(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 3736),
		SET_VAR(ActionScriptVars.v7, 9696),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C31359
immutable ubyte[25 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptMochi2;
shared static this() {
	actionScriptMochi2 = initializeScript!actionScriptMochi2(
		SET_X(3704),
		SET_Y(9632),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(208),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 3672),
		SET_VAR(ActionScriptVars.v7, 9632),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3137E
immutable ubyte[9 + 1 * ScriptPointer.sizeof] actionScriptStSt3;
shared static this() {
	actionScriptStSt3 = initializeScript!actionScriptStSt3(
		SET_X(5976),
		SET_Y(280),
		PAUSE(2),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C31389
immutable ubyte[20 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptDoseiSt3;
shared static this() {
	actionScriptDoseiSt3 = initializeScript!actionScriptDoseiSt3(
		SET_X(5976),
		SET_Y(280),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 17),
		SET_NPC_DESTINATION(NPCID.unknown1268),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		SHORTJUMP("actionScriptPeopleWalk0"),
	);
}
/// $C313A9
immutable ubyte[29 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptAndSt31;
shared static this() {
	actionScriptAndSt31 = initializeScript!actionScriptAndSt31(
		SET_X(5976),
		SET_Y(280),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SET_VAR(ActionScriptVars.v6, 5938),
		ADD(ActionScriptVars.v7, 9),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		END_LAST_TASK(),
		SHORTJUMP("actionScriptPeopleWalk0"),
	);
}
/// $C313D5
immutable ubyte[25 + 1 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptKidSt3;
shared static this() {
	actionScriptKidSt3 = initializeScript!actionScriptKidSt3(
		SET_X(5976),
		SET_Y(280),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5952),
		SET_VAR(ActionScriptVars.v7, 256),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		SHORTJUMP("actionScriptPeopleWalk0"),
	);
}
/// $C313F7
immutable ubyte[28 + 1 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptAndSt32;
shared static this() {
	actionScriptAndSt32 = initializeScript!actionScriptAndSt32(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5896),
		SET_VAR(ActionScriptVars.v7, 176),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5760),
		SET_VAR(ActionScriptVars.v7, 176),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C3141E
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptAndNearSt3;
shared static this() {
	actionScriptAndNearSt3 = initializeScript!actionScriptAndNearSt3(
		SET_X(5968),
		SET_Y(304),
		SHORTJUMP("actionScript740"),
	);
}
/// $C31427
immutable ubyte[20 + 7 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptOutSt3;
shared static this() {
	actionScriptOutSt3 = initializeScript!actionScriptOutSt3(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		MOVE_PARTY_TO_LEADER_POSITION(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(12),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C31452
immutable ubyte[27 + 5 * (const(void)*).sizeof + 1 * string.sizeof + 3 * ScriptPointer.sizeof] actionScriptGeppuPass;
shared static this() {
	actionScriptGeppuPass = initializeScript!actionScriptGeppuPass(
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(255),
		SET_VELOCITIES_ZERO(),
		LOOP(180),
			LOOP(60),
				GET_PRESSED_BUTTONS(),
				AND_TEMPVAR(Pad.left | Pad.right | Pad.down | Pad.up),
				GET_PAD_STATE(),
				AND_TEMPVAR(Pad.left | Pad.right | Pad.down | Pad.up),
				JUMP_IF_FALSE("actionScriptGeppuPass.UNKNOWN0"),
				SHORTJUMP("actionScriptTerminate"),
	LABEL("UNKNOWN0"),
				PAUSE(1),
			LOOP_END(),
		LOOP_END(),
		QUEUE_TEXT_SCRIPT("MSG_GPFT_PASSWORD_LATER"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C31485
immutable ubyte[123 + 7 * (const(void)*).sizeof + 10 * ScriptPointer.sizeof] actionScriptMaboroshiIn;
shared static this() {
	actionScriptMaboroshiIn = initializeScript!actionScriptMaboroshiIn(
		SET_X(1728),
		SET_Y(5312),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(1280),
		SET_VAR(ActionScriptVars.v5, 5),
		SET_VAR(ActionScriptVars.v6, 1784),
		SET_VAR(ActionScriptVars.v7, 5384),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1816),
		SET_VAR(ActionScriptVars.v7, 5416),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1832),
		SET_VAR(ActionScriptVars.v7, 5440),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1832),
		SET_VAR(ActionScriptVars.v7, 5472),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1816),
		SET_VAR(ActionScriptVars.v7, 5504),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1800),
		SET_VAR(ActionScriptVars.v7, 5528),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1776),
		SET_VAR(ActionScriptVars.v7, 5536),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1736),
		SET_VAR(ActionScriptVars.v7, 5544),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v0, -32768),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		SET_MOVEMENT_FROM_ANGLE(),
		GET_DIRECTION_ROTATED_ANGLE_90(),
		LOOP(64),
			PAUSE(1),
			ADD(ActionScriptVars.v0, 4096),
			MOVE_TO_SPRITE(OverworldSprite.starMasterFlyingAway),
			SPIRAL_MOVEMENT_FRAME(),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v6, 1728),
		SET_VAR(ActionScriptVars.v7, 5544),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C31529
immutable ubyte[27 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptPooToOldman;
shared static this() {
	actionScriptPooToOldman = initializeScript!actionScriptPooToOldman(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(160),
		SET_VAR(ActionScriptVars.v5, 17),
		SET_SPRITE_DESTINATION(OverworldSprite.starMasterGuy),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v5, 1),
		ADD(ActionScriptVars.v7, 16),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C31556
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScriptMaboroshiOut1;
shared static this() {
	actionScriptMaboroshiOut1 = initializeScript!actionScriptMaboroshiOut1(
		SHORTCALL("actionScriptMaboroshiOut"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3155C
immutable ubyte[3 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptMaboroshiOut2;
shared static this() {
	actionScriptMaboroshiOut2 = initializeScript!actionScriptMaboroshiOut2(
		SHORTCALL("actionScriptMaboroshiOut"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C315CC
immutable ubyte[33 + 1 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptHoihoiA;
shared static this() {
	actionScriptHoihoiA = initializeScript!actionScriptHoihoiA(
		SET_X(6080),
		SET_Y(8552),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 6056),
		SET_VAR(ActionScriptVars.v7, 8552),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5936),
		SET_VAR(ActionScriptVars.v7, 8688),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C315F8
immutable ubyte[35 + 1 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptHoihoiB;
shared static this() {
	actionScriptHoihoiB = initializeScript!actionScriptHoihoiB(
		SET_X(6008),
		SET_Y(8504),
		SHORTCALL("unknownC3AA38"),
		PAUSE(120),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5984),
		SET_VAR(ActionScriptVars.v7, 8552),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5864),
		SET_VAR(ActionScriptVars.v7, 8680),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C31626
immutable ubyte[27 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptHoihoiC;
shared static this() {
	actionScriptHoihoiC = initializeScript!actionScriptHoihoiC(
		SET_X(5288),
		SET_Y(8656),
		SHORTCALL("unknownC3AAB8"),
	LABEL("UNKNOWN0"),
		LOOP(2),
			WRITE_WORD_TEMPVAR(Direction.left),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(10),
			WRITE_WORD_TEMPVAR(Direction.right),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(10),
		LOOP_END(),
		PAUSE(30),
		SHORTJUMP("actionScriptHoihoiC.UNKNOWN0"),
	);
}
/// $C31651
immutable ubyte[34 + 6 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptHoihoiD;
shared static this() {
	actionScriptHoihoiD = initializeScript!actionScriptHoihoiD(
		SET_X(5240),
		SET_Y(8656),
		SHORTCALL("unknownC3AAB8"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
	LABEL("UNKNOWN0"),
		LOOP(2),
			WRITE_WORD_TEMPVAR(Direction.left),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(10),
			WRITE_WORD_TEMPVAR(Direction.right),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(10),
		LOOP_END(),
		PAUSE(30),
		SHORTJUMP("actionScriptHoihoiD.UNKNOWN0"),
	);
}
/// $C31689
immutable ubyte[29 + 6 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptHoihoiE;
shared static this() {
	actionScriptHoihoiE = initializeScript!actionScriptHoihoiE(
		SET_X(5264),
		SET_Y(8704),
		SHORTCALL("unknownC3AA38"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(60),
	LABEL("UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(10),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		SHORTJUMP("actionScriptHoihoiE.UNKNOWN0"),
	);
}
/// $C316BC
immutable ubyte[25 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptHoihoiF;
shared static this() {
	actionScriptHoihoiF = initializeScript!actionScriptHoihoiF(
		SHORTCALL("unknownC3AA38"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(10),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5072),
		SET_VAR(ActionScriptVars.v7, 8408),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C316E4
immutable ubyte[34 + 3 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptHoihoiG;
shared static this() {
	actionScriptHoihoiG = initializeScript!actionScriptHoihoiG(
		SHORTCALL("unknownC3AA38"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(25),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5104),
		SET_VAR(ActionScriptVars.v7, 8424),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5064),
		SET_VAR(ActionScriptVars.v7, 8424),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C31717
immutable ubyte[33 + 1 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptHoihoiH;
shared static this() {
	actionScriptHoihoiH = initializeScript!actionScriptHoihoiH(
		SET_X(5456),
		SET_Y(9144),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5592),
		SET_VAR(ActionScriptVars.v7, 9144),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5592),
		SET_VAR(ActionScriptVars.v7, 9136),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C31743
immutable ubyte[33 + 1 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptHoihoiI;
shared static this() {
	actionScriptHoihoiI = initializeScript!actionScriptHoihoiI(
		SET_X(5448),
		SET_Y(9152),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5592),
		SET_VAR(ActionScriptVars.v7, 9144),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5592),
		SET_VAR(ActionScriptVars.v7, 9136),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3176F
immutable ubyte[33 + 1 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptHoihoiJ;
shared static this() {
	actionScriptHoihoiJ = initializeScript!actionScriptHoihoiJ(
		SET_X(5728),
		SET_Y(9112),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5600),
		SET_VAR(ActionScriptVars.v7, 9144),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5600),
		SET_VAR(ActionScriptVars.v7, 9136),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3179B
immutable ubyte[33 + 1 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptHoihoiK;
shared static this() {
	actionScriptHoihoiK = initializeScript!actionScriptHoihoiK(
		SET_X(5648),
		SET_Y(9184),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5592),
		SET_VAR(ActionScriptVars.v7, 9144),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5592),
		SET_VAR(ActionScriptVars.v7, 9136),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C317C7
immutable ubyte[42 + 1 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptHoihoiL;
shared static this() {
	actionScriptHoihoiL = initializeScript!actionScriptHoihoiL(
		SET_X(5744),
		SET_Y(8952),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5712),
		SET_VAR(ActionScriptVars.v7, 9000),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5712),
		SET_VAR(ActionScriptVars.v7, 9112),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5608),
		SET_VAR(ActionScriptVars.v7, 9152),
		SHORTCALL("actionScriptMoveToLocation"),
		HALT(),
	);
}
/// $C317FC
immutable ubyte[42 + 1 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptHoihoiM;
shared static this() {
	actionScriptHoihoiM = initializeScript!actionScriptHoihoiM(
		SET_X(5456),
		SET_Y(9008),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5584),
		SET_VAR(ActionScriptVars.v7, 9008),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5640),
		SET_VAR(ActionScriptVars.v7, 9040),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5704),
		SET_VAR(ActionScriptVars.v7, 9064),
		SHORTCALL("actionScriptMoveToLocation"),
		HALT(),
	);
}
/// $C31831
immutable ubyte[29 + 6 * (const(void)*).sizeof + 1 * string.sizeof + 3 * ScriptPointer.sizeof] actionScript335;
shared static this() {
	actionScript335 = initializeScript!actionScript335(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		START_TASK("actionScriptMapObjStillEntry2"),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.spacetunnel2Start),
		JUMP_IF_FALSE("actionScript335.UNKNOWN1"),
		COPY_XY_TO_VARS_OFFSET(0, 8),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 8),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_ST2"),
		HALT(),
	);
}
/// $C31869
immutable ubyte[25 + 6 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptIntoSt2;
shared static this() {
	actionScriptIntoSt2 = initializeScript!actionScriptIntoSt2(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_NPC_DESTINATION(NPCID.unknown0741),
		ADD(ActionScriptVars.v7, 8),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_NPC_DESTINATION(NPCID.unknown0741),
		SHORTCALL("unknownC3B70C"),
		YIELD_TO_TEXT(),
		MOVE_PARTY_TO_LEADER_POSITION(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3189A
immutable ubyte[9 + 1 * ScriptPointer.sizeof] actionScriptChkaSt2Still;
shared static this() {
	actionScriptChkaSt2Still = initializeScript!actionScriptChkaSt2Still(
		SET_X(5488),
		SET_Y(304),
		PAUSE(2),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C318A5
immutable ubyte[20 + 7 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptOutSt2;
shared static this() {
	actionScriptOutSt2 = initializeScript!actionScriptOutSt2(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		MOVE_PARTY_TO_LEADER_POSITION(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(192),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(48),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C318D0
immutable ubyte[25 + 6 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptPooSyugyou1;
shared static this() {
	actionScriptPooSyugyou1 = initializeScript!actionScriptPooSyugyou1(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 4992),
		SET_VAR(ActionScriptVars.v7, 3808),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C318FD
immutable ubyte[179 + 38 * (const(void)*).sizeof + 16 * ScriptPointer.sizeof] actionScriptPooSyugyou2;
shared static this() {
	actionScriptPooSyugyou2 = initializeScript!actionScriptPooSyugyou2(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		// A single second of uninterruptable meditation.
		PAUSE(60),
		// A single second of interruptable meditation. if player moves before the messenger shows up, set temp flag and exit early
		LOOP(60),
			GET_PRESSED_BUTTONS(),
			AND_TEMPVAR(Pad.left | Pad.right | Pad.down | Pad.up),
			JUMP_IF_FALSE("actionScriptPooSyugyou2.UNKNOWN0"),
			WRITE_WORD_TEMPVAR(1),
			SET_EVENT_FLAG(EventFlag.temp1),
			YIELD_TO_TEXT(),
			HALT(),
	LABEL("UNKNOWN0"),
			PAUSE(1),
		LOOP_END(),
		// messenger shows up
		YIELD_TO_TEXT(),
		PAUSE(1),
		// 10 more seconds of meditation. Set temp flag and exit early if player presses any buttons
		LOOP(10),
			LOOP(60),
				GET_PRESSED_BUTTONS(),
				AND_TEMPVAR(Pad.left | Pad.right | Pad.down | Pad.up),
				JUMP_IF_FALSE("actionScriptPooSyugyou2.UNKNOWN1"),
				WRITE_WORD_TEMPVAR(1),
				SET_EVENT_FLAG(EventFlag.temp1),
				YIELD_TO_TEXT(),
				HALT(),
	LABEL("UNKNOWN1"),
				PAUSE(1),
			LOOP_END(),
		LOOP_END(),
		// fade out, bring in the ancestor's spirit - also interruptable
		FADE_OUT_WITH_MOSAIC(1, 1, 0),
		// set up background
		LOAD_BATTLE_BG(BackgroundLayer.muTraining, BackgroundLayer.none),
		SET_X(128),
		SET_Y(112),
		FADE_IN(1, 1),
		SET_TICK_CALLBACK(&actionScriptAnimatedBackgroundCallback),
		YIELD_TO_TEXT(),
		// here comes the spirit
		PAUSE(1),
	LABEL("UNKNOWN2"),
		GET_PRESSED_BUTTONS(),
		AND_TEMPVAR(Pad.left | Pad.right | Pad.down | Pad.up),
		JUMP_IF_FALSE("actionScriptPooSyugyou2.UNKNOWN3"),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.temp1),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptPooSyugyou2.UNKNOWN6"),
		// wait until spirit is finished descending to fade out to a pseudo-battle
	LABEL("UNKNOWN3"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp2),
		JUMP_IF_FALSE("actionScriptPooSyugyou2.UNKNOWN2"),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		YIELD_TO_TEXT(),
		// fade back in, start spirit dialogue. Wait until temp flag 1 is set (failed) or flag 4 is set (sight is taken)
		PAUSE(2),
		SET_ANIMATION(255),
		FADE_IN(1, 1),
	LABEL("UNKNOWN4"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_TRUE("actionScriptPooSyugyou2.UNKNOWN6"),
		GET_EVENT_FLAG(EventFlag.temp4),
		JUMP_IF_FALSE("actionScriptPooSyugyou2.UNKNOWN4"),
		// sight has been taken. fade all palettes except text to black
		CLEAR_TICK_CALLBACK(),
		PREPARE_FADE_PALETTE(),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1), 0, 100),
		YIELD_TO_TEXT(),
		// wait for spirit to finish talking. if temp flag 1 is cleared, the meditation has failed
		PAUSE(1),
	LABEL("UNKNOWN5"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp2),
		JUMP_IF_FALSE("actionScriptPooSyugyou2.UNKNOWN5"),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_TRUE("actionScriptPooSyugyou2.UNKNOWN6"),
		// meditation failed. fade out, reload the map and finish up
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		RELOAD_MAP_FULL(),
		PAUSE(150),
		FADE_IN(1, 1),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
		// meditation successful! Fade out, reload the map, clear temp flag 3 and finish up
	LABEL("UNKNOWN6"),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		CLEAR_TICK_CALLBACK(),
		RELOAD_MAP_FULL(),
		WRITE_WORD_TEMPVAR(0),
		SET_EVENT_FLAG(EventFlag.temp3),
	LABEL("UNKNOWN7"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_TRUE("actionScriptPooSyugyou2.UNKNOWN7"),
		FADE_IN(1, 1),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C31A42
immutable ubyte[42 + 5 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptMessenger;
shared static this() {
	actionScriptMessenger = initializeScript!actionScriptMessenger(
		SET_X(4840),
		SET_Y(3880),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 4880),
		SET_VAR(ActionScriptVars.v7, 3864),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v6, 4840),
		SET_VAR(ActionScriptVars.v7, 3880),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C31A83
immutable ubyte[28 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptSenzo1;
shared static this() {
	actionScriptSenzo1 = initializeScript!actionScriptSenzo1(
		MOVE_TO_LOCATION_BG1_RELATIVE(128, 0),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 128),
		SET_VAR(ActionScriptVars.v7, 128),
		SHORTCALL("actionScriptMoveToLocation"),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_TRUE("actionScriptSenzo1.UNKNOWN0"),
		YIELD_TO_TEXT(),
	LABEL("UNKNOWN0"),
		HALT(),
	);
}
/// $C31AB1
immutable ubyte[7 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptSenzo2;
shared static this() {
	actionScriptSenzo2 = initializeScript!actionScriptSenzo2(
		MOVE_TO_LOCATION_BG1_RELATIVE(128, 128),
		SHORTCALL("unknownC3AA38"),
		HALT(),
	);
}
/// $C31ABD
immutable ubyte[55 + 4 * (const(void)*).sizeof + 10 * ScriptPointer.sizeof] actionScriptPooTeleport;
shared static this() {
	actionScriptPooTeleport = initializeScript!actionScriptPooTeleport(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v3, 8),
		SHORTCALL("unknownC34B62"),
		SET_VAR(ActionScriptVars.v3, 6),
		SHORTCALL("unknownC34B62"),
		SET_VAR(ActionScriptVars.v3, 4),
		SHORTCALL("unknownC34B62"),
		SET_VAR(ActionScriptVars.v3, 2),
		SHORTCALL("unknownC34B62"),
		SHORTCALL("unknownC34B62"),
		SET_VAR(ActionScriptVars.v3, 1),
		SHORTCALL("unknownC34B62"),
		SHORTCALL("unknownC34B62"),
		SHORTCALL("unknownC34B62"),
		SET_VAR(ActionScriptVars.v4, 5),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		LOOP(32),
			SET_X_VELOCITY_RELATIVE(32),
			PAUSE(1),
		LOOP_END(),
		PAUSE(32),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C31B14
immutable ubyte[34 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptSyugyouAddPoo;
shared static this() {
	actionScriptSyugyouAddPoo = initializeScript!actionScriptSyugyouAddPoo(
		MOVE_TO_LOCATION_BG1_RELATIVE(0, 128),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(1024),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(70),
		SET_VELOCITIES_ZERO(),
		PAUSE(60),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 17),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C31B4B
immutable ubyte[99 + 13 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptKaitenNess;
shared static this() {
	actionScriptKaitenNess = initializeScript!actionScriptKaitenNess(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 496),
		SET_VAR(ActionScriptVars.v7, 9136),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v0, 8),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		C0AAAC(),
		PAUSE(2),
		YIELD_TO_TEXT(),
		PAUSE(2),
		INITIALIZE_YOUR_SANCTUARY_DISPLAY(),
		WRITE_WORD_TEMPVAR(7),
		DISPLAY_YOUR_SANCTUARY_LOCATION(),
		CLEAR_TICK_CALLBACK(),
		PAUSE(1),
		ENABLE_YOUR_SANCTUARY_DISPLAY(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v1, 6),
		LOOP(7),
			WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
			DISPLAY_YOUR_SANCTUARY_LOCATION(),
			ADD(ActionScriptVars.v1, -1),
			PAUSE(1),
		LOOP_END(),
		START_TASK("actionScriptKaitenNessTask"),
		LOOP(7),
			PAUSE(70),
			ADD(ActionScriptVars.v0, -1),
		LOOP_END(),
		PAUSE(60),
		LOOP(7),
			PAUSE(34),
			ADD(ActionScriptVars.v0, 1),
		LOOP_END(),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		GET_SELF_DIRECTION(),
		ADD_TEMPVAR(-4),
		JUMP_IF_TRUE("actionScriptKaitenNess.UNKNOWN1"),
		END_LAST_TASK(),
		HALT(),
	);
}
/// $C3
immutable ubyte[9 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptKaitenNessTask;
shared static this() {
	actionScriptKaitenNessTask = initializeScript!actionScriptKaitenNessTask(
		WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v0),
		WRITE_WORD_TEMPVAR(1),
		GET_DIRECTION_ROTATED_CLOCKWISE(),
		SET_DIRECTION(),
		C0AAAC(),
		SHORTJUMP("actionScriptKaitenNessTask"),
	);
}
/// $C31BED
immutable ubyte[12 + 2 * ScriptPointer.sizeof] actionScriptNessAwake;
shared static this() {
	actionScriptNessAwake = initializeScript!actionScriptNessAwake(
		SHORTCALL("unknownC3AA38"),
	LABEL("UNKNOWN0"),
		SET_Y_RELATIVE(-1),
		PAUSE(8),
		SET_Y_RELATIVE(1),
		PAUSE(8),
		SHORTJUMP("actionScriptNessAwake.UNKNOWN0"),
	);
}
/// $C31BFD
immutable ubyte[24 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTalkPaulaJeff;
shared static this() {
	actionScriptTalkPaulaJeff = initializeScript!actionScriptTalkPaulaJeff(
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_Y_VELOCITY(32),
		PAUSE(8),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(8),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C31C23
immutable ubyte[24 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTalkPoo;
shared static this() {
	actionScriptTalkPoo = initializeScript!actionScriptTalkPoo(
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_X_VELOCITY(-32),
		PAUSE(8),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(8),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C31C49
immutable ubyte[48 + 3 * (const(void)*).sizeof + 1 * 3 * (const(void)*).sizeof / 2 + 1 * (const(void)*).sizeof * (const(void)*).sizeof / 2 + 2 * ScriptPointer.sizeof] actionScriptBGChange;
shared static this() {
	actionScriptBGChange = initializeScript!actionScriptBGChange(
		SET_ANIMATION(255),
		PAUSE(15),
		SET_VAR(ActionScriptVars.v0, 16),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		START_TASK("actionScriptBGChangeTask"),
		LOOP(15),
			PAUSE(32),
			ADD(ActionScriptVars.v0, -1),
		LOOP_END(),
		PAUSE(60),
		LOOP(15),
			PAUSE(16),
			ADD(ActionScriptVars.v0, 1),
		LOOP_END(),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		GET_SELF_DIRECTION(),
		ADD_TEMPVAR(-7),
		JUMP_IF_TRUE("actionScriptBGChange.UNKNOWN1"),
		END_LAST_TASK(),
		PAUSE(16),
		WRITE_DWORD_WRAM(&postTeleportCallback, &restoreMapRendering),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C31C90
immutable ubyte[9 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptBGChangeTask;
shared static this() {
	actionScriptBGChangeTask = initializeScript!actionScriptBGChangeTask(
		WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v0),
		WRITE_WORD_TEMPVAR(-1),
		GET_DIRECTION_ROTATED_CLOCKWISE(),
		SET_DIRECTION(),
		DISPLAY_YOUR_SANCTUARY_LOCATION(),
		SHORTJUMP("actionScriptBGChangeTask"),
	);
}
/// $C31CA4
immutable ubyte[60 + 7 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptPowspot;
shared static this() {
	actionScriptPowspot = initializeScript!actionScriptPowspot(
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v0, 0),
	LABEL("UNKNOWN0"),
		LOOP(9),
			ADD(ActionScriptVars.v0, 1),
			DO_PALETTES_FADE_STEP(),
			PAUSE(12),
		LOOP_END(),
		LOOP(9),
			ADD(ActionScriptVars.v0, -1),
			DO_PALETTES_FADE_STEP(),
			PAUSE(12),
		LOOP_END(),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_TRUE("actionScriptPowspot.UNKNOWN1"),
		LOOP(9),
			ADD(ActionScriptVars.v0, -1),
			DO_PALETTES_FADE_STEP(),
			PAUSE(12),
		LOOP_END(),
		LOOP(9),
			ADD(ActionScriptVars.v0, 1),
			DO_PALETTES_FADE_STEP(),
			PAUSE(12),
		LOOP_END(),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_FALSE("actionScriptPowspot.UNKNOWN0"),
	LABEL("UNKNOWN1"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/** ActionScript 353 - Lumine Hall cutscene director
 *
 * Var 0 is used for the text width in half-tiles.
 * Var 1 is used for the current text position.
 * Original_Address: $(DOLLAR)C31CFB
 */
immutable ubyte[13 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptKoke;
shared static this() {
	actionScriptKoke = initializeScript!actionScriptKoke(
		SET_ANIMATION(255),
		PREPARE_LUMINE_HALL_TEXT(),
		SET_VAR(ActionScriptVars.v1, 0),
	LABEL("UNKNOWN1"),
		PAUSE(3),
		SCROLL_LUMINE_HALL_TEXT(),
		JUMP_IF_FALSE("actionScriptKoke.UNKNOWN1"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C31D15
immutable ubyte[12 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptMonoRMan;
shared static this() {
	actionScriptMonoRMan = initializeScript!actionScriptMonoRMan(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(120),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C31D2D
immutable ubyte[20 + 2 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] unknownC31D2D;
shared static this() {
	unknownC31D2D = initializeScript!unknownC31D2D(
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_FALSE("unknownC31D2D.UNKNOWN0"),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v4),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_FALSE("unknownC31D2D.UNKNOWN0"),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v4),
		SHORTJUMP("unknownC31D2D"),
	LABEL("UNKNOWN0"),
		PAUSE(6),
		SHORTJUMP("unknownC31D2D"),
	);
}
/// $C31D4F
immutable ubyte[11 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC31D4F;
shared static this() {
	unknownC31D4F = initializeScript!unknownC31D4F(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("unknownC31D2D"),
		SET_VAR(ActionScriptVars.v4, 24),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORT_RETURN(),
	);
}
/// $C31D61
immutable ubyte[6 + 1 * (const(void)*).sizeof] actionScriptStageParty;
shared static this() {
	actionScriptStageParty = initializeScript!actionScriptStageParty(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_ANIMATION(255),
		SET_VELOCITIES_ZERO(),
		HALT(),
	);
}
/// $C31D6A
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptStageFadeout;
shared static this() {
	actionScriptStageFadeout = initializeScript!actionScriptStageFadeout(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(255),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v0, 0),
		LOOP(15),
			ADD(ActionScriptVars.v0, -1),
			C474A8(),
			PAUSE(10),
		LOOP_END(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C31D89
immutable ubyte[24 + 5 * (const(void)*).sizeof + 1 * string.sizeof + 1 * ScriptPointer.sizeof] actionScriptTStage1Scr1;
shared static this() {
	actionScriptTStage1Scr1 = initializeScript!actionScriptTStage1Scr1(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptCentreScreenOnEntityCallback),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 6912),
		SET_VAR(ActionScriptVars.v7, 8560),
		SHORTCALL("actionScriptMoveToLocation"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TSTAGE1_A"),
		HALT(),
	);
}
/// $C31DB5
immutable ubyte[37 + 5 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScriptTStage1Scr2;
shared static this() {
	actionScriptTStage1Scr2 = initializeScript!actionScriptTStage1Scr2(
		SET_X(6912),
		SET_Y(8560),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v1, 20),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptCentreScreenOnEntityCallback),
		SET_VAR(ActionScriptVars.v2, 0),
		START_TASK("unknownC31E2DTask"),
		SET_SPRITE_DESTINATION(OverworldSprite.ness),
		SHORTCALL("actionScriptMoveToLocation"),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v2),
		JUMP_IF_FALSE("actionScriptTStage1Scr2.UNKNOWN1"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TSTAGE1_B"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C31DF4
immutable ubyte[18 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] unknownC31DF4;
shared static this() {
	unknownC31DF4 = initializeScript!unknownC31DF4(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptCentreScreenOnEntityCallback),
		SET_VAR(ActionScriptVars.v2, 0),
		START_TASK("unknownC31DF4Task"),
		SHORTCALL("actionScriptMoveToLocation"),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v2),
		JUMP_IF_FALSE("unknownC31DF4.UNKNOWN1"),
		SHORT_RETURN(),
	);
}
/// $C31E14
immutable ubyte[22 + 1 * (const(void)*).sizeof] unknownC31DF4Task;
shared static this() {
	unknownC31DF4Task = initializeScript!unknownC31DF4Task(
		SET_VAR(ActionScriptVars.v0, 0),
		WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v1),
		LOOP(15),
			ADD(ActionScriptVars.v0, -1),
			C474A8(),
			WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v1),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v2, 1),
		END_TASK(),
	);
}
/// $C31E2D
immutable ubyte[18 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] unknownC31E2D;
shared static this() {
	unknownC31E2D = initializeScript!unknownC31E2D(
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptCentreScreenOnEntityCallback),
		SET_VAR(ActionScriptVars.v2, 0),
		START_TASK("unknownC31E2DTask"),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v2),
		JUMP_IF_FALSE("unknownC31E2D.UNKNOWN0"),
		SHORT_RETURN(),
	);
}
/// $C31E4D
immutable ubyte[22 + 1 * (const(void)*).sizeof] unknownC31E2DTask;
shared static this() {
	unknownC31E2DTask = initializeScript!unknownC31E2DTask(
		SET_VAR(ActionScriptVars.v0, -15),
		WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v1),
		LOOP(15),
			ADD(ActionScriptVars.v0, 1),
			C474A8(),
			WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v1),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v2, 1),
		END_TASK(),
	);
}
/// $C31E66
immutable ubyte[11 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript360;
shared static this() {
	actionScript360 = initializeScript!actionScript360(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 0),
		HALT(),
	);
}
/// $C31E79
immutable ubyte[11 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTStage1MikeL;
shared static this() {
	actionScriptTStage1MikeL = initializeScript!actionScriptTStage1MikeL(
		SET_X(6896),
		SET_Y(8560),
	LABEL("ENTRY2"),
		SHORTCALL("unknownC3AA38"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C31E89
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage1MikeR;
shared static this() {
	actionScriptTStage1MikeR = initializeScript!actionScriptTStage1MikeR(
		SET_X(6928),
		SET_Y(8560),
		SHORTJUMP("actionScriptTStage1MikeL.ENTRY2"),
	);
}
/// $C31E92
immutable ubyte[15 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTStage1Thank;
shared static this() {
	actionScriptTStage1Thank = initializeScript!actionScriptTStage1Thank(
		SET_X(6904),
		SET_Y(8512),
	LABEL("ENTRY2"),
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C31EA6
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage1OK;
shared static this() {
	actionScriptTStage1OK = initializeScript!actionScriptTStage1OK(
		SET_X(6920),
		SET_Y(8512),
		SHORTJUMP("actionScriptTStage1Thank.ENTRY2"),
	);
}
/// $C31EAF
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage1Nice;
shared static this() {
	actionScriptTStage1Nice = initializeScript!actionScriptTStage1Nice(
		SET_X(6888),
		SET_Y(8520),
		SHORTJUMP("actionScriptTStage1Thank.ENTRY2"),
	);
}
/// $C31EB8
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage1Groove;
shared static this() {
	actionScriptTStage1Groove = initializeScript!actionScriptTStage1Groove(
		SET_X(6936),
		SET_Y(8520),
		SHORTJUMP("actionScriptTStage1Thank.ENTRY2"),
	);
}
/// $C31EC1
immutable ubyte[17 + 2 * (const(void)*).sizeof] unknownC31EC1;
shared static this() {
	unknownC31EC1 = initializeScript!unknownC31EC1(
		PAUSE(48),
		SET_X_VELOCITY(64),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(22),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		SHORT_RETURN(),
	);
}
/// $C31ED8
immutable ubyte[17 + 2 * (const(void)*).sizeof] unknownC31ED8;
shared static this() {
	unknownC31ED8 = initializeScript!unknownC31ED8(
		PAUSE(48),
		SET_X_VELOCITY(-64),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(22),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		SHORT_RETURN(),
	);
}
/// $C31EEF
immutable ubyte[156 + 25 * (const(void)*).sizeof + 9 * ScriptPointer.sizeof] unknownC31EEF;
shared static this() {
	unknownC31EEF = initializeScript!unknownC31EEF(
		SET_X_VELOCITY(91),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(22),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(23),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(22),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(23),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		SET_X_VELOCITY(-91),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(22),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(23),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(22),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(23),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		SET_Y_VELOCITY(-45),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(22),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(23),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(22),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(23),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		SET_Y_VELOCITY(45),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(22),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(23),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(22),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(23),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		SET_ANIMATION(255),
		PAUSE(90),
		SET_Y_VELOCITY(-45),
		SHORTCALL("unknownC32138"),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(67),
		SET_Y_VELOCITY(133),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(7),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(8),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SHORT_RETURN(),
	);
}
/// $C31FE8
immutable ubyte[242 + 20 * (const(void)*).sizeof + 17 * ScriptPointer.sizeof] actionScriptTStage1Lucky;
shared static this() {
	actionScriptTStage1Lucky = initializeScript!actionScriptTStage1Lucky(
		SET_X(6816),
		SET_Y(8536),
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v0, 0),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_TICK_CALLBACK(&actionScriptEnableSpotlight1),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		LOOP(11),
			SHORTCALL("unknownC31EC1"),
		LOOP_END(),
		PAUSE(48),
		SET_X_VELOCITY(64),
		SET_Y_VELOCITY(-48),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(22),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		PAUSE(48),
		SET_X_VELOCITY(64),
		SET_Y_VELOCITY(48),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(22),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		PAUSE(80),
		SET_ANIMATION(255),
		PAUSE(30),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		DISABLE_SPOT_LIGHT_1(),
		CLEAR_TICK_CALLBACK(),
		SHORTCALL("unknownC31EC1"),
		PAUSE(10),
		SET_VAR(ActionScriptVars.v4, 15),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(68),
		PAUSE(60),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(30),
		SET_ANIMATION(255),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 15),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_X_VELOCITY(-68),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 15),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_X_VELOCITY(68),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 15),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_X_VELOCITY(-68),
		PAUSE(60),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_VAR(ActionScriptVars.v4, 30),
		SET_Y_VELOCITY(136),
		PAUSE(30),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(7),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(7),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(90),
		SET_ANIMATION(255),
		PAUSE(90),
		PAUSE(90),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		SET_X_VELOCITY(-22),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		SET_VELOCITIES_ZERO(),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		SET_Y_VELOCITY(-22),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		SET_VELOCITIES_ZERO(),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		SET_X_VELOCITY(22),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		SET_VELOCITIES_ZERO(),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC31EEF"),
		PAUSE(22),
		PAUSE(60),
		PAUSE(180),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32138
immutable ubyte[11 + 2 * (const(void)*).sizeof] unknownC32138;
shared static this() {
	unknownC32138 = initializeScript!unknownC32138(
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(22),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(23),
		SHORT_RETURN(),
	);
}
/// $C32149
immutable ubyte[253 + 25 * (const(void)*).sizeof + 17 * ScriptPointer.sizeof] actionScriptTStage1Gorgeous;
shared static this() {
	actionScriptTStage1Gorgeous = initializeScript!actionScriptTStage1Gorgeous(
		SET_X(7008),
		SET_Y(8536),
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v0, 0),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_TICK_CALLBACK(&actionScriptEnableSpotlight2),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		LOOP(11),
			SHORTCALL("unknownC31ED8"),
		LOOP_END(),
		PAUSE(48),
		SET_X_VELOCITY(-64),
		SET_Y_VELOCITY(48),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(22),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		PAUSE(48),
		SET_X_VELOCITY(-64),
		SET_Y_VELOCITY(-48),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(22),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		PAUSE(80),
		YIELD_TO_TEXT(),
		SET_ANIMATION(255),
		PAUSE(30),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		DISABLE_SPOT_LIGHT_2(),
		CLEAR_TICK_CALLBACK(),
		PAUSE(10),
		SHORTCALL("unknownC31ED8"),
		DARKEN_SCREEN(),
		ENABLE_STAGE_HDMA(6848, 8560, 6976),
		SET_VAR(ActionScriptVars.v4, 15),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(-68),
		PAUSE(60),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(30),
		SET_ANIMATION(255),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 15),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_X_VELOCITY(68),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 15),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_X_VELOCITY(-68),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 15),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_X_VELOCITY(68),
		PAUSE(60),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_VAR(ActionScriptVars.v4, 30),
		SET_Y_VELOCITY(136),
		PAUSE(30),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(7),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(7),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(90),
		SET_ANIMATION(255),
		PAUSE(90),
		PAUSE(90),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		SET_X_VELOCITY(22),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		SET_VELOCITIES_ZERO(),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		SET_Y_VELOCITY(-22),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		SET_VELOCITIES_ZERO(),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		SET_X_VELOCITY(-22),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		SET_VELOCITIES_ZERO(),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC32138"),
		SHORTCALL("unknownC31EEF"),
		PAUSE(22),
		DARKEN_SCREEN_END(),
		PAUSE(60),
		YIELD_TO_TEXT(),
		PAUSE(180),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C322B3
immutable ubyte[115 + 8 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage1GorgeousDance;
shared static this() {
	actionScriptTStage1GorgeousDance = initializeScript!actionScriptTStage1GorgeousDance(
		SET_X(6904),
		SET_Y(8536),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(30),
		SET_ANIMATION(255),
		PAUSE(90),
		PAUSE(90),
		SET_X(6880),
		SET_Y(8536),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(30),
		SET_ANIMATION(255),
		PAUSE(90),
		SET_X(6904),
		SET_Y(8536),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(30),
		SET_ANIMATION(255),
		PAUSE(90),
		SET_X(6880),
		SET_Y(8536),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(30),
		SET_ANIMATION(255),
		PAUSE(120),
		PAUSE(90),
		SET_X(6896),
		SET_Y(8552),
		LOOP(4),
			UPDATE_SPRITE_DIRECTION(Direction.left, 1),
			PAUSE(22),
			UPDATE_SPRITE_DIRECTION(Direction.right, 1),
			PAUSE(23),
		LOOP_END(),
		SET_ANIMATION(255),
		LOOP(14),
			PAUSE(90),
		LOOP_END(),
		SET_X(6896),
		SET_Y(8544),
		LOOP(2),
			UPDATE_SPRITE_DIRECTION(Direction.left, 1),
			PAUSE(22),
			UPDATE_SPRITE_DIRECTION(Direction.right, 1),
			PAUSE(23),
		LOOP_END(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32342
immutable ubyte[115 + 8 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage1LuckyDance;
shared static this() {
	actionScriptTStage1LuckyDance = initializeScript!actionScriptTStage1LuckyDance(
		SET_X(6920),
		SET_Y(8536),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(30),
		SET_ANIMATION(255),
		PAUSE(90),
		PAUSE(90),
		SET_X(6944),
		SET_Y(8536),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(30),
		SET_ANIMATION(255),
		PAUSE(90),
		SET_X(6920),
		SET_Y(8536),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(30),
		SET_ANIMATION(255),
		PAUSE(90),
		SET_X(6944),
		SET_Y(8536),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(30),
		SET_ANIMATION(255),
		PAUSE(120),
		PAUSE(90),
		SET_X(6928),
		SET_Y(8552),
		LOOP(4),
			UPDATE_SPRITE_DIRECTION(Direction.left, 1),
			PAUSE(22),
			UPDATE_SPRITE_DIRECTION(Direction.right, 1),
			PAUSE(23),
		LOOP_END(),
		SET_ANIMATION(255),
		LOOP(14),
			PAUSE(90),
		LOOP_END(),
		SET_X(6928),
		SET_Y(8544),
		LOOP(2),
			UPDATE_SPRITE_DIRECTION(Direction.left, 1),
			PAUSE(22),
			UPDATE_SPRITE_DIRECTION(Direction.right, 1),
			PAUSE(23),
		LOOP_END(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C323D1
immutable ubyte[46 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTStage1Flip;
shared static this() {
	actionScriptTStage1Flip = initializeScript!actionScriptTStage1Flip(
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(80),
		SET_VAR(ActionScriptVars.v4, 40),
		LOOP(14),
			PAUSE(80),
		LOOP_END(),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		LOOP(10),
			PAUSE(60),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(90),
	LABEL("UNKNOWN0"),
		LOOP(38),
			SET_ANIMATION(1),
			UPDATE_ENTITY_SPRITE_FRAME1(),
			PAUSE(22),
			SET_ANIMATION(0),
			UPDATE_ENTITY_SPRITE_FRAME0(),
			PAUSE(23),
		LOOP_END(),
		HALT(),
	);
}
/// $C3240A
immutable ubyte[55 + 5 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage1FlipTurn;
shared static this() {
	actionScriptTStage1FlipTurn = initializeScript!actionScriptTStage1FlipTurn(
		SHORTCALL("unknownC31D4F"),
		DARKEN_SCREEN_2_WINDOW(),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(80),
		SET_VAR(ActionScriptVars.v4, 40),
		LOOP(14),
			PAUSE(80),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v4, 30),
		LOOP(9),
			PAUSE(60),
		LOOP_END(),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(7),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(7),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(8),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(90),
		SHORTJUMP("actionScriptTStage1Flip.UNKNOWN0"),
	);
}
/// $C32454
immutable ubyte[28 + 5 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage2Scr1;
shared static this() {
	actionScriptTStage2Scr1 = initializeScript!actionScriptTStage2Scr1(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptCentreScreenOnEntityCallback),
		SET_VAR(ActionScriptVars.v2, 0),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 4736),
		SET_VAR(ActionScriptVars.v7, 5744),
		SHORTCALL("actionScriptMoveToLocation"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TSTAGE2_A"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32486
immutable ubyte[20 + 2 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage2Scr2;
shared static this() {
	actionScriptTStage2Scr2 = initializeScript!actionScriptTStage2Scr2(
		SET_X(4736),
		SET_Y(5744),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v1, 20),
		SHORTCALL("unknownC31E2D"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TSTAGE2_B"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C324A8
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage2MikeL;
shared static this() {
	actionScriptTStage2MikeL = initializeScript!actionScriptTStage2MikeL(
		SET_X(4704),
		SET_Y(5748),
		SHORTJUMP("actionScriptTStage1MikeL.ENTRY2"),
	);
}
/// $C324B1
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage2MikeR;
shared static this() {
	actionScriptTStage2MikeR = initializeScript!actionScriptTStage2MikeR(
		SET_X(4768),
		SET_Y(5748),
		SHORTJUMP("actionScriptTStage1MikeL.ENTRY2"),
	);
}
/// $C324BA
immutable ubyte[15 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTStage23Thank;
shared static this() {
	actionScriptTStage23Thank = initializeScript!actionScriptTStage23Thank(
		SET_X(4696),
		SET_Y(5712),
	LABEL("ENTRY2"),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C324CE
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage23OK;
shared static this() {
	actionScriptTStage23OK = initializeScript!actionScriptTStage23OK(
		SET_X(4752),
		SET_Y(5704),
		SHORTJUMP("actionScriptTStage23Thank.ENTRY2"),
	);
}
/// $C324D7
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage23Nice;
shared static this() {
	actionScriptTStage23Nice = initializeScript!actionScriptTStage23Nice(
		SET_X(4720),
		SET_Y(5704),
		SHORTJUMP("actionScriptTStage23Thank.ENTRY2"),
	);
}
/// $C324E0
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage23Groove;
shared static this() {
	actionScriptTStage23Groove = initializeScript!actionScriptTStage23Groove(
		SET_X(4776),
		SET_Y(5712),
		SHORTJUMP("actionScriptTStage23Thank.ENTRY2"),
	);
}
/// $C324E9
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage23HighHat;
shared static this() {
	actionScriptTStage23HighHat = initializeScript!actionScriptTStage23HighHat(
		SET_X(4740),
		SET_Y(5704),
		SHORTJUMP("actionScriptTStage23Thank.ENTRY2"),
	);
}
/// $C324F2
immutable ubyte[2 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTStage2SpotInitPlayer;
shared static this() {
	actionScriptTStage2SpotInitPlayer = initializeScript!actionScriptTStage2SpotInitPlayer(
		DARKEN_SCREEN_2_WINDOW(),
		SHORTJUMP("actionScriptTStage2Player"),
	);
}
/// $C324F9
immutable ubyte[9 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTStage2Player;
shared static this() {
	actionScriptTStage2Player = initializeScript!actionScriptTStage2Player(
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C32507
immutable ubyte[14 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTStage2Spotlight;
shared static this() {
	actionScriptTStage2Spotlight = initializeScript!actionScriptTStage2Spotlight(
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_TICK_CALLBACK(&actionScriptEnableSpotlight1),
		PAUSE(29),
		DISABLE_SPOT_LIGHT_1(),
		CLEAR_TICK_CALLBACK(),
		HALT(),
	);
}
/// $C32520
immutable ubyte[15 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTStage2Gorgeous;
shared static this() {
	actionScriptTStage2Gorgeous = initializeScript!actionScriptTStage2Gorgeous(
		SET_X(4704),
		SET_Y(5736),
	LABEL("ENTRY2"),
		SHORTCALL("unknownC3AA38"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		SET_VAR(ActionScriptVars.v4, 1),
		HALT(),
	);
}
/// $C32534
immutable ubyte[473 + 51 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage2GorgeousWalk;
shared static this() {
	actionScriptTStage2GorgeousWalk = initializeScript!actionScriptTStage2GorgeousWalk(
		SHORTCALL("unknownC31D4F"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		SET_VAR(ActionScriptVars.v0, 0),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(105),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(15),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_Y_VELOCITY(-34),
		LOOP(2),
			SET_ANIMATION(1),
			UPDATE_ENTITY_SPRITE_FRAME1(),
			PAUSE(30),
			SET_ANIMATION(0),
			UPDATE_ENTITY_SPRITE_FRAME0(),
			PAUSE(30),
		LOOP_END(),
		SET_VELOCITIES_ZERO(),
		PAUSE(26),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(4),
		PAUSE(90),
		PAUSE(120),
		PAUSE(120),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(15),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_VAR(ActionScriptVars.v4, 10),
		SET_X_VELOCITY(273),
		PAUSE(45),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_VAR(ActionScriptVars.v4, 20),
		SET_X_VELOCITY(-136),
		PAUSE(30),
		SET_VELOCITIES_ZERO(),
		PAUSE(15),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(15),
		SET_ANIMATION(255),
		YIELD_TO_TEXT(),
		PAUSE(60),
		PAUSE(30),
		PAUSE(120),
		PAUSE(120),
		SET_VAR(ActionScriptVars.v4, 20),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_X_VELOCITY(136),
		PAUSE(120),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(136),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_X_VELOCITY(-136),
		SET_Y_VELOCITY(0),
		PAUSE(120),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_X_VELOCITY(136),
		SET_Y_VELOCITY(0),
		PAUSE(60),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 30),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(60),
		SET_Y_VELOCITY(-34),
		PAUSE(120),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_X_VELOCITY(34),
		SET_Y_VELOCITY(34),
		PAUSE(120),
		SET_VELOCITIES_ZERO(),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(90),
		SET_Y_VELOCITY(-34),
		PAUSE(120),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_X_VELOCITY(34),
		SET_Y_VELOCITY(34),
		PAUSE(120),
		PAUSE(30),
		SET_Y_VELOCITY(-34),
		PAUSE(60),
		SET_Y_VELOCITY(34),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_Y_VELOCITY(-34),
		PAUSE(30),
		SET_VELOCITIES_ZERO(),
		PAUSE(15),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(15),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(15),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(15),
		YIELD_TO_TEXT(),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_X_VELOCITY(-395),
		SET_Y_VELOCITY(-27),
		PAUSE(37),
		SET_Y_VELOCITY(53),
		PAUSE(38),
		SET_VELOCITIES_ZERO(),
		PAUSE(45),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_ANIMATION(255),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_X_VELOCITY(68),
		PAUSE(90),
		SET_VELOCITIES_ZERO(),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 0),
		YIELD_TO_TEXT(),
		SET_ANIMATION(255),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_X_VELOCITY(-68),
		PAUSE(90),
		SET_VELOCITIES_ZERO(),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 0),
		YIELD_TO_TEXT(),
		SET_ANIMATION(255),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_X_VELOCITY(68),
		PAUSE(90),
		SET_VELOCITIES_ZERO(),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 0),
		YIELD_TO_TEXT(),
		SET_ANIMATION(255),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_X_VELOCITY(-68),
		PAUSE(90),
		SET_VELOCITIES_ZERO(),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 0),
		YIELD_TO_TEXT(),
		SET_ANIMATION(255),
		PAUSE(75),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(30),
		PAUSE(180),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C327AA
immutable ubyte[92 + 5 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage2SpotA;
shared static this() {
	actionScriptTStage2SpotA = initializeScript!actionScriptTStage2SpotA(
		SET_X(4704),
		SET_Y(5736),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v0, 0),
		SET_TICK_CALLBACK(&actionScriptEnableSpotlight1),
		PAUSE(105),
		PAUSE(15),
		SET_Y_VELOCITY(-34),
		LOOP(2),
			PAUSE(60),
		LOOP_END(),
		SET_VELOCITIES_ZERO(),
		PAUSE(30),
		PAUSE(90),
		PAUSE(120),
		PAUSE(120),
		SET_X_VELOCITY(182),
		PAUSE(45),
		SET_VELOCITIES_ZERO(),
		PAUSE(45),
		PAUSE(60),
		PAUSE(60),
		DISABLE_SPOT_LIGHT_1(),
		CLEAR_TICK_CALLBACK(),
		PAUSE(30),
		PAUSE(120),
		PAUSE(120),
		SET_X(4768),
		SET_Y(5736),
		SET_TICK_CALLBACK(&actionScriptEnableSpotlight1),
		START_TASK("unknownC32CD2"),
		SET_X_VELOCITY(273),
		PAUSE(30),
		SET_X_VELOCITY(-273),
		PAUSE(120),
		SET_X_VELOCITY(273),
		PAUSE(120),
		SET_X_VELOCITY(-273),
		PAUSE(90),
		END_LAST_TASK(),
		SET_VELOCITIES_ZERO(),
		PAUSE(120),
		DISABLE_SPOT_LIGHT_1(),
		CLEAR_TICK_CALLBACK(),
		PAUSE(180),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32818
immutable ubyte[62 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage2GorgeousDance;
shared static this() {
	actionScriptTStage2GorgeousDance = initializeScript!actionScriptTStage2GorgeousDance(
		SET_X(4736),
		SET_Y(5720),
		SHORTCALL("unknownC3AA38"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(90),
		PAUSE(120),
		PAUSE(120),
		SET_ANIMATION(255),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(90),
		SET_X(4704),
		SET_Y(5736),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(30),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32860
immutable ubyte[17 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage2GorgeousDance35;
shared static this() {
	actionScriptTStage2GorgeousDance35 = initializeScript!actionScriptTStage2GorgeousDance35(
		SET_X(4728),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(90),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32878
immutable ubyte[17 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage2GorgeousDance4;
shared static this() {
	actionScriptTStage2GorgeousDance4 = initializeScript!actionScriptTStage2GorgeousDance4(
		SET_X(4704),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(90),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32890
immutable ubyte[17 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage2GorgeousDance6;
shared static this() {
	actionScriptTStage2GorgeousDance6 = initializeScript!actionScriptTStage2GorgeousDance6(
		SET_X(4704),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(75),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C328A8
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage2Lucky;
shared static this() {
	actionScriptTStage2Lucky = initializeScript!actionScriptTStage2Lucky(
		SET_X(4768),
		SET_Y(5736),
		SHORTJUMP("actionScriptTStage2Gorgeous.ENTRY2"),
	);
}
/// $C328B1
immutable ubyte[523 + 73 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage2LuckyWalk;
shared static this() {
	actionScriptTStage2LuckyWalk = initializeScript!actionScriptTStage2LuckyWalk(
		SHORTCALL("unknownC31D4F"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		SET_VAR(ActionScriptVars.v0, 0),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(120),
		PAUSE(120),
		PAUSE(105),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(15),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_Y_VELOCITY(-34),
		LOOP(2),
			SET_ANIMATION(1),
			UPDATE_ENTITY_SPRITE_FRAME1(),
			PAUSE(30),
			SET_ANIMATION(0),
			UPDATE_ENTITY_SPRITE_FRAME0(),
			PAUSE(30),
		LOOP_END(),
		SET_VELOCITIES_ZERO(),
		PAUSE(25),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(5),
		PAUSE(90),
		PAUSE(120),
		PAUSE(120),
		PAUSE(15),
		SET_VAR(ActionScriptVars.v4, 5),
		SET_X_VELOCITY(-273),
		SET_Y_VELOCITY(273),
		PAUSE(15),
		SET_X_VELOCITY(-409),
		SET_Y_VELOCITY(91),
		PAUSE(45),
		SET_X_VELOCITY(-409),
		SET_Y_VELOCITY(-68),
		PAUSE(15),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(136),
		SET_Y_VELOCITY(-34),
		PAUSE(30),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(30),
		SET_ANIMATION(255),
		YIELD_TO_TEXT(),
		PAUSE(60),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 20),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_Y_VELOCITY(-136),
		PAUSE(45),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(136),
		SET_Y_VELOCITY(0),
		PAUSE(120),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(136),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(-218),
		SET_Y_VELOCITY(0),
		PAUSE(75),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(136),
		SET_Y_VELOCITY(0),
		PAUSE(60),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 30),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(60),
		SET_Y_VELOCITY(-34),
		PAUSE(120),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(10),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(10),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(10),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(34),
		SET_Y_VELOCITY(34),
		PAUSE(120),
		SET_VELOCITIES_ZERO(),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(90),
		SET_Y_VELOCITY(-34),
		PAUSE(120),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(10),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(10),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(10),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(34),
		SET_Y_VELOCITY(34),
		PAUSE(120),
		PAUSE(30),
		SET_Y_VELOCITY(-34),
		PAUSE(60),
		SET_Y_VELOCITY(34),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		SET_Y_VELOCITY(-34),
		PAUSE(60),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_Y_VELOCITY(34),
		PAUSE(30),
		SET_VELOCITIES_ZERO(),
		PAUSE(90),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_ANIMATION(255),
		PAUSE(30),
		YIELD_TO_TEXT(),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_X_VELOCITY(-68),
		PAUSE(90),
		SET_VELOCITIES_ZERO(),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_ANIMATION(255),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_X_VELOCITY(68),
		PAUSE(90),
		SET_VELOCITIES_ZERO(),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_ANIMATION(255),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_X_VELOCITY(-68),
		PAUSE(90),
		SET_VELOCITIES_ZERO(),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_ANIMATION(255),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_X_VELOCITY(68),
		PAUSE(90),
		SET_VELOCITIES_ZERO(),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_ANIMATION(255),
		PAUSE(75),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 30),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		YIELD_TO_TEXT(),
		PAUSE(30),
		PAUSE(180),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32B9B
immutable ubyte[144 + 8 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage2SpotB;
shared static this() {
	actionScriptTStage2SpotB = initializeScript!actionScriptTStage2SpotB(
		SET_X(4768),
		SET_Y(5736),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptEnableSpotlight2),
		PAUSE(120),
		PAUSE(120),
		PAUSE(105),
		PAUSE(15),
		SET_Y_VELOCITY(-34),
		LOOP(2),
			PAUSE(30),
			PAUSE(30),
		LOOP_END(),
		SET_VELOCITIES_ZERO(),
		PAUSE(30),
		PAUSE(90),
		PAUSE(120),
		PAUSE(120),
		SET_X_VELOCITY(-546),
		SET_Y_VELOCITY(136),
		PAUSE(45),
		SET_VELOCITIES_ZERO(),
		PAUSE(45),
		PAUSE(60),
		PAUSE(60),
		DISABLE_SPOT_LIGHT_2(),
		CLEAR_TICK_CALLBACK(),
		PAUSE(30),
		SET_X(4704),
		SET_Y(5736),
		SET_TICK_CALLBACK(&actionScriptEnableSpotlight2),
		START_TASK("unknownC32CD2"),
		SET_X_VELOCITY(-273),
		PAUSE(30),
		SET_X_VELOCITY(273),
		PAUSE(120),
		SET_X_VELOCITY(-273),
		PAUSE(120),
		SET_X_VELOCITY(273),
		PAUSE(90),
		END_LAST_TASK(),
		SET_VELOCITIES_ZERO(),
		PAUSE(120),
		DISABLE_SPOT_LIGHT_2(),
		CLEAR_TICK_CALLBACK(),
		PAUSE(3),
		DARKEN_SCREEN(),
		ENABLE_STAGE_HDMA(4640, 5744, 4832),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(30),
		DARKEN_SCREEN_END(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32C46
immutable ubyte[58 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage2LuckyDance;
shared static this() {
	actionScriptTStage2LuckyDance = initializeScript!actionScriptTStage2LuckyDance(
		SET_X(4672),
		SET_Y(5744),
		SHORTCALL("unknownC3AA38"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(90),
		SET_ANIMATION(255),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		PAUSE(90),
		SET_X(4768),
		SET_Y(5736),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(30),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32C8A
immutable ubyte[17 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage2LuckyDance35;
shared static this() {
	actionScriptTStage2LuckyDance35 = initializeScript!actionScriptTStage2LuckyDance35(
		SET_X(4744),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(90),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32CA2
immutable ubyte[17 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage2LuckyDance4;
shared static this() {
	actionScriptTStage2LuckyDance4 = initializeScript!actionScriptTStage2LuckyDance4(
		SET_X(4768),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(90),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32CBA
immutable ubyte[17 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage2LuckyDance6;
shared static this() {
	actionScriptTStage2LuckyDance6 = initializeScript!actionScriptTStage2LuckyDance6(
		SET_X(4768),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(75),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32CD2
immutable ubyte[28 + 1 * ScriptPointer.sizeof] unknownC32CD2;
shared static this() {
	unknownC32CD2 = initializeScript!unknownC32CD2(
		SET_Y_VELOCITY(0),
		LOOP(15),
			SET_Y_VELOCITY_RELATIVE(-17),
			PAUSE(2),
		LOOP_END(),
		LOOP(30),
			SET_Y_VELOCITY_RELATIVE(17),
			PAUSE(2),
		LOOP_END(),
		LOOP(15),
			SET_Y_VELOCITY_RELATIVE(-17),
			PAUSE(2),
		LOOP_END(),
		SHORTJUMP("unknownC32CD2"),
	);
}
/// $C32CF0
immutable ubyte[182 + 28 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage2GrooveAdlib;
shared static this() {
	actionScriptTStage2GrooveAdlib = initializeScript!actionScriptTStage2GrooveAdlib(
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_X_VELOCITY(-26),
		SET_Y_VELOCITY(10),
		PAUSE(120),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(30),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 30),
		SET_X_VELOCITY(-26),
		SET_Y_VELOCITY(10),
		PAUSE(120),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 30),
		SET_X_VELOCITY(-26),
		SET_Y_VELOCITY(10),
		PAUSE(90),
		SET_VELOCITIES_ZERO(),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 30),
		SET_Y_VELOCITY(45),
		PAUSE(90),
		SET_VELOCITIES_ZERO(),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v4, 30),
		PAUSE(60),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(60),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(60),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(60),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(90),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(30),
		PAUSE(180),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32DFE
immutable ubyte[29 + 6 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage3Scr1;
shared static this() {
	actionScriptTStage3Scr1 = initializeScript!actionScriptTStage3Scr1(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptCentreScreenOnEntityCallback),
		SET_VAR(ActionScriptVars.v0, -15),
		C474A8(),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 4736),
		SET_VAR(ActionScriptVars.v7, 5744),
		SHORTCALL("actionScriptMoveToLocation"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TSTAGE3_A"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32E34
immutable ubyte[20 + 2 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScript437;
shared static this() {
	actionScript437 = initializeScript!actionScript437(
		SET_X(4736),
		SET_Y(5744),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v1, 20),
		SHORTCALL("unknownC31E2D"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TSTAGE3_B"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C32E56
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage3MikeL;
shared static this() {
	actionScriptTStage3MikeL = initializeScript!actionScriptTStage3MikeL(
		SET_X(4704),
		SET_Y(5748),
		SHORTJUMP("actionScriptTStage1MikeL.ENTRY2"),
	);
}
/// $C32E5F
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage3MikeR;
shared static this() {
	actionScriptTStage3MikeR = initializeScript!actionScriptTStage3MikeR(
		SET_X(4768),
		SET_Y(5748),
		SHORTJUMP("actionScriptTStage1MikeL.ENTRY2"),
	);
}
/// $C32E68
immutable ubyte[7 + 3 * ScriptPointer.sizeof] actionScriptTStage3Band;
shared static this() {
	actionScriptTStage3Band = initializeScript!actionScriptTStage3Band(
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
	LABEL("UNKNOWN0"),
		SHORTCALL("unknownC33399"),
		SHORTJUMP("actionScriptTStage3Band.UNKNOWN0"),
	);
}
/// $C32E75
immutable ubyte[355 + 39 * (const(void)*).sizeof + 11 * ScriptPointer.sizeof] actionScriptTStage3Gorgeous1;
shared static this() {
	actionScriptTStage3Gorgeous1 = initializeScript!actionScriptTStage3Gorgeous1(
		SET_X(4832),
		SET_Y(5728),
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v0, 0),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_TICK_CALLBACK(&actionScriptEnableSpotlight2),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		LOOP(11),
			SHORTCALL("unknownC31ED8"),
		LOOP_END(),
		PAUSE(48),
		SET_X_VELOCITY(-64),
		SET_Y_VELOCITY(48),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(22),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		PAUSE(48),
		SET_X_VELOCITY(-64),
		SET_Y_VELOCITY(-48),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(22),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		PAUSE(80),
		YIELD_TO_TEXT(),
		SET_ANIMATION(255),
		PAUSE(30),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		DISABLE_SPOT_LIGHT_2(),
		CLEAR_TICK_CALLBACK(),
		PAUSE(10),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTCALL("unknownC31ED8"),
		DARKEN_SCREEN(),
		ENABLE_STAGE_HDMA(4640, 5744, 4832),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_X_VELOCITY(-68),
		PAUSE(60),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_X_VELOCITY(68),
		PAUSE(30),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_ANIMATION(255),
		YIELD_TO_TEXT(),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_X_VELOCITY(68),
		PAUSE(60),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_X_VELOCITY(-68),
		PAUSE(30),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_ANIMATION(255),
		YIELD_TO_TEXT(),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_X_VELOCITY(-68),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 8),
		SET_X_VELOCITY(-354),
		PAUSE(52),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(8),
		YIELD_TO_TEXT(),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_X_VELOCITY(307),
		SET_Y_VELOCITY(34),
		PAUSE(60),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(90),
		YIELD_TO_TEXT(),
		SET_ANIMATION(255),
		PAUSE(180),
		PAUSE(45),
		YIELD_TO_TEXT(),
		PAUSE(90),
		YIELD_TO_TEXT(),
		PAUSE(45),
		SET_X(4712),
		SET_Y(5736),
		SET_X_VELOCITY(45),
		SET_Y_VELOCITY(-45),
		SHORTCALL("unknownC333AA"),
		SET_X_VELOCITY(45),
		SET_Y_VELOCITY(45),
		SHORTCALL("unknownC333CC"),
		SET_X_VELOCITY(45),
		SET_Y_VELOCITY(0),
		SHORTCALL("unknownC333BB"),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		SET_ANIMATION(255),
		PAUSE(45),
		SET_X(4744),
		SET_Y(5736),
		SET_X_VELOCITY(45),
		SET_Y_VELOCITY(45),
		SHORTCALL("unknownC333CC"),
		SET_X_VELOCITY(45),
		SET_Y_VELOCITY(-45),
		SHORTCALL("unknownC333AA"),
		SET_X_VELOCITY(45),
		SET_Y_VELOCITY(0),
		SHORTCALL("unknownC333BB"),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		SET_ANIMATION(255),
		PAUSE(135),
		SET_X(4752),
		SET_Y(5736),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(90),
		YIELD_TO_TEXT(),
		SET_ANIMATION(255),
		PAUSE(90),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(90),
		YIELD_TO_TEXT(),
		SET_ANIMATION(255),
		PAUSE(79),
		YIELD_TO_TEXT(),
		PAUSE(11),
		PAUSE(90),
		YIELD_TO_TEXT(),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(45),
		SET_Y_VELOCITY(-45),
		SHORTCALL("unknownC333BB"),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		YIELD_TO_TEXT(),
		PAUSE(90),
		PAUSE(90),
		PAUSE(90),
		PAUSE(60),
		DARKEN_SCREEN_END(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C33063
immutable ubyte[311 + 21 * (const(void)*).sizeof + 10 * ScriptPointer.sizeof] actionScriptTStage3Lucky1;
shared static this() {
	actionScriptTStage3Lucky1 = initializeScript!actionScriptTStage3Lucky1(
		SET_X(4640),
		SET_Y(5728),
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v0, 0),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_TICK_CALLBACK(&actionScriptEnableSpotlight1),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		LOOP(11),
			SHORTCALL("unknownC31EC1"),
		LOOP_END(),
		PAUSE(48),
		SET_X_VELOCITY(64),
		SET_Y_VELOCITY(-48),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(22),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		PAUSE(48),
		SET_X_VELOCITY(64),
		SET_Y_VELOCITY(48),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(22),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		PAUSE(80),
		SET_ANIMATION(255),
		PAUSE(30),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		DISABLE_SPOT_LIGHT_1(),
		CLEAR_TICK_CALLBACK(),
		PAUSE(10),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTCALL("unknownC31ED8"),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_X_VELOCITY(-68),
		PAUSE(60),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_X_VELOCITY(68),
		PAUSE(30),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_ANIMATION(255),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_X_VELOCITY(68),
		PAUSE(60),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_X_VELOCITY(-68),
		PAUSE(30),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_ANIMATION(255),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 30),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_X_VELOCITY(-68),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 8),
		SET_X_VELOCITY(-375),
		PAUSE(60),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(15),
		SET_VAR(ActionScriptVars.v4, 8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_X_VELOCITY(464),
		SET_Y_VELOCITY(27),
		PAUSE(75),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(90),
		SET_ANIMATION(255),
		PAUSE(180),
		SET_X(4760),
		SET_Y(5736),
		SET_X_VELOCITY(-45),
		SET_Y_VELOCITY(-45),
		SHORTCALL("unknownC333BB"),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		PAUSE(45),
		SET_X(4744),
		SET_Y(5736),
		SET_X_VELOCITY(-45),
		SHORTCALL("unknownC333CC"),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		PAUSE(45),
		SET_X(4728),
		SET_Y(5736),
		SET_X_VELOCITY(-45),
		SET_Y_VELOCITY(45),
		SHORTCALL("unknownC333CC"),
		SET_X_VELOCITY(-45),
		SET_Y_VELOCITY(-45),
		SHORTCALL("unknownC33399"),
		SET_X_VELOCITY(-45),
		SET_Y_VELOCITY(0),
		SHORTCALL("unknownC333CC"),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		PAUSE(225),
		PAUSE(90),
		SET_X(4720),
		SET_Y(5736),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(90),
		SET_ANIMATION(255),
		PAUSE(90),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(90),
		SET_ANIMATION(255),
		PAUSE(90),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(45),
		SET_Y_VELOCITY(-45),
		SHORTCALL("unknownC333BB"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C331ED
immutable ubyte[17 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTStage3Lucky2;
shared static this() {
	actionScriptTStage3Lucky2 = initializeScript!actionScriptTStage3Lucky2(
		SET_X(4744),
		SET_Y(5728),
	LABEL("ENTRY2"),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(30),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C33205
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage3Gorgeous2;
shared static this() {
	actionScriptTStage3Gorgeous2 = initializeScript!actionScriptTStage3Gorgeous2(
		SET_X(4728),
		SET_Y(5728),
		SHORTJUMP("actionScriptTStage3Lucky2.ENTRY2"),
	);
}
/// $C3320E
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage3Lucky3;
shared static this() {
	actionScriptTStage3Lucky3 = initializeScript!actionScriptTStage3Lucky3(
		SET_X(4728),
		SET_Y(5728),
		SHORTJUMP("actionScriptTStage3Lucky2.ENTRY2"),
	);
}
/// $C33217
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage3Gorgeous3;
shared static this() {
	actionScriptTStage3Gorgeous3 = initializeScript!actionScriptTStage3Gorgeous3(
		SET_X(4712),
		SET_Y(5728),
		SHORTJUMP("actionScriptTStage3Lucky2.ENTRY2"),
	);
}
/// $C33220
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage3Lucky4;
shared static this() {
	actionScriptTStage3Lucky4 = initializeScript!actionScriptTStage3Lucky4(
		SET_X(4736),
		SET_Y(5728),
		SHORTJUMP("actionScriptTStage3Lucky2.ENTRY2"),
	);
}
/// $C33229
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTStage3Gorgeous4;
shared static this() {
	actionScriptTStage3Gorgeous4 = initializeScript!actionScriptTStage3Gorgeous4(
		SET_X(4720),
		SET_Y(5728),
		SHORTJUMP("actionScriptTStage3Lucky2.ENTRY2"),
	);
}
/// $C33232
immutable ubyte[20 + 4 * ScriptPointer.sizeof] actionScriptTStage3Lucky5;
shared static this() {
	actionScriptTStage3Lucky5 = initializeScript!actionScriptTStage3Lucky5(
		SET_X(4768),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		LOOP(3),
			SHORTCALL("unknownC333BB"),
		LOOP_END(),
		SET_X_VELOCITY(-45),
		SHORTCALL("unknownC333BB"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3324E
immutable ubyte[20 + 4 * ScriptPointer.sizeof] actionScriptTStage3Gorgeous5;
shared static this() {
	actionScriptTStage3Gorgeous5 = initializeScript!actionScriptTStage3Gorgeous5(
		SET_X(4704),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		LOOP(7),
			SHORTCALL("unknownC333CC"),
		LOOP_END(),
		SET_X_VELOCITY(45),
		SHORTCALL("unknownC333CC"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3326A
immutable ubyte[19 + 3 * ScriptPointer.sizeof] actionScriptTStage3Lucky6;
shared static this() {
	actionScriptTStage3Lucky6 = initializeScript!actionScriptTStage3Lucky6(
		SET_X(4752),
		SET_Y(5728),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		SET_X_VELOCITY(-45),
		SET_Y_VELOCITY(45),
		SHORTCALL("unknownC333BB"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C33283
immutable ubyte[16 + 3 * ScriptPointer.sizeof] actionScriptTStage3Lucky7;
shared static this() {
	actionScriptTStage3Lucky7 = initializeScript!actionScriptTStage3Lucky7(
		SET_X(4736),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		SET_X_VELOCITY(-45),
		SHORTCALL("unknownC333BB"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C33299
immutable ubyte[22 + 9 * ScriptPointer.sizeof] actionScriptTStage3Lucky8;
shared static this() {
	actionScriptTStage3Lucky8 = initializeScript!actionScriptTStage3Lucky8(
		SET_X(4704),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		SHORTCALL("unknownC333BB"),
		SHORTCALL("unknownC333BB"),
		SHORTCALL("unknownC333BB"),
		SHORTCALL("unknownC333BB"),
		SHORTCALL("unknownC333BB"),
		SET_X_VELOCITY(45),
		SHORTCALL("unknownC333CC"),
		SHORTCALL("unknownC333CC"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C332C1
immutable ubyte[14 + 4 * ScriptPointer.sizeof] actionScriptTStage3Lucky9;
shared static this() {
	actionScriptTStage3Lucky9 = initializeScript!actionScriptTStage3Lucky9(
		SET_X(4720),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		SHORTCALL("unknownC333BB"),
		SHORTCALL("unknownC333BB"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C332D7
immutable ubyte[23 + 6 * ScriptPointer.sizeof] actionScriptTStage3Lucky10;
shared static this() {
	actionScriptTStage3Lucky10 = initializeScript!actionScriptTStage3Lucky10(
		SET_X(4720),
		SET_Y(5728),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		SET_Y_VELOCITY(-45),
		SHORTCALL("unknownC333BB"),
		SET_VELOCITIES_ZERO(),
		SHORTCALL("unknownC333BB"),
		SET_X_VELOCITY(45),
		SHORTCALL("unknownC333BB"),
		SHORTCALL("unknownC333BB"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C332FA
immutable ubyte[16 + 3 * ScriptPointer.sizeof] actionScriptTStage3Gorgeous6;
shared static this() {
	actionScriptTStage3Gorgeous6 = initializeScript!actionScriptTStage3Gorgeous6(
		SET_X(4736),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		SET_X_VELOCITY(45),
		SHORTCALL("unknownC333BB"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C33310
immutable ubyte[18 + 5 * ScriptPointer.sizeof] actionScriptTStage3Gorgeous7;
shared static this() {
	actionScriptTStage3Gorgeous7 = initializeScript!actionScriptTStage3Gorgeous7(
		SET_X(4768),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		SHORTCALL("unknownC333BB"),
		SET_X_VELOCITY(-45),
		SHORTCALL("unknownC333BB"),
		SHORTCALL("unknownC333BB"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3332C
immutable ubyte[14 + 4 * ScriptPointer.sizeof] actionScriptTStage3Gorgeous8;
shared static this() {
	actionScriptTStage3Gorgeous8 = initializeScript!actionScriptTStage3Gorgeous8(
		SET_X(4752),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		SHORTCALL("unknownC333BB"),
		SHORTCALL("unknownC333BB"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C33342
immutable ubyte[16 + 6 * ScriptPointer.sizeof] actionScriptTStage3Gorgeous9;
shared static this() {
	actionScriptTStage3Gorgeous9 = initializeScript!actionScriptTStage3Gorgeous9(
		SET_X(4752),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		SHORTCALL("unknownC333BB"),
		SHORTCALL("unknownC333BB"),
		SHORTCALL("unknownC333BB"),
		SHORTCALL("unknownC333BB"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3335E
immutable ubyte[23 + 4 * ScriptPointer.sizeof] actionScriptTStage3Gorgeous10;
shared static this() {
	actionScriptTStage3Gorgeous10 = initializeScript!actionScriptTStage3Gorgeous10(
		SET_X(4752),
		SET_Y(5728),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		SET_Y_VELOCITY(-45),
		SHORTCALL("unknownC333BB"),
		SET_X_VELOCITY(-91),
		SET_Y_VELOCITY(0),
		SHORTCALL("unknownC333BB"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3337D
immutable ubyte[10 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTStage3Thank3;
shared static this() {
	actionScriptTStage3Thank3 = initializeScript!actionScriptTStage3Thank3(
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v4, 40),
		DARKEN_SCREEN_2_WINDOW(),
	LABEL("ENTRY2"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C3338F
immutable ubyte[6 + 2 * ScriptPointer.sizeof] actionScriptTStage3OK3Nice3Groove3HighHat3;
shared static this() {
	actionScriptTStage3OK3Nice3Groove3HighHat3 = initializeScript!actionScriptTStage3OK3Nice3Groove3HighHat3(
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v4, 40),
		SHORTJUMP("actionScriptTStage3Thank3.ENTRY2"),
	);
}
/// $C33399
immutable ubyte[11 + 2 * (const(void)*).sizeof] unknownC33399;
shared static this() {
	unknownC33399 = initializeScript!unknownC33399(
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(22),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(23),
		SHORT_RETURN(),
	);
}
/// $C333AA
immutable ubyte[11 + 2 * (const(void)*).sizeof] unknownC333AA;
shared static this() {
	unknownC333AA = initializeScript!unknownC333AA(
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(22),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(23),
		SHORT_RETURN(),
	);
}
/// $C333BB
immutable ubyte[11 + 2 * (const(void)*).sizeof] unknownC333BB;
shared static this() {
	unknownC333BB = initializeScript!unknownC333BB(
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(22),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(23),
		SHORT_RETURN(),
	);
}
/// $C333CC
immutable ubyte[11 + 2 * (const(void)*).sizeof] unknownC333CC;
shared static this() {
	unknownC333CC = initializeScript!unknownC333CC(
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(22),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(23),
		SHORT_RETURN(),
	);
}
/// $C333DD
immutable ubyte[43 + 8 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC333DD;
shared static this() {
	unknownC333DD = initializeScript!unknownC333DD(
		SHORTCALL("unknownC33399"),
		SHORTCALL("unknownC33399"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(22),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(12),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(11),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(11),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(11),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(11),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(12),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(11),
		SHORT_RETURN(),
	);
}
/// $C33424
immutable ubyte[109 + 2 * (const(void)*).sizeof + 28 * ScriptPointer.sizeof] actionScriptTStage3Venus;
shared static this() {
	actionScriptTStage3Venus = initializeScript!actionScriptTStage3Venus(
		PAUSE(23),
		SET_X(4632),
		SET_Y(5728),
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v4, 10),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_X_VELOCITY(397),
		SET_Y_VELOCITY(30),
		PAUSE(67),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(90),
		SHORTCALL("unknownC33399"),
		SHORTCALL("unknownC33399"),
		SHORTCALL("unknownC33399"),
		SET_X_VELOCITY(45),
		SHORTCALL("unknownC33399"),
		SET_X_VELOCITY(45),
		SET_Y_VELOCITY(45),
		SHORTCALL("unknownC333CC"),
		SET_X_VELOCITY(45),
		SET_Y_VELOCITY(-45),
		SHORTCALL("unknownC333AA"),
		SET_X_VELOCITY(45),
		SET_Y_VELOCITY(0),
		SHORTCALL("unknownC333BB"),
		SET_VELOCITIES_ZERO(),
		SHORTCALL("unknownC33399"),
		SHORTCALL("unknownC33399"),
		SHORTCALL("unknownC33399"),
		SHORTCALL("unknownC33399"),
		SET_X_VELOCITY(-45),
		SHORTCALL("unknownC33399"),
		SET_X_VELOCITY(-45),
		SET_Y_VELOCITY(-45),
		SHORTCALL("unknownC333BB"),
		SET_X_VELOCITY(-45),
		SET_Y_VELOCITY(45),
		SHORTCALL("unknownC33399"),
		SET_X_VELOCITY(-45),
		SET_Y_VELOCITY(0),
		SHORTCALL("unknownC333CC"),
		SET_VELOCITIES_ZERO(),
		SHORTCALL("unknownC33399"),
		SHORTCALL("unknownC333DD"),
		SHORTCALL("unknownC333DD"),
		SHORTCALL("unknownC33399"),
		SHORTCALL("unknownC33399"),
		SHORTCALL("unknownC33399"),
		SHORTCALL("unknownC333BB"),
		SET_Y_VELOCITY(-45),
		SHORTCALL("unknownC333BB"),
		SHORTCALL("unknownC33399"),
		SET_VELOCITIES_ZERO(),
		SHORTCALL("unknownC33399"),
		SHORTCALL("unknownC33399"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C334CF
immutable ubyte[35 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTStage3TBus;
shared static this() {
	actionScriptTStage3TBus = initializeScript!actionScriptTStage3TBus(
		SET_X(4624),
		SET_Y(5740),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(121),
		PAUSE(236),
		SET_VELOCITIES_ZERO(),
		PAUSE(67),
		LOOP(32),
			SET_X_VELOCITY_RELATIVE(24),
			PAUSE(2),
		LOOP_END(),
		PAUSE(120),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C334FF
immutable ubyte[29 + 6 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptVStage1Scr1;
shared static this() {
	actionScriptVStage1Scr1 = initializeScript!actionScriptVStage1Scr1(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptCentreScreenOnEntityCallback),
		SET_VAR(ActionScriptVars.v0, -15),
		C474A8(),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 4736),
		SET_VAR(ActionScriptVars.v7, 5744),
		SHORTCALL("actionScriptMoveToLocation"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_VSTAGE1_A"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C33535
immutable ubyte[15 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptVStage1VenusStill;
shared static this() {
	actionScriptVStage1VenusStill = initializeScript!actionScriptVStage1VenusStill(
		SET_X(4736),
		SET_Y(5736),
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		HALT(),
	);
}
/// $C33549
immutable ubyte[27 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC33549;
shared static this() {
	unknownC33549 = initializeScript!unknownC33549(
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(2),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(4),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(2),
		SET_ANIMATION(255),
		PAUSE(45),
		CHOOSE_RANDOM(0, 12),
		WRITE_TEMPVAR_WAITTIMER(),
		SHORTJUMP("unknownC33549"),
	);
}
/// $C33572
immutable ubyte[26 + 1 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptVStage1VenusLight1;
shared static this() {
	actionScriptVStage1VenusLight1 = initializeScript!actionScriptVStage1VenusLight1(
		SET_PRIORITY(0),
		SET_X(4730),
		SET_Y(5728),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		START_TASK("unknownC33549"),
	LABEL("UNKNOWN0"),
		MOVE_TO_SPRITE(OverworldSprite.venus),
		SET_X_RELATIVE(-6),
		SET_Y_RELATIVE(-8),
		PAUSE(1),
		SHORTJUMP("actionScriptVStage1VenusLight1.UNKNOWN0"),
	);
}
/// $C33595
immutable ubyte[23 + 1 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptVStage1VenusLight2;
shared static this() {
	actionScriptVStage1VenusLight2 = initializeScript!actionScriptVStage1VenusLight2(
		SET_PRIORITY(0),
		SET_X(4739),
		SET_Y(5736),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		START_TASK("unknownC33549"),
	LABEL("UNKNOWN0"),
		MOVE_TO_SPRITE(OverworldSprite.venus),
		SET_X_RELATIVE(3),
		PAUSE(1),
		SHORTJUMP("actionScriptVStage1VenusLight2.UNKNOWN0"),
	);
}
/// $C335B5
immutable ubyte[667 + 100 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptVStage1Venus;
shared static this() {
	actionScriptVStage1Venus = initializeScript!actionScriptVStage1Venus(
		SET_X(4736),
		SET_Y(5736),
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v4, 0),
		DARKEN_SCREEN_2_WINDOW(),
		SET_VAR(ActionScriptVars.v0, 0),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(94),
		PAUSE(94),
		SET_TICK_CALLBACK(&actionScriptEnableSpotlight1),
		YIELD_TO_TEXT(),
		PAUSE(94),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(94),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(94),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(94),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(94),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(94),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(94),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(94),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(94),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(94),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(94),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(63),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(31),
		SET_X_VELOCITY(33),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(32),
		PAUSE(31),
		SET_X_VELOCITY(33),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(32),
		PAUSE(31),
		SET_X_VELOCITY(33),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(32),
		PAUSE(31),
		SET_X_VELOCITY(33),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(32),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(94),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(94),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(94),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(63),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(31),
		YIELD_TO_TEXT(),
		SET_X_VELOCITY(-33),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(63),
		SET_X_VELOCITY(-33),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(63),
		SET_X_VELOCITY(-33),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(63),
		SET_X_VELOCITY(-33),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(32),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_Y_VELOCITY(33),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(63),
		SET_Y_VELOCITY(33),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		PAUSE(63),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(94),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(63),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(31),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(94),
		SET_Y_VELOCITY(-33),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		PAUSE(63),
		SET_Y_VELOCITY(-33),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		PAUSE(63),
		SET_Y_VELOCITY(-33),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		PAUSE(63),
		SET_Y_VELOCITY(-33),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		PAUSE(63),
		SET_Y_VELOCITY(-33),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		PAUSE(63),
		SET_Y_VELOCITY(-33),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		PAUSE(63),
		SET_Y_VELOCITY(-33),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		PAUSE(63),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(94),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(94),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(94),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(63),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(31),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(94),
		SET_Y_VELOCITY(33),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		PAUSE(63),
		SET_Y_VELOCITY(33),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		PAUSE(63),
		SET_Y_VELOCITY(33),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		PAUSE(63),
		YIELD_TO_TEXT(),
		SET_Y_VELOCITY(33),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		PAUSE(63),
		SET_Y_VELOCITY(33),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		PAUSE(47),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(16),
		YIELD_TO_TEXT(),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		SET_X_VELOCITY(-33),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(47),
		SET_X_VELOCITY(-33),
		PAUSE(16),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(15),
		SET_X_VELOCITY(-32),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(16),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(16),
		SET_X_VELOCITY(-33),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(16),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(15),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(16),
		PAUSE(47),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(16),
		YIELD_TO_TEXT(),
		SET_X_VELOCITY(-130),
		SET_VAR(ActionScriptVars.v4, 12),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(63),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_VELOCITIES_ZERO(),
		PAUSE(15),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(16),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(94),
		PAUSE(94),
		PAUSE(94),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		SET_X_VELOCITY(33),
		PAUSE(31),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(63),
		LOOP(11),
			SET_ANIMATION(1),
			UPDATE_ENTITY_SPRITE_FRAME1(),
			SET_X_VELOCITY(33),
			PAUSE(31),
			SET_VELOCITIES_ZERO(),
			SET_ANIMATION(0),
			UPDATE_ENTITY_SPRITE_FRAME0(),
			PAUSE(63),
		LOOP_END(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(94),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(94),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(63),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(31),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(94),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(63),
		LOOP(8),
			SET_ANIMATION(1),
			UPDATE_ENTITY_SPRITE_FRAME1(),
			SET_Y_VELOCITY(-33),
			PAUSE(31),
			SET_VELOCITIES_ZERO(),
			SET_ANIMATION(0),
			UPDATE_ENTITY_SPRITE_FRAME0(),
			PAUSE(63),
		LOOP_END(),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(31),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(63),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(94),
		DISABLE_SPOT_LIGHT_1(),
		CLEAR_TICK_CALLBACK(),
		YIELD_TO_TEXT(),
		PAUSE(188),
		SET_VAR(ActionScriptVars.v4, 20),
		SET_X_VELOCITY(-64),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(180),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C33980
immutable ubyte[62 + 4 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptVStage1KomoritaCross;
shared static this() {
	actionScriptVStage1KomoritaCross = initializeScript!actionScriptVStage1KomoritaCross(
		SET_X(4584),
		SET_Y(5792),
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v4, 20),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 4736),
		SET_VAR(ActionScriptVars.v7, 5792),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(80),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(20),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(20),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(180),
		SET_VAR(ActionScriptVars.v4, 20),
		SET_VAR(ActionScriptVars.v6, 4872),
		SET_VAR(ActionScriptVars.v7, 5792),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C339D2
immutable ubyte[133 + 15 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptVStage1KomoritaAppear;
shared static this() {
	actionScriptVStage1KomoritaAppear = initializeScript!actionScriptVStage1KomoritaAppear(
		SET_X(4872),
		SET_Y(5808),
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v4, 20),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		SET_X_VELOCITY(-162),
		SET_Y_VELOCITY(-195),
		PAUSE(63),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(15),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(16),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(15),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(16),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		SET_X_VELOCITY(-65),
		SET_Y_VELOCITY(-65),
		PAUSE(63),
		SET_VELOCITIES_ZERO(),
		PAUSE(31),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(16),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(16),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(15),
		SET_X_VELOCITY(-66),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(16),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(15),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(16),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(16),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(16),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(15),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(31),
		SET_VAR(ActionScriptVars.v4, 10),
		PAUSE(16),
		SET_X_VELOCITY(-113),
		PAUSE(126),
		SET_X_VELOCITY(244),
		SET_Y_VELOCITY(-37),
		PAUSE(109),
		SET_VELOCITIES_ZERO(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C33A88
immutable ubyte[35 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptVStage1BodyguardR;
shared static this() {
	actionScriptVStage1BodyguardR = initializeScript!actionScriptVStage1BodyguardR(
		SET_X(4840),
		SET_Y(5728),
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v4, 20),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_X_VELOCITY(-239),
		SET_Y_VELOCITY(43),
		PAUSE(94),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_X_VELOCITY(239),
		SET_Y_VELOCITY(-43),
		PAUSE(94),
		SET_VELOCITIES_ZERO(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C33AB5
immutable ubyte[43 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptVStage1BodyguardL;
shared static this() {
	actionScriptVStage1BodyguardL = initializeScript!actionScriptVStage1BodyguardL(
		SET_X(4632),
		SET_Y(5728),
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v4, 20),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_X_VELOCITY(297),
		PAUSE(62),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_X_VELOCITY(128),
		SET_Y_VELOCITY(128),
		PAUSE(32),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_X_VELOCITY(245),
		SET_Y_VELOCITY(-32),
		PAUSE(125),
		SET_VELOCITIES_ZERO(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C33AED
immutable ubyte[20 + 2 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptVStage1Scr2;
shared static this() {
	actionScriptVStage1Scr2 = initializeScript!actionScriptVStage1Scr2(
		SET_X(4736),
		SET_Y(5744),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v1, 20),
		SHORTCALL("unknownC31E2D"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_VSTAGE1_B"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C33B0F
immutable ubyte[55 + 15 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptPhotographer;
shared static this() {
	actionScriptPhotographer = initializeScript!actionScriptPhotographer(
		SET_PRIORITY(0),
		MOVE_TO_TRAVELLING_PHOTOGRAPHER_SPOT(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3DIgnoreSurface),
		SET_ANIMATION(0),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		START_TASK("actionScriptPhotographerTask"),
		SET_VELOCITIES_ZERO(),
		SET_Z(168),
		SET_Z_VELOCITY(-384),
		PAUSE(26),
		YIELD_TO_TEXT(),
		PAUSE(85),
		SET_VELOCITIES_ZERO(),
		END_LAST_TASK(),
		PAUSE(30),
		GET_POSITION_OF_PARTY_MEMBER(255),
		GET_ANGLE_TO_DESTINATION(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(1),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		START_TASK("actionScriptPhotographerTask"),
		SET_Z_VELOCITY(512),
		PAUSE(64),
		YIELD_TO_TEXT(),
		PAUSE(20),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C33B77
immutable ubyte[9 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptPhotographerTask;
shared static this() {
	actionScriptPhotographerTask = initializeScript!actionScriptPhotographerTask(
		WRITE_WORD_TEMPVAR(2),
		GET_DIRECTION_ROTATED_CLOCKWISE(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(3),
		SHORTJUMP("actionScriptPhotographerTask"),
	);
}
/// $C33B8B
immutable ubyte[8 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptPhotographerS;
shared static this() {
	actionScriptPhotographerS = initializeScript!actionScriptPhotographerS(
		MOVE_TO_TRAVELLING_PHOTOGRAPHER_SPOT(),
		SHORTCALL("unknownC3AA38"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C33B9E
immutable ubyte[9 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptNesPeace;
shared static this() {
	actionScriptNesPeace = initializeScript!actionScriptNesPeace(
		MOVE_TO_PARTY_MEMBER(PartyMember.ness),
		SHORTCALL("unknownC3AA38"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C33BB2
immutable ubyte[3 + 1 * ScriptPointer.sizeof] actionScriptNesPeaceSaikyou;
shared static this() {
	actionScriptNesPeaceSaikyou = initializeScript!actionScriptNesPeaceSaikyou(
		SET_PRIORITY(0),
		SHORTJUMP("actionScriptNesPeace"),
	);
}
/// $C33BB7
immutable ubyte[46 + 7 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptCameraEye;
shared static this() {
	actionScriptCameraEye = initializeScript!actionScriptCameraEye(
		SET_ANIMATION(255),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_VAR(ActionScriptVars.v0, 1),
		LOAD_FULLSCREEN_ANIMATION(),
		PAUSE(5),
		PLAY_SFX(Sfx.unknown0D),
		SET_VAR(ActionScriptVars.v1, 5),
		LOOP(6),
			UPDATE_FULLSCREEN_ANIMATION(),
			PAUSE(3),
			ADD(ActionScriptVars.v1, -1),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v1, 0),
		LOOP(5),
			UPDATE_FULLSCREEN_ANIMATION(),
			PAUSE(3),
			ADD(ActionScriptVars.v1, 1),
		LOOP_END(),
		RESTORE_MAP_RENDERING(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C33BFB
immutable ubyte[17 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC33BFB;
shared static this() {
	unknownC33BFB = initializeScript!unknownC33BFB(
		SET_ANIMATION(255),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		LOAD_FULLSCREEN_ANIMATION(),
		SET_VAR(ActionScriptVars.v1, 0),
	LABEL("UNKNOWN0"),
		UPDATE_FULLSCREEN_ANIMATION(),
		JUMP_IF_FALSE("unknownC33C18"),
		WRITE_TEMPVAR_WAITTIMER(),
		ADD(ActionScriptVars.v1, 1),
		SHORTJUMP("unknownC33BFB.UNKNOWN0"),
	);
}
/// $C33C18
immutable ubyte[2 + 1 * (const(void)*).sizeof] unknownC33C18;
shared static this() {
	unknownC33C18 = initializeScript!unknownC33C18(
		RESTORE_MAP_RENDERING(),
		SHORT_RETURN(),
	);
}
/// $C33C1D
immutable ubyte[14 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC33C1D;
shared static this() {
	unknownC33C1D = initializeScript!unknownC33C1D(
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v2),
		LOOP_TEMPVAR(),
			UPDATE_FULLSCREEN_ANIMATION(),
			BREAK_IF_FALSE("unknownC33C1D.UNKNOWN0"),
			WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v3),
			ADD(ActionScriptVars.v1, 1),
		LOOP_END(),
	LABEL("UNKNOWN0"),
		SHORT_RETURN(),
	);
}
/// $C33C30
immutable ubyte[33 + 8 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript467;
shared static this() {
	actionScript467 = initializeScript!actionScript467(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		LOOP(10),
			PAUSE(3),
			SET_ANIMATION(1),
			UPDATE_ENTITY_SPRITE_FRAME1(),
			PAUSE(3),
			SET_ANIMATION(0),
			UPDATE_ENTITY_SPRITE_FRAME0(),
			IS_ENTITY_ONSCREEN(),
			JUMP_IF_FALSE("actionScriptTerminate"),
		LOOP_END(),
		CHOOSE_RANDOM(Direction.up, Direction.right, Direction.down, Direction.left),
		SET_DIRECTION(),
		SHORTJUMP("actionScript467.UNKNOWN0"),
	);
}
/// $C33C6C
immutable ubyte[78 + 6 * (const(void)*).sizeof + 7 * ScriptPointer.sizeof] actionScriptTeleportFail;
shared static this() {
	actionScriptTeleportFail = initializeScript!actionScriptTeleportFail(
		SHORTCALL("unknownC3AA38"),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.up),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(16),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 6232),
		SET_VAR(ActionScriptVars.v7, 7112),
		SHORTCALL("actionScriptMoveToLocation"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v0, 0),
		START_TASK("unknownC33DBE"),
		SET_VAR(ActionScriptVars.v5, 8),
		SET_VAR(ActionScriptVars.v6, 6080),
		SET_VAR(ActionScriptVars.v7, 7112),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6080),
		SET_VAR(ActionScriptVars.v7, 7168),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6232),
		SET_VAR(ActionScriptVars.v7, 7168),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		SET_VELOCITIES_ZERO(),
		SET_X(6232),
		SET_Y(7168),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C33CDA
immutable ubyte[171 + 9 * (const(void)*).sizeof + 15 * ScriptPointer.sizeof] actionScriptTeleportSuccess;
shared static this() {
	actionScriptTeleportSuccess = initializeScript!actionScriptTeleportSuccess(
		SHORTCALL("unknownC3AA38"),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 6176),
		SET_VAR(ActionScriptVars.v7, 7144),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		WRITE_WORD_TEMPVAR(Direction.up),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(16),
		SET_VAR(ActionScriptVars.v6, 6232),
		SET_VAR(ActionScriptVars.v7, 7112),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(60),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_VAR(ActionScriptVars.v0, 0),
		START_TASK("unknownC33DBE"),
		SET_VAR(ActionScriptVars.v5, 8),
	LABEL("UNKNOWN0"),
		SET_VAR(ActionScriptVars.v6, 6080),
		SET_VAR(ActionScriptVars.v7, 7112),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6080),
		SET_VAR(ActionScriptVars.v7, 7168),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6232),
		SET_VAR(ActionScriptVars.v7, 7168),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6232),
		SET_VAR(ActionScriptVars.v7, 7112),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		JUMP_IF_FALSE("actionScriptTeleportSuccess.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.up),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(28),
		SET_VELOCITIES_ZERO(),
		PAUSE(120),
		SET_X(6096),
		SET_Y(7056),
		SET_MOVEMENT_SPEED(768),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(24),
		SET_MOVEMENT_SPEED(512),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(16),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(8),
		SET_VELOCITIES_ZERO(),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v6, 6176),
		SET_VAR(ActionScriptVars.v7, 7144),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_X(6176),
		SET_Y(7144),
		CLEAR_TICK_CALLBACK(),
		SET_VAR(ActionScriptVars.v4, 1),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C33DBE
immutable ubyte[16 + 2 * (const(void)*).sizeof] unknownC33DBE;
shared static this() {
	unknownC33DBE = initializeScript!unknownC33DBE(
		LOOP(28),
			PAUSE(10),
			GET_MOVEMENT_SPEED(),
			ADD_TEMPVAR(64),
			SET_MOVEMENT_SPEED(),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v0, 1),
		END_TASK(),
	);
}
/// $C33DD4
immutable ubyte[61 + 7 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptBMonkeyTassi1A;
shared static this() {
	actionScriptBMonkeyTassi1A = initializeScript!actionScriptBMonkeyTassi1A(
		UNFREEZE_TESSIE_LEAVES(),
		SET_X_RELATIVE(7),
		SHORTCALL("unknownC3AB26"),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_Z(0),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_Z_VELOCITY(128),
		PAUSE(64),
		SET_VAR(ActionScriptVars.v0, 0),
		START_TASK("actionScriptBMonkeyTassi1ATask"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 600),
		SET_VAR(ActionScriptVars.v7, 3486),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		MOVE_TOWARDS_DESTINATION_DONT_CHANGE_DIRECTION(),
		JUMP_IF_FALSE("actionScriptBMonkeyTassi1A.UNKNOWN0"),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		JUMP_IF_FALSE("actionScriptBMonkeyTassi1A.UNKNOWN1"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C33E30
immutable ubyte[18] actionScriptBMonkeyTassi1ATask;
shared static this() {
	actionScriptBMonkeyTassi1ATask = initializeScript!actionScriptBMonkeyTassi1ATask(
		SET_Z_VELOCITY(128),
		PAUSE(48),
		SET_Z_VELOCITY(-128),
		PAUSE(48),
		SET_Z_VELOCITY(0),
		SET_VAR(ActionScriptVars.v0, 1),
		END_TASK(),
	);
}
/// $C33E42
immutable ubyte[60 + 16 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptBMonkeyTassi1B;
shared static this() {
	actionScriptBMonkeyTassi1B = initializeScript!actionScriptBMonkeyTassi1B(
		SHORTCALL("unknownC3AB26"),
		SET_VAR(ActionScriptVars.v4, 1),
		SET_Z(28),
		START_TASK("actionScriptBMonkeyTassi1BTask"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_Z_VELOCITY(32),
		PAUSE(128),
		PAUSE(128),
		SET_Z_VELOCITY(0),
		PAUSE(1),
		GET_POSITION_OF_PARTY_MEMBER(255),
		WRITE_WORD_TEMPVAR(-1),
		SET_DIRECTION(),
	LABEL("UNKNOWN0"),
		GET_ANGLE_TO_DESTINATION(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		FACE_DIRECTION(),
		PAUSE(3),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_FALSE("actionScriptBMonkeyTassi1B.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_TRUE("actionScriptBMonkeyTassi1B.UNKNOWN1"),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
	LABEL("UNKNOWN2"),
		GET_ANGLE_TO_DESTINATION(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		FACE_DIRECTION(),
		PAUSE(3),
		SHORTJUMP("actionScriptBMonkeyTassi1B.UNKNOWN2"),
	);
}
/// $C33EB6
immutable ubyte[9 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptBMonkeyTassi1BTask;
shared static this() {
	actionScriptBMonkeyTassi1BTask = initializeScript!actionScriptBMonkeyTassi1BTask(
		MOVE_TO_SPRITE(OverworldSprite.tessie),
		SET_Y_RELATIVE(-2),
		PAUSE(1),
		SHORTJUMP("actionScriptBMonkeyTassi1BTask"),
	);
}
/// $C33EC4
immutable ubyte[37 + 4 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptBMonkeyTassi1C;
shared static this() {
	actionScriptBMonkeyTassi1C = initializeScript!actionScriptBMonkeyTassi1C(
		SHORTCALL("unknownC3AB26"),
		SET_VAR(ActionScriptVars.v4, 1),
		SET_VAR(ActionScriptVars.v0, 0),
		START_TASK("actionScriptBMonkeyTassi1CTask"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		GET_POSITION_OF_PARTY_MEMBER(9),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		MOVE_TOWARDS_DESTINATION_DONT_CHANGE_DIRECTION(),
		JUMP_IF_FALSE("actionScriptBMonkeyTassi1C.UNKNOWN0"),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		JUMP_IF_FALSE("actionScriptBMonkeyTassi1C.UNKNOWN1"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C33EFF
immutable ubyte[13] actionScriptBMonkeyTassi1CTask;
shared static this() {
	actionScriptBMonkeyTassi1CTask = initializeScript!actionScriptBMonkeyTassi1CTask(
		SET_Z_VELOCITY(-512),
		PAUSE(30),
		SET_Z_VELOCITY(0),
		SET_VAR(ActionScriptVars.v0, 1),
		END_TASK(),
	);
}
/// $C33F0C
immutable ubyte[202 + 19 * (const(void)*).sizeof + 14 * string.sizeof] actionScriptTassi1;
shared static this() {
	actionScriptTassi1 = initializeScript!actionScriptTassi1(
		SET_X(600),
		SET_Y(3488),
		SET_Z(-64),
		SHORTCALL("unknownC3AB26"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_Z_VELOCITY(32),
		PAUSE(128),
		PAUSE(128),
		YIELD_TO_TEXT(),
		PAUSE(128),
		PAUSE(128),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_MOVEMENT_SPEED(76),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 632),
		SET_VAR(ActionScriptVars.v7, 3536),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 712),
		SET_VAR(ActionScriptVars.v7, 3520),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 712),
		SET_VAR(ActionScriptVars.v7, 3464),
		SHORTCALL("actionScriptMoveToLocation"),
		CLEAR_TICK_CALLBACK(),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_MOVEMENT_SPEED(96),
		SET_VAR(ActionScriptVars.v6, 720),
		SET_VAR(ActionScriptVars.v7, 3528),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 656),
		SET_VAR(ActionScriptVars.v7, 3616),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 640),
		SET_VAR(ActionScriptVars.v7, 3792),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 728),
		SET_VAR(ActionScriptVars.v7, 4072),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 832),
		SET_VAR(ActionScriptVars.v7, 4096),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 952),
		SET_VAR(ActionScriptVars.v7, 4200),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 936),
		SET_VAR(ActionScriptVars.v7, 4264),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 928),
		SET_VAR(ActionScriptVars.v7, 4288),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		MOVE_PARTY_TO_LEADER_POSITION(),
		YIELD_TO_TEXT(),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.winsTascoAcross),
		JUMP_IF_TRUE("actionScriptTassi1.UNKNOWN0"),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_X_VELOCITY(53),
		SET_Y_VELOCITY(32),
		PAUSE(255),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_MOVEMENT_SPEED(16),
		WRITE_WORD_TEMPVAR(Direction.downRight),
		SHORTCALL("actionScriptMoveInDirection"),
		SET_Z_VELOCITY(-64),
		PAUSE(128),
		PAUSE(128),
		SET_VELOCITIES_ZERO(),
		PAUSE(60),
		YIELD_TO_TEXT(),
		SET_VELOCITIES_ZERO(),
		HALT(),
	LABEL("UNKNOWN0"),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_X_VELOCITY(53),
		SET_Y_VELOCITY(32),
		PAUSE(255),
		PAUSE(255),
		YIELD_TO_TEXT(),
		PAUSE(1),
		HALT(),
	);
}
/// $C34029
immutable ubyte[70 + 12 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptRideTassi1;
shared static this() {
	actionScriptRideTassi1 = initializeScript!actionScriptRideTassi1(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_SPRITE_DESTINATION(OverworldSprite.tessie),
		ADD(ActionScriptVars.v6, -8),
		ADD(ActionScriptVars.v7, -22),
		SHORTCALL("actionScriptMoveToLocation"),
		GET_EVENT_FLAG(EventFlag.winsTascoAcross),
		JUMP_IF_FALSE("actionScriptRideTassi1.UNKNOWN0"),
		SET_VELOCITIES_ZERO(),
		GET_PARTY_COUNT(),
		LOOP_TEMPVAR(),
			LOOP(12),
				SET_X_VELOCITY(1),
				PAUSE(1),
				SET_X_VELOCITY(-1),
				PAUSE(1),
			LOOP_END(),
		LOOP_END(),
		SET_VELOCITIES_ZERO(),
	LABEL("UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		PAUSE(2),
		YIELD_TO_TEXT(),
		PREPARE_PARTY_FOR_TESSIE_TRIP(),
	LABEL("UNKNOWN1"),
		MOVE_TO_SPRITE(OverworldSprite.tessie),
		SET_X_RELATIVE(-8),
		SET_Y_RELATIVE(-22),
		PAUSE(1),
		SHORTJUMP("actionScriptRideTassi1.UNKNOWN1"),
	);
}
/// $C34097
immutable ubyte[33 + 6 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptOutTassi1;
shared static this() {
	actionScriptOutTassi1 = initializeScript!actionScriptOutTassi1(
		PREPARE_PARTY_FOR_TESSIE_TRIP_END(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 864),
		SET_VAR(ActionScriptVars.v7, 4272),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 864),
		SET_VAR(ActionScriptVars.v7, 4240),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C340CE
immutable ubyte[42 + 4 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptUzu1;
shared static this() {
	actionScriptUzu1 = initializeScript!actionScriptUzu1(
		SET_X(600),
		SET_Y(3480),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		START_TASK("unknownC3A1F3"),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v0, 672),
		SET_VAR(ActionScriptVars.v1, 3440),
		SET_VAR(ActionScriptVars.v2, 16),
		SET_VAR(ActionScriptVars.v3, 16),
	LABEL("UNKNOWN0"),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.bMonkeyTass),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		WRITE_WORD_TEMPVAR(0),
		SET_EVENT_FLAG(EventFlag.bMonkeyTass),
		SHORTJUMP("actionScriptUzu1.UNKNOWN0"),
	);
}
/// $C3410B
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptUzu2;
shared static this() {
	actionScriptUzu2 = initializeScript!actionScriptUzu2(
		SET_X(600),
		SET_Y(3496),
		SHORTJUMP("actionScriptPeopleWalk0"),
	);
}
/// $C34114
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTacyMask1;
shared static this() {
	actionScriptTacyMask1 = initializeScript!actionScriptTacyMask1(
		SET_X(600),
		SET_Y(3504),
		SHORTJUMP("actionScriptPeopleWalk0"),
	);
}
/// $C3411D
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTacyMask2;
shared static this() {
	actionScriptTacyMask2 = initializeScript!actionScriptTacyMask2(
		SET_X(600),
		SET_Y(3520),
		SHORTJUMP("actionScriptPeopleWalk0"),
	);
}
/// $C34126
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTacyMask3;
shared static this() {
	actionScriptTacyMask3 = initializeScript!actionScriptTacyMask3(
		SET_X(600),
		SET_Y(3536),
		SHORTJUMP("actionScriptPeopleWalk0"),
	);
}
/// $C3412F
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptTacyMask4;
shared static this() {
	actionScriptTacyMask4 = initializeScript!actionScriptTacyMask4(
		SET_X(600),
		SET_Y(3552),
		SHORTJUMP("actionScriptPeopleWalk0"),
	);
}
/// $C34138
immutable ubyte[21 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptUzu1TassiBye;
shared static this() {
	actionScriptUzu1TassiBye = initializeScript!actionScriptUzu1TassiBye(
		MOVE_TO_SPRITE(OverworldSprite.tessie),
		SET_Y_RELATIVE(-8),
		SHORTCALL("unknownC3AAAA"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		MOVE_TO_SPRITE(OverworldSprite.tessie),
		SET_Y_RELATIVE(-8),
		PAUSE(1),
		SHORTJUMP("actionScriptUzu1TassiBye.UNKNOWN0"),
	);
}
/// $C3415D
immutable ubyte[21 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptUzu2TassiBye;
shared static this() {
	actionScriptUzu2TassiBye = initializeScript!actionScriptUzu2TassiBye(
		MOVE_TO_SPRITE(OverworldSprite.tessie),
		SET_Y_RELATIVE(8),
		SHORTCALL("unknownC3AAAA"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		MOVE_TO_SPRITE(OverworldSprite.tessie),
		SET_Y_RELATIVE(8),
		PAUSE(1),
		SHORTJUMP("actionScriptUzu2TassiBye.UNKNOWN0"),
	);
}
/// $C34182
immutable ubyte[21 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptUzu3TassiByeU;
shared static this() {
	actionScriptUzu3TassiByeU = initializeScript!actionScriptUzu3TassiByeU(
		MOVE_TO_SPRITE(OverworldSprite.tessie),
		SET_Y_RELATIVE(16),
		SHORTCALL("unknownC3AAAA"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		MOVE_TO_SPRITE(OverworldSprite.tessie),
		SET_Y_RELATIVE(16),
		PAUSE(1),
		SHORTJUMP("actionScriptUzu3TassiByeU.UNKNOWN0"),
	);
}
/// $C341A7
immutable ubyte[21 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptUzu3TassiByeL;
shared static this() {
	actionScriptUzu3TassiByeL = initializeScript!actionScriptUzu3TassiByeL(
		MOVE_TO_SPRITE(OverworldSprite.tessie),
		SET_Y_RELATIVE(32),
		SHORTCALL("unknownC3AAAA"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		MOVE_TO_SPRITE(OverworldSprite.tessie),
		SET_Y_RELATIVE(32),
		PAUSE(1),
		SHORTJUMP("actionScriptUzu3TassiByeL.UNKNOWN0"),
	);
}
/// $C341CC
immutable ubyte[14 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptLeaf1;
shared static this() {
	actionScriptLeaf1 = initializeScript!actionScriptLeaf1(
		SET_PRIORITY(0),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		MOVE_TO_TOP_OF_SCREEN_RANDOM(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		START_TASK("actionScriptLeaf1Task"),
		SHORTCALL("actionScriptLeafCommon"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C341CC
immutable ubyte[60 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptLeafCommon;
shared static this() {
	actionScriptLeafCommon = initializeScript!actionScriptLeafCommon(
		MOVE_TO_TOP_OF_SCREEN_RANDOM(),
		SET_X_VELOCITY(-1024),
		SET_Y_VELOCITY(1024),
		GENERATE_RANDOM_LEAF_DELAY(),
		WRITE_TEMPVAR_WAITTIMER(),
		SET_X_VELOCITY(-768),
		SET_Y_VELOCITY(0),
		PAUSE(4),
		SET_Y_VELOCITY(-768),
		PAUSE(4),
		SET_X_VELOCITY(0),
		PAUSE(4),
		SET_X_VELOCITY(768),
		PAUSE(4),
		SET_Y_VELOCITY(0),
		PAUSE(4),
		SET_Y_VELOCITY(768),
		PAUSE(4),
		SET_X_VELOCITY(0),
		PAUSE(4),
		SET_X_VELOCITY(-1024),
		SET_Y_VELOCITY(1024),
		GENERATE_RANDOM_LEAF_DELAY(),
		WRITE_TEMPVAR_WAITTIMER(),
		GET_EVENT_FLAG(EventFlag.winsTassiEnter),
		JUMP_IF_TRUE("actionScriptLeafCommon"),
		SHORT_RETURN(),
	);
}
/// $C3
immutable ubyte[14 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptLeaf1Task;
shared static this() {
	actionScriptLeaf1Task = initializeScript!actionScriptLeaf1Task(
		PAUSE(8),
		WRITE_WORD_TEMPVAR(3120),
		TEST_Y_COORD_BELOW_LEADER(),
		JUMP_IF_FALSE("actionScriptLeaf1Task"),
		WRITE_WORD_TEMPVAR(0),
		SET_EVENT_FLAG(EventFlag.winsTassiEnter),
		HALT(),
	);
}
/// $C34249
immutable ubyte[21 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptLeaf2;
shared static this() {
	actionScriptLeaf2 = initializeScript!actionScriptLeaf2(
		SET_ANIMATION(255),
		RAND(),
		AND_TEMPVAR(127),
		WRITE_TEMPVAR_WAITTIMER(),
		SET_PRIORITY(0),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		MOVE_TO_TOP_OF_SCREEN_RANDOM(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTCALL("actionScriptLeafCommon"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3426E
immutable ubyte[33 + 7 * (const(void)*).sizeof + 1 * string.sizeof + 5 * ScriptPointer.sizeof] actionScript497;
shared static this() {
	actionScript497 = initializeScript!actionScript497(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		START_TASK("actionScriptMapObjStillEntry2"),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS_OFFSET(0, 16),
		SET_VAR(ActionScriptVars.v2, 12),
		SET_VAR(ActionScriptVars.v3, 12),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript497.UNKNOWN0"),
		GET_PRESSED_BUTTONS(),
		AND_TEMPVAR(Pad.up),
		JUMP_IF_FALSE("actionScript497.UNKNOWN0"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_89_DUNGEONMAN"),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		SHORTJUMP("actionScript497.UNKNOWN0"),
	);
}
/// $C342B1
immutable ubyte[33 + 7 * (const(void)*).sizeof + 1 * string.sizeof + 5 * ScriptPointer.sizeof] actionScript498;
shared static this() {
	actionScript498 = initializeScript!actionScript498(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		START_TASK("actionScriptMapObjStillEntry2"),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS_OFFSET(0, 16),
		SET_VAR(ActionScriptVars.v2, 12),
		SET_VAR(ActionScriptVars.v3, 12),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript498.UNKNOWN0"),
		GET_PRESSED_BUTTONS(),
		AND_TEMPVAR(Pad.up),
		JUMP_IF_FALSE("actionScript498.UNKNOWN0"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_90_DUNGEONMAN"),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		SHORTJUMP("actionScript498.UNKNOWN0"),
	);
}
/// $C342F4
immutable ubyte[7 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript501;
shared static this() {
	actionScript501 = initializeScript!actionScript501(
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_POSITION_CHANGE_CALLBACK(&updateEntityPositionAbsolute),
		SET_VAR(ActionScriptVars.v0, 1),
		SHORTJUMP("actionScript501_531_Common"),
	);
}
/// $C34301
immutable ubyte[7 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript531;
shared static this() {
	actionScript531 = initializeScript!actionScript531(
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_POSITION_CHANGE_CALLBACK(&updateEntityPositionAbsolute),
		SET_VAR(ActionScriptVars.v0, 0),
		SHORTJUMP("actionScript501_531_Common"),
	);
}
/// $C3430E
immutable ubyte[61 + 10 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript501_531_Common;
shared static this() {
	actionScript501_531_Common = initializeScript!actionScript501_531_Common(
		SET_X(-8),
		SET_Y(40),
		START_TASK("actionScript501_531_CommonTask"),
		LOOP(4),
			UPDATE_SPRITE_DIRECTION(Direction.right, 0),
			PAUSE(8),
			UPDATE_SPRITE_DIRECTION(Direction.right, 1),
			PAUSE(8),
		LOOP_END(),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.upLeft, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.downLeft, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 0),
		PAUSE(8),
		SHORTJUMP("actionScript501_531_Common.UNKNOWN0"),
	);
}
/// $C3436D
immutable ubyte[9 + 1 * ScriptPointer.sizeof] actionScript501_531_CommonTask;
shared static this() {
	actionScript501_531_CommonTask = initializeScript!actionScript501_531_CommonTask(
		SET_X_VELOCITY(128),
		PAUSE(64),
		SET_VELOCITIES_ZERO(),
		PAUSE(240),
		SHORTJUMP("actionScript501_531_CommonTask"),
	);
}
/// $C34378
immutable ubyte[7 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript532;
shared static this() {
	actionScript532 = initializeScript!actionScript532(
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_POSITION_CHANGE_CALLBACK(&updateEntityPositionAbsolute),
		SET_VAR(ActionScriptVars.v0, 1),
		SHORTJUMP("unknownC34392"),
	);
}
/// $C34385
immutable ubyte[7 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript533;
shared static this() {
	actionScript533 = initializeScript!actionScript533(
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_POSITION_CHANGE_CALLBACK(&updateEntityPositionAbsolute),
		SET_VAR(ActionScriptVars.v0, 0),
		SHORTJUMP("unknownC34392"),
	);
}
/// $C34392
immutable ubyte[18 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC34392;
shared static this() {
	unknownC34392 = initializeScript!unknownC34392(
		START_TASK("unknownC343AE"),
		SET_X_VELOCITY(-256),
		LOOP(5),
			UPDATE_SPRITE_DIRECTION(Direction.left, 0),
			PAUSE(8),
			UPDATE_SPRITE_DIRECTION(Direction.left, 1),
			PAUSE(8),
		LOOP_END(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C343AE
immutable ubyte[23 + 4 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] unknownC343AE;
shared static this() {
	unknownC343AE = initializeScript!unknownC343AE(
		PAUSE(1),
		WRITE_WORD_TEMPVAR(256),
		TEST_ENTITY_RIGHT_OF_X_COORD(),
		JUMP_IF_FALSE("unknownC343AE.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(-12),
		TEST_ENTITY_RIGHT_OF_X_COORD(),
		JUMP_IF_FALSE("unknownC343AE.UNKNOWN1"),
	LABEL("UNKNOWN0"),
		WRITE_WORD_TEMPVAR(224),
		TEST_ENTITY_BELOW_Y_COORD(),
		JUMP_IF_FALSE("unknownC343AE"),
		WRITE_WORD_TEMPVAR(-12),
		TEST_ENTITY_BELOW_Y_COORD(),
		JUMP_IF_TRUE("unknownC343AE"),
	LABEL("UNKNOWN1"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C343DB
immutable ubyte[18 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] unknownC343DB;
shared static this() {
	unknownC343DB = initializeScript!unknownC343DB(
		PAUSE(8),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_TRUE("unknownC343DB.UNKNOWN0"),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
	LABEL("UNKNOWN0"),
		PAUSE(8),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		IS_ENTITY_ONSCREEN(),
		JUMP_IF_TRUE("unknownC343DB"),
		FINISH_DELIVERY(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/** ActionScript 500 - Tries to make a delivery like actionScriptFreshDelivery, but an attempt is made immediately if any attempts have been made before
 *
 * Expects VAR0 to be set to an active delivery index.
 * Original_Address: $(DOLLAR)C34402
 */
immutable ubyte[9 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptRespawnedDelivery;
shared static this() {
	actionScriptRespawnedDelivery = initializeScript!actionScriptRespawnedDelivery(
		C0A643(1311),
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_VELOCITIES_ZERO(),
		GET_DELIVERY_ATTEMPT_COUNT(),
		JUMP_IF_TRUE("actionScriptDeliveryCommon.ENTRY2"),
		SHORTJUMP("actionScriptDeliveryCommon"),
	);
}
/** ActionScript 499 - Repeatedly tries to make a delivery at a predefined interval until it either succeeds or runs out of attempts
 *
 * Expects VAR0 to be set to an active delivery index.
 * Original_Address: $(DOLLAR)C3441A
 */
immutable ubyte[11 + 5 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptFreshDelivery;
shared static this() {
	actionScriptFreshDelivery = initializeScript!actionScriptFreshDelivery(
		C0A643(1311),
		RESET_DELIVERY_ATTEMPT_COUNT(),
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_ANIMATION(255),
		SET_VELOCITIES_ZERO(),
		START_DELIVERY_COUNTDOWN(),
		SHORTJUMP("actionScriptDeliveryCommon"),
	);
}
/// $C34432
immutable ubyte[28 + 8 * (const(void)*).sizeof + 10 * ScriptPointer.sizeof] actionScriptDeliveryCommon;
shared static this() {
	actionScriptDeliveryCommon = initializeScript!actionScriptDeliveryCommon(
		PAUSE(60),
		DO_DELIVERY_COUNTDOWN(),
		JUMP_IF_TRUE("actionScriptDeliveryCommon"),
		SHORTJUMP("actionScriptDeliveryCommon.ENTRY2"),

	LABEL("UNKNOWN0"),
		HAS_DELIVERY_ATTEMPTS_LEFT(),
		JUMP_IF_FALSE("actionScriptDeliveryCommonTask.ENTRY2"),
		GET_DELIVERY_ATTEMPT_DELAY(),
		LOOP_TEMPVAR(),
			PAUSE(60),
		LOOP_END(),

	LABEL("ENTRY2"),
		CHECK_DELIVERY_ELIGIBILITY(),
		JUMP_IF_FALSE("actionScriptDeliveryCommon.UNKNOWN2"),
		SHORTJUMP("actionScriptDeliveryCommon.UNKNOWN0"),

	LABEL("UNKNOWN2"),
		TEST_IN_BIG_AREA(),
		JUMP_IF_TRUE("actionScriptDeliveryCommonTask.ENTRY2"),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		PREPARE_DELIVERY_ENTRANCE_PATH(),
		JUMP_IF_TRUE("actionScriptDeliveryCommon.UNKNOWN0"),
		START_TASK("actionScriptDeliveryCommonTask"),
		PAUSE(1),
		START_DELIVERY(),
		SHORTCALL("actionScriptDeliveryCommonTask.UNKNOWN0"),
		START_DELIVERY_SUCCESS_TEXT(),
		SHORTJUMP("actionScriptDeliveryCommonTask.UNKNOWN3"),
	);
}

/// $C3447A
immutable ubyte[67 + 15 * (const(void)*).sizeof + 15 * ScriptPointer.sizeof] actionScriptDeliveryCommonTask;
shared static this() {
	actionScriptDeliveryCommonTask = initializeScript!actionScriptDeliveryCommonTask(
		SHORTCALL("actionScriptDeliveryCommonTask.UNKNOWN6"),

	LABEL("ENTRY2"),
		FINISH_DELIVERY(),
		START_DELIVERY_FAIL_TEXT(),
		SHORTJUMP("actionScriptTerminate"),

	LABEL("UNKNOWN0"),
		SET_ANIMATION(0),
		START_TASK("animateD8F2"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v2, 22),
		SET_VAR(ActionScriptVars.v3, 22),

	LABEL("UNKNOWN1"),
		PAUSE(1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_TRUE("actionScriptDeliveryCommonTask.UNKNOWN2"),
		TEST_IF_LEADER_CLOSE_BY(),
		JUMP_IF_FALSE("actionScriptDeliveryCommonTask.UNKNOWN1"),

	LABEL("UNKNOWN2"),
		SHORT_RETURN(),

	LABEL("UNKNOWN3"),
		SET_VELOCITIES_ZERO(),
		PAUSE(1),
		END_LAST_TASK(),
		END_LAST_TASK(),
		START_TASK("unknownC343DB"),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		PREPARE_DELIVERY_EXIT_PATH(),
		JUMP_IF_TRUE("actionScriptDeliveryCommonTask.UNKNOWN5"),
		GET_DELIVERY_EXIT_SPEED(),
		SET_MOVEMENT_SPEED(),

	LABEL("UNKNOWN4"),
		C0D98F(),
		JUMP_IF_FALSE("actionScriptDeliveryCommonTask.UNKNOWN5"),
		SHORTCALL("actionScriptMoveToLocation"),
		COPY_DESTINATION_TO_LOCATION(),
		SHORTJUMP("actionScriptDeliveryCommonTask.UNKNOWN4"),

	LABEL("UNKNOWN5"),
		SET_VELOCITIES_ZERO(),
		FINISH_DELIVERY(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),

	LABEL("UNKNOWN6"),
		GET_DELIVERY_ENTER_SPEED(),
		SET_MOVEMENT_SPEED(),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v4, 0),

	LABEL("UNKNOWN7"),
		C0D98F(),
		JUMP_IF_FALSE("actionScriptDeliveryCommonTask.UNKNOWN8"),
		SHORTCALL("actionScriptMoveToLocation"),
		COPY_DESTINATION_TO_LOCATION(),
		SHORTJUMP("actionScriptDeliveryCommonTask.UNKNOWN7"),

	LABEL("UNKNOWN8"),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(240),
		SHORTJUMP("actionScriptDeliveryCommonTask.UNKNOWN8"),
	);
}
/// $C34508
immutable ubyte[62 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptLastBattle;
shared static this() {
	actionScriptLastBattle = initializeScript!actionScriptLastBattle(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptCentreScreenOnEntityCallbackOffset),
		SET_VAR(ActionScriptVars.v0, 0),
		SET_VAR(ActionScriptVars.v1, 0),
		START_TASK("actionScriptLastBattleTask"),
		WRITE_WORD_TEMPVAR(10),
		LOOP_TEMPVAR(),
			LOOP(2),
				PAUSE(3),
				ADD(ActionScriptVars.v0, 1),
			LOOP_END(),
			LOOP(2),
				PAUSE(3),
				ADD(ActionScriptVars.v0, -1),
			LOOP_END(),
			LOOP(2),
				PAUSE(3),
				ADD(ActionScriptVars.v0, -1),
			LOOP_END(),
			LOOP(2),
				PAUSE(3),
				ADD(ActionScriptVars.v0, 1),
			LOOP_END(),
		LOOP_END(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C34555
immutable ubyte[26] actionScriptLastBattleTask;
shared static this() {
	actionScriptLastBattleTask = initializeScript!actionScriptLastBattleTask(
		WRITE_WORD_TEMPVAR(10),
		LOOP_TEMPVAR(),
			LOOP(12),
				PAUSE(1),
				ADD(ActionScriptVars.v1, 1),
			LOOP_END(),
			LOOP(12),
				PAUSE(1),
				ADD(ActionScriptVars.v1, -1),
			LOOP_END(),
		LOOP_END(),
		END_TASK(),
	);
}
/// $C3456F
immutable ubyte[1 + 1 * ScriptPointer.sizeof] actionScript550;
shared static this() {
	actionScript550 = initializeScript!actionScript550(
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C34572
immutable ubyte[30 + 5 * (const(void)*).sizeof] actionScriptNesFace;
shared static this() {
	actionScriptNesFace = initializeScript!actionScriptNesFace(
		SET_X(4224),
		SET_Y(872),
		SET_PRIORITY(3),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(60),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(60),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(60),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(60),
		HALT(),
	);
}
/// $C3459E
immutable ubyte[31 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptLastBattlePokey;
shared static this() {
	actionScriptLastBattlePokey = initializeScript!actionScriptLastBattlePokey(
		SET_X(4224),
		SET_Y(856),
		PAUSE(2),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 4224),
		SET_VAR(ActionScriptVars.v7, 917),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C345CA
immutable ubyte[75 + 7 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptSpiritReturnNes;
shared static this() {
	actionScriptSpiritReturnNes = initializeScript!actionScriptSpiritReturnNes(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(255),
		PAUSE(1),
		YIELD_TO_TEXT(),
		PAUSE(3),
		SET_PRIORITY(0),
		SET_X(184),
		SET_Y(6096),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 184),
		SET_VAR(ActionScriptVars.v7, 6064),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v6, 168),
		SET_VAR(ActionScriptVars.v7, 6040),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v6, 152),
		SET_VAR(ActionScriptVars.v7, 6032),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 0),
		SET_VAR(ActionScriptVars.v7, 6032),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C34635
immutable ubyte[67 + 5 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptSpiritReturnPola;
shared static this() {
	actionScriptSpiritReturnPola = initializeScript!actionScriptSpiritReturnPola(
		SET_PRIORITY(0),
		SET_X(200),
		SET_Y(6080),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 200),
		SET_VAR(ActionScriptVars.v7, 6064),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v6, 192),
		SET_VAR(ActionScriptVars.v7, 6048),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v6, 168),
		SET_VAR(ActionScriptVars.v7, 6032),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 0),
		SET_VAR(ActionScriptVars.v7, 6032),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C34693
immutable ubyte[67 + 5 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptSpiritReturnJef;
shared static this() {
	actionScriptSpiritReturnJef = initializeScript!actionScriptSpiritReturnJef(
		SET_PRIORITY(0),
		SET_X(216),
		SET_Y(6088),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 208),
		SET_VAR(ActionScriptVars.v7, 6040),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v6, 208),
		SET_VAR(ActionScriptVars.v7, 6024),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v6, 184),
		SET_VAR(ActionScriptVars.v7, 6016),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 0),
		SET_VAR(ActionScriptVars.v7, 6016),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C346F1
immutable ubyte[69 + 5 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptSpiritReturnPoo;
shared static this() {
	actionScriptSpiritReturnPoo = initializeScript!actionScriptSpiritReturnPoo(
		SET_PRIORITY(0),
		SET_X(192),
		SET_Y(6104),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 192),
		SET_VAR(ActionScriptVars.v7, 6072),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v6, 176),
		SET_VAR(ActionScriptVars.v7, 6048),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v6, 160),
		SET_VAR(ActionScriptVars.v7, 6040),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 0),
		SET_VAR(ActionScriptVars.v7, 6040),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(180),
		///fallthrough
		SHORTJUMP("actionScriptWhiteout"),
	);
}
/// $C3474E
immutable ubyte[17 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptWhiteout;
shared static this() {
	actionScriptWhiteout = initializeScript!actionScriptWhiteout(
		SET_VAR(ActionScriptVars.v0, 0),
		LOOP(31),
			ADD(ActionScriptVars.v0, 1),
			DO_PALETTES_FADE_STEP(),
			PAUSE(4),
		LOOP_END(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C34767
immutable ubyte[66 + 4 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptSpiritReturnPoo2;
shared static this() {
	actionScriptSpiritReturnPoo2 = initializeScript!actionScriptSpiritReturnPoo2(
		SET_PRIORITY(0),
		SET_X(512),
		SET_Y(7560),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 400),
		SET_VAR(ActionScriptVars.v7, 7560),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v6, 376),
		SET_VAR(ActionScriptVars.v7, 7568),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 368),
		SET_VAR(ActionScriptVars.v7, 7592),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 368),
		SET_VAR(ActionScriptVars.v7, 7608),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(30),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C347C1
immutable ubyte[57 + 4 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptSpiritReturnJef2;
shared static this() {
	actionScriptSpiritReturnJef2 = initializeScript!actionScriptSpiritReturnJef2(
		SET_PRIORITY(0),
		SET_X(512),
		SET_Y(7576),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 416),
		SET_VAR(ActionScriptVars.v7, 7576),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v6, 400),
		SET_VAR(ActionScriptVars.v7, 7592),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 400),
		SET_VAR(ActionScriptVars.v7, 7600),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(30),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C34810
immutable ubyte[66 + 4 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptSpiritReturnPola2;
shared static this() {
	actionScriptSpiritReturnPola2 = initializeScript!actionScriptSpiritReturnPola2(
		SET_PRIORITY(0),
		SET_X(512),
		SET_Y(7544),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 448),
		SET_VAR(ActionScriptVars.v7, 7544),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v6, 424),
		SET_VAR(ActionScriptVars.v7, 7560),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 416),
		SET_VAR(ActionScriptVars.v7, 7576),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 416),
		SET_VAR(ActionScriptVars.v7, 7616),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(30),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3486A
immutable ubyte[66 + 4 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptSpiritReturnNes2;
shared static this() {
	actionScriptSpiritReturnNes2 = initializeScript!actionScriptSpiritReturnNes2(
		SET_PRIORITY(0),
		SET_X(512),
		SET_Y(7560),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 416),
		SET_VAR(ActionScriptVars.v7, 7560),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v6, 392),
		SET_VAR(ActionScriptVars.v7, 7576),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 384),
		SET_VAR(ActionScriptVars.v7, 7592),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 384),
		SET_VAR(ActionScriptVars.v7, 7624),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(30),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C348C4
immutable ubyte[32 + 8 * (const(void)*).sizeof] unknownC348C4;
shared static this() {
	unknownC348C4 = initializeScript!unknownC348C4(
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(20),
		LOOP(3),
			WRITE_WORD_TEMPVAR(Direction.right),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(14),
			WRITE_WORD_TEMPVAR(Direction.left),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(14),
		LOOP_END(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(20),
		SHORT_RETURN(),
	);
}
/// $C348FC
immutable ubyte[60 + 8 * (const(void)*).sizeof + 10 * ScriptPointer.sizeof] actionScriptComeBackPoo;
shared static this() {
	actionScriptComeBackPoo = initializeScript!actionScriptComeBackPoo(
		SET_X(368),
		SET_Y(7608),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		SHORTCALL("unknownC348C4"),
		YIELD_TO_TEXT(),
		PAUSE(3),
		WRITE_WORD_TEMPVAR(Direction.downRight),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(10),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		SET_VAR(ActionScriptVars.v3, 8),
		SHORTCALL("unknownC34B62"),
		YIELD_TO_TEXT(),
		SET_VAR(ActionScriptVars.v3, 6),
		SHORTCALL("unknownC34B62"),
		SET_VAR(ActionScriptVars.v3, 4),
		SHORTCALL("unknownC34B62"),
		SET_VAR(ActionScriptVars.v3, 2),
		SHORTCALL("unknownC34B62"),
		SHORTCALL("unknownC34B62"),
		YIELD_TO_TEXT(),
		SET_VAR(ActionScriptVars.v3, 1),
		SHORTCALL("unknownC34B62"),
		SHORTCALL("unknownC34B62"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C34964
immutable ubyte[9 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC34964;
shared static this() {
	unknownC34964 = initializeScript!unknownC34964(
		MAKE_SPRITE_LOOK_AT_SELF(OverworldSprite.paula),
		MAKE_SPRITE_LOOK_AT_SELF(OverworldSprite.ness),
		PAUSE(1),
		SHORTJUMP("unknownC34964"),
	);
}
/// $C34975
immutable ubyte[156 + 20 * (const(void)*).sizeof + 10 * ScriptPointer.sizeof] actionScriptComeBackJef;
shared static this() {
	actionScriptComeBackJef = initializeScript!actionScriptComeBackJef(
		SET_X(400),
		SET_Y(7600),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		SHORTCALL("unknownC348C4"),
		YIELD_TO_TEXT(),
		PAUSE(3),
		START_TASK("unknownC34964"),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 416),
		SET_VAR(ActionScriptVars.v7, 7608),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(50),
		SET_VAR(ActionScriptVars.v4, 1),
		YIELD_TO_TEXT(),
		PAUSE(3),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_VAR(ActionScriptVars.v6, 384),
		SET_VAR(ActionScriptVars.v7, 7616),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(50),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(60),
		YIELD_TO_TEXT(),
		PAUSE(3),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_VAR(ActionScriptVars.v6, 400),
		SET_VAR(ActionScriptVars.v7, 7616),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 400),
		SET_VAR(ActionScriptVars.v7, 7648),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		END_LAST_TASK(),
		YIELD_TO_TEXT(),
		START_TASK("checkCollisionTask"),
	LABEL("UNKNOWN0"),
		PAUSE(5),
		IS_ENTITY_ONSCREEN(),
		JUMP_IF_TRUE("actionScriptComeBackJef.UNKNOWN0"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C34A61
immutable ubyte[6 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC34A61;
shared static this() {
	unknownC34A61 = initializeScript!unknownC34A61(
		MAKE_SPRITE_LOOK_AT_SELF(OverworldSprite.ness),
		PAUSE(1),
		SHORTJUMP("unknownC34A61"),
	);
}
/// $C34A6C
immutable ubyte[89 + 13 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptComeBackPola;
shared static this() {
	actionScriptComeBackPola = initializeScript!actionScriptComeBackPola(
		SET_X(416),
		SET_Y(7616),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SHORTCALL("unknownC348C4"),
		YIELD_TO_TEXT(),
		PAUSE(3),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(10),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		YIELD_TO_TEXT(),
		PAUSE(3),
		YIELD_TO_TEXT(),
		PAUSE(3),
		START_TASK("unknownC34A61"),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_VAR(ActionScriptVars.v6, 400),
		SET_VAR(ActionScriptVars.v7, 7624),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		END_LAST_TASK(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_VAR(ActionScriptVars.v6, 384),
		SET_VAR(ActionScriptVars.v7, 7624),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C34AF6
immutable ubyte[59 + 15 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptComeBackNes;
shared static this() {
	actionScriptComeBackNes = initializeScript!actionScriptComeBackNes(
		SET_X(384),
		SET_Y(7624),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		SHORTCALL("unknownC348C4"),
		YIELD_TO_TEXT(),
		PAUSE(3),
		WRITE_WORD_TEMPVAR(Direction.downRight),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(8),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(8),
		WRITE_WORD_TEMPVAR(Direction.upRight),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(8),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		YIELD_TO_TEXT(),
		PAUSE(3),
		YIELD_TO_TEXT(),
		PAUSE(3),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		HALT(),
	);
}
/// $C34B62
immutable ubyte[49 + 8 * (const(void)*).sizeof] unknownC34B62;
shared static this() {
	unknownC34B62 = initializeScript!unknownC34B62(
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v3),
		WRITE_TEMPVAR_WAITTIMER(),
		UPDATE_SPRITE_DIRECTION(Direction.downLeft, 1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v3),
		WRITE_TEMPVAR_WAITTIMER(),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v3),
		WRITE_TEMPVAR_WAITTIMER(),
		UPDATE_SPRITE_DIRECTION(Direction.upLeft, 1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v3),
		WRITE_TEMPVAR_WAITTIMER(),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v3),
		WRITE_TEMPVAR_WAITTIMER(),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v3),
		WRITE_TEMPVAR_WAITTIMER(),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v3),
		WRITE_TEMPVAR_WAITTIMER(),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v3),
		WRITE_TEMPVAR_WAITTIMER(),
		SHORT_RETURN(),
	);
}
/// $C34BAB
immutable ubyte[20 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptPooExplosion;
shared static this() {
	actionScriptPooExplosion = initializeScript!actionScriptPooExplosion(
		SET_PRIORITY(0),
		SET_X(368),
		SET_Y(7608),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		WRITE_WORD_TEMPVAR(4),
		SET_VELOCITIES_ZERO(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTCALL("unknownC3D0A4"),
		SHORTCALL("unknownC3D0A4"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C34BCD
immutable ubyte[22 + 6 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptDoseAndonutEnd;
shared static this() {
	actionScriptDoseAndonutEnd = initializeScript!actionScriptDoseAndonutEnd(
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		HALT(),
	);
}
/// $C34BF7
immutable ubyte[42 + 7 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptDoseDoseiEnd;
shared static this() {
	actionScriptDoseDoseiEnd = initializeScript!actionScriptDoseDoseiEnd(
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 416),
		SET_VAR(ActionScriptVars.v7, 7648),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		HALT(),
	);
}
/// $C34C3A
immutable ubyte[47 + 7 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptPolaPolastarReturn;
shared static this() {
	actionScriptPolaPolastarReturn = initializeScript!actionScriptPolaPolastarReturn(
		MOVE_TO_PARTY_MEMBER(PartyMember.paula),
		SHORTCALL("unknownC3AA38"),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 2128),
		SET_VAR(ActionScriptVars.v7, 7072),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		SET_VAR(ActionScriptVars.v6, 2128),
		SET_VAR(ActionScriptVars.v7, 7056),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C34C86
immutable ubyte[53 + 9 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptPolaPolastarReturnL;
shared static this() {
	actionScriptPolaPolastarReturnL = initializeScript!actionScriptPolaPolastarReturnL(
		MOVE_TO_PARTY_MEMBER(PartyMember.paula),
		SHORTCALL("unknownC3AA38"),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		GET_POSITION_OF_PARTY_MEMBER(1),
		ADD(ActionScriptVars.v6, -16),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2128),
		SET_VAR(ActionScriptVars.v7, 7072),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		GET_DIRECTION_FROM_PLAYER_TO_ENTITY(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		SET_VAR(ActionScriptVars.v6, 2128),
		SET_VAR(ActionScriptVars.v7, 7056),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C34CE0
immutable ubyte[55 + 8 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptPolaPolastarReturnR;
shared static this() {
	actionScriptPolaPolastarReturnR = initializeScript!actionScriptPolaPolastarReturnR(
		MOVE_TO_PARTY_MEMBER(PartyMember.paula),
		SHORTCALL("unknownC3AA38"),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		GET_POSITION_OF_PARTY_MEMBER(1),
		ADD(ActionScriptVars.v6, 16),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2128),
		SET_VAR(ActionScriptVars.v7, 7072),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		SET_VAR(ActionScriptVars.v6, 2128),
		SET_VAR(ActionScriptVars.v7, 7056),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C34D39
immutable ubyte[27 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC34D39;
shared static this() {
	unknownC34D39 = initializeScript!unknownC34D39(
		SET_Z(128),
		SHORTCALL("unknownC3AB26"),
		SET_Z_VELOCITY(-1024),
		PLAY_SFX(Sfx.falling),
		PAUSE(32),
		SET_VELOCITIES_ZERO(),
		PAUSE(2),
		SET_Z_RELATIVE(-1),
		PAUSE(2),
		SET_Z_RELATIVE(1),
		PAUSE(2),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C34D5C
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptPresentBoxFall1;
shared static this() {
	actionScriptPresentBoxFall1 = initializeScript!actionScriptPresentBoxFall1(
		SET_X(392),
		SET_Y(7552),
		SHORTJUMP("unknownC34D39"),
	);
}
/// $C34D65
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptPresentBoxFall2;
shared static this() {
	actionScriptPresentBoxFall2 = initializeScript!actionScriptPresentBoxFall2(
		SET_X(320),
		SET_Y(7592),
		SHORTJUMP("unknownC34D39"),
	);
}
/// $C34D6E
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptPresentBoxFall3;
shared static this() {
	actionScriptPresentBoxFall3 = initializeScript!actionScriptPresentBoxFall3(
		SET_X(464),
		SET_Y(7624),
		SHORTJUMP("unknownC34D39"),
	);
}
/// $C34D77
immutable ubyte[17 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptPresentBoxShadow1;
shared static this() {
	actionScriptPresentBoxShadow1 = initializeScript!actionScriptPresentBoxShadow1(
		SET_X(392),
		SET_Y(7552),
	LABEL("ENTRY2"),
		SHORTCALL("unknownC3AA38"),
		SET_ANIMATION(0),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(120),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C34D92
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptPresentBoxShadow2;
shared static this() {
	actionScriptPresentBoxShadow2 = initializeScript!actionScriptPresentBoxShadow2(
		SET_X(320),
		SET_Y(7592),
		SHORTJUMP("actionScriptPresentBoxShadow1.ENTRY2"),
	);
}
/// $C34D9B
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptPresentBoxShadow3;
shared static this() {
	actionScriptPresentBoxShadow3 = initializeScript!actionScriptPresentBoxShadow3(
		SET_X(464),
		SET_Y(7624),
		SHORTJUMP("actionScriptPresentBoxShadow1.ENTRY2"),
	);
}
/// $C34DA4
immutable ubyte[1 + 1 * ScriptPointer.sizeof] actionScript576;
shared static this() {
	actionScript576 = initializeScript!actionScript576(
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C34DA7
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptDoseiNesDown;
shared static this() {
	actionScriptDoseiNesDown = initializeScript!actionScriptDoseiNesDown(
		SET_X(388),
		SET_Y(7624),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C34DB0
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptDoseiPolaDown;
shared static this() {
	actionScriptDoseiPolaDown = initializeScript!actionScriptDoseiPolaDown(
		SET_X(420),
		SET_Y(7616),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C34DB9
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptDoseiJefDown;
shared static this() {
	actionScriptDoseiJefDown = initializeScript!actionScriptDoseiJefDown(
		SET_X(404),
		SET_Y(7600),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C34DC2
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptDoseiPooDown;
shared static this() {
	actionScriptDoseiPooDown = initializeScript!actionScriptDoseiPooDown(
		SET_X(372),
		SET_Y(7608),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C34DCB
immutable ubyte[9 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript581;
shared static this() {
	actionScript581 = initializeScript!actionScript581(
		GET_EVENT_FLAG(EventFlag.doseiPuBoxAppear),
		JUMP_IF_TRUE("actionScriptPeopleTBack"),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(255),
		SHORTJUMP("actionScriptMapObjStillEntry2"),
	);
}
/// $C34DE0
immutable ubyte[5 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptElevaterUp;
shared static this() {
	actionScriptElevaterUp = initializeScript!actionScriptElevaterUp(
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		SHORTJUMP("actionScriptElevaterDown.ENTRY2"),
	);
}
/// $C34DEA
immutable ubyte[71 + 16 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptElevaterDown;
shared static this() {
	actionScriptElevaterDown = initializeScript!actionScriptElevaterDown(
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
	LABEL("ENTRY2"),
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_VELOCITIES_ZERO(),
		ELEVATER_INITIALIZATION(),
		WRITE_WORD_TEMPVAR(1), // invert math
		SET_COLDATA_CGADSUB(24, 24, 24), // light gray
		SET_TICK_CALLBACK(&elevaterConfigure),
		START_TASK("actionScriptElevaterDownTask"),
		SET_MOVEMENT_SPEED(0),
		LOOP(64),
			PAUSE(1),
			GET_MOVEMENT_SPEED(),
			ADD_TEMPVAR(6),
			SET_MOVEMENT_SPEED(),
		LOOP_END(),
		PAUSE(150),
		SET_VELOCITIES_ZERO(),
		END_LAST_TASK(),
		PAUSE(60),
		INVERT_Y_POSITION_RELATIVE(),
		START_TASK("actionScriptElevaterDownTask"),
		PAUSE(150),
		LOOP(64),
			PAUSE(1),
			GET_MOVEMENT_SPEED(),
			ADD_TEMPVAR(-6),
			SET_MOVEMENT_SPEED(),
		LOOP_END(),
		SET_VELOCITIES_ZERO(),
		CLEAR_TICK_CALLBACK(),
		RECTANGLE_WINDOW_DISABLE_HDMA(),
		WRITE_WORD_TEMPVAR(0), // don't invert math
		SET_COLDATA_CGADSUB(0, 0, 0), // black
		PAUSE(60),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3
immutable ubyte[5 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptElevaterDownTask;
shared static this() {
	actionScriptElevaterDownTask = initializeScript!actionScriptElevaterDownTask(
		GET_SELF_DIRECTION(),
		MOVE_IN_DIRECTION(),
		PAUSE(1),
		SHORTJUMP("actionScriptElevaterDownTask"),
	);
}
/// $C34E73
immutable ubyte[8 + 4 * (const(void)*).sizeof] unknownC34E73;
shared static this() {
	unknownC34E73 = initializeScript!unknownC34E73(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SHORT_RETURN(),
	);
}
/// $C34E85
immutable ubyte[41 + 5 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScriptMdToto;
shared static this() {
	actionScriptMdToto = initializeScript!actionScriptMdToto(
		SHORTCALL("unknownC34E73"),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 7520),
		SET_VAR(ActionScriptVars.v7, 2880),
		SHORTCALL("actionScriptMoveToLocation"),
		LOAD_ITOI_PRODUCTION(),
		WRITE_BYTE_WRAM(&mirrorTM, 23),
		SET_VAR(ActionScriptVars.v6, 7472),
		SET_VAR(ActionScriptVars.v7, 2928),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7280),
		SET_VAR(ActionScriptVars.v7, 2928),
		SHORTCALL("actionScriptMoveToLocation"),
		DISPLAY_TEXT_NOW("MSG_MD_TOTO_SENCHOU"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C34EC8
immutable ubyte[81 + 2 * (const(void)*).sizeof + 9 * ScriptPointer.sizeof] actionScriptMdThrk;
shared static this() {
	actionScriptMdThrk = initializeScript!actionScriptMdThrk(
		SHORTCALL("unknownC34E73"),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5984),
		SET_VAR(ActionScriptVars.v7, 8584),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v6, 5992),
		SET_VAR(ActionScriptVars.v7, 8592),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5984),
		SET_VAR(ActionScriptVars.v7, 8600),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5896),
		SET_VAR(ActionScriptVars.v7, 8600),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5872),
		SET_VAR(ActionScriptVars.v7, 8600),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5864),
		SET_VAR(ActionScriptVars.v7, 8592),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5872),
		SET_VAR(ActionScriptVars.v7, 8584),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(120),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C34F31
immutable ubyte[72 + 6 * (const(void)*).sizeof + 1 * string.sizeof + 6 * ScriptPointer.sizeof] actionScriptMdMakyo;
shared static this() {
	actionScriptMdMakyo = initializeScript!actionScriptMdMakyo(
		SHORTCALL("unknownC34E73"),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 6048),
		SET_VAR(ActionScriptVars.v7, 7592),
		C0AACD(),
		SET_VAR(ActionScriptVars.v6, 6096),
		SET_VAR(ActionScriptVars.v7, 7544),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6048),
		SET_VAR(ActionScriptVars.v7, 7616),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6120),
		SET_VAR(ActionScriptVars.v7, 7688),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6120),
		SET_VAR(ActionScriptVars.v7, 7840),
		SHORTCALL("actionScriptMoveToLocation"),
		DISPLAY_TEXT_NOW("MSG_MD_MAKYO_RAFURESIA"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_FALSE("actionScriptMdMakyo.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		SET_X_VELOCITY(-1),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C34F9B
immutable ubyte[34 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptMdMakyoRafuresia;
shared static this() {
	actionScriptMdMakyoRafuresia = initializeScript!actionScriptMdMakyoRafuresia(
		SET_X(6048),
		SET_Y(7840),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 6072),
		SET_VAR(ActionScriptVars.v7, 7840),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.temp1),
		HALT(),
	);
}
/// $C34FC7
immutable ubyte[29 + 6 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptMdHashiBus;
shared static this() {
	actionScriptMdHashiBus = initializeScript!actionScriptMdHashiBus(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5120),
		SET_VAR(ActionScriptVars.v7, 10000),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C34FF8
immutable ubyte[15 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptMdHashiYunbo;
shared static this() {
	actionScriptMdHashiYunbo = initializeScript!actionScriptMdHashiYunbo(
		SET_X(4960),
		SET_Y(10024),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		HALT(),
	);
}
/// $C3500E
immutable ubyte[42 + 2 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptMdDung;
shared static this() {
	actionScriptMdDung = initializeScript!actionScriptMdDung(
		SHORTCALL("unknownC34E73"),
		START_TASK("actionScriptMdDungTask"),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 3216),
		SET_VAR(ActionScriptVars.v7, 6184),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 3112),
		SET_VAR(ActionScriptVars.v7, 6184),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 3032),
		SET_VAR(ActionScriptVars.v7, 6264),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		SHORTCALL("actionScriptMoveInDirection"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3
immutable ubyte[7 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptMdDungTask;
shared static this() {
	actionScriptMdDungTask = initializeScript!actionScriptMdDungTask(
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		PAUSE(1),
		SHORTJUMP("actionScriptMdDungTask"),
	);
}
/// $C35056
immutable ubyte[68 + 2 * (const(void)*).sizeof + 8 * ScriptPointer.sizeof] actionScriptMdTwsn;
shared static this() {
	actionScriptMdTwsn = initializeScript!actionScriptMdTwsn(
		SHORTCALL("unknownC34E73"),
		SET_MOVEMENT_SPEED(448),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1760),
		SET_VAR(ActionScriptVars.v7, 7144),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1760),
		SET_VAR(ActionScriptVars.v7, 7120),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1880),
		SET_VAR(ActionScriptVars.v7, 7000),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1936),
		SET_VAR(ActionScriptVars.v7, 7000),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1936),
		SET_VAR(ActionScriptVars.v7, 6928),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1592),
		SET_VAR(ActionScriptVars.v7, 6928),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C350B0
immutable ubyte[51 + 3 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptMdSkrb;
shared static this() {
	actionScriptMdSkrb = initializeScript!actionScriptMdSkrb(
		SHORTCALL("unknownC34E73"),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1496),
		SET_VAR(ActionScriptVars.v7, 4144),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1512),
		SET_VAR(ActionScriptVars.v7, 4128),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1592),
		SET_VAR(ActionScriptVars.v7, 4128),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		SET_Y_VELOCITY(1),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		PAUSE(120),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C350F4
immutable ubyte[69 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 7 * ScriptPointer.sizeof] actionScriptMdFrsd;
shared static this() {
	actionScriptMdFrsd = initializeScript!actionScriptMdFrsd(
		SHORTCALL("unknownC34E73"),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2688),
		SET_VAR(ActionScriptVars.v7, 3632),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2544),
		SET_VAR(ActionScriptVars.v7, 3776),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2544),
		SET_VAR(ActionScriptVars.v7, 3824),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2600),
		SET_VAR(ActionScriptVars.v7, 3888),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2600),
		SET_VAR(ActionScriptVars.v7, 3928),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2632),
		SET_VAR(ActionScriptVars.v7, 3928),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(20),
		DISPLAY_TEXT_NOW("MSG_MD_FRSD_YAJIUMA"),
		PAUSE(120),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C35154
immutable ubyte[50 + 2 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptMdSums;
shared static this() {
	actionScriptMdSums = initializeScript!actionScriptMdSums(
		SHORTCALL("unknownC34E73"),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5344),
		SET_VAR(ActionScriptVars.v7, 2760),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5440),
		SET_VAR(ActionScriptVars.v7, 2856),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5632),
		SET_VAR(ActionScriptVars.v7, 2856),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5672),
		SET_VAR(ActionScriptVars.v7, 2896),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C35198
immutable ubyte[71 + 7 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptMdOnet;
shared static this() {
	actionScriptMdOnet = initializeScript!actionScriptMdOnet(
		SHORTCALL("unknownC34E73"),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1104),
		SET_VAR(ActionScriptVars.v7, 312),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(50),
		LOAD_NINTENDO_PRESENTATION(),
		WRITE_BYTE_WRAM(&mirrorTM, 23),
		SET_VAR(ActionScriptVars.v6, 1128),
		SET_VAR(ActionScriptVars.v7, 336),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1208),
		SET_VAR(ActionScriptVars.v7, 336),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1208),
		SET_VAR(ActionScriptVars.v7, 336),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		SET_DIRECTION(),
		PAUSE(40),
		WRITE_WORD_TEMPVAR(Direction.downRight),
		SET_DIRECTION(),
		PAUSE(40),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		PAUSE(120),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C351FD
immutable ubyte[12 + 4 * (const(void)*).sizeof] actionScriptCreditsObject;
shared static this() {
	actionScriptCreditsObject = initializeScript!actionScriptCreditsObject(
		WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v0),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		SET_DIRECTION8(Direction.down),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C35214
immutable ubyte[14 + 5 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptCreditsPartyMember;
shared static this() {
	actionScriptCreditsPartyMember = initializeScript!actionScriptCreditsPartyMember(
		WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v0),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		SET_DIRECTION8(Direction.down),
	LABEL("UNKNOWN0"),
		WRITE_WRAM_TEMPVAR(&dmaBytesCopied),
		JUMP_IF_TRUE("actionScriptCreditsPartyMember.UNKNOWN0"),
		C0AAAC(),
		HALT(),
	);
}
/// $C35231
immutable ubyte[2575 + 191 * (const(void)*).sizeof + 130 * ScriptPointer.sizeof] actionScriptCastScene;
shared static this() {
	actionScriptCastScene = initializeScript!actionScriptCastScene(
		SET_Y(0),
		SET_VAR(ActionScriptVars.v7, 8),
		SET_TICK_CALLBACK(&handleCastScrolling),
		SET_Y_VELOCITY(102),

// onett

		WRITE_WORD_TEMPVAR(3),
		SHORTCALL("waitCreditsTiles"),
		WRITE_WORD_WRAM(&castTileOffset, 0),
		PRINT_CAST_NAME(CastSequenceName.castHeader, 16, 28),
		WRITE_WORD_TEMPVAR(2),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.castHeaderUnderline, 16, 28),
		WRITE_WORD_WRAM(&castTileOffset, 0),
		WRITE_WORD_TEMPVAR(8),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.picky, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.pickyMinch, 16, 28),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 72),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.lardnaMinch, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 184),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.aloysiusMinch, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.lardnaMinch, 9, 28),
		PRINT_CAST_NAME(CastSequenceName.aloysiusMinch, 23, 28),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.pokey, ActionScript.unknown809),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.pokeyMinch, 16, 28),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.fly, ActionScript.unknown804),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.buzzBuzz, 16, 28),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 96),
		SET_VAR(ActionScriptVars.v1, 248),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.evilManiMani, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(1),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.lierXAgerate, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.lierXAgerate, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.frank, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.frankFly, 16, 28),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 112),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.skatePunk, ActionScript.unknown808),
		SET_VAR(ActionScriptVars.v0, 144),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.skatePunk, ActionScript.unknown808),
		SET_VAR(ActionScriptVars.v0, 176),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.skatePunk, ActionScript.unknown808),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.theSharks, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.mayorPirkle, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.bhPirkle, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.captainStrong, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.captainStrong, 16, 28),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 72),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.copInSunglasses, ActionScript.unknown810),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.copInSunglasses, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 184),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.copInSunglasses, ActionScript.unknown811),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.onettPoliceForce, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.separator, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),

// twoson

		SET_VAR(ActionScriptVars.v0, 88),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.paulasMother, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 168),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.paulasFather, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, CastSequenceName.paulasMom),
		PRINT_CAST_NAME_VAR0(PartyMember.paula, 11, 28),
		SET_VAR(ActionScriptVars.v0, CastSequenceName.paulasDad),
		PRINT_CAST_NAME_VAR0(PartyMember.paula, 21, 28),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.paula, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 152),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.teddyBearParty, ActionScript.unknown803),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME_PARTY(PartyMember.paula, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.orangeKid, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 224),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.appleKidsMouse, ActionScript.unknown812),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.orangeKid, 16, 28),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.appleKid, ActionScript.unknown813),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.appleKid, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.everdred, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.mrEverdred, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 96),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.runawayFiveDrummer, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.runawayFiveBassPlayer, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 160),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.runawayFiveSaxPlayer, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(3),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, -32),
		SET_VAR(ActionScriptVars.v1, 256),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.runaway5Bus, ActionScript.unknown815),
		WRITE_WORD_TEMPVAR(2),
		SHORTCALL("waitCreditsTiles"),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.runawayFive, 16, 28),
		WRITE_WORD_TEMPVAR(1),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 112),
		SET_VAR(ActionScriptVars.v1, 200),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.lucky, ActionScript.unknown814),
		SET_VAR(ActionScriptVars.v0, 144),
		SET_VAR(ActionScriptVars.v1, 200),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.gorgeous, ActionScript.unknown814),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.separator, 16, 28),
		WRITE_WORD_TEMPVAR(6),
		SHORTCALL("waitCreditsTiles"),

// happy happy village

		WRITE_WORD_TEMPVAR(SpecialCastPalette.happyHappyists),
		UPLOAD_SPECIAL_CAST_PALETTE(),
		SET_VAR(ActionScriptVars.v0, 96),
		SET_VAR(ActionScriptVars.v1, 248),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.insaneCultist, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 248),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.insaneCultist, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 160),
		SET_VAR(ActionScriptVars.v1, 248),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.insaneCultist, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(1),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 80),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.insaneCultist, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 112),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.insaneCultist, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 144),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.insaneCultist, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 176),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.insaneCultist, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.happyHappyists, 16, 28),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 160),
		SET_VAR(ActionScriptVars.v1, 248),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.evilManiMani, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(1),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 96),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.pokey, ActionScript.unknown816),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.mrCarpainter, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.carpainter, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.separator, 16, 28),
		WRITE_WORD_TEMPVAR(8),
		SHORTCALL("waitCreditsTiles"),

// winters

		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.bubbleMonkeyFloating, ActionScript.unknown805),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.bubbleMonkey, 16, 28),
		WRITE_WORD_TEMPVAR(3),
		SHORTCALL("waitCreditsTiles"),
		WRITE_WORD_TEMPVAR(SpecialCastPalette.tessieRipples),
		UPLOAD_SPECIAL_CAST_PALETTE(),
		SET_VAR(ActionScriptVars.v0, 72),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.tony, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 184),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.unassumingLocalGuy, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(3),
		SHORTCALL("waitCreditsTiles"),
		WRITE_WORD_TEMPVAR(1),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.tony, 9, 28),
		PRINT_CAST_NAME(CastSequenceName.maxwell, 23, 28),
		WRITE_WORD_TEMPVAR(3),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 248),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.tessie, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(1),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 232),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.tessieWaterRipplesTop, ActionScript.unknown817),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 248),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.tessieWaterRipplesBottom, ActionScript.unknown818),
		WRITE_WORD_TEMPVAR(3),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.tessie, 16, 28),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 72),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.tessieWatcher, ActionScript.unknown820),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.tessieWatcher, ActionScript.unknown821),
		SET_VAR(ActionScriptVars.v0, 184),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.tessieWatcher, ActionScript.unknown822),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.tessieWatchingClub, 16, 28),
		WRITE_WORD_TEMPVAR(8),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.brickRoad, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.brickRoad, 16, 28),
		WRITE_WORD_TEMPVAR(8),
		SHORTCALL("waitCreditsTiles"),
		WRITE_WORD_TEMPVAR(1),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 152),
		SET_VAR(ActionScriptVars.v1, 256),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.skyRunner, ActionScript.unknown825),
		WRITE_WORD_TEMPVAR(2),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 88),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.drAndonuts, ActionScript.unknown823),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.drAndonuts, 11, 28),
		WRITE_WORD_TEMPVAR(6),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.jeff, ActionScript.unknown824),
		WRITE_WORD_TEMPVAR(1),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 152),
		SET_VAR(ActionScriptVars.v1, 152),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.starMastersPoofCloud, ActionScript.unknown826),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME_PARTY(PartyMember.jeff, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.separator, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),

// saturn valley and belch's factory

		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.mrSaturn, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 72),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.mrSaturn, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 184),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.mrSaturn, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 96),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.mrSaturn, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 160),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.mrSaturn, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		WRITE_WORD_WRAM(&castTileOffset, 0),
		PRINT_CAST_NAME(CastSequenceName.mrSaturn, 16, 28),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		WRITE_WORD_WRAM(&castTileOffset, 0),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 136),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.phaseDistorter, ActionScript.castPhaseDistorter),
		WRITE_WORD_TEMPVAR(2),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 304),
		SET_VAR(ActionScriptVars.v1, 248),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.masterBelch, ActionScript.unknown829),
		SET_VAR(ActionScriptVars.v0, 264),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.mrSaturn, ActionScript.unknown828),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		WRITE_WORD_TEMPVAR(3),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.masterBelch, 16, 25),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.separator, 16, 28),
		WRITE_WORD_TEMPVAR(6),
		SHORTCALL("waitCreditsTiles"),

// dusty dunes desert

		SET_VAR(ActionScriptVars.v0, 184),
		SET_VAR(ActionScriptVars.v1, 264),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.bigDirtScooper, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(1),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 216),
		SET_VAR(ActionScriptVars.v1, 232),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.sweat, ActionScript.unknown841),
		WRITE_WORD_TEMPVAR(1),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 60),
		SET_VAR(ActionScriptVars.v1, 232),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.sweat, ActionScript.unknown840),
		SET_VAR(ActionScriptVars.v0, 72),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.minersBrother, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.georgeMontague, 9, 28),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		WRITE_WORD_TEMPVAR(1),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 116),
		SET_VAR(ActionScriptVars.v1, 232),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.sweat, ActionScript.unknown840),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.miner, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.gerardoMontague, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 96),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.femaleMonkey, ActionScript.unknown838),
		SET_VAR(ActionScriptVars.v0, 160),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.monkey, ActionScript.unknown837),
		WRITE_WORD_TEMPVAR(6),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 64),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.monkey, ActionScript.unknown839),
		SET_VAR(ActionScriptVars.v0, 192),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.monkey, ActionScript.unknown838),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.talahRama, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.talahRama, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.separator, 16, 28),
		WRITE_WORD_TEMPVAR(6),
		SHORTCALL("waitCreditsTiles"),

// fourside

		SET_VAR(ActionScriptVars.v0, 96),
		SET_VAR(ActionScriptVars.v1, 248),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.evilManiMani, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(1),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.monotoli, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 160),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.pokeyRich, ActionScript.unknown836),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.geldegardeMonotoli, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.venus, ActionScript.unknown831),
		SET_VAR(ActionScriptVars.v0, 152),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.runawayFiveSaxPlayer, ActionScript.unknown832),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.venus, 16, 28),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 264),
		SET_VAR(ActionScriptVars.v1, 168),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.gorgeous, ActionScript.unknown833),
		WRITE_WORD_TEMPVAR(2),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.separator, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),

// dalaam

		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.pooMeditating, ActionScript.unknown830),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME_PARTY(PartyMember.poo, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 184),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.starMaster, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.poosMaster, 23, 28),
		WRITE_WORD_TEMPVAR(2),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, -8),
		SET_VAR(ActionScriptVars.v1, 112),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.starMasterFlyingAway, ActionScript.unknown834),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.starMaster, 9, 21),
		WRITE_WORD_TEMPVAR(2),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.separator, 16, 28),
		WRITE_WORD_TEMPVAR(8),
		SHORTCALL("waitCreditsTiles"),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),

// scaraba

		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.dungeonMan, ActionScript.unknown802),
		SET_VAR(ActionScriptVars.v0, 200),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.tribalWarrior, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.dungeonMan, 16, 28),
		PRINT_CAST_NAME(CastSequenceName.nobleWarrior, 25, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.separator, 16, 28),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),

// deep darkness

		SET_VAR(ActionScriptVars.v0, 64),
		SET_VAR(ActionScriptVars.v1, 248),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.mrSaturn, ActionScript.unknown842),
		WRITE_WORD_TEMPVAR(1),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 96),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.tenda, ActionScript.unknown843),
		SET_VAR(ActionScriptVars.v0, 160),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.tenda, ActionScript.unknown843),
		SET_VAR(ActionScriptVars.v0, 192),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.tenda, ActionScript.unknown843),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.tendaChief, ActionScript.unknown802),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.tendaTribesmen, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.separator, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),

// magicant

		SET_VAR(ActionScriptVars.v0, 96),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.crossGravestone, ActionScript.unknown847),
		SET_VAR(ActionScriptVars.v0, 160),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.crossGravestone, ActionScript.unknown846),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 64),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.crossGravestone, ActionScript.unknown845),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.crossGravestone, ActionScript.unknown849),
		SET_VAR(ActionScriptVars.v0, 192),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.crossGravestone, ActionScript.unknown848),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.flyingMen, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.separator, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),

// everyone else

		SET_VAR(ActionScriptVars.v0, 264),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.blondeGuyInBlueSuit, ActionScript.unknown850),
		SET_VAR(ActionScriptVars.v0, 328),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.pigtailDarkHairedGirl, ActionScript.unknown850),
		SET_VAR(ActionScriptVars.v0, 392),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.someBrunetteKid, ActionScript.unknown850),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, -104),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.oldGuyWithCane, ActionScript.unknown851),
		SET_VAR(ActionScriptVars.v0, -40),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.oldLadyWithCane, ActionScript.unknown851),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 264),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.trumpetPerson, ActionScript.unknown850),
		SET_VAR(ActionScriptVars.v0, 328),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.punkGuy, ActionScript.unknown850),
		SET_VAR(ActionScriptVars.v0, 392),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.jamaicanGuy, ActionScript.unknown850),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, -104),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.baker, ActionScript.unknown851),
		SET_VAR(ActionScriptVars.v0, -40),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.girlInStripedApron, ActionScript.unknown851),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, -136),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.bigNoseArabGuy, ActionScript.unknown851),
		SET_VAR(ActionScriptVars.v0, 328),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.ladyInVeil, ActionScript.unknown850),
		SET_VAR(ActionScriptVars.v0, 392),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.chineseMonkGuy, ActionScript.unknown850),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, -104),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.guyInSwimmingSuit, ActionScript.unknown851),
		SET_VAR(ActionScriptVars.v0, 360),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.girlInBikini, ActionScript.unknown850),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, -136),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.blondeLadyBlueDress, ActionScript.unknown851),
		SET_VAR(ActionScriptVars.v0, -72),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.brunetteShoppingLady, ActionScript.unknown851),
		SET_VAR(ActionScriptVars.v0, 392),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.sneakyGuyWithAHat, ActionScript.unknown850),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, -104),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.doctor, ActionScript.unknown851),
		SET_VAR(ActionScriptVars.v0, 360),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.nurse, ActionScript.unknown850),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, -136),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.shyGuy, ActionScript.unknown851),
		SET_VAR(ActionScriptVars.v0, 328),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.scuzzyGuy, ActionScript.unknown850),
		SET_VAR(ActionScriptVars.v0, 392),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.orangeHairedNerdKid, ActionScript.unknown850),
		WRITE_WORD_TEMPVAR(8),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.separator, 16, 28),
		WRITE_WORD_TEMPVAR(7),
		SHORTCALL("waitCreditsTiles"),
		WRITE_WORD_TEMPVAR(1),
		SHORTCALL("waitCreditsTiles"),

// ness's family

		SET_VAR(ActionScriptVars.v0, 104),
		SET_VAR(ActionScriptVars.v1, 232),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.telephone, ActionScript.unknown852),
		SET_VAR(ActionScriptVars.v0, 152),
		SET_VAR(ActionScriptVars.v1, 232),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.nessDogSleeping, ActionScript.unknown853),
		WRITE_WORD_TEMPVAR(3),
		SHORTCALL("waitCreditsTiles"),
		PRINT_CAST_NAME(CastSequenceName.dad, 13, 28),
		PRINT_CAST_NAME_PARTY(PartyMember.king, 19, 28),
		WRITE_WORD_TEMPVAR(5),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, 128),
		SET_VAR(ActionScriptVars.v1, 240),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.ness, ActionScript.unknown857),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		SET_VAR(ActionScriptVars.v0, -8),
		SET_VAR(ActionScriptVars.v1, 208),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.tracy, ActionScript.unknown855),
		SET_VAR(ActionScriptVars.v0, 264),
		SET_VAR(ActionScriptVars.v1, 208),
		CREATE_ENTITY_AT_VAR01_PLUS_BG3Y(OverworldSprite.mom, ActionScript.unknown856),
		PRINT_CAST_NAME(CastSequenceName.tracy, 10, 28),
		PRINT_CAST_NAME_PARTY(PartyMember.ness, 16, 28),
		PRINT_CAST_NAME(CastSequenceName.mom, 22, 28),
		WRITE_WORD_TEMPVAR(4),
		SHORTCALL("waitCreditsTiles"),
		WRITE_WORD_TEMPVAR(40),
		SHORTCALL("waitCreditsTiles"),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		END(),
	);
}
/** Waits until the specified number of tiles have scrolled past
 * Original_Address: $(DOLLAR)C35231
 */
immutable ubyte[6 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] waitCreditsTiles;
shared static this() {
	waitCreditsTiles = initializeScript!waitCreditsTiles(
		SET_CAST_SCROLL_THRESHOLD(),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		CHECK_CAST_SCROLL_THRESHOLD(),
		JUMP_IF_FALSE("waitCreditsTiles.UNKNOWN0"),
		SHORT_RETURN(),
	);
}
/** Animates a credits entity's sprite by alternating between frame 0 and 1, ending when the sprite scrolls offscreen
 * Var 3 specifies delay in frames before switching to the other sprite frame
 * Var 4, if 1, disables sprite updates
 * Original_Address: $(DOLLAR)C35F8B
 */
immutable ubyte[21 + 4 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] animateCastSpriteTask;
shared static this() {
	animateCastSpriteTask = initializeScript!animateCastSpriteTask(
		WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v3),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_TRUE("animateCastSpriteTask.UNKNOWN0"),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
	LABEL("UNKNOWN0"),
		WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v3),
		IS_ENTITY_ONSCREEN_CAST(),
		JUMP_IF_FALSE("animateCastSpriteTask.UNKNOWN2"),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_TRUE("animateCastSpriteTask.UNKNOWN1"),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
	LABEL("UNKNOWN1"),
		IS_ENTITY_ONSCREEN_CAST(),
		JUMP_IF_TRUE("animateCastSpriteTask"),
	LABEL("UNKNOWN2"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/** Have cast scene entities just stand in place, alternating between frame 0 and 1 every 16 frames (about 3.75 times per second)
 * Var 0 specifies a delay in frames before starting
 * Original_Address: $(DOLLAR)C35FB6
 */
immutable ubyte[17 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] castSceneStandInPlace;
shared static this() {
	castSceneStandInPlace = initializeScript!castSceneStandInPlace(
		WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v0),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG32D),
		SET_VAR(ActionScriptVars.v3, 16),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		START_TASK("animateCastSpriteTask"),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		SHORT_RETURN(),
	);
}
/// $C35FCD
immutable ubyte[15 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC35FCD;
shared static this() {
	unknownC35FCD = initializeScript!unknownC35FCD(
		SET_VAR(ActionScriptVars.v3, 16),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13DDupe),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3D),
		SET_ANIMATION(0),
		START_TASK("animateCastSpriteTask"),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		SHORT_RETURN(),
	);
}
/// $C35FE2
immutable ubyte[7 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript802;
shared static this() {
	actionScript802 = initializeScript!actionScript802(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C35FF1
immutable ubyte[7 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript803;
shared static this() {
	actionScript803 = initializeScript!actionScript803(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C36000
immutable ubyte[65 + 16 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript809;
shared static this() {
	actionScript809 = initializeScript!actionScript809(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(140),
		PAUSE(140),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(12),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(6),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(12),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(6),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(12),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(6),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v3, 12),
		SET_X_VELOCITY(512),
		HALT(),
	);
}
/// $C36073
immutable ubyte[16 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript810;
shared static this() {
	actionScript810 = initializeScript!actionScript810(
		SHORTCALL("castSceneStandInPlace"),
	LABEL("UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(60),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(60),
		SHORTJUMP("actionScript810.UNKNOWN0"),
	);
}
/// $C36093
immutable ubyte[16 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript811;
shared static this() {
	actionScript811 = initializeScript!actionScript811(
		SHORTCALL("castSceneStandInPlace"),
	LABEL("UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(60),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(60),
		SHORTJUMP("actionScript811.UNKNOWN0"),
	);
}
/// $C360B3
immutable ubyte[36 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript812;
shared static this() {
	actionScript812 = initializeScript!actionScript812(
		SHORTCALL("castSceneStandInPlace"),
		SET_VAR(ActionScriptVars.v3, 8),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(140),
		PAUSE(140),
		SET_MOVEMENT_SPEED(512),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(4),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(50),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C360EC
immutable ubyte[19 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript813;
shared static this() {
	actionScript813 = initializeScript!actionScript813(
		SHORTCALL("castSceneStandInPlace"),
		SET_VAR(ActionScriptVars.v3, 16),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(140),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(60),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C3610A
immutable ubyte[34 + 8 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript814;
shared static this() {
	actionScript814 = initializeScript!actionScript814(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG32D),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(90),
		SET_VAR(ActionScriptVars.v3, 16),
		START_TASK("animateCastSpriteTask"),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(5),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C36144
immutable ubyte[23 + 2 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript815;
shared static this() {
	actionScript815 = initializeScript!actionScript815(
		SHORTCALL("castSceneStandInPlace"),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(106),
		SET_VELOCITIES_ZERO(),
		PAUSE(40),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(106),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36169
immutable ubyte[38 + 7 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript816;
shared static this() {
	actionScript816 = initializeScript!actionScript816(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(140),
		PAUSE(140),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(20),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(20),
		SET_VAR(ActionScriptVars.v3, 12),
		SET_MOVEMENT_SPEED(512),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(52),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C361AA
immutable ubyte[9 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript817;
shared static this() {
	actionScript817 = initializeScript!actionScript817(
		SET_PRIORITY(3),
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C361BB
immutable ubyte[9 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript818;
shared static this() {
	actionScript818 = initializeScript!actionScript818(
		SET_PRIORITY(0),
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C361CC
immutable ubyte[7 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript819;
shared static this() {
	actionScript819 = initializeScript!actionScript819(
		SHORTCALL("unknownC35FCD"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C361DB
immutable ubyte[18 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript820;
shared static this() {
	actionScript820 = initializeScript!actionScript820(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(140),
		PAUSE(140),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C361FB
immutable ubyte[16 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript821;
shared static this() {
	actionScript821 = initializeScript!actionScript821(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(140),
		PAUSE(140),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C36219
immutable ubyte[18 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript822;
shared static this() {
	actionScript822 = initializeScript!actionScript822(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(140),
		PAUSE(140),
		PAUSE(60),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C36239
immutable ubyte[33 + 6 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript823;
shared static this() {
	actionScript823 = initializeScript!actionScript823(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(140),
		PAUSE(60),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(120),
		SET_VAR(ActionScriptVars.v4, 0),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C3626E
immutable ubyte[29 + 6 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript824;
shared static this() {
	actionScript824 = initializeScript!actionScript824(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(120),
		SET_VAR(ActionScriptVars.v4, 0),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C3629F
immutable ubyte[20 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript825;
shared static this() {
	actionScript825 = initializeScript!actionScript825(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(140),
		PAUSE(140),
		PAUSE(20),
		PAUSE(64),
		SPAWN_ENTITY_AT_SELF(OverworldSprite.brokenPhaseDistorter, ActionScript.unknown827),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C362C0
immutable ubyte[21 + 4 * (const(void)*).sizeof] unknownC362C0;
shared static this() {
	unknownC362C0 = initializeScript!unknownC362C0(
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(5),
		SHORT_RETURN(),
	);
}
/// $C362E1
immutable ubyte[30 + 4 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript826;
shared static this() {
	actionScript826 = initializeScript!actionScript826(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG32D),
		SET_PRIORITY(0),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		LOOP(2),
			SHORTCALL("unknownC362C0"),
			SET_X_RELATIVE(8),
			SET_Y_RELATIVE(-8),
			SHORTCALL("unknownC362C0"),
			SET_X_RELATIVE(-8),
			SHORTCALL("unknownC362C0"),
			SET_Y_RELATIVE(8),
		LOOP_END(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36311
immutable ubyte[7 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript827;
shared static this() {
	actionScript827 = initializeScript!actionScript827(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C36320
immutable ubyte[15 + 1 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript828;
shared static this() {
	actionScript828 = initializeScript!actionScript828(
		SHORTCALL("castSceneStandInPlace"),
		SET_VAR(ActionScriptVars.v3, 12),
		SET_MOVEMENT_SPEED(341),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(204),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36338
immutable ubyte[16 + 2 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript829;
shared static this() {
	actionScript829 = initializeScript!actionScript829(
		SHORTCALL("castSceneStandInPlace"),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(117),
		SET_VELOCITIES_ZERO(),
	LABEL("UNKNOWN0"),
		PAUSE(8),
		IS_ENTITY_ONSCREEN_CAST(),
		JUMP_IF_TRUE("actionScript829.UNKNOWN0"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36356
immutable ubyte[36 + 10 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript804;
shared static this() {
	actionScript804 = initializeScript!actionScript804(
		SHORTCALL("castSceneStandInPlace"),
		COPY_XY_TO_VARS(),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v6),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v7),
		START_TASK("unknownC3B0B6"),
		SET_MOVEMENT_SPEED(0),
		SET_VAR(ActionScriptVars.v0, 0),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		SET_MOVEMENT_FROM_ANGLE(),
		GET_DIRECTION_ROTATED_ANGLE_90(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		ADD(ActionScriptVars.v0, 2048),
		COPY_DESTINATION_TO_LOCATION(),
		SPIRAL_MOVEMENT_FRAME(),
		HALVE_Y_SPEED(),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SHORTJUMP("actionScript804.UNKNOWN0"),
	);
}
/// $C3639E
immutable ubyte[25 + 5 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript805;
shared static this() {
	actionScript805 = initializeScript!actionScript805(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG32D),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		LOOP(11),
			PAUSE(20),
		LOOP_END(),
		SET_Y_VELOCITY(85),
		PAUSE(168),
		SPAWN_ENTITY_AT_SELF(OverworldSprite.bubbleMonkey, ActionScript.unknown806),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C363C6
immutable ubyte[34 + 9 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript806;
shared static this() {
	actionScript806 = initializeScript!actionScript806(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG32D),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		SET_Y_RELATIVE(3),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		PAUSE(60),
		LOOP(2),
			WRITE_WORD_TEMPVAR(Direction.left),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(8),
			WRITE_WORD_TEMPVAR(Direction.right),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(8),
		LOOP_END(),
		IS_ENTITY_ONSCREEN_CAST(),
		JUMP_IF_TRUE("actionScript806.UNKNOWN0"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36405
immutable ubyte[38 + 8 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript808;
shared static this() {
	actionScript808 = initializeScript!actionScript808(
		SHORTCALL("castSceneStandInPlace"),
	LABEL("UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(-85),
		PAUSE(96),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(20),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(85),
		PAUSE(96),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(20),
		SHORTJUMP("actionScript808.UNKNOWN0"),
	);
}
/// $C36447
immutable ubyte[33 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptCastScenePhaseDistorter;
shared static this() {
	actionScriptCastScenePhaseDistorter = initializeScript!actionScriptCastScenePhaseDistorter(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG32D),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		SET_VAR(ActionScriptVars.v3, 16),
		START_TASK("animateCastSpriteTask"),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		LOOP(3),
			SET_ANIMATION(0),
			PAUSE(10),
			SET_ANIMATION(255),
			PAUSE(10),
		LOOP_END(),
		SET_ANIMATION(0),
		HALT(),
	);
}
/// $C36474
immutable ubyte[36 + 7 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript836;
shared static this() {
	actionScript836 = initializeScript!actionScript836(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(140),
		PAUSE(140),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(10),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(50),
		SET_VAR(ActionScriptVars.v3, 12),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		HALT(),
	);
}
/// $C364B1
immutable ubyte[91 + 6 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScript837;
shared static this() {
	actionScript837 = initializeScript!actionScript837(
		SHORTCALL("castSceneStandInPlace"),
		SET_VAR(ActionScriptVars.v3, 8),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.up),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(40),
		SET_VAR(ActionScriptVars.v4, 0),
		SHORTJUMP("actionScript837.UNKNOWN0"),
	);
}
/// $C3652A
immutable ubyte[91 + 6 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScript838;
shared static this() {
	actionScript838 = initializeScript!actionScript838(
		SHORTCALL("castSceneStandInPlace"),
		SET_VAR(ActionScriptVars.v3, 8),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.up),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 0),
		SHORTJUMP("actionScript838.UNKNOWN0"),
	);
}
/// $C365A3
immutable ubyte[91 + 6 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScript839;
shared static this() {
	actionScript839 = initializeScript!actionScript839(
		SHORTCALL("castSceneStandInPlace"),
		SET_VAR(ActionScriptVars.v3, 8),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.up),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(40),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(10),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(40),
		SET_VAR(ActionScriptVars.v4, 0),
		SHORTJUMP("actionScript839.UNKNOWN0"),
	);
}
/// $C3661C
immutable ubyte[23 + 6 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript831;
shared static this() {
	actionScript831 = initializeScript!actionScript831(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(140),
		PAUSE(140),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(90),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C36647
immutable ubyte[44 + 9 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript832;
shared static this() {
	actionScript832 = initializeScript!actionScript832(
		SHORTCALL("castSceneStandInPlace"),
		LOOP(3),
			WRITE_WORD_TEMPVAR(Direction.left),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(50),
			WRITE_WORD_TEMPVAR(Direction.down),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(14),
			WRITE_WORD_TEMPVAR(Direction.right),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(14),
			WRITE_WORD_TEMPVAR(Direction.up),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(14),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v3, 12),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		HALT(),
	);
}
/// $C36692
immutable ubyte[27 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript833;
shared static this() {
	actionScript833 = initializeScript!actionScript833(
		SHORTCALL("castSceneStandInPlace"),
		SET_VAR(ActionScriptVars.v3, 12),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(96),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		HALT(),
	);
}
/// $C366BF
immutable ubyte[16 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript830;
shared static this() {
	actionScript830 = initializeScript!actionScript830(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(140),
		PAUSE(140),
		SPAWN_ENTITY_AT_SELF(OverworldSprite.poo, ActionScript.unknown802),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C366DC
immutable ubyte[44 + 8 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript834;
shared static this() {
	actionScript834 = initializeScript!actionScript834(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(768),
		WRITE_WORD_TEMPVAR(Direction.downRight),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(36),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v0, -32768),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		SET_MOVEMENT_FROM_ANGLE(),
		GET_DIRECTION_ROTATED_ANGLE_90(),
		LOOP(64),
			PAUSE(1),
			ADD(ActionScriptVars.v0, 4096),
			MOVE_TO_SPRITE(OverworldSprite.starMasterFlyingAway),
			SPIRAL_MOVEMENT_FRAME(),
		LOOP_END(),
		SPAWN_ENTITY_AT_SELF(OverworldSprite.starMasterGuy, ActionScript.unknown835),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36726
immutable ubyte[38 + 5 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript835;
shared static this() {
	actionScript835 = initializeScript!actionScript835(
		SHORTCALL("castSceneStandInPlace"),
		SET_VAR(ActionScriptVars.v4, 1),
		LOOP(2),
			UPDATE_SPRITE_DIRECTION(Direction.down, 1),
			PAUSE(8),
			UPDATE_SPRITE_DIRECTION(Direction.left, 1),
			PAUSE(8),
			UPDATE_SPRITE_DIRECTION(Direction.up, 1),
			PAUSE(8),
			UPDATE_SPRITE_DIRECTION(Direction.right, 1),
			PAUSE(8),
		LOOP_END(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(8),
		SET_VAR(ActionScriptVars.v4, 0),
		HALT(),
	);
}
/// $C3675D
immutable ubyte[26 + 7 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript840;
shared static this() {
	actionScript840 = initializeScript!actionScript840(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG32D),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("ENTRY2"),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(8),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(8),
		SET_ANIMATION(255),
		PAUSE(16),
		IS_ENTITY_ONSCREEN_CAST(),
		JUMP_IF_TRUE("actionScript840.ENTRY2"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3678E
immutable ubyte[10 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript841;
shared static this() {
	actionScript841 = initializeScript!actionScript841(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG32D),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTJUMP("actionScript840.ENTRY2"),
	);
}
/// $C367A4
immutable ubyte[42 + 6 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript842;
shared static this() {
	actionScript842 = initializeScript!actionScript842(
		SHORTCALL("castSceneStandInPlace"),
		SET_VAR(ActionScriptVars.v3, 12),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(180),
		LOOP(2),
			WRITE_WORD_TEMPVAR(Direction.right),
			SET_DIRECTION(),
			PAUSE(20),
			WRITE_WORD_TEMPVAR(Direction.down),
			SET_DIRECTION(),
			PAUSE(40),
		LOOP_END(),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(48),
		SPAWN_ENTITY_AT_SELF(OverworldSprite.tenda, ActionScript.unknown844),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C367E6
immutable ubyte[26 + 6 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript843;
shared static this() {
	actionScript843 = initializeScript!actionScript843(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(180),
		LOOP(2),
			WRITE_WORD_TEMPVAR(Direction.left),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(20),
			WRITE_WORD_TEMPVAR(Direction.down),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(40),
		LOOP_END(),
		HALT(),
	);
}
/// $C36814
immutable ubyte[19 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript844;
shared static this() {
	actionScript844 = initializeScript!actionScript844(
		SHORTCALL("castSceneStandInPlace"),
		PAUSE(60),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(72),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C36834
immutable ubyte[6 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC36834;
shared static this() {
	unknownC36834 = initializeScript!unknownC36834(
		SPAWN_ENTITY_AT_SELF(OverworldSprite.flyingMan, ActionScript.unknown802),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3683F
immutable ubyte[9 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript845;
shared static this() {
	actionScript845 = initializeScript!actionScript845(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(80),
		SHORTJUMP("unknownC36834"),
	);
}
/// $C36852
immutable ubyte[11 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript846;
shared static this() {
	actionScript846 = initializeScript!actionScript846(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(180),
		PAUSE(30),
		SHORTJUMP("unknownC36834"),
	);
}
/// $C36867
immutable ubyte[11 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript847;
shared static this() {
	actionScript847 = initializeScript!actionScript847(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(180),
		PAUSE(60),
		SHORTJUMP("unknownC36834"),
	);
}
/// $C3687C
immutable ubyte[11 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript848;
shared static this() {
	actionScript848 = initializeScript!actionScript848(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(80),
		PAUSE(90),
		SHORTJUMP("unknownC36834"),
	);
}
/// $C36891
immutable ubyte[11 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript849;
shared static this() {
	actionScript849 = initializeScript!actionScript849(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(80),
		PAUSE(120),
		SHORTJUMP("unknownC36834"),
	);
}
/// $C368A6
immutable ubyte[22 + 5 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript850;
shared static this() {
	actionScript850 = initializeScript!actionScript850(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(200),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C368CF
immutable ubyte[22 + 5 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript851;
shared static this() {
	actionScript851 = initializeScript!actionScript851(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(200),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C368F8
immutable ubyte[86 + 25 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript852;
shared static this() {
	actionScript852 = initializeScript!actionScript852(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG32D),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(140),
		PAUSE(140),
	LABEL("UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(24),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(6),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(6),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(6),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(6),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(6),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(6),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(6),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(6),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(6),
		IS_ENTITY_ONSCREEN_CAST(),
		JUMP_IF_TRUE("actionScript852.UNKNOWN0"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3699B
immutable ubyte[18 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript853;
shared static this() {
	actionScript853 = initializeScript!actionScript853(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(140),
		PAUSE(140),
		PAUSE(60),
		SPAWN_ENTITY_AT_SELF(OverworldSprite.king, ActionScript.unknown854),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C369BA
immutable ubyte[7 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript854;
shared static this() {
	actionScript854 = initializeScript!actionScript854(
		SHORTCALL("castSceneStandInPlace"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C369C9
immutable ubyte[15 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript855;
shared static this() {
	actionScript855 = initializeScript!actionScript855(
		SHORTCALL("castSceneStandInPlace"),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(176),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C369E2
immutable ubyte[15 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript856;
shared static this() {
	actionScript856 = initializeScript!actionScript856(
		SHORTCALL("castSceneStandInPlace"),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(176),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C369FB
immutable ubyte[32 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript857;
shared static this() {
	actionScript857 = initializeScript!actionScript857(
		SHORTCALL("castSceneStandInPlace"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(140),
		PAUSE(140),
		PAUSE(140),
		PAUSE(40),
		SET_VAR(ActionScriptVars.v3, 4),
		SET_MOVEMENT_SPEED(384),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(56),
		SET_VELOCITIES_ZERO(),
		SPAWN_ENTITY_AT_SELF(OverworldSprite.nessPosing, ActionScript.unknown858),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36A2A
immutable ubyte[10 + 4 * (const(void)*).sizeof] actionScript858;
shared static this() {
	actionScript858 = initializeScript!actionScript858(
		SET_VELOCITIES_ZERO(),
		MOVE_RELATIVE_TO_BG3(),
		SET_POSITION_CHANGE_CALLBACK(&updateEntityPositionAbsolute),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(240),
		HALT(),
	);
}
/// $C36A3E
immutable ubyte[1 + 1 * ScriptPointer.sizeof] unknownC36A3E;
shared static this() {
	unknownC36A3E = initializeScript!unknownC36A3E(
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36A41
immutable ubyte[9 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC36A41;
shared static this() {
	unknownC36A41 = initializeScript!unknownC36A41(
		SET_PHYSICS_CALLBACK(&unknownC0A384),
		START_TASK("unknownC3A1F3"),
		START_TASK("checkCollisionTask"),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		SHORT_RETURN(),
	);
}
/// $C36A53
immutable ubyte[49 + 2 * (const(void)*).sizeof + 7 * ScriptPointer.sizeof] actionScript584;
shared static this() {
	actionScript584 = initializeScript!actionScript584(
		GET_EVENT_FLAG(EventFlag.onetDoorClose),
		JUMP_IF_TRUE("actionScriptTerminate"),
		SHORTCALL("unknownC36A41"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
	LABEL("UNKNOWN0"),
		SET_VAR(ActionScriptVars.v6, 2288),
		SET_VAR(ActionScriptVars.v7, 1496),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2624),
		SET_VAR(ActionScriptVars.v7, 1160),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2088),
		SET_VAR(ActionScriptVars.v7, 1160),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1760),
		SET_VAR(ActionScriptVars.v7, 1496),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScript584.UNKNOWN0"),
	);
}
/// $C36A98
immutable ubyte[24 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript585;
shared static this() {
	actionScript585 = initializeScript!actionScript585(
		GET_EVENT_FLAG(EventFlag.onetDoorClose),
		JUMP_IF_TRUE("actionScriptTerminate"),
		SHORTCALL("unknownC36A41"),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureLowerBody),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1528),
		SET_VAR(ActionScriptVars.v7, 1160),
		SHORTCALL("actionScriptMoveToLocation"),
		HALT(),
	);
}
/// $C36ABF
immutable ubyte[24 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript586;
shared static this() {
	actionScript586 = initializeScript!actionScript586(
		GET_EVENT_FLAG(EventFlag.onetDoorClose),
		JUMP_IF_TRUE("actionScriptTerminate"),
		SHORTCALL("unknownC36A41"),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureLowerBody),
		SET_MOVEMENT_SPEED(448),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1392),
		SET_VAR(ActionScriptVars.v7, 1768),
		SHORTCALL("actionScriptMoveToLocation"),
		HALT(),
	);
}
/// $C36AE6
immutable ubyte[18 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript587;
shared static this() {
	actionScript587 = initializeScript!actionScript587(
		SHORTCALL("unknownC36A41"),
		SET_MOVEMENT_SPEED(448),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2288),
		SET_VAR(ActionScriptVars.v7, 7160),
		SHORTCALL("actionScriptMoveToLocation"),
		HALT(),
	);
}
/// $C36AFF
immutable ubyte[18 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript588;
shared static this() {
	actionScript588 = initializeScript!actionScript588(
		SHORTCALL("unknownC36A41"),
		SET_MOVEMENT_SPEED(544),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2272),
		SET_VAR(ActionScriptVars.v7, 6360),
		SHORTCALL("actionScriptMoveToLocation"),
		HALT(),
	);
}
/// $C36B18
immutable ubyte[36 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript589;
shared static this() {
	actionScript589 = initializeScript!actionScript589(
		SHORTCALL("unknownC36A41"),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureLowerBody),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1408),
		SET_VAR(ActionScriptVars.v7, 6568),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 1304),
		SET_VAR(ActionScriptVars.v7, 6568),
		SHORTCALL("actionScriptMoveToLocation"),
		HALT(),
	);
}
/// $C36B4B
immutable ubyte[74 + 4 * (const(void)*).sizeof + 10 * ScriptPointer.sizeof] actionScript590;
shared static this() {
	actionScript590 = initializeScript!actionScript590(
		GET_EVENT_FLAG(EventFlag.twsnTonzuraBusAppear),
		JUMP_IF_FALSE("actionScript590.UNKNOWN0"),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(255),
		SHORTJUMP("actionScriptMapObjStillEntry2"),
	LABEL("UNKNOWN0"),
		SHORTCALL("unknownC36A41"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1696),
		SET_VAR(ActionScriptVars.v7, 6584),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v6, 2300),
		SET_VAR(ActionScriptVars.v7, 6584),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1720),
		SET_VAR(ActionScriptVars.v7, 7160),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2200),
		SET_VAR(ActionScriptVars.v7, 7160),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 632),
		SET_VAR(ActionScriptVars.v7, 8728),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1256),
		SET_VAR(ActionScriptVars.v7, 8728),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36BB4
immutable ubyte[14 + 2 * ScriptPointer.sizeof] unknownC36BB4;
shared static this() {
	unknownC36BB4 = initializeScript!unknownC36BB4(
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v3),
		JUMP_IF_TRUE("unknownC36BB4.UNKNOWN0"),
		SET_Y_RELATIVE(-1),
		PAUSE(2),
		SET_Y_RELATIVE(1),
	LABEL("UNKNOWN0"),
		PAUSE(2),
		SHORTJUMP("unknownC36BB4"),
	);
}
/// $C36BC6
immutable ubyte[20 + 2 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript591;
shared static this() {
	actionScript591 = initializeScript!actionScript591(
		SHORTCALL("unknownC3AA38"),
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v4, 1),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 12),
		SET_VAR(ActionScriptVars.v3, 32),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_THRK_FIGHT_MATENT"),
		HALT(),
	);
}
/// $C36BEA
immutable ubyte[1] unknownC36BEA;
shared static this() {
	unknownC36BEA = initializeScript!unknownC36BEA(
		END(),
	);
}
/// $C36BEB
immutable ubyte[12 + 1 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript592;
shared static this() {
	actionScript592 = initializeScript!actionScript592(
		SHORTCALL("unknownC3AA38"),
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v4, 1),
	LABEL("UNKNOWN0"),
		PAUSE(30),
		IS_ENTITY_ONSCREEN(),
		JUMP_IF_TRUE("actionScript592.UNKNOWN0"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36C00
immutable ubyte[51 + 5 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptMatentAwayZombi1;
shared static this() {
	actionScriptMatentAwayZombi1 = initializeScript!actionScriptMatentAwayZombi1(
		SET_X(5392),
		SET_Y(9608),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 12),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(60),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(10),
		SET_VAR(ActionScriptVars.v4, 5),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5368),
		SET_VAR(ActionScriptVars.v7, 9536),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 9472),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36C4A
immutable ubyte[51 + 5 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptMatentAwayZombi2;
shared static this() {
	actionScriptMatentAwayZombi2 = initializeScript!actionScriptMatentAwayZombi2(
		SET_X(5424),
		SET_Y(9608),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 12),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(90),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(15),
		SET_VAR(ActionScriptVars.v4, 5),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5456),
		SET_VAR(ActionScriptVars.v7, 9536),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 9472),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36C94
immutable ubyte[54 + 1 * (const(void)*).sizeof + 7 * ScriptPointer.sizeof] actionScript595;
shared static this() {
	actionScript595 = initializeScript!actionScript595(
		SHORTCALL("unknownC36A41"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 6248),
		SET_VAR(ActionScriptVars.v7, 9016),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6248),
		SET_VAR(ActionScriptVars.v7, 9032),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5888),
		SET_VAR(ActionScriptVars.v7, 9400),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5896),
		SET_VAR(ActionScriptVars.v7, 9432),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6488),
		SET_VAR(ActionScriptVars.v7, 9432),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36CDB
immutable ubyte[44 + 5 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptGumiStoneRise;
shared static this() {
	actionScriptGumiStoneRise = initializeScript!actionScriptGumiStoneRise(
		SHORTCALL("unknownC3AB26"),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_Z(0),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		LOOP(10),
			SET_Z_RELATIVE(1),
			PAUSE(2),
			SET_Z_RELATIVE(-1),
			PAUSE(2),
			SET_Z_RELATIVE(2),
			PAUSE(4),
			SET_Z_RELATIVE(-2),
			PAUSE(4),
		LOOP_END(),
		YIELD_TO_TEXT(),
		PAUSE(3),
		SET_Z_VELOCITY(1536),
		PAUSE(16),
		YIELD_TO_TEXT(),
		SET_VELOCITIES_ZERO(),
		CLEANUP_SELF(),
		END(),
	);
}
/// $C36D18
immutable ubyte[7 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTriggerTalkTextOnCollisionTask;
shared static this() {
	actionScriptTriggerTalkTextOnCollisionTask = initializeScript!actionScriptTriggerTalkTextOnCollisionTask(
		PAUSE(4),
		TEST_PARTY_COLLISION(),
		JUMP_IF_FALSE("actionScriptTriggerTalkTextOnCollisionTask"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		TRIGGER_TALK_TEXT(),
		END_TASK(),
	);
}
/// $C36D29
immutable ubyte[8 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript597;
shared static this() {
	actionScript597 = initializeScript!actionScript597(
		SHORTCALL("unknownC3AA2B"),
		START_TASK("actionScriptTriggerTalkTextOnCollisionTask"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		C0CCCC(),
		SHORTJUMP("actionScript27.ENTRY2"),
	);
}
/// $C36D40
immutable ubyte[7 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptTowardsPlayer;
shared static this() {
	actionScriptTowardsPlayer = initializeScript!actionScriptTowardsPlayer(
		SHORTCALL("unknownC3AA2B"),
		START_TASK("actionScriptTriggerTalkTextOnCollisionTask"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		SHORTJUMP("actionScript21.ENTRY2"),
	);
}
/// $C36D53
immutable ubyte[4 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript599;
shared static this() {
	actionScript599 = initializeScript!actionScript599(
		SET_MOVEMENT_SPEED(288),
		SHORTJUMP("actionScript600.ENTRY2"),
	);
}
/// $C36D5C
immutable ubyte[15 + 3 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript600;
shared static this() {
	actionScript600 = initializeScript!actionScript600(
		SET_MOVEMENT_SPEED(512),
	LABEL("ENTRY2"),
		SET_ANIMATION(0),
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_VAR(ActionScriptVars.v0, 4),
		START_TASK("unknownC3A20E"),
		START_TASK("checkCollisionTask"),
		START_TASK("actionScriptTriggerTalkTextOnCollisionTask"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTJUMP("actionScript20.ENTRY2"),
	);
}
/// $C36D7B
immutable ubyte[17 + 4 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript601;
shared static this() {
	actionScript601 = initializeScript!actionScript601(
		SET_DIRECTION8(Direction.down),
		SET_ANIMATION(0),
		SET_MOVEMENT_SPEED(512),
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_VAR(ActionScriptVars.v0, 4),
		START_TASK("unknownC3A20E"),
		START_TASK("checkCollisionTask"),
		START_TASK("actionScriptTriggerTalkTextOnCollisionTask"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTJUMP("actionScript31.ENTRY2"),
	);
}
/// $C36D9F
immutable ubyte[15 + 3 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript602;
shared static this() {
	actionScript602 = initializeScript!actionScript602(
		SET_ANIMATION(0),
		SET_MOVEMENT_SPEED(128),
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_VAR(ActionScriptVars.v0, 3),
		START_TASK("unknownC3A20E"),
		START_TASK("checkCollisionTask"),
		START_TASK("actionScriptTriggerTalkTextOnCollisionTask"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTJUMP("actionScript29.ENTRY2"),
	);
}
/// $C36DBE
immutable ubyte[11 + 3 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript603;
shared static this() {
	actionScript603 = initializeScript!actionScript603(
		SET_ANIMATION(0),
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		START_TASK("unknownC3A20E"),
		START_TASK("checkCollisionTask"),
		START_TASK("actionScriptTriggerTalkTextOnCollisionTask"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(704),
		SHORTJUMP("actionScript28.ENTRY2"),
	);
}
/// $C36DD9
immutable ubyte[39 + 5 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptAppleMouseStepback;
shared static this() {
	actionScriptAppleMouseStepback = initializeScript!actionScriptAppleMouseStepback(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(512),
		GET_EVENT_FLAG(EventFlag.animPort0),
		JUMP_IF_TRUE("actionScriptAppleMouseStepback.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v6, 7896),
		SET_VAR(ActionScriptVars.v7, 7928),
		SHORTJUMP("actionScriptAppleMouseStepback.UNKNOWN1"),
	LABEL("UNKNOWN0"),
		SET_VAR(ActionScriptVars.v6, 7864),
		SET_VAR(ActionScriptVars.v7, 7896),
	LABEL("UNKNOWN1"),
		SET_VAR(ActionScriptVars.v5, 2),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		END_LAST_TASK(),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C36E19
immutable ubyte[8 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptMapObjTBack;
shared static this() {
	actionScriptMapObjTBack = initializeScript!actionScriptMapObjTBack(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		START_TASK("unknownC36E41"),
		SHORTJUMP("actionScriptMapObjStillEntry2"),
	);
}
/// $C36E2D
immutable ubyte[8 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptPeopleTBack;
shared static this() {
	actionScriptPeopleTBack = initializeScript!actionScriptPeopleTBack(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		START_TASK("unknownC36E41"),
		SHORTJUMP("actionScriptSetWalkingSpeedSlowAnimationTask"),
	);
}
/// $C36E41
immutable ubyte[6 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC36E41;
shared static this() {
	unknownC36E41 = initializeScript!unknownC36E41(
		SLEEP_SLOT_FRAMES(),
	LABEL("UNKNOWN0"),
		GET_DEFAULT_DIRECTION(),
		FACE_DIRECTION(),
		PAUSE(80),
		SHORTJUMP("unknownC36E41.UNKNOWN0"),
	);
}
/// $C36E52
immutable ubyte[5 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript607;
shared static this() {
	actionScript607 = initializeScript!actionScript607(
		GET_EVENT_FLAG(EventFlag.onetDoorClose),
		JUMP_IF_FALSE("actionScriptPeopleWalk1"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36E5E
immutable ubyte[5 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript608;
shared static this() {
	actionScript608 = initializeScript!actionScript608(
		GET_EVENT_FLAG(EventFlag.onetDoorClose),
		JUMP_IF_FALSE("actionScriptPeopleWalk1Narrow"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36E6A
immutable ubyte[5 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript609;
shared static this() {
	actionScript609 = initializeScript!actionScript609(
		GET_EVENT_FLAG(EventFlag.onetDoorClose),
		JUMP_IF_FALSE("actionScriptPeopleWalk1Wide"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36E76
immutable ubyte[5 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript610;
shared static this() {
	actionScript610 = initializeScript!actionScript610(
		GET_EVENT_FLAG(EventFlag.onetDoorClose),
		JUMP_IF_FALSE("actionScriptMapObjTBack"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C36E82
immutable ubyte[36 + 3 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptFourMuseumBilk;
shared static this() {
	actionScriptFourMuseumBilk = initializeScript!actionScriptFourMuseumBilk(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5944),
		SET_VAR(ActionScriptVars.v7, 6856),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5944),
		SET_VAR(ActionScriptVars.v7, 6880),
		SHORTCALL("actionScriptMoveToLocation"),
		GET_POSITION_OF_PARTY_MEMBER(255),
		ADD(ActionScriptVars.v6, -18),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C36EB7
immutable ubyte[19 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptFourMuseumRid;
shared static this() {
	actionScriptFourMuseumRid = initializeScript!actionScriptFourMuseumRid(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 6080),
		SET_VAR(ActionScriptVars.v7, 6888),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C36ED4
immutable ubyte[26 + 8 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptFourFollowMuseumA;
shared static this() {
	actionScriptFourFollowMuseumA = initializeScript!actionScriptFourFollowMuseumA(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 18),
		SET_NPC_DESTINATION(NPCID.unknown0906),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		SET_NPC_DESTINATION(NPCID.unknown0906),
		MOVE_TOWARDS_DESTINATION(),
		SHORTJUMP("actionScriptFourFollowMuseumA.UNKNOWN0"),
	);
}
/// $C36F08
immutable ubyte[29 + 2 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptFourMuseumReturn;
shared static this() {
	actionScriptFourMuseumReturn = initializeScript!actionScriptFourMuseumReturn(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5944),
		SET_VAR(ActionScriptVars.v7, 6880),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 6855),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5984),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C36F33
immutable ubyte[36 + 3 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptSumsMuseumBilk;
shared static this() {
	actionScriptSumsMuseumBilk = initializeScript!actionScriptSumsMuseumBilk(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 6984),
		SET_VAR(ActionScriptVars.v7, 9544),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6984),
		SET_VAR(ActionScriptVars.v7, 9568),
		SHORTCALL("actionScriptMoveToLocation"),
		GET_POSITION_OF_PARTY_MEMBER(255),
		ADD(ActionScriptVars.v6, -18),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C36F68
immutable ubyte[19 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSumsMuseumRid;
shared static this() {
	actionScriptSumsMuseumRid = initializeScript!actionScriptSumsMuseumRid(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 7088),
		SET_VAR(ActionScriptVars.v7, 9584),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C36F85
immutable ubyte[26 + 8 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSumsFollowMuseumA;
shared static this() {
	actionScriptSumsFollowMuseumA = initializeScript!actionScriptSumsFollowMuseumA(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 18),
		SET_NPC_DESTINATION(NPCID.unknown1033),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		SET_NPC_DESTINATION(NPCID.unknown1033),
		MOVE_TOWARDS_DESTINATION(),
		SHORTJUMP("actionScriptSumsFollowMuseumA.UNKNOWN0"),
	);
}
/// $C36FB9
immutable ubyte[29 + 2 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptSumsMuseumReturn;
shared static this() {
	actionScriptSumsMuseumReturn = initializeScript!actionScriptSumsMuseumReturn(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 6984),
		SET_VAR(ActionScriptVars.v7, 9568),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 9543),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7024),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C36FE4
immutable ubyte[27 + 3 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptSyochoEscape;
shared static this() {
	actionScriptSyochoEscape = initializeScript!actionScriptSyochoEscape(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 16),
		START_TASK("unknownC3AFA3"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7632),
		SET_VAR(ActionScriptVars.v7, 216),
		SHORTCALL("actionScriptMoveToLocation"),
		PLAY_SFX(Sfx.doorClose),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37010
immutable ubyte[102 + 6 * (const(void)*).sizeof + 8 * ScriptPointer.sizeof] actionScriptSaiteiMaboroshiIn;
shared static this() {
	actionScriptSaiteiMaboroshiIn = initializeScript!actionScriptSaiteiMaboroshiIn(
		SET_X(5720),
		SET_Y(128),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(1280),
		SET_VAR(ActionScriptVars.v5, 5),
		SET_VAR(ActionScriptVars.v6, 5752),
		SET_VAR(ActionScriptVars.v7, 192),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5792),
		SET_VAR(ActionScriptVars.v7, 216),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5800),
		SET_VAR(ActionScriptVars.v7, 248),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5800),
		SET_VAR(ActionScriptVars.v7, 288),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5784),
		SET_VAR(ActionScriptVars.v7, 320),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5752),
		SET_VAR(ActionScriptVars.v7, 336),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5720),
		SET_VAR(ActionScriptVars.v7, 344),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v0, -32768),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		SET_MOVEMENT_FROM_ANGLE(),
		GET_DIRECTION_ROTATED_ANGLE_90(),
		LOOP(64),
			PAUSE(1),
			ADD(ActionScriptVars.v0, 4096),
			SPIRAL_MOVEMENT_FRAME(),
		LOOP_END(),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C37098
immutable ubyte[3 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSaiteiMaboroshiOut;
shared static this() {
	actionScriptSaiteiMaboroshiOut = initializeScript!actionScriptSaiteiMaboroshiOut(
		SHORTCALL("actionScriptSaiteiMaboroshiOutUnknownRoutine"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C370A2
immutable ubyte[72 + 1 * (const(void)*).sizeof + 8 * ScriptPointer.sizeof] actionScriptSaiteiMaboroshiOutUnknownRoutine;
shared static this() {
	actionScriptSaiteiMaboroshiOutUnknownRoutine = initializeScript!actionScriptSaiteiMaboroshiOutUnknownRoutine(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(1280),
		SET_VAR(ActionScriptVars.v5, 5),
		SET_VAR(ActionScriptVars.v6, 5672),
		SET_VAR(ActionScriptVars.v7, 336),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5656),
		SET_VAR(ActionScriptVars.v7, 320),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5640),
		SET_VAR(ActionScriptVars.v7, 288),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5640),
		SET_VAR(ActionScriptVars.v7, 248),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5648),
		SET_VAR(ActionScriptVars.v7, 216),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5688),
		SET_VAR(ActionScriptVars.v7, 192),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5720),
		SET_VAR(ActionScriptVars.v7, 128),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORT_RETURN(),
	);
}
/// $C370FD
immutable ubyte[63 + 10 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptInsekiStarman;
shared static this() {
	actionScriptInsekiStarman = initializeScript!actionScriptInsekiStarman(
		MOVE_TO_PARTY_MEMBER(PartyMember.ness),
		SET_Y_RELATIVE(-16),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		LOOP(4),
			SET_VAR(ActionScriptVars.v0, 13),
			C474A8(),
			PAUSE(7),
			SET_VAR(ActionScriptVars.v0, 0),
			C474A8(),
			PAUSE(7),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v0, 3),
		SET_VAR(ActionScriptVars.v1, 0),
		SET_VAR(ActionScriptVars.v2, 6),
		SET_VAR(ActionScriptVars.v3, 8),
		LOAD_FULLSCREEN_ANIMATION(),
		SHORTCALL("unknownC33C1D"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v1, 6),
		SET_VAR(ActionScriptVars.v2, 2),
		SHORTCALL("unknownC33C1D"),
		CLEAR_BG3_TILEMAP(),
		RESTORE_MAP_RENDERING(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3715D
immutable ubyte[108 + 9 * (const(void)*).sizeof + 8 * ScriptPointer.sizeof] actionScriptAkanbePokey;
shared static this() {
	actionScriptAkanbePokey = initializeScript!actionScriptAkanbePokey(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 8),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 3736),
		SET_VAR(ActionScriptVars.v7, 7872),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 3784),
		SET_VAR(ActionScriptVars.v7, 7904),
		SHORTCALL("actionScriptMoveToLocation"),
		START_TASK("unknownC3AFA3"),
		SET_VAR(ActionScriptVars.v6, 3808),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		YIELD_TO_TEXT(),
		PAUSE(1),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(20),
		SET_VAR(ActionScriptVars.v4, 20),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 3736),
		SET_VAR(ActionScriptVars.v7, 7904),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(8),
		END_LAST_TASK(),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v4, 4),
		SET_MOVEMENT_SPEED(608),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 3736),
		SET_VAR(ActionScriptVars.v7, 7688),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C371F4
immutable ubyte[4 + 1 * ScriptPointer.sizeof] actionScript624;
shared static this() {
	actionScript624 = initializeScript!actionScript624(
		SET_Y_RELATIVE(1),
		SHORTJUMP("actionScriptPeopleSleep"),
	);
}
/// $C371FA
immutable ubyte[51 + 4 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptMouseAddParty;
shared static this() {
	actionScriptMouseAddParty = initializeScript!actionScriptMouseAddParty(
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v5, 2),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SET_MOVEMENT_SPEED(384),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(0),
		SET_ANIMATION(0),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(10),
		LOOP(2),
			WRITE_WORD_TEMPVAR(Direction.left),
			SHORTCALL("actionScriptMoveInDirection"),
			PAUSE(3),
			WRITE_WORD_TEMPVAR(Direction.up),
			SHORTCALL("actionScriptMoveInDirection"),
			PAUSE(3),
			WRITE_WORD_TEMPVAR(Direction.right),
			SHORTCALL("actionScriptMoveInDirection"),
			PAUSE(3),
			WRITE_WORD_TEMPVAR(Direction.down),
			SHORTCALL("actionScriptMoveInDirection"),
			PAUSE(3),
		LOOP_END(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C37245
immutable ubyte[35 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptInsekiWakeupWalk;
shared static this() {
	actionScriptInsekiWakeupWalk = initializeScript!actionScriptInsekiWakeupWalk(
		SET_POSITION_CHANGE_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_X(8136),
		SET_Y(1096),
		SET_ANIMATION(255),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 8120),
		SET_VAR(ActionScriptVars.v7, 1096),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(4),
		SET_Y_RELATIVE(10),
		PAUSE(2),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37276
immutable ubyte[7 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptPeopleSleep;
shared static this() {
	actionScriptPeopleSleep = initializeScript!actionScriptPeopleSleep(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTJUMP("unknownC3A17B"),
	);
}
/// $C37287
immutable ubyte[20 + 6 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript628;
shared static this() {
	actionScript628 = initializeScript!actionScript628(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		PAUSE(24),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(48),
		SET_ANIMATION(255),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		IS_ENTITY_ONSCREEN(),
		JUMP_IF_TRUE("actionScript628.UNKNOWN0"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C372B0
immutable ubyte[203 + 10 * (const(void)*).sizeof + 21 * ScriptPointer.sizeof] actionScript629;
shared static this() {
	actionScript629 = initializeScript!actionScript629(
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_ANIMATION(0),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		START_TASK("unknownC3A15E"),
		START_TASK("checkCollisionTask"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 2136),
		SET_VAR(ActionScriptVars.v7, 242),
		SHORTCALL("actionScriptMoveToLocation"),
	LABEL("UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		SET_VELOCITIES_ZERO(),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v6, 2152),
		SET_VAR(ActionScriptVars.v7, 242),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v6, 2136),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v7, 280),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(1),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v7, 242),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(30),
		SHORTCALL("actionScript629.UNKNOWN1"),
		PAUSE(30),
		SHORTCALL("actionScript629.UNKNOWN1"),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v7, 248),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2114),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		PAUSE(60),
		LOOP(2),
			SET_VAR(ActionScriptVars.v6, 2135),
			SET_VAR(ActionScriptVars.v7, 248),
			SHORTCALL("actionScriptMoveToLocation"),
			PAUSE(2),
			SET_VAR(ActionScriptVars.v6, 2121),
			SHORTCALL("actionScriptMoveToLocation"),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v6, 2152),
		SET_VAR(ActionScriptVars.v7, 248),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(2),
		SET_VAR(ActionScriptVars.v7, 242),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(60),
		SHORTCALL("actionScript629.UNKNOWN1"),
		SET_VAR(ActionScriptVars.v6, 2136),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(2),
		SET_VAR(ActionScriptVars.v7, 242),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScript629.UNKNOWN0"),
	LABEL("UNKNOWN1"),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		SET_Y_VELOCITY(-336),
		PAUSE(4),
		SET_Y_VELOCITY(-144),
		PAUSE(4),
		SET_Y_VELOCITY(-64),
		PAUSE(4),
		SET_Y_VELOCITY(64),
		PAUSE(4),
		SET_Y_VELOCITY(144),
		PAUSE(4),
		SET_Y_VELOCITY(336),
		PAUSE(4),
		SET_VELOCITIES_ZERO(),
		PAUSE(6),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(256),
		SHORT_RETURN(),
	LABEL("UNKNOWN2"),
		PAUSE(30),
		TEST_PARTY_COLLISION(),
		JUMP_IF_FALSE("actionScript629.UNKNOWN2"),
		TRIGGER_TALK_TEXT(),
		SET_VAR(ActionScriptVars.v6, 2136),
		SET_VAR(ActionScriptVars.v7, 241),
		PAUSE(120),
		SHORTJUMP("actionScript629.UNKNOWN2"),
	);
}
/// $C373C2
immutable ubyte[42 + 10 * (const(void)*).sizeof] actionScriptLardnaSlapBunbuun;
shared static this() {
	actionScriptLardnaSlapBunbuun = initializeScript!actionScriptLardnaSlapBunbuun(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_VELOCITIES_ZERO(),
		PAUSE(4),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(4),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(4),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(4),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PLAY_SFX(Sfx.damageTaken),
		SET_VAR(ActionScriptVars.v0, 12),
		C474A8(),
		PAUSE(7),
		SET_VAR(ActionScriptVars.v0, 0),
		C474A8(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C37409
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript631;
shared static this() {
	actionScript631 = initializeScript!actionScript631(
		SHORTCALL("unknownC37439"),
		SHORTJUMP("actionScript632.ENTRY2"),
	);
}
/// $C3740F
immutable ubyte[32 + 5 * ScriptPointer.sizeof] actionScript632;
shared static this() {
	actionScript632 = initializeScript!actionScript632(
		PAUSE(240),
		SHORTCALL("unknownC37439"),
	LABEL("ENTRY2"),
		SET_VAR(ActionScriptVars.v6, 3144),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(120),
		SET_VAR(ActionScriptVars.v6, 3088),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(120),
		SET_VAR(ActionScriptVars.v6, 3033),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_ANIMATION(255),
		PAUSE(240),
		SET_X(3209),
		SET_ANIMATION(0),
		SHORTJUMP("actionScript632.ENTRY2"),
	);
}
/// $C37439
immutable ubyte[18 + 4 * (const(void)*).sizeof] unknownC37439;
shared static this() {
	unknownC37439 = initializeScript!unknownC37439(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		SET_MOVEMENT_SPEED(96),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v7, 5654),
		SHORT_RETURN(),
	);
}
/// $C37456
immutable ubyte[22 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptIntoNight;
shared static this() {
	actionScriptIntoNight = initializeScript!actionScriptIntoNight(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v0, 0),
		LOOP(31),
			ADD(ActionScriptVars.v0, -1),
			DO_PALETTES_FADE_STEP(),
			PAUSE(4),
		LOOP_END(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37479
immutable ubyte[22 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptBlackout;
shared static this() {
	actionScriptBlackout = initializeScript!actionScriptBlackout(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v0, 0),
		LOOP(31),
			ADD(ActionScriptVars.v0, -1),
			DO_PALETTES_FADE_STEP(),
			PAUSE(8),
		LOOP_END(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3749C
immutable ubyte[16 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptBlinkSuicide;
shared static this() {
	actionScriptBlinkSuicide = initializeScript!actionScriptBlinkSuicide(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		LOOP(3),
			SET_ANIMATION(255),
			PAUSE(5),
			SET_ANIMATION(0),
			PAUSE(5),
		LOOP_END(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C374B0
immutable ubyte[38 + 2 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptButukarizaru;
shared static this() {
	actionScriptButukarizaru = initializeScript!actionScriptButukarizaru(
		SHORTCALL("actionScriptSetWalkingSpeedVeryFast"),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2544),
		SET_VAR(ActionScriptVars.v7, 3856),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		SET_VAR(ActionScriptVars.v6, 2576),
		SET_VAR(ActionScriptVars.v7, 3872),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2608),
		SET_VAR(ActionScriptVars.v7, 3888),
		SHORTCALL("actionScriptMoveToLocation"),
		PLAY_SFX(Sfx.menuOpenClose),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C374E4
immutable ubyte[63 + 7 * (const(void)*).sizeof + 7 * ScriptPointer.sizeof] actionScriptLeaveButukarizaru;
shared static this() {
	actionScriptLeaveButukarizaru = initializeScript!actionScriptLeaveButukarizaru(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("actionScriptSetWalkingSpeedFastAnimationTask"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2576),
		SET_VAR(ActionScriptVars.v7, 3968),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v5, 1),
		END_LAST_TASK(),
		START_TASK("actionScriptSetWalkingSpeedSlowAnimationTask"),
		SET_VAR(ActionScriptVars.v6, 2592),
		SET_VAR(ActionScriptVars.v7, 3984),
		SHORTCALL("actionScriptMoveToLocationBackwards"),
		YIELD_TO_TEXT(),
		PAUSE(10),
		SET_MOVEMENT_SPEED(1536),
		SET_VAR(ActionScriptVars.v5, 6),
		END_LAST_TASK(),
		START_TASK("animateD2F2"),
		SET_VAR(ActionScriptVars.v6, 2440),
		SET_VAR(ActionScriptVars.v7, 3832),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37545
immutable ubyte[14 + 2 * (const(void)*).sizeof] unknownC37545;
shared static this() {
	unknownC37545 = initializeScript!unknownC37545(
		LOOP(2),
			UPDATE_SPRITE_DIRECTION(Direction.right, 0),
			PAUSE(16),
			UPDATE_SPRITE_DIRECTION(Direction.left, 0),
			PAUSE(16),
		LOOP_END(),
		SHORT_RETURN(),
	);
}
/// $C37559
immutable ubyte[14 + 2 * (const(void)*).sizeof] unknownC37559;
shared static this() {
	unknownC37559 = initializeScript!unknownC37559(
		LOOP(2),
			UPDATE_SPRITE_DIRECTION(Direction.left, 0),
			PAUSE(16),
			UPDATE_SPRITE_DIRECTION(Direction.right, 0),
			PAUSE(16),
		LOOP_END(),
		SHORT_RETURN(),
	);
}
/// $C3756D
immutable ubyte[32 + 1 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptUkkariCarrier;
shared static this() {
	actionScriptUkkariCarrier = initializeScript!actionScriptUkkariCarrier(
		SET_X(2672),
		SET_Y(3648),
		SHORTCALL("unknownC3AA82"),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2536),
		SET_VAR(ActionScriptVars.v7, 3784),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2536),
		SET_VAR(ActionScriptVars.v7, 3824),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C37596
immutable ubyte[34 + 1 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptLeaveUkkariCarrier;
shared static this() {
	actionScriptLeaveUkkariCarrier = initializeScript!actionScriptLeaveUkkariCarrier(
		SHORTCALL("actionScriptSetWalkingSpeedVeryFast"),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2560),
		SET_VAR(ActionScriptVars.v7, 3888),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2536),
		SET_VAR(ActionScriptVars.v7, 3928),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SET_VAR(ActionScriptVars.v6, 2760),
		SET_VAR(ActionScriptVars.v7, 4152),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C375C5
immutable ubyte[23 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptApproachContScript;
shared static this() {
	actionScriptApproachContScript = initializeScript!actionScriptApproachContScript(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 9),
		START_TASK("unknownC3AFA3"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 20),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C375EE
immutable ubyte[53 + 4 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptEavesMaid;
shared static this() {
	actionScriptEavesMaid = initializeScript!actionScriptEavesMaid(
		SET_X(2552),
		SET_Y(3728),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 7),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 20),
		SET_VAR(ActionScriptVars.v6, 2552),
		SET_VAR(ActionScriptVars.v7, 3840),
		SHORTCALL("actionScriptMoveToLocation"),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v6, 2584),
		SET_VAR(ActionScriptVars.v7, 3976),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SET_VAR(ActionScriptVars.v6, 2832),
		SET_VAR(ActionScriptVars.v7, 4224),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3763B
immutable ubyte[25 + 1 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript642;
shared static this() {
	actionScript642 = initializeScript!actionScript642(
		SHORTCALL("actionScriptSetWalkingSpeedVeryFast"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2048),
		SET_VAR(ActionScriptVars.v7, 7120),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1720),
		SET_VAR(ActionScriptVars.v7, 7120),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3765F
immutable ubyte[29 + 8 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptPanningWinters1;
shared static this() {
	actionScriptPanningWinters1 = initializeScript!actionScriptPanningWinters1(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.up),
		SHORTCALL("actionScriptMoveInDirection"),
		LOOP(5),
			PAUSE(60),
		LOOP_END(),
		FADE_OUT(1, 7),
		SHORTCALL("waitForFadeEnd"),
		WRITE_WORD_TEMPVAR(3),
		RUN_FLYOVER(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37698
immutable ubyte[36 + 8 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptPanningWinters2;
shared static this() {
	actionScriptPanningWinters2 = initializeScript!actionScriptPanningWinters2(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 496),
		SET_VAR(ActionScriptVars.v7, 2184),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VELOCITIES_ZERO(),
		PAUSE(120),
		FADE_OUT(1, 7),
		SHORTCALL("waitForFadeEnd"),
		WRITE_WORD_TEMPVAR(4),
		RUN_FLYOVER(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C376D8
immutable ubyte[29 + 8 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptPanningRamma1;
shared static this() {
	actionScriptPanningRamma1 = initializeScript!actionScriptPanningRamma1(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.upLeft),
		SHORTCALL("actionScriptMoveInDirection"),
		LOOP(5),
			PAUSE(60),
		LOOP_END(),
		FADE_OUT(1, 7),
		SHORTCALL("waitForFadeEnd"),
		WRITE_WORD_TEMPVAR(5),
		RUN_FLYOVER(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37711
immutable ubyte[36 + 8 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptPanningRamma2;
shared static this() {
	actionScriptPanningRamma2 = initializeScript!actionScriptPanningRamma2(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 4584),
		SET_VAR(ActionScriptVars.v7, 3480),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VELOCITIES_ZERO(),
		PAUSE(120),
		FADE_OUT(1, 7),
		SHORTCALL("waitForFadeEnd"),
		WRITE_WORD_TEMPVAR(6),
		RUN_FLYOVER(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37751
immutable ubyte[23 + 2 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript647;
shared static this() {
	actionScript647 = initializeScript!actionScript647(
		SHORTCALL("unknownC3AAB8"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v0, 1352),
		SET_VAR(ActionScriptVars.v1, 6928),
		SET_VAR(ActionScriptVars.v2, 56),
		SET_VAR(ActionScriptVars.v3, 32),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_ROOF_TONCHIKI"),
		HALT(),
	);
}
/// $C37778
immutable ubyte[71 + 7 * (const(void)*).sizeof] actionScriptJumpTonchiki;
shared static this() {
	actionScriptJumpTonchiki = initializeScript!actionScriptJumpTonchiki(
		SET_X(1368),
		SET_Y(6904),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3D),
		SET_ANIMATION(0),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_VELOCITIES_ZERO(),
		SET_Z(32),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(1),
		PLAY_SFX(Sfx.falling),
		SET_Y_VELOCITY(146),
		SET_X_VELOCITY(-219),
		SET_Z_VELOCITY(384),
		PAUSE(4),
		SET_Z_VELOCITY(128),
		PAUSE(4),
		SET_Z_VELOCITY(0),
		PAUSE(4),
		SET_Z_VELOCITY(-128),
		PAUSE(4),
		SET_Z_VELOCITY(-384),
		PAUSE(4),
		SET_Z_VELOCITY(-768),
		PAUSE(4),
		SET_Z_VELOCITY(-1280),
		PAUSE(4),
		PLAY_SFX(Sfx.tookDamage),
		SET_VELOCITIES_ZERO(),
		PAUSE(8),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C377D2
immutable ubyte[27 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptJumpTonchikiShadow;
shared static this() {
	actionScriptJumpTonchikiShadow = initializeScript!actionScriptJumpTonchikiShadow(
		SET_X(1368),
		SET_Y(6904),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(255),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(1),
		SET_Y_VELOCITY(146),
		SET_X_VELOCITY(-219),
		PAUSE(4),
		SET_ANIMATION(0),
		PAUSE(24),
		SET_VELOCITIES_ZERO(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C377F4
immutable ubyte[21 + 1 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptTonchikiEnterHouse;
shared static this() {
	actionScriptTonchikiEnterHouse = initializeScript!actionScriptTonchikiEnterHouse(
		SHORTCALL("unknownC3AA5A"),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 1360),
		SET_VAR(ActionScriptVars.v7, 6920),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 6904),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37814
immutable ubyte[62 + 8 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptStrikeNess;
shared static this() {
	actionScriptStrikeNess = initializeScript!actionScriptStrikeNess(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v0, 0),
		LOOP(31),
			ADD(ActionScriptVars.v0, -1),
			DO_PALETTES_FADE_STEP(),
			PAUSE(9),
		LOOP_END(),
		PLAY_SFX(Sfx.ouch),
		SET_VAR(ActionScriptVars.v0, 5),
		SET_VAR(ActionScriptVars.v1, 0),
		SET_VAR(ActionScriptVars.v2, 2),
		SET_VAR(ActionScriptVars.v3, 4),
		LOAD_FULLSCREEN_ANIMATION(),
		SHORTCALL("unknownC33C1D"),
		SET_VAR(ActionScriptVars.v1, 0),
		SET_VAR(ActionScriptVars.v2, 3),
		SET_VAR(ActionScriptVars.v3, 8),
		SHORTCALL("unknownC33C1D"),
		PAUSE(10),
		CLEAR_BG3_TILEMAP(),
		RESTORE_MAP_RENDERING(),
		PAUSE(1),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3786F
immutable ubyte[22 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptTakeNessKatacomb1A;
shared static this() {
	actionScriptTakeNessKatacomb1A = initializeScript!actionScriptTakeNessKatacomb1A(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_Y_RELATIVE(16),
		SHORTCALL("unknownC3AAB8"),
		PAUSE(32),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(16),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		HALT(),
	);
}
/// $C37891
immutable ubyte[25 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptTakeNessKatacomb2A;
shared static this() {
	actionScriptTakeNessKatacomb2A = initializeScript!actionScriptTakeNessKatacomb2A(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_X_RELATIVE(16),
		SHORTCALL("unknownC3AAB8"),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(100),
		PAUSE(74),
		SET_VELOCITIES_ZERO(),
		PAUSE(6),
		WRITE_WORD_TEMPVAR(Direction.upRight),
		SHORTCALL("actionScriptMoveInDirection"),
		HALT(),
	);
}
/// $C378B6
immutable ubyte[22 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptTakeNessKatacomb1B;
shared static this() {
	actionScriptTakeNessKatacomb1B = initializeScript!actionScriptTakeNessKatacomb1B(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_X_RELATIVE(-16),
		SHORTCALL("unknownC3AAB8"),
		PAUSE(64),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(16),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		HALT(),
	);
}
/// $C378D8
immutable ubyte[25 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptTakeNessKatacomb2B;
shared static this() {
	actionScriptTakeNessKatacomb2B = initializeScript!actionScriptTakeNessKatacomb2B(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_Y_RELATIVE(-16),
		SHORTCALL("unknownC3AAB8"),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(100),
		PAUSE(78),
		SET_VELOCITIES_ZERO(),
		PAUSE(24),
		WRITE_WORD_TEMPVAR(Direction.upRight),
		SHORTCALL("actionScriptMoveInDirection"),
		HALT(),
	);
}
/// $C378FD
immutable ubyte[20 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptTakeNessKatacomb1C;
shared static this() {
	actionScriptTakeNessKatacomb1C = initializeScript!actionScriptTakeNessKatacomb1C(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_X_RELATIVE(16),
		SHORTCALL("unknownC3AAB8"),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(48),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		HALT(),
	);
}
/// $C3791D
immutable ubyte[22 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptTakeNessKatacomb2C;
shared static this() {
	actionScriptTakeNessKatacomb2C = initializeScript!actionScriptTakeNessKatacomb2C(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_Y_RELATIVE(16),
		SHORTCALL("unknownC3AAB8"),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(100),
		PAUSE(102),
		WRITE_WORD_TEMPVAR(Direction.upRight),
		SHORTCALL("actionScriptMoveInDirection"),
		HALT(),
	);
}
/// $C3793F
immutable ubyte[36 + 10 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptNessFollowZombi1;
shared static this() {
	actionScriptNessFollowZombi1 = initializeScript!actionScriptNessFollowZombi1(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC37A7C"),
		PAUSE(32),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		WRITE_WORD_TEMPVAR(Direction.down),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(32),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		WRITE_WORD_TEMPVAR(Direction.left),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(120),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37987
immutable ubyte[31 + 8 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptPaulaFollowZombi1;
shared static this() {
	actionScriptPaulaFollowZombi1 = initializeScript!actionScriptPaulaFollowZombi1(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC37A7C"),
		PAUSE(16),
		PAUSE(32),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		WRITE_WORD_TEMPVAR(Direction.down),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(32),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		WRITE_WORD_TEMPVAR(Direction.left),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C379C0
immutable ubyte[39 + 10 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptNessFollowZombi2;
shared static this() {
	actionScriptNessFollowZombi2 = initializeScript!actionScriptNessFollowZombi2(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC37A7C"),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		WRITE_WORD_TEMPVAR(Direction.right),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(100),
		PAUSE(90),
		SET_VELOCITIES_ZERO(),
		PAUSE(12),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		SET_DIRECTION(),
		WRITE_WORD_TEMPVAR(Direction.upRight),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(40),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37A0B
immutable ubyte[42 + 10 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptPaulaFollowZombi2;
shared static this() {
	actionScriptPaulaFollowZombi2 = initializeScript!actionScriptPaulaFollowZombi2(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_X_RELATIVE(-16),
		SHORTCALL("unknownC37A7C"),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		WRITE_WORD_TEMPVAR(Direction.right),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(100),
		PAUSE(90),
		SET_VELOCITIES_ZERO(),
		PAUSE(12),
		WRITE_WORD_TEMPVAR(Direction.right),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(16),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		SET_DIRECTION(),
		WRITE_WORD_TEMPVAR(Direction.upRight),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C37A55
immutable ubyte[3 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptNessStill;
shared static this() {
	actionScriptNessStill = initializeScript!actionScriptNessStill(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C37A5D
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptPaulaStill;
shared static this() {
	actionScriptPaulaStill = initializeScript!actionScriptPaulaStill(
		SET_X(6792),
		SET_Y(10056),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C37A66
immutable ubyte[14 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptBikiniLookNess;
shared static this() {
	actionScriptBikiniLookNess = initializeScript!actionScriptBikiniLookNess(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_X_RELATIVE(48),
		SET_Y_RELATIVE(32),
		SHORTCALL("unknownC3AAB8"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		HALT(),
	);
}
/// $C37A7C
immutable ubyte[10 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC37A7C;
shared static this() {
	unknownC37A7C = initializeScript!unknownC37A7C(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("unknownC3A15E"),
		SET_VAR(ActionScriptVars.v4, 1),
		SET_VELOCITIES_ZERO(),
		SHORT_RETURN(),
	);
}
/// $C37A8A
immutable ubyte[29 + 2 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptAyasii;
shared static this() {
	actionScriptAyasii = initializeScript!actionScriptAyasii(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_X_RELATIVE(128),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 4),
		SET_MOVEMENT_SPEED(1024),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(32),
		SET_VELOCITIES_ZERO(),
		PAUSE(10),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(32),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37AB5
immutable ubyte[56 + 6 * (const(void)*).sizeof + 7 * ScriptPointer.sizeof] actionScript666;
shared static this() {
	actionScript666 = initializeScript!actionScript666(
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		START_TASK("checkCollisionTask"),
		START_TASK("actionScriptMapObjStillEntry2"),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 64),
		SET_VAR(ActionScriptVars.v3, 64),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		WRITE_WORD_TEMPVAR(0),
		SET_EVENT_FLAG(EventFlag.thrkEscaperAppear),
		END_LAST_TASK(),
		START_TASK("animateDVAR4F2"),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_VAR(ActionScriptVars.v4, 5),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5592),
		SET_VAR(ActionScriptVars.v7, 9152),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5592),
		SET_VAR(ActionScriptVars.v7, 9136),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37B0B
immutable ubyte[48 + 9 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptMuMaboroshiOut;
shared static this() {
	actionScriptMuMaboroshiOut = initializeScript!actionScriptMuMaboroshiOut(
		SET_X(4960),
		SET_Y(4128),
		SET_Z(0),
		SHORTCALL("unknownC3AB26"),
		SET_VAR(ActionScriptVars.v0, 0),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		SET_MOVEMENT_FROM_ANGLE(),
		GET_DIRECTION_ROTATED_ANGLE_90(),
		WRITE_WORD_TEMPVAR(0),
		SET_MOVEMENT_SPEED(),
		SET_Z_VELOCITY(512),
		LOOP(128),
			PAUSE(1),
			ADD(ActionScriptVars.v0, 4096),
			MOVE_TO_SPRITE(OverworldSprite.starMasterFlyingAway),
			SPIRAL_MOVEMENT_FRAME(),
			HALVE_Y_SPEED(),
			GET_MOVEMENT_SPEED(),
			ADD_TEMPVAR(128),
			SET_MOVEMENT_SPEED(),
		LOOP_END(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37B0B
immutable ubyte[81 + 1 * (const(void)*).sizeof + 9 * ScriptPointer.sizeof] actionScriptMaboroshiOut;
shared static this() {
	actionScriptMaboroshiOut = initializeScript!actionScriptMaboroshiOut(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(1280),
		SET_VAR(ActionScriptVars.v5, 5),
		SET_VAR(ActionScriptVars.v6, 1688),
		SET_VAR(ActionScriptVars.v7, 5536),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1672),
		SET_VAR(ActionScriptVars.v7, 5528),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1648),
		SET_VAR(ActionScriptVars.v7, 5504),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1632),
		SET_VAR(ActionScriptVars.v7, 5472),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1632),
		SET_VAR(ActionScriptVars.v7, 5440),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1648),
		SET_VAR(ActionScriptVars.v7, 5416),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1680),
		SET_VAR(ActionScriptVars.v7, 5384),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1728),
		SET_VAR(ActionScriptVars.v7, 5312),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORT_RETURN(),
	);
}
/// $C37B5A
immutable ubyte[25 + 1 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptLeaveSarusensei;
shared static this() {
	actionScriptLeaveSarusensei = initializeScript!actionScriptLeaveSarusensei(
		SHORTCALL("unknownC3AA6E"),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 7536),
		SET_VAR(ActionScriptVars.v7, 6792),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7600),
		SET_VAR(ActionScriptVars.v7, 6792),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37B7E
immutable ubyte[73 + 11 * (const(void)*).sizeof + 1 * string.sizeof + 9 * ScriptPointer.sizeof] actionScriptLeadSarusensei;
shared static this() {
	actionScriptLeadSarusensei = initializeScript!actionScriptLeadSarusensei(
		SHORTCALL("unknownC3AA82"),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1416),
		SET_VAR(ActionScriptVars.v7, 9792),
		SHORTCALL("actionScriptMoveToLocation"),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 40),
		SET_VAR(ActionScriptVars.v3, 48),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_TRUE("actionScriptLeadSarusensei.UNKNOWN0"),
		GET_DIRECTION_FROM_PLAYER_TO_ENTITY(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
	LABEL("UNKNOWN0"),
		SET_VAR(ActionScriptVars.v6, 1376),
		SET_VAR(ActionScriptVars.v7, 9856),
		SHORTCALL("actionScriptMoveToLocation"),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 96),
		SET_VAR(ActionScriptVars.v3, 32),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_TRUE("actionScriptLeadSarusensei.UNKNOWN1"),
		GET_DIRECTION_FROM_PLAYER_TO_ENTITY(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
	LABEL("UNKNOWN1"),
		SET_VAR(ActionScriptVars.v6, 1264),
		SET_VAR(ActionScriptVars.v7, 9960),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1232),
		SET_VAR(ActionScriptVars.v7, 10000),
		SHORTCALL("actionScriptMoveToLocation"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_READY_SARUSENSEI"),
		HALT(),
	);
}
/// $C37BFE
immutable ubyte[142 + 18 * (const(void)*).sizeof + 12 * ScriptPointer.sizeof] actionScriptTeleportSarusensei;
shared static this() {
	actionScriptTeleportSarusensei = initializeScript!actionScriptTeleportSarusensei(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("animateD9F2"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1232),
		SET_VAR(ActionScriptVars.v7, 10032),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		SET_MOVEMENT_SPEED(64),
		START_TASK("animateD24F2"),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1200),
		SET_VAR(ActionScriptVars.v7, 10032),
		SHORTCALL("actionScriptMoveToLocationBackwards"),
		YIELD_TO_TEXT(),
		START_TASK("animateD8F2"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 5),
		START_TASK("actionScriptTeleportSarusenseiTask1"),
		SET_VAR(ActionScriptVars.v6, 1488),
		SET_VAR(ActionScriptVars.v7, 10032),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VELOCITIES_ZERO(),
		PAUSE(240),
		START_TASK("actionScriptTeleportSarusenseiTask2"),
		SET_MOVEMENT_SPEED(768),
		SET_VAR(ActionScriptVars.v0, 4),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 1336),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v0, 6),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1264),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v0, 12),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 1200),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SET_VAR(ActionScriptVars.v6, 1264),
		SET_VAR(ActionScriptVars.v7, 9928),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		CLEAR_TICK_CALLBACK(),
		YIELD_TO_TEXT(),
		WRITE_WORD_WRAM(&psiTeleportDestination, 14), // teleport to dusty dunes
		START_PSI_TELEPORT_TUTORIAL(),
		HALT(),
	);
}
/// $C3
immutable ubyte[12 + 2 * (const(void)*).sizeof] actionScriptTeleportSarusenseiTask1;
shared static this() {
	actionScriptTeleportSarusenseiTask1 = initializeScript!actionScriptTeleportSarusenseiTask1(
		LOOP(15),
			PAUSE(8),
			GET_MOVEMENT_SPEED(),
			ADD_TEMPVAR(64),
			SET_MOVEMENT_SPEED(),
		LOOP_END(),
		END_TASK(),
	);
}
/// $C3
immutable ubyte[12 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTeleportSarusenseiTask2;
shared static this() {
	actionScriptTeleportSarusenseiTask2 = initializeScript!actionScriptTeleportSarusenseiTask2(
		WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v0),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v0),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		JUMP_IF_TRUE("actionScriptTeleportSarusenseiTask2"),
		SHORTJUMP("actionScriptReturnSarusensei"),
	);
}
/// $C37CFD
immutable ubyte[42 + 6 * ScriptPointer.sizeof] actionScriptReturnSarusensei;
shared static this() {
	actionScriptReturnSarusensei = initializeScript!actionScriptReturnSarusensei(
		SHORTCALL("unknownC3AA82"),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1288),
		SET_VAR(ActionScriptVars.v7, 9944),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1328),
		SET_VAR(ActionScriptVars.v7, 9912),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1288),
		SET_VAR(ActionScriptVars.v7, 9872),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1544),
		SET_VAR(ActionScriptVars.v7, 9704),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37D33
immutable ubyte[52 + 9 * (const(void)*).sizeof + 1 * string.sizeof + 7 * ScriptPointer.sizeof] actionScript672;
shared static this() {
	actionScript672 = initializeScript!actionScript672(
		SHORTCALL("actionScript674.ENTRY3"),
	LABEL("UNKNOWN0"),
		WRITE_WORD_TEMPVAR(0),
		SET_EVENT_FLAG(EventFlag.animPort4),
		CHOOSE_RANDOM(400, 600, 1200, 1800),
		WRITE_TEMPVAR_WAITTIMER(),
		WRITE_WRAM_TEMPVAR(&battleSwirlCountdown),
		JUMP_IF_TRUE("actionScript674.ENTRY2"),
		WRITE_WRAM_TEMPVAR(&enemyHasBeenTouched),
		JUMP_IF_TRUE("actionScript674.ENTRY2"),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 248),
		SET_VAR(ActionScriptVars.v3, 248),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript672.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v2, 4),
		SET_VAR(ActionScriptVars.v3, 4),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript672.UNKNOWN1"),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.animPort4),
	LABEL("UNKNOWN1"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_FOUNTAIN_A"),
		SHORTCALL("actionScript674.ENTRY4"),
		SHORTJUMP("actionScript672.UNKNOWN0"),
	);
}
/// $C37D92
immutable ubyte[52 + 9 * (const(void)*).sizeof + 1 * string.sizeof + 7 * ScriptPointer.sizeof] actionScript673;
shared static this() {
	actionScript673 = initializeScript!actionScript673(
		SHORTCALL("actionScript674.ENTRY3"),
	LABEL("UNKNOWN0"),
		WRITE_WORD_TEMPVAR(0),
		SET_EVENT_FLAG(EventFlag.animPort5),
		CHOOSE_RANDOM(400, 600, 1200, 1800),
		WRITE_TEMPVAR_WAITTIMER(),
		WRITE_WRAM_TEMPVAR(&battleSwirlCountdown),
		JUMP_IF_TRUE("actionScript674.ENTRY2"),
		WRITE_WRAM_TEMPVAR(&enemyHasBeenTouched),
		JUMP_IF_TRUE("actionScript674.ENTRY2"),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 248),
		SET_VAR(ActionScriptVars.v3, 248),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript673.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v2, 4),
		SET_VAR(ActionScriptVars.v3, 4),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript673.UNKNOWN1"),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.animPort5),
	LABEL("UNKNOWN1"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_FOUNTAIN_B"),
		SHORTCALL("actionScript674.ENTRY4"),
		SHORTJUMP("actionScript673.UNKNOWN0"),
	);
}
/// $C37DF1
immutable ubyte[104 + 22 * (const(void)*).sizeof + 1 * string.sizeof + 9 * ScriptPointer.sizeof] actionScript674;
shared static this() {
	actionScript674 = initializeScript!actionScript674(
		SHORTCALL("actionScript674.ENTRY3"),
	LABEL("ENTRY2"),
		WRITE_WORD_TEMPVAR(0),
		SET_EVENT_FLAG(EventFlag.animPort6),
		CHOOSE_RANDOM(400, 600, 1200, 1800),
		WRITE_TEMPVAR_WAITTIMER(),
		WRITE_WRAM_TEMPVAR(&battleSwirlCountdown),
		JUMP_IF_TRUE("actionScript674.ENTRY2"),
		WRITE_WRAM_TEMPVAR(&enemyHasBeenTouched),
		JUMP_IF_TRUE("actionScript674.ENTRY2"),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 248),
		SET_VAR(ActionScriptVars.v3, 248),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript674.ENTRY2"),
		SET_VAR(ActionScriptVars.v2, 4),
		SET_VAR(ActionScriptVars.v3, 4),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript674.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.animPort6),
	LABEL("UNKNOWN0"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_FOUNTAIN_C"),
		SHORTCALL("actionScript674.ENTRY4"),
		SHORTJUMP("actionScript674.ENTRY2"),
	LABEL("ENTRY3"),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(255),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		START_TASK("actionScriptMapObjStillEntry2"),
		SHORT_RETURN(),
	LABEL("ENTRY4"),
		PAUSE(1),
		CLEAR_CURRENT_ENTITY_COLLISION2(),
		START_TASK("actionScript674Task"),
		PLAY_SFX(Sfx.spray),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		PAUSE(8),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		PAUSE(8),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		PAUSE(180),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		PAUSE(8),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		PAUSE(8),
		END_LAST_TASK(),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_ANIMATION(255),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORT_RETURN(),
	);
}
/// $C37EAE
immutable ubyte[12 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript674Task;
shared static this() {
	actionScript674Task = initializeScript!actionScript674Task(
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(4),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(4),
		JUMP_IF_TRUE("actionScript674Task"),
		SHORTJUMP("actionScriptChiteiQuake"),
	);
}
/// $C37EC1
immutable ubyte[79 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptChiteiQuake;
shared static this() {
	actionScriptChiteiQuake = initializeScript!actionScriptChiteiQuake(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptCentreScreenOnEntityCallback),
		START_TASK("actionScriptChiteiQuakeTask"),
		LOOP(2),
			SET_Y_RELATIVE(-3),
			PAUSE(6),
			SET_Y_RELATIVE(3),
			PAUSE(6),
			SET_Y_RELATIVE(3),
			PAUSE(6),
			SET_Y_RELATIVE(-3),
			PAUSE(6),
		LOOP_END(),
		LOOP(3),
			SET_Y_RELATIVE(-2),
			PAUSE(6),
			SET_Y_RELATIVE(2),
			PAUSE(6),
			SET_Y_RELATIVE(2),
			PAUSE(6),
			SET_Y_RELATIVE(-2),
			PAUSE(6),
		LOOP_END(),
		LOOP(5),
			SET_Y_RELATIVE(-1),
			PAUSE(6),
			SET_Y_RELATIVE(1),
			PAUSE(6),
			SET_Y_RELATIVE(1),
			PAUSE(6),
			SET_Y_RELATIVE(-1),
			PAUSE(6),
		LOOP_END(),
		CLEAR_TICK_CALLBACK(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37F1F
immutable ubyte[70] actionScriptChiteiQuakeTask;
shared static this() {
	actionScriptChiteiQuakeTask = initializeScript!actionScriptChiteiQuakeTask(
		LOOP(6),
			SET_X_RELATIVE(3),
			PAUSE(2),
			SET_X_RELATIVE(-3),
			PAUSE(2),
			SET_X_RELATIVE(-3),
			PAUSE(2),
			SET_X_RELATIVE(3),
			PAUSE(2),
		LOOP_END(),
		LOOP(9),
			SET_X_RELATIVE(2),
			PAUSE(2),
			SET_X_RELATIVE(-2),
			PAUSE(2),
			SET_X_RELATIVE(-2),
			PAUSE(2),
			SET_X_RELATIVE(2),
			PAUSE(2),
		LOOP_END(),
		LOOP(15),
			SET_X_RELATIVE(1),
			PAUSE(2),
			SET_X_RELATIVE(-1),
			PAUSE(2),
			SET_X_RELATIVE(-1),
			PAUSE(2),
			SET_X_RELATIVE(1),
			PAUSE(2),
		LOOP_END(),
		END_TASK(),
	);
}
/// $C37F65
immutable ubyte[5 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptToFountainA;
shared static this() {
	actionScriptToFountainA = initializeScript!actionScriptToFountainA(
		SHORTCALL("actionScriptToFountainCommon1"),
		SET_NPC_DESTINATION(NPCID.unknown1303),
		SHORTJUMP("actionScriptToFountainCommon2"),
	);
}
/// $C37F71
immutable ubyte[5 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptToFountainB;
shared static this() {
	actionScriptToFountainB = initializeScript!actionScriptToFountainB(
		SHORTCALL("actionScriptToFountainCommon1"),
		SET_NPC_DESTINATION(NPCID.unknown1304),
		SHORTJUMP("actionScriptToFountainCommon2"),
	);
}
/// $C37F7D
immutable ubyte[5 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptToFountainC;
shared static this() {
	actionScriptToFountainC = initializeScript!actionScriptToFountainC(
		SHORTCALL("actionScriptToFountainCommon1"),
		SET_NPC_DESTINATION(NPCID.unknown1305),
		SHORTJUMP("actionScriptToFountainCommon2"),
	);
}
/// $C37F89
immutable ubyte[15 + 5 * (const(void)*).sizeof] actionScriptToFountainCommon1;
shared static this() {
	actionScriptToFountainCommon1 = initializeScript!actionScriptToFountainCommon1(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SHORT_RETURN(),
	);
}
/// $C37FA5
immutable ubyte[27 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptToFountainCommon2;
shared static this() {
	actionScriptToFountainCommon2 = initializeScript!actionScriptToFountainCommon2(
		ADD(ActionScriptVars.v7, -5),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VELOCITIES_ZERO(),
		GET_PARTY_COUNT(),
		LOOP_TEMPVAR(),
			LOOP(8),
				SET_X_VELOCITY(8),
				PAUSE(1),
				SET_X_VELOCITY(-8),
				PAUSE(1),
			LOOP_END(),
		LOOP_END(),
		SET_VELOCITIES_ZERO(),
		MOVE_PARTY_TO_LEADER_POSITION(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C37FCD
immutable ubyte[62 + 5 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptLiftByFountain;
shared static this() {
	actionScriptLiftByFountain = initializeScript!actionScriptLiftByFountain(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_Y_RELATIVE(9),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3D),
		SET_ANIMATION(0),
		START_TASK("animateD8F2Toggle"),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_Z(9),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		PAUSE(1),
		SET_Z_VELOCITY(512),
		PAUSE(8),
		SET_Z_VELOCITY(256),
		PAUSE(8),
		SET_Z_VELOCITY(0),
		LOOP(15),
			SET_Z_RELATIVE(1),
			PAUSE(6),
			SET_Z_RELATIVE(-1),
			PAUSE(6),
		LOOP_END(),
		SET_Z_VELOCITY(-256),
		PAUSE(8),
		SET_Z_VELOCITY(-512),
		PAUSE(8),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3801C
immutable ubyte[34 + 2 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptMaidIntoBuilding;
shared static this() {
	actionScriptMaidIntoBuilding = initializeScript!actionScriptMaidIntoBuilding(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 9),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 3460),
		SET_VAR(ActionScriptVars.v7, 4133),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v6, 3460),
		SET_VAR(ActionScriptVars.v7, 4112),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3804C
immutable ubyte[53 + 6 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptMakyoDoctorApproach;
shared static this() {
	actionScriptMakyoDoctorApproach = initializeScript!actionScriptMakyoDoctorApproach(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("animateD12F2"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5845),
		SET_VAR(ActionScriptVars.v7, 7128),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		SET_ANIMATION(0),
		PAUSE(120),
		START_TASK("animateD12F2"),
		SET_VAR(ActionScriptVars.v5, 18),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(2),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5840),
		SET_VAR(ActionScriptVars.v7, 7128),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3809C
immutable ubyte[25 + 1 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptGoOutCakeWife;
shared static this() {
	actionScriptGoOutCakeWife = initializeScript!actionScriptGoOutCakeWife(
		SHORTCALL("unknownC3AA5A"),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7872),
		SET_VAR(ActionScriptVars.v7, 9168),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7896),
		SET_VAR(ActionScriptVars.v7, 9168),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C380C0
immutable ubyte[87 + 8 * (const(void)*).sizeof + 1 * string.sizeof + 10 * ScriptPointer.sizeof] actionScript683;
shared static this() {
	actionScript683 = initializeScript!actionScript683(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v1, 7356),
		SET_VAR(ActionScriptVars.v2, 20),
		SET_VAR(ActionScriptVars.v3, 12),
		SET_VAR(ActionScriptVars.v4, 0),
	LABEL("UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 492),
		PAUSE(60),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript683.UNKNOWN1"),
		ADD(ActionScriptVars.v4, 1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		ADD_TEMPVAR(-7),
		JUMP_IF_TRUE("actionScript683.UNKNOWN4"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_DOSEI_ONSEN_HEAL"),
		PAUSE(2),
		SHORTJUMP("actionScript683.UNKNOWN3"),
	LABEL("UNKNOWN1"),
		IS_ENTITY_ONSCREEN(),
		JUMP_IF_TRUE("actionScript683.UNKNOWN2"),
		SET_VAR(ActionScriptVars.v0, 0),
		DO_PALETTES_FADE_STEP(),
		PAUSE(1),
		SHORTJUMP("actionScriptTerminate"),
	LABEL("UNKNOWN2"),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_FALSE("actionScript683.UNKNOWN4"),
		ADD_TEMPVAR(-1),
		JUMP_IF_FALSE("actionScript683.UNKNOWN3"),
		ADD_TEMPVAR(-1),
		JUMP_IF_FALSE("actionScript683.UNKNOWN3"),
		ADD(ActionScriptVars.v4, -3),
		SHORTJUMP("actionScript683.UNKNOWN4"),
	LABEL("UNKNOWN3"),
		SET_VAR(ActionScriptVars.v4, 0),
	LABEL("UNKNOWN4"),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v0),
		DO_PALETTES_FADE_STEP(),
		PAUSE(1),
		SHORTJUMP("actionScript683.UNKNOWN0"),
	);
}
/// $C38146
immutable ubyte[77 + 6 * (const(void)*).sizeof + 1 * string.sizeof + 8 * ScriptPointer.sizeof] actionScript684;
shared static this() {
	actionScript684 = initializeScript!actionScript684(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v1, 136),
		SET_VAR(ActionScriptVars.v2, 12),
		SET_VAR(ActionScriptVars.v3, 12),
		SET_VAR(ActionScriptVars.v4, 0),
	LABEL("UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 288),
		PAUSE(60),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript684.UNKNOWN1"),
		ADD(ActionScriptVars.v4, 1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		ADD_TEMPVAR(-7),
		JUMP_IF_TRUE("actionScript684.UNKNOWN3"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_GUMI_ONSEN_HEAL"),
		PAUSE(2),
		SHORTJUMP("actionScript684.UNKNOWN2"),
	LABEL("UNKNOWN1"),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_FALSE("actionScript684.UNKNOWN3"),
		ADD_TEMPVAR(-1),
		JUMP_IF_FALSE("actionScript684.UNKNOWN2"),
		ADD_TEMPVAR(-1),
		JUMP_IF_FALSE("actionScript684.UNKNOWN2"),
		ADD(ActionScriptVars.v4, -3),
		SHORTJUMP("actionScript684.UNKNOWN3"),
	LABEL("UNKNOWN2"),
		SET_VAR(ActionScriptVars.v4, 0),
	LABEL("UNKNOWN3"),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v0),
		DO_PALETTES_FADE_STEP(),
		PAUSE(1),
		SHORTJUMP("actionScript684.UNKNOWN0"),
	);
}
/// $C381B8
immutable ubyte[24 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSlotBrosRotateL;
shared static this() {
	actionScriptSlotBrosRotateL = initializeScript!actionScriptSlotBrosRotateL(
		SHORTCALL("unknownC3AAB8"),
		PLAY_SFX(Sfx.cursor3),
		GET_SELF_DIRECTION(),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v1),
	LABEL("UNKNOWN0"),
		ADD(ActionScriptVars.v1, 2),
		AND(ActionScriptVars.v1, 7),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(4),
		SHORTJUMP("actionScriptSlotBrosRotateL.UNKNOWN0"),
	);
}
/// $C381E0
immutable ubyte[24 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSlotBrosRotateM;
shared static this() {
	actionScriptSlotBrosRotateM = initializeScript!actionScriptSlotBrosRotateM(
		SHORTCALL("unknownC3AAB8"),
		PLAY_SFX(Sfx.cursor3),
		GET_SELF_DIRECTION(),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v1),
	LABEL("UNKNOWN0"),
		ADD(ActionScriptVars.v1, 2),
		AND(ActionScriptVars.v1, 7),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(6),
		SHORTJUMP("actionScriptSlotBrosRotateM.UNKNOWN0"),
	);
}
/// $C38208
immutable ubyte[24 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSlotBrosRotateN;
shared static this() {
	actionScriptSlotBrosRotateN = initializeScript!actionScriptSlotBrosRotateN(
		SHORTCALL("unknownC3AAB8"),
		PLAY_SFX(Sfx.cursor3),
		GET_SELF_DIRECTION(),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v1),
	LABEL("UNKNOWN0"),
		ADD(ActionScriptVars.v1, 2),
		AND(ActionScriptVars.v1, 7),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(5),
		SHORTJUMP("actionScriptSlotBrosRotateN.UNKNOWN0"),
	);
}
/// $C38230
immutable ubyte[31 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptSlotBrosStopL;
shared static this() {
	actionScriptSlotBrosStopL = initializeScript!actionScriptSlotBrosStopL(
		SHORTCALL("unknownC3AAB8"),
		GET_SELF_DIRECTION(),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v1),
		SHORTCALL("unknownC383BC"),
		LOOP_TEMPVAR(),
			ADD(ActionScriptVars.v1, 2),
			AND(ActionScriptVars.v1, 7),
			WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(4),
		LOOP_END(),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
		SHORTCALL("unknownC3835D"),
		PLAY_SFX(Sfx.cursor4),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C38264
immutable ubyte[31 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptSlotBrosStopM;
shared static this() {
	actionScriptSlotBrosStopM = initializeScript!actionScriptSlotBrosStopM(
		SHORTCALL("unknownC3AAB8"),
		GET_SELF_DIRECTION(),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v1),
		SHORTCALL("unknownC383BC"),
		LOOP_TEMPVAR(),
			ADD(ActionScriptVars.v1, 2),
			AND(ActionScriptVars.v1, 7),
			WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(6),
		LOOP_END(),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
		SHORTCALL("unknownC3835D"),
		PLAY_SFX(Sfx.cursor4),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C38298
immutable ubyte[31 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptSlotBrosStopN;
shared static this() {
	actionScriptSlotBrosStopN = initializeScript!actionScriptSlotBrosStopN(
		SHORTCALL("unknownC3AAB8"),
		GET_SELF_DIRECTION(),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v1),
		SHORTCALL("unknownC383BC"),
		LOOP_TEMPVAR(),
			ADD(ActionScriptVars.v1, 2),
			AND(ActionScriptVars.v1, 7),
			WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(5),
		LOOP_END(),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
		SHORTCALL("unknownC3835D"),
		PLAY_SFX(Sfx.cursor4),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C382CC
immutable ubyte[40 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptSlotBrosStopNReach;
shared static this() {
	actionScriptSlotBrosStopNReach = initializeScript!actionScriptSlotBrosStopNReach(
		SHORTCALL("unknownC3AAB8"),
		GET_SELF_DIRECTION(),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v1),
		SET_VAR(ActionScriptVars.v2, 10),
		SHORTCALL("unknownC383BC"),
		LOOP_TEMPVAR(),
			ADD(ActionScriptVars.v1, 2),
			AND(ActionScriptVars.v1, 7),
			WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PLAY_SFX(Sfx.cursor4),
			WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v2),
			ADD(ActionScriptVars.v2, 2),
		LOOP_END(),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
		SHORTCALL("unknownC3835D"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C38309
immutable ubyte[52 + 8 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptSlotBrosPresent;
shared static this() {
	actionScriptSlotBrosPresent = initializeScript!actionScriptSlotBrosPresent(
		SHORTCALL("unknownC3AA38"),
		GET_SELF_DIRECTION(),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v1),
		START_TASK("unknownC3AFA3"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 3232),
		SET_VAR(ActionScriptVars.v7, 9952),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, -1),
		SET_ANIMATION(0),
		SET_DIRECTION8(Direction.left),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v6, 3232),
		SET_VAR(ActionScriptVars.v7, 9912),
		SET_VAR(ActionScriptVars.v4, 0),
		SHORTCALL("actionScriptMoveToLocationBackwards"),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3835D
immutable ubyte[55 + 8 * (const(void)*).sizeof + 8 * ScriptPointer.sizeof] unknownC3835D;
shared static this() {
	unknownC3835D = initializeScript!unknownC3835D(
		SWITCH_JUMP_TEMPVAR("unknownC3835D.UNKNOWN0", "unknownC3835D.UNKNOWN0", "unknownC3835D.UNKNOWN1", "unknownC3835D.UNKNOWN1", "unknownC3835D.UNKNOWN2", "unknownC3835D.UNKNOWN2", "unknownC3835D.UNKNOWN3", "unknownC3835D.UNKNOWN3"),
		SHORT_RETURN(),
	LABEL("UNKNOWN0"),
		WRITE_WORD_TEMPVAR(0),
		SET_EVENT_FLAG(EventFlag.animPort0),
		WRITE_WORD_TEMPVAR(0),
		SET_EVENT_FLAG(EventFlag.animPort1),
		SHORT_RETURN(),
	LABEL("UNKNOWN1"),
		WRITE_WORD_TEMPVAR(0),
		SET_EVENT_FLAG(EventFlag.animPort0),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.animPort1),
		SHORT_RETURN(),
	LABEL("UNKNOWN2"),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.animPort0),
		WRITE_WORD_TEMPVAR(0),
		SET_EVENT_FLAG(EventFlag.animPort1),
		SHORT_RETURN(),
	LABEL("UNKNOWN3"),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.animPort0),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.animPort1),
		SHORT_RETURN(),
	);
}
/// $C383BC
immutable ubyte[19 + 1 * (const(void)*).sizeof] unknownC383BC;
shared static this() {
	unknownC383BC = initializeScript!unknownC383BC(
		CHOOSE_RANDOM(10, 11, 12, 13, 14, 15, 16, 17),
		SHORT_RETURN(),
	);
}
/// $C383D2
immutable ubyte[29 + 8 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript693;
shared static this() {
	actionScript693 = initializeScript!actionScript693(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(8),
		IS_ENTITY_ONSCREEN(),
		JUMP_IF_TRUE("actionScript693.UNKNOWN0"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3840A
immutable ubyte[29 + 8 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript694;
shared static this() {
	actionScript694 = initializeScript!actionScript694(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(16),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(16),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(16),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(16),
		IS_ENTITY_ONSCREEN(),
		JUMP_IF_TRUE("actionScript694.UNKNOWN0"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C38442
immutable ubyte[115 + 5 * (const(void)*).sizeof + 10 * ScriptPointer.sizeof] actionScriptEvtIntoPsychoMyHome;
shared static this() {
	actionScriptEvtIntoPsychoMyHome = initializeScript!actionScriptEvtIntoPsychoMyHome(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(120),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v4, 18),
		SET_MOVEMENT_SPEED(96),
		SET_VAR(ActionScriptVars.v6, 6256),
		SET_VAR(ActionScriptVars.v7, 1096),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 18),
		SET_VAR(ActionScriptVars.v7, 992),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6288),
		SET_VAR(ActionScriptVars.v7, 928),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(120),
		SET_VAR(ActionScriptVars.v4, 18),
		SET_VAR(ActionScriptVars.v7, 856),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6240),
		SET_VAR(ActionScriptVars.v7, 808),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 768),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6264),
		SET_VAR(ActionScriptVars.v7, 736),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 632),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6272),
		SET_VAR(ActionScriptVars.v7, 600),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C384D8
immutable ubyte[9 + 1 * ScriptPointer.sizeof] actionScriptEvtPsychoMyHome1f;
shared static this() {
	actionScriptEvtPsychoMyHome1f = initializeScript!actionScriptEvtPsychoMyHome1f(
		SET_VAR(ActionScriptVars.v6, 1576),
		SET_VAR(ActionScriptVars.v7, 8784),
		SHORTJUMP("actionScriptEvtPsychoMyHomeCommon"),
	);
}
/// $C384E3
immutable ubyte[9 + 1 * ScriptPointer.sizeof] actionScriptEvtPsychoMyHomeRouka;
shared static this() {
	actionScriptEvtPsychoMyHomeRouka = initializeScript!actionScriptEvtPsychoMyHomeRouka(
		SET_VAR(ActionScriptVars.v6, 5616),
		SET_VAR(ActionScriptVars.v7, 4840),
		SHORTJUMP("actionScriptEvtPsychoMyHomeCommon"),
	);
}
/// $C384EE
immutable ubyte[9 + 1 * ScriptPointer.sizeof] actionScriptEvtPsychoMyRoom;
shared static this() {
	actionScriptEvtPsychoMyRoom = initializeScript!actionScriptEvtPsychoMyRoom(
		SET_VAR(ActionScriptVars.v6, 6016),
		SET_VAR(ActionScriptVars.v7, 2136),
		SHORTJUMP("actionScriptEvtPsychoMyHomeCommon"),
	);
}
/// $C384F9
immutable ubyte[13 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptEvtPsychoMyHomeCommon;
shared static this() {
	actionScriptEvtPsychoMyHomeCommon = initializeScript!actionScriptEvtPsychoMyHomeCommon(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("actionScriptMakeIntangible"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C38515
immutable ubyte[26 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript699;
shared static this() {
	actionScript699 = initializeScript!actionScript699(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 8),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 26),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		GET_POSITION_OF_PARTY_MEMBER(255),
		MOVE_TOWARDS_DESTINATION(),
		JUMP_IF_FALSE("actionScript699.UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		HALT(),
	);
}
/// $C38544
immutable ubyte[107 + 6 * (const(void)*).sizeof + 1 * string.sizeof + 9 * ScriptPointer.sizeof] actionScript700;
shared static this() {
	actionScript700 = initializeScript!actionScript700(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 0),
		START_TASK("actionScript700Task"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v0, 5656),
		SET_VAR(ActionScriptVars.v1, 5984),
		SET_VAR(ActionScriptVars.v2, 16),
		SET_VAR(ActionScriptVars.v3, 16),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		SET_VAR(ActionScriptVars.v4, 16),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5632),
		SET_VAR(ActionScriptVars.v7, 6016),
		SHORTCALL("actionScriptMoveToLocationBackwards"),
		QUEUE_TEXT_SCRIPT("MSG_FOUR_MONOTOLY"),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v4, 9),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5608),
		SET_VAR(ActionScriptVars.v7, 6016),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_NPC_DESTINATION(NPCID.unknown0873),
		ADD(ActionScriptVars.v7, 8),
		SHORTCALL("actionScriptMoveToLocation"),
		ADD(ActionScriptVars.v6, -16),
		SHORTCALL("actionScriptMoveToLocation"),
		ADD(ActionScriptVars.v7, -8),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
	LABEL("UNKNOWN0"),
		PAUSE(4),
		SET_X_RELATIVE(1),
		PAUSE(4),
		SET_X_RELATIVE(-1),
		SHORTJUMP("actionScript700.UNKNOWN0"),
	);
}
/// $C3
immutable ubyte[6 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript700Task;
shared static this() {
	actionScript700Task = initializeScript!actionScript700Task(
		MAKE_NPC_LOOK_AT_SELF(NPCID.unknown0873),
		PAUSE(3),
		SHORTJUMP("actionScript700"),
	);
}
/// $C385E2
immutable ubyte[99 + 11 * (const(void)*).sizeof + 9 * ScriptPointer.sizeof] actionScriptEvtMonotolyGoSwitch;
shared static this() {
	actionScriptEvtMonotolyGoSwitch = initializeScript!actionScriptEvtMonotolyGoSwitch(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 12),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5616),
		SET_VAR(ActionScriptVars.v7, 6016),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 6000),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5596),
		SET_VAR(ActionScriptVars.v7, 5984),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v4, 20),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v6, 5632),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 5992),
		SHORTCALL("actionScriptMoveToLocation"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v4, 12),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v6, 5616),
		SET_VAR(ActionScriptVars.v7, 6000),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 6016),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5544),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		GET_DIRECTION_FROM_PLAYER_TO_ENTITY(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(1),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C38678
immutable ubyte[15 + 3 * (const(void)*).sizeof] actionScriptEvtMonokumaMove;
shared static this() {
	actionScriptEvtMonokumaMove = initializeScript!actionScriptEvtMonokumaMove(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(64),
		PAUSE(144),
		SET_VELOCITIES_ZERO(),
		PLAY_SFX(Sfx.doorOpen),
		HALT(),
	);
}
/// $C3868F
immutable ubyte[18 + 3 * (const(void)*).sizeof] actionScriptEvtMonokabeMove;
shared static this() {
	actionScriptEvtMonokabeMove = initializeScript!actionScriptEvtMonokabeMove(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		LOOP(8),
			SET_Y_VELOCITY(-256),
			PAUSE(4),
			SET_VELOCITIES_ZERO(),
			PAUSE(16),
		LOOP_END(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C386A9
immutable ubyte[4 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript704;
shared static this() {
	actionScript704 = initializeScript!actionScript704(
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_PRIORITY(3),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C386B2
immutable ubyte[48 + 5 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptCarpainterThunder;
shared static this() {
	actionScriptCarpainterThunder = initializeScript!actionScriptCarpainterThunder(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		START_TASK("actionScriptCarpainterThunderCommon"),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v0, 2),
		SET_VAR(ActionScriptVars.v1, 0),
		SET_VAR(ActionScriptVars.v2, 4),
		SET_VAR(ActionScriptVars.v3, 7),
		LOAD_FULLSCREEN_ANIMATION(),
		SHORTCALL("unknownC33C1D"),
		SET_VAR(ActionScriptVars.v1, 0),
		SHORTCALL("unknownC33C1D"),
		SET_VAR(ActionScriptVars.v1, 0),
		SET_VAR(ActionScriptVars.v2, 7),
		SET_VAR(ActionScriptVars.v3, 8),
		SHORTCALL("unknownC33C1D"),
		CLEAR_BG3_TILEMAP(),
		RESTORE_MAP_RENDERING(),
		PAUSE(1),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C386FA
immutable ubyte[55 + 9 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptCarpainterThunderhead;
shared static this() {
	actionScriptCarpainterThunderhead = initializeScript!actionScriptCarpainterThunderhead(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		START_TASK("actionScriptCarpainterThunderCommon"),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v0, 2),
		LOAD_FULLSCREEN_ANIMATION(),
		SET_VAR(ActionScriptVars.v2, 4),
		SET_VAR(ActionScriptVars.v3, 7),
		LOOP(3),
			SET_VAR(ActionScriptVars.v1, 0),
			SHORTCALL("unknownC33C1D"),
		LOOP_END(),
		PLAY_SFX(Sfx.psiFreezeFinish),
		PAUSE(6),
		YIELD_TO_TEXT(),
		SET_VAR(ActionScriptVars.v1, 3),
		LOOP(4),
			UPDATE_FULLSCREEN_ANIMATION(),
			PAUSE(10),
			ADD(ActionScriptVars.v1, -1),
		LOOP_END(),
		CLEAR_BG3_TILEMAP(),
		RESTORE_MAP_RENDERING(),
		PAUSE(1),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C38751
immutable ubyte[26 + 2 * (const(void)*).sizeof] actionScriptCarpainterThunderCommon;
shared static this() {
	actionScriptCarpainterThunderCommon = initializeScript!actionScriptCarpainterThunderCommon(
		LOOP(11),
			SET_VAR(ActionScriptVars.v0, 10),
			C474A8(),
			SET_VAR(ActionScriptVars.v0, 2),
			PAUSE(4),
			SET_VAR(ActionScriptVars.v0, 0),
			C474A8(),
			SET_VAR(ActionScriptVars.v0, 2),
			PAUSE(4),
		LOOP_END(),
		END_TASK(),
	);
}
/// $C38771
immutable ubyte[4 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript707;
shared static this() {
	actionScript707 = initializeScript!actionScript707(
		GET_EVENT_FLAG(EventFlag.itemHaemitu),
		SHORTJUMP("actionScript707_708_709_710_Common"),
	);
}
/// $C3877A
immutable ubyte[4 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript708;
shared static this() {
	actionScript708 = initializeScript!actionScript708(
		GET_EVENT_FLAG(EventFlag.itemLetter1),
		SHORTJUMP("actionScript707_708_709_710_Common"),
	);
}
/// $C38783
immutable ubyte[4 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript709;
shared static this() {
	actionScript709 = initializeScript!actionScript709(
		GET_EVENT_FLAG(EventFlag.itemLetter2),
		SHORTJUMP("actionScript707_708_709_710_Common"),
	);
}
/// $C3878C
immutable ubyte[4 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript710;
shared static this() {
	actionScript710 = initializeScript!actionScript710(
		GET_EVENT_FLAG(EventFlag.itemLetter3),
		SHORTJUMP("actionScript707_708_709_710_Common"),
	);
}
/// $C38795
immutable ubyte[16 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript707_708_709_710_Common;
shared static this() {
	actionScript707_708_709_710_Common = initializeScript!actionScript707_708_709_710_Common(
		JUMP_IF_TRUE("actionScript707_708_709_710_Common.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(4),
		JUMP_IF_TRUE("actionScript707_708_709_710_Common.UNKNOWN1"),
	LABEL("UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.up),
	LABEL("UNKNOWN1"),
		SET_DIRECTION(),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(0),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTJUMP("actionScriptMapObjStillEntry2"),
	);
}
/// $C387B6
immutable ubyte[129 + 13 * (const(void)*).sizeof + 8 * ScriptPointer.sizeof] actionScriptEvtMonoHeliBoatman;
shared static this() {
	actionScriptEvtMonoHeliBoatman = initializeScript!actionScriptEvtMonoHeliBoatman(
		MOVE_TO_SPRITE(OverworldSprite.helicopter),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(255),
		PAUSE(1),
		YIELD_TO_TEXT(),
		PAUSE(1),
		START_TASK("unknownC3AFA3"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 3464),
		SET_VAR(ActionScriptVars.v7, 3800),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(60),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v6, 3560),
		SET_VAR(ActionScriptVars.v7, 3704),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v6, 3528),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(768),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 3472),
		SET_VAR(ActionScriptVars.v7, 3768),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 3392),
		SET_VAR(ActionScriptVars.v7, 3760),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v6, 3376),
		SET_VAR(ActionScriptVars.v7, 3752),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_EVENT_FLAG(EventFlag.animPort0),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v6, 3360),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_X_VELOCITY(352),
		SET_Y_VELOCITY(-64),
		PAUSE(32),
		SET_Y_VELOCITY(-128),
		PAUSE(32),
		SET_Y_VELOCITY(-256),
		PAUSE(64),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3886C
immutable ubyte[51 + 9 * (const(void)*).sizeof + 1 * string.sizeof + 3 * ScriptPointer.sizeof] actionScript711;
shared static this() {
	actionScript711 = initializeScript!actionScript711(
		SET_PRIORITY(0),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v0, 3456),
		SET_VAR(ActionScriptVars.v1, 3800),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 8),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_HELIPOKEY"),
		PAUSE(1),
	LABEL("UNKNOWN0"),
		MOVE_TO_SPRITE(OverworldSprite.hitChr),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.animPort0),
		JUMP_IF_FALSE("actionScript711.UNKNOWN0"),
		SET_PRIORITY(3),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
	LABEL("UNKNOWN1"),
		MOVE_TO_SPRITE(OverworldSprite.hitChr),
		PAUSE(1),
		SHORTJUMP("actionScript711.UNKNOWN1"),
	);
}
/// $C388C3
immutable ubyte[90 + 7 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptEvtHeliFWingStart;
shared static this() {
	actionScriptEvtHeliFWingStart = initializeScript!actionScriptEvtHeliFWingStart(
		SET_PRIORITY(0),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		START_TASK("unknownC3899E"),
		START_TASK("unknownC38978"),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(6),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(20),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(16),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(10),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(24),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(6),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(120),
		YIELD_TO_TEXT(),
	LABEL("UNKNOWN0"),
		MOVE_TO_SPRITE(OverworldSprite.hitChr),
		SET_Y_RELATIVE(-24),
		SET_X_RELATIVE(-8),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.animPort0),
		JUMP_IF_FALSE("actionScriptEvtHeliFWingStart.UNKNOWN0"),
		SET_PRIORITY(3),
	LABEL("UNKNOWN1"),
		MOVE_TO_SPRITE(OverworldSprite.hitChr),
		SET_Y_RELATIVE(-24),
		SET_X_RELATIVE(8),
		PAUSE(1),
		SHORTJUMP("actionScriptEvtHeliFWingStart.UNKNOWN1"),
	);
}
/// $C38939
immutable ubyte[41 + 5 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptEvtHeliRWingStart;
shared static this() {
	actionScriptEvtHeliRWingStart = initializeScript!actionScriptEvtHeliRWingStart(
		SET_PRIORITY(0),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		START_TASK("unknownC3899E"),
		START_TASK("unknownC38978"),
		SET_VAR(ActionScriptVars.v4, 0),
	LABEL("UNKNOWN0"),
		MOVE_TO_SPRITE(OverworldSprite.hitChr),
		SET_Y_RELATIVE(-16),
		SET_X_RELATIVE(16),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.animPort0),
		JUMP_IF_FALSE("actionScriptEvtHeliRWingStart.UNKNOWN0"),
	LABEL("UNKNOWN1"),
		MOVE_TO_SPRITE(OverworldSprite.hitChr),
		SET_Y_RELATIVE(-16),
		SET_X_RELATIVE(-16),
		PAUSE(1),
		SHORTJUMP("actionScriptEvtHeliRWingStart.UNKNOWN1"),
	);
}
/// $C38978
immutable ubyte[22 + 2 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] unknownC38978;
shared static this() {
	unknownC38978 = initializeScript!unknownC38978(
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_TRUE("unknownC38978.UNKNOWN1"),
		GET_EVENT_FLAG(EventFlag.animPort0),
		JUMP_IF_TRUE("unknownC38978.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(6),
		SHORTJUMP("unknownC38978.UNKNOWN2"),
	LABEL("UNKNOWN0"),
		WRITE_WORD_TEMPVAR(2),
		SHORTJUMP("unknownC38978.UNKNOWN2"),
	LABEL("UNKNOWN1"),
		WRITE_WORD_TEMPVAR(Direction.down),
	LABEL("UNKNOWN2"),
		SET_DIRECTION(),
		PAUSE(1),
		SHORTJUMP("unknownC38978"),
	);
}
/// $C3899E
immutable ubyte[17 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3899E;
shared static this() {
	unknownC3899E = initializeScript!unknownC3899E(
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(1),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(1),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(1),
		SHORTJUMP("unknownC3899E"),
	);
}
/// $C389BD
immutable ubyte[22 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtMonoHeliShadow;
shared static this() {
	actionScriptEvtMonoHeliShadow = initializeScript!actionScriptEvtMonoHeliShadow(
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_PRIORITY(3),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(32),
		LOOP(8),
			SET_ANIMATION(255),
			PAUSE(1),
			SET_ANIMATION(0),
			PAUSE(1),
		LOOP_END(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C389DD
immutable ubyte[19 + 4 * (const(void)*).sizeof] actionScriptHeliPokeyFace;
shared static this() {
	actionScriptHeliPokeyFace = initializeScript!actionScriptHeliPokeyFace(
		MOVE_TO_SPRITE(OverworldSprite.helicopter),
		SET_X_RELATIVE(21),
		SET_Y_RELATIVE(-14),
		SET_PRIORITY(0),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C389FB
immutable ubyte[135 + 9 * (const(void)*).sizeof + 10 * ScriptPointer.sizeof] actionScriptEvtPray1Mama;
shared static this() {
	actionScriptEvtPray1Mama = initializeScript!actionScriptEvtPray1Mama(
		SET_X(1576),
		SET_Y(8784),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 17),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 1600),
		SET_VAR(ActionScriptVars.v7, 8784),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1616),
		SET_VAR(ActionScriptVars.v7, 8800),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1688),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v4, 0),
		SHORTCALL("unknownC37559"),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 8),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1632),
		SET_VAR(ActionScriptVars.v7, 8800),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1624),
		SET_VAR(ActionScriptVars.v7, 8792),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1624),
		SET_VAR(ActionScriptVars.v7, 8776),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1648),
		SET_VAR(ActionScriptVars.v7, 8768),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v4, 16),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 1616),
		SET_VAR(ActionScriptVars.v7, 8784),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C38AB1
immutable ubyte[33 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptEvtPray1Tracy;
shared static this() {
	actionScriptEvtPray1Tracy = initializeScript!actionScriptEvtPray1Tracy(
		SET_X(1576),
		SET_Y(8784),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 8),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1600),
		SET_VAR(ActionScriptVars.v7, 8784),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		HALT(),
	);
}
/// $C38ADC
immutable ubyte[51 + 6 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptEvtPray1Dog;
shared static this() {
	actionScriptEvtPray1Dog = initializeScript!actionScriptEvtPray1Dog(
		SET_X(1912),
		SET_Y(8808),
		SHORTCALL("unknownC3AAAA"),
		START_TASK("actionScriptEvtPray1DogTask"),
		SET_VAR(ActionScriptVars.v4, 8),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PLAY_SFX(Sfx.doorClose),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1608),
		SET_VAR(ActionScriptVars.v7, 8808),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		SET_VAR(ActionScriptVars.v7, 8792),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		PAUSE(60),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3
immutable ubyte[9 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtPray1DogTask;
shared static this() {
	actionScriptEvtPray1DogTask = initializeScript!actionScriptEvtPray1DogTask(
		MAKE_SPRITE_LOOK_AT_SELF(OverworldSprite.mom),
		MAKE_SPRITE_LOOK_AT_SELF(OverworldSprite.tracy),
		PAUSE(3),
		SHORTJUMP("actionScriptEvtPray1DogTask"),
	);
}
/// $C38B3A
immutable ubyte[23 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptEvtPray2Bikini;
shared static this() {
	actionScriptEvtPray2Bikini = initializeScript!actionScriptEvtPray2Bikini(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 10),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5616),
		SET_VAR(ActionScriptVars.v7, 2824),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C38B5D
immutable ubyte[24 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptEvtPray2Nice;
shared static this() {
	actionScriptEvtPray2Nice = initializeScript!actionScriptEvtPray2Nice(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 8),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5432),
		SET_VAR(ActionScriptVars.v7, 2760),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		HALT(),
	);
}
/// $C38B7F
immutable ubyte[50 + 4 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptEvtPray2Okay;
shared static this() {
	actionScriptEvtPray2Okay = initializeScript!actionScriptEvtPray2Okay(
		SET_X(5312),
		SET_Y(2712),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 8),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5312),
		SET_VAR(ActionScriptVars.v7, 2736),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v7, 2760),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5412),
		SET_VAR(ActionScriptVars.v7, 2760),
		SHORTCALL("actionScriptMoveToLocation"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		END_LAST_TASK(),
		HALT(),
	);
}
/// $C38BC5
immutable ubyte[40 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptEvtPray2Groovy;
shared static this() {
	actionScriptEvtPray2Groovy = initializeScript!actionScriptEvtPray2Groovy(
		SET_X(5240),
		SET_Y(2808),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 7),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5368),
		SET_VAR(ActionScriptVars.v7, 2776),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5392),
		SET_VAR(ActionScriptVars.v7, 2760),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C38BFC
immutable ubyte[92 + 8 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptEvtPray3Polapapa;
shared static this() {
	actionScriptEvtPray3Polapapa = initializeScript!actionScriptEvtPray3Polapapa(
		SET_X(1936),
		SET_Y(7120),
		SHORTCALL("unknownC31D4F"),
		SET_VAR(ActionScriptVars.v4, 14),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 2024),
		SET_VAR(ActionScriptVars.v7, 7120),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v4, 0),
		SHORTCALL("unknownC37559"),
		PAUSE(100),
		SET_VAR(ActionScriptVars.v4, 7),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2064),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2128),
		SET_VAR(ActionScriptVars.v7, 7056),
		SHORTCALL("actionScriptMoveToLocation"),
		PLAY_SFX(Sfx.doorOpen),
		SET_X_RELATIVE(-256),
		PAUSE(160),
		SET_X_RELATIVE(256),
		PLAY_SFX(Sfx.doorClose),
		YIELD_TO_TEXT(),
		SET_VAR(ActionScriptVars.v6, 2096),
		SET_VAR(ActionScriptVars.v7, 7088),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C38C7C
immutable ubyte[36 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptEvtPray3Polamama;
shared static this() {
	actionScriptEvtPray3Polamama = initializeScript!actionScriptEvtPray3Polamama(
		SET_X(2128),
		SET_Y(7056),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 8),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PLAY_SFX(Sfx.doorClose),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2112),
		SET_VAR(ActionScriptVars.v7, 7088),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C38CB0
immutable ubyte[36 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptEvtPray3ChildA;
shared static this() {
	actionScriptEvtPray3ChildA = initializeScript!actionScriptEvtPray3ChildA(
		SET_X(2128),
		SET_Y(7056),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 10),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PLAY_SFX(Sfx.doorClose),
		SET_MOVEMENT_SPEED(288),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2104),
		SET_VAR(ActionScriptVars.v7, 7072),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C38CE4
immutable ubyte[36 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptEvtPray3ChildB;
shared static this() {
	actionScriptEvtPray3ChildB = initializeScript!actionScriptEvtPray3ChildB(
		SET_X(2128),
		SET_Y(7056),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 14),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PLAY_SFX(Sfx.doorClose),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2128),
		SET_VAR(ActionScriptVars.v7, 7072),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C38D18
immutable ubyte[37 + 5 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptEvtPray3ChildD;
shared static this() {
	actionScriptEvtPray3ChildD = initializeScript!actionScriptEvtPray3ChildD(
		SET_X(2128),
		SET_Y(7056),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 20),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PLAY_SFX(Sfx.doorClose),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 2084),
		SET_VAR(ActionScriptVars.v7, 7072),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C38D50
immutable ubyte[68 + 7 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptEvtPray4Tony;
shared static this() {
	actionScriptEvtPray4Tony = initializeScript!actionScriptEvtPray4Tony(
		SET_X(7892),
		SET_Y(3032),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 7),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PLAY_SFX(Sfx.doorClose),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 7892),
		SET_VAR(ActionScriptVars.v7, 3080),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		SHORTCALL("unknownC37559"),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 7),
		SET_VAR(ActionScriptVars.v6, 7728),
		SHORTCALL("actionScriptMoveToLocation"),
		PLAY_SFX(Sfx.unknown61),
		YIELD_TO_TEXT(),
		PAUSE(1),
		PLAY_SFX(Sfx.unknown61),
		PAUSE(40),
		SET_VAR(ActionScriptVars.v6, 7912),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		HALT(),
	);
}
/// $C38DB3
immutable ubyte[6 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtPray4GazeTony;
shared static this() {
	actionScriptEvtPray4GazeTony = initializeScript!actionScriptEvtPray4GazeTony(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		SHORTJUMP("actionScriptEvtPray4GazeTonyEntry2"),
	);
}
/// $C38DBD
immutable ubyte[10 + 5 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtPray4GazeTonyEntry2;
shared static this() {
	actionScriptEvtPray4GazeTonyEntry2 = initializeScript!actionScriptEvtPray4GazeTonyEntry2(
		SET_SPRITE_DESTINATION(OverworldSprite.tony),
		GET_ANGLE_TO_DESTINATION(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(4),
		SHORTJUMP("actionScriptEvtPray4GazeTonyEntry2"),
	);
}
/// $C38DD8
immutable ubyte[24 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptEvtPray4PupilA;
shared static this() {
	actionScriptEvtPray4PupilA = initializeScript!actionScriptEvtPray4PupilA(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 10),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 7928),
		SET_VAR(ActionScriptVars.v7, 3072),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		SHORTJUMP("actionScriptEvtPray4GazeTonyEntry2"),
	);
}
/// $C38DFC
immutable ubyte[38 + 2 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptEvtPray4PupilB;
shared static this() {
	actionScriptEvtPray4PupilB = initializeScript!actionScriptEvtPray4PupilB(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 10),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 7984),
		SET_VAR(ActionScriptVars.v7, 3104),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7952),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7896),
		SET_VAR(ActionScriptVars.v7, 3096),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		SHORTJUMP("actionScriptEvtPray4GazeTonyEntry2"),
	);
}
/// $C38E32
immutable ubyte[33 + 2 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptEvtPray4PupilC;
shared static this() {
	actionScriptEvtPray4PupilC = initializeScript!actionScriptEvtPray4PupilC(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 10),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 7976),
		SET_VAR(ActionScriptVars.v7, 3120),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7912),
		SET_VAR(ActionScriptVars.v7, 3096),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		SHORTJUMP("actionScriptEvtPray4GazeTonyEntry2"),
	);
}
/// $C38E61
immutable ubyte[25 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptEvtPray4PupilD;
shared static this() {
	actionScriptEvtPray4PupilD = initializeScript!actionScriptEvtPray4PupilD(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 10),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 7936),
		SET_VAR(ActionScriptVars.v7, 3088),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptEvtPray4GazeTonyEntry2"),
	);
}
/// $C38E89
immutable ubyte[35 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptEvtPray4Gaus;
shared static this() {
	actionScriptEvtPray4Gaus = initializeScript!actionScriptEvtPray4Gaus(
		SET_X(7728),
		SET_Y(3080),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 11),
		PLAY_SFX(Sfx.unknown12),
		PAUSE(40),
		SET_MOVEMENT_SPEED(288),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 7888),
		SET_VAR(ActionScriptVars.v7, 3080),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C38EB9
immutable ubyte[29 + 6 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtPray4Explain;
shared static this() {
	actionScriptEvtPray4Explain = initializeScript!actionScriptEvtPray4Explain(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 10),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		LOOP(6),
			CHOOSE_RANDOM(Direction.down, Direction.right, Direction.left, Direction.down),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(50),
		LOOP_END(),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C38EEA
immutable ubyte[5 + 1 * ScriptPointer.sizeof] actionScriptEvtPray4DirDown;
shared static this() {
	actionScriptEvtPray4DirDown = initializeScript!actionScriptEvtPray4DirDown(
		SET_VAR(ActionScriptVars.v0, 4),
		SHORTJUMP("actionScriptEvtPray4DirCommon"),
	);
}
/// $C38EF1
immutable ubyte[5 + 1 * ScriptPointer.sizeof] actionScriptEvtPray4DirLeft;
shared static this() {
	actionScriptEvtPray4DirLeft = initializeScript!actionScriptEvtPray4DirLeft(
		SET_VAR(ActionScriptVars.v0, 6),
		SHORTJUMP("actionScriptEvtPray4DirCommon"),
	);
}
/// $C38EF8
immutable ubyte[5 + 1 * ScriptPointer.sizeof] actionScriptEvtPray4DirRight;
shared static this() {
	actionScriptEvtPray4DirRight = initializeScript!actionScriptEvtPray4DirRight(
		SET_VAR(ActionScriptVars.v0, 2),
		SHORTJUMP("actionScriptEvtPray4DirCommon"),
	);
}
/// $C38EFF
immutable ubyte[5 + 1 * ScriptPointer.sizeof] actionScript740;
shared static this() {
	actionScript740 = initializeScript!actionScript740(
		SET_VAR(ActionScriptVars.v0, 0),
		SHORTJUMP("actionScriptEvtPray4DirCommon"),
	);
}
/// $C38F06
immutable ubyte[10 + 4 * (const(void)*).sizeof] actionScriptEvtPray4DirCommon;
shared static this() {
	actionScriptEvtPray4DirCommon = initializeScript!actionScriptEvtPray4DirCommon(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C38F1B
immutable ubyte[14 + 5 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtPray5GirlA;
shared static this() {
	actionScriptEvtPray5GirlA = initializeScript!actionScriptEvtPray5GirlA(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTCALL("unknownC37545"),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C38F39
immutable ubyte[53 + 4 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptEvtPray5GirlB;
shared static this() {
	actionScriptEvtPray5GirlB = initializeScript!actionScriptEvtPray5GirlB(
		SET_X(4560),
		SET_Y(3528),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 11),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(288),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 4560),
		SET_VAR(ActionScriptVars.v7, 3552),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(10),
		SHORTCALL("unknownC37545"),
		START_TASK("actionScriptEvtPray5GirlBTask"),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v6, 4408),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 3472),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		PAUSE(30),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3
immutable ubyte[6 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtPray5GirlBTask;
shared static this() {
	actionScriptEvtPray5GirlBTask = initializeScript!actionScriptEvtPray5GirlBTask(
		MAKE_NPC_LOOK_AT_SELF(NPCID.unknown1110),
		PAUSE(3),
		SHORTJUMP("actionScriptEvtPray5GirlBTask"),
	);
}
/// $C38F91
immutable ubyte[41 + 4 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptEvtPray5GirlC;
shared static this() {
	actionScriptEvtPray5GirlC = initializeScript!actionScriptEvtPray5GirlC(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 10),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(288),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 4440),
		SET_VAR(ActionScriptVars.v7, 3568),
		SHORTCALL("actionScriptMoveToLocation"),
		START_TASK("actionScriptEvtPray5GirlCTask"),
		SET_VAR(ActionScriptVars.v6, 4400),
		SET_VAR(ActionScriptVars.v7, 3488),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		PAUSE(30),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3
immutable ubyte[9 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtPray5GirlCTask;
shared static this() {
	actionScriptEvtPray5GirlCTask = initializeScript!actionScriptEvtPray5GirlCTask(
		MAKE_NPC_LOOK_AT_SELF(NPCID.unknown1110),
		MAKE_SPRITE_LOOK_AT_SELF(OverworldSprite.chineseGirl),
		PAUSE(3),
		SHORTJUMP("actionScriptEvtPray5GirlCTask"),
	);
}
/// $C38FDF
immutable ubyte[47 + 4 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptEvtPray6Frank;
shared static this() {
	actionScriptEvtPray6Frank = initializeScript!actionScriptEvtPray6Frank(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTCALL("unknownC37545"),
		PAUSE(30),
		SET_VAR(ActionScriptVars.v4, 16),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7544),
		SET_VAR(ActionScriptVars.v7, 496),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7560),
		SET_VAR(ActionScriptVars.v7, 504),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C39022
immutable ubyte[1 + 1 * ScriptPointer.sizeof] actionScript745;
shared static this() {
	actionScript745 = initializeScript!actionScript745(
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C39025
immutable ubyte[9 + 1 * ScriptPointer.sizeof] actionScriptEvtPray7STunnel;
shared static this() {
	actionScriptEvtPray7STunnel = initializeScript!actionScriptEvtPray7STunnel(
		SET_X(384),
		SET_Y(7616),
		PAUSE(2),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C39030
immutable ubyte[24 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtPray7Andoughnut;
shared static this() {
	actionScriptEvtPray7Andoughnut = initializeScript!actionScriptEvtPray7Andoughnut(
		MOVE_TO_SPRITE(OverworldSprite.phaseDistorter),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 18),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_Y_VELOCITY(128),
		PAUSE(64),
		SET_Y_VELOCITY(0),
		END_LAST_TASK(),
		PAUSE(20),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C39053
immutable ubyte[23 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtPray7Applekid;
shared static this() {
	actionScriptEvtPray7Applekid = initializeScript!actionScriptEvtPray7Applekid(
		MOVE_TO_SPRITE(OverworldSprite.phaseDistorter),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 0),
		PAUSE(32),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		SET_Y_VELOCITY(128),
		PAUSE(32),
		SET_Y_VELOCITY(0),
		END_LAST_TASK(),
		HALT(),
	);
}
/// $C39072
immutable ubyte[7 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtPray7Kyorokyoro;
shared static this() {
	actionScriptEvtPray7Kyorokyoro = initializeScript!actionScriptEvtPray7Kyorokyoro(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		SHORTCALL("unknownC37545"),
		HALT(),
	);
}
/// $C39080
immutable ubyte[38 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptEvtPray7Motchy;
shared static this() {
	actionScriptEvtPray7Motchy = initializeScript!actionScriptEvtPray7Motchy(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 12),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 344),
		SET_VAR(ActionScriptVars.v7, 7632),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 20),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		HALT(),
	);
}
/// $C390B3
immutable ubyte[38 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptEvtPray7Andoughnut2;
shared static this() {
	actionScriptEvtPray7Andoughnut2 = initializeScript!actionScriptEvtPray7Andoughnut2(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 12),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 368),
		SET_VAR(ActionScriptVars.v7, 7632),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 20),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		HALT(),
	);
}
/// $C390E6
immutable ubyte[84 + 3 * (const(void)*).sizeof + 9 * ScriptPointer.sizeof] actionScriptEvtPray7Dosei;
shared static this() {
	actionScriptEvtPray7Dosei = initializeScript!actionScriptEvtPray7Dosei(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v4, 12),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 360),
		SET_VAR(ActionScriptVars.v7, 7624),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(100),
		SET_VAR(ActionScriptVars.v6, 352),
		SET_VAR(ActionScriptVars.v7, 7592),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 336),
		SET_VAR(ActionScriptVars.v7, 7584),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 224),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(100),
		SET_VAR(ActionScriptVars.v7, 7608),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 344),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 360),
		SET_VAR(ActionScriptVars.v7, 7616),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 7624),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C39155
immutable ubyte[41 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptEvtPray7DoseiA;
shared static this() {
	actionScriptEvtPray7DoseiA = initializeScript!actionScriptEvtPray7DoseiA(
		SET_X(224),
		SET_Y(7608),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 12),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 288),
		SET_VAR(ActionScriptVars.v7, 7608),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 328),
		SET_VAR(ActionScriptVars.v7, 7632),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C3918A
immutable ubyte[29 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptEvtPray7DoseiB;
shared static this() {
	actionScriptEvtPray7DoseiB = initializeScript!actionScriptEvtPray7DoseiB(
		SET_X(360),
		SET_Y(7504),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 12),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 360),
		SET_VAR(ActionScriptVars.v7, 7608),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		HALT(),
	);
}
/// $C391AE
immutable ubyte[41 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptEvtPray7DoseiC;
shared static this() {
	actionScriptEvtPray7DoseiC = initializeScript!actionScriptEvtPray7DoseiC(
		SET_X(536),
		SET_Y(7624),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 12),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 448),
		SET_VAR(ActionScriptVars.v7, 7624),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 400),
		SET_VAR(ActionScriptVars.v7, 7640),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		HALT(),
	);
}
/// $C391E3
immutable ubyte[35 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptEvtPray7DoseiD;
shared static this() {
	actionScriptEvtPray7DoseiD = initializeScript!actionScriptEvtPray7DoseiD(
		SET_X(384),
		SET_Y(7768),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 12),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 384),
		SET_VAR(ActionScriptVars.v7, 7664),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(30),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C39213
immutable ubyte[21 + 7 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptEvtPrayOvalWindow;
shared static this() {
	actionScriptEvtPrayOvalWindow = initializeScript!actionScriptEvtPrayOvalWindow(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		START_TASK("actionScriptEvtPrayOvalWindowTask"),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		OPEN_PRAYER_OVAL_WINDOW(),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.animPort0),
		JUMP_IF_FALSE("actionScriptEvtPrayOvalWindow.UNKNOWN0"),
		CLOSE_OVAL_WINDOW(),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		IS_BATTLE_ANIMATION_PLAYING(),
		JUMP_IF_TRUE("actionScriptEvtPrayOvalWindow.UNKNOWN1"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3
immutable ubyte[4 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtPrayOvalWindowTask;
shared static this() {
	actionScriptEvtPrayOvalWindowTask = initializeScript!actionScriptEvtPrayOvalWindowTask(
		UPDATE_SWIRL_FRAME(),
		PAUSE(1),
		SHORTJUMP("actionScriptEvtPrayOvalWindowTask"),
	);
}
/// $C3924D
immutable ubyte[38 + 6 * (const(void)*).sizeof + 1 * string.sizeof + 3 * ScriptPointer.sizeof] actionScript758;
shared static this() {
	actionScript758 = initializeScript!actionScript758(
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS_OFFSET(0, 8),
		SET_VAR(ActionScriptVars.v2, 48),
		SET_VAR(ActionScriptVars.v3, 32),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(15),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(15),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_THRK_GATEKEEPER_AB"),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		HALT(),
	);
}
/// $C3928F
immutable ubyte[17 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptBlockZombiB;
shared static this() {
	actionScriptBlockZombiB = initializeScript!actionScriptBlockZombiB(
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(30),
		YIELD_TO_TEXT(),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		HALT(),
	);
}
/// $C392AB
immutable ubyte[211 + 21 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptEndPhotoman;
shared static this() {
	actionScriptEndPhotoman = initializeScript!actionScriptEndPhotoman(
		SET_X(3072),
		SET_Y(896),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		SET_Y_VELOCITY(128),
		LOOP(6),
			UPDATE_SPRITE_DIRECTION(Direction.left, 0),
			PAUSE(8),
			UPDATE_SPRITE_DIRECTION(Direction.up, 0),
			PAUSE(8),
			UPDATE_SPRITE_DIRECTION(Direction.right, 0),
			PAUSE(8),
			UPDATE_SPRITE_DIRECTION(Direction.down, 0),
			PAUSE(8),
		LOOP_END(),
		YIELD_TO_TEXT(),
		LOOP(2),
			UPDATE_SPRITE_DIRECTION(Direction.left, 0),
			PAUSE(8),
			UPDATE_SPRITE_DIRECTION(Direction.up, 0),
			PAUSE(8),
			UPDATE_SPRITE_DIRECTION(Direction.right, 0),
			PAUSE(8),
			UPDATE_SPRITE_DIRECTION(Direction.down, 0),
			PAUSE(8),
		LOOP_END(),
		SET_VELOCITIES_ZERO(),
		PAUSE(100),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(144),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 2936),
		SET_VAR(ActionScriptVars.v7, 1024),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(100),
		YIELD_TO_TEXT(),
		SET_VAR(ActionScriptVars.v6, 3088),
		SET_VAR(ActionScriptVars.v7, 1024),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(60),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(15),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_VAR(ActionScriptVars.v6, 3088),
		SET_VAR(ActionScriptVars.v7, 1020),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 3080),
		SET_VAR(ActionScriptVars.v7, 1020),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(110),
		SET_X_VELOCITY(64),
		PAUSE(16),
		SET_VELOCITIES_ZERO(),
		PAUSE(60),
		SET_X_VELOCITY(-64),
		PAUSE(16),
		SET_VELOCITIES_ZERO(),
		PAUSE(110),
		PLAY_SFX(Sfx.unknown0D),
		SET_VAR(ActionScriptVars.v0, 0),
		LOOP(4),
			ADD(ActionScriptVars.v0, 7),
			DO_PALETTES_FADE_STEP(),
			PAUSE(1),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v0, 31),
		DO_PALETTES_FADE_STEP(),
		PAUSE(30),
		LOOP(31),
			ADD(ActionScriptVars.v0, -1),
			DO_PALETTES_FADE_STEP(),
			PAUSE(7),
		LOOP_END(),
		LOOP(31),
			ADD(ActionScriptVars.v0, -1),
			DO_PALETTES_FADE_STEP(),
			PAUSE(2),
		LOOP_END(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C393C7
immutable ubyte[15 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptEndShadow;
shared static this() {
	actionScriptEndShadow = initializeScript!actionScriptEndShadow(
		SET_X(3072),
		SET_Y(1026),
		SET_PRIORITY(3),
		SHORTCALL("unknownC3AA38"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(120),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C393DD
immutable ubyte[24 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptEndCamera;
shared static this() {
	actionScriptEndCamera = initializeScript!actionScriptEndCamera(
		SET_X(2920),
		SET_Y(1024),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(144),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 3072),
		SET_VAR(ActionScriptVars.v7, 1024),
		SHORTCALL("actionScriptMoveToLocation"),
		HALT(),
	);
}
/// $C393FC
immutable ubyte[43 + 8 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtEatMagicCake;
shared static this() {
	actionScriptEvtEatMagicCake = initializeScript!actionScriptEvtEatMagicCake(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		FADE_OUT_WITH_MOSAIC(1, 1, 0),
		LOAD_BATTLE_BG(BackgroundLayer.magicCake1, BackgroundLayer.magicCake2),
		SET_X(128),
		SET_Y(112),
		FADE_IN(1, 1),
		SET_TICK_CALLBACK(&actionScriptAnimatedBackgroundCallback),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		FADE_OUT_WITH_MOSAIC(1, 8, 0),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C39440
immutable ubyte[44 + 3 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptEvtPoolaaa;
shared static this() {
	actionScriptEvtPoolaaa = initializeScript!actionScriptEvtPoolaaa(
		SET_X(1224),
		SET_Y(6560),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 5),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1336),
		SET_VAR(ActionScriptVars.v7, 6560),
		SHORTCALL("actionScriptMoveToLocation"),
		START_TASK("actionScriptEvtPoolaaaTask"),
		SET_VAR(ActionScriptVars.v6, 1376),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v6, 1544),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3
immutable ubyte[15 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtPoolaaaTask;
shared static this() {
	actionScriptEvtPoolaaaTask = initializeScript!actionScriptEvtPoolaaaTask(
		CHOOSE_RANDOM(Direction.down, Direction.left, Direction.right, Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(8),
		SHORTJUMP("actionScriptEvtPoolaaaTask"),
	);
}
/// $C3949B
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript862;
shared static this() {
	actionScript862 = initializeScript!actionScript862(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoMyHome),
		JUMP_IF_FALSE("actionScript862.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 2640),
		SET_VAR(ActionScriptVars.v1, 392),
		SET_VAR(ActionScriptVars.v2, 16),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript862.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_1"),
		HALT(),
	);
}
/// $C394CC
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript863;
shared static this() {
	actionScript863 = initializeScript!actionScript863(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoOnetMisaki),
		JUMP_IF_FALSE("actionScript863.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 7544),
		SET_VAR(ActionScriptVars.v1, 1500),
		SET_VAR(ActionScriptVars.v2, 16),
		SET_VAR(ActionScriptVars.v3, 4),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript863.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_2"),
		HALT(),
	);
}
/// $C394FD
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript864;
shared static this() {
	actionScript864 = initializeScript!actionScript864(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoCycleShop),
		JUMP_IF_FALSE("actionScript864.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 1504),
		SET_VAR(ActionScriptVars.v1, 6552),
		SET_VAR(ActionScriptVars.v2, 32),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript864.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_3"),
		HALT(),
	);
}
/// $C3952E
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript865;
shared static this() {
	actionScript865 = initializeScript!actionScript865(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoRiver),
		JUMP_IF_FALSE("actionScript865.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 4920),
		SET_VAR(ActionScriptVars.v1, 1128),
		SET_VAR(ActionScriptVars.v2, 16),
		SET_VAR(ActionScriptVars.v3, 16),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript865.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_4"),
		HALT(),
	);
}
/// $C3955F
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript866;
shared static this() {
	actionScript866 = initializeScript!actionScript866(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoCabin),
		JUMP_IF_FALSE("actionScript866.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 5824),
		SET_VAR(ActionScriptVars.v1, 1280),
		SET_VAR(ActionScriptVars.v2, 32),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript866.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_5"),
		HALT(),
	);
}
/// $C39590
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript867;
shared static this() {
	actionScript867 = initializeScript!actionScript867(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoChaos),
		JUMP_IF_FALSE("actionScript867.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 2228),
		SET_VAR(ActionScriptVars.v1, 6552),
		SET_VAR(ActionScriptVars.v2, 28),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript867.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_6"),
		HALT(),
	);
}
/// $C395C1
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript868;
shared static this() {
	actionScript868 = initializeScript!actionScript868(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoTacy),
		JUMP_IF_FALSE("actionScript868.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 604),
		SET_VAR(ActionScriptVars.v1, 3380),
		SET_VAR(ActionScriptVars.v2, 12),
		SET_VAR(ActionScriptVars.v3, 20),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript868.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_7"),
		HALT(),
	);
}
/// $C395F2
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript869;
shared static this() {
	actionScript869 = initializeScript!actionScript869(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoMaze),
		JUMP_IF_FALSE("actionScript869.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 1608),
		SET_VAR(ActionScriptVars.v1, 3536),
		SET_VAR(ActionScriptVars.v2, 16),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript869.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_8"),
		HALT(),
	);
}
/// $C39623
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript870;
shared static this() {
	actionScript870 = initializeScript!actionScript870(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoHakaba),
		JUMP_IF_FALSE("actionScript870.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 5764),
		SET_VAR(ActionScriptVars.v1, 8384),
		SET_VAR(ActionScriptVars.v2, 28),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript870.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_9"),
		HALT(),
	);
}
/// $C39654
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript871;
shared static this() {
	actionScript871 = initializeScript!actionScript871(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoWaterfall),
		JUMP_IF_FALSE("actionScript871.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 6484),
		SET_VAR(ActionScriptVars.v1, 312),
		SET_VAR(ActionScriptVars.v2, 20),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript871.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_10"),
		HALT(),
	);
}
/// $C39685
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript872;
shared static this() {
	actionScript872 = initializeScript!actionScript872(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoOnsen),
		JUMP_IF_FALSE("actionScript872.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 564),
		SET_VAR(ActionScriptVars.v1, 7352),
		SET_VAR(ActionScriptVars.v2, 20),
		SET_VAR(ActionScriptVars.v3, 16),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript872.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_11"),
		HALT(),
	);
}
/// $C396B6
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript873;
shared static this() {
	actionScript873 = initializeScript!actionScript873(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoTento),
		JUMP_IF_FALSE("actionScript873.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 5600),
		SET_VAR(ActionScriptVars.v1, 9148),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 12),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript873.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_12"),
		HALT(),
	);
}
/// $C396E7
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript874;
shared static this() {
	actionScript874 = initializeScript!actionScript874(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoBone),
		JUMP_IF_FALSE("actionScript874.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 1872),
		SET_VAR(ActionScriptVars.v1, 9384),
		SET_VAR(ActionScriptVars.v2, 32),
		SET_VAR(ActionScriptVars.v3, 24),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript874.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_13"),
		HALT(),
	);
}
/// $C39718
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript875;
shared static this() {
	actionScript875 = initializeScript!actionScript875(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoExcavation),
		JUMP_IF_FALSE("actionScript875.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 3736),
		SET_VAR(ActionScriptVars.v1, 9624),
		SET_VAR(ActionScriptVars.v2, 8),
		SET_VAR(ActionScriptVars.v3, 16),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript875.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_14"),
		HALT(),
	);
}
/// $C39749
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript876;
shared static this() {
	actionScript876 = initializeScript!actionScript876(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoBridge),
		JUMP_IF_FALSE("actionScript876.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 5656),
		SET_VAR(ActionScriptVars.v1, 9984),
		SET_VAR(ActionScriptVars.v2, 40),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript876.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_15"),
		HALT(),
	);
}
/// $C3977A
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript877;
shared static this() {
	actionScript877 = initializeScript!actionScript877(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoDinoMuseum),
		JUMP_IF_FALSE("actionScript877.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 3240),
		SET_VAR(ActionScriptVars.v1, 4304),
		SET_VAR(ActionScriptVars.v2, 32),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript877.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_16"),
		HALT(),
	);
}
/// $C397AB
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript878;
shared static this() {
	actionScript878 = initializeScript!actionScript878(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoDinosor),
		JUMP_IF_FALSE("actionScript878.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 4604),
		SET_VAR(ActionScriptVars.v1, 5276),
		SET_VAR(ActionScriptVars.v2, 28),
		SET_VAR(ActionScriptVars.v3, 12),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript878.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_17"),
		HALT(),
	);
}
/// $C397DC
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript879;
shared static this() {
	actionScript879 = initializeScript!actionScript879(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoBuilding),
		JUMP_IF_FALSE("actionScript879.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 3568),
		SET_VAR(ActionScriptVars.v1, 3968),
		SET_VAR(ActionScriptVars.v2, 16),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript879.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_18"),
		HALT(),
	);
}
/// $C3980D
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript880;
shared static this() {
	actionScript880 = initializeScript!actionScript880(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoDept),
		JUMP_IF_FALSE("actionScript880.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 4540),
		SET_VAR(ActionScriptVars.v1, 6188),
		SET_VAR(ActionScriptVars.v2, 12),
		SET_VAR(ActionScriptVars.v3, 20),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript880.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_19"),
		HALT(),
	);
}
/// $C3983E
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript881;
shared static this() {
	actionScript881 = initializeScript!actionScript881(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoRamma),
		JUMP_IF_FALSE("actionScript881.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 6848),
		SET_VAR(ActionScriptVars.v1, 8320),
		SET_VAR(ActionScriptVars.v2, 32),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript881.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_20"),
		HALT(),
	);
}
/// $C3986F
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript882;
shared static this() {
	actionScript882 = initializeScript!actionScript882(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoRammaField),
		JUMP_IF_FALSE("actionScript882.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 4576),
		SET_VAR(ActionScriptVars.v1, 3552),
		SET_VAR(ActionScriptVars.v2, 32),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript882.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_21"),
		HALT(),
	);
}
/// $C398A0
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript883;
shared static this() {
	actionScript883 = initializeScript!actionScript883(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoStonehenge),
		JUMP_IF_FALSE("actionScript883.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 348),
		SET_VAR(ActionScriptVars.v1, 4464),
		SET_VAR(ActionScriptVars.v2, 20),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript883.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_22"),
		HALT(),
	);
}
/// $C398D1
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript884;
shared static this() {
	actionScript884 = initializeScript!actionScript884(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoSumsHotel),
		JUMP_IF_FALSE("actionScript884.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 4536),
		SET_VAR(ActionScriptVars.v1, 2760),
		SET_VAR(ActionScriptVars.v2, 40),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript884.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_23"),
		HALT(),
	);
}
/// $C39902
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript885;
shared static this() {
	actionScript885 = initializeScript!actionScript885(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoSumsRest),
		JUMP_IF_FALSE("actionScript885.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 7120),
		SET_VAR(ActionScriptVars.v1, 9092),
		SET_VAR(ActionScriptVars.v2, 32),
		SET_VAR(ActionScriptVars.v3, 12),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript885.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_24"),
		HALT(),
	);
}
/// $C39933
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript886;
shared static this() {
	actionScript886 = initializeScript!actionScript886(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoSumsBeach),
		JUMP_IF_FALSE("actionScript886.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 6092),
		SET_VAR(ActionScriptVars.v1, 2992),
		SET_VAR(ActionScriptVars.v2, 36),
		SET_VAR(ActionScriptVars.v3, 24),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript886.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_25"),
		HALT(),
	);
}
/// $C39964
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript887;
shared static this() {
	actionScript887 = initializeScript!actionScript887(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoToto),
		JUMP_IF_FALSE("actionScript887.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 6972),
		SET_VAR(ActionScriptVars.v1, 2884),
		SET_VAR(ActionScriptVars.v2, 36),
		SET_VAR(ActionScriptVars.v3, 12),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript887.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_26"),
		HALT(),
	);
}
/// $C39995
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript888;
shared static this() {
	actionScript888 = initializeScript!actionScript888(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoSkarabi),
		JUMP_IF_FALSE("actionScript888.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 1496),
		SET_VAR(ActionScriptVars.v1, 4240),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 16),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript888.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_27"),
		HALT(),
	);
}
/// $C399C6
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript889;
shared static this() {
	actionScript889 = initializeScript!actionScript889(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoPyramid),
		JUMP_IF_FALSE("actionScript889.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 1792),
		SET_VAR(ActionScriptVars.v1, 4900),
		SET_VAR(ActionScriptVars.v2, 16),
		SET_VAR(ActionScriptVars.v3, 12),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript889.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_28"),
		HALT(),
	);
}
/// $C399F7
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript890;
shared static this() {
	actionScript890 = initializeScript!actionScript890(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoDungeonMan),
		JUMP_IF_FALSE("actionScript890.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 1304),
		SET_VAR(ActionScriptVars.v1, 5344),
		SET_VAR(ActionScriptVars.v2, 56),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript890.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_29"),
		HALT(),
	);
}
/// $C39A28
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript891;
shared static this() {
	actionScript891 = initializeScript!actionScript891(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoMakyou),
		JUMP_IF_FALSE("actionScript891.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 5256),
		SET_VAR(ActionScriptVars.v1, 7660),
		SET_VAR(ActionScriptVars.v2, 8),
		SET_VAR(ActionScriptVars.v3, 36),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript891.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_30"),
		HALT(),
	);
}
/// $C39A59
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript892;
shared static this() {
	actionScript892 = initializeScript!actionScript892(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoGumi),
		JUMP_IF_FALSE("actionScript892.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 400),
		SET_VAR(ActionScriptVars.v1, 304),
		SET_VAR(ActionScriptVars.v2, 16),
		SET_VAR(ActionScriptVars.v3, 16),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript892.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_31"),
		HALT(),
	);
}
/// $C39A8A
immutable ubyte[28 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript893;
shared static this() {
	actionScript893 = initializeScript!actionScript893(
		SHORTCALL("unknownC39AC7"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.photoSaturn),
		JUMP_IF_FALSE("actionScript893.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v0, 400),
		SET_VAR(ActionScriptVars.v1, 7688),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 8),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScript893.UNKNOWN0"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_GLOBAL_PHOTO_32"),
		HALT(),
	);
}
/// $C39ABB
immutable ubyte[5 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC39ABB;
shared static this() {
	unknownC39ABB = initializeScript!unknownC39ABB(
		PAUSE(30),
		IS_ENTITY_ONSCREEN(),
		JUMP_IF_TRUE("unknownC39ABB"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C39AC7
immutable ubyte[8 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC39AC7;
shared static this() {
	unknownC39AC7 = initializeScript!unknownC39AC7(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		START_TASK("unknownC39ABB"),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORT_RETURN(),
	);
}
/// $C39AD9
immutable ubyte[15 + 5 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptKanjiAtTheNight;
shared static this() {
	actionScriptKanjiAtTheNight = initializeScript!actionScriptKanjiAtTheNight(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(255),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		WRITE_WORD_TEMPVAR(7),
		RUN_FLYOVER(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C39AFA
immutable ubyte[21 + 7 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtFeelDiggy;
shared static this() {
	actionScriptEvtFeelDiggy = initializeScript!actionScriptEvtFeelDiggy(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(255),
		PREPARE_FADE_PALETTE(),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 0, 100),
		YIELD_TO_TEXT(),
		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 50, 60),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C39B25
immutable ubyte[59 + 11 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript767;
shared static this() {
	actionScript767 = initializeScript!actionScript767(
		CHOOSE_RANDOM(0, 1),
		WRITE_TEMPVAR_WAITTIMER(),
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_ANIMATION(0),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		START_TASK("unknownC3A15E"),
		START_TASK("checkCollisionTask"),
		SET_MOVEMENT_SPEED(64),
	LABEL("UNKNOWN0"),
		SET_VAR(ActionScriptVars.v4, 0),
		CHOOSE_RANDOM(Direction.up, Direction.right, Direction.down, Direction.left),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		CHOOSE_RANDOM(4, 6, 8),
		SLEEP_UNTIL_CARDINAL_PIXELS_MOVED_TEMPVAR(),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		CHOOSE_RANDOM(30, 60, 90, 120),
		WRITE_TEMPVAR_WAITTIMER(),
		SHORTJUMP("actionScript767.UNKNOWN0"),
	);
}
/** ActionScript 768 - Handles the visual effects for the power up scene just before leaving magicant
 * Original_Address: $(DOLLAR)C39B86
 */
immutable ubyte[189 + 49 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptEvtFluctuateMagicant;
shared static this() {
	actionScriptEvtFluctuateMagicant = initializeScript!actionScriptEvtFluctuateMagicant(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(255),
		PREPARE_FADE_PALETTE(),
		// slightly darken the map and sprites (except ness's) before the text starts
		// note that the first two BG palettes are excluded too - we don't want text fading to black
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 46, 60),
		YIELD_TO_TEXT(),

		// very slowly fade map and sprites (except ness's) to black as the text progresses
		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 44, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 42, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 40, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 38, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 36, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 34, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 32, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 30, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 28, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 26, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 24, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 22, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 20, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 18, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 16, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 14, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 12, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 10, 1),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 8, 1),
		YIELD_TO_TEXT(),

		// finish fading map and sprites to black
		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.all ^ (PaletteMask.bg0 | PaletteMask.bg1 | PaletteMask.sprite5), 0, 120),
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.sprite5, 90, 60), //fade ness to white
		YIELD_TO_TEXT(),

		PAUSE(1),
		PERFORM_PALETTE_FADE(PaletteMask.sprite5, 49, 60), //fade ness back in
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C39CD7
immutable ubyte[70 + 10 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript769;
shared static this() {
	actionScript769 = initializeScript!actionScript769(
		CHOOSE_RANDOM(0, 4, 8, 12, 16, 20, 24, 28, 32, 36),
		WRITE_TEMPVAR_WAITTIMER(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3D),
		START_TASK("animateDVAR4F2"),
		SET_VELOCITIES_ZERO(),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
	LABEL("UNKNOWN0"),
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_DIRECTION8(Direction.down),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		CHOOSE_RANDOM(0, 2, 4, 6),
		WRITE_TEMPVAR_WAITTIMER(),
		SET_Z(96),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_Z_VELOCITY(-768),
		PAUSE(32),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 4),
		SET_DIRECTION8(Direction.up),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(8),
		SHORTJUMP("actionScript769.UNKNOWN0"),
	);
}
/// $C39D3D
immutable ubyte[46 + 6 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptOmarGiveHierogriph;
shared static this() {
	actionScriptOmarGiveHierogriph = initializeScript!actionScriptOmarGiveHierogriph(
		SHORTCALL("unknownC3AAAA"),
		START_TASK("unknownC3AFA3"),
		SET_VAR(ActionScriptVars.v4, 9),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 24),
		GET_POSITION_OF_PARTY_MEMBER(254),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v4, 12),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 8016),
		SET_VAR(ActionScriptVars.v7, 9560),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C39D85
immutable ubyte[45 + 5 * (const(void)*).sizeof + 1 * string.sizeof + 5 * ScriptPointer.sizeof] actionScript771;
shared static this() {
	actionScript771 = initializeScript!actionScript771(
		GET_EVENT_FLAG(EventFlag.dkfdDoorDisappear),
		JUMP_IF_TRUE("actionScriptPeopleWalk0"),
		SHORTCALL("unknownC3AAB8"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v0, 2336),
		SET_VAR(ActionScriptVars.v1, 2688),
		SET_VAR(ActionScriptVars.v2, 8),
		SET_VAR(ActionScriptVars.v3, 4),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_CHIKA_GUMIDORIAN"),
		PAUSE(1),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 2344),
		SET_VAR(ActionScriptVars.v7, 2667),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C39DCF
immutable ubyte[32 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptOpenGateGumi;
shared static this() {
	actionScriptOpenGateGumi = initializeScript!actionScriptOpenGateGumi(
		SHORTCALL("unknownC3AAB8"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 2337),
		SET_VAR(ActionScriptVars.v7, 2667),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v6, 2343),
		SET_VAR(ActionScriptVars.v7, 2674),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C39E01
immutable ubyte[8 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptWaitBattleFinished;
shared static this() {
	actionScriptWaitBattleFinished = initializeScript!actionScriptWaitBattleFinished(
		WRITE_WRAM_TEMPVAR(&battleSwirlCountdown),
		JUMP_IF_TRUE("actionScriptWaitBattleFinished.UNKNOWN0"),
		WRITE_WRAM_TEMPVAR(&enemyHasBeenTouched),
		JUMP_IF_TRUE("actionScriptWaitBattleFinished.UNKNOWN0"),
		SHORT_RETURN(),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		SHORTJUMP("actionScriptWaitBattleFinished"),
	);
}
/// $C39E13
immutable ubyte[7 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptPossessPCAllStill;
shared static this() {
	actionScriptPossessPCAllStill = initializeScript!actionScriptPossessPCAllStill(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C39E22
immutable ubyte[37 + 1 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptTracyAppear;
shared static this() {
	actionScriptTracyAppear = initializeScript!actionScriptTracyAppear(
		SET_X(7464),
		SET_Y(336),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 14),
		SET_MOVEMENT_SPEED(192),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7512),
		SET_VAR(ActionScriptVars.v7, 336),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7512),
		SET_VAR(ActionScriptVars.v7, 352),
		SHORTCALL("actionScriptMoveToLocation"),
		HALT(),
	);
}
/// $C39E50
immutable ubyte[18 + 5 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptToBeContOvalClose;
shared static this() {
	actionScriptToBeContOvalClose = initializeScript!actionScriptToBeContOvalClose(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		START_TASK("actionScriptEvtPrayOvalWindowTask"),
		START_TASK("actionScriptToBeContOvalCloseTask"),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		WRITE_WORD_TEMPVAR(2),
		OPEN_OVAL_WINDOW(),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		IS_BATTLE_ANIMATION_PLAYING(),
		JUMP_IF_TRUE("actionScriptToBeContOvalClose.UNKNOWN0"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C39E78
immutable ubyte[3] actionScriptToBeContOvalCloseTask;
shared static this() {
	actionScriptToBeContOvalCloseTask = initializeScript!actionScriptToBeContOvalCloseTask(
		PAUSE(125),
		END_TASK(),
	);
}
/// $C39E7B
immutable ubyte[4 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptForbidControl;
shared static this() {
	actionScriptForbidControl = initializeScript!actionScriptForbidControl(
		WRITE_WORD_WRAM(&pendingInteractions, 1),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C39E83
immutable ubyte[4 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptPermitControl;
shared static this() {
	actionScriptPermitControl = initializeScript!actionScriptPermitControl(
		WRITE_WORD_WRAM(&pendingInteractions, 0),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C39E8B
immutable ubyte[28 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptToBeContTitle;
shared static this() {
	actionScriptToBeContTitle = initializeScript!actionScriptToBeContTitle(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v0, 6),
		SET_VAR(ActionScriptVars.v1, 0),
		SET_VAR(ActionScriptVars.v2, 2),
		SET_VAR(ActionScriptVars.v3, 120),
		LOAD_FULLSCREEN_ANIMATION(),
		PLAY_SFX(Sfx.missed),
		SHORTCALL("unknownC33C1D"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C39EB6
immutable ubyte[9 + 4 * (const(void)*).sizeof] actionScriptSealPCAllDirLeft;
shared static this() {
	actionScriptSealPCAllDirLeft = initializeScript!actionScriptSealPCAllDirLeft(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		UPDATE_SURFACE_FLAGS(),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		HALT(),
	);
}
/// $C39ECA
immutable ubyte[9 + 4 * (const(void)*).sizeof] actionScriptSealPCAllDirDown;
shared static this() {
	actionScriptSealPCAllDirDown = initializeScript!actionScriptSealPCAllDirDown(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		UPDATE_SURFACE_FLAGS(),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C39EDE
immutable ubyte[9 + 4 * (const(void)*).sizeof] actionScriptSealPCPaulaDirDown;
shared static this() {
	actionScriptSealPCPaulaDirDown = initializeScript!actionScriptSealPCPaulaDirDown(
		MOVE_TO_PARTY_MEMBER(PartyMember.paula),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		UPDATE_SURFACE_FLAGS(),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C39EF2
immutable ubyte[41 + 9 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptRemodelOperation;
shared static this() {
	actionScriptRemodelOperation = initializeScript!actionScriptRemodelOperation(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v0, -31),
		C474A8(),
		PAUSE(4),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SPAWN_ENTITY_AT_SELF(OverworldSprite.nessLyingDown, ActionScript.unknown783),
		SHORTCALL("actionScriptRemodelOperationUnknownRoutine"),
		SPAWN_ENTITY_AT_SELF(OverworldSprite.paulaLyingDown, ActionScript.unknown783),
		SHORTCALL("actionScriptRemodelOperationUnknownRoutine"),
		SPAWN_ENTITY_AT_SELF(OverworldSprite.jeffLyingDown, ActionScript.unknown783),
		SHORTCALL("actionScriptRemodelOperationUnknownRoutine"),
		SPAWN_ENTITY_AT_SELF(OverworldSprite.pooLyingDown, ActionScript.unknown783),
		SHORTCALL("actionScriptRemodelOperationUnknownRoutine"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C39F3F
immutable ubyte[18 + 11 * ScriptPointer.sizeof] actionScriptRemodelOperationUnknownRoutine;
shared static this() {
	actionScriptRemodelOperationUnknownRoutine = initializeScript!actionScriptRemodelOperationUnknownRoutine(
		SHORTCALL("actionScriptRemodelOperationUnknownRoutine4"),
		PAUSE(179),
		SHORTCALL("actionScriptRemodelOperationUnknownRoutine2"),
		SHORTCALL("actionScriptRemodelOperationUnknownRoutine2"),
		SHORTCALL("actionScriptRemodelOperationUnknownRoutine2"),
		PAUSE(174),
		SHORTCALL("actionScriptRemodelOperationUnknownRoutine2"),
		SHORTCALL("actionScriptRemodelOperationUnknownRoutine2"),
		SHORTCALL("actionScriptRemodelOperationUnknownRoutine2"),
		SHORTCALL("actionScriptRemodelOperationUnknownRoutine2"),
		SHORTCALL("actionScriptRemodelOperationUnknownRoutine2"),
		SHORTCALL("actionScriptRemodelOperationUnknownRoutine2"),
		SHORTCALL("actionScriptRemodelOperationUnknownRoutine3"),
		PAUSE(35),
		SHORT_RETURN(),
	);
}
/// $C39F67
immutable ubyte[16 + 1 * (const(void)*).sizeof] actionScriptRemodelOperationUnknownRoutine2;
shared static this() {
	actionScriptRemodelOperationUnknownRoutine2 = initializeScript!actionScriptRemodelOperationUnknownRoutine2(
		SET_VAR(ActionScriptVars.v0, 22),
		LOOP(12),
			C474A8(),
			PAUSE(1),
			ADD(ActionScriptVars.v0, -2),
		LOOP_END(),
		SHORT_RETURN(),
	);
}
/// $C39F7A
immutable ubyte[16 + 1 * (const(void)*).sizeof] actionScriptRemodelOperationUnknownRoutine3;
shared static this() {
	actionScriptRemodelOperationUnknownRoutine3 = initializeScript!actionScriptRemodelOperationUnknownRoutine3(
		SET_VAR(ActionScriptVars.v0, 0),
		LOOP(31),
			ADD(ActionScriptVars.v0, -1),
			C474A8(),
			PAUSE(1),
		LOOP_END(),
		SHORT_RETURN(),
	);
}
/// $C39F8D
immutable ubyte[16 + 1 * (const(void)*).sizeof] actionScriptRemodelOperationUnknownRoutine4;
shared static this() {
	actionScriptRemodelOperationUnknownRoutine4 = initializeScript!actionScriptRemodelOperationUnknownRoutine4(
		SET_VAR(ActionScriptVars.v0, -31),
		LOOP(31),
			ADD(ActionScriptVars.v0, 1),
			C474A8(),
			PAUSE(1),
		LOOP_END(),
		SHORT_RETURN(),
	);
}
/// $C39FA0
immutable ubyte[19 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript783;
shared static this() {
	actionScript783 = initializeScript!actionScript783(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_VELOCITIES_ZERO(),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		LOOP(139),
			SET_Y_RELATIVE(-1),
			PAUSE(2),
			SET_Y_RELATIVE(1),
			PAUSE(2),
		LOOP_END(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C39FBA
immutable ubyte[41 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript784;
shared static this() {
	actionScript784 = initializeScript!actionScript784(
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_VELOCITIES_ZERO(),
		START_TASK("actionScriptMapObjStillEntry2"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		CHOOSE_RANDOM(60, 120, 180),
		WRITE_TEMPVAR_WAITTIMER(),
		SET_X_VELOCITY(32),
	LABEL("UNKNOWN0"),
		PAUSE(128),
		SET_VELOCITIES_ZERO(),
		PAUSE(20),
		SET_X_VELOCITY(-32),
		PAUSE(128),
		PAUSE(128),
		SET_VELOCITIES_ZERO(),
		PAUSE(20),
		SET_X_VELOCITY(32),
		PAUSE(128),
		SHORTJUMP("actionScript784.UNKNOWN0"),
	);
}
/** ActionScript 1 - Party leader. This isn't the party member that's in front of the party, but an invisible entity that the party members all follow.
 *
 * Runs a hardware check on creation, tries to inflict sunstroke every 1200 frames.
 * Original_Address: $(DOLLAR)C3A043
 */
immutable ubyte[11 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptPartyLeader;
shared static this() {
	actionScriptPartyLeader = initializeScript!actionScriptPartyLeader(
		SRAM_CHECK_ROUTINE_CHECKSUM(),
		JUMP_IF_FALSE("actionScriptPartyLeader.UNKNOWN1"),
		DISPLAY_COPYRIGHT_WARNING_SCREEN(),
	LABEL("UNKNOWN1"),
		SET_TICK_CALLBACK(&partyLeaderTick),
	LABEL("UNKNOWN2"),
		LOOP(6),
			PAUSE(200),
		LOOP_END(),
		INFLICT_SUNSTROKE_CHECK(),
		SHORTJUMP("actionScriptPartyLeader.UNKNOWN2"),
	);
}
/** ActionScript 2 - Party Member. Movement is based on where the party leader entity has been.
 *
 * Positioning, direction and animation are all based on the player position buffer, offset by entity size and position in party.
 * Original_Address: $(DOLLAR)C3A05E
 */
immutable ubyte[12 + 7 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptPartyMember;
shared static this() {
	actionScriptPartyMember = initializeScript!actionScriptPartyMember(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&unknownC0A26B),
		SET_ANIMATION(0),
		INITIALIZE_PARTY_MEMBER(),
		UPDATE_PARTY_MEMBER_POSITION(),
		CLEAR_CURRENT_ENTITY_COLLISION(),
		SET_TICK_CALLBACK(&partyMemberTick),
	LABEL("UNKNOWN1"),
		C0A6E3(),
		PAUSE(1),
		SHORTJUMP("actionScriptPartyMember.UNKNOWN1"),
	);
}
/** Unused ActionScript subroutine. Just halts.
 * Original_Address: $(DOLLAR)C3A07F
 */
immutable ubyte[1] actionScriptUnusedC3A07F;
shared static this() {
	actionScriptUnusedC3A07F = initializeScript!actionScriptUnusedC3A07F(
		HALT(),
	);
}
/** ActionScript 3 - Party Member (Bubble Monkey). Like ActionScript 2, but more chaotic.
 * Original_Address: $(DOLLAR)C3A080
 */
immutable ubyte[10 + 5 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptPartyMemberBMonkey;
shared static this() {
	actionScriptPartyMemberBMonkey = initializeScript!actionScriptPartyMemberBMonkey(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&unknownC0A26B),
		SET_ANIMATION(0),
		BUBBLE_MONKEY_INITIALIZE(),
		SET_TICK_CALLBACK(&bubbleMonkeyTick),
	LABEL("UNKNOWN1"),
		C0A6E3(),
		PAUSE(1),
		SHORTJUMP("actionScriptPartyMemberBMonkey.UNKNOWN1"),
	);
}
/** ActionScript 894 - Unused. Added for Earthbound's localization, writes to an otherwise unused memory address. What was this for?
 * Original_Address: $(DOLLAR)C3A099
 */
immutable ubyte[4 + 1 * (const(void)*).sizeof] actionScriptUnused894;
shared static this() {
	actionScriptUnused894 = initializeScript!actionScriptUnused894(
		WRITE_WORD_WRAM(&unread7E00AD, 1),
		HALT(),
	);
}
/** Animation task with 2 frames, 8 frame delay
 * Original_Address: $(DOLLAR)C3A09F
 */
immutable ubyte[11 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] animateD8F2;
shared static this() {
	animateD8F2 = initializeScript!animateD8F2(
		PAUSE(8),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(8),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		SHORTJUMP("animateD8F2"),
	);
}
/** Animation task with 2 frames, 24 frame delay
 * Original_Address: $(DOLLAR)C3A0B2
 */
immutable ubyte[11 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] animateD24F2;
shared static this() {
	animateD24F2 = initializeScript!animateD24F2(
		PAUSE(24),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(24),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		SHORTJUMP("animateD24F2"),
	);
}
/** Animation task with 2 frames, 12 frame delay
 * Original_Address: $(DOLLAR)C3A0C5
 */
immutable ubyte[11 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] animateD12F2;
shared static this() {
	animateD12F2 = initializeScript!animateD12F2(
		PAUSE(12),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(12),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		SHORTJUMP("animateD12F2"),
	);
}
/** Animation task with 2 frames, 9 frame delay
 * Original_Address: $(DOLLAR)C3A0D8
 */
immutable ubyte[11 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] animateD9F2;
shared static this() {
	animateD9F2 = initializeScript!animateD9F2(
		PAUSE(9),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(9),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		//JUMP_IF_TRUE("animateD9F2"), // bug: relies on undefined return value for sprite update function
		SHORTJUMP("animateD9F2"),
	);
}
/** Animation task with 2 frames, 6 frame delay
 * Original_Address: $(DOLLAR)
 */
immutable ubyte[11 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] animateD6F2;
shared static this() {
	animateD6F2 = initializeScript!animateD6F2(
		PAUSE(6),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(6),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		//JUMP_IF_TRUE("animateD6F2"), // bug: relies on undefined return value for sprite update function
		SHORTJUMP("animateD6F2"),
	);
}
/** Animation task with 2 frames, 2 frame delay
 * Original_Address: $(DOLLAR)
 */
immutable ubyte[11 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] animateD2F2;
shared static this() {
	animateD2F2 = initializeScript!animateD2F2(
		PAUSE(2),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(2),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		//JUMP_IF_TRUE("animateD2F2"), // bug: relies on undefined return value for sprite update function
		SHORTJUMP("animateD2F2"),
	);
}
/** Animation task with 2 frames, 2 frame delay. Alternates frames only when var 4 is non-zero
 * Original_Address: $(DOLLAR)
 */
immutable ubyte[17 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] animateD8F2Toggle;
shared static this() {
	animateD8F2Toggle = initializeScript!animateD8F2Toggle(
		PAUSE(8),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_TRUE("animateD8F2Toggle.var4Nonzero"),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
	LABEL("var4Nonzero"),
		PAUSE(8),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_TRUE("animateD8F2Toggle"),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		SHORTJUMP("animateD8F2Toggle"),
	);
}
/// $C3A12E - animation task with 2 frames, VAR4 frame delay
immutable ubyte[30 + 2 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] animateDVAR4F2;
shared static this() {
	animateDVAR4F2 = initializeScript!animateDVAR4F2(
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_FALSE("animateDVAR4F2.UNKNOWN1"),
		LOOP_TEMPVAR(),
			PAUSE(1),
			WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
			BREAK_IF_FALSE("animateDVAR4F2.UNKNOWN1"),
		LOOP_END(),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_FALSE("animateDVAR4F2.UNKNOWN1"),
		LOOP_TEMPVAR(),
			PAUSE(1),
			WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
			BREAK_IF_FALSE("animateDVAR4F2.UNKNOWN1"),
		LOOP_END(),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		SHORTJUMP("animateDVAR4F2"),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		SHORTJUMP("animateDVAR4F2"),
	);
}
/// $C3A15E
immutable ubyte[14 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] unknownC3A15E;
shared static this() {
	unknownC3A15E = initializeScript!unknownC3A15E(
		SLEEP_SLOT_FRAMES(),
	LABEL("UNKNOWN1"),
		PAUSE(8),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_TRUE("unknownC3A15E.UNKNOWN2"),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
	LABEL("UNKNOWN2"),
		PAUSE(8),
		IS_ENTITY_ONSCREEN_RESET_ANIMATION(),
		JUMP_IF_TRUE("unknownC3A15E.UNKNOWN1"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3A17B
immutable ubyte[10 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC3A17B;
shared static this() {
	unknownC3A17B = initializeScript!unknownC3A17B(
		PAUSE(24),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(48),
		IS_ENTITY_ONSCREEN_RESET_ANIMATION(),
		JUMP_IF_TRUE("unknownC3A17B"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3A18F
immutable ubyte[10 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSetWalkingSpeedSlowAnimationTask;
shared static this() {
	actionScriptSetWalkingSpeedSlowAnimationTask = initializeScript!actionScriptSetWalkingSpeedSlowAnimationTask(
		PAUSE(24),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(24),
		IS_ENTITY_ONSCREEN_RESET_ANIMATION(),
		JUMP_IF_TRUE("actionScriptSetWalkingSpeedSlowAnimationTask"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3A1A3
immutable ubyte[10 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSetWalkingSpeedNormalAnimationTask;
shared static this() {
	actionScriptSetWalkingSpeedNormalAnimationTask = initializeScript!actionScriptSetWalkingSpeedNormalAnimationTask(
		PAUSE(12),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(12),
		IS_ENTITY_ONSCREEN_RESET_ANIMATION(),
		JUMP_IF_TRUE("actionScriptSetWalkingSpeedNormalAnimationTask"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3A1B7
immutable ubyte[10 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSetWalkingSpeedFastAnimationTask;
shared static this() {
	actionScriptSetWalkingSpeedFastAnimationTask = initializeScript!actionScriptSetWalkingSpeedFastAnimationTask(
		PAUSE(9),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(9),
		IS_ENTITY_ONSCREEN_RESET_ANIMATION(),
		JUMP_IF_TRUE("actionScriptSetWalkingSpeedFastAnimationTask"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3A1CB
immutable ubyte[10 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSetWalkingSpeedVeryFastAnimationTask;
shared static this() {
	actionScriptSetWalkingSpeedVeryFastAnimationTask = initializeScript!actionScriptSetWalkingSpeedVeryFastAnimationTask(
		PAUSE(6),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(6),
		IS_ENTITY_ONSCREEN_RESET_ANIMATION(),
		JUMP_IF_TRUE("actionScriptSetWalkingSpeedVeryFastAnimationTask"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3A1DF
immutable ubyte[10 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSetWalkingSpeedExtremelyFastAnimationTask;
shared static this() {
	actionScriptSetWalkingSpeedExtremelyFastAnimationTask = initializeScript!actionScriptSetWalkingSpeedExtremelyFastAnimationTask(
		PAUSE(2),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(2),
		IS_ENTITY_ONSCREEN_RESET_ANIMATION(),
		JUMP_IF_TRUE("animateD2F2"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3A1F3
immutable ubyte[10 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC3A1F3;
shared static this() {
	unknownC3A1F3 = initializeScript!unknownC3A1F3(
		PAUSE(16),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(16),
		IS_ENTITY_ONSCREEN_RESET_ANIMATION(),
		JUMP_IF_TRUE("unknownC3A1F3"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3A204
immutable ubyte[2 + 1 * (const(void)*).sizeof] actionScriptTerminate;
shared static this() {
	actionScriptTerminate = initializeScript!actionScriptTerminate(
		CLEANUP_SELF(),
		END(),
	);
}
/// $C3A209
immutable ubyte[3 + 1 * ScriptPointer.sizeof] fadeWaitScript;
shared static this() {
	fadeWaitScript = initializeScript!fadeWaitScript(
		PAUSE(4),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3A20E
immutable ubyte[46 + 8 * (const(void)*).sizeof + 7 * ScriptPointer.sizeof] unknownC3A20E;
shared static this() {
	unknownC3A20E = initializeScript!unknownC3A20E(
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
	LABEL("UNKNOWN1"),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		SWITCH_CALL_TEMPVAR("unknownC3A20E.UNKNOWN2", "unknownC3A20E.UNKNOWN3", "unknownC3A20E.UNKNOWN4", "unknownC3A20E.UNKNOWN5", "unknownC3A20E.UNKNOWN6"),
		IS_ENTITY_ONSCREEN(),
		JUMP_IF_TRUE("unknownC3A20E.UNKNOWN1"),
		SHORTJUMP("actionScriptDeleteEnemy"),
	LABEL("UNKNOWN2"),
		PAUSE(8),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
	LABEL("UNKNOWN3"),
		PAUSE(8),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		SHORT_RETURN(),
	LABEL("UNKNOWN4"),
		PAUSE(4),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(4),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		SHORT_RETURN(),
	LABEL("UNKNOWN5"),
		PAUSE(32),
		SET_ANIMATION(1),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(32),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		SHORT_RETURN(),
	LABEL("UNKNOWN6"),
		PAUSE(16),
		SHORT_RETURN(),
	);
}
/** A task that checks if the active entity has collided with the map or other entities once per frame
 * Original_Address: $(DOLLAR)C3A262
 */
immutable ubyte[4 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] checkCollisionTask;
shared static this() {
	checkCollisionTask = initializeScript!checkCollisionTask(
		CLEAR_CURRENT_ENTITY_COLLISION(),
	LABEL("UNKNOWN1"),
		CHECK_PROSPECTIVE_MAP_COLLISION(),
		CHECK_PROSPECTIVE_ENTITY_COLLISION_WAIT_NPC(1),
		SHORTJUMP("checkCollisionTask.UNKNOWN1"),
	);
}
/** ActionScript 4 - Character viewer. Placed statically on screen, faces same direction as entity 1.
 * Original_Address: $(DOLLAR)C3A273
 */
immutable ubyte[9 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptCharacterViewer;
shared static this() {
	actionScriptCharacterViewer = initializeScript!actionScriptCharacterViewer(
		SET_POSITION_CHANGE_CALLBACK(&updateEntityPositionAbsolute),
		SET_ANIMATION(0),
		START_TASK("animateD8F2"),
	LABEL("UNKNOWN0"),
		WRITE_WRAM_TEMPVAR(&entityDirections[1]),
		SET_DIRECTION(),
		PAUSE(30),
		SHORTJUMP("actionScriptCharacterViewer.UNKNOWN0"),
	);
}
/// $C3A287
immutable ubyte[8 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptBillboard;
shared static this() {
	actionScriptBillboard = initializeScript!actionScriptBillboard(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTJUMP("actionScriptMapObjStillEntry2"),
	);
}
/// $C3A299
immutable ubyte[7 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript9;
shared static this() {
	actionScript9 = initializeScript!actionScript9(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_GIFTBOX_STATE(),
		SHORTJUMP("actionScriptMapObjStillEntry2"),
	);
}
/// $C3A2AA
immutable ubyte[7 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptMapObjStill;
shared static this() {
	actionScriptMapObjStill = initializeScript!actionScriptMapObjStill(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTJUMP("actionScriptMapObjStillEntry2"),
	);
}
/// $C3A2B8
immutable ubyte[6 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptMapObjStillEntry2;
shared static this() {
	actionScriptMapObjStillEntry2 = initializeScript!actionScriptMapObjStillEntry2(
		PAUSE(8),
		IS_ENTITY_ONSCREEN(),
		JUMP_IF_TRUE("actionScriptMapObjStillEntry2"),
		CLEANUP_SELF(),
		END(),
	);
}
/// $C3A2C6
immutable ubyte[6 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptPeopleWalk0NameSummary;
shared static this() {
	actionScriptPeopleWalk0NameSummary = initializeScript!actionScriptPeopleWalk0NameSummary(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTJUMP("unknownC3A1F3"),
	);
}
/// $C3A2D3
immutable ubyte[7 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptPeopleWalk0;
shared static this() {
	actionScriptPeopleWalk0 = initializeScript!actionScriptPeopleWalk0(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTJUMP("unknownC3A1F3"),
	);
}
/// $C3A2E4
immutable ubyte[52 + 10 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptPeopleWalk1;
shared static this() {
	actionScriptPeopleWalk1 = initializeScript!actionScriptPeopleWalk1(
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_ANIMATION(0),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		START_TASK("unknownC3A15E"),
		START_TASK("checkCollisionTask"),
		SET_MOVEMENT_SPEED(256),
	LABEL("ENTRY2"),
		SET_VAR(ActionScriptVars.v4, 0),
		CHOOSE_RANDOM(Direction.up, Direction.right, Direction.down, Direction.left),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		CHOOSE_RANDOM(8, 16, 24),
		SLEEP_UNTIL_CARDINAL_PIXELS_MOVED_TEMPVAR(),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		CHOOSE_RANDOM(30, 60, 90, 120),
		WRITE_TEMPVAR_WAITTIMER(),
		SHORTJUMP("actionScriptPeopleWalk1.ENTRY2"),
	);
}
/** ActionScript 13 - Wanders around a 8x8 tile area, by moving 1-2 tiles in random cardinal directions
 * Original_Address: $(DOLLAR)C3A33B
 */
immutable ubyte[7 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptPeopleWalk1Narrow;
shared static this() {
	actionScriptPeopleWalk1Narrow = initializeScript!actionScriptPeopleWalk1Narrow(
		SHORTCALL("actionScriptWanderWithinBounds2Initialization"),
		SET_BOUNDARIES(8, 8),
		SHORTJUMP("actionScriptWanderWithinBounds2"),
	);
}
/** ActionScript 14 - Wanders around a 16x16 tile area, by moving 1-2 tiles in random cardinal directions
 * Original_Address: $(DOLLAR)C3A349
 */
immutable ubyte[7 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptPeopleWalk1MediumSquare;
shared static this() {
	actionScriptPeopleWalk1MediumSquare = initializeScript!actionScriptPeopleWalk1MediumSquare(
		SHORTCALL("actionScriptWanderWithinBounds2Initialization"),
		SET_BOUNDARIES(16, 16),
		SHORTJUMP("actionScriptWanderWithinBounds2"),
	);
}
/** ActionScript 15 - Wanders around a 32x32 tile area, by moving 1-2 tiles in random cardinal directions
 * Original_Address: $(DOLLAR)C3A357
 */
immutable ubyte[7 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptPeopleWalk1LargeSquare;
shared static this() {
	actionScriptPeopleWalk1LargeSquare = initializeScript!actionScriptPeopleWalk1LargeSquare(
		SHORTCALL("actionScriptWanderWithinBounds2Initialization"),
		SET_BOUNDARIES(32, 32),
		SHORTJUMP("actionScriptWanderWithinBounds2"),
	);
}
/** ActionScript 16 - Wanders around a 24x8 tile area, by moving 1-2 tiles in random cardinal directions
 * Original_Address: $(DOLLAR)C3A365
 */
immutable ubyte[7 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptPeopleWalk1Wide;
shared static this() {
	actionScriptPeopleWalk1Wide = initializeScript!actionScriptPeopleWalk1Wide(
		SHORTCALL("actionScriptWanderWithinBounds2Initialization"),
		SET_BOUNDARIES(24, 8),
		SHORTJUMP("actionScriptWanderWithinBounds2"),
	);
}
/** ActionScript 17 - Wanders around a 24x8 tile area, by moving 1-2 tiles in random cardinal directions
 *
 * Duplicate of ActionScript 16?
 * Original_Address: $(DOLLAR)C3A373
 */
immutable ubyte[7 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptPeopleWalk1Wide2;
shared static this() {
	actionScriptPeopleWalk1Wide2 = initializeScript!actionScriptPeopleWalk1Wide2(
		SHORTCALL("actionScriptWanderWithinBounds2Initialization"),
		SET_BOUNDARIES(24, 8),
		SHORTJUMP("actionScriptWanderWithinBounds2"),
	);
}
/** ActionScript 18 - Your pet dog. Wanders around an 8x8 tile area, by moving 1-2 tiles in random cardinal directions
 *
 * Identical to ActionScript 14 except for animation.
 * Original_Address: $(DOLLAR)C3A381
 */
immutable ubyte[15 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptKing1;
shared static this() {
	actionScriptKing1 = initializeScript!actionScriptKing1(
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_ANIMATION(0),
		START_TASK("animateD8F2Toggle"),
		START_TASK("checkCollisionTask"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		SET_BOUNDARIES(8, 8),
		SHORTJUMP("actionScriptWanderWithinBounds2"),
	);
}
/** Common initialization script for ActionScripts 13-17, sets up default drawing, physics, animation and speed.
 * Original_Address: $(DOLLAR)C3A3A1
 */
immutable ubyte[10 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptWanderWithinBounds2Initialization;
shared static this() {
	actionScriptWanderWithinBounds2Initialization = initializeScript!actionScriptWanderWithinBounds2Initialization(
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_ANIMATION(0),
		START_TASK("unknownC3A15E"),
		START_TASK("checkCollisionTask"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		SHORT_RETURN(),
	);
}
/** Common logic for ActionScripts 13-18. Wanders around a rectangular area, as defined by vars 0-3.
 *
 * Var 0 - Xmin
 * Var 1 - Xmax
 * Var 2 - Ymin
 * Var 3 - Ymax
 * Original_Address: $(DOLLAR)C3A3B7
 */
immutable ubyte[47 + 7 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptWanderWithinBounds2;
shared static this() {
	actionScriptWanderWithinBounds2 = initializeScript!actionScriptWanderWithinBounds2(
		SET_VAR(ActionScriptVars.v4, 0),
		GET_DIRECTION_TO_BOUNDARY(),
		JUMP_IF_FALSE("actionScriptWanderWithinBounds2.UNKNOWN1"), // if outside boundaries, use direction towards them
		ADD_TEMPVAR(-1),
		SHORTJUMP("actionScriptWanderWithinBounds2.UNKNOWN2"),
	LABEL("UNKNOWN1"),
		// choose random direction if inside boundaries
		CHOOSE_RANDOM(Direction.up, Direction.right, Direction.down, Direction.left),
	LABEL("UNKNOWN2"),
		// move in chosen direction
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		CHOOSE_RANDOM(8, 16),
		SLEEP_UNTIL_CARDINAL_PIXELS_MOVED_TEMPVAR(),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		CHOOSE_RANDOM(30, 60, 90, 120),
		WRITE_TEMPVAR_WAITTIMER(),
		SHORTJUMP("actionScriptWanderWithinBounds2"),
	);
}
/** Common script for initializing enemies. Initializes physics and animation.
 * Original_Address: $(DOLLAR)C3A401
 */
immutable ubyte[17 + 6 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptEnemyInitialize;
shared static this() {
	actionScriptEnemyInitialize = initializeScript!actionScriptEnemyInitialize(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		CLEAR_CURRENT_ENTITY_COLLISION(),
		PAUSE(1),
		IS_COLLISION_ENABLED(),
		JUMP_IF_TRUE("actionScriptEnemyInitialize.UNKNOWN0"),
		SET_TICK_CALLBACK(&actionScriptPathfindingOverride),
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v0, 0),
		START_TASK("unknownC3A20E"),
	LABEL("UNKNOWN0"),
		SHORT_RETURN(),
	);
}
/** Common script for initializing grounded enemies.
 * Original_Address: $(DOLLAR)C3A426
 */
immutable ubyte[3 + 2 * ScriptPointer.sizeof] actionScriptGroundedEnemyInitialize;
shared static this() {
	actionScriptGroundedEnemyInitialize = initializeScript!actionScriptGroundedEnemyInitialize(
		SHORTCALL("actionScriptEnemyInitialize"),
		START_TASK("enemyBattleCommonTask"),
		SHORT_RETURN(),
	);
}
/** Common script for initializing flying enemies.
 * Original_Address: $(DOLLAR)C3A42D
 */
immutable ubyte[3 + 2 * ScriptPointer.sizeof] actionScriptFlyingEnemyInitialize;
shared static this() {
	actionScriptFlyingEnemyInitialize = initializeScript!actionScriptFlyingEnemyInitialize(
		SHORTCALL("actionScriptEnemyInitialize"),
		START_TASK("enemyFlyingBattleCommonTask"),
		SHORT_RETURN(),
	);
}
/** Common task for enemies. Checks for collisions, sets up battle, cleans up when done
 * Original_Address: $(DOLLAR)C3A434
 */
immutable ubyte[7 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] enemyBattleCommonTask;
shared static this() {
	enemyBattleCommonTask = initializeScript!enemyBattleCommonTask(
		CHECK_PROSPECTIVE_ENTITY_COLLISION_WAIT_ENEMY(),
		UPDATE_ENEMY_ENTITY_COLLISION(),
		TRY_BATTLE_START(),
		JUMP_IF_TRUE("actionScriptHandleBattleCleanup"),
		PAUSE(1),
		SHORTJUMP("enemyBattleCommonTask"),
	);
}
/** Common task for flying enemies. Checks for collisions, sets up battle, cleans up when done
 * Original_Address: $(DOLLAR)C3A448
 */
immutable ubyte[7 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] enemyFlyingBattleCommonTask;
shared static this() {
	enemyFlyingBattleCommonTask = initializeScript!enemyFlyingBattleCommonTask(
		CHECK_PROSPECTIVE_ENTITY_COLLISION_WAIT_ENEMY(),
		UPDATE_FLYING_ENEMY_ENTITY_COLLISION(),
		TRY_BATTLE_START(),
		JUMP_IF_TRUE("actionScriptHandleBattleCleanup"),
		PAUSE(1),
		SHORTJUMP("enemyFlyingBattleCommonTask"),
	);
}
/** Common script for handling enemies after battles.
 *
 * Waits for battle to start, plays animation after battle finishes, then deletes self.
 * Original_Address: $(DOLLAR)C3A45C
 */
immutable ubyte[26 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptHandleBattleCleanup;
shared static this() {
	actionScriptHandleBattleCleanup = initializeScript!actionScriptHandleBattleCleanup(
		PAUSE(1),
		IS_BATTLE_STARTING(),
		JUMP_IF_TRUE("actionScriptHandleBattleCleanup"),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_VAR(ActionScriptVars.v0, 1),
		PAUSE(1),
		LOOP(3),
			SET_ANIMATION(255),
			PAUSE(5),
			SET_ANIMATION(0),
			PAUSE(5),
		LOOP_END(),
		SHORTJUMP("actionScriptDeleteEnemy"),
	);
}
/** Common script for enemy entities to delete themselves, whether they've despawned or been killed.
 *
 * It's unclear why this is handled by a separate script. Perhaps there was something else being done here at some point.
 * Original_Address: $(DOLLAR)C3A47C
 */
immutable ubyte[2 + 1 * (const(void)*).sizeof] actionScriptDeleteEnemy;
shared static this() {
	actionScriptDeleteEnemy = initializeScript!actionScriptDeleteEnemy(
		CLEANUP_SELF(),
		END(),
	);
}
/** ActionScript 5 - Unused, static enemy that can't start a fight
 * Original_Address: $(DOLLAR)C3A481
 */
immutable ubyte[4 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptStaticEnemy;
shared static this() {
	actionScriptStaticEnemy = initializeScript!actionScriptStaticEnemy(
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_ANIMATION(0),
		SHORTJUMP("actionScriptHandleBattleCleanup"),
	);
}
/** ActionScript 19 - Default enemy script, used when randomly spawned enemies don't have a script defined. Does not move and faces downward until the party draws near, then runs towards them
 *
 * All randomly-spawning enemies have a script defined, so this normally goes unused.
 * Original_Address: $(DOLLAR)C3A48A
 */
immutable ubyte[23 + 10 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptDefaultEnemy;
shared static this() {
	actionScriptDefaultEnemy = initializeScript!actionScriptDefaultEnemy(
		SHORTCALL("actionScriptGroundedEnemyInitialize"),
		IS_COLLISION_ENABLED(),
		JUMP_IF_TRUE("actionScriptDeleteEnemy"),
		SET_MOVEMENT_SPEED(512),
	LABEL("UNKNOWN0"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		JUMP_IF_FALSE("actionScriptDefaultEnemy.UNKNOWN1"),
		SET_DIRECTION8(Direction.down),
		SET_VELOCITIES_ZERO(),
		PAUSE(8),
		SHORTJUMP("actionScriptDefaultEnemy.UNKNOWN0"),
	LABEL("UNKNOWN1"),
		SET_DESTINATION_TO_PARTY_LEADER_LOCATION(),
		GET_ANGLE_TOWARDS_DESTINATION_UNLESS_WEAK(),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		SLEEP_UNTIL_PIXELS_MOVED(8),
		SHORTJUMP("actionScriptDefaultEnemy.UNKNOWN0"),
	);
}
/// $C3A4C9
immutable ubyte[55 + 19 * (const(void)*).sizeof + 8 * ScriptPointer.sizeof] actionScript20;
shared static this() {
	actionScript20 = initializeScript!actionScript20(
		SHORTCALL("actionScriptGroundedEnemyInitialize"),
		IS_COLLISION_ENABLED(),
		JUMP_IF_TRUE("actionScriptDeleteEnemy"),
		SET_MOVEMENT_SPEED(512),
	LABEL("ENTRY2"),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v0, 1),
		SET_DESTINATION_TO_PARTY_LEADER_LOCATION(),
		GET_ANGLE_TOWARDS_DESTINATION_UNLESS_WEAK(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		PAUSE(8),
		JUMP_IF_TRUE("actionScript20.ENTRY2"),
		SET_VAR(ActionScriptVars.v0, 0),
		PAUSE(10),
		SHORTJUMP("actionScript20.UNKNOWN1"),
	LABEL("UNKNOWN0"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		JUMP_IF_TRUE("actionScript20.ENTRY2"),
	LABEL("UNKNOWN1"),
		C0C35D(),
		JUMP_IF_TRUE("actionScript20.UNKNOWN2"),
		SET_VAR(ActionScriptVars.v0, 1),
		SET_DESTINATION_TO_PARTY_LEADER_LOCATION(),
		GET_ANGLE_TO_DESTINATION(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		SET_VELOCITIES_ZERO(),
		PAUSE(8),
		SHORTJUMP("actionScript20.UNKNOWN0"),
	LABEL("UNKNOWN2"),
		SET_VAR(ActionScriptVars.v0, 0),
		SET_DESTINATION_TO_PARTY_LEADER_LOCATION(),
		GET_ANGLE_TOWARDS_DESTINATION_UNLESS_WEAK(),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		SLEEP_UNTIL_PIXELS_MOVED(8),
		SHORTJUMP("actionScript20.UNKNOWN0"),
	);
}
/// $C3A549
immutable ubyte[55 + 19 * (const(void)*).sizeof + 8 * ScriptPointer.sizeof] actionScript21;
shared static this() {
	actionScript21 = initializeScript!actionScript21(
		SHORTCALL("actionScriptGroundedEnemyInitialize"),
		IS_COLLISION_ENABLED(),
		JUMP_IF_TRUE("actionScriptDeleteEnemy"),
	LABEL("ENTRY2"),
		SET_MOVEMENT_SPEED(256),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		JUMP_IF_FALSE("actionScript21.UNKNOWN1"),
		PICK_RANDOM_ANGLE(),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		SLEEP_UNTIL_PIXELS_MOVED(32),
		SET_VELOCITIES_ZERO(),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		JUMP_IF_FALSE("actionScript21.ENTRY2"),
		LOOP(4),
			SET_DIRECTION8(Direction.left),
			PAUSE(10),
			SET_DIRECTION8(Direction.right),
			PAUSE(10),
		LOOP_END(),
		SHORTJUMP("actionScript21.ENTRY2"),
	LABEL("UNKNOWN1"),
		SET_VAR(ActionScriptVars.v0, 2),
		PAUSE(15),
		SET_VAR(ActionScriptVars.v0, 0),
		SHORTJUMP("actionScript21.UNKNOWN3"),
	LABEL("UNKNOWN2"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		JUMP_IF_TRUE("actionScript21.ENTRY2"),
	LABEL("UNKNOWN3"),
		SET_MOVEMENT_SPEED(384),
		SET_DESTINATION_TO_PARTY_LEADER_LOCATION(),
		GET_ANGLE_TOWARDS_DESTINATION_UNLESS_WEAK(),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		SLEEP_UNTIL_PIXELS_MOVED(8),
		SHORTJUMP("actionScript21.UNKNOWN2"),
	);
}
/// $C3A5C9
immutable ubyte[43 + 21 * (const(void)*).sizeof + 8 * ScriptPointer.sizeof] actionScript22;
shared static this() {
	actionScript22 = initializeScript!actionScript22(
		SHORTCALL("actionScriptGroundedEnemyInitialize"),
		IS_COLLISION_ENABLED(),
		JUMP_IF_TRUE("actionScriptDeleteEnemy"),
		SET_MOVEMENT_SPEED(384),
	LABEL("UNKNOWN0"),
		SET_VELOCITIES_ZERO(),
		LOOP(10),
			GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
			BREAK_IF_FALSE("actionScript22.UNKNOWN3"),
			PAUSE(8),
		LOOP_END(),
		C0D0D9(),
		JUMP_IF_FALSE("actionScript22.UNKNOWN1"),
		PAUSE(4),
		GET_ANGLE_TO_DESTINATION(),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		C0CC11(),
		SHORTJUMP("actionScript22.UNKNOWN0"),
	LABEL("UNKNOWN1"),
		PICK_RANDOM_ANGLE(),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		SLEEP_UNTIL_PIXELS_MOVED(64),
		SHORTJUMP("actionScript22.UNKNOWN0"),
	LABEL("UNKNOWN2"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		JUMP_IF_TRUE("actionScript22.UNKNOWN0"),
	LABEL("UNKNOWN3"),
		SET_DESTINATION_TO_PARTY_LEADER_LOCATION(),
		GET_ANGLE_TOWARDS_DESTINATION_UNLESS_WEAK(),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		SLEEP_UNTIL_PIXELS_MOVED(8),
		SHORTJUMP("actionScript22.UNKNOWN2"),
	);
}
/** ActionScript 23 - Flying metallic/robotic enemies. Moves erratically in diagonals, moves diagonally towards player if within 128 pixels
 * Original_Address: $(DOLLAR)C3A643
 */
immutable ubyte[48 + 16 * (const(void)*).sizeof + 8 * ScriptPointer.sizeof] actionScriptFlyingInanimateEnemy;
shared static this() {
	actionScriptFlyingInanimateEnemy = initializeScript!actionScriptFlyingInanimateEnemy(
		START_TASK("actionScriptFlyingInanimateEnemyTask"),
		SHORTCALL("actionScriptFlyingEnemyInitialize"),
		IS_COLLISION_ENABLED(),
		JUMP_IF_TRUE("actionScriptDeleteEnemy"),
		SET_MOVEMENT_SPEED(512),
	LABEL("UNKNOWN0"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		JUMP_IF_FALSE("actionScriptFlyingInanimateEnemy.UNKNOWN1"),
		CHOOSE_RANDOM(Direction.up, Direction.down),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		SLEEP_UNTIL_CARDINAL_PIXELS_MOVED(32),
		SHORTJUMP("actionScriptFlyingInanimateEnemy.UNKNOWN0"),
	LABEL("UNKNOWN1"),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		LOOP(15),
			SET_Y_RELATIVE(-1),
			PAUSE(1),
			SET_Y_RELATIVE(1),
			PAUSE(1),
		LOOP_END(),
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SHORTJUMP("actionScriptFlyingInanimateEnemy.UNKNOWN3"),
	LABEL("UNKNOWN2"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		JUMP_IF_TRUE("actionScriptFlyingInanimateEnemy.UNKNOWN0"),
	LABEL("UNKNOWN3"),
		SET_DESTINATION_TO_PARTY_LEADER_LOCATION(),
		GET_ANGLE_TOWARDS_DESTINATION_UNLESS_WEAK(),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		SLEEP_UNTIL_PIXELS_MOVED(32),
		SHORTJUMP("actionScriptFlyingInanimateEnemy.UNKNOWN2"),
	);
}
/** Task for ActionScript 23 - Swaps directions every 16 frames
 * Original_Address: $(DOLLAR)C3A6B1
 */
immutable ubyte[17 + 1 * ScriptPointer.sizeof] actionScriptFlyingInanimateEnemyTask;
shared static this() {
	actionScriptFlyingInanimateEnemyTask = initializeScript!actionScriptFlyingInanimateEnemyTask(
		LOOP(16),
			SET_X_VELOCITY_RELATIVE(128),
			PAUSE(1),
		LOOP_END(),
		LOOP(16),
			SET_X_VELOCITY_RELATIVE(-128),
			PAUSE(1),
		LOOP_END(),
		SHORTJUMP("actionScriptFlyingInanimateEnemyTask"),
	);
}
/** ActionScript 24 - Plants, stinky ghosts, shattered men. Wait for player to be less than 64 pixels away, then move directly towards them
 * Original_Address: $(DOLLAR)C3A6C4
 */
immutable ubyte[35 + 11 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScript24;
shared static this() {
	actionScript24 = initializeScript!actionScript24(
		SHORTCALL("actionScriptGroundedEnemyInitialize"),
		IS_COLLISION_ENABLED(),
		JUMP_IF_TRUE("actionScriptDeleteEnemy"),
		SET_MOVEMENT_SPEED(384),
	LABEL("UNKNOWN0"),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v0, 1),
		PAUSE(16),
		SET_DIRECTION8(Direction.none),
	LABEL("UNKNOWN1"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_CLOSE_INTANGIBILITY(),
		PAUSE(8),
		JUMP_IF_TRUE("actionScript24.UNKNOWN1"),
		SET_VAR(ActionScriptVars.v0, 0),
		SHORTJUMP("actionScript24.UNKNOWN3"),
	LABEL("UNKNOWN2"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_CLOSE_INTANGIBILITY(),
		JUMP_IF_TRUE("actionScript24.UNKNOWN0"),
	LABEL("UNKNOWN3"),
		SET_DESTINATION_TO_PARTY_LEADER_LOCATION(),
		GET_ANGLE_TOWARDS_DESTINATION_UNLESS_WEAK(),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		SLEEP_UNTIL_PIXELS_MOVED(8),
		SHORTJUMP("actionScript24.UNKNOWN2"),
	);
}
/** ActionScript 25 - Flying enemies. Rests on the ground until the player approaches, then flies towards the player with wavy left/right movement
 * Original_Address: $(DOLLAR)C3A714
 */
immutable ubyte[38 + 13 * (const(void)*).sizeof + 7 * ScriptPointer.sizeof] actionScriptFlyingEnemy;
shared static this() {
	actionScriptFlyingEnemy = initializeScript!actionScriptFlyingEnemy(
		START_TASK("actionScriptFlyingEnemyTask"),
		SHORTCALL("actionScriptFlyingEnemyInitialize"),
		IS_COLLISION_ENABLED(),
		JUMP_IF_TRUE("actionScriptDeleteEnemy"),
		SET_MOVEMENT_SPEED(256),
	LABEL("UNKNOWN0"),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v0, 1),
		PAUSE(16),
		SET_DIRECTION8(Direction.none),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
	LABEL("UNKNOWN1"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		PAUSE(8),
		JUMP_IF_TRUE("actionScriptFlyingEnemy.UNKNOWN1"),
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_VAR(ActionScriptVars.v0, 0),
		SHORTJUMP("actionScriptFlyingEnemy.UNKNOWN3"),
	LABEL("UNKNOWN2"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		JUMP_IF_TRUE("actionScriptFlyingEnemy.UNKNOWN0"),
	LABEL("UNKNOWN3"),
		SET_DESTINATION_TO_PARTY_LEADER_LOCATION(),
		GET_ANGLE_TOWARDS_DESTINATION_UNLESS_WEAK(),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		SLEEP_UNTIL_PIXELS_MOVED(32),
		SHORTJUMP("actionScriptFlyingEnemy.UNKNOWN2"),
	);
}
/** Task for ActionScript 25 - Swaps directions every 16 frames
 * Original_Address: $(DOLLAR)C3A76D
 */
 immutable ubyte[17 + 1 * ScriptPointer.sizeof] actionScriptFlyingEnemyTask;
shared static this() {
	actionScriptFlyingEnemyTask = initializeScript!actionScriptFlyingEnemyTask(
		LOOP(16),
			SET_X_VELOCITY_RELATIVE(64),
			PAUSE(1),
		LOOP_END(),
		LOOP(16),
			SET_X_VELOCITY_RELATIVE(-64),
			PAUSE(1),
		LOOP_END(),
		SHORTJUMP("actionScriptFlyingEnemyTask"),
	);
}
/// $C3A780
immutable ubyte[56 + 18 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScript26;
shared static this() {
	actionScript26 = initializeScript!actionScript26(
		SHORTCALL("actionScriptGroundedEnemyInitialize"),
		SET_TICK_CALLBACK(&unknownC0D7E0),
		IS_COLLISION_ENABLED(),
		JUMP_IF_TRUE("actionScriptDeleteEnemy"),
		SET_VAR(ActionScriptVars.v0, 4),
		SET_DIRECTION8(Direction.up),
		SET_VELOCITIES_ZERO(),
	LABEL("UNKNOWN0"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		PAUSE(8),
		JUMP_IF_TRUE("actionScript26.UNKNOWN0"),
		SET_MOVEMENT_SPEED(16384),
		DISABLE_CURRENT_ENTITY_COLLISION(),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(4),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(4),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(4),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(4),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(4),
		SET_DESTINATION_TO_PARTY_LEADER_LOCATION(),
		GET_ANGLE_TOWARDS_DESTINATION_UNLESS_WEAK(),
	LABEL("UNKNOWN1"),
		SET_MOVEMENT_FROM_ANGLE(),
		C0D0E6(),
		JUMP_IF_FALSE("actionScript26.UNKNOWN1"),
		SET_VELOCITIES_ZERO(),
		SET_ANIMATION(255),
		PAUSE(8),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME1(),
		PAUSE(4),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		PAUSE(4),
		CLEAR_CURRENT_ENTITY_COLLISION(),
		PAUSE(60),
		SHORTJUMP("actionScript26.UNKNOWN0"),
	);
}
/// $C3A7F8
immutable ubyte[48 + 20 * (const(void)*).sizeof + 8 * ScriptPointer.sizeof] actionScript27;
shared static this() {
	actionScript27 = initializeScript!actionScript27(
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v3, 448),
		SET_DIRECTION8(Direction.up),
		C0CCCC(),
		SHORTCALL("actionScriptGroundedEnemyInitialize"),
		IS_COLLISION_ENABLED(),
		JUMP_IF_TRUE("actionScriptDeleteEnemy"),
	LABEL("ENTRY2"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		JUMP_IF_FALSE("actionScript27.playerApproached"),
		// player is far away
		LOOP(8),
			C0CD50(),
			SET_MOVING_DIRECTION_FROM_ANGLE(),
			SET_DIRECTION(),
			PAUSE(1),
		LOOP_END(),
		SHORTJUMP("actionScript27.ENTRY2"),
	LABEL("playerApproached"),
		C0CD50(),
		SET_MOVEMENT_FROM_ANGLE(),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v4),
		SHORTJUMP("actionScript27.playerStillClose"),
	LABEL("checkPlayerStillClose"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		JUMP_IF_FALSE("actionScript27.playerStillClose"),
		// player moved out of range
		SET_MOVEMENT_SPEED(256),
		C0CCCC(),
		SHORTJUMP("actionScript27.ENTRY2"),
	LABEL("playerStillClose"),
		SET_DESTINATION_TO_PARTY_LEADER_LOCATION(),
		GET_ANGLE_TOWARDS_DESTINATION_UNLESS_WEAK(),
		C0CEBE(),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v4),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		SLEEP_UNTIL_PIXELS_MOVED(8),
		SHORTJUMP("actionScript27.checkPlayerStillClose"),
	);
}
/// $C3A874
immutable ubyte[51 + 11 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScript28;
shared static this() {
	actionScript28 = initializeScript!actionScript28(
		SHORTCALL("actionScriptGroundedEnemyInitialize"),
		IS_COLLISION_ENABLED(),
		JUMP_IF_TRUE("actionScriptDeleteEnemy"),
		SET_MOVEMENT_SPEED(704),
	LABEL("ENTRY2"),
		SET_VAR(ActionScriptVars.v0, 1),
		SET_VELOCITIES_ZERO(),
	LABEL("UNKNOWN0"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_CLOSE_INTANGIBILITY(),
		PAUSE(8),
		JUMP_IF_TRUE("actionScript28.UNKNOWN0"),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		LOOP(4),
			SET_Y_RELATIVE(-1),
			PAUSE(2),
			SET_Y_RELATIVE(1),
			PAUSE(2),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v0, 0),
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SHORTJUMP("actionScript28.UNKNOWN2"),
	LABEL("UNKNOWN1"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_CLOSE_INTANGIBILITY(),
		JUMP_IF_TRUE("actionScript28.ENTRY2"),
	LABEL("UNKNOWN2"),
		LOOP(4),
			SET_DESTINATION_TO_PARTY_LEADER_LOCATION(),
			GET_ANGLE_TOWARDS_DESTINATION_UNLESS_WEAK(),
			SET_MOVEMENT_FROM_ANGLE(),
			SET_MOVING_DIRECTION_FROM_ANGLE(),
			SET_DIRECTION(),
			PAUSE(8),
		LOOP_END(),
		SET_VELOCITIES_ZERO(),
		PAUSE(8),
		SHORTJUMP("actionScript28.UNKNOWN1"),
	);
}
/// $C3A8D2
immutable ubyte[61 + 18 * (const(void)*).sizeof + 7 * ScriptPointer.sizeof] actionScript29;
shared static this() {
	actionScript29 = initializeScript!actionScript29(
		SHORTCALL("actionScriptGroundedEnemyInitialize"),
		IS_COLLISION_ENABLED(),
		JUMP_IF_TRUE("actionScriptDeleteEnemy"),
		SET_VAR(ActionScriptVars.v0, 3),
		SET_MOVEMENT_SPEED(88),
	LABEL("ENTRY2"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		JUMP_IF_FALSE("actionScript29.UNKNOWN0"),
		CHOOSE_RANDOM(Direction.up, Direction.upRight, Direction.right, Direction.downRight, Direction.down, Direction.downLeft, Direction.left, Direction.upLeft),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		SLEEP_UNTIL_CARDINAL_PIXELS_MOVED(24),
		SET_VELOCITIES_ZERO(),
		SET_DIRECTION8(Direction.left),
		PAUSE(10),
		SET_DIRECTION8(Direction.right),
		PAUSE(10),
		SHORTJUMP("actionScript29.ENTRY2"),
	LABEL("UNKNOWN0"),
		SET_MOVEMENT_SPEED(256),
		SHORTJUMP("actionScript29.UNKNOWN2"),
	LABEL("UNKNOWN1"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		JUMP_IF_TRUE("actionScript29.ENTRY2"),
	LABEL("UNKNOWN2"),
		SET_DESTINATION_TO_PARTY_LEADER_LOCATION(),
		GET_ANGLE_TOWARDS_DESTINATION_UNLESS_WEAK(),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE(),
		SLEEP_UNTIL_PIXELS_MOVED(8),
		SHORTJUMP("actionScript29.UNKNOWN1"),
	);
}
/// $C3A953
immutable ubyte[65 + 16 * (const(void)*).sizeof + 12 * ScriptPointer.sizeof] actionScript30;
shared static this() {
	actionScript30 = initializeScript!actionScript30(
		SHORTCALL("actionScriptGroundedEnemyInitialize"),
		IS_COLLISION_ENABLED(),
		JUMP_IF_TRUE("actionScriptDeleteEnemy"),
		SET_VAR(ActionScriptVars.v3, 512),
		SET_DIRECTION8(Direction.down),
	LABEL("UNKNOWN1"),
		SET_VAR(ActionScriptVars.v0, 1),
		SET_MOVEMENT_SPEED(256),
		SET_VELOCITIES_ZERO(),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		PAUSE(8),
		SWITCH_JUMP_TEMPVAR("actionScript30.UNKNOWN2", "actionScript30.UNKNOWN2", "actionScript30.UNKNOWN1", "actionScript30.UNKNOWN1"),
	LABEL("UNKNOWN2"),
		SET_VAR(ActionScriptVars.v0, 1),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		LOOP(4),
			SET_Y_RELATIVE(-1),
			PAUSE(2),
			SET_Y_RELATIVE(1),
			PAUSE(2),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v0, 0),
		GET_SELF_DIRECTION(),
		DIRECTION_TO_ANGLE(),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v4),
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SHORTJUMP("actionScript30.UNKNOWN4"),
	LABEL("UNKNOWN3"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		SWITCH_JUMP_TEMPVAR("actionScript30.UNKNOWN4", "actionScript30.UNKNOWN4", "actionScript30.UNKNOWN1", "actionScript30.UNKNOWN1"),
	LABEL("UNKNOWN4"),
		SET_DESTINATION_TO_PARTY_LEADER_LOCATION(),
		GET_ANGLE_TOWARDS_DESTINATION_UNLESS_WEAK(),
		C0CEBE(),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v4),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		SLEEP_UNTIL_PIXELS_MOVED(8),
		SHORTJUMP("actionScript30.UNKNOWN3"),
	);
}
/// $C3A9DA
immutable ubyte[29 + 9 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScript31;
shared static this() {
	actionScript31 = initializeScript!actionScript31(
		SET_DIRECTION8(Direction.down),
		SHORTCALL("actionScriptGroundedEnemyInitialize"),
		IS_COLLISION_ENABLED(),
		JUMP_IF_TRUE("actionScriptDeleteEnemy"),
		SET_MOVEMENT_SPEED(528),
		SET_VAR(ActionScriptVars.v0, 4),
	LABEL("ENTRY2"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		PAUSE(8),
		JUMP_IF_TRUE("actionScript31.ENTRY2"),
		SHORTJUMP("actionScript31.UNKNOWN1"),
	LABEL("UNKNOWN0"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		JUMP_IF_TRUE("actionScript31.ENTRY2"),
	LABEL("UNKNOWN1"),
		SET_DESTINATION_TO_PARTY_LEADER_LOCATION(),
		GET_ANGLE_TOWARDS_DESTINATION_UNLESS_WEAK(),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		PAUSE(60),
		SET_VELOCITIES_ZERO(),
		PAUSE(12),
		SHORTJUMP("actionScript31.UNKNOWN0"),
	);
}
/** Does a single frame's worth of forward movement at the set movement speed in the given direction.
 *
 * Expects movement direction in temp var.
 * Original_Address: $(DOLLAR)C3AA1E
 */
immutable ubyte[4 + 3 * (const(void)*).sizeof] actionScriptMoveInDirection;
shared static this() {
	actionScriptMoveInDirection = initializeScript!actionScriptMoveInDirection(
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORT_RETURN(),
	);
}
/// $C3AA2B
immutable ubyte[7 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC3AA2B;
shared static this() {
	unknownC3AA2B = initializeScript!unknownC3AA2B(
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_ANIMATION(0),
		START_TASK("unknownC3A1F3"),
		START_TASK("checkCollisionTask"),
		SET_VELOCITIES_ZERO(),
		SHORT_RETURN(),
	);
}
/// $C3AA38
immutable ubyte[10 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3AA38;
shared static this() {
	unknownC3AA38 = initializeScript!unknownC3AA38(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("animateD8F2Toggle"),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		SHORT_RETURN(),
	);
}
/// $C3AA46
immutable ubyte[10 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3AA46;
shared static this() {
	unknownC3AA46 = initializeScript!unknownC3AA46(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("animateD24F2"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(64),
		SHORT_RETURN(),
	);
}
/// $C3AA5A
immutable ubyte[10 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3AA5A;
shared static this() {
	unknownC3AA5A = initializeScript!unknownC3AA5A(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("animateD12F2"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		SHORT_RETURN(),
	);
}
/// $C3AA6E
immutable ubyte[10 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3AA6E;
shared static this() {
	unknownC3AA6E = initializeScript!unknownC3AA6E(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("animateD9F2"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(352),
		SHORT_RETURN(),
	);
}
/// $C3AA82
immutable ubyte[10 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3AA82;
shared static this() {
	unknownC3AA82 = initializeScript!unknownC3AA82(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("animateD6F2"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(512),
		SHORT_RETURN(),
	);
}
/// $C3AA96
immutable ubyte[10 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3AA96;
shared static this() {
	unknownC3AA96 = initializeScript!unknownC3AA96(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("animateD2F2"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(1536),
		SHORT_RETURN(),
	);
}
/// $C3AAAA
immutable ubyte[10 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3AAAA;
shared static this() {
	unknownC3AAAA = initializeScript!unknownC3AAAA(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("animateDVAR4F2"),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 12),
		SHORT_RETURN(),
	);
}
/// $C3AAB8
immutable ubyte[6 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3AAB8;
shared static this() {
	unknownC3AAB8 = initializeScript!unknownC3AAB8(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("unknownC3A1F3"),
		SET_VELOCITIES_ZERO(),
		SHORT_RETURN(),
	);
}
/** Sets walking speed to 1/4th of normal with animation speed to match
 *
 * Unused.
 * Original_Address: $(DOLLAR)C3AAC2
 */
immutable ubyte[10 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptSetWalkingSpeedSlow;
shared static this() {
	actionScriptSetWalkingSpeedSlow = initializeScript!actionScriptSetWalkingSpeedSlow(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("actionScriptSetWalkingSpeedSlowAnimationTask"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(64),
		SHORT_RETURN(),
	);
}

/** Sets walking speed to normal with animation speed to match
 *
 * Unused.
 * Original_Address: $(DOLLAR)C3AAD6
 */
immutable ubyte[10 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptSetWalkingSpeedNormal;
shared static this() {
	actionScriptSetWalkingSpeedNormal = initializeScript!actionScriptSetWalkingSpeedNormal(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("actionScriptSetWalkingSpeedNormalAnimationTask"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		SHORT_RETURN(),
	);
}

/** Sets walking speed to 1.375x normal with animation speed to match
 *
 * Unused.
 * Original_Address: $(DOLLAR)C3AAEA
 */
immutable ubyte[10 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptSetWalkingSpeedFast;
shared static this() {
	actionScriptSetWalkingSpeedFast = initializeScript!actionScriptSetWalkingSpeedFast(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("actionScriptSetWalkingSpeedFastAnimationTask"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(352),
		SHORT_RETURN(),
	);
}

/** Sets walking speed to 2x normal with animation speed to match
 * Original_Address: $(DOLLAR)C3AAFE
 */
immutable ubyte[10 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptSetWalkingSpeedVeryFast;
shared static this() {
	actionScriptSetWalkingSpeedVeryFast = initializeScript!actionScriptSetWalkingSpeedVeryFast(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("actionScriptSetWalkingSpeedVeryFastAnimationTask"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(512),
		SHORT_RETURN(),
	);
}

/** Sets walking speed to 6x normal with animation speed to match
 *
 * Unused.
 * Original_Address: $(DOLLAR)C3AB12
 */
immutable ubyte[10 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptSetWalkingSpeedExtremelyFast;
shared static this() {
	actionScriptSetWalkingSpeedExtremelyFast = initializeScript!actionScriptSetWalkingSpeedExtremelyFast(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("actionScriptSetWalkingSpeedExtremelyFastAnimationTask"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(1536),
		SHORT_RETURN(),
	);
}
/// $C3AB26
immutable ubyte[11 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3AB26;
shared static this() {
	unknownC3AB26 = initializeScript!unknownC3AB26(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3D),
		SET_ANIMATION(0),
		START_TASK("animateD8F2Toggle"),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		SHORT_RETURN(),
	);
}
/** Makes entity intangible and switch to simple drawing
 * Original_Address: $(DOLLAR)C3AB37
 */
immutable ubyte[6 + 3 * (const(void)*).sizeof] actionScriptMakeIntangible;
shared static this() {
	actionScriptMakeIntangible = initializeScript!actionScriptMakeIntangible(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SHORT_RETURN(),
	);
}
/// $C3AB44
immutable ubyte[6 + 5 * (const(void)*).sizeof] actionScriptTakeStepTowardsDestination;
shared static this() {
	actionScriptTakeStepTowardsDestination = initializeScript!actionScriptTakeStepTowardsDestination(
		GET_ANGLE_TO_DESTINATION(),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORT_RETURN(),
	);
}
/// $C3AB59
immutable ubyte[7 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptMoveToLocation;
shared static this() {
	actionScriptMoveToLocation = initializeScript!actionScriptMoveToLocation(
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		MOVE_TOWARDS_DESTINATION_DONT_CHANGE_DIRECTION(),
		JUMP_IF_FALSE("actionScriptMoveToLocation.UNKNOWN1"),
		SET_VELOCITIES_ZERO(),
		SHORT_RETURN(),
	);
}
/// $C3AB67
immutable ubyte[12 + 7 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptMoveToLocationBackwards;
shared static this() {
	actionScriptMoveToLocationBackwards = initializeScript!actionScriptMoveToLocationBackwards(
		GET_ANGLE_TO_DESTINATION(),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		GET_OPPOSITE_DIRECTION(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		MOVE_TOWARDS_DESTINATION_FACE_OPPOSITE(),
		JUMP_IF_FALSE("actionScriptMoveToLocationBackwards.UNKNOWN0"),
		SET_VELOCITIES_ZERO(),
		SHORT_RETURN(),
	);
}
/// $C3AB8A
immutable ubyte[5 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptWaitForLeaderApproach;
shared static this() {
	actionScriptWaitForLeaderApproach = initializeScript!actionScriptWaitForLeaderApproach(
		PAUSE(1),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_FALSE("actionScriptWaitForLeaderApproach"),
		SHORT_RETURN(),
	);
}
/// $C3AB94
immutable ubyte[5 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptWaitForLeaderToLeaveArea;
shared static this() {
	actionScriptWaitForLeaderToLeaveArea = initializeScript!actionScriptWaitForLeaderToLeaveArea(
		PAUSE(1),
		TEST_IF_LEADER_WITHIN_BOUNDARIES(),
		JUMP_IF_TRUE("actionScriptWaitForLeaderToLeaveArea"),
		SHORT_RETURN(),
	);
}
/// $C3AB9E
immutable ubyte[39 + 7 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptWanderWithinBounds;
shared static this() {
	actionScriptWanderWithinBounds = initializeScript!actionScriptWanderWithinBounds(
		GET_DIRECTION_TO_BOUNDARY(),
		JUMP_IF_FALSE("actionScriptWanderWithinBounds.UNKNOWN1"),
		ADD_TEMPVAR(-1),
		SHORTJUMP("actionScriptWanderWithinBounds.UNKNOWN2"),
	LABEL("UNKNOWN1"),
		CHOOSE_RANDOM(Direction.up, Direction.right, Direction.down, Direction.left),
	LABEL("UNKNOWN2"),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		CHOOSE_RANDOM(8, 16),
		SLEEP_UNTIL_CARDINAL_PIXELS_MOVED_TEMPVAR(),
		SET_VELOCITIES_ZERO(),
		CHOOSE_RANDOM(30, 60, 90, 120),
		WRITE_TEMPVAR_WAITTIMER(),
		SHORTJUMP("actionScriptWanderWithinBounds"),
	);
}
/// $C3ABE0
immutable ubyte[9 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] waitForFadeEnd;
shared static this() {
	waitForFadeEnd = initializeScript!waitForFadeEnd(
		PAUSE(1),
		WRITE_WRAM_TEMPVAR(&fadeParameters.word),
		AND_TEMPVAR(255),
		JUMP_IF_TRUE("waitForFadeEnd"),
		SHORT_RETURN(),
	);
}
/// $C3ABED
immutable ubyte[33 + 7 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptProloguePokey1;
shared static this() {
	actionScriptProloguePokey1 = initializeScript!actionScriptProloguePokey1(
		SET_X(2084),
		SET_Y(1768),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.upLeft),
		SHORTCALL("actionScriptMoveInDirection"),
		LOOP(5),
			PAUSE(60),
		LOOP_END(),
		FADE_OUT(1, 7),
		SHORTCALL("waitForFadeEnd"),
		WRITE_WORD_TEMPVAR(0),
		RUN_FLYOVER(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3AC27
immutable ubyte[33 + 7 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptProloguePokey2;
shared static this() {
	actionScriptProloguePokey2 = initializeScript!actionScriptProloguePokey2(
		SET_X(2000),
		SET_Y(1424),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(1),
		SHORTCALL("actionScriptMoveInDirection"),
		LOOP(5),
			PAUSE(60),
		LOOP_END(),
		FADE_OUT(1, 7),
		SHORTCALL("waitForFadeEnd"),
		WRITE_WORD_TEMPVAR(1),
		RUN_FLYOVER(),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3AC61
immutable ubyte[47 + 8 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptProloguePokey3;
shared static this() {
	actionScriptProloguePokey3 = initializeScript!actionScriptProloguePokey3(
		SET_X(2664),
		SET_Y(888),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(0),
		SHORTCALL("actionScriptMoveInDirection"),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 2664),
		SET_VAR(ActionScriptVars.v7, 336),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VELOCITIES_ZERO(),
		PAUSE(120),
		FADE_OUT(1, 7),
		SHORTCALL("waitForFadeEnd"),
		WRITE_WORD_TEMPVAR(2),
		RUN_FLYOVER(),
		YIELD_TO_TEXT(),
		WRITE_WORD_WRAM(&showNPCFlag, 0),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3ACAD
immutable ubyte[194 + 4 * (const(void)*).sizeof] actionScriptNesHomeYure;
shared static this() {
	actionScriptNesHomeYure = initializeScript!actionScriptNesHomeYure(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptCentreScreenOnEntityCallback),
		SET_Y_RELATIVE(16),
		PAUSE(2),
		SET_Y_RELATIVE(-31),
		PAUSE(2),
		SET_Y_RELATIVE(26),
		PAUSE(2),
		SET_Y_RELATIVE(-23),
		PAUSE(2),
		SET_Y_RELATIVE(21),
		PAUSE(2),
		SET_Y_RELATIVE(-19),
		PAUSE(2),
		SET_Y_RELATIVE(18),
		PAUSE(2),
		SET_Y_RELATIVE(-16),
		PAUSE(2),
		SET_Y_RELATIVE(15),
		PAUSE(2),
		SET_Y_RELATIVE(-14),
		PAUSE(2),
		SET_Y_RELATIVE(13),
		PAUSE(2),
		SET_Y_RELATIVE(-12),
		PAUSE(2),
		SET_Y_RELATIVE(11),
		PAUSE(2),
		SET_Y_RELATIVE(-11),
		PAUSE(2),
		SET_Y_RELATIVE(10),
		PAUSE(2),
		SET_Y_RELATIVE(-9),
		PAUSE(2),
		SET_Y_RELATIVE(9),
		PAUSE(2),
		SET_Y_RELATIVE(-8),
		PAUSE(2),
		SET_Y_RELATIVE(8),
		PAUSE(2),
		SET_Y_RELATIVE(-7),
		PAUSE(2),
		SET_Y_RELATIVE(7),
		PAUSE(2),
		SET_Y_RELATIVE(-6),
		PAUSE(2),
		SET_Y_RELATIVE(6),
		PAUSE(2),
		SET_Y_RELATIVE(-5),
		PAUSE(2),
		SET_Y_RELATIVE(5),
		PAUSE(2),
		SET_Y_RELATIVE(-5),
		PAUSE(2),
		SET_Y_RELATIVE(4),
		PAUSE(2),
		SET_Y_RELATIVE(-4),
		PAUSE(2),
		SET_Y_RELATIVE(4),
		PAUSE(2),
		SET_Y_RELATIVE(-3),
		PAUSE(2),
		SET_Y_RELATIVE(3),
		PAUSE(2),
		SET_Y_RELATIVE(-3),
		PAUSE(2),
		LOOP(10),
			SET_Y_RELATIVE(2),
			PAUSE(2),
			SET_Y_RELATIVE(-2),
			PAUSE(2),
		LOOP_END(),
		LOOP(20),
			SET_Y_RELATIVE(1),
			PAUSE(2),
			SET_Y_RELATIVE(-1),
			PAUSE(2),
		LOOP_END(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3AD7A
immutable ubyte[45 + 13 * (const(void)*).sizeof + 1 * string.sizeof + 8 * ScriptPointer.sizeof] actionScript37;
shared static this() {
	actionScript37 = initializeScript!actionScript37(
		GET_EVENT_FLAG(EventFlag.myHomeKnockAppear),
		JUMP_IF_FALSE("actionScriptKing1"),
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		START_TASK("animateD8F2"),
		START_TASK("checkCollisionTask"),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		QUEUE_TEXT_SCRIPT("MSG_EVT_KNOCK"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 42),
		GET_POSITION_OF_PARTY_MEMBER(1),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(7728),
		TEST_ENTITY_RIGHT_OF_X_COORD(),
		JUMP_IF_TRUE("actionScript37.UNKNOWN2"),
		GET_POSITION_OF_PARTY_MEMBER(1),
	LABEL("UNKNOWN1"),
		MOVE_TOWARDS_DESTINATION(),
		SHORTJUMP("actionScript37.UNKNOWN0"),
	LABEL("UNKNOWN2"),
		GET_POSITION_OF_PARTY_MEMBER(1),
		GET_ANGLE_TO_DESTINATION(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		CONVERT_8DIR_TO_4DIR_PREFER_LR(),
		ADD_TEMPVAR(-6),
		JUMP_IF_FALSE("actionScript37.UNKNOWN1"),
		SHORTJUMP("actionScript37.UNKNOWN0"),
	);
}
/// $C3ADE1
immutable ubyte[16 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptPeopleWalk1Live;
shared static this() {
	actionScriptPeopleWalk1Live = initializeScript!actionScriptPeopleWalk1Live(
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		START_TASK("animateD8F2Toggle"),
		START_TASK("checkCollisionTask"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTJUMP("actionScriptPeopleWalk1.ENTRY2"),
	);
}
/// $C3AE02
immutable ubyte[4 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptPeopleWalk0Live;
shared static this() {
	actionScriptPeopleWalk0Live = initializeScript!actionScriptPeopleWalk0Live(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		START_TASK("checkCollisionTask"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTJUMP("animateD8F2Toggle"),
	);
}
/// $C3AE0F
immutable ubyte[7 + 3 * (const(void)*).sizeof] actionScriptMapObjStillLive;
shared static this() {
	actionScriptMapObjStillLive = initializeScript!actionScriptMapObjStillLive(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C3AE1E
immutable ubyte[37 + 10 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptKnockDoor;
shared static this() {
	actionScriptKnockDoor = initializeScript!actionScriptKnockDoor(
		SET_X(7792),
		SET_Y(344),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		START_TASK("actionScriptKnockDoorTask"),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 24),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		END_LAST_TASK(),
		PREPARE_NEW_ENTITY_AT_PARTY_LEADER(),
		QUEUE_TEXT_SCRIPT("MSG_EVT_KNOCK_NEAR"),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C3AE68
immutable ubyte[14 + 1 * ScriptPointer.sizeof] actionScriptKnockDoorTask;
shared static this() {
	actionScriptKnockDoorTask = initializeScript!actionScriptKnockDoorTask(
		LOOP(3),
			PAUSE(8),
			SET_ANIMATION(0),
			PAUSE(8),
			SET_ANIMATION(255),
		LOOP_END(),
		PAUSE(30),
		SHORTJUMP("actionScriptKnockDoorTask"),
	);
}
/// $C3AE78
immutable ubyte[22 + 6 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptNessTobinoku;
shared static this() {
	actionScriptNessTobinoku = initializeScript!actionScriptNessTobinoku(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		SET_X_VELOCITY(-512),
		PAUSE(5),
		YIELD_TO_TEXT(),
		PREPARE_NEW_ENTITY(7792, 344, Direction.left),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3AEA0
immutable ubyte[5 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript40;
shared static this() {
	actionScript40 = initializeScript!actionScript40(
		GET_EVENT_FLAG(EventFlag.myhomePhoneRing),
		JUMP_IF_TRUE("actionScriptTelRing"),
		SHORTJUMP("actionScriptMapObjStill"),
	);
}
/// $C3AEAC
immutable ubyte[59 + 13 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTelRing;
shared static this() {
	actionScriptTelRing = initializeScript!actionScriptTelRing(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(1),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
	LABEL("UNKNOWN0"),
		PLAY_SFX(Sfx.phoneRing),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(24),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(6),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(6),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(6),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(6),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(6),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(6),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(6),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(6),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(6),
		SHORTJUMP("actionScriptTelRing.UNKNOWN0"),
	);
}
/// $C3AF0F
immutable ubyte[38 + 5 * (const(void)*).sizeof + 1 * string.sizeof + 3 * ScriptPointer.sizeof] actionScript45;
shared static this() {
	actionScript45 = initializeScript!actionScript45(
		SHORTCALL("unknownC3AAB8"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v0, 7792),
		SET_VAR(ActionScriptVars.v1, 336),
		SET_VAR(ActionScriptVars.v2, 16),
		SET_VAR(ActionScriptVars.v3, 16),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_SOFER_POKEY"),
		PAUSE(1),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 17),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SET_VAR(ActionScriptVars.v4, 1),
		HALT(),
	);
}
/// $C3AF4E
immutable ubyte[61 + 2 * (const(void)*).sizeof + 9 * ScriptPointer.sizeof] actionScriptReturnDog;
shared static this() {
	actionScriptReturnDog = initializeScript!actionScriptReturnDog(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 6),
		START_TASK("unknownC3AFA3"),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2200),
		SET_VAR(ActionScriptVars.v7, 120),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2216),
		SET_VAR(ActionScriptVars.v7, 128),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 160),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2168),
		SET_VAR(ActionScriptVars.v7, 216),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v7, 240),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2088),
		SET_VAR(ActionScriptVars.v7, 296),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3AFA3
immutable ubyte[4 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3AFA3;
shared static this() {
	unknownC3AFA3 = initializeScript!unknownC3AFA3(
		MAKE_PARTY_LOOK_AT_SELF(),
		PAUSE(3),
		SHORTJUMP("unknownC3AFA3"),
	);
}
/// $C3AFAC
immutable ubyte[26 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 3 * ScriptPointer.sizeof] actionScript55;
shared static this() {
	actionScript55 = initializeScript!actionScript55(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("unknownC3A17B"),
		SET_VELOCITIES_ZERO(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v0, 2128),
		SET_VAR(ActionScriptVars.v1, 128),
		SET_VAR(ActionScriptVars.v2, 12),
		SET_VAR(ActionScriptVars.v3, 48),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_DOG_BYE"),
		HALT(),
	);
}
/// $C3AFD8
immutable ubyte[21 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptAddParty;
shared static this() {
	actionScriptAddParty = initializeScript!actionScriptAddParty(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 18),
		SET_VAR(ActionScriptVars.v5, 1),
		GET_POSITION_OF_PARTY_MEMBER(254),
		SET_MOVEMENT_SPEED(128),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3AFFA
immutable ubyte[21 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptAddPartyViaLeader;
shared static this() {
	actionScriptAddPartyViaLeader = initializeScript!actionScriptAddPartyViaLeader(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 16),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		GET_POSITION_OF_PARTY_MEMBER(254),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3B021
immutable ubyte[26 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptAddPartyBMonkey;
shared static this() {
	actionScriptAddPartyBMonkey = initializeScript!actionScriptAddPartyBMonkey(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 18),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_MOVEMENT_SPEED(128),
		GET_POSITION_OF_PARTY_MEMBER(9),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		MOVE_TOWARDS_DESTINATION_DONT_CHANGE_DIRECTION(),
		JUMP_IF_FALSE("actionScriptAddPartyBMonkey.UNKNOWN0"),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3B04D
immutable ubyte[16 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScript53;
shared static this() {
	actionScript53 = initializeScript!actionScript53(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(255),
		SET_VELOCITIES_ZERO(),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 40),
		SET_VAR(ActionScriptVars.v3, 32),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_INSEKI_POKEY"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B06D
immutable ubyte[34 + 11 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptBunbuun;
shared static this() {
	actionScriptBunbuun = initializeScript!actionScriptBunbuun(
		SHORTCALL("unknownC3AB26"),
		START_TASK("unknownC3B0B6"),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		MOVE_TO_PARTY_MEMBER(PartyMember.ness),
		SET_Z(16),
		SET_MOVEMENT_SPEED(0),
		SET_VAR(ActionScriptVars.v0, 0),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		SET_MOVEMENT_FROM_ANGLE(),
		GET_DIRECTION_ROTATED_ANGLE_90(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		ADD(ActionScriptVars.v0, 2048),
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SPIRAL_MOVEMENT_FRAME(),
		HALVE_Y_SPEED(),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SHORTJUMP("actionScriptBunbuun.UNKNOWN0"),
	);
}
/// $C3B0B6
immutable ubyte[34 + 6 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3B0B6;
shared static this() {
	unknownC3B0B6 = initializeScript!unknownC3B0B6(
		LOOP(16),
			GET_MOVEMENT_SPEED(),
			ADD_TEMPVAR(256),
			SET_MOVEMENT_SPEED(),
			PAUSE(32),
		LOOP_END(),
	LABEL("UNKNOWN0"),
		LOOP(8),
			GET_MOVEMENT_SPEED(),
			ADD_TEMPVAR(-256),
			SET_MOVEMENT_SPEED(),
			PAUSE(32),
		LOOP_END(),
		LOOP(8),
			GET_MOVEMENT_SPEED(),
			ADD_TEMPVAR(256),
			SET_MOVEMENT_SPEED(),
			PAUSE(32),
		LOOP_END(),
		SHORTJUMP("unknownC3B0B6.UNKNOWN0"),
	);
}
/// $C3B0EC
immutable ubyte[34 + 9 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptBunbunAppear;
shared static this() {
	actionScriptBunbunAppear = initializeScript!actionScriptBunbunAppear(
		SHORTCALL("unknownC3AB26"),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		MOVE_TO_SPRITE(OverworldSprite.meteor),
		START_TASK("unknownC3AFA3"),
		SET_DIRECTION8(Direction.up),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		START_TASK("actionScriptBunbunAppearTask"),
		SET_VAR(ActionScriptVars.v5, 4),
		GET_POSITION_OF_PARTY_MEMBER(5),
		SET_MOVEMENT_SPEED(64),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(120),
		YIELD_TO_TEXT(),
		PAUSE(1),
		GET_POSITION_OF_PARTY_MEMBER(1),
		SET_MOVEMENT_SPEED(64),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		END_LAST_TASK(),
		SHORTJUMP("actionScriptBunbuun"),
	);
}
/// $C3B135
immutable ubyte[9] actionScriptBunbunAppearTask;
shared static this() {
	actionScriptBunbunAppearTask = initializeScript!actionScriptBunbunAppearTask(
		SET_Z_VELOCITY(64),
		PAUSE(64),
		SET_Z_VELOCITY(0),
		END_TASK(),
	);
}
/// $C3B13E
immutable ubyte[82 + 7 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptBunbuunBeam;
shared static this() {
	actionScriptBunbuunBeam = initializeScript!actionScriptBunbuunBeam(
		MOVE_TO_SPRITE(OverworldSprite.meteor),
		SET_Y_RELATIVE(-10),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		PAUSE(60),
		SET_VAR(ActionScriptVars.v0, 1),
		SET_VAR(ActionScriptVars.v1, 1),
		BUN_BUUN_BEAM_INITIALIZATION(),
		WRITE_WORD_TEMPVAR(0), // don't invert
		SET_COLDATA_CGADSUB(0, 16, 24), // yellow
		SET_TICK_CALLBACK(&bunbuunBeamConfigure),
		LOOP(80),
			PAUSE(1),
			ADD(ActionScriptVars.v1, 2),
		LOOP_END(),
		PAUSE(60),
		LOOP(13),
			PAUSE(16),
			ADD(ActionScriptVars.v0, 1),
		LOOP_END(),
		PAUSE(120),
		YIELD_TO_TEXT(),
		PAUSE(120),
		LOOP(13),
			PAUSE(16),
			ADD(ActionScriptVars.v0, -1),
		LOOP_END(),
		PAUSE(60),
		LOOP(80),
			PAUSE(1),
			ADD(ActionScriptVars.v1, -2),
		LOOP_END(),
		CLEAR_TICK_CALLBACK(),
		RECTANGLE_WINDOW_DISABLE_HDMA(),
		PAUSE(60),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B1A6
immutable ubyte[41 + 6 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptBunbunDie;
shared static this() {
	actionScriptBunbunDie = initializeScript!actionScriptBunbunDie(
		SHORTCALL("unknownC3AB26"),
		MOVE_TO_PARTY_MEMBER(PartyMember.ness),
		SET_Z(16),
		SET_MOVEMENT_SPEED(48),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_NPC_DESTINATION(NPCID.unknown0045),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_FALSE("actionScriptBunbunDie.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v6, 7112),
		SET_VAR(ActionScriptVars.v7, 872),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_Z_VELOCITY(-256),
		PAUSE(16),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3B1E9
immutable ubyte[19 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptMizunoA;
shared static this() {
	actionScriptMizunoA = initializeScript!actionScriptMizunoA(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7528),
		SET_VAR(ActionScriptVars.v7, 1248),
		SHORTCALL("actionScriptMoveToLocationBackwards"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B208
immutable ubyte[56 + 7 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript57;
shared static this() {
	actionScript57 = initializeScript!actionScript57(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 80),
		SET_VAR(ActionScriptVars.v3, 80),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.b2MizunoAppear),
		WRITE_WORD_TEMPVAR(0),
		SET_EVENT_FLAG(EventFlag.b1MizunoAppear),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(8),
		SET_VAR(ActionScriptVars.v4, 5),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 3856),
		SET_VAR(ActionScriptVars.v7, 7112),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B25D
immutable ubyte[56 + 7 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript58;
shared static this() {
	actionScript58 = initializeScript!actionScript58(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 80),
		SET_VAR(ActionScriptVars.v3, 80),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.b3mizunoAAppear),
		WRITE_WORD_TEMPVAR(0),
		SET_EVENT_FLAG(EventFlag.b2MizunoAppear),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(8),
		SET_VAR(ActionScriptVars.v4, 5),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5392),
		SET_VAR(ActionScriptVars.v7, 2520),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B2B2
immutable ubyte[45 + 5 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript59;
shared static this() {
	actionScript59 = initializeScript!actionScript59(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 80),
		SET_VAR(ActionScriptVars.v3, 80),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_13_MIZUNO_3A"),
		PAUSE(1),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(8),
		SET_VAR(ActionScriptVars.v4, 5),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 3272),
		SET_VAR(ActionScriptVars.v7, 2144),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B2FA
immutable ubyte[65 + 6 * (const(void)*).sizeof + 1 * string.sizeof + 6 * ScriptPointer.sizeof] actionScript60;
shared static this() {
	actionScript60 = initializeScript!actionScript60(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 24),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_INSEKI_MIZUNO_B1"),
		PAUSE(1),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(8),
		SET_VAR(ActionScriptVars.v4, 5),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 3136),
		SET_VAR(ActionScriptVars.v7, 2144),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 3136),
		SET_VAR(ActionScriptVars.v7, 2120),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 3160),
		SET_VAR(ActionScriptVars.v7, 2120),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B35D
immutable ubyte[41 + 8 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptHallMayorC;
shared static this() {
	actionScriptHallMayorC = initializeScript!actionScriptHallMayorC(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 18),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		GET_POSITION_OF_PARTY_MEMBER(255),
		ADD(ActionScriptVars.v6, 16),
		SHORTCALL("actionScriptMoveToLocation"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		PREPARE_NEW_ENTITY_AT_PARTY_LEADER(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v4, 24),
		SET_MOVEMENT_SPEED(32),
		GET_SELF_DIRECTION(),
		MOVE_IN_DIRECTION(),
		PAUSE(64),
		SET_VELOCITIES_ZERO(),
		HALT(),
	);
}
/// $C3B3A2
immutable ubyte[17 + 7 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptGetOutHallMayor;
shared static this() {
	actionScriptGetOutHallMayor = initializeScript!actionScriptGetOutHallMayor(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(32),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		PAUSE(64),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B3C8
immutable ubyte[50 + 18 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript63;
shared static this() {
	actionScript63 = initializeScript!actionScript63(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("animateD8F2"),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(48),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(45),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(48),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(134),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(32),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3B431
immutable ubyte[9 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3B431;
shared static this() {
	unknownC3B431 = initializeScript!unknownC3B431(
		PAUSE(8),
		IS_ENTITY_ONSCREEN(),
		JUMP_IF_TRUE("unknownC3B431"),
		SET_EVENT_FLAG(EventFlag.temp9),
		CLEANUP_SELF(),
		END(),
	);
}
/// $C3B445
immutable ubyte[28 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptBusTwsnThrkIn;
shared static this() {
	actionScriptBusTwsnThrkIn = initializeScript!actionScriptBusTwsnThrkIn(
		SET_X(2216),
		SET_Y(7144),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		START_TASK("animateD8F2"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 2408),
		SET_VAR(ActionScriptVars.v7, 7144),
		SHORTCALL("actionScriptMoveToLocationBackwards"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScript65"),
	);
}
/// $C3B46F
immutable ubyte[25 + 6 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript65;
shared static this() {
	actionScript65 = initializeScript!actionScript65(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		START_TASK("unknownC3B431"),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS_OFFSET(0, 8),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 8),
	LABEL("UNKNOWN0"),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_TWSN_BUSDRIVER"),
		PREPARE_NEW_ENTITY_AT_PARTY_LEADER(),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		SHORTJUMP("actionScript65.UNKNOWN0"),
	);
}
/// $C3B4A5
immutable ubyte[57 + 5 * (const(void)*).sizeof + 1 * string.sizeof + 5 * ScriptPointer.sizeof] actionScript66;
shared static this() {
	actionScript66 = initializeScript!actionScript66(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureLowerBody),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2216),
		SET_VAR(ActionScriptVars.v7, 7144),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 664),
		SET_VAR(ActionScriptVars.v7, 8696),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 632),
		SET_VAR(ActionScriptVars.v7, 8728),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1256),
		SET_VAR(ActionScriptVars.v7, 8728),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_TWSN_TUNNEL),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_TO_THRK_TUNNEL"),
		HALT(),
	);
}
/// $C3B4FB
immutable ubyte[29 + 6 * (const(void)*).sizeof + 2 * string.sizeof + 3 * ScriptPointer.sizeof] actionScriptBusTwsnTunnel;
shared static this() {
	actionScriptBusTwsnTunnel = initializeScript!actionScriptBusTwsnTunnel(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 7880),
		SET_VAR(ActionScriptVars.v7, 10208),
		SHORTCALL("actionScriptMoveToLocation"),
		GET_EVENT_FLAG(EventFlag.winGeppu),
		JUMP_IF_TRUE("actionScriptBusTwsnTunnel.UNKNOWN0"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_TUNNEL_TWSN),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_RETURN_TWSN"),
		HALT(),
	LABEL("UNKNOWN0"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_TUNNEL_THRK_R),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_INTO_THRK"),
		HALT(),
	);
}
/// $C3B538
immutable ubyte[107 + 10 * (const(void)*).sizeof + 1 * string.sizeof + 9 * ScriptPointer.sizeof] actionScriptBusReturnTwsnB;
shared static this() {
	actionScriptBusReturnTwsnB = initializeScript!actionScriptBusReturnTwsnB(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 688),
		SET_VAR(ActionScriptVars.v7, 8712),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(448),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 680),
		SET_VAR(ActionScriptVars.v7, 8704),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 2152),
		SET_VAR(ActionScriptVars.v7, 7232),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(448),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2248),
		SET_VAR(ActionScriptVars.v7, 7144),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2160),
		SET_VAR(ActionScriptVars.v7, 7144),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(60),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 2464),
		SET_VAR(ActionScriptVars.v7, 7144),
		SHORTCALL("actionScriptMoveToLocationBackwards"),
		MOVE_PARTY_TO_LEADER_POSITION(),
		PREPARE_NEW_ENTITY_AT_SELF(),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_RETURN_TWSN_B"),
		CLEAR_TICK_CALLBACK(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG12D),
		PAUSE(1),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(160),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B5D6
immutable ubyte[57 + 7 * (const(void)*).sizeof + 1 * string.sizeof + 6 * ScriptPointer.sizeof] actionScriptBusReturnTwsn;
shared static this() {
	actionScriptBusReturnTwsn = initializeScript!actionScriptBusReturnTwsn(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 816),
		SET_VAR(ActionScriptVars.v7, 8712),
		SHORTCALL("actionScriptMoveToLocation"),
		MOVE_PARTY_TO_LEADER_POSITION(),
		PREPARE_NEW_ENTITY_AT_SELF(),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_RETURN_TWSN_A"),
		CLEAR_TICK_CALLBACK(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG12D),
		PAUSE(1),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 688),
		SET_VAR(ActionScriptVars.v7, 8712),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 680),
		SET_VAR(ActionScriptVars.v7, 8704),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_TEMPVAR(Direction.upRight),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(140),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B633
immutable ubyte[68 + 6 * (const(void)*).sizeof + 1 * string.sizeof + 8 * ScriptPointer.sizeof] actionScriptBusIntoThrk;
shared static this() {
	actionScriptBusIntoThrk = initializeScript!actionScriptBusIntoThrk(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 4896),
		SET_VAR(ActionScriptVars.v7, 9432),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 4984),
		SET_VAR(ActionScriptVars.v7, 9400),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5360),
		SET_VAR(ActionScriptVars.v7, 9024),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5384),
		SET_VAR(ActionScriptVars.v7, 9016),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5472),
		SET_VAR(ActionScriptVars.v7, 9016),
		SHORTCALL("actionScriptMoveToLocation"),
		MOVE_PARTY_TO_LEADER_POSITION(),
		PREPARE_NEW_ENTITY_AT_SELF(),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TOUCH_THRK"),
		CLEAR_TICK_CALLBACK(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG12D),
		PAUSE(1),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(80),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B69C
immutable ubyte[26 + 10 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptOutBusR;
shared static this() {
	actionScriptOutBusR = initializeScript!actionScriptOutBusR(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		PAUSE(48),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		PAUSE(48),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B6D4
immutable ubyte[26 + 10 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptOutBusL;
shared static this() {
	actionScriptOutBusL = initializeScript!actionScriptOutBusL(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		PAUSE(32),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		PAUSE(48),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B70C
immutable ubyte[45 + 10 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3B70C;
shared static this() {
	unknownC3B70C = initializeScript!unknownC3B70C(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_VAR(ActionScriptVars.v5, 1),
		ADD(ActionScriptVars.v7, -1),
		SET_MOVEMENT_SPEED(192),
		GET_ANGLE_TO_DESTINATION(),
		SET_MOVEMENT_FROM_ANGLE(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		MOVE_TOWARDS_DESTINATION_DONT_CHANGE_DIRECTION(),
		JUMP_IF_FALSE("unknownC3B70C.UNKNOWN0"),
		SET_VELOCITIES_ZERO(),
		GET_PARTY_COUNT(),
		LOOP_TEMPVAR(),
			LOOP(12),
				SET_X_VELOCITY(1),
				PAUSE(1),
				SET_X_VELOCITY(-1),
				PAUSE(1),
			LOOP_END(),
		LOOP_END(),
		SET_VELOCITIES_ZERO(),
		SHORT_RETURN(),
	);
}
/// $C3B757
immutable ubyte[24 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptIntoBus;
shared static this() {
	actionScriptIntoBus = initializeScript!actionScriptIntoBus(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_SPRITE_DESTINATION(OverworldSprite.cityBus),
		ADD(ActionScriptVars.v7, 8),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_SPRITE_DESTINATION(OverworldSprite.cityBus),
		SHORTCALL("unknownC3B70C"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B784
immutable ubyte[26 + 10 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptOutTBusR;
shared static this() {
	actionScriptOutTBusR = initializeScript!actionScriptOutTBusR(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(320),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		PAUSE(16),
		WRITE_WORD_TEMPVAR(Direction.right),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		PAUSE(24),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B7BC
immutable ubyte[29 + 6 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptOutTBusGorgeous;
shared static this() {
	actionScriptOutTBusGorgeous = initializeScript!actionScriptOutTBusGorgeous(
		MOVE_TO_SPRITE(OverworldSprite.runaway5Bus),
		SHORTCALL("unknownC3AA38"),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		GET_POSITION_OF_PARTY_MEMBER(255),
		ADD(ActionScriptVars.v6, 16),
		SHORTCALL("actionScriptMoveToLocation"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_VAR(ActionScriptVars.v4, 1),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3B7EF
immutable ubyte[15 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptIntoTBusGorgeous;
shared static this() {
	actionScriptIntoTBusGorgeous = initializeScript!actionScriptIntoTBusGorgeous(
		SHORTCALL("unknownC3AAB8"),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_SPRITE_DESTINATION(OverworldSprite.runaway5Bus),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B810
immutable ubyte[53 + 7 * (const(void)*).sizeof + 1 * string.sizeof + 7 * ScriptPointer.sizeof] actionScript77;
shared static this() {
	actionScript77 = initializeScript!actionScript77(
		SHORTCALL("unknownC3AAB8"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 112),
		SET_VAR(ActionScriptVars.v3, 72),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5536),
		SET_VAR(ActionScriptVars.v7, 8976),
		SHORTCALL("actionScriptMoveToLocation"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 32),
		SET_VAR(ActionScriptVars.v3, 32),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BIKINI_X_NEAR_2"),
		PAUSE(1),
		WRITE_WORD_TEMPVAR(Direction.up),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(16),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B86C
immutable ubyte[34 + 5 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript78;
shared static this() {
	actionScript78 = initializeScript!actionScript78(
		SHORTCALL("unknownC3AAB8"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 40),
		SET_VAR(ActionScriptVars.v3, 40),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		WRITE_WORD_TEMPVAR(0),
		SET_EVENT_FLAG(EventFlag.thrkBikiniZombiFAppear),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.thrkBikiniZombiPAppear),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(56),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B8A5
immutable ubyte[41 + 6 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript79;
shared static this() {
	actionScript79 = initializeScript!actionScript79(
		SHORTCALL("unknownC3AAB8"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 56),
		SET_VAR(ActionScriptVars.v3, 56),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		SET_EVENT_FLAG(EventFlag.thrkBikiniZombiPAppear),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.thrkHotelZombiAppear),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7792),
		SET_VAR(ActionScriptVars.v7, 9272),
		SET_MOVEMENT_SPEED(256),
		SHORTCALL("actionScriptMoveToLocation"),
		PLAY_SFX(Sfx.doorClose),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B8E8
immutable ubyte[16 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript80;
shared static this() {
	actionScript80 = initializeScript!actionScript80(
		SHORTCALL("unknownC3AAAA"),
		SET_MOVEMENT_SPEED(64),
		SET_VAR(ActionScriptVars.v5, 1),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 0),
		HALT(),
	);
}
/// $C3B902
immutable ubyte[22 + 2 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptOshiokiPokey;
shared static this() {
	actionScriptOshiokiPokey = initializeScript!actionScriptOshiokiPokey(
		SHORTCALL("unknownC3AA38"),
		START_TASK("unknownC3AFA3"),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 6928),
		SET_VAR(ActionScriptVars.v7, 872),
		SHORTCALL("actionScriptMoveToLocation"),
		PLAY_SFX(Sfx.unknown61),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B926
immutable ubyte[28 + 7 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptOshiokiPickey;
shared static this() {
	actionScriptOshiokiPickey = initializeScript!actionScriptOshiokiPickey(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 6928),
		SET_VAR(ActionScriptVars.v7, 872),
		GET_ANGLE_TO_DESTINATION(),
		SET_MOVING_DIRECTION_FROM_ANGLE(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(24),
		SHORTCALL("actionScriptMoveToLocation"),
		PLAY_SFX(Sfx.unknown61),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B95D
immutable ubyte[62 + 7 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptOshiokiMince;
shared static this() {
	actionScriptOshiokiMince = initializeScript!actionScriptOshiokiMince(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 6928),
		SET_VAR(ActionScriptVars.v7, 872),
		SHORTCALL("actionScriptMoveToLocation"),
		PLAY_SFX(Sfx.unknown61),
		SET_ANIMATION(255),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(40),
		PAUSE(30),
		PLAY_SFX(Sfx.ouch),
		PAUSE(100),
		PLAY_SFX(Sfx.unknown12),
		PAUSE(70),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_ANIMATION(0),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 17),
		GET_POSITION_OF_PARTY_MEMBER(1),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SET_VAR(ActionScriptVars.v4, 1),
		HALT(),
	);
}
/// $C3B9B6
immutable ubyte[17 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptLardnaKee;
shared static this() {
	actionScriptLardnaKee = initializeScript!actionScriptLardnaKee(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 17),
		GET_POSITION_OF_PARTY_MEMBER(1),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SET_VAR(ActionScriptVars.v4, 1),
		HALT(),
	);
}
/// $C3B9D4
immutable ubyte[13 + 3 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript85;
shared static this() {
	actionScript85 = initializeScript!actionScript85(
		GET_EVENT_FLAG(EventFlag.tunnelTwsnThrkWR),
		JUMP_IF_TRUE("actionScript94_95_98Common"),
		GET_EVENT_FLAG(EventFlag.tunnelTwsnThrkBR),
		JUMP_IF_TRUE("actionScript103"),
		GET_EVENT_FLAG(EventFlag.tunnelTwsnThrkTR),
		JUMP_IF_TRUE("actionScript103"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3B9F2
immutable ubyte[9 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript86;
shared static this() {
	actionScript86 = initializeScript!actionScript86(
		GET_EVENT_FLAG(EventFlag.tunnelTwsnThrkWR),
		JUMP_IF_TRUE("actionScript94_95_98Common"),
		GET_EVENT_FLAG(EventFlag.tunnelThrkTwsnBL),
		JUMP_IF_TRUE("actionScript106"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3BA07
immutable ubyte[9 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript88;
shared static this() {
	actionScript88 = initializeScript!actionScript88(
		GET_EVENT_FLAG(EventFlag.tunnelTwsnThrkWR),
		JUMP_IF_TRUE("unknownC3BAA3"),
		GET_EVENT_FLAG(EventFlag.tunnelThrkTwsnWL),
		JUMP_IF_TRUE("unknownC3BAC4"),
		SHORTJUMP("actionScript104"),
	);
}
/// $C3BA1C
immutable ubyte[9 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript87;
shared static this() {
	actionScript87 = initializeScript!actionScript87(
		GET_EVENT_FLAG(EventFlag.tunnelTwsnThrkWR),
		JUMP_IF_TRUE("unknownC3BAC4"),
		GET_EVENT_FLAG(EventFlag.tunnelThrkTwsnWL),
		JUMP_IF_TRUE("unknownC3BAA3"),
		SHORTJUMP("actionScript105"),
	);
}
/// $C3BA31
immutable ubyte[13 + 3 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScript89;
shared static this() {
	actionScript89 = initializeScript!actionScript89(
		GET_EVENT_FLAG(EventFlag.tunnelThrkTwsnWL),
		JUMP_IF_TRUE("actionScript94_95_98Common"),
		GET_EVENT_FLAG(EventFlag.tunnelTwsnThrkBR),
		JUMP_IF_TRUE("actionScript106"),
		GET_EVENT_FLAG(EventFlag.tunnelTwsnThrkTR),
		JUMP_IF_TRUE("actionScript106"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3BA4F
immutable ubyte[9 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript90;
shared static this() {
	actionScript90 = initializeScript!actionScript90(
		GET_EVENT_FLAG(EventFlag.tunnelThrkTwsnWL),
		JUMP_IF_TRUE("actionScript94_95_98Common"),
		GET_EVENT_FLAG(EventFlag.tunnelThrkTwsnBL),
		JUMP_IF_TRUE("actionScript103"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3BA64
immutable ubyte[1 + 1 * ScriptPointer.sizeof] actionScript94;
shared static this() {
	actionScript94 = initializeScript!actionScript94(
		SHORTJUMP("actionScript94_95_98Common"),
	);
}
/// $C3BA67
immutable ubyte[1 + 1 * ScriptPointer.sizeof] actionScript95;
shared static this() {
	actionScript95 = initializeScript!actionScript95(
		SHORTJUMP("actionScript94_95_98Common"),
	);
}
/// $C3BA6A
immutable ubyte[1 + 1 * ScriptPointer.sizeof] actionScript96;
shared static this() {
	actionScript96 = initializeScript!actionScript96(
		SHORTJUMP("unknownC3BAA3"),
	);
}
/// $C3BA6D
immutable ubyte[1 + 1 * ScriptPointer.sizeof] actionScript97;
shared static this() {
	actionScript97 = initializeScript!actionScript97(
		SHORTJUMP("unknownC3BAD7"),
	);
}
/// $C3BA70
immutable ubyte[1 + 1 * ScriptPointer.sizeof] actionScript98;
shared static this() {
	actionScript98 = initializeScript!actionScript98(
		SHORTJUMP("actionScript94_95_98Common"),
	);
}
/// $C3BA73
immutable ubyte[22 + 4 * (const(void)*).sizeof + 1 * string.sizeof + 5 * ScriptPointer.sizeof] actionScript94_95_98Common;
shared static this() {
	actionScript94_95_98Common = initializeScript!actionScript94_95_98Common(
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SHORTCALL("unknownC3BB5C"),
		SHORTCALL("unknownC3BB73"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_GHOST_1"),
		PAUSE(1),
		SET_MOVEMENT_SPEED(448),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v6),
		TEST_ENTITY_RIGHT_OF_X_COORD(),
		JUMP_IF_TRUE("actionScript94_95_98Common.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(6),
		SHORTJUMP("actionScript94_95_98Common.UNKNOWN1"),
	LABEL("UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.right),
	LABEL("UNKNOWN1"),
		SHORTCALL("actionScriptMoveInDirection"),
		HALT(),
	);
}
/// $C3BAA3
immutable ubyte[11 + 4 * (const(void)*).sizeof + 1 * string.sizeof + 3 * ScriptPointer.sizeof] unknownC3BAA3;
shared static this() {
	unknownC3BAA3 = initializeScript!unknownC3BAA3(
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SHORTCALL("unknownC3BB5C"),
		SHORTCALL("unknownC3BB73"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_GHOST_1"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SET_VELOCITIES_ZERO(),
		MOVE_TOWARDS_DESTINATION(),
		SHORTJUMP("unknownC3BAA3.UNKNOWN0"),
	);
}
/// $C3BAC4
immutable ubyte[5 + 2 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] unknownC3BAC4;
shared static this() {
	unknownC3BAC4 = initializeScript!unknownC3BAC4(
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SHORTCALL("unknownC3BB5C"),
		SHORTCALL("unknownC3BB73"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_GHOST_WARP"),
		HALT(),
	);
}
/// $C3BAD7
immutable ubyte[5 + 2 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] unknownC3BAD7;
shared static this() {
	unknownC3BAD7 = initializeScript!unknownC3BAD7(
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SHORTCALL("unknownC3BB5C"),
		SHORTCALL("unknownC3BB73"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_GHOST_WARP_THRK"),
		HALT(),
	);
}
/// $C3BAEA
immutable ubyte[22 + 5 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptGhostPlus1;
shared static this() {
	actionScriptGhostPlus1 = initializeScript!actionScriptGhostPlus1(
		MOVE_TO_LOCATION_BG1_RELATIVE(0, 80),
		GET_EVENT_FLAG(EventFlag.tunnelTwsnThrkWR),
		JUMP_IF_TRUE("actionScriptGhostPlus1.UNKNOWN0"),
		SET_X_RELATIVE(256),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.THRK_GHOSTTUNNEL_L),
		SHORTJUMP("actionScriptGhostPlus1.UNKNOWN1"),
	LABEL("UNKNOWN0"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.TWSN_GHOSTTUNNEL),
	LABEL("UNKNOWN1"),
		SHORTCALL("unknownC3AA38"),
		SHORTCALL("unknownC3BB73"),
		YIELD_TO_TEXT(),
		SET_VELOCITIES_ZERO(),
		HALT(),
	);
}
/// $C3BB17
immutable ubyte[16 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptGhostPlus2;
shared static this() {
	actionScriptGhostPlus2 = initializeScript!actionScriptGhostPlus2(
		MOVE_TO_LOCATION_BG1_RELATIVE(0, 144),
		GET_EVENT_FLAG(EventFlag.tunnelTwsnThrkWR),
		JUMP_IF_TRUE("actionScriptGhostPlus2.UNKNOWN0"),
		SET_X_RELATIVE(256),
	LABEL("UNKNOWN0"),
		SHORTCALL("unknownC3AA38"),
		SHORTCALL("unknownC3BB73"),
		SET_VELOCITIES_ZERO(),
		HALT(),
	);
}
/// $C3BB33
immutable ubyte[12 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptGhostThrkPlus1;
shared static this() {
	actionScriptGhostThrkPlus1 = initializeScript!actionScriptGhostThrkPlus1(
		MOVE_TO_LOCATION_BG1_RELATIVE(0, 80),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.THRK_GHOSTTUNNEL_R),
		SHORTCALL("unknownC3AA38"),
		SHORTCALL("unknownC3BB73"),
		YIELD_TO_TEXT(),
		SET_VELOCITIES_ZERO(),
		HALT(),
	);
}
/// $C3BB4C
immutable ubyte[9 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptGhostThrkPlus2;
shared static this() {
	actionScriptGhostThrkPlus2 = initializeScript!actionScriptGhostThrkPlus2(
		MOVE_TO_LOCATION_BG1_RELATIVE(0, 144),
		SHORTCALL("unknownC3AA38"),
		SHORTCALL("unknownC3BB73"),
		SET_VELOCITIES_ZERO(),
		HALT(),
	);
}
/// $C3BB5C
immutable ubyte[13 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC3BB5C;
shared static this() {
	unknownC3BB5C = initializeScript!unknownC3BB5C(
		SHORTCALL("unknownC3AAB8"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 80),
		SET_VAR(ActionScriptVars.v3, 80),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		SHORT_RETURN(),
	);
}
/// $C3BB73
immutable ubyte[17 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC3BB73;
shared static this() {
	unknownC3BB73 = initializeScript!unknownC3BB73(
		SET_VAR(ActionScriptVars.v5, 18),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SET_MOVEMENT_SPEED(384),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_POSITION_OF_PARTY_MEMBER(255),
		MOVE_TOWARDS_DESTINATION(),
		JUMP_IF_FALSE("unknownC3BB73.UNKNOWN0"),
		SHORT_RETURN(),
	);
}
/// $C3BB94
immutable ubyte[14 + 7 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptRetGhostTunnel;
shared static this() {
	actionScriptRetGhostTunnel = initializeScript!actionScriptRetGhostTunnel(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(256),
		GET_SELF_DIRECTION(),
		MOVE_IN_DIRECTION(),
		PAUSE(96),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3BBB7
immutable ubyte[50 + 7 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScript103;
shared static this() {
	actionScript103 = initializeScript!actionScript103(
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 104),
		SET_VAR(ActionScriptVars.v3, 96),
		SHORTCALL("unknownC3BD03"),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		GET_POSITION_OF_PARTY_MEMBER(255),
		ADD(ActionScriptVars.v7, -24),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_POSITION_OF_PARTY_MEMBER(255),
		ADD(ActionScriptVars.v7, -24),
		MOVE_TOWARDS_DESTINATION(),
		GET_EVENT_FLAG(EventFlag.tunnelTwsnThrkTR),
		JUMP_IF_FALSE("actionScript103.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(6656),
		TEST_ENTITY_RIGHT_OF_X_COORD(),
		JUMP_IF_FALSE("actionScript103.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		HALT(),
	);
}
/// $C3BC0A
immutable ubyte[50 + 7 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScript104;
shared static this() {
	actionScript104 = initializeScript!actionScript104(
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 80),
		SET_VAR(ActionScriptVars.v3, 96),
		SHORTCALL("unknownC3BD03"),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		GET_POSITION_OF_PARTY_MEMBER(255),
		ADD(ActionScriptVars.v7, 24),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_POSITION_OF_PARTY_MEMBER(255),
		ADD(ActionScriptVars.v7, 24),
		MOVE_TOWARDS_DESTINATION(),
		GET_EVENT_FLAG(EventFlag.tunnelTwsnThrkTR),
		JUMP_IF_FALSE("actionScript104.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(7296),
		TEST_ENTITY_RIGHT_OF_X_COORD(),
		JUMP_IF_FALSE("actionScript104.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		HALT(),
	);
}
/// $C3BC5D
immutable ubyte[50 + 7 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScript105;
shared static this() {
	actionScript105 = initializeScript!actionScript105(
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 56),
		SET_VAR(ActionScriptVars.v3, 96),
		SHORTCALL("unknownC3BD03"),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		GET_POSITION_OF_PARTY_MEMBER(255),
		ADD(ActionScriptVars.v7, -32),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_POSITION_OF_PARTY_MEMBER(255),
		ADD(ActionScriptVars.v7, -32),
		MOVE_TOWARDS_DESTINATION(),
		GET_EVENT_FLAG(EventFlag.tunnelTwsnThrkTR),
		JUMP_IF_FALSE("actionScript105.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(7296),
		TEST_ENTITY_RIGHT_OF_X_COORD(),
		JUMP_IF_FALSE("actionScript105.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		HALT(),
	);
}
/// $C3BCB0
immutable ubyte[50 + 7 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScript106;
shared static this() {
	actionScript106 = initializeScript!actionScript106(
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 96),
		SET_VAR(ActionScriptVars.v3, 96),
		SHORTCALL("unknownC3BD03"),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		GET_POSITION_OF_PARTY_MEMBER(255),
		ADD(ActionScriptVars.v7, 32),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_POSITION_OF_PARTY_MEMBER(255),
		ADD(ActionScriptVars.v7, 32),
		MOVE_TOWARDS_DESTINATION(),
		GET_EVENT_FLAG(EventFlag.tunnelTwsnThrkTR),
		JUMP_IF_FALSE("actionScript106.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(7680),
		TEST_ENTITY_RIGHT_OF_X_COORD(),
		JUMP_IF_FALSE("actionScript106.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		HALT(),
	);
}
/// $C3BD03
immutable ubyte[4 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC3BD03;
shared static this() {
	unknownC3BD03 = initializeScript!unknownC3BD03(
		SHORTCALL("unknownC3AAB8"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		SHORT_RETURN(),
	);
}
/// $C3BD0E
immutable ubyte[15 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript102;
shared static this() {
	actionScript102 = initializeScript!actionScript102(
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_ANIMATION(0),
		START_TASK("animateD8F2"),
		START_TASK("checkCollisionTask"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		SET_BOUNDARIES(24, 24),
		SHORTJUMP("actionScriptWanderWithinBounds"),
	);
}
/// $C3BD2E
immutable ubyte[24 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptMouseDoor;
shared static this() {
	actionScriptMouseDoor = initializeScript!actionScriptMouseDoor(
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7880),
		SET_VAR(ActionScriptVars.v7, 7912),
		SET_MOVEMENT_SPEED(256),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3BD56
immutable ubyte[24 + 5 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript107;
shared static this() {
	actionScript107 = initializeScript!actionScript107(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		START_TASK("unknownC3A1F3"),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 136),
		SET_VAR(ActionScriptVars.v3, 136),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.twsnTacoDiscover),
		HALT(),
	);
}
/// $C3BD80
immutable ubyte[15 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript108;
shared static this() {
	actionScript108 = initializeScript!actionScript108(
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_ANIMATION(0),
		START_TASK("unknownC3A1F3"),
		START_TASK("checkCollisionTask"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		SET_BOUNDARIES(8, 8),
		SHORTJUMP("actionScriptWanderWithinBounds"),
	);
}
/// $C3BDA0
immutable ubyte[24 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptMichikoIntoRoom;
shared static this() {
	actionScriptMichikoIntoRoom = initializeScript!actionScriptMichikoIntoRoom(
		SHORTCALL("unknownC3AA5A"),
		WRITE_WORD_WRAM(&pendingInteractions, 1),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 6768),
		SET_VAR(ActionScriptVars.v7, 8584),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6744),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3BDC3
immutable ubyte[45 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptMichikoIntoRoomB;
shared static this() {
	actionScriptMichikoIntoRoomB = initializeScript!actionScriptMichikoIntoRoomB(
		SET_X(8176),
		SET_Y(7528),
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 14),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 8064),
		SET_VAR(ActionScriptVars.v7, 7528),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 8040),
		SET_VAR(ActionScriptVars.v7, 7512),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		WRITE_WORD_WRAM(&pendingInteractions, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3BE01
immutable ubyte[22 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptFollowToMichiko;
shared static this() {
	actionScriptFollowToMichiko = initializeScript!actionScriptFollowToMichiko(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("actionScriptMakeIntangible"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 17),
		SET_NPC_DESTINATION(NPCID.unknown0231),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		SET_NPC_DESTINATION(NPCID.unknown0231),
		MOVE_TOWARDS_DESTINATION(),
		SHORTJUMP("actionScriptFollowToMichiko"),
	);
}
/// $C3BE2C
immutable ubyte[22 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptFollowToMichikoB;
shared static this() {
	actionScriptFollowToMichikoB = initializeScript!actionScriptFollowToMichikoB(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("actionScriptMakeIntangible"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 17),
		SET_SPRITE_DESTINATION(OverworldSprite.pigtailBlondeGirl),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		SET_SPRITE_DESTINATION(OverworldSprite.pigtailBlondeGirl),
		MOVE_TOWARDS_DESTINATION(),
		SHORTJUMP("actionScriptFollowToMichikoB.UNKNOWN0"),
	);
}
/// $C3BE57
immutable ubyte[19 + 5 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScript113;
shared static this() {
	actionScript113 = initializeScript!actionScript113(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		START_TASK("actionScriptMapObjStillEntry2"),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 80),
		SET_VAR(ActionScriptVars.v3, 192),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_WAKEUP_TONY"),
		HALT(),
	);
}
/// $C3BE80
immutable ubyte[20 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptWakeUpTony;
shared static this() {
	actionScriptWakeUpTony = initializeScript!actionScriptWakeUpTony(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 9),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		SET_VAR(ActionScriptVars.v5, 20),
		SET_MOVEMENT_SPEED(352),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3BEA4
immutable ubyte[35 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC3BEA4;
shared static this() {
	unknownC3BEA4 = initializeScript!unknownC3BEA4(
		SET_VAR(ActionScriptVars.v4, 0),
		WRITE_WORD_TEMPVAR(Direction.up),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(8),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7592),
		SET_VAR(ActionScriptVars.v7, 7648),
		SET_MOVEMENT_SPEED(256),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		YIELD_TO_TEXT(),
		SHORT_RETURN(),
	);
}
/// $C3BED4
immutable ubyte[21 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3BED4;
shared static this() {
	unknownC3BED4 = initializeScript!unknownC3BED4(
		SET_VAR(ActionScriptVars.v4, 0),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 7664),
		SET_VAR(ActionScriptVars.v7, 7656),
		SET_MOVEMENT_SPEED(320),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORT_RETURN(),
	);
}
/// $C3BEEE
immutable ubyte[57 + 7 * (const(void)*).sizeof + 9 * ScriptPointer.sizeof] actionScriptGorgeousFree;
shared static this() {
	actionScriptGorgeousFree = initializeScript!actionScriptGorgeousFree(
		SET_X(7656),
		SET_Y(7656),
		SHORTCALL("unknownC3AA38"),
		START_TASK("actionScriptTonzuraFree"),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		SHORTCALL("actionScriptMoveInDirection"),
		PLAY_SFX(Sfx.doorClose),
		PAUSE(22),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(88),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_FALSE("actionScriptGorgeousFree.UNKNOWN0"),
		SHORTCALL("unknownC3BEA4"),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_TRUE("actionScriptGorgeousFree.UNKNOWN1"),
		SHORTCALL("unknownC3BED4"),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.temp2),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3BF4E
immutable ubyte[61 + 7 * (const(void)*).sizeof + 9 * ScriptPointer.sizeof] actionScriptLuckyFree;
shared static this() {
	actionScriptLuckyFree = initializeScript!actionScriptLuckyFree(
		SET_X(7656),
		SET_Y(7656),
		SET_ANIMATION(255),
		PAUSE(18),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		SHORTCALL("actionScriptMoveInDirection"),
		PLAY_SFX(Sfx.doorClose),
		PAUSE(22),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(72),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp2),
		JUMP_IF_FALSE("actionScriptLuckyFree.UNKNOWN0"),
		START_TASK("actionScriptTonzuraFree"),
		SHORTCALL("unknownC3BEA4"),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp2),
		JUMP_IF_TRUE("actionScriptLuckyFree.UNKNOWN1"),
		SHORTCALL("unknownC3BED4"),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.temp3),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3BFB2
immutable ubyte[61 + 7 * (const(void)*).sizeof + 9 * ScriptPointer.sizeof] actionScriptNiceFree;
shared static this() {
	actionScriptNiceFree = initializeScript!actionScriptNiceFree(
		SET_X(7656),
		SET_Y(7656),
		SET_ANIMATION(255),
		PAUSE(36),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		SHORTCALL("actionScriptMoveInDirection"),
		PLAY_SFX(Sfx.doorClose),
		PAUSE(22),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(56),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp3),
		JUMP_IF_FALSE("actionScriptNiceFree.UNKNOWN0"),
		START_TASK("actionScriptTonzuraFree"),
		SHORTCALL("unknownC3BEA4"),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp3),
		JUMP_IF_TRUE("actionScriptNiceFree.UNKNOWN1"),
		SHORTCALL("unknownC3BED4"),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.temp4),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C016
immutable ubyte[63 + 7 * (const(void)*).sizeof + 9 * ScriptPointer.sizeof] actionScriptOKFree;
shared static this() {
	actionScriptOKFree = initializeScript!actionScriptOKFree(
		SET_X(7656),
		SET_Y(7656),
		SET_ANIMATION(255),
		PAUSE(54),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		SHORTCALL("actionScriptMoveInDirection"),
		PLAY_SFX(Sfx.doorClose),
		PAUSE(22),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(40),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_TEMPVAR_TO_VAR(ActionScriptVars.v4),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp4),
		JUMP_IF_FALSE("actionScriptOKFree.UNKNOWN0"),
		START_TASK("actionScriptTonzuraFree"),
		SHORTCALL("unknownC3BEA4"),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp4),
		JUMP_IF_TRUE("actionScriptOKFree.UNKNOWN1"),
		SHORTCALL("unknownC3BED4"),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.temp5),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C07C
immutable ubyte[62 + 8 * (const(void)*).sizeof + 9 * ScriptPointer.sizeof] actionScriptGrooveFree;
shared static this() {
	actionScriptGrooveFree = initializeScript!actionScriptGrooveFree(
		SET_X(7656),
		SET_Y(7656),
		SET_ANIMATION(255),
		PAUSE(72),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		SHORTCALL("actionScriptMoveInDirection"),
		PLAY_SFX(Sfx.doorClose),
		PAUSE(22),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(24),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		WRITE_WORD_TEMPVAR(1),
		SET_EVENT_FLAG(EventFlag.temp1),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp5),
		JUMP_IF_FALSE("actionScriptGrooveFree.UNKNOWN0"),
		START_TASK("actionScriptTonzuraFree"),
		SHORTCALL("unknownC3BEA4"),
	LABEL("UNKNOWN1"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp5),
		JUMP_IF_TRUE("actionScriptGrooveFree.UNKNOWN1"),
		SHORTCALL("unknownC3BED4"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C0E4
immutable ubyte[7 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTonzuraFree;
shared static this() {
	actionScriptTonzuraFree = initializeScript!actionScriptTonzuraFree(
		MAKE_PARTY_LOOK_AT_SELF(),
		MAKE_NPC_LOOK_AT_SELF(NPCID.unknown0253),
		PAUSE(3),
		SHORTJUMP("actionScriptTonzuraFree"),
	);
}
/// $C3C0F3
immutable ubyte[10 + 2 * ScriptPointer.sizeof] actionScriptGorgeousFree2A;
shared static this() {
	actionScriptGorgeousFree2A = initializeScript!actionScriptGorgeousFree2A(
		START_TASK("unknownC3C227"),
		SHORTCALL("unknownC3C143"),
		PAUSE(152),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		HALT(),
	);
}
/// $C3C101
immutable ubyte[13 + 1 * ScriptPointer.sizeof] actionScriptLuckyFree2A;
shared static this() {
	actionScriptLuckyFree2A = initializeScript!actionScriptLuckyFree2A(
		SET_ANIMATION(255),
		PAUSE(18),
		SHORTCALL("unknownC3C143"),
		PAUSE(136),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		HALT(),
	);
}
/// $C3C110
immutable ubyte[13 + 1 * ScriptPointer.sizeof] actionScriptNiceFree2A;
shared static this() {
	actionScriptNiceFree2A = initializeScript!actionScriptNiceFree2A(
		SET_ANIMATION(255),
		PAUSE(36),
		SHORTCALL("unknownC3C143"),
		PAUSE(120),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		HALT(),
	);
}
/// $C3C11F
immutable ubyte[13 + 1 * ScriptPointer.sizeof] actionScriptOKFree2A;
shared static this() {
	actionScriptOKFree2A = initializeScript!actionScriptOKFree2A(
		SET_ANIMATION(255),
		PAUSE(54),
		SHORTCALL("unknownC3C143"),
		PAUSE(104),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		HALT(),
	);
}
/// $C3C12E
immutable ubyte[16 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptGrooveFree2A;
shared static this() {
	actionScriptGrooveFree2A = initializeScript!actionScriptGrooveFree2A(
		SET_ANIMATION(255),
		PAUSE(72),
		SHORTCALL("unknownC3C143"),
		PAUSE(88),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 1),
		PAUSE(30),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3C143
immutable ubyte[24 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] unknownC3C143;
shared static this() {
	unknownC3C143 = initializeScript!unknownC3C143(
		SET_X(4592),
		SET_Y(4968),
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.downLeft),
		SHORTCALL("actionScriptMoveInDirection"),
		PLAY_SFX(Sfx.doorClose),
		PAUSE(22),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		SHORT_RETURN(),
	);
}
/// $C3C167
immutable ubyte[7 + 2 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptTonzuraFree2B;
shared static this() {
	actionScriptTonzuraFree2B = initializeScript!actionScriptTonzuraFree2B(
		SHORTCALL("unknownC3C1E0"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SHORTCALL("unknownC3C20F"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C17A
immutable ubyte[22 + 6 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptGrooveFree2B;
shared static this() {
	actionScriptGrooveFree2B = initializeScript!actionScriptGrooveFree2B(
		SHORTCALL("unknownC3C1E0"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		LOOP(4),
			WRITE_WORD_TEMPVAR(2),
			GET_DIRECTION_ROTATED_CLOCKWISE(),
			SET_DIRECTION(),
			UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
			PAUSE(12),
		LOOP_END(),
		YIELD_TO_TEXT(),
		PAUSE(1),
		END_LAST_TASK(),
		SHORTCALL("unknownC3C20F"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C1A8
immutable ubyte[29 + 5 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptGorgeousFree2C;
shared static this() {
	actionScriptGorgeousFree2C = initializeScript!actionScriptGorgeousFree2C(
		SET_X(4592),
		SET_Y(4968),
		SHORTCALL("unknownC3AA38"),
		START_TASK("unknownC3C227"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 17),
		SET_SPRITE_DESTINATION(OverworldSprite.runawayFiveSaxPlayer),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		SET_SPRITE_DESTINATION(OverworldSprite.runawayFiveSaxPlayer),
		MOVE_TOWARDS_DESTINATION(),
		JUMP_IF_FALSE("actionScriptGorgeousFree2C.UNKNOWN0"),
		YIELD_TO_TEXT(),
		SHORTCALL("unknownC3C20F"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C1E0
immutable ubyte[30 + 3 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] unknownC3C1E0;
shared static this() {
	unknownC3C1E0 = initializeScript!unknownC3C1E0(
		SHORTCALL("unknownC3AA38"),
		START_TASK("unknownC3C227"),
		WRITE_WORD_TEMPVAR(Direction.up),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(8),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 4448),
		SET_VAR(ActionScriptVars.v7, 4960),
		SET_MOVEMENT_SPEED(256),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORT_RETURN(),
	);
}
/// $C3C20F
immutable ubyte[16 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3C20F;
shared static this() {
	unknownC3C20F = initializeScript!unknownC3C20F(
		SET_VAR(ActionScriptVars.v6, 4592),
		SET_VAR(ActionScriptVars.v7, 4968),
		SET_MOVEMENT_SPEED(256),
		SHORTCALL("actionScriptMoveToLocation"),
		PLAY_SFX(Sfx.doorClose),
		SHORT_RETURN(),
	);
}
/// $C3C227
immutable ubyte[7 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3C227;
shared static this() {
	unknownC3C227 = initializeScript!unknownC3C227(
		MAKE_PARTY_LOOK_AT_SELF(),
		MAKE_NPC_LOOK_AT_SELF(NPCID.unknown0839),
		PAUSE(3),
		SHORTJUMP("unknownC3C227"),
	);
}
/// $C3C236
immutable ubyte[21 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptMogiriToRight;
shared static this() {
	actionScriptMogiriToRight = initializeScript!actionScriptMogiriToRight(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 18),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(48),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		HALT(),
	);
}
/// $C3C258
immutable ubyte[27 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptMogiriToDown;
shared static this() {
	actionScriptMogiriToDown = initializeScript!actionScriptMogiriToDown(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 18),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.down),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(32),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(32),
		SET_VELOCITIES_ZERO(),
		END_LAST_TASK(),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3C282
immutable ubyte[39 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript132;
shared static this() {
	actionScript132 = initializeScript!actionScript132(
		SHORTCALL("unknownC3AA38"),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(30),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5464),
		SET_VAR(ActionScriptVars.v7, 6072),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
	LABEL("UNKNOWN0"),
		SET_X_RELATIVE(1),
		PAUSE(4),
		SET_X_RELATIVE(-1),
		PAUSE(4),
		SHORTJUMP("actionScript132.UNKNOWN0"),
	);
}
/// $C3C2B8
immutable ubyte[9 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptMonotoryOutAGorgeous;
shared static this() {
	actionScriptMonotoryOutAGorgeous = initializeScript!actionScriptMonotoryOutAGorgeous(
		SET_X(5928),
		SET_Y(5992),
		SHORTCALL("actionScriptMonotoryOutAGrooveUnknownRoutine"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C2C8
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptMonotoryOutALucky;
shared static this() {
	actionScriptMonotoryOutALucky = initializeScript!actionScriptMonotoryOutALucky(
		SET_X(5960),
		SET_Y(5968),
		SHORTJUMP("actionScriptMonotoryOutAGroove.ENTRY2"),
	);
}
/// $C3C2D1
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptMonotoryOutANice;
shared static this() {
	actionScriptMonotoryOutANice = initializeScript!actionScriptMonotoryOutANice(
		SET_X(5976),
		SET_Y(5992),
		SHORTJUMP("actionScriptMonotoryOutAGroove.ENTRY2"),
	);
}
/// $C3C2DA
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScriptMonotoryOutAOK;
shared static this() {
	actionScriptMonotoryOutAOK = initializeScript!actionScriptMonotoryOutAOK(
		SET_X(6000),
		SET_Y(5960),
		SHORTJUMP("actionScriptMonotoryOutAGroove.ENTRY2"),
	);
}
/// $C3C2E3
immutable ubyte[8 + 2 * ScriptPointer.sizeof] actionScriptMonotoryOutAGroove;
shared static this() {
	actionScriptMonotoryOutAGroove = initializeScript!actionScriptMonotoryOutAGroove(
		SET_X(6024),
		SET_Y(5992),
	LABEL("ENTRY2"),
		SHORTCALL("actionScriptMonotoryOutAGrooveUnknownRoutine"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C2EF
immutable ubyte[37 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptMonotoryOutAGrooveUnknownRoutine;
shared static this() {
	actionScriptMonotoryOutAGrooveUnknownRoutine = initializeScript!actionScriptMonotoryOutAGrooveUnknownRoutine(
		SHORTCALL("unknownC3AA38"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v4, 1),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_FALSE("actionScriptMonotoryOutAGrooveUnknownRoutine.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 6088),
		SET_VAR(ActionScriptVars.v7, 5992),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORT_RETURN(),
	);
}
/// $C3C326
immutable ubyte[9 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript127;
shared static this() {
	actionScript127 = initializeScript!actionScript127(
		SET_X(5416),
		SET_Y(5864),
		SHORTCALL("unknownC3C35D"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C336
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScript128;
shared static this() {
	actionScript128 = initializeScript!actionScript128(
		SET_X(5440),
		SET_Y(5856),
		SHORTJUMP("actionScript131.ENTRY2"),
	);
}
/// $C3C33F
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScript129;
shared static this() {
	actionScript129 = initializeScript!actionScript129(
		SET_X(5464),
		SET_Y(5864),
		SHORTJUMP("actionScript131.ENTRY2"),
	);
}
/// $C3C348
immutable ubyte[7 + 1 * ScriptPointer.sizeof] actionScript130;
shared static this() {
	actionScript130 = initializeScript!actionScript130(
		SET_X(5488),
		SET_Y(5848),
		SHORTJUMP("actionScript131.ENTRY2"),
	);
}
/// $C3C351
immutable ubyte[8 + 2 * ScriptPointer.sizeof] actionScript131;
shared static this() {
	actionScript131 = initializeScript!actionScript131(
		SET_X(5512),
		SET_Y(5864),
	LABEL("ENTRY2"),
		SHORTCALL("unknownC3C35D"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C35D
immutable ubyte[37 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] unknownC3C35D;
shared static this() {
	unknownC3C35D = initializeScript!unknownC3C35D(
		SHORTCALL("unknownC3AA38"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VAR(ActionScriptVars.v4, 1),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		GET_EVENT_FLAG(EventFlag.temp1),
		JUMP_IF_FALSE("unknownC3C35D.UNKNOWN0"),
		SET_VAR(ActionScriptVars.v4, 0),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5616),
		SET_VAR(ActionScriptVars.v7, 5864),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORT_RETURN(),
	);
}
/// $C3C394
immutable ubyte[64 + 5 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptGiantStepCop;
shared static this() {
	actionScriptGiantStepCop = initializeScript!actionScriptGiantStepCop(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 14),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 19),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 1472),
		SET_VAR(ActionScriptVars.v7, 536),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_Y_RELATIVE(256),
		PAUSE(60),
		SET_X(1456),
		SET_Y(568),
		SET_VAR(ActionScriptVars.v4, 9),
		SET_MOVEMENT_SPEED(352),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1456),
		SET_VAR(ActionScriptVars.v7, 624),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C3ED
immutable ubyte[28 + 6 * (const(void)*).sizeof + 1 * string.sizeof + 4 * ScriptPointer.sizeof] actionScript134;
shared static this() {
	actionScript134 = initializeScript!actionScript134(
		SHORTCALL("unknownC3AAB8"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS(),
		SET_VAR(ActionScriptVars.v2, 40),
		SET_VAR(ActionScriptVars.v3, 40),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_KIFUYA"),
		PAUSE(1),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 17),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3C427
immutable ubyte[43 + 7 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptKifuyaTukimatou;
shared static this() {
	actionScriptKifuyaTukimatou = initializeScript!actionScriptKifuyaTukimatou(
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_ANIMATION(0),
		START_TASK("animateDVAR4F2"),
		START_TASK("checkCollisionTask"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(384),
	LABEL("UNKNOWN0"),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 0),
		CHOOSE_RANDOM(20, 40, 60),
		WRITE_TEMPVAR_WAITTIMER(),
		SET_VAR(ActionScriptVars.v4, 7),
		SET_VAR(ActionScriptVars.v5, 18),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
		LOOP(60),
			PAUSE(1),
			GET_POSITION_OF_PARTY_MEMBER(255),
			MOVE_TOWARDS_DESTINATION(),
		LOOP_END(),
		SHORTJUMP("actionScriptKifuyaTukimatou.UNKNOWN0"),
	);
}
/// $C3C46E
immutable ubyte[65 + 8 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptFatherCallPaula;
shared static this() {
	actionScriptFatherCallPaula = initializeScript!actionScriptFatherCallPaula(
		SHORTCALL("unknownC3AAAA"),
		SET_VAR(ActionScriptVars.v4, 12),
		START_TASK("unknownC3AFA3"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 6696),
		SET_VAR(ActionScriptVars.v7, 7760),
		SHORTCALL("actionScriptMoveToLocation"),
		PLAY_SFX(Sfx.unknown12),
		SET_X_RELATIVE(-256),
		PAUSE(60),
		PLAY_SFX(Sfx.doorClose),
		PAUSE(60),
		PLAY_SFX(Sfx.doorClose),
		PAUSE(40),
		PLAY_SFX(Sfx.unknown61),
		PAUSE(50),
		SET_X_RELATIVE(256),
		SET_VAR(ActionScriptVars.v4, 7),
		SET_VAR(ActionScriptVars.v5, 20),
		SET_MOVEMENT_SPEED(384),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3C4CF
immutable ubyte[77 + 9 * (const(void)*).sizeof + 2 * string.sizeof + 1 * ScriptPointer.sizeof] actionScriptSwWins;
shared static this() {
	actionScriptSwWins = initializeScript!actionScriptSwWins(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS_OFFSET(0, 8),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 2),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_RIDE_SW_WINS"),
		PREPARE_NEW_ENTITY_AT_PARTY_LEADER(),
		PAUSE(1),
		QUEUE_TEXT_SCRIPT("MSG_EVT_RIDE_SW_WINS_LAUNCH"),
	LABEL("ENTRY2"),
		LOOP(10),
			SET_X_RELATIVE(2),
			PAUSE(4),
			SET_X_RELATIVE(-2),
			PAUSE(4),
			SET_X_RELATIVE(-2),
			PAUSE(4),
			SET_X_RELATIVE(2),
			PAUSE(4),
			SET_Y_RELATIVE(-2),
			PAUSE(4),
			SET_Y_RELATIVE(2),
			PAUSE(4),
			SET_Y_RELATIVE(2),
			PAUSE(4),
			SET_Y_RELATIVE(-2),
			PAUSE(4),
		LOOP_END(),
		YIELD_TO_TEXT(),
		SET_Y_VELOCITY(-512),
		PAUSE(80),
		YIELD_TO_TEXT(),
		SET_VELOCITIES_ZERO(),
		HALT(),
	);
}
/// $C3C540
immutable ubyte[26 + 7 * (const(void)*).sizeof + 2 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptSw2Wins;
shared static this() {
	actionScriptSw2Wins = initializeScript!actionScriptSw2Wins(
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS_OFFSET(0, 8),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 2),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_RIDE_SW_WINS"),
		PREPARE_NEW_ENTITY_AT_PARTY_LEADER(),
		PAUSE(1),
		QUEUE_TEXT_SCRIPT("MSG_EVT_RIDE_SW2_WINS_LAUNCH"),
		SHORTJUMP("actionScriptSwWins.ENTRY2"),
	);
}
/// $C3C57A
immutable ubyte[15 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScript178;
shared static this() {
	actionScript178 = initializeScript!actionScript178(
		SET_PHYSICS_CALLBACK(&unknownC0A360),
		SET_ANIMATION(0),
		START_TASK("unknownC3A1F3"),
		START_TASK("checkCollisionTask"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		SET_BOUNDARIES(24, 24),
		SHORTJUMP("actionScriptWanderWithinBounds"),
	);
}
/// $C3C59A
immutable ubyte[28 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptNearAndoughnut;
shared static this() {
	actionScriptNearAndoughnut = initializeScript!actionScriptNearAndoughnut(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7856),
		SET_VAR(ActionScriptVars.v7, 2896),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.up),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3C5C6
immutable ubyte[26 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptAndoughnutMessage;
shared static this() {
	actionScriptAndoughnutMessage = initializeScript!actionScriptAndoughnutMessage(
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		LOOP(5),
			LOOP(60),
				GET_PRESSED_BUTTONS(),
				AND_TEMPVAR(Pad.a | Pad.l),
				JUMP_IF_TRUE("actionScriptAndoughnutMessage.UNKNOWN0"),
				PAUSE(1),
			LOOP_END(),
		LOOP_END(),
		YIELD_TO_TEXT(),
		HALT(),
	LABEL("UNKNOWN0"),
		SET_EVENT_FLAG(EventFlag.temp8),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3C5F0
immutable ubyte[19 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptWinsNearKanai;
shared static this() {
	actionScriptWinsNearKanai = initializeScript!actionScriptWinsNearKanai(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7824),
		SET_VAR(ActionScriptVars.v7, 2896),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3C60D
immutable ubyte[23 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptWinsNearBMonkey;
shared static this() {
	actionScriptWinsNearBMonkey = initializeScript!actionScriptWinsNearBMonkey(
		SHORTCALL("unknownC3AA38"),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7840),
		SET_VAR(ActionScriptVars.v7, 2888),
		SHORTCALL("actionScriptMoveToLocation"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3C634
immutable ubyte[55 + 6 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptWinsAwayKanai;
shared static this() {
	actionScriptWinsAwayKanai = initializeScript!actionScriptWinsAwayKanai(
		SHORTCALL("unknownC3AA38"),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7872),
		SET_VAR(ActionScriptVars.v7, 2912),
		SHORTCALL("actionScriptMoveToLocation"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(30),
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v6, 7896),
		SET_VAR(ActionScriptVars.v7, 2912),
		SHORTCALL("actionScriptMoveToLocationBackwards"),
		PAUSE(30),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 7968),
		SET_VAR(ActionScriptVars.v7, 2912),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C687
immutable ubyte[29 + 3 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptWinsAwayBMonkey;
shared static this() {
	actionScriptWinsAwayBMonkey = initializeScript!actionScriptWinsAwayBMonkey(
		SHORTCALL("unknownC3AA38"),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 7872),
		SET_VAR(ActionScriptVars.v7, 2912),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 7968),
		SET_VAR(ActionScriptVars.v7, 2912),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C6B5
immutable ubyte[22 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptIntoSwWins;
shared static this() {
	actionScriptIntoSwWins = initializeScript!actionScriptIntoSwWins(
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_NPC_DESTINATION(NPCID.unknown0623),
		ADD(ActionScriptVars.v7, 8),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_NPC_DESTINATION(NPCID.unknown0623),
		SHORTCALL("unknownC3B70C"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C6DD
immutable ubyte[72 + 10 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptSwWinsA;
shared static this() {
	actionScriptSwWinsA = initializeScript!actionScriptSwWinsA(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3DIgnoreSurface),
		SET_Z(0),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_Z_VELOCITY(64),
		PAUSE(200),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		PAUSE(40),
		SET_VELOCITIES_ZERO(),
		PAUSE(60),
		PAUSE(40),
		SET_MOVEMENT_SPEED(512),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(24),
		LOOP(32),
			PAUSE(1),
			SET_X_VELOCITY_RELATIVE(-16),
		LOOP_END(),
		SET_VELOCITIES_ZERO(),
		PAUSE(40),
		LOOP(32),
			PAUSE(1),
			SET_X_VELOCITY_RELATIVE(-32),
		LOOP_END(),
		LOOP(32),
			SET_Z_VELOCITY_RELATIVE(16),
			PAUSE(1),
		LOOP_END(),
		PAUSE(30),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.SKYW_SKY_B),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C747
immutable ubyte[69 + 10 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptSwThrkB;
shared static this() {
	actionScriptSwThrkB = initializeScript!actionScriptSwThrkB(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3DIgnoreSurface),
		SET_Z(0),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_Z_VELOCITY(32),
		PAUSE(240),
		SET_VELOCITIES_ZERO(),
		PAUSE(60),
		SET_MOVEMENT_SPEED(512),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(24),
		LOOP(32),
			PAUSE(1),
			SET_X_VELOCITY_RELATIVE(16),
		LOOP_END(),
		SET_VELOCITIES_ZERO(),
		PAUSE(20),
		LOOP(64),
			PAUSE(1),
			SET_X_VELOCITY_RELATIVE(16),
		LOOP_END(),
		PAUSE(120),
		LOOP(64),
			SET_Z_VELOCITY_RELATIVE(8),
			PAUSE(1),
		LOOP_END(),
		PAUSE(48),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.SKYW_SKY_A),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C7AE
immutable ubyte[64 + 10 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptSwThrkShadowB;
shared static this() {
	actionScriptSwThrkShadowB = initializeScript!actionScriptSwThrkShadowB(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3DIgnoreSurface),
		SET_Z(0),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(240),
		PAUSE(60),
		SET_ANIMATION(0),
		SET_MOVEMENT_SPEED(512),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(24),
		LOOP(32),
			PAUSE(1),
			SET_X_VELOCITY_RELATIVE(16),
		LOOP_END(),
		SET_VELOCITIES_ZERO(),
		PAUSE(20),
		LOOP(64),
			PAUSE(1),
			SET_X_VELOCITY_RELATIVE(16),
		LOOP_END(),
		PAUSE(120),
		LOOP(64),
			PAUSE(1),
		LOOP_END(),
		PAUSE(48),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.SKYW_SKY_A),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C810
immutable ubyte[8 + 1 * ScriptPointer.sizeof] unknownC3C810;
shared static this() {
	unknownC3C810 = initializeScript!unknownC3C810(
		ADD(ActionScriptVars.v1, -2),
		PAUSE(1),
		SHORTJUMP("unknownC3C810"),
	);
}
/// $C3C81A
immutable ubyte[8 + 1 * ScriptPointer.sizeof] unknownC3C81A;
shared static this() {
	unknownC3C81A = initializeScript!unknownC3C81A(
		ADD(ActionScriptVars.v1, 2),
		PAUSE(1),
		SHORTJUMP("unknownC3C81A"),
	);
}
/// $C3C824
immutable ubyte[75 + 1 * ScriptPointer.sizeof] unknownC3C824;
shared static this() {
	unknownC3C824 = initializeScript!unknownC3C824(
		PAUSE(2),
		SET_VAR(ActionScriptVars.v2, 0),
		SET_X_RELATIVE(1),
		PAUSE(2),
		SET_X_RELATIVE(1),
		LOOP(2),
			PAUSE(2),
			SET_X_RELATIVE(-1),
		LOOP_END(),
		LOOP(2),
			PAUSE(2),
			SET_X_RELATIVE(-1),
		LOOP_END(),
		LOOP(2),
			PAUSE(2),
			SET_X_RELATIVE(1),
		LOOP_END(),
		LOOP(2),
			PAUSE(2),
			SET_Y_RELATIVE(1),
		LOOP_END(),
		LOOP(2),
			PAUSE(2),
			SET_Y_RELATIVE(-1),
		LOOP_END(),
		LOOP(2),
			PAUSE(2),
			SET_Y_RELATIVE(-1),
		LOOP_END(),
		LOOP(2),
			PAUSE(2),
			SET_Y_RELATIVE(1),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v2, 1),
		SHORTJUMP("unknownC3C824"),
	);
}
/// $C3C871
immutable ubyte[48 + 1 * ScriptPointer.sizeof] unknownC3C871;
shared static this() {
	unknownC3C871 = initializeScript!unknownC3C871(
		PAUSE(2),
		SET_VAR(ActionScriptVars.v2, 0),
		PAUSE(2),
		LOOP(2),
			PAUSE(2),
		LOOP_END(),
		LOOP(2),
			PAUSE(2),
		LOOP_END(),
		LOOP(2),
			PAUSE(2),
		LOOP_END(),
		LOOP(2),
			PAUSE(2),
		LOOP_END(),
		LOOP(2),
			PAUSE(2),
		LOOP_END(),
		LOOP(2),
			PAUSE(2),
		LOOP_END(),
		LOOP(2),
			PAUSE(2),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v2, 1),
		SHORTJUMP("unknownC3C871"),
	);
}
/// $C3C8A3
immutable ubyte[5 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSwSkyA;
shared static this() {
	actionScriptSwSkyA = initializeScript!actionScriptSwSkyA(
		SHORTCALL("unknownC3C90C"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.SKYW_FOUR_A),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C8B2
immutable ubyte[5 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSwSkyB;
shared static this() {
	actionScriptSwSkyB = initializeScript!actionScriptSwSkyB(
		SHORTCALL("unknownC3C90C"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.SKYW_DSRT_A),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C8C1
immutable ubyte[5 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSwSkyC;
shared static this() {
	actionScriptSwSkyC = initializeScript!actionScriptSwSkyC(
		SHORTCALL("unknownC3C90C"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.SKYW_THRK_A),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C8D0
immutable ubyte[5 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSwSkyD;
shared static this() {
	actionScriptSwSkyD = initializeScript!actionScriptSwSkyD(
		SHORTCALL("unknownC3C94E"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.SKYW_DSRT_B),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C8DF
immutable ubyte[5 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSwSkyE;
shared static this() {
	actionScriptSwSkyE = initializeScript!actionScriptSwSkyE(
		SHORTCALL("unknownC3C94E"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.SKYW_FOUR_B),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C8EE
immutable ubyte[5 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSwSkyF;
shared static this() {
	actionScriptSwSkyF = initializeScript!actionScriptSwSkyF(
		SHORTCALL("unknownC3C94E"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.SKYW_WINS_A),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C8FD
immutable ubyte[5 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC3C8FD;
shared static this() {
	unknownC3C8FD = initializeScript!unknownC3C8FD(
		SHORTCALL("unknownC3C94E"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.SKYW_SUMS_A),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C90C
immutable ubyte[43 + 5 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] unknownC3C90C;
shared static this() {
	unknownC3C90C = initializeScript!unknownC3C90C(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AB26"),
		SET_Z(-96),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		SET_Z_VELOCITY(256),
		PAUSE(96),
		SET_Z_VELOCITY(0),
		PAUSE(200),
		PAUSE(200),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		SET_Z_VELOCITY(-256),
		PAUSE(96),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		SHORT_RETURN(),
	);
}
/// $C3C94E
immutable ubyte[43 + 5 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] unknownC3C94E;
shared static this() {
	unknownC3C94E = initializeScript!unknownC3C94E(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AB26"),
		SET_Z(-96),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		SET_Z_VELOCITY(256),
		PAUSE(96),
		SET_Z_VELOCITY(0),
		PAUSE(200),
		PAUSE(200),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		SET_Z_VELOCITY(-256),
		PAUSE(96),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		SHORT_RETURN(),
	);
}
/// $C3C990
immutable ubyte[53 + 7 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptSwFourA;
shared static this() {
	actionScriptSwFourA = initializeScript!actionScriptSwFourA(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3DIgnoreSurface),
		SET_Z(192),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(768),
		SET_VAR(ActionScriptVars.v5, 3),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		SET_Z_VELOCITY(-256),
		PAUSE(128),
		SET_Z_VELOCITY(0),
		SET_VAR(ActionScriptVars.v6, 2552),
		SET_VAR(ActionScriptVars.v7, 4136),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(768),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		SET_Z_VELOCITY(256),
		PAUSE(128),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3C9E0
immutable ubyte[53 + 11 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptSwFourShadowA;
shared static this() {
	actionScriptSwFourShadowA = initializeScript!actionScriptSwFourShadowA(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3DIgnoreSurface),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(768),
		SET_VAR(ActionScriptVars.v5, 3),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(128),
		SET_VAR(ActionScriptVars.v6, 2552),
		SET_VAR(ActionScriptVars.v7, 4136),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(768),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(32),
		SET_ANIMATION(255),
		PAUSE(96),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.SKYW_SKY_B),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3CA3E
immutable ubyte[53 + 7 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptSwFourB;
shared static this() {
	actionScriptSwFourB = initializeScript!actionScriptSwFourB(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3DIgnoreSurface),
		SET_Z(192),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(768),
		SET_VAR(ActionScriptVars.v5, 3),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		SET_Z_VELOCITY(-256),
		PAUSE(128),
		SET_Z_VELOCITY(0),
		SET_VAR(ActionScriptVars.v6, 3264),
		SET_VAR(ActionScriptVars.v7, 4136),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(768),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		SET_Z_VELOCITY(256),
		PAUSE(128),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3CA8E
immutable ubyte[51 + 11 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptSwFourShadowB;
shared static this() {
	actionScriptSwFourShadowB = initializeScript!actionScriptSwFourShadowB(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3DIgnoreSurface),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(768),
		SET_VAR(ActionScriptVars.v5, 3),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(128),
		SET_VAR(ActionScriptVars.v6, 3264),
		SET_VAR(ActionScriptVars.v7, 4136),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(768),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(32),
		PAUSE(96),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.SKYW_SKY_A),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3CAEA
immutable ubyte[51 + 7 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptSwDsrtA;
shared static this() {
	actionScriptSwDsrtA = initializeScript!actionScriptSwDsrtA(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3DIgnoreSurface),
		SET_Z(192),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(1024),
		SET_VAR(ActionScriptVars.v5, 4),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		SET_Z_VELOCITY(-256),
		PAUSE(128),
		SET_Z_VELOCITY(0),
		SET_VAR(ActionScriptVars.v6, 2000),
		SET_VAR(ActionScriptVars.v7, 9360),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		SET_Z_VELOCITY(256),
		PAUSE(128),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3CB38
immutable ubyte[46 + 7 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptSwDsrtShadowA;
shared static this() {
	actionScriptSwDsrtShadowA = initializeScript!actionScriptSwDsrtShadowA(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AB26"),
		SET_Z(0),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(1024),
		SET_VAR(ActionScriptVars.v5, 4),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(128),
		SET_VAR(ActionScriptVars.v6, 2000),
		SET_VAR(ActionScriptVars.v7, 9360),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(128),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.SKYW_SKY_B),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3CB87
immutable ubyte[51 + 7 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] actionScriptSwDsrtB;
shared static this() {
	actionScriptSwDsrtB = initializeScript!actionScriptSwDsrtB(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3DIgnoreSurface),
		SET_Z(192),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(1024),
		SET_VAR(ActionScriptVars.v5, 4),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		SET_Z_VELOCITY(-256),
		PAUSE(128),
		SET_Z_VELOCITY(0),
		SET_VAR(ActionScriptVars.v6, 3536),
		SET_VAR(ActionScriptVars.v7, 9344),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		SET_Z_VELOCITY(256),
		PAUSE(128),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3CBD5
immutable ubyte[46 + 7 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] actionScriptSwDsrtShadowB;
shared static this() {
	actionScriptSwDsrtShadowB = initializeScript!actionScriptSwDsrtShadowB(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AB26"),
		SET_Z(0),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(1024),
		SET_VAR(ActionScriptVars.v5, 4),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(128),
		SET_VAR(ActionScriptVars.v6, 3536),
		SET_VAR(ActionScriptVars.v7, 9344),
		SHORTCALL("actionScriptMoveToLocation"),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(128),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.SKYW_SKY_A),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3CC24
immutable ubyte[46 + 5 * ScriptPointer.sizeof] unknownC3CC24;
shared static this() {
	unknownC3CC24 = initializeScript!unknownC3CC24(
		SET_VAR(ActionScriptVars.v6, 5288),
		SET_VAR(ActionScriptVars.v7, 8976),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5208),
		SET_VAR(ActionScriptVars.v7, 8856),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5208),
		SET_VAR(ActionScriptVars.v7, 8720),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5288),
		SET_VAR(ActionScriptVars.v7, 8600),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5472),
		SET_VAR(ActionScriptVars.v7, 8448),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORT_RETURN(),
	);
}
/// $C3CC5C
immutable ubyte[46 + 5 * ScriptPointer.sizeof] unknownC3CC5C;
shared static this() {
	unknownC3CC5C = initializeScript!unknownC3CC5C(
		SET_VAR(ActionScriptVars.v6, 5288),
		SET_VAR(ActionScriptVars.v7, 9024),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5208),
		SET_VAR(ActionScriptVars.v7, 8904),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5208),
		SET_VAR(ActionScriptVars.v7, 8768),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5288),
		SET_VAR(ActionScriptVars.v7, 8648),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5472),
		SET_VAR(ActionScriptVars.v7, 8496),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORT_RETURN(),
	);
}
/// $C3CC94
immutable ubyte[14 + 3 * ScriptPointer.sizeof] unknownC3CC94;
shared static this() {
	unknownC3CC94 = initializeScript!unknownC3CC94(
		START_TASK("unknownC3C824"),
		PAUSE(100),
		END_LAST_TASK(),
		PAUSE(80),
		START_TASK("unknownC3C824"),
		PAUSE(100),
		END_LAST_TASK(),
		PAUSE(80),
		START_TASK("unknownC3C824"),
		HALT(),
	);
}
/// $C3CCA8
immutable ubyte[11 + 1 * ScriptPointer.sizeof] unknownC3CCA8;
shared static this() {
	unknownC3CCA8 = initializeScript!unknownC3CCA8(
		SET_Y_RELATIVE(-8),
		PAUSE(2),
		SET_Y_RELATIVE(8),
		PAUSE(2),
		SHORTJUMP("unknownC3CCA8"),
	);
}
/// $C3CCB5
immutable ubyte[225 + 15 * (const(void)*).sizeof + 1 * 3 * (const(void)*).sizeof / 2 + 1 * (const(void)*).sizeof * (const(void)*).sizeof / 2 + 18 * ScriptPointer.sizeof] actionScriptSwThrkA;
shared static this() {
	actionScriptSwThrkA = initializeScript!actionScriptSwThrkA(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_Y_RELATIVE(-128),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		START_TASK("unknownC3CEA2"),
		SET_ANIMATION(0),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(-512),
		SET_Y_VELOCITY(256),
		PAUSE(80),
		SET_Y_VELOCITY(0),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5472),
		SET_VAR(ActionScriptVars.v7, 9128),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTCALL("unknownC3CC24"),
		SET_VAR(ActionScriptVars.v6, 6128),
		SET_VAR(ActionScriptVars.v7, 8448),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6312),
		SET_VAR(ActionScriptVars.v7, 8600),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6392),
		SET_VAR(ActionScriptVars.v7, 8720),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6392),
		SET_VAR(ActionScriptVars.v7, 8856),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6312),
		SET_VAR(ActionScriptVars.v7, 8976),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6128),
		SET_VAR(ActionScriptVars.v7, 9128),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5472),
		SET_VAR(ActionScriptVars.v7, 9128),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTCALL("unknownC3CC24"),
		END_LAST_TASK(),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v6, 5680),
		SET_VAR(ActionScriptVars.v7, 8448),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(3),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v6, 5960),
		SET_VAR(ActionScriptVars.v7, 8488),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_Y_VELOCITY(-96),
		PAUSE(60),
		SET_VELOCITIES_ZERO(),
		PAUSE(30),
		LOOP(32),
			SET_Y_VELOCITY_RELATIVE(32),
			PAUSE(1),
		LOOP_END(),
		PAUSE(4),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v0, -8),
		C474A8(),
		SET_VAR(ActionScriptVars.v0, 4),
		SET_VAR(ActionScriptVars.v1, 0),
		SET_VAR(ActionScriptVars.v2, 2),
		SET_VAR(ActionScriptVars.v3, 3),
		LOAD_FULLSCREEN_ANIMATION(),
		SHORTCALL("unknownC33C1D"),
		SET_VAR(ActionScriptVars.v1, 0),
		SET_VAR(ActionScriptVars.v3, 6),
		SHORTCALL("unknownC33C1D"),
		SET_VAR(ActionScriptVars.v1, 0),
		SET_VAR(ActionScriptVars.v3, 9),
		SHORTCALL("unknownC33C1D"),
		SET_VAR(ActionScriptVars.v1, 0),
		SET_VAR(ActionScriptVars.v3, 14),
		SHORTCALL("unknownC33C1D"),
		PAUSE(60),
		PREPARE_NEW_ENTITY(748, 1067, Direction.down),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		WRITE_DWORD_WRAM(&postTeleportCallback, &restoreMapRendering),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3CDF0
immutable ubyte[132 + 7 * (const(void)*).sizeof + 13 * ScriptPointer.sizeof] actionScriptSwThrkShadowA;
shared static this() {
	actionScriptSwThrkShadowA = initializeScript!actionScriptSwThrkShadowA(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_ANIMATION(0),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(80),
		SET_VAR(ActionScriptVars.v6, 5472),
		SET_VAR(ActionScriptVars.v7, 9176),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTCALL("unknownC3CC5C"),
		SET_VAR(ActionScriptVars.v6, 6128),
		SET_VAR(ActionScriptVars.v7, 8496),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6312),
		SET_VAR(ActionScriptVars.v7, 8648),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6392),
		SET_VAR(ActionScriptVars.v7, 8768),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6392),
		SET_VAR(ActionScriptVars.v7, 8904),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6312),
		SET_VAR(ActionScriptVars.v7, 9024),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6128),
		SET_VAR(ActionScriptVars.v7, 9176),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5472),
		SET_VAR(ActionScriptVars.v7, 9176),
		SHORTCALL("actionScriptMoveToLocation"),
		SHORTCALL("unknownC3CC5C"),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v6, 5680),
		SET_VAR(ActionScriptVars.v7, 8496),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v6, 5960),
		SET_VAR(ActionScriptVars.v7, 8536),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(15),
		PAUSE(60),
		PAUSE(30),
		PAUSE(32),
		PAUSE(4),
		PAUSE(30),
		HALT(),
	);
}
/// $C3CEA2
immutable ubyte[18 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3CEA2;
shared static this() {
	unknownC3CEA2 = initializeScript!unknownC3CEA2(
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		SPAWN_ENTITY_AT_SELF(OverworldSprite.skyRunnerElectricThingies, ActionScript.animSwWinsShadowA),
		PAUSE(120),
		PAUSE(120),
		PAUSE(120),
		SHORTJUMP("unknownC3CEA2"),
	);
}
/// $C3CEB9
immutable ubyte[9 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3CEB9;
shared static this() {
	unknownC3CEB9 = initializeScript!unknownC3CEB9(
		MOVE_TO_SPRITE(OverworldSprite.skyRunner),
		SET_Y_RELATIVE(-40),
		PAUSE(1),
		SHORTJUMP("unknownC3CEB9"),
	);
}
/// $C3CEC7
immutable ubyte[28 + 5 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSwWinsShadowA;
shared static this() {
	actionScriptSwWinsShadowA = initializeScript!actionScriptSwWinsShadowA(
		MOVE_TO_SPRITE(OverworldSprite.skyRunner),
		SET_Y_RELATIVE(-40),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_VELOCITIES_ZERO(),
		START_TASK("unknownC3CEB9"),
		PLAY_SFX(Sfx.reflectDamage),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(8),
		SET_ANIMATION(255),
		PAUSE(2),
		SET_ANIMATION(0),
		PAUSE(30),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3CEF5
immutable ubyte[20 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptSwWinsLand;
shared static this() {
	actionScriptSwWinsLand = initializeScript!actionScriptSwWinsLand(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AB26"),
		SET_Z(200),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_Z_VELOCITY(-256),
		PAUSE(160),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3CF1B
immutable ubyte[22 + 3 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptSwWinsLand2;
shared static this() {
	actionScriptSwWinsLand2 = initializeScript!actionScriptSwWinsLand2(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AB26"),
		SET_Z(200),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_Z_VELOCITY(-256),
		PAUSE(100),
		SET_Z_VELOCITY(-128),
		PAUSE(200),
		SET_VELOCITIES_ZERO(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3CF3C
immutable ubyte[7 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptWinsSkywalkerShadow;
shared static this() {
	actionScriptWinsSkywalkerShadow = initializeScript!actionScriptWinsSkywalkerShadow(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AA38"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C3CF4B
immutable ubyte[19 + 8 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptOutSkywalker;
shared static this() {
	actionScriptOutSkywalker = initializeScript!actionScriptOutSkywalker(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(128),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		MOVE_IN_DIRECTION(),
		PAUSE(48),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3CF76
immutable ubyte[139 + 16 * (const(void)*).sizeof + 1 * 3 * (const(void)*).sizeof / 2 + 1 * (const(void)*).sizeof * (const(void)*).sizeof / 2 + 10 * ScriptPointer.sizeof] actionScriptSwSumsA;
shared static this() {
	actionScriptSwSumsA = initializeScript!actionScriptSwSumsA(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3DIgnoreSurface),
		SET_Z(192),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		SET_Z_VELOCITY(-256),
		PAUSE(128),
		SET_Z_VELOCITY(0),
		SET_VAR(ActionScriptVars.v6, 6056),
		SET_VAR(ActionScriptVars.v7, 3088),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(384),
		START_TASK("unknownC3CC94"),
		SET_VAR(ActionScriptVars.v6, 5368),
		SET_VAR(ActionScriptVars.v7, 3088),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SET_Z_VELOCITY(-48),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v6, 5056),
		SET_VAR(ActionScriptVars.v7, 3144),
		SHORTCALL("actionScriptMoveToLocation"),
		END_LAST_TASK(),
		SET_Z_VELOCITY(0),
		YIELD_TO_TEXT(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v0, -8),
		C474A8(),
		SET_VAR(ActionScriptVars.v0, 4),
		SET_VAR(ActionScriptVars.v1, 0),
		SET_VAR(ActionScriptVars.v2, 2),
		SET_VAR(ActionScriptVars.v3, 3),
		LOAD_FULLSCREEN_ANIMATION(),
		SHORTCALL("unknownC33C1D"),
		SET_VAR(ActionScriptVars.v1, 0),
		SET_VAR(ActionScriptVars.v3, 6),
		SHORTCALL("unknownC33C1D"),
		SET_VAR(ActionScriptVars.v1, 0),
		SET_VAR(ActionScriptVars.v3, 9),
		SHORTCALL("unknownC33C1D"),
		SET_VAR(ActionScriptVars.v1, 0),
		SET_VAR(ActionScriptVars.v3, 14),
		SHORTCALL("unknownC33C1D"),
		PREPARE_NEW_ENTITY(632, 393, Direction.down),
		FADE_OUT(1, 1),
		SHORTCALL("waitForFadeEnd"),
		WRITE_DWORD_WRAM(&postTeleportCallback, &restoreMapRendering),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3D04D
immutable ubyte[59 + 6 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptSwSumsShadowA;
shared static this() {
	actionScriptSwSumsShadowA = initializeScript!actionScriptSwSumsShadowA(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
		SHORTCALL("unknownC3AB26"),
		SET_Z(0),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(128),
		SET_VAR(ActionScriptVars.v6, 6056),
		SET_VAR(ActionScriptVars.v7, 3088),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v6, 5368),
		SET_VAR(ActionScriptVars.v7, 3088),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v6, 5056),
		SET_VAR(ActionScriptVars.v7, 3144),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(30),
		HALT(),
	);
}
/// $C3D0A4
immutable ubyte[21 + 4 * (const(void)*).sizeof] unknownC3D0A4;
shared static this() {
	unknownC3D0A4 = initializeScript!unknownC3D0A4(
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(5),
		SHORT_RETURN(),
	);
}
/// $C3D0C5
immutable ubyte[23 + 5 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptSwSplinter1;
shared static this() {
	actionScriptSwSplinter1 = initializeScript!actionScriptSwSplinter1(
		SET_X(5056),
		SET_Y(3144),
		SET_PRIORITY(3),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		WRITE_WORD_TEMPVAR(4),
		SET_VELOCITIES_ZERO(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
	LABEL("ENTRY2"),
		PAUSE(10),
		IS_ENTITY_ONSCREEN(),
		JUMP_IF_TRUE("actionScriptSwSplinter1.ENTRY2"),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3D0EE
immutable ubyte[19 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptSwSplinter2;
shared static this() {
	actionScriptSwSplinter2 = initializeScript!actionScriptSwSplinter2(
		SET_X(5088),
		SET_Y(3168),
		SET_PRIORITY(3),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		WRITE_WORD_TEMPVAR(6),
		SET_VELOCITIES_ZERO(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTJUMP("actionScriptSwSplinter1.ENTRY2"),
	);
}
/// $C3D10E
immutable ubyte[19 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptSwSplinter3;
shared static this() {
	actionScriptSwSplinter3 = initializeScript!actionScriptSwSplinter3(
		SET_X(5024),
		SET_Y(3152),
		SET_PRIORITY(3),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallbackOffset),
		WRITE_WORD_TEMPVAR(0),
		SET_VELOCITIES_ZERO(),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SHORTJUMP("actionScriptSwSplinter1.ENTRY2"),
	);
}
/// $C3D12E
immutable ubyte[28 + 5 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptOdorokiNesPola;
shared static this() {
	actionScriptOdorokiNesPola = initializeScript!actionScriptOdorokiNesPola(
		SET_X(6768),
		SET_Y(10064),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_VELOCITIES_ZERO(),
		WRITE_WORD_TEMPVAR(Direction.left),
		SET_DIRECTION(),
		PAUSE(1),
		SET_X_VELOCITY(-128),
		PAUSE(32),
		SET_VELOCITIES_ZERO(),
		PAUSE(40),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3D159
immutable ubyte[17 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptKurokogeJeff;
shared static this() {
	actionScriptKurokogeJeff = initializeScript!actionScriptKurokogeJeff(
		SET_X(6704),
		SET_Y(10064),
		SHORTCALL("unknownC3AA38"),
		SET_VAR(ActionScriptVars.v4, 1),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C3D172
immutable ubyte[20 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptJeffAddParty;
shared static this() {
	actionScriptJeffAddParty = initializeScript!actionScriptJeffAddParty(
		SHORTCALL("unknownC3AA38"),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PAUSE(1),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 17),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v4, 1),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3D196
immutable ubyte[30 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptGorgeousChaous;
shared static this() {
	actionScriptGorgeousChaous = initializeScript!actionScriptGorgeousChaous(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 17),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PREPARE_NEW_ENTITY_AT_PARTY_LEADER(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2235),
		SET_VAR(ActionScriptVars.v7, 6560),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3D1C9
immutable ubyte[24 + 7 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptToGorgeousChaous;
shared static this() {
	actionScriptToGorgeousChaous = initializeScript!actionScriptToGorgeousChaous(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(320),
		SET_VAR(ActionScriptVars.v5, 17),
		SET_NPC_DESTINATION(NPCID.unknown0320),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		SET_NPC_DESTINATION(NPCID.unknown0320),
		MOVE_TOWARDS_DESTINATION(),
		SHORTJUMP("actionScriptToGorgeousChaous.UNKNOWN0"),
	);
}
/// $C3D1F8
immutable ubyte[24 + 6 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptTonzuraBusChaous;
shared static this() {
	actionScriptTonzuraBusChaous = initializeScript!actionScriptTonzuraBusChaous(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		START_TASK("actionScriptMapObjStillEntry2"),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS_OFFSET(0, 8),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 8),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_RIDE_TONZURABUS_CHAOUS"),
		PREPARE_NEW_ENTITY_AT_PARTY_LEADER(),
		HALT(),
	);
}
/// $C3D229
immutable ubyte[22 + 4 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptIntoTonzuraBusChaous;
shared static this() {
	actionScriptIntoTonzuraBusChaous = initializeScript!actionScriptIntoTonzuraBusChaous(
		SET_MOVEMENT_SPEED(128),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_NPC_DESTINATION(NPCID.unknown0373),
		ADD(ActionScriptVars.v7, 8),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_NPC_DESTINATION(NPCID.unknown0373),
		SHORTCALL("unknownC3B70C"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3D251
immutable ubyte[14 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptGorgeousChaousRide;
shared static this() {
	actionScriptGorgeousChaousRide = initializeScript!actionScriptGorgeousChaousRide(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_NPC_DESTINATION(NPCID.unknown0373),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3D26E
immutable ubyte[95 + 6 * (const(void)*).sizeof + 2 * string.sizeof + 8 * ScriptPointer.sizeof] actionScriptTonzuraBusToThrk;
shared static this() {
	actionScriptTonzuraBusToThrk = initializeScript!actionScriptTonzuraBusToThrk(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		LOOP(10),
			SET_Y_RELATIVE(-1),
			PAUSE(3),
			SET_Y_RELATIVE(1),
			PAUSE(3),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v6, 2288),
		SET_VAR(ActionScriptVars.v7, 6568),
		SHORTCALL("actionScriptMoveToLocationBackwards"),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		SET_VAR(ActionScriptVars.v6, 2352),
		SET_VAR(ActionScriptVars.v7, 6568),
		SHORTCALL("actionScriptMoveToLocationBackwards"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TONZURABUS_CHAOUS"),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v6, 2280),
		SET_VAR(ActionScriptVars.v7, 6600),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1720),
		SET_VAR(ActionScriptVars.v7, 7160),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2200),
		SET_VAR(ActionScriptVars.v7, 7160),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 632),
		SET_VAR(ActionScriptVars.v7, 8728),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 1256),
		SET_VAR(ActionScriptVars.v7, 8728),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_TWSN_TUNNEL),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TBUS_TO_THRK_TUNNEL"),
		HALT(),
	);
}
/// $C3D2F7
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptTBusToThrkTunnel;
shared static this() {
	actionScriptTBusToThrkTunnel = initializeScript!actionScriptTBusToThrkTunnel(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 7888),
		SET_VAR(ActionScriptVars.v7, 10208),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_TUNNEL_THRK_R),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TBUS_INTO_THRK"),
		HALT(),
	);
}
/// $C3D31D
immutable ubyte[79 + 8 * (const(void)*).sizeof + 1 * string.sizeof + 7 * ScriptPointer.sizeof] actionScriptTBusIntoThrk;
shared static this() {
	actionScriptTBusIntoThrk = initializeScript!actionScriptTBusIntoThrk(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 4944),
		SET_VAR(ActionScriptVars.v7, 9432),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5008),
		SET_VAR(ActionScriptVars.v7, 9368),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5376),
		SET_VAR(ActionScriptVars.v7, 9368),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 5504),
		SET_VAR(ActionScriptVars.v7, 9368),
		SHORTCALL("actionScriptMoveToLocation"),
		MOVE_PARTY_TO_LEADER_POSITION(),
		PREPARE_NEW_ENTITY_AT_SELF(),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TBUS_TOUCH_THRK"),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG12D),
		PAUSE(1),
		LOOP(10),
			SET_Y_RELATIVE(-1),
			PAUSE(3),
			SET_Y_RELATIVE(1),
			PAUSE(3),
		LOOP_END(),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(120),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3D395
immutable ubyte[30 + 5 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptGorgeousMono;
shared static this() {
	actionScriptGorgeousMono = initializeScript!actionScriptGorgeousMono(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 17),
		GET_POSITION_OF_PARTY_MEMBER(255),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		PREPARE_NEW_ENTITY_AT_PARTY_LEADER(),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 3496),
		SET_VAR(ActionScriptVars.v7, 4128),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3D3C8
immutable ubyte[27 + 8 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScript188;
shared static this() {
	actionScript188 = initializeScript!actionScript188(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 17),
		SET_NPC_DESTINATION(NPCID.unknown0960),
		SET_MOVEMENT_SPEED(256),
		SHORTCALL("actionScriptTakeStepTowardsDestination"),
	LABEL("UNKNOWN0"),
		PAUSE(1),
		SET_VELOCITIES_ZERO(),
		SET_NPC_DESTINATION(NPCID.unknown0960),
		MOVE_TOWARDS_DESTINATION(),
		SHORTJUMP("actionScript188.UNKNOWN0"),
	);
}
/// $C3D3FD
immutable ubyte[18 + 6 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTBusRideMono;
shared static this() {
	actionScriptTBusRideMono = initializeScript!actionScriptTBusRideMono(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(255),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_NPC_DESTINATION(NPCID.unknown0994),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_PARTY_LEADER(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3D423
immutable ubyte[24 + 6 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScript190;
shared static this() {
	actionScript190 = initializeScript!actionScript190(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		START_TASK("actionScriptMapObjStillEntry2"),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS_OFFSET(0, 8),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 16),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_RIDE_TONZURABUS_MONO"),
		PREPARE_NEW_ENTITY_AT_PARTY_LEADER(),
		HALT(),
	);
}
/// $C3D454
immutable ubyte[6 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptIntoTonzuraBusMono;
shared static this() {
	actionScriptIntoTonzuraBusMono = initializeScript!actionScriptIntoTonzuraBusMono(
		SET_NPC_DESTINATION(NPCID.unknown0994),
		SHORTCALL("unknownC3B70C"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3D464
immutable ubyte[19 + 3 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] actionScriptGorgeousMonoRide;
shared static this() {
	actionScriptGorgeousMonoRide = initializeScript!actionScriptGorgeousMonoRide(
		SHORTCALL("unknownC3AA38"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_NPC_DESTINATION(NPCID.unknown0994),
		ADD(ActionScriptVars.v7, -1),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3D486
immutable ubyte[45 + 4 * (const(void)*).sizeof + 1 * string.sizeof + 3 * ScriptPointer.sizeof] actionScriptTBusToFourTunnel;
shared static this() {
	actionScriptTBusToFourTunnel = initializeScript!actionScriptTBusToFourTunnel(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureLowerBody),
		LOOP(10),
			SET_Y_RELATIVE(-1),
			PAUSE(3),
			SET_Y_RELATIVE(1),
			PAUSE(3),
		LOOP_END(),
		SET_VAR(ActionScriptVars.v6, 2584),
		SET_VAR(ActionScriptVars.v7, 5080),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2280),
		SET_VAR(ActionScriptVars.v7, 5080),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_FOUR_TUNNEL),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TBUS_FOUR_TUNNEL"),
		HALT(),
	);
}
/// $C3D4C9
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptTBusFourTunnel;
shared static this() {
	actionScriptTBusFourTunnel = initializeScript!actionScriptTBusFourTunnel(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(768),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 5688),
		SET_VAR(ActionScriptVars.v7, 3400),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_TUNNEL_BRDG_L),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TBUS_TUNNEL_BRDG"),
		HALT(),
	);
}
/// $C3D4EF
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptTBusTunnelBrdg;
shared static this() {
	actionScriptTBusTunnelBrdg = initializeScript!actionScriptTBusTunnelBrdg(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(768),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 4544),
		SET_VAR(ActionScriptVars.v7, 10008),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_BRDG_TUNNEL_L),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TBUS_BRDG_TUNNEL"),
		HALT(),
	);
}
/// $C3D515
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptTBusBrdgTunnel;
shared static this() {
	actionScriptTBusBrdgTunnel = initializeScript!actionScriptTBusBrdgTunnel(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(768),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 7736),
		SET_VAR(ActionScriptVars.v7, 8648),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_TUNNEL_DSRT_L),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TBUS_TUNNEL_DSRT"),
		HALT(),
	);
}
/// $C3D53B
immutable ubyte[23 + 4 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptTBusTunnelDsrt;
shared static this() {
	actionScriptTBusTunnelDsrt = initializeScript!actionScriptTBusTunnelDsrt(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_MOVEMENT_SPEED(1024),
		SET_VAR(ActionScriptVars.v5, 4),
		SET_VAR(ActionScriptVars.v6, 440),
		SET_VAR(ActionScriptVars.v7, 10008),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_DSRT_TUNNEL_L),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TBUS_DSRT_TUNNEL"),
		HALT(),
	);
}
/// $C3D566
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptTBusDsrtTunnel;
shared static this() {
	actionScriptTBusDsrtTunnel = initializeScript!actionScriptTBusDsrtTunnel(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(768),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 6200),
		SET_VAR(ActionScriptVars.v7, 72),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_TUNNEL_HWAY_L),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TBUS_TUNNEL_HWAY_L"),
		HALT(),
	);
}
/// $C3D5B2
immutable ubyte[19 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptBusHwayTunnelL;
shared static this() {
	actionScriptBusHwayTunnelL = initializeScript!actionScriptBusHwayTunnelL(
		SHORTCALL("unknownC3DBDB"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 4416),
		SET_VAR(ActionScriptVars.v7, 10184),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3D5C8
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptTBusTunnelHwayL;
shared static this() {
	actionScriptTBusTunnelHwayL = initializeScript!actionScriptTBusTunnelHwayL(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(768),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 2584),
		SET_VAR(ActionScriptVars.v7, 7688),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_HWAY_TUNNEL_L),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TBUS_HWAY_TUNNEL_L"),
		HALT(),
	);
}
/// $C3D5D8
immutable ubyte[103 + 11 * (const(void)*).sizeof + 1 * string.sizeof + 8 * ScriptPointer.sizeof] actionScriptTBusTunnelThrkL;
shared static this() {
	actionScriptTBusTunnelThrkL = initializeScript!actionScriptTBusTunnelThrkL(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureLowerBody),
		SET_VAR(ActionScriptVars.v6, 5896),
		SET_VAR(ActionScriptVars.v7, 9416),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5952),
		SET_VAR(ActionScriptVars.v7, 9352),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5472),
		SET_VAR(ActionScriptVars.v7, 9352),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5416),
		SET_VAR(ActionScriptVars.v7, 9416),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_DIRECTION8(Direction.left),
		PAUSE(1),
		MOVE_PARTY_TO_LEADER_POSITION(),
		PREPARE_NEW_ENTITY_AT_SELF(),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TBUS_TOUCH_THRK_L"),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG12D),
		PAUSE(1),
		LOOP(10),
			SET_Y_RELATIVE(-1),
			PAUSE(3),
			SET_Y_RELATIVE(1),
			PAUSE(3),
		LOOP_END(),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5464),
		SET_VAR(ActionScriptVars.v7, 9368),
		SHORTCALL("actionScriptMoveToLocationBackwards"),
		PAUSE(30),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(140),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3D673
immutable ubyte[54 + 11 * (const(void)*).sizeof + 1 * string.sizeof + 5 * ScriptPointer.sizeof] actionScriptBusThrkTwsnIn;
shared static this() {
	actionScriptBusThrkTwsnIn = initializeScript!actionScriptBusThrkTwsnIn(
		SET_X(5744),
		SET_Y(9000),
		SET_PHYSICS_CALLBACK(&unknownC0A384),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5552),
		SET_VAR(ActionScriptVars.v7, 9000),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		START_TASK("unknownC3B431"),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS_OFFSET(0, 8),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 8),
	LABEL("UNKNOWN0"),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_RIDE_BUS_THRK_TWSN"),
		PREPARE_NEW_ENTITY_AT_PARTY_LEADER(),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		SHORTJUMP("actionScriptBusThrkTwsnIn.UNKNOWN0"),
	);
}
/// $C3D6D6
immutable ubyte[61 + 5 * (const(void)*).sizeof + 1 * string.sizeof + 6 * ScriptPointer.sizeof] actionScriptBusToThrkTunnel;
shared static this() {
	actionScriptBusToThrkTunnel = initializeScript!actionScriptBusToThrkTunnel(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 5392),
		SET_VAR(ActionScriptVars.v7, 9000),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_VAR(ActionScriptVars.v6, 5312),
		SET_VAR(ActionScriptVars.v7, 9040),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 4952),
		SET_VAR(ActionScriptVars.v7, 9400),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureLowerBody),
		SET_VAR(ActionScriptVars.v6, 4904),
		SET_VAR(ActionScriptVars.v7, 9416),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 4528),
		SET_VAR(ActionScriptVars.v7, 9416),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_THRK_TUNNEL_L),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_THRK_TUNNEL"),
		HALT(),
	);
}
/// $C3D732
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptBusThrkTunnel;
shared static this() {
	actionScriptBusThrkTunnel = initializeScript!actionScriptBusThrkTunnel(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 5944),
		SET_VAR(ActionScriptVars.v7, 10184),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_TUNNEL_TWSN),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_TUNNEL_TWSN"),
		HALT(),
	);
}
/// $C3D758
immutable ubyte[93 + 8 * (const(void)*).sizeof + 1 * string.sizeof + 9 * ScriptPointer.sizeof] actionScriptBusTunnelTwsn;
shared static this() {
	actionScriptBusTunnelTwsn = initializeScript!actionScriptBusTunnelTwsn(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 688),
		SET_VAR(ActionScriptVars.v7, 8712),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 688),
		SET_VAR(ActionScriptVars.v7, 8704),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2152),
		SET_VAR(ActionScriptVars.v7, 7232),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(384),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 2248),
		SET_VAR(ActionScriptVars.v7, 7144),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2160),
		SET_VAR(ActionScriptVars.v7, 7144),
		SHORTCALL("actionScriptMoveToLocation"),
		PAUSE(60),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 2464),
		SET_VAR(ActionScriptVars.v7, 7144),
		SHORTCALL("actionScriptMoveToLocationBackwards"),
		MOVE_PARTY_TO_LEADER_POSITION(),
		PREPARE_NEW_ENTITY_AT_SELF(),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_TOUCH_TWSN"),
		CLEAR_TICK_CALLBACK(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG12D),
		PAUSE(1),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(200),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3D7E2
immutable ubyte[51 + 9 * (const(void)*).sizeof + 1 * string.sizeof + 5 * ScriptPointer.sizeof] actionScriptBusThrkDsrtIn;
shared static this() {
	actionScriptBusThrkDsrtIn = initializeScript!actionScriptBusThrkDsrtIn(
		SET_X(5272),
		SET_Y(9016),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 5464),
		SET_VAR(ActionScriptVars.v7, 9016),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		START_TASK("unknownC3B431"),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS_OFFSET(0, 8),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 8),
	LABEL("UNKNOWN0"),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_RIDE_BUS_THRK_DSRT"),
		PREPARE_NEW_ENTITY_AT_PARTY_LEADER(),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		SHORTJUMP("actionScriptBusThrkDsrtIn.UNKNOWN0"),
	);
}
/// $C3D83C
immutable ubyte[61 + 5 * (const(void)*).sizeof + 1 * string.sizeof + 6 * ScriptPointer.sizeof] actionScriptBusThrkToDsrt;
shared static this() {
	actionScriptBusThrkToDsrt = initializeScript!actionScriptBusThrkToDsrt(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 6248),
		SET_VAR(ActionScriptVars.v7, 9016),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6248),
		SET_VAR(ActionScriptVars.v7, 9032),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_VAR(ActionScriptVars.v6, 5880),
		SET_VAR(ActionScriptVars.v7, 9400),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 5888),
		SET_VAR(ActionScriptVars.v7, 9432),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		SET_VAR(ActionScriptVars.v6, 6488),
		SET_VAR(ActionScriptVars.v7, 9432),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_THRK_TUNNEL_R),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_THRK_TUNNEL_R"),
		HALT(),
	);
}
/// $C3D898
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptBusThrkTunnelR;
shared static this() {
	actionScriptBusThrkTunnelR = initializeScript!actionScriptBusThrkTunnelR(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 5584),
		SET_VAR(ActionScriptVars.v7, 10208),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_TUNNEL_HWAY_R),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_TUNNEL_HWAY_R"),
		HALT(),
	);
}
/// $C3D8BE
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptBusTunnelHwayR;
shared static this() {
	actionScriptBusTunnelHwayR = initializeScript!actionScriptBusTunnelHwayR(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 3112),
		SET_VAR(ActionScriptVars.v7, 7704),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_HWAY_TUNNEL_R),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_HWAY_TUNNEL_R"),
		HALT(),
	);
}
/// $C3D8E4
immutable ubyte[25 + 4 * (const(void)*).sizeof + 1 * string.sizeof + 3 * ScriptPointer.sizeof] actionScriptBusHwayTunnelR;
shared static this() {
	actionScriptBusHwayTunnelR = initializeScript!actionScriptBusHwayTunnelR(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 6864),
		SET_VAR(ActionScriptVars.v7, 96),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_TUNNEL_DSRT_R),
		GET_EVENT_FLAG(EventFlag.dsrtClear),
		JUMP_IF_TRUE("unknownC3D913"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_TUNNEL_DSRT_R_JYUUTAI"),
		HALT(),
	);
}
/// $C3D913
immutable ubyte[2 + 1 * (const(void)*).sizeof + 1 * string.sizeof] unknownC3D913;
shared static this() {
	unknownC3D913 = initializeScript!unknownC3D913(
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_TUNNEL_DSRT_R"),
		HALT(),
	);
}
/// $C3D91C
immutable ubyte[47 + 6 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptBusTunnelDsrtR;
shared static this() {
	actionScriptBusTunnelDsrtR = initializeScript!actionScriptBusTunnelDsrtR(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 1320),
		SET_VAR(ActionScriptVars.v7, 10032),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1536),
		SET_VAR(ActionScriptVars.v7, 10032),
		SHORTCALL("actionScriptMoveToLocation"),
		MOVE_PARTY_TO_LEADER_POSITION(),
		CLEAR_TICK_CALLBACK(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG12D),
		YIELD_TO_TEXT(),
		PAUSE(1),
		WRITE_WORD_TEMPVAR(Direction.right),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(112),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3D966
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptBusDsrtToFour;
shared static this() {
	actionScriptBusDsrtToFour = initializeScript!actionScriptBusDsrtToFour(
		SHORTCALL("unknownC3DBDB"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 4168),
		SET_VAR(ActionScriptVars.v7, 10032),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_DSRT_TUNNEL_R),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_DSRT_TUNNEL_R"),
		HALT(),
	);
}
/// $C3D98C
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptBusDsrtTunnelR;
shared static this() {
	actionScriptBusDsrtTunnelR = initializeScript!actionScriptBusDsrtTunnelR(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 8128),
		SET_VAR(ActionScriptVars.v7, 8672),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_TUNNEL_BRDG_R),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_TUNNEL_BRDG_R"),
		HALT(),
	);
}
/// $C3D9B2
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptBusTunnelBrdgR;
shared static this() {
	actionScriptBusTunnelBrdgR = initializeScript!actionScriptBusTunnelBrdgR(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 5696),
		SET_VAR(ActionScriptVars.v7, 10032),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_BRDG_TUNNEL_R),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_BRDG_TUNNEL_R"),
		HALT(),
	);
}
/// $C3D9D8
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptBusBrdgTunnelR;
shared static this() {
	actionScriptBusBrdgTunnelR = initializeScript!actionScriptBusBrdgTunnelR(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 6320),
		SET_VAR(ActionScriptVars.v7, 3424),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_TUNNEL_FOUR),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_TUNNEL_FOUR"),
		HALT(),
	);
}
/// $C3D9FE
immutable ubyte[44 + 6 * (const(void)*).sizeof + 1 * string.sizeof + 5 * ScriptPointer.sizeof] actionScriptBusTunnelFour;
shared static this() {
	actionScriptBusTunnelFour = initializeScript!actionScriptBusTunnelFour(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 2488),
		SET_VAR(ActionScriptVars.v7, 5104),
		SHORTCALL("actionScriptMoveToLocation"),
		MOVE_PARTY_TO_LEADER_POSITION(),
		PREPARE_NEW_ENTITY_AT_SELF(),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_TOUCH_FOUR"),
		CLEAR_TICK_CALLBACK(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG12D),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v6, 2576),
		SET_VAR(ActionScriptVars.v7, 5104),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2664),
		SET_VAR(ActionScriptVars.v7, 5040),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3DA49
immutable ubyte[41 + 10 * (const(void)*).sizeof + 1 * string.sizeof + 3 * ScriptPointer.sizeof] actionScriptBusTunnelDsrtRJ;
shared static this() {
	actionScriptBusTunnelDsrtRJ = initializeScript!actionScriptBusTunnelDsrtRJ(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 1784),
		SET_VAR(ActionScriptVars.v7, 10032),
		SHORTCALL("actionScriptMoveToLocation"),
		MOVE_PARTY_TO_LEADER_POSITION(),
		PREPARE_NEW_ENTITY_AT_SELF(),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_TOUCH_DSRT"),
		CLEAR_TICK_CALLBACK(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG12D),
		PAUSE(1),
		SET_VAR(ActionScriptVars.v6, 1608),
		SET_VAR(ActionScriptVars.v7, 10032),
		SHORTCALL("actionScriptMoveToLocationBackwards"),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3DA97
immutable ubyte[55 + 10 * (const(void)*).sizeof + 1 * string.sizeof + 5 * ScriptPointer.sizeof] actionScriptBusDsrtThrkIn;
shared static this() {
	actionScriptBusDsrtThrkIn = initializeScript!actionScriptBusDsrtThrkIn(
		SET_X(1792),
		SET_Y(10008),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		PAUSE(1),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 1600),
		SET_VAR(ActionScriptVars.v7, 10008),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		START_TASK("unknownC3B431"),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS_OFFSET(0, 8),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 8),
	LABEL("UNKNOWN0"),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_RIDE_BUS_DSRT_THRK"),
		PREPARE_NEW_ENTITY_AT_PARTY_LEADER(),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		SHORTJUMP("actionScriptBusDsrtThrkIn.UNKNOWN0"),
	);
}
/// $C3DAF8
immutable ubyte[19 + 2 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptBusDsrtToThrk;
shared static this() {
	actionScriptBusDsrtToThrk = initializeScript!actionScriptBusDsrtToThrk(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 432),
		SET_VAR(ActionScriptVars.v7, 10008),
		SHORTCALL("actionScriptMoveToLocation"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_TUNNEL_HWAY_L"),
		HALT(),
	);
}
/// $C3DB19
immutable ubyte[55 + 10 * (const(void)*).sizeof + 1 * string.sizeof + 5 * ScriptPointer.sizeof] actionScriptBusDsrtFourIn;
shared static this() {
	actionScriptBusDsrtFourIn = initializeScript!actionScriptBusDsrtFourIn(
		SET_X(1240),
		SET_Y(10032),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		PAUSE(1),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 1432),
		SET_VAR(ActionScriptVars.v7, 10032),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		START_TASK("unknownC3B431"),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS_OFFSET(0, 8),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 8),
	LABEL("UNKNOWN0"),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_RIDE_BUS_DSRT_FOUR"),
		PREPARE_NEW_ENTITY_AT_PARTY_LEADER(),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		SHORTJUMP("actionScriptBusDsrtFourIn.UNKNOWN0"),
	);
}
/// $C3DB7A
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] unknownC3DB7A;
shared static this() {
	unknownC3DB7A = initializeScript!unknownC3DB7A(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 4168),
		SET_VAR(ActionScriptVars.v7, 10032),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_TUNNEL_BRDG_R),
		QUEUE_TEXT_SCRIPT("MSG_EVT_BUS_TUNNEL_BRDG_R"),
		HALT(),
	);
}
/// $C3DBA0
immutable ubyte[10 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptBusDriverL;
shared static this() {
	actionScriptBusDriverL = initializeScript!actionScriptBusDriverL(
		MOVE_TO_SPRITE(OverworldSprite.cityBus),
		SET_X_RELATIVE(-16),
		SET_Y_RELATIVE(-16),
		//fallthrough
		SHORTJUMP("actionScriptBusDriverR"),
	);
}
/// $C3DBAC
immutable ubyte[15 + 6 * (const(void)*).sizeof] actionScriptBusDriverCommon;
shared static this() {
	actionScriptBusDriverCommon = initializeScript!actionScriptBusDriverCommon(
		SET_PRIORITY(0),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_VELOCITIES_ZERO(),
		SET_TICK_CALLBACK(&makePartyLookAtActiveEntity),
		WRITE_WORD_TEMPVAR(Direction.down),
		SET_DIRECTION(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		HALT(),
	);
}
/// $C3DBCC
immutable ubyte[10 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptBusDriverR;
shared static this() {
	actionScriptBusDriverR = initializeScript!actionScriptBusDriverR(
		MOVE_TO_SPRITE(OverworldSprite.cityBus),
		SET_X_RELATIVE(16),
		SET_Y_RELATIVE(-16),
		SHORTJUMP("actionScriptBusDriverCommon"),
	);
}
/// $C3DBDB
immutable ubyte[10 + 5 * (const(void)*).sizeof] unknownC3DBDB;
shared static this() {
	unknownC3DBDB = initializeScript!unknownC3DBDB(
		MOVE_TO_PARTY_MEMBER(PartyMember.leader),
	LABEL("ENTRY2"),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_ANIMATION(0),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		SET_TICK_CALLBACK(&actionScriptSimpleScreenPositionCallback),
		SHORT_RETURN(),
	);
}
/// $C3DBF2
immutable ubyte[60 + 9 * (const(void)*).sizeof + 1 * string.sizeof + 6 * ScriptPointer.sizeof] actionScriptBusFourThrkIn;
shared static this() {
	actionScriptBusFourThrkIn = initializeScript!actionScriptBusFourThrkIn(
		SET_X(2656),
		SET_Y(5008),
		SET_PHYSICS_CALLBACK(&actionScriptUpdatePositionAndCollision),
		SET_ANIMATION(0),
		SET_MOVEMENT_SPEED(256),
		SET_VAR(ActionScriptVars.v5, 1),
		SET_VAR(ActionScriptVars.v6, 2584),
		SET_VAR(ActionScriptVars.v7, 5080),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 2528),
		SET_VAR(ActionScriptVars.v7, 5080),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		START_TASK("unknownC3B431"),
		UPDATE_SURFACE_FLAGS(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		COPY_XY_TO_VARS_OFFSET(0, 8),
		SET_VAR(ActionScriptVars.v2, 24),
		SET_VAR(ActionScriptVars.v3, 8),
	LABEL("UNKNOWN0"),
		SHORTCALL("actionScriptWaitForLeaderApproach"),
		QUEUE_TEXT_SCRIPT("MSG_EVT_RIDE_BUS_FOUR_DSRT"),
		PREPARE_NEW_ENTITY_AT_PARTY_LEADER(),
		SHORTCALL("actionScriptWaitForLeaderToLeaveArea"),
		SHORTJUMP("actionScriptBusFourThrkIn.UNKNOWN0"),
	);
}
/// $C3DC57
immutable ubyte[19 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptBusFourThrkGo;
shared static this() {
	actionScriptBusFourThrkGo = initializeScript!actionScriptBusFourThrkGo(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 2280),
		SET_VAR(ActionScriptVars.v7, 5080),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3DC74
immutable ubyte[19 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptBusFourTunnel;
shared static this() {
	actionScriptBusFourTunnel = initializeScript!actionScriptBusFourTunnel(
		SHORTCALL("unknownC3DBDB"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 5696),
		SET_VAR(ActionScriptVars.v7, 3400),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3DC91
immutable ubyte[19 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptBusTunnelBrdgL;
shared static this() {
	actionScriptBusTunnelBrdgL = initializeScript!actionScriptBusTunnelBrdgL(
		SHORTCALL("unknownC3DBDB"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 4544),
		SET_VAR(ActionScriptVars.v7, 10008),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3DCAE
immutable ubyte[19 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptBusBrdgTunnelL;
shared static this() {
	actionScriptBusBrdgTunnelL = initializeScript!actionScriptBusBrdgTunnelL(
		SHORTCALL("unknownC3DBDB"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 7736),
		SET_VAR(ActionScriptVars.v7, 8648),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3DCCB
immutable ubyte[47 + 6 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] actionScriptBusTunnelDsrtL;
shared static this() {
	actionScriptBusTunnelDsrtL = initializeScript!actionScriptBusTunnelDsrtL(
		SHORTCALL("unknownC3DBDB"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 1664),
		SET_VAR(ActionScriptVars.v7, 10008),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_MOVEMENT_SPEED(512),
		SET_VAR(ActionScriptVars.v5, 2),
		SET_VAR(ActionScriptVars.v6, 1512),
		SET_VAR(ActionScriptVars.v7, 10008),
		SHORTCALL("actionScriptMoveToLocation"),
		MOVE_PARTY_TO_LEADER_POSITION(),
		CLEAR_TICK_CALLBACK(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG12D),
		YIELD_TO_TEXT(),
		PAUSE(1),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(80),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3DD15
immutable ubyte[19 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptBusDsrtTunnelL;
shared static this() {
	actionScriptBusDsrtTunnelL = initializeScript!actionScriptBusDsrtTunnelL(
		SHORTCALL("unknownC3DBDB"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 6200),
		SET_VAR(ActionScriptVars.v7, 72),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3DD32
immutable ubyte[19 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptBusTunnelHwayL;
shared static this() {
	actionScriptBusTunnelHwayL = initializeScript!actionScriptBusTunnelHwayL(
		SHORTCALL("unknownC3DBDB"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 2584),
		SET_VAR(ActionScriptVars.v7, 7688),
		SHORTCALL("actionScriptMoveToLocation"),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3DD4F
immutable ubyte[21 + 3 * (const(void)*).sizeof + 1 * string.sizeof + 2 * ScriptPointer.sizeof] actionScriptTBusHwayTunnelL;
shared static this() {
	actionScriptTBusHwayTunnelL = initializeScript!actionScriptTBusHwayTunnelL(
		SHORTCALL("unknownC3DBDB.ENTRY2"),
		SET_MOVEMENT_SPEED(768),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_VAR(ActionScriptVars.v6, 4416),
		SET_VAR(ActionScriptVars.v7, 10184),
		SHORTCALL("actionScriptMoveToLocation"),
		PREPARE_NEW_ENTITY_AT_WARP_PRESET(WarpPreset.BUS_TUNNEL_THRK_L),
		QUEUE_TEXT_SCRIPT("MSG_EVT_TBUS_TUNNEL_THRK_L"),
		HALT(),
	);
}
/// $C3DD6C
immutable ubyte[97 + 11 * (const(void)*).sizeof + 10 * ScriptPointer.sizeof] actionScriptBusTunnelThrkL;
shared static this() {
	actionScriptBusTunnelThrkL = initializeScript!actionScriptBusTunnelThrkL(
		SHORTCALL("unknownC3DBDB"),
		SET_MOVEMENT_SPEED(640),
		SET_VAR(ActionScriptVars.v5, 3),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureLowerBody),
		SET_VAR(ActionScriptVars.v6, 5896),
		SET_VAR(ActionScriptVars.v7, 9416),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_VAR(ActionScriptVars.v6, 6304),
		SET_VAR(ActionScriptVars.v7, 9000),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_VAR(ActionScriptVars.v6, 6168),
		SET_VAR(ActionScriptVars.v7, 9000),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		SET_VAR(ActionScriptVars.v6, 6048),
		SET_VAR(ActionScriptVars.v7, 9000),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_SURFACE_FLAGS(SurfaceFlags.none),
		SET_VAR(ActionScriptVars.v6, 5832),
		SET_VAR(ActionScriptVars.v7, 9000),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureLowerBody),
		SET_VAR(ActionScriptVars.v6, 5704),
		SET_VAR(ActionScriptVars.v7, 9000),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_SURFACE_FLAGS(SurfaceFlags.obscureUpperBody | SurfaceFlags.obscureLowerBody),
		SET_VAR(ActionScriptVars.v6, 5480),
		SET_VAR(ActionScriptVars.v7, 9000),
		SHORTCALL("actionScriptMoveToLocation"),
		MOVE_PARTY_TO_LEADER_POSITION(),
		CLEAR_TICK_CALLBACK(),
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG12D),
		YIELD_TO_TEXT(),
		PAUSE(1),
		WRITE_WORD_TEMPVAR(Direction.left),
		SHORTCALL("actionScriptMoveInDirection"),
		PAUSE(80),
		YIELD_TO_TEXT(),
		SHORTJUMP("actionScriptTerminate"),
	);
}
/// $C3DE01
immutable ubyte[28 + 2 * (const(void)*).sizeof + 11 * ScriptPointer.sizeof] actionScriptMagicButterfly;
shared static this() {
	actionScriptMagicButterfly = initializeScript!actionScriptMagicButterfly(
		SHORTCALL("actionScriptEnemyInitialize"),
		IS_COLLISION_ENABLED(),
		JUMP_IF_TRUE("actionScriptDeleteEnemy"),
		SET_VAR(ActionScriptVars.v1, 0),
		START_TASK("actionScriptMagicButterflyTask3"),
		START_TASK("actionScriptMagicButterflyTask1"),
		START_TASK("actionScriptMagicButterflyTask2"),
	LABEL("UNKNOWN0"),
		PAUSE(10),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
		SWITCH_JUMP_TEMPVAR("actionScriptMagicButterfly.UNKNOWN1", "actionScriptMagicButterfly.UNKNOWN1", "actionScriptMagicButterfly.UNKNOWN0"),
	LABEL("UNKNOWN1"),
		GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY(),
		JUMP_IF_FALSE("actionScriptMagicButterfly.UNKNOWN2"),
		SET_VAR(ActionScriptVars.v1, 0),
		SHORTJUMP("actionScriptMagicButterfly.UNKNOWN0"),
	LABEL("UNKNOWN2"),
		SET_VAR(ActionScriptVars.v1, 1),
		SHORTJUMP("actionScriptMagicButterfly.UNKNOWN0"),
	);
}
/// $C3DE39
immutable ubyte[46 + 7 * (const(void)*).sizeof + 16 * ScriptPointer.sizeof] actionScriptMagicButterflyTask1;
shared static this() {
	actionScriptMagicButterflyTask1 = initializeScript!actionScriptMagicButterflyTask1(
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
		SWITCH_JUMP_TEMPVAR("actionScriptMagicButterflyTask1.UNKNOWN0", "actionScriptMagicButterflyTask1.UNKNOWN4", "actionScriptMagicButterflyTask1.UNKNOWN5"),
	LABEL("UNKNOWN0"),
		CHOOSE_RANDOM(0, 1),
		JUMP_IF_TRUE("actionScriptMagicButterflyTask1.UNKNOWN2"),
	LABEL("UNKNOWN1"),
		SET_DIRECTION8(Direction.left),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(-256),
		SHORTJUMP("actionScriptMagicButterflyTask1.UNKNOWN3"),
	LABEL("UNKNOWN2"),
		SET_DIRECTION8(Direction.right),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(256),
	LABEL("UNKNOWN3"),
		CHOOSE_RANDOM(30, 60, 90, 120),
		WRITE_TEMPVAR_WAITTIMER(),
		SHORTJUMP("actionScriptMagicButterflyTask1"),
	LABEL("UNKNOWN4"),
		GET_DIRECTION_FROM_PLAYER_TO_ENTITY(),
		SWITCH_JUMP_TEMPVAR("actionScriptMagicButterflyTask1.UNKNOWN0", "actionScriptMagicButterflyTask1.UNKNOWN1", "actionScriptMagicButterflyTask1.UNKNOWN1", "actionScriptMagicButterflyTask1.UNKNOWN1", "actionScriptMagicButterflyTask1.UNKNOWN0", "actionScriptMagicButterflyTask1.UNKNOWN2", "actionScriptMagicButterflyTask1.UNKNOWN2", "actionScriptMagicButterflyTask1.UNKNOWN2"),
		SHORTJUMP("actionScriptMagicButterflyTask1.UNKNOWN0"),
	LABEL("UNKNOWN5"),
		SET_X_VELOCITY(0),
		PAUSE(10),
		SHORTJUMP("actionScriptMagicButterflyTask1"),
	);
}
/// $C3DE9C
immutable ubyte[40 + 3 * (const(void)*).sizeof + 16 * ScriptPointer.sizeof] actionScriptMagicButterflyTask2;
shared static this() {
	actionScriptMagicButterflyTask2 = initializeScript!actionScriptMagicButterflyTask2(
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
		SWITCH_JUMP_TEMPVAR("actionScriptMagicButterflyTask2.UNKNOWN0", "actionScriptMagicButterflyTask2.UNKNOWN4", "actionScriptMagicButterflyTask2.UNKNOWN5"),
	LABEL("UNKNOWN0"),
		CHOOSE_RANDOM(0, 1),
		JUMP_IF_TRUE("actionScriptMagicButterflyTask2.UNKNOWN2"),
	LABEL("UNKNOWN1"),
		SET_Y_VELOCITY(-256),
		SHORTJUMP("actionScriptMagicButterflyTask2.UNKNOWN3"),
	LABEL("UNKNOWN2"),
		SET_Y_VELOCITY(256),
	LABEL("UNKNOWN3"),
		CHOOSE_RANDOM(15, 30, 45, 60),
		WRITE_TEMPVAR_WAITTIMER(),
		SHORTJUMP("actionScriptMagicButterflyTask2"),
	LABEL("UNKNOWN4"),
		GET_DIRECTION_FROM_PLAYER_TO_ENTITY(),
		SWITCH_JUMP_TEMPVAR("actionScriptMagicButterflyTask2.UNKNOWN2", "actionScriptMagicButterflyTask2.UNKNOWN2", "actionScriptMagicButterflyTask2.UNKNOWN0", "actionScriptMagicButterflyTask2.UNKNOWN1", "actionScriptMagicButterflyTask2.UNKNOWN1", "actionScriptMagicButterflyTask2.UNKNOWN1", "actionScriptMagicButterflyTask2.UNKNOWN0", "actionScriptMagicButterflyTask2.UNKNOWN2"),
		SHORTJUMP("actionScriptMagicButterflyTask2.UNKNOWN0"),
	LABEL("UNKNOWN5"),
		SET_Y_VELOCITY(0),
		PAUSE(10),
		SHORTJUMP("actionScriptMagicButterflyTask2"),
	);
}
/// $C3DEED
immutable ubyte[18 + 7 * (const(void)*).sizeof + 1 * string.sizeof + 3 * ScriptPointer.sizeof] actionScriptMagicButterflyTask3;
shared static this() {
	actionScriptMagicButterflyTask3 = initializeScript!actionScriptMagicButterflyTask3(
		CHECK_PROSPECTIVE_ENTITY_COLLISION_WAIT_ENEMY(),
		UPDATE_FLYING_ENEMY_ENTITY_COLLISION(),
		TRY_BATTLE_START(),
		JUMP_IF_TRUE("actionScriptMagicButterflyTask3.UNKNOWN0"),
		PAUSE(1),
		SHORTJUMP("actionScriptMagicButterflyTask3"),
	LABEL("UNKNOWN0"),
		C0D77F(),
		SET_VAR(ActionScriptVars.v1, 2),
		SET_VELOCITIES_ZERO(),
		BACKUP_POSITION(),
		SHORTCALL("actionScriptWaitBattleFinished"),
		QUEUE_TEXT_SCRIPT("MSG_BUTTERFLY_HIT"),
		CLEANUP_SELF(),
		END(),
	);
}
/// $C3DF1E
immutable ubyte[52 + 10 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptMagicButterflyApproach;
shared static this() {
	actionScriptMagicButterflyApproach = initializeScript!actionScriptMagicButterflyApproach(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionBG13D),
		SET_PHYSICS_CALLBACK(&updateEntityPosition3D),
		START_TASK("animateDVAR4F2"),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		SET_VAR(ActionScriptVars.v4, 6),
		DISABLE_CURRENT_ENTITY_COLLISION2(),
		SET_Z(5),
		RESTORE_POSITION_BACKUP(),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		PLAY_SFX(Sfx.magicButterfly),
		SET_VAR(ActionScriptVars.v5, 1),
		GET_POSITION_OF_PARTY_MEMBER(255),
		ADD(ActionScriptVars.v7, 1),
		SET_MOVEMENT_SPEED(32),
		SHORTCALL("actionScriptMoveToLocation"),
		SET_Z_VELOCITY(64),
		PAUSE(60),
		SET_Z_VELOCITY(0),
		SET_VAR(ActionScriptVars.v4, 10),
		PAUSE(60),
		END_LAST_TASK(),
		MAGIC_BUTTERFLY_RECOVERY(),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C3DF72
immutable ubyte[19 + 4 * (const(void)*).sizeof] actionScriptMagicButterflyOut;
shared static this() {
	actionScriptMagicButterflyOut = initializeScript!actionScriptMagicButterflyOut(
		SET_PHYSICS_CALLBACK(&actionScriptNoPhysics),
		C0D77F(),
		SET_ANIMATION(0),
		SET_VELOCITIES_ZERO(),
		LOOP(3),
			SET_ANIMATION(255),
			PAUSE(5),
			SET_ANIMATION(0),
			PAUSE(5),
		LOOP_END(),
		CLEANUP_SELF(),
		UNFREEZE_ENTITIES(),
		END(),
	);
}
/// $C3DF90
immutable ubyte[15 + 6 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC3DF90;
shared static this() {
	unknownC3DF90 = initializeScript!unknownC3DF90(
		START_TASK("unknownC3DFB5"),
		SET_DIRECTION8(Direction.right),
		UPDATE_ENTITY_SPRITE_FRAME0_FORCED(),
		SET_X_VELOCITY(64),
	LABEL("UNKNOWN0"),
		PAUSE(10),
		IS_ENTITY_ONSCREEN(),
		JUMP_IF_TRUE("unknownC3DF90.UNKNOWN0"),
		CLEANUP_SELF(),
		YIELD_TO_TEXT(),
		UNFREEZE_ENTITIES(),
		END(),
	);
}
/// $C3DFB5
immutable ubyte[21 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC3DFB5;
shared static this() {
	unknownC3DFB5 = initializeScript!unknownC3DFB5(
		CHOOSE_RANDOM(0, 1),
		JUMP_IF_TRUE("unknownC3DFD4"),
		SET_Z_VELOCITY(-128),
		CHOOSE_RANDOM(30, 60, 90, 120),
		SHORTJUMP("unknownC3DFD4_2"),
	);
}
/// $C3DFD4
immutable ubyte[14 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC3DFD4;
shared static this() {
	unknownC3DFD4 = initializeScript!unknownC3DFD4(
		SET_Y_VELOCITY(32),
		CHOOSE_RANDOM(15, 30, 45, 60),
		SHORTJUMP("unknownC3DFD4_2"),
	);
}
/// $C3DFE4
immutable ubyte[2 + 1 * ScriptPointer.sizeof] unknownC3DFD4_2;
shared static this() {
	unknownC3DFD4_2 = initializeScript!unknownC3DFD4_2(
		WRITE_TEMPVAR_WAITTIMER(),
		SHORTJUMP("unknownC3DFB5"),
	);
}
/// $C40E24
immutable ubyte[6 + 3 * (const(void)*).sizeof] actionScript785;
shared static this() {
	actionScript785 = initializeScript!actionScript785(
		SET_POSITION_CHANGE_CALLBACK(&updateScreenPositionNoOp),
		SET_PHYSICS_CALLBACK(&unknownC0A26B),
		SET_ANIMATION(0),
		UPDATE_ENTITY_SPRITE_FRAME0(),
		HALT(),
	);
}
/// $C40F18
immutable ubyte[23 + 4 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] unknownC40F18;
shared static this() {
	unknownC40F18 = initializeScript!unknownC40F18(
		PAUSE(1),
		WRITE_WORD_TEMPVAR(256),
		TEST_ENTITY_RIGHT_OF_X_COORD(),
		JUMP_IF_FALSE("unknownC40F18.UNKNOWN0"),
		WRITE_WORD_TEMPVAR(-12),
		TEST_ENTITY_RIGHT_OF_X_COORD(),
		JUMP_IF_FALSE("unknownC40F18.UNKNOWN1"),
	LABEL("UNKNOWN0"),
		WRITE_WORD_TEMPVAR(224),
		TEST_ENTITY_BELOW_Y_COORD(),
		JUMP_IF_FALSE("unknownC40F18"),
		WRITE_WORD_TEMPVAR(-12),
		TEST_ENTITY_BELOW_Y_COORD(),
		JUMP_IF_TRUE("unknownC40F18"),
	LABEL("UNKNOWN1"),
		SHORTJUMP("unknownC40F45"),
	);
}
/// $C40F45
immutable ubyte[2 + 1 * (const(void)*).sizeof] unknownC40F45;
shared static this() {
	unknownC40F45 = initializeScript!unknownC40F45(
		CLEANUP_SELF(),
		END(),
	);
}
/// $C40F4A
immutable ubyte[8 + 3 * (const(void)*).sizeof] unknownC40F4A;
shared static this() {
	unknownC40F4A = initializeScript!unknownC40F4A(
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_POSITION_CHANGE_CALLBACK(&updateEntityPositionAbsolute),
		C0AAFD(),
		SET_VAR(ActionScriptVars.v0, 1),
		SHORT_RETURN(),
	);
}
/// $C40F59
immutable ubyte[8 + 3 * (const(void)*).sizeof] unknownC40F59;
shared static this() {
	unknownC40F59 = initializeScript!unknownC40F59(
		SET_PHYSICS_CALLBACK(&updateActiveEntityPosition2D),
		SET_POSITION_CHANGE_CALLBACK(&updateEntityPositionAbsolute),
		C0AAFD(),
		SET_VAR(ActionScriptVars.v0, 0),
		SHORT_RETURN(),
	);
}
/// $C40F68
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript502;
shared static this() {
	actionScript502 = initializeScript!actionScript502(
		SHORTCALL("unknownC40F4A"),
		SHORTJUMP("unknownC41036"),
	);
}
/// $C40F6E
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript503;
shared static this() {
	actionScript503 = initializeScript!actionScript503(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC4116C"),
	);
}
/// $C40F74
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript504;
shared static this() {
	actionScript504 = initializeScript!actionScript504(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC4119D"),
	);
}
/// $C40F7A
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript505;
shared static this() {
	actionScript505 = initializeScript!actionScript505(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC411EB"),
	);
}
/// $C40F80
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript506;
shared static this() {
	actionScript506 = initializeScript!actionScript506(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC4121F"),
	);
}
/// $C40F86
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript507;
shared static this() {
	actionScript507 = initializeScript!actionScript507(
		SHORTCALL("unknownC40F4A"),
		SHORTJUMP("unknownC41253"),
	);
}
/// $C40F8C
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript508;
shared static this() {
	actionScript508 = initializeScript!actionScript508(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC41382"),
	);
}
/// $C40F92
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript509;
shared static this() {
	actionScript509 = initializeScript!actionScript509(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC413D6"),
	);
}
/// $C40F98
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript510;
shared static this() {
	actionScript510 = initializeScript!actionScript510(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC41402"),
	);
}
/// $C40F9E
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript511;
shared static this() {
	actionScript511 = initializeScript!actionScript511(
		SHORTCALL("unknownC40F4A"),
		SHORTJUMP("unknownC4144C"),
	);
}
/// $C40FA4
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript512;
shared static this() {
	actionScript512 = initializeScript!actionScript512(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC4152A"),
	);
}
/// $C40FAA
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript513;
shared static this() {
	actionScript513 = initializeScript!actionScript513(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC4154E"),
	);
}
/// $C40FB0
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript514;
shared static this() {
	actionScript514 = initializeScript!actionScript514(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC4158A"),
	);
}
/// $C40FB6
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript515;
shared static this() {
	actionScript515 = initializeScript!actionScript515(
		SHORTCALL("unknownC40F4A"),
		SHORTJUMP("unknownC4163F"),
	);
}
/// $C40FBC
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript516;
shared static this() {
	actionScript516 = initializeScript!actionScript516(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC4160A"),
	);
}
/// $C40FC2
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript517;
shared static this() {
	actionScript517 = initializeScript!actionScript517(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC416AC"),
	);
}
/// $C40FC8
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript518;
shared static this() {
	actionScript518 = initializeScript!actionScript518(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC415BA"),
	);
}
/// $C40FCE
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript519;
shared static this() {
	actionScript519 = initializeScript!actionScript519(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC415E7"),
	);
}
/// $C40FD4
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript520;
shared static this() {
	actionScript520 = initializeScript!actionScript520(
		SHORTCALL("unknownC40F4A"),
		SHORTJUMP("unknownC4170E"),
	);
}
/// $C40FDA
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript521;
shared static this() {
	actionScript521 = initializeScript!actionScript521(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC41822"),
	);
}
/// $C40FE0
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript522;
shared static this() {
	actionScript522 = initializeScript!actionScript522(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC41900"),
	);
}
/// $C40FE6
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript523;
shared static this() {
	actionScript523 = initializeScript!actionScript523(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC41900"),
	);
}
/// $C40FEC
immutable ubyte[4 + 2 * ScriptPointer.sizeof] actionScript524;
shared static this() {
	actionScript524 = initializeScript!actionScript524(
		SHORTCALL("unknownC40F59"),
		SET_PRIORITY(0),
		SHORTJUMP("unknownC41938"),
	);
}
/// $C40FF4
immutable ubyte[3 + 3 * ScriptPointer.sizeof] actionScript525;
shared static this() {
	actionScript525 = initializeScript!actionScript525(
		SHORTCALL("unknownC40F59"),
		START_TASK("unknownC40F18"),
		SHORTJUMP("unknownC41974"),
	);
}
/// $C40FFD
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript526;
shared static this() {
	actionScript526 = initializeScript!actionScript526(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC4198D"),
	);
}
/// $C41003
immutable ubyte[3 + 3 * ScriptPointer.sizeof] actionScript527;
shared static this() {
	actionScript527 = initializeScript!actionScript527(
		SHORTCALL("unknownC40F59"),
		START_TASK("unknownC40F18"),
		SHORTJUMP("unknownC419B2"),
	);
}
/// $C4100C
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript528;
shared static this() {
	actionScript528 = initializeScript!actionScript528(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC419BF"),
	);
}
/// $C41012
immutable ubyte[2 + 2 * ScriptPointer.sizeof] actionScript529;
shared static this() {
	actionScript529 = initializeScript!actionScript529(
		SHORTCALL("unknownC40F59"),
		SHORTJUMP("unknownC41A2A"),
	);
}
/// $C41018
immutable ubyte[4 + 2 * ScriptPointer.sizeof] actionScript530;
shared static this() {
	actionScript530 = initializeScript!actionScript530(
		SHORTCALL("unknownC40F59"),
		SET_PRIORITY(0),
		SHORTJUMP("unknownC41A7D"),
	);
}
/// $C41020
immutable ubyte[12 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptKingSleepingNameSummary;
shared static this() {
	actionScriptKingSleepingNameSummary = initializeScript!actionScriptKingSleepingNameSummary(
		SHORTCALL("unknownC40F59"),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 0),
		PAUSE(20),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 0),
		PAUSE(20),
		SHORTJUMP("actionScriptKingSleepingNameSummary.UNKNOWN0"),
	);
}
/// $C41036
immutable ubyte[192 + 36 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] unknownC41036;
shared static this() {
	unknownC41036 = initializeScript!unknownC41036(
		SET_X(-8),
		SET_Y(40),
		SET_X_VELOCITY(256),
		SET_Y_VELOCITY(0),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(8),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC41036.UNKNOWN0"),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(8),
	LABEL("UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(8, "unknownC41036.UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(180),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.downLeft, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(60),
		SET_ANIMATION(255),
		PAUSE(60),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(60),
	LABEL("UNKNOWN2"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(2, "unknownC41036.UNKNOWN2"),
	LABEL("UNKNOWN3"),
		WRITE_WORD_WRAM(&waitForNamingScreenActionScript, 1),
		SET_ANIMATION(255),
		PAUSE(20),
		WRITE_WORD_WRAM(&waitForNamingScreenActionScript, 0),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(30),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC41036.UNKNOWN3"),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(8),
	LABEL("UNKNOWN4"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(8, "unknownC41036.UNKNOWN4"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(90),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(30),
		SET_ANIMATION(255),
		PAUSE(60),
		SHORTJUMP("unknownC41036.UNKNOWN1"),
	);
}
/// $C4116C
immutable ubyte[41 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC4116C;
shared static this() {
	unknownC4116C = initializeScript!unknownC4116C(
		SET_X(24),
		SET_Y(40),
		SET_ANIMATION(255),
		PAUSE(48),
	LABEL("UNKNOWN0"),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(205),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(60),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(74),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(60),
		SHORTJUMP("unknownC4116C.UNKNOWN0"),
	);
}
/// $C4119D
immutable ubyte[65 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC4119D;
shared static this() {
	unknownC4119D = initializeScript!unknownC4119D(
		SET_ANIMATION(255),
		PAUSE(48),
	LABEL("UNKNOWN0"),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(130),
	LABEL("UNKNOWN1"),
		SET_X(24),
		SET_Y(40),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(-256),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 0),
		PAUSE(10),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(256),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 0),
		PAUSE(10),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
		SET_ANIMATION(255),
		PAUSE(30),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC4119D.UNKNOWN1"),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(169),
		SHORTJUMP("unknownC4119D.UNKNOWN0"),
	);
}
/// $C411EB
immutable ubyte[42 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC411EB;
shared static this() {
	unknownC411EB = initializeScript!unknownC411EB(
		SET_ANIMATION(255),
		PAUSE(48),
	LABEL("UNKNOWN0"),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(130),
	LABEL("UNKNOWN1"),
		SET_X(24),
		SET_Y(42),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(20),
		SET_ANIMATION(255),
		PAUSE(30),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC411EB.UNKNOWN1"),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(169),
		SHORTJUMP("unknownC411EB.UNKNOWN0"),
	);
}
/// $C4121F
immutable ubyte[42 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC4121F;
shared static this() {
	unknownC4121F = initializeScript!unknownC4121F(
		SET_ANIMATION(255),
		PAUSE(48),
	LABEL("UNKNOWN0"),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(217),
	LABEL("UNKNOWN1"),
		SET_X(24),
		SET_Y(19),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 0),
		PAUSE(10),
		SET_ANIMATION(255),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(2, "unknownC4121F.UNKNOWN1"),
		SET_ANIMATION(255),
		PAUSE(122),
		SHORTJUMP("unknownC4121F.UNKNOWN0"),
	);
}
/// $C41253
immutable ubyte[187 + 36 * (const(void)*).sizeof + 5 * ScriptPointer.sizeof] unknownC41253;
shared static this() {
	unknownC41253 = initializeScript!unknownC41253(
		SET_X(-8),
		SET_Y(40),
		SET_X_VELOCITY(256),
		SET_Y_VELOCITY(0),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(8),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC41253.UNKNOWN0"),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 1),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(60),
	LABEL("UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(8, "unknownC41253.UNKNOWN1"),
	LABEL("UNKNOWN2"),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.upLeft, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.downLeft, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.downLeft, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.upLeft, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(10),
	LABEL("UNKNOWN3"),
		WRITE_WORD_WRAM(&waitForNamingScreenActionScript, 1),
		SET_ANIMATION(255),
		PAUSE(60),
		WRITE_WORD_WRAM(&waitForNamingScreenActionScript, 0),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(20),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC41253.UNKNOWN3"),
	LABEL("UNKNOWN4"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(8, "unknownC41253.UNKNOWN4"),
		SHORTJUMP("unknownC41253.UNKNOWN2"),
	);
}
/// $C41382
immutable ubyte[68 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC41382;
shared static this() {
	unknownC41382 = initializeScript!unknownC41382(
		SET_X(24),
		SET_Y(40),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(37),
	LABEL("UNKNOWN0"),
		SET_ANIMATION(255),
		PAUSE(120),
	LABEL("UNKNOWN1"),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(-256),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(10),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(40),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(256),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(10),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
		SET_ANIMATION(255),
		PAUSE(20),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC41382.UNKNOWN1"),
		SET_ANIMATION(255),
		PAUSE(180),
		SHORTJUMP("unknownC41382.UNKNOWN0"),
	);
}
/// $C413D6
immutable ubyte[34 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC413D6;
shared static this() {
	unknownC413D6 = initializeScript!unknownC413D6(
		SET_X(24),
		SET_Y(42),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(37),
	LABEL("UNKNOWN0"),
		SET_ANIMATION(255),
		PAUSE(120),
	LABEL("UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(60),
		SET_ANIMATION(255),
		PAUSE(20),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC413D6.UNKNOWN1"),
		SET_ANIMATION(255),
		PAUSE(180),
		SHORTJUMP("unknownC413D6.UNKNOWN0"),
	);
}
/// $C41402
immutable ubyte[48 + 6 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] unknownC41402;
shared static this() {
	unknownC41402 = initializeScript!unknownC41402(
		SET_X(12),
		SET_Y(20),
		SET_ANIMATION(255),
		PAUSE(112),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 0),
		PAUSE(10),
		SET_ANIMATION(255),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(8, "unknownC41402.UNKNOWN0"),
	LABEL("UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 0),
		PAUSE(10),
		SET_ANIMATION(255),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(5, "unknownC41402.UNKNOWN1"),
		SET_ANIMATION(255),
		PAUSE(160),
	LABEL("UNKNOWN2"),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 0),
		PAUSE(10),
		SET_ANIMATION(255),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(8, "unknownC41402.UNKNOWN2"),
		SHORTJUMP("unknownC41402.UNKNOWN1"),
	);
}
/// $C4144C
immutable ubyte[142 + 24 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] unknownC4144C;
shared static this() {
	unknownC4144C = initializeScript!unknownC4144C(
		SET_X(-8),
		SET_Y(40),
		SET_X_VELOCITY(256),
		SET_Y_VELOCITY(0),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(8),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC4144C.UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(10),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
	LABEL("UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(8, "unknownC4144C.UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(60),
		SET_X_VELOCITY(-256),
		SET_Y_VELOCITY(0),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(2),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 1),
		PAUSE(8),
	LABEL("UNKNOWN2"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(180),
		UPDATE_SPRITE_DIRECTION(Direction.downLeft, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.upLeft, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(255),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(165),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(8),
	LABEL("UNKNOWN3"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(8, "unknownC4144C.UNKNOWN3"),
		SHORTJUMP("unknownC4144C.UNKNOWN2"),
	);
}
/// $C4152A
immutable ubyte[26 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC4152A;
shared static this() {
	unknownC4152A = initializeScript!unknownC4152A(
		SET_X(36),
		SET_Y(21),
		SET_ANIMATION(255),
		PAUSE(225),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(8),
		SET_ANIMATION(255),
		PAUSE(8),
		JUMP_TO_LABEL_N_TIMES(2, "unknownC4152A.UNKNOWN0"),
	LABEL("UNKNOWN1"),
		SET_ANIMATION(255),
		PAUSE(1),
		SHORTJUMP("unknownC4152A.UNKNOWN1"),
	);
}
/// $C4154E
immutable ubyte[47 + 3 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC4154E;
shared static this() {
	unknownC4154E = initializeScript!unknownC4154E(
		SET_X(11),
		SET_Y(31),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(51),
	LABEL("UNKNOWN0"),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(9),
	LABEL("UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(10),
		SET_ANIMATION(255),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(5, "unknownC4154E.UNKNOWN1"),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(137),
		SHORTJUMP("unknownC4154E.UNKNOWN0"),
	);
}
/// $C4158A
immutable ubyte[38 + 2 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC4158A;
shared static this() {
	unknownC4158A = initializeScript!unknownC4158A(
		SET_X(25),
		SET_Y(15),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(51),
	LABEL("UNKNOWN0"),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(249),
	LABEL("UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 0),
		PAUSE(10),
		SET_ANIMATION(255),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(5, "unknownC4158A.UNKNOWN1"),
		SET_ANIMATION(255),
		PAUSE(212),
		SHORTJUMP("unknownC4158A.UNKNOWN0"),
	);
}
/// $C415BA
immutable ubyte[31 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC415BA;
shared static this() {
	unknownC415BA = initializeScript!unknownC415BA(
		SET_X(24),
		SET_Y(40),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(8),
	LABEL("UNKNOWN0"),
		SET_ANIMATION(255),
		PAUSE(1),
		SHORTJUMP("unknownC415BA.UNKNOWN0"),
	);
}
/// $C415E7
immutable ubyte[21 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC415E7;
shared static this() {
	unknownC415E7 = initializeScript!unknownC415E7(
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(8),
		SHORTJUMP("unknownC40F45"),
	);
}
/// $C4160A
immutable ubyte[39 + 4 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC4160A;
shared static this() {
	unknownC4160A = initializeScript!unknownC4160A(
		SET_X(24),
		SET_Y(40),
		SET_ANIMATION(255),
		PAUSE(32),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(255),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(45),
	LABEL("UNKNOWN0"),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(213),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(255),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(45),
		SHORTJUMP("unknownC4160A.UNKNOWN0"),
	);
}
/// $C4163F
immutable ubyte[77 + 10 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC4163F;
shared static this() {
	unknownC4163F = initializeScript!unknownC4163F(
		SET_X(24),
		SET_Y(40),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(77),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(120),
		UPDATE_SPRITE_DIRECTION(Direction.downLeft, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.upLeft, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(60),
		SET_ANIMATION(255),
		PAUSE(120),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(60),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(60),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(45),
		SHORTJUMP("unknownC4163F.UNKNOWN0"),
	);
}
/// $C416AC
immutable ubyte[63 + 9 * (const(void)*).sizeof + 4 * ScriptPointer.sizeof] unknownC416AC;
shared static this() {
	unknownC416AC = initializeScript!unknownC416AC(
		SET_X(24),
		SET_Y(40),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(77),
	LABEL("UNKNOWN0"),
		SET_ANIMATION(255),
		PAUSE(204),
	LABEL("UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC416AC.UNKNOWN1"),
	LABEL("UNKNOWN2"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(5),
		JUMP_TO_LABEL_N_TIMES(3, "unknownC416AC.UNKNOWN2"),
	LABEL("UNKNOWN3"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(2),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(3),
		JUMP_TO_LABEL_N_TIMES(7, "unknownC416AC.UNKNOWN3"),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(189),
		SHORTJUMP("unknownC416AC.UNKNOWN0"),
	);
}
/// $C4170E
immutable ubyte[189 + 25 * (const(void)*).sizeof + 6 * ScriptPointer.sizeof] unknownC4170E;
shared static this() {
	unknownC4170E = initializeScript!unknownC4170E(
		SET_X(-8),
		SET_Y(48),
		SET_X_VELOCITY(256),
		SET_Y_VELOCITY(0),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(8),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC4170E.UNKNOWN0"),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(30),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 1),
		PAUSE(10),
	LABEL("UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC4170E.UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.downLeft, 1),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(10),
		SET_X_VELOCITY(-256),
		SET_Y_VELOCITY(0),
	LABEL("UNKNOWN2"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(8),
		JUMP_TO_LABEL_N_TIMES(2, "unknownC4170E.UNKNOWN2"),
		SET_ANIMATION(255),
		PAUSE(6),
	LABEL("UNKNOWN3"),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(28),
		SET_X(-8),
		SET_Y(48),
		SET_X_VELOCITY(256),
		SET_Y_VELOCITY(0),
	LABEL("UNKNOWN4"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(8),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC4170E.UNKNOWN4"),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 1),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 1),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(60),
		UPDATE_SPRITE_DIRECTION(Direction.upLeft, 1),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(10),
		SET_X_VELOCITY(-256),
		SET_Y_VELOCITY(0),
	LABEL("UNKNOWN5"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(8),
		JUMP_TO_LABEL_N_TIMES(2, "unknownC4170E.UNKNOWN5"),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(43),
		SHORTJUMP("unknownC4170E.UNKNOWN3"),
	);
}
/// $C41822
immutable ubyte[131 + 25 * (const(void)*).sizeof + 8 * ScriptPointer.sizeof] unknownC41822;
shared static this() {
	unknownC41822 = initializeScript!unknownC41822(
		SET_X(-12),
		SET_Y(40),
		SET_X_VELOCITY(256),
		SET_Y_VELOCITY(0),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(8),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(8),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC41822.UNKNOWN0"),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(114),
	LABEL("UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC41822.UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(20),
	LABEL("UNKNOWN2"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(120),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(255),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(96),
	LABEL("UNKNOWN3"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(2, "unknownC41822.UNKNOWN3"),
	LABEL("UNKNOWN4"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(2, "unknownC41822.UNKNOWN4"),
	LABEL("UNKNOWN5"),
		UPDATE_SPRITE_DIRECTION(Direction.right, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.right, 1),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(2, "unknownC41822.UNKNOWN5"),
	LABEL("UNKNOWN6"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.down, 1),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(2, "unknownC41822.UNKNOWN6"),
	LABEL("UNKNOWN7"),
		UPDATE_SPRITE_DIRECTION(Direction.left, 1),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.left, 0),
		PAUSE(10),
		JUMP_TO_LABEL_N_TIMES(2, "unknownC41822.UNKNOWN7"),
		SHORTJUMP("unknownC41822.UNKNOWN2"),
	);
}
/// $C41900
immutable ubyte[40 + 4 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC41900;
shared static this() {
	unknownC41900 = initializeScript!unknownC41900(
		SET_X(20),
		SET_Y(40),
		SET_ANIMATION(255),
		PAUSE(206),
	LABEL("UNKNOWN0"),
		SET_ANIMATION(255),
		PAUSE(120),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 0),
		PAUSE(30),
	LABEL("UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.downRight, 0),
		PAUSE(20),
		UPDATE_SPRITE_DIRECTION(Direction.upRight, 0),
		PAUSE(20),
		JUMP_TO_LABEL_N_TIMES(11, "unknownC41900.UNKNOWN1"),
		SET_ANIMATION(255),
		PAUSE(255),
		SET_ANIMATION(255),
		PAUSE(141),
		SHORTJUMP("unknownC41900.UNKNOWN0"),
	);
}
/// $C41938
immutable ubyte[41 + 5 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC41938;
shared static this() {
	unknownC41938 = initializeScript!unknownC41938(
		SET_X(24),
		SET_Y(-32),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(512),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(4),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(4),
		JUMP_TO_LABEL_N_TIMES(3, "unknownC41938.UNKNOWN0"),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
	LABEL("UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(10),
		SHORTJUMP("unknownC41938.UNKNOWN1"),
	);
}
/// $C41974
immutable ubyte[17 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC41974;
shared static this() {
	unknownC41974 = initializeScript!unknownC41974(
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(-512),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(4),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(4),
		SHORTJUMP("unknownC41974.UNKNOWN0"),
	);
}
/// $C4198D
immutable ubyte[29 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC4198D;
shared static this() {
	unknownC4198D = initializeScript!unknownC4198D(
		SET_X(-40),
		SET_Y(41),
		SET_X_VELOCITY(512),
		SET_Y_VELOCITY(0),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(32),
		SET_X_VELOCITY(0),
		SET_Y_VELOCITY(0),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		PAUSE(1),
		SHORTJUMP("unknownC4198D.UNKNOWN0"),
	);
}
/// $C419B2
immutable ubyte[10 + 1 * (const(void)*).sizeof] unknownC419B2;
shared static this() {
	unknownC419B2 = initializeScript!unknownC419B2(
		SET_X_VELOCITY(-512),
		SET_Y_VELOCITY(0),
		UPDATE_SPRITE_DIRECTION(Direction.down, 0),
		HALT(),
	);
}
/// $C419BF
immutable ubyte[71 + 10 * (const(void)*).sizeof + 3 * ScriptPointer.sizeof] unknownC419BF;
shared static this() {
	unknownC419BF = initializeScript!unknownC419BF(
		SET_X(24),
		SET_Y(32),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(5),
		SET_ANIMATION(255),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(5),
		SET_ANIMATION(255),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(5),
		SET_ANIMATION(255),
		PAUSE(5),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(1),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(1),
		SET_ANIMATION(255),
		PAUSE(2),
		JUMP_TO_LABEL_N_TIMES(3, "unknownC419BF.UNKNOWN0"),
	LABEL("UNKNOWN1"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(1),
		SET_ANIMATION(255),
		PAUSE(1),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC419BF.UNKNOWN1"),
	LABEL("UNKNOWN2"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(10),
		SHORTJUMP("unknownC419BF.UNKNOWN2"),
	);
}
/// $C41A2A
immutable ubyte[55 + 8 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] unknownC41A2A;
shared static this() {
	unknownC41A2A = initializeScript!unknownC41A2A(
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(1),
		SET_ANIMATION(255),
		PAUSE(1),
		JUMP_TO_LABEL_N_TIMES(1, "unknownC41A2A"),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(1),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(1),
		SET_ANIMATION(255),
		PAUSE(2),
		JUMP_TO_LABEL_N_TIMES(3, "unknownC41A2A.UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(5),
		SET_ANIMATION(255),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(5),
		SET_ANIMATION(255),
		PAUSE(10),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(5),
		SET_ANIMATION(255),
		PAUSE(10),
		END(),
	);
}
/// $C41A7D
immutable ubyte[25 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] unknownC41A7D;
shared static this() {
	unknownC41A7D = initializeScript!unknownC41A7D(
		SET_X(24),
		SET_Y(32),
		SET_ANIMATION(255),
		PAUSE(60),
	LABEL("UNKNOWN0"),
		UPDATE_SPRITE_DIRECTION(Direction.up, 0),
		PAUSE(5),
		UPDATE_SPRITE_DIRECTION(Direction.up, 1),
		PAUSE(5),
		SET_ANIMATION(255),
		PAUSE(5),
		SHORTJUMP("unknownC41A7D.UNKNOWN0"),
	);
}
/// $C42172
immutable ubyte[4 + 1 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScript787;
shared static this() {
	actionScript787 = initializeScript!actionScript787(
		DRAW_BATTLE_FRAME(),
		PAUSE(1),
		SHORTJUMP("actionScript787"),
	);
}
/// $C4217B
immutable ubyte[60 + 29 * (const(void)*).sizeof] actionScriptGasStationFlashing;
shared static this() {
	actionScriptGasStationFlashing = initializeScript!actionScriptGasStationFlashing(
		LOAD_GAS_STATION_FLASH_PALETTE(),
		PAUSE(15),
		LOAD_GAS_STATION_PALETTE(),
		PAUSE(100),
		LOAD_GAS_STATION_FLASH_PALETTE(),
		PAUSE(15),
		LOAD_GAS_STATION_PALETTE(),
		PAUSE(80),
		LOAD_GAS_STATION_FLASH_PALETTE(),
		PAUSE(15),
		LOAD_GAS_STATION_PALETTE(),
		PAUSE(60),
		LOAD_GAS_STATION_FLASH_PALETTE(),
		PAUSE(10),
		LOAD_GAS_STATION_PALETTE(),
		PAUSE(40),
		LOAD_GAS_STATION_FLASH_PALETTE(),
		PAUSE(10),
		LOAD_GAS_STATION_PALETTE(),
		PAUSE(30),
		LOAD_GAS_STATION_FLASH_PALETTE(),
		PAUSE(10),
		LOAD_GAS_STATION_PALETTE(),
		PAUSE(20),
		LOAD_GAS_STATION_FLASH_PALETTE_WAIT(5),
		LOAD_GAS_STATION_PALETTE(),
		PAUSE(15),
		LOAD_GAS_STATION_FLASH_PALETTE_WAIT(5),
		LOAD_GAS_STATION_PALETTE(),
		PAUSE(10),
		LOAD_GAS_STATION_FLASH_PALETTE_WAIT(3),
		LOAD_GAS_STATION_PALETTE(),
		PAUSE(8),
		LOAD_GAS_STATION_FLASH_PALETTE_WAIT(2),
		LOAD_GAS_STATION_PALETTE_WAIT(6),
		LOAD_GAS_STATION_FLASH_PALETTE_WAIT(2),
		LOAD_GAS_STATION_PALETTE_WAIT(4),
		LOAD_GAS_STATION_FLASH_PALETTE_WAIT(2),
		LOAD_GAS_STATION_PALETTE_WAIT(3),
		LOAD_GAS_STATION_FLASH_PALETTE_WAIT(2),
		LOAD_GAS_STATION_PALETTE_WAIT(2),
		LOAD_GAS_STATION_FLASH_PALETTE_WAIT(2),
		LOAD_GAS_STATION_PALETTE_WAIT(2),
		LOAD_GAS_STATION_FLASH_PALETTE_WAIT(2),
		END(),
	);
}
/// $C4220E
immutable ubyte[7 + 4 * (const(void)*).sizeof] actionScriptTitleScreenCommonInit;
shared static this() {
	actionScriptTitleScreenCommonInit = initializeScript!actionScriptTitleScreenCommonInit(
		SET_ANIMATION_POINTER(&titleScreenLetterSpriteMaps[0]),
		SET_DRAW_CALLBACK(&unknownC0A0FA),
		SET_PRIORITY(1),
		SET_POSITION_CHANGE_CALLBACK(&updateEntityPositionAbsolute),
		ENABLE_DRAWING(),
		SHORT_RETURN(),
	);
}
/// $C4221F
immutable ubyte[5 + 2 * (const(void)*).sizeof] actionScriptTitleScreenFlashTask;
shared static this() {
	actionScriptTitleScreenFlashTask = initializeScript!actionScriptTitleScreenFlashTask(
		SET_BG_PALETTES_WHITE(),
		PAUSE(2),
		SET_BG_PALETTES_BLACK(),
		END_TASK(),
	);
}
/** ActionScript 789 - Global initialization for title screen (USA)
 * Original_Address: $(DOLLAR)C4222A
 */
immutable ubyte[4 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTitleScreen2;
shared static this() {
	actionScriptTitleScreen2 = initializeScript!actionScriptTitleScreen2(
		WRITE_WRAM_TEMPVAR(&titleScreenQuickMode),
		JUMP_IF_FALSE("animateCompletedTitleScreen"),
		LOAD_TITLE_SCREEN_PALETTES(),
		END(),
	);
}
/** Runs the animations on the "completed" title screen (ie the letters have fallen into place), including the flash, letter shimmer, background fade-in and letter glow
 * Original_Address: $(DOLLAR)C42235
 */
immutable ubyte[65 + 8 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] animateCompletedTitleScreen;
shared static this() {
	animateCompletedTitleScreen = initializeScript!animateCompletedTitleScreen(
		PAUSE(150),
		PAUSE(30),
		// make the backgound flash
		START_TASK("actionScriptTitleScreenFlashTask"),

		// start the letter shimmer effect
		WRITE_WORD_TEMPVAR(TitleScreenPaletteEffect.letterShimmer),
		LOAD_TITLE_SCREEN_PALETTE_EFFECT(),
		SET_VAR(ActionScriptVars.v0, 0), // start at loaded palette 0
		SET_VAR(ActionScriptVars.v1, 8), // copy over palette 8 (sprite palette 0, for the letters)
		SET_VAR(ActionScriptVars.v2, 14), // maximum of 14 palettes to rotate in
		LOOP(14),
			ROTATE_LOADED_PALETTE(),
			PAUSE(2),
		LOOP_END(),

		PAUSE(32),
		PAUSE(30),

		// start fading in the background
		PREPARE_TITLE_SCREEN_FADE_IN(),
		LOOP(165),
			UPDATE_PALETTE_FADE(),
			PAUSE(1),
		LOOP_END(),
		FINISH_PALETTE_FADE(),

		// start the glow effect for the letters
		WRITE_WORD_TEMPVAR(TitleScreenPaletteEffect.letterGlow),
		LOAD_TITLE_SCREEN_PALETTE_EFFECT(),
		SET_VAR(ActionScriptVars.v0, 0), // start at loaded palette 0
		SET_VAR(ActionScriptVars.v1, 7), // copy to palette 7 (bg palette 7, for the background glow)
		SET_VAR(ActionScriptVars.v2, 20), // maximum of 20 palettes
		LOOP(20),
			ROTATE_LOADED_PALETTE(),
			PAUSE(8),
		LOOP_END(),

		// can't be interrupted anymore
		SET_TITLE_SCREEN_ACTIONSCRIPT_STATE(),
		PAUSE(133),
		END(),
	);
}
/// $C42290
immutable ubyte[52 + 12 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptTitleScreen1;
shared static this() {
	actionScriptTitleScreen1 = initializeScript!actionScriptTitleScreen1(
		WRITE_WRAM_TEMPVAR(&titleScreenQuickMode),
		JUMP_IF_TRUE("actionScriptTitleScreen1.NOPAUSE"),
		PAUSE(60),
	LABEL("NOPAUSE"),
		CREATE_TITLE_SCREEN_ENTITY(ActionScript.titleScreen2),
		CREATE_TITLE_SCREEN_ENTITY(ActionScript.titleScreen3),
		CREATE_TITLE_SCREEN_ENTITY(ActionScript.titleScreen4),
		CREATE_TITLE_SCREEN_ENTITY(ActionScript.titleScreen5),
		CREATE_TITLE_SCREEN_ENTITY(ActionScript.titleScreen6),
		CREATE_TITLE_SCREEN_ENTITY(ActionScript.titleScreen7),
		CREATE_TITLE_SCREEN_ENTITY(ActionScript.titleScreen8),
		CREATE_TITLE_SCREEN_ENTITY(ActionScript.titleScreen9),
		CREATE_TITLE_SCREEN_ENTITY(ActionScript.titleScreen10),
		CREATE_TITLE_SCREEN_ENTITY(ActionScript.titleScreen11),
		PAUSE(150),
		PAUSE(30),
		PAUSE(60),
		PAUSE(30),
		PAUSE(165),
		PAUSE(161),
		PAUSE(140),
		PAUSE(29),
		YIELD_TO_TEXT(),
		HALT(),
	);
}
/// $C422E9
immutable ubyte[21 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTitleScreen3;
shared static this() {
	actionScriptTitleScreen3 = initializeScript!actionScriptTitleScreen3(
		SHORTCALL("actionScriptTitleScreenCommonInit"),
		SET_ANIMATION(0),
		SET_Y(100),
		WRITE_WRAM_TEMPVAR(&titleScreenQuickMode),
		JUMP_IF_TRUE("actionScriptTitleScreen3.UNKNOWN0"),
		SET_X(-661),
		SET_X_VELOCITY(1186),
		PAUSE(150),
		SET_VELOCITIES_ZERO(),
	LABEL("UNKNOWN0"),
		SET_X(34),
		HALT(),
	);
}
/// $C42304
immutable ubyte[21 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTitleScreen4;
shared static this() {
	actionScriptTitleScreen4 = initializeScript!actionScriptTitleScreen4(
		SHORTCALL("actionScriptTitleScreenCommonInit"),
		SET_ANIMATION(1),
		SET_Y(100),
		WRITE_WRAM_TEMPVAR(&titleScreenQuickMode),
		JUMP_IF_TRUE("actionScriptTitleScreen4.UNKNOWN0"),
		SET_X(-501),
		SET_X_VELOCITY(947),
		PAUSE(150),
		SET_VELOCITIES_ZERO(),
	LABEL("UNKNOWN0"),
		SET_X(54),
		HALT(),
	);
}
/// $C4231F
immutable ubyte[21 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTitleScreen5;
shared static this() {
	actionScriptTitleScreen5 = initializeScript!actionScriptTitleScreen5(
		SHORTCALL("actionScriptTitleScreenCommonInit"),
		SET_ANIMATION(2),
		SET_Y(100),
		WRITE_WRAM_TEMPVAR(&titleScreenQuickMode),
		JUMP_IF_TRUE("actionScriptTitleScreen5.UNKNOWN0"),
		SET_X(-341),
		SET_X_VELOCITY(711),
		PAUSE(150),
		SET_VELOCITIES_ZERO(),
	LABEL("UNKNOWN0"),
		SET_X(76),
		HALT(),
	);
}
/// $C4233A
immutable ubyte[21 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTitleScreen6;
shared static this() {
	actionScriptTitleScreen6 = initializeScript!actionScriptTitleScreen6(
		SHORTCALL("actionScriptTitleScreenCommonInit"),
		SET_ANIMATION(3),
		SET_Y(100),
		WRITE_WRAM_TEMPVAR(&titleScreenQuickMode),
		JUMP_IF_TRUE("actionScriptTitleScreen6.UNKNOWN0"),
		SET_X(-181),
		SET_X_VELOCITY(469),
		PAUSE(150),
		SET_VELOCITIES_ZERO(),
	LABEL("UNKNOWN0"),
		SET_X(94),
		HALT(),
	);
}
/// $C42355
immutable ubyte[21 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTitleScreen7;
shared static this() {
	actionScriptTitleScreen7 = initializeScript!actionScriptTitleScreen7(
		SHORTCALL("actionScriptTitleScreenCommonInit"),
		SET_ANIMATION(4),
		SET_Y(100),
		WRITE_WRAM_TEMPVAR(&titleScreenQuickMode),
		JUMP_IF_TRUE("actionScriptTitleScreen7.UNKNOWN0"),
		SET_X(-21),
		SET_X_VELOCITY(226),
		PAUSE(150),
		SET_VELOCITIES_ZERO(),
	LABEL("UNKNOWN0"),
		SET_X(112),
		HALT(),
	);
}
/// $C42370
immutable ubyte[21 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTitleScreen8;
shared static this() {
	actionScriptTitleScreen8 = initializeScript!actionScriptTitleScreen8(
		SHORTCALL("actionScriptTitleScreenCommonInit"),
		SET_ANIMATION(5),
		SET_Y(100),
		WRITE_WRAM_TEMPVAR(&titleScreenQuickMode),
		JUMP_IF_TRUE("actionScriptTitleScreen8.UNKNOWN0"),
		SET_X(339),
		SET_X_VELOCITY(-305),
		PAUSE(150),
		SET_VELOCITIES_ZERO(),
	LABEL("UNKNOWN0"),
		SET_X(160),
		HALT(),
	);
}
/// $C4238B
immutable ubyte[21 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTitleScreen9;
shared static this() {
	actionScriptTitleScreen9 = initializeScript!actionScriptTitleScreen9(
		SHORTCALL("actionScriptTitleScreenCommonInit"),
		SET_ANIMATION(6),
		SET_Y(100),
		WRITE_WRAM_TEMPVAR(&titleScreenQuickMode),
		JUMP_IF_TRUE("actionScriptTitleScreen9.UNKNOWN0"),
		SET_X(539),
		SET_X_VELOCITY(-612),
		PAUSE(150),
		SET_VELOCITIES_ZERO(),
	LABEL("UNKNOWN0"),
		SET_X(180),
		HALT(),
	);
}
/// $C423A6
immutable ubyte[21 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTitleScreen10;
shared static this() {
	actionScriptTitleScreen10 = initializeScript!actionScriptTitleScreen10(
		SHORTCALL("actionScriptTitleScreenCommonInit"),
		SET_ANIMATION(7),
		SET_Y(100),
		WRITE_WRAM_TEMPVAR(&titleScreenQuickMode),
		JUMP_IF_TRUE("actionScriptTitleScreen10.UNKNOWN0"),
		SET_X(739),
		SET_X_VELOCITY(-918),
		PAUSE(150),
		SET_VELOCITIES_ZERO(),
	LABEL("UNKNOWN0"),
		SET_X(201),
		HALT(),
	);
}
/// $C423C1
immutable ubyte[21 + 1 * (const(void)*).sizeof + 2 * ScriptPointer.sizeof] actionScriptTitleScreen11;
shared static this() {
	actionScriptTitleScreen11 = initializeScript!actionScriptTitleScreen11(
		SHORTCALL("actionScriptTitleScreenCommonInit"),
		SET_ANIMATION(8),
		SET_Y(100),
		WRITE_WRAM_TEMPVAR(&titleScreenQuickMode),
		JUMP_IF_TRUE("actionScriptTitleScreen11.UNKNOWN0"),
		SET_X(939),
		SET_X_VELOCITY(-1223),
		PAUSE(150),
		SET_VELOCITIES_ZERO(),
	LABEL("UNKNOWN0"),
		SET_X(222),
		HALT(),
	);
}
/// $C4279F
immutable ubyte[3 + 1 * ScriptPointer.sizeof] actionScript859;
shared static this() {
	actionScript859 = initializeScript!actionScript859(
		PAUSE(2),
		//fallthrough
		SHORTJUMP("actionScriptRunFadeEffect"),
	);
}
/// $C427A1
immutable ubyte[32 + 4 * (const(void)*).sizeof + 10 * ScriptPointer.sizeof] actionScriptRunFadeEffect;
shared static this() {
	actionScriptRunFadeEffect = initializeScript!actionScriptRunFadeEffect(
		BACKUP_ENTITY_CALLBACK_FLAGS_AND_DISABLE(),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_TRUE("actionScriptRunFadeEffect.UNKNOWN0"),
		END(),
	LABEL("UNKNOWN0"),
		CLEAR_ALL_BLINKING(),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v0),
		JUMP_IF_FALSE("actionScriptRunFadeEffect.UNKNOWN1"),
		START_TASK("actionScriptRunBlinkEffect"),
	LABEL("UNKNOWN1"),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v1),
		JUMP_IF_FALSE("actionScriptRunFadeEffect.UNKNOWN2"),
		START_TASK("actionScriptRunHStripeEffect"),
	LABEL("UNKNOWN2"),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v2),
		JUMP_IF_FALSE("actionScriptRunFadeEffect.UNKNOWN3"),
		START_TASK("actionScriptRunVStripeEffect"),
	LABEL("UNKNOWN3"),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v3),
		JUMP_IF_FALSE("actionScriptRunFadeEffect.UNKNOWN4"),
		START_TASK("actionScriptRunDotsEffect"),
	LABEL("UNKNOWN4"),
		PAUSE(1),
		WRITE_VAR_TO_TEMPVAR(ActionScriptVars.v4),
		JUMP_IF_TRUE("actionScriptRunFadeEffect.UNKNOWN4"),
		RESTORE_ENTITY_CALLBACK_FLAGS(),
		WRITE_WORD_WRAM(&entityFadeEntity, -1),
		END(),
	);
}
/// $C427E0
immutable ubyte[25 + 3 * (const(void)*).sizeof] actionScriptRunBlinkEffect;
shared static this() {
	actionScriptRunBlinkEffect = initializeScript!actionScriptRunBlinkEffect(
		SET_VAR(ActionScriptVars.v7, 1),
		LOOP(12),
			BLINK_INVISIBLE(),
			WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v7),
			BLINK_VISIBLE(),
			WRITE_VAR_TO_WAIT_TIMER(ActionScriptVars.v7),
			ADD(ActionScriptVars.v7, 1),
		LOOP_END(),
		ADD(ActionScriptVars.v4, -1),
		END_FADE(),
		END_TASK(),
	);
}
/// $C42802
immutable ubyte[11 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptRunHStripeEffect;
shared static this() {
	actionScriptRunHStripeEffect = initializeScript!actionScriptRunHStripeEffect(
		OBJFX_HSTRIPE(),
		PAUSE(2),
		JUMP_IF_TRUE("actionScriptRunHStripeEffect"),
		ADD(ActionScriptVars.v4, -1),
		END_FADE(),
		END_TASK(),
	);
}
/// $C42815
immutable ubyte[11 + 2 * (const(void)*).sizeof + 1 * ScriptPointer.sizeof] actionScriptRunVStripeEffect;
shared static this() {
	actionScriptRunVStripeEffect = initializeScript!actionScriptRunVStripeEffect(
		OBJFX_VSTRIPE(),
		PAUSE(2),
		JUMP_IF_TRUE("actionScriptRunVStripeEffect"),
		ADD(ActionScriptVars.v4, -1),
		END_FADE(),
		END_TASK(),
	);
}
/// $C42828
immutable ubyte[14 + 3 * (const(void)*).sizeof] actionScriptRunDotsEffect;
shared static this() {
	actionScriptRunDotsEffect = initializeScript!actionScriptRunDotsEffect(
		OBJFX_CLEAR_DOT_BUFFER(),
		LOOP(64),
			OBJFX_DOTS(),
			PAUSE(2),
		LOOP_END(),
		ADD(ActionScriptVars.v4, -1),
		END_FADE(),
		END_TASK(),
	);
}



ubyte[] actionCommand(T...)(ubyte command, T args) {
	return allBytes(command, args);
}

ubyte[] END() {
	return actionCommand(0x00);
}

ubyte[] LOOP(ubyte count) {
	return actionCommand(0x01, count);
}

ubyte[] LOOP_END() {
	return actionCommand(0x02);
}

ubyte[] LONGJUMP(const ScriptPointer label) {
	return actionCommand(0x03, label);
}

ubyte[] LONGCALL(const ScriptPointer label) {
	return actionCommand(0x04, label);
}

ubyte[] LONG_RETURN() {
	return actionCommand(0x05);
}

ubyte[] PAUSE(ubyte duration) {
	return actionCommand(0x06, duration);
}

ubyte[] START_TASK(ScriptPointer ptr) {
	return actionCommand(0x07, ptr);
}

ubyte[] SET_TICK_CALLBACK(void function() ptr) {
	return actionCommand(0x08, ptr);
}

ubyte[] HALT() {
	return actionCommand(0x09);
}

ubyte[] JUMP_IF_FALSE(const ScriptPointer label) {
	return actionCommand(0x0A, label);
}

ubyte[] JUMP_IF_TRUE(const ScriptPointer label) {
	return actionCommand(0x0B, label);
}

ubyte[] END_TASK() {
	return actionCommand(0x0C);
}

ubyte[] SET_VAR(ubyte var, short val) {
	return actionCommand(0x0E, var, val);
}

ubyte[] CLEAR_TICK_CALLBACK() {
	return actionCommand(0x0F);
}

ubyte[] SWITCH_JUMP_TEMPVAR(T...)(T ptrs) {
	return actionCommand(0x10, cast(ubyte)ptrs.length, ptrs);
}

ubyte[] SWITCH_CALL_TEMPVAR(T...)(T ptrs) {
	return actionCommand(0x11, cast(ubyte)ptrs.length, ptrs);
}

ubyte[] WRITE_BYTE_WRAM(void* ptr, ubyte val) {
	return actionCommand(0x12, ptr, val);
}

ubyte[] END_LAST_TASK() {
	return actionCommand(0x13);
}

ubyte[] BINOP(ubyte var, ubyte op, ushort value) {
	return actionCommand(0x14, var, op, value);
}

ubyte[] AND(ActionScriptVars var, ushort value) {
	return BINOP(var, Binop.and, value);
}

ubyte[] OR(ActionScriptVars var, ushort value) {
	return BINOP(var, Binop.or, value);
}

ubyte[] ADD(ActionScriptVars var, short value) {
	return BINOP(var, Binop.add, value);
}

ubyte[] XOR(ActionScriptVars var, ushort value) {
	return BINOP(var, Binop.xor, value);
}

ubyte[] WRITE_WORD_WRAM(void* ptr, short val) {
	return actionCommand(0x15, ptr, val);
}

ubyte[] WRITE_DWORD_WRAM(void* ptr, void* val) {
	ubyte[] result;
	static foreach (i; 0 .. size_t.sizeof / 2) {
		result ~= actionCommand(0x15, ptr + i * 2, cast(short)((cast(size_t)val) >> 16 * i));
	}
	return result;
}

ubyte[] BREAK_IF_FALSE(ScriptPointer ptr) {
	return actionCommand(0x16, ptr);
}

ubyte[] BREAK_IF_TRUE(ScriptPointer ptr) {
	return actionCommand(0x17, ptr);
}

ubyte[] BINOP_WRAM8(void* ptr, ubyte op, ubyte val) {
	return actionCommand(0x18, ptr, op, val);
}

ubyte[] AND_WRAM8(void* ptr, ubyte val) {
	return BINOP_WRAM8(ptr, 0, val);
}

ubyte[] OR_WRAM8(void* ptr, ubyte val) {
	return BINOP_WRAM8(ptr, 1, val);
}

ubyte[] ADD_WRAM8(void* ptr, ubyte val) {
	return BINOP_WRAM8(ptr, 2, val);
}

ubyte[] XOR_WRAM8(void* ptr, ubyte val) {
	return BINOP_WRAM8(ptr, 3, val);
}

ubyte[] SHORTJUMP(ScriptPointer ptr) {
	return actionCommand(0x19, ptr);
}

ubyte[] SHORTCALL(ScriptPointer ptr) {
	return actionCommand(0x1A, ptr);
}

ubyte[] SHORT_RETURN() {
	return actionCommand(0x1B);
}

ubyte[] SET_ANIMATION_POINTER(const(SpriteMap*)* ptr) {
	return actionCommand(0x1C, ptr);
}

ubyte[] WRITE_WORD_TEMPVAR(short var) {
	return actionCommand(0x1D, var);
}

ubyte[] WRITE_WRAM_TEMPVAR(short* var) {
	return actionCommand(0x1E, var);
}

ubyte[] WRITE_TEMPVAR_TO_VAR(ubyte var) {
	return actionCommand(0x1F, var);
}

ubyte[] WRITE_VAR_TO_TEMPVAR(ubyte var) {
	return actionCommand(0x20, var);
}

ubyte[] WRITE_VAR_TO_WAIT_TIMER(ubyte var) {
	return actionCommand(0x21, var);
}

ubyte[] SET_DRAW_CALLBACK(void function(short, short) ptr) {
	return actionCommand(0x22, ptr);
}

ubyte[] SET_POSITION_CHANGE_CALLBACK(void function() ptr) {
	return actionCommand(0x23, ptr);
}

ubyte[] LOOP_TEMPVAR() {
	return actionCommand(0x24);
}

ubyte[] SET_PHYSICS_CALLBACK(void function() func) {
	return actionCommand(0x25, func);
}

ubyte[] SET_ANIMATION_FRAME_VAR(ubyte id) {
	return actionCommand(0x26, id);
}

ubyte[] BINOP_TEMPVAR(ubyte op, short val) {
	return actionCommand(0x27, op, val);
}

ubyte[] AND_TEMPVAR(short id) {
	return BINOP_TEMPVAR(0, id);
}

ubyte[] OR_TEMPVAR(short id) {
	return BINOP_TEMPVAR(1, id);
}

ubyte[] ADD_TEMPVAR(short id) {
	return BINOP_TEMPVAR(2, id);
}

ubyte[] XOR_TEMPVAR(short id) {
	return BINOP_TEMPVAR(3, id);
}

ubyte[] SET_X(short id) {
	return actionCommand(0x28, id);
}

ubyte[] SET_Y(short id) {
	return actionCommand(0x29, id);
}

ubyte[] SET_Z(short id) {
	return actionCommand(0x2A, id);
}

ubyte[] SET_X_RELATIVE(short id) {
	return actionCommand(0x2B, id);
}

ubyte[] SET_Y_RELATIVE(short id) {
	return actionCommand(0x2C, id);
}

ubyte[] SET_Z_RELATIVE(short id) {
	return actionCommand(0x2D, id);
}

ubyte[] SET_X_VELOCITY_RELATIVE(short id) {
	return actionCommand(0x2E, id);
}

ubyte[] SET_Y_VELOCITY_RELATIVE(short id) {
	return actionCommand(0x2F, id);
}

ubyte[] SET_Z_VELOCITY_RELATIVE(short id) {
	return actionCommand(0x30, id);
}

ubyte[] SET_VELOCITIES_ZERO() {
	return actionCommand(0x39);
}

ubyte[] SET_ANIMATION(ubyte id) {
	return actionCommand(0x3B, id);
}

ubyte[] NEXT_ANIMATION_FRAME() {
	return actionCommand(0x3C);
}

ubyte[] PREV_ANIMATION_FRAME() {
	return actionCommand(0x3D);
}

ubyte[] SKIP_N_ANIMATION_FRAMES(ubyte frames) {
	return actionCommand(0x3E, frames);
}

ubyte[] SET_X_VELOCITY(short velocity) {
	return actionCommand(0x3F, velocity);
}

ubyte[] SET_Y_VELOCITY(short velocity) {
	return actionCommand(0x40, velocity);
}

ubyte[] SET_Z_VELOCITY(short velocity) {
	return actionCommand(0x41, velocity);
}

debug string[void*] funcSymbolMap;
debug size_t[void*] funcArgLengths;

template fixArgs(alias Func, Params...) {
	import std.traits : Parameters, ReturnType;
	short fixArgs(short a, ref const(ubyte)* b) {
		static if (is(ReturnType!Func : short) && (Parameters!Func.length > 1)) {
			return Func(a, b);
		} else static if (Parameters!Func.length > 1) {
			Func(a, b);
			return 0;
		} else static if (is(ReturnType!Func : short) && (Parameters!Func.length > 0)) {
			return Func(a);
		} else static if (is(ReturnType!Func : short)) {
			return Func();
		} else static if (Parameters!Func.length > 0) {
			Func(a);
			return 0;
		} else {
			Func();
			return 0;
		}
	}
	shared static this() {
		// the ubyte is included because an empty struct is still 1 byte, making it impossible to distinguish between nothing and a single byte
		struct _ { align(1): ubyte dummy; Params foo; }
		debug funcArgLengths[&fixArgs] = _.sizeof - 1;
		debug funcSymbolMap[&fixArgs] = __traits(identifier, Func);
	}
}
ubyte[] CALL(alias fun, T...)(T args) {
	short function(short, ref const(ubyte)*) ptr = &fixArgs!(fun, T);
	return actionCommand(0x42, ptr, args);
}

ubyte[] CALLEX(alias fun, T...)(ubyte ex, T args) {
	short function(short, ref const(ubyte)*) ptr = &fixArgs!(fun, T);
	return actionCommand(cast(ubyte)(0xF0 + ex), ptr, args);
}

ubyte[] SET_PRIORITY(ubyte priority) {
	return actionCommand(0x43, priority);
}

ubyte[] WRITE_TEMPVAR_WAITTIMER() {
	return actionCommand(0x44);
}

// pseudo-command for registering mid-script labels
ubyte[] LABEL(string name) {
	return actionCommand(0xFF, name);
}

alias UPDATE_SPRITE_DIRECTION = CALL!(actionScriptUpdateSpriteDirection, ubyte, ubyte);
alias SET_MOVEMENT_SPEED = CALL!(actionScriptSetMovementSpeedConstant, ushort);
alias SET_MOVEMENT_SPEED = CALL!setMovementSpeed;
alias FADE_OUT = CALL!(actionScriptFadeOut, ubyte, ubyte);
alias FADE_IN = CALL!(actionScriptFadeIn, ubyte, ubyte);
alias FADE_OUT_WITH_MOSAIC = CALL!(actionScriptFadeOutWithMosaic, ushort, ushort, ushort);
alias JUMP_TO_LABEL_N_TIMES = CALL!(actionScriptJumpToLabelNTimes, ubyte, string);
alias SET_MOVEMENT_FROM_ANGLE = CALL!setMovementFromAngle;
alias YIELD_TO_TEXT = CALL!actionScriptYieldToText;
alias CREATE_ENTITY_AT_VAR01_PLUS_BG3Y = CALL!(actionScriptCreateEntityAtV01PlusBG3Y, ushort, ushort);
alias UPDATE_ENTITY_SPRITE_FRAME1 = CALL!updateEntitySpriteCurrentFrame1;
alias UPDATE_ENTITY_SPRITE_FRAME0_FORCED = CALL!updateEntitySpriteCurrentFrame0Forced;
alias UPDATE_ENTITY_SPRITE = CALL!updateEntitySpriteCurrent;
alias UPDATE_ENTITY_SPRITE_FRAME0 = CALL!updateEntitySpriteCurrentFrame0;
alias GET_POSITION_OF_PARTY_MEMBER = CALL!(actionScriptGetPositionOfPartyMember, ubyte);
alias PREPARE_NEW_ENTITY_AT_PARTY_LEADER = CALL!actionScriptPrepareNewEntityAtPartyLeader;
alias PREPARE_NEW_ENTITY_AT_SELF = CALL!actionScriptPrepareNewEntityAtSelf;
alias PREPARE_NEW_ENTITY = CALL!(actionScriptPrepareNewEntity, ushort, ushort, ubyte);
alias PREPARE_NEW_ENTITY_AT_WARP_PRESET = CALL!(actionScriptPrepareNewEntityAtWarpPreset, ubyte);
alias CLEAR_CURRENT_ENTITY_COLLISION = CALL!clearCurrentEntityCollision;
alias CLEAR_CURRENT_ENTITY_COLLISION2 = CALL!clearCurrentEntityCollision2;
alias DISABLE_CURRENT_ENTITY_COLLISION = CALL!disableCurrentEntityCollision;
alias DISABLE_CURRENT_ENTITY_COLLISION2 = CALL!disableCurrentEntityCollision2;
alias GET_DIRECTION_FROM_PLAYER_TO_ENTITY = CALL!getDirectionFromPlayerToEntity;
alias GET_DIRECTION_ROTATED_CLOCKWISE = CALL!getDirectionRotatedClockwise;
alias INITIALIZE_YOUR_SANCTUARY_DISPLAY = CALL!initializeYourSanctuaryDisplay;
alias ENABLE_YOUR_SANCTUARY_DISPLAY = CALL!enableYourSanctuaryDisplay;
alias DISPLAY_YOUR_SANCTUARY_LOCATION = CALL!displayYourSanctuaryLocation;
alias MOVE_PARTY_TO_LEADER_POSITION = CALL!movePartyToLeaderPosition;
alias SET_DIRECTION = CALL!setDirection;
alias SET_DIRECTION8 = CALL!(setDirection8, ubyte);
alias PLAY_SFX = CALL!(actionScriptPlaySFX, ushort);
alias PRINT_CAST_NAME = CALL!(actionScriptPrintCastName, short, ushort, ushort);
alias PERFORM_PALETTE_FADE = CALL!(actionScriptPerformPaletteFade, ushort, ubyte, ubyte);
alias QUEUE_TEXT_SCRIPT = CALL!(actionScriptQueueInteractionTalkTo, string);
alias DISPLAY_TEXT_NOW = CALL!(actionScriptDisplayTextNow, string);
alias MOVE_TO_PARTY_MEMBER = CALL!(actionScriptMoveEntityToPartyMember, ubyte);
alias MOVE_TO_SPRITE = CALL!(actionScriptMoveEntityToSprite, ushort);
alias SET_EVENT_FLAG = CALL!(actionScriptSetEventFlag, ushort);
alias LOAD_BATTLE_BG = CALL!(actionScriptLoadBattleBG, ushort, ushort);
alias RAND = CALL!rand;
alias RELOAD_MAP_FULL = CALL!reloadMap;
alias RESTORE_MAP_RENDERING = CALL!restoreMapRendering;
alias LOAD_ITOI_PRODUCTION = CALL!loadItoiProductionOverlay;
alias LOAD_NINTENDO_PRESENTATION = CALL!loadNintendoPresentationOverlay;
alias DISPLAY_COPYRIGHT_WARNING_SCREEN = CALL!displayCopyrightWarningScreen;
alias INFLICT_SUNSTROKE_CHECK = CALL!inflictSunstrokeCheck;
alias LOAD_DEBUG_CURSOR_GRAPHICS = CALL!loadDebugCursorGraphics;
alias SRAM_CHECK_ROUTINE_CHECKSUM = CALL!sramCheckRoutineChecksum;
alias UPDATE_PALETTE_FADE = CALL!updatePaletteFade;
alias CLEANUP_SELF = CALL!activeScriptCleanupSelf;
alias INITIALIZE_PARTY_MEMBER = CALL!actionScriptInitializePartyMember;
alias UPDATE_PARTY_MEMBER_POSITION = CALL!actionScriptUpdatePartyMemberPosition;
alias CHECK_PROSPECTIVE_MAP_COLLISION = CALL!actionScriptGetActiveEntityMapCollisionProspective;
alias UPDATE_ENEMY_ENTITY_COLLISION = CALL!updateEnemyEntityCollision;
alias UPDATE_FLYING_ENEMY_ENTITY_COLLISION = CALL!updateFlyingEnemyEntityCollision;
alias CHECK_PROSPECTIVE_ENTITY_COLLISION_WAIT_ENEMY = CALL!actionScriptSetEntityToEntityCollisionProspectiveEnemy;
alias CHECK_PROSPECTIVE_ENTITY_COLLISION_WAIT_NPC = CALLEX!actionScriptSetEntityToEntityCollisionProspectiveNPC;
alias UNFREEZE_ENTITIES = CALL!unfreezeEntities;
alias CREATE_TITLE_SCREEN_ENTITY = CALL!(actionScriptCreateTitleScreenEntity, ushort);
alias BACKUP_ENTITY_CALLBACK_FLAGS_AND_DISABLE = CALL!backupEntityCallbackFlagsAndDisable;
alias RESTORE_ENTITY_CALLBACK_FLAGS = CALL!restoreEntityCallbackFlags;
alias PICK_RANDOM_ANGLE = CALL!actionScriptGenerateRandomAngle;
alias MOVE_RELATIVE_TO_BG3 = CALL!moveRelativeToBG3;
alias C0A643 = CALL!(unknownC0A643, ushort);
alias SLEEP_UNTIL_CARDINAL_PIXELS_MOVED = CALL!(actionScriptSleepUntilCardinalPixelsMoved, ushort);
alias SLEEP_UNTIL_PIXELS_MOVED = CALL!(actionScriptSleepUntilPixelsMoved, ushort);
alias MOVE_TO_LOCATION_BG1_RELATIVE = CALL!(actionScriptMoveEntityToLocationBG1Relative, ushort, ushort);
alias COPY_XY_TO_VARS_OFFSET = CALL!(actionScriptCopyAdjustedXYToVars, ushort, ushort);
alias SET_SPRITE_DESTINATION = CALL!(actionScriptFindSpriteLocationForActiveEntity, ushort);
alias MAKE_NPC_LOOK_AT_SELF = CALL!(actionScriptMakeNPCLookAtActiveEntity, ushort);
alias MAKE_SPRITE_LOOK_AT_SELF = CALL!(actionScriptMakeSpriteLookAtActiveEntity, ushort);
alias SET_BOUNDARIES = CALL!(actionScriptSetEntityBoundaries, ushort, ushort);
alias SPAWN_ENTITY_AT_SELF = CALL!(actionScriptSpawnEntityAtSelf, ushort, ushort);
alias PRINT_CAST_NAME_PARTY = CALL!(actionScriptPrintCastNameParty, ushort, ushort, ushort);
alias PRINT_CAST_NAME_VAR0 = CALL!(actionScriptPrintCastNameEntityVar0, ushort, ushort, ushort);
alias ENABLE_STAGE_HDMA = CALL!(actionScriptEnableStageHDMA, ushort, ushort, ushort);
alias SET_COLDATA_CGADSUB = CALL!(actionScriptSetCOLDATACGADSUB, ubyte, ubyte, ubyte);
alias SET_NPC_DESTINATION = CALL!(actionScriptFindNPCLocationForActiveEntity, ushort);
alias GET_EVENT_FLAG = CALL!(actionScriptGetEventFlag, ushort);
alias SET_SURFACE_FLAGS = CALL!(setSurfaceFlags, ubyte);
alias GET_SELF_DIRECTION = CALL!actionScriptGetSelfDirection;
alias GET_MOVEMENT_SPEED = CALL!getMovementSpeed;
alias IS_COLLISION_ENABLED = CALL!actionScriptTestCollisionEnabled;
alias C0A6E3 = CALL!unknownC0A6E3;
alias MOVE_TOWARDS_DESTINATION = CALL!actionScriptMoveActiveEntityTowardsDestination;
alias MOVE_TOWARDS_DESTINATION_FACE_OPPOSITE = CALL!actionScriptMoveActiveEntityTowardsDestinationFaceOpposite;
alias MOVE_TOWARDS_DESTINATION_DONT_CHANGE_DIRECTION = CALL!actionScriptMoveActiveEntityTowardsDestinationNoDirChange;
alias SPIRAL_MOVEMENT_FRAME = CALL!actionScriptSpiralMovement;
alias C0AAAC = CALL!unknownC0AAAC;
alias C0AACD = CALL!unknownC0AACD;
alias C0AAFD = CALL!unknownC0AAFD;
alias PREPARE_DELIVERY_ENTRANCE_PATH = CALL!prepareDeliveryEntrancePath;
alias PREPARE_DELIVERY_EXIT_PATH = CALL!prepareDeliveryExitPath;
alias UPDATE_GIFTBOX_STATE = CALL!updateActiveGiftBoxState;
alias C0C35D = CALL!unknownC0C35D;
alias GET_SWITCHABLE_PARTY_LEADER_DISTANCE_FAR_INTANGIBILITY = CALL!testPartyLeaderDistanceFarIntangibility;
alias GET_SWITCHABLE_PARTY_LEADER_DISTANCE_CLOSE_INTANGIBILITY = CALL!testPartyLeaderDistanceCloseIntangibility;
alias GET_ANGLE_TOWARDS_DESTINATION_UNLESS_WEAK = CALL!getAngleTowardsDestinationUnlessWeak;
alias IS_ENTITY_ONSCREEN = CALL!isEntityOnscreen;
alias UPDATE_SURFACE_FLAGS = CALL!updateEntitySurfaceFlags;
alias MOVE_IN_DIRECTION = CALL!actionScriptMoveDirection;
alias SLEEP_UNTIL_CARDINAL_PIXELS_MOVED_TEMPVAR = CALL!sleepUntilCardinalPixelsMoved;
alias C0CC11 = CALL!unknownC0CC11;
alias C0CCCC = CALL!unknownC0CCCC;
alias C0CD50 = CALL!unknownC0CD50;
alias C0CEBE = CALL!unknownC0CEBE;
alias C0D0D9 = CALL!unknownC0D0D9;
alias C0D0E6 = CALL!unknownC0D0E6;
alias TEST_PARTY_COLLISION = CALL!actionScriptTestPartyCollision;
alias IS_BATTLE_STARTING = CALL!testBattleStarting;
alias TRY_BATTLE_START = CALL!tryBattleStart;
alias C0D77F = CALL!unknownC0D77F;
alias BACKUP_POSITION = CALL!actionScriptBackupPosition;
alias RESTORE_POSITION_BACKUP = CALL!actionScriptRestorePositionBackup;
alias C0D98F = CALL!unknownC0D98F;
alias LOAD_TITLE_SCREEN_PALETTE_EFFECT = CALL!loadTitleScreenPaletteEffect;
alias PREPARE_TITLE_SCREEN_FADE_IN = CALL!prepareTitleScreenFadeIn;
alias SET_BG_PALETTES_WHITE = CALL!setBGPalettesWhite;
alias SET_BG_PALETTES_BLACK = CALL!setBGPalettesBlack;
alias LOAD_TITLE_SCREEN_PALETTES = CALL!actionScriptLoadTitleScreenPalettes;
alias SET_TITLE_SCREEN_ACTIONSCRIPT_STATE = CALL!setTitleScreenActionScriptState;
alias ROTATE_LOADED_PALETTE = CALL!rotateLoadedPalette;
alias ENABLE_DRAWING = CALL!actionScriptEnableDrawing;
alias LOAD_GAS_STATION_FLASH_PALETTE = CALL!loadGasStationFlashPalette;
alias LOAD_GAS_STATION_PALETTE = CALL!loadGasStationPalette;
alias MAGIC_BUTTERFLY_RECOVERY = CALL!magicButterflyRecovery;
alias DRAW_BATTLE_FRAME = CALL!drawBattleFrame;
alias OPEN_OVAL_WINDOW = CALL!openOvalWindow;
alias CLOSE_OVAL_WINDOW = CALL!closeOvalWindow;
alias IS_BATTLE_ANIMATION_PLAYING = CALL!isBattleAnimationPlaying;
alias TEST_IN_BIG_AREA = CALL!actionScriptTestInBigArea;
alias IS_ENTITY_ONSCREEN_RESET_ANIMATION = CALL!isEntityOnscreenResetAnimation;
alias SLEEP_SLOT_FRAMES = CALL!sleepSlotFrames;
alias BUN_BUUN_BEAM_INITIALIZATION = CALL!bunbuunBeamInitialization;
alias ELEVATER_INITIALIZATION = CALL!elevaterInitialization;
alias RECTANGLE_WINDOW_DISABLE_HDMA = CALL!rectangleWindowDisableHDMA;
alias DARKEN_SCREEN = CALL!darkenScreen;
alias DARKEN_SCREEN_END = CALL!disableBrightnessHDMA;
alias DARKEN_SCREEN_2_WINDOW = CALL!darkenScreen2Window;
alias DISABLE_SPOT_LIGHT_1 = CALL!disableSpotlightHDMA1;
alias DISABLE_SPOT_LIGHT_2 = CALL!disableSpotlightHDMA2;
alias PREPARE_PARTY_FOR_TESSIE_TRIP = CALL!preparePartyForTessieTrip;
alias PREPARE_PARTY_FOR_TESSIE_TRIP_END = CALL!preparePartyForTessieTripEnd;
alias GENERATE_RANDOM_LEAF_DELAY = CALL!generateRandomLeafDelay;
alias GENERATE_RANDOM_LEAF_DELAY2 = CALL!generateRandomLeafDelay2;
alias UNFREEZE_TESSIE_LEAVES = CALL!unfreezeTessieLeaves;
alias TRIGGER_TALK_TEXT = CALL!actionScriptTriggerTalkText;
alias GET_PRESSED_BUTTONS = CALL!actionScriptGetPressedButtons;
alias GET_PAD_STATE = CALL!actionScriptGetPadState;
alias TEST_ENTITY_RIGHT_OF_X_COORD = CALL!actionScriptTestEntityRightOfXCoord;
alias TEST_ENTITY_BELOW_Y_COORD = CALL!actionScriptTestEntityBelowYCoord;
alias TEST_Y_COORD_BELOW_LEADER = CALL!actionScriptTestYCoordBelowLeader;
alias GET_DEFAULT_DIRECTION = CALL!actionScriptGetDefaultDirection;
alias FACE_DIRECTION = CALL!actionScriptFaceDirection;
alias GET_UR_DL_DIRECTION = CALL!actionScriptGetURDLDirection;
alias CONVERT_8DIR_TO_4DIR_PREFER_LR = CALL!convert8DirectionTo4PreferLeftRight;
alias GET_ANGLE_TO_DESTINATION = CALL!entityAngleToDestination;
alias SET_MOVING_DIRECTION_FROM_ANGLE = CALL!setMovingDirectionFromAngle;
alias DIRECTION_TO_ANGLE = CALL!convertDirectionToAngle;
alias GET_OPPOSITE_DIRECTION = CALL!getOppositeDirection;
alias GET_DIRECTION_ROTATED_ANGLE_90 = CALL!getDirectionRotatedAngle90;
alias SET_DESTINATION_TO_PARTY_LEADER_LOCATION = CALL!actionScriptSetDestinationPartyLeader;
alias COPY_XY_TO_VARS = CALL!copyXYToVars;
alias COPY_DESTINATION_TO_LOCATION = CALL!copyDestinationToLocation;
alias MOVE_TO_TOP_OF_SCREEN_RANDOM = CALL!moveEntityToRandomTopOfScreen;
alias MOVE_TO_TRAVELLING_PHOTOGRAPHER_SPOT = CALL!moveEntityToPreparedTravellingPhotographerLocation;
alias TEST_IF_LEADER_WITHIN_BOUNDARIES = CALL!isLeaderWithinBoundaries;
alias TEST_IF_LEADER_CLOSE_BY = CALL!isLeaderClose;
alias GET_DIRECTION_TO_BOUNDARY = CALL!directionToEntityBoundaries;
alias HALVE_Y_SPEED = CALL!halveYSpeed;
alias GET_PARTY_COUNT = CALL!getPartyCount;
alias RELOAD_MAP_BLOCK_EVENT_CHANGES = CALL!reloadMapBlockEventChanges;
alias RERENDER_ROW = CALL!actionScriptRerenderRow;
alias RELOAD_MAP = CALL!actionScriptReloadMapCurrentLocation;
alias DO_PALETTES_FADE_STEP = CALL!actionScriptDoAllPalettesFadeStep;
alias C474A8 = CALL!unknownC474A8;
alias INVERT_Y_POSITION_RELATIVE = CALL!actionScriptInvertYPositionRelative;
alias LOAD_FULLSCREEN_ANIMATION = CALL!loadActionScriptAnimation;
alias UPDATE_FULLSCREEN_ANIMATION = CALL!updateActionScriptAnimationFrame;
alias PREPARE_LUMINE_HALL_TEXT = CALL!prepareLumineHallTextRender;
alias SCROLL_LUMINE_HALL_TEXT = CALL!scrollLumineHallTextFrame;
alias START_PSI_TELEPORT_TUTORIAL = CALL!actionScriptStartPSITeleportTutorial;
alias MAKE_PARTY_LOOK_AT_SELF = CALL!makePartyLookAtActiveEntity;
alias FINISH_PALETTE_FADE = CALL!finishPaletteFade;
alias BACKUP_PALETTES = CALL!backupPalettes;
alias PREPARE_FADE_PALETTE = BACKUP_PALETTES;
alias CLEAR_BG3_TILEMAP = CALL!actionScriptClearBG3Tilemap;
alias OPEN_PRAYER_OVAL_WINDOW = CALL!actionScriptOpenPrayerWindow;
alias RUN_FLYOVER = CALL!runFlyover;
alias UPDATE_SWIRL_FRAME = CALL!updateSwirlFrame;
alias CLEAR_ALL_BLINKING = CALL!actionScriptClearAllBlinking;
alias BLINK_VISIBLE = CALL!actionScriptBlinkVisible;
alias BLINK_INVISIBLE = CALL!actionScriptBlinkInvisible;
alias END_FADE = CALL!actionScriptEndFade;
alias OBJFX_HSTRIPE = CALL!actionScriptHStripe;
alias OBJFX_VSTRIPE = CALL!actionScriptVStripe;
alias OBJFX_CLEAR_DOT_BUFFER = CALL!actionScriptObjFXClearDotBuffer;
alias OBJFX_DOTS = CALL!actionScriptObjFXDots;
alias SET_CAST_SCROLL_THRESHOLD = CALL!setCastScrollThreshold;
alias CHECK_CAST_SCROLL_THRESHOLD = CALL!checkCastScrollThreshold;
alias UPLOAD_SPECIAL_CAST_PALETTE = CALL!uploadSpecialCastPalette;
alias IS_ENTITY_ONSCREEN_CAST = CALL!isEntityStillOnCastScreen;
alias BUBBLE_MONKEY_INITIALIZE = CALL!bubbleMonkeyInitialize;
alias GET_DELIVERY_ATTEMPT_COUNT = CALL!getEntityDeliveryAttemptCount;
alias RESET_DELIVERY_ATTEMPT_COUNT = CALL!resetEntityDeliveryAttemptCount;
alias HAS_DELIVERY_ATTEMPTS_LEFT = CALL!getEntityHasDeliveryAttemptsLeft;
alias GET_DELIVERY_ATTEMPT_DELAY = CALL!getTimeBetweenDeliveryAttempts;
alias START_DELIVERY_COUNTDOWN = CALL!startDeliveryCountdown;
alias DO_DELIVERY_COUNTDOWN = CALL!doDeliveryCountdown;
alias START_DELIVERY_SUCCESS_TEXT = CALL!startDeliverySuccessText;
alias START_DELIVERY_FAIL_TEXT = CALL!startDeliveryFailText;
alias GET_DELIVERY_ENTER_SPEED = CALL!getDeliveryEnterSpeed;
alias GET_DELIVERY_EXIT_SPEED = CALL!getDeliveryExitSpeed;
alias CHECK_DELIVERY_ELIGIBILITY = CALL!checkDeliveryEligibility;
alias START_DELIVERY = CALL!startDelivery;
alias FINISH_DELIVERY = CALL!finishDelivery;
alias UPDATE_MINI_GHOST_POSITION_WAIT = CALLEX!updateMiniGhostPosition;
alias LOAD_GAS_STATION_PALETTE_WAIT = CALLEX!loadGasStationPalette;
alias LOAD_GAS_STATION_FLASH_PALETTE_WAIT = CALLEX!loadGasStationFlashPalette;
ubyte[] CHOOSE_RANDOM(T...)(T args) {
	return CALL!chooseRandom(cast(ubyte)T.length, cast(short)args);
}

version(unittest) string[] labelsToCheck;

auto initializeScript(alias dest)(scope ubyte[] delegate()[] commands...) {
	return initializeScript(dest, __traits(identifier, dest), commands);
}
auto initializeScript(immutable(ubyte)[] dest, string scriptLabel, scope ubyte[] delegate()[] commands...) {
	import std.algorithm : among, startsWith;
	import std.conv : text;
	import std.format : format;
	void registerLabel(string fullLabel, const(ubyte)* offset) {
		assert(fullLabel !in labels, "Duplicate label: " ~ fullLabel);
		labels[fullLabel] = offset;
	}
	const length = dest.length;
	auto newBuffer = new ubyte[](length);
	size_t position;
	debug(actionscriptdump) {
		import std.stdio;
		writeln();
	}
	registerLabel(scriptLabel, &dest[0]);
	foreach (idx, command; commands) {
		const bytes = command();
		if (bytes[0] == 0xFF) {
			registerLabel(format!"%s.%s"(scriptLabel, (cast(string[])bytes[1 .. $])[0]), &dest[position]);
			continue;
		}
		version(unittest) {
			if (bytes[0].among(0x03, 0x04, 0x07, 0x0A, 0x0B, 0x16, 0x17, 0x19, 0x1A)) { // jumps and calls
				labelsToCheck ~= (cast(ScriptPointer[])(bytes[1 .. $]))[0];
			}
			if (bytes[0].among(0x10, 0x11)) { // switches
				labelsToCheck ~= (cast(ScriptPointer[])(bytes[2 .. $]))[0];
			}
			if (bytes.startsWith(JUMP_TO_LABEL_N_TIMES(0, null)[0 .. (void*).sizeof])) { // pseudo-loop function
				labelsToCheck ~= (cast(ScriptPointer[])(bytes[1 + (void*.sizeof) + ubyte.sizeof .. $]))[0];
			}
		}
		debug(actionscriptdump) writefln!"[%(%02X %)]"(bytes);
		assert(position + bytes.length <= length, text("Script command on line ", idx, " would overflow " ~ scriptLabel));
		newBuffer[position .. position + bytes.length] = bytes;
		position += bytes.length;
		if (idx == commands.length - 1) {
			assert(bytes[0].among(0x00, 0x09, 0x0C, 0x1B, 0x19), "Script " ~ scriptLabel ~ " is not terminated properly");
		}
	}
	assert(position != 0, "Script " ~ scriptLabel ~ " is empty");
	assert(position == length, text("Script size mismatch in " ~ scriptLabel ~ " (Expected ", length, ", got ", position, ")"));
	return newBuffer;
}

const(ubyte)*[ScriptPointer] labels;

const(ubyte)* getActionScriptLabel(ScriptPointer str) {
	if (auto addr = str in labels) {
		return *addr;
	}
	assert(0, "Destination label " ~ str ~ " not found");
}

unittest {
	foreach (label; labelsToCheck) {
		assert(label in labels, "ActionScript label " ~ label ~ " not defined");
	}
}
