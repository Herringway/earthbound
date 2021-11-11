/// more misc things
module earthbound.bank04;

import earthbound.commondefs;
import earthbound.hardware;
import earthbound.bank00;
import earthbound.bank01;
import earthbound.bank02;
import earthbound.bank03;
import earthbound.bank07;
import earthbound.bank0A;
import earthbound.bank0E;
import earthbound.bank0F;
import earthbound.bank10;
import earthbound.bank15;
import earthbound.bank18;
import earthbound.bank20;
import earthbound.bank21;
import earthbound.bank2F;
import earthbound.globals;
import core.stdc.string;

/// $C400D4
immutable void*[895] EventScriptPointers = [
    null /+EVENT_0+/,
    null /+EVENT_1+/,
    null /+EVENT_2+/,
    null /+EVENT_3+/,
    null /+EVENT_4+/,
    null /+EVENT_5+/,
    null /+EVENT_6_12+/,
    null /+EVENT_7+/,
    null /+EVENT_8+/,
    null /+EVENT_9+/,
    null /+EVENT_10_11+/,
    null /+EVENT_10_11+/,
    null /+EVENT_6_12+/,
    null /+EVENT_13+/,
    null /+EVENT_14+/,
    null /+EVENT_15+/,
    null /+EVENT_16+/,
    null /+EVENT_17+/,
    null /+EVENT_18+/,
    null /+EVENT_19+/,
    null /+EVENT_20+/,
    null /+EVENT_21+/,
    null /+EVENT_22+/,
    null /+EVENT_23+/,
    null /+EVENT_24+/,
    null /+EVENT_25+/,
    null /+EVENT_26+/,
    null /+EVENT_27+/,
    null /+EVENT_28+/,
    null /+EVENT_29+/,
    null /+EVENT_30+/,
    null /+EVENT_31+/,
    null /+EVENT_32+/,
    null /+EVENT_33+/,
    null /+EVENT_34+/,
    null /+EVENT_35+/,
    null /+EVENT_36+/,
    null /+EVENT_37+/,
    null /+EVENT_38+/,
    null /+EVENT_39+/,
    null /+EVENT_40+/,
    null /+EVENT_41+/,
    null /+EVENT_42+/,
    null /+EVENT_43+/,
    null /+EVENT_44+/,
    null /+EVENT_45+/,
    null /+EVENT_46+/,
    null /+EVENT_47+/,
    null /+EVENT_48+/,
    null /+EVENT_49+/,
    null /+EVENT_50+/,
    null /+EVENT_51+/,
    null /+EVENT_52+/,
    null /+EVENT_53+/,
    null /+EVENT_54+/,
    null /+EVENT_55+/,
    null /+EVENT_56+/,
    null /+EVENT_57+/,
    null /+EVENT_58+/,
    null /+EVENT_59+/,
    null /+EVENT_60+/,
    null /+EVENT_61+/,
    null /+EVENT_62+/,
    null /+EVENT_63+/,
    null /+EVENT_64+/,
    null /+EVENT_65+/,
    null /+EVENT_66+/,
    null /+EVENT_67+/,
    null /+EVENT_68+/,
    null /+EVENT_69+/,
    null /+EVENT_70+/,
    null /+EVENT_71+/,
    null /+EVENT_72+/,
    null /+EVENT_73+/,
    null /+EVENT_74+/,
    null /+EVENT_75+/,
    null /+EVENT_76+/,
    null /+EVENT_77+/,
    null /+EVENT_78+/,
    null /+EVENT_79+/,
    null /+EVENT_80+/,
    null /+EVENT_81+/,
    null /+EVENT_82+/,
    null /+EVENT_83+/,
    null /+EVENT_84+/,
    null /+EVENT_85+/,
    null /+EVENT_86+/,
    null /+EVENT_87+/,
    null /+EVENT_88+/,
    null /+EVENT_89+/,
    null /+EVENT_90+/,
    null /+EVENT_91+/,
    null /+EVENT_92+/,
    null /+EVENT_93+/,
    null /+EVENT_94+/,
    null /+EVENT_95+/,
    null /+EVENT_96+/,
    null /+EVENT_97+/,
    null /+EVENT_98+/,
    null /+EVENT_99+/,
    null /+EVENT_100+/,
    null /+EVENT_101+/,
    null /+EVENT_102+/,
    null /+EVENT_103+/,
    null /+EVENT_104+/,
    null /+EVENT_105+/,
    null /+EVENT_106+/,
    null /+EVENT_107+/,
    null /+EVENT_108+/,
    null /+EVENT_109+/,
    null /+EVENT_110+/,
    null /+EVENT_111+/,
    null /+EVENT_112+/,
    null /+EVENT_113+/,
    null /+EVENT_114+/,
    null /+EVENT_115+/,
    null /+EVENT_116+/,
    null /+EVENT_117+/,
    null /+EVENT_118+/,
    null /+EVENT_119+/,
    null /+EVENT_120+/,
    null /+EVENT_121+/,
    null /+EVENT_122+/,
    null /+EVENT_123+/,
    null /+EVENT_124+/,
    null /+EVENT_125+/,
    null /+EVENT_126+/,
    null /+EVENT_127+/,
    null /+EVENT_128+/,
    null /+EVENT_129+/,
    null /+EVENT_130+/,
    null /+EVENT_131+/,
    null /+EVENT_132+/,
    null /+EVENT_133+/,
    null /+EVENT_134+/,
    null /+EVENT_135+/,
    null /+EVENT_136+/,
    null /+EVENT_137+/,
    null /+EVENT_138+/,
    null /+EVENT_139+/,
    null /+EVENT_140+/,
    null /+EVENT_141+/,
    null /+EVENT_142+/,
    null /+EVENT_143+/,
    null /+EVENT_144+/,
    null /+EVENT_145+/,
    null /+EVENT_146+/,
    null /+EVENT_147+/,
    null /+EVENT_148+/,
    null /+EVENT_149+/,
    null /+EVENT_150+/,
    null /+EVENT_151+/,
    null /+EVENT_152+/,
    null /+EVENT_153+/,
    null /+EVENT_154+/,
    null /+EVENT_155+/,
    null /+EVENT_156+/,
    null /+EVENT_157+/,
    null /+EVENT_158+/,
    null /+EVENT_159+/,
    null /+EVENT_160+/,
    null /+EVENT_161+/,
    null /+EVENT_162+/,
    null /+EVENT_163+/,
    null /+EVENT_164+/,
    null /+EVENT_165+/,
    null /+EVENT_166+/,
    null /+EVENT_167+/,
    null /+EVENT_168+/,
    null /+EVENT_169+/,
    null /+EVENT_170+/,
    null /+EVENT_171+/,
    null /+EVENT_172+/,
    null /+EVENT_173+/,
    null /+EVENT_174+/,
    null /+EVENT_175+/,
    null /+EVENT_176+/,
    null /+EVENT_177+/,
    null /+EVENT_178+/,
    null /+EVENT_179+/,
    null /+EVENT_180+/,
    null /+EVENT_181+/,
    null /+EVENT_182+/,
    null /+EVENT_183+/,
    null /+EVENT_184+/,
    null /+EVENT_185+/,
    null /+EVENT_186+/,
    null /+EVENT_187+/,
    null /+EVENT_188+/,
    null /+EVENT_189+/,
    null /+EVENT_190+/,
    null /+EVENT_191+/,
    null /+EVENT_192+/,
    null /+EVENT_193+/,
    null /+EVENT_194+/,
    null /+EVENT_195+/,
    null /+EVENT_196+/,
    null /+EVENT_197+/,
    null /+EVENT_198+/,
    null /+EVENT_199+/,
    null /+EVENT_200+/,
    null /+EVENT_201+/,
    null /+EVENT_202+/,
    null /+EVENT_203+/,
    null /+EVENT_204+/,
    null /+EVENT_205+/,
    null /+EVENT_206+/,
    null /+EVENT_207+/,
    null /+EVENT_208+/,
    null /+EVENT_209+/,
    null /+EVENT_210+/,
    null /+EVENT_211+/,
    null /+EVENT_212+/,
    null /+EVENT_213+/,
    null /+EVENT_214+/,
    null /+EVENT_215+/,
    null /+EVENT_216+/,
    null /+EVENT_217+/,
    null /+EVENT_218+/,
    null /+EVENT_219+/,
    null /+EVENT_220+/,
    null /+EVENT_221+/,
    null /+EVENT_222+/,
    null /+EVENT_223+/,
    null /+EVENT_224+/,
    null /+EVENT_225_226_227+/,
    null /+EVENT_225_226_227+/,
    null /+EVENT_225_226_227+/,
    null /+EVENT_228+/,
    null /+EVENT_229+/,
    null /+EVENT_230+/,
    null /+EVENT_231+/,
    null /+EVENT_232+/,
    null /+EVENT_233_234_235_236_237+/,
    null /+EVENT_233_234_235_236_237+/,
    null /+EVENT_233_234_235_236_237+/,
    null /+EVENT_233_234_235_236_237+/,
    null /+EVENT_233_234_235_236_237+/,
    null /+EVENT_238+/,
    null /+EVENT_239+/,
    null /+EVENT_240+/,
    null /+EVENT_241+/,
    null /+EVENT_242_243+/,
    null /+EVENT_242_243+/,
    null /+EVENT_244+/,
    null /+EVENT_245+/,
    null /+EVENT_246+/,
    null /+EVENT_247_248+/,
    null /+EVENT_247_248+/,
    null /+EVENT_249+/,
    null /+EVENT_250+/,
    null /+EVENT_251+/,
    null /+EVENT_252+/,
    null /+EVENT_253+/,
    null /+EVENT_254+/,
    null /+EVENT_255+/,
    null /+EVENT_256+/,
    null /+EVENT_257+/,
    null /+EVENT_258+/,
    null /+EVENT_259+/,
    null /+EVENT_260+/,
    null /+EVENT_261+/,
    null /+EVENT_262+/,
    null /+EVENT_263+/,
    null /+EVENT_264+/,
    null /+EVENT_265+/,
    null /+EVENT_266+/,
    null /+EVENT_267+/,
    null /+EVENT_268+/,
    null /+EVENT_269+/,
    null /+EVENT_270+/,
    null /+EVENT_271+/,
    null /+EVENT_272+/,
    null /+EVENT_273+/,
    null /+EVENT_274_275_276+/,
    null /+EVENT_274_275_276+/,
    null /+EVENT_274_275_276+/,
    null /+EVENT_277+/,
    null /+EVENT_278+/,
    null /+EVENT_279+/,
    null /+EVENT_280+/,
    null /+EVENT_281+/,
    null /+EVENT_282+/,
    null /+EVENT_283+/,
    null /+EVENT_284+/,
    null /+EVENT_285+/,
    null /+EVENT_286+/,
    null /+EVENT_287+/,
    null /+EVENT_288+/,
    null /+EVENT_289+/,
    null /+EVENT_290+/,
    null /+EVENT_291+/,
    null /+EVENT_292+/,
    null /+EVENT_293+/,
    null /+EVENT_294+/,
    null /+EVENT_295+/,
    null /+EVENT_296+/,
    null /+EVENT_297+/,
    null /+EVENT_298+/,
    null /+EVENT_299+/,
    null /+EVENT_300+/,
    null /+EVENT_301+/,
    null /+EVENT_302+/,
    null /+EVENT_303+/,
    null /+EVENT_304+/,
    null /+EVENT_305+/,
    null /+EVENT_306+/,
    null /+EVENT_307+/,
    null /+EVENT_308+/,
    null /+EVENT_309+/,
    null /+EVENT_310+/,
    null /+EVENT_311+/,
    null /+EVENT_312+/,
    null /+EVENT_313+/,
    null /+EVENT_314+/,
    null /+EVENT_315+/,
    null /+EVENT_316+/,
    null /+EVENT_317+/,
    null /+EVENT_318+/,
    null /+EVENT_319+/,
    null /+EVENT_320+/,
    null /+EVENT_321+/,
    null /+EVENT_322+/,
    null /+EVENT_323+/,
    null /+EVENT_324+/,
    null /+EVENT_325+/,
    null /+EVENT_326+/,
    null /+EVENT_327+/,
    null /+EVENT_328+/,
    null /+EVENT_329+/,
    null /+EVENT_330+/,
    null /+EVENT_331+/,
    null /+EVENT_332+/,
    null /+EVENT_333+/,
    null /+EVENT_334+/,
    null /+EVENT_335+/,
    null /+EVENT_336+/,
    null /+EVENT_337+/,
    null /+EVENT_338+/,
    null /+EVENT_339+/,
    null /+EVENT_340+/,
    null /+EVENT_341+/,
    null /+EVENT_342+/,
    null /+EVENT_343+/,
    null /+EVENT_344+/,
    null /+EVENT_345+/,
    null /+EVENT_346+/,
    null /+EVENT_347+/,
    null /+EVENT_348_349+/,
    null /+EVENT_348_349+/,
    null /+EVENT_350+/,
    null /+EVENT_351+/,
    null /+EVENT_352+/,
    null /+EVENT_353+/,
    null /+EVENT_354+/,
    null /+EVENT_355+/,
    null /+EVENT_356+/,
    null /+EVENT_357+/,
    null /+EVENT_358+/,
    null /+EVENT_359+/,
    null /+EVENT_360+/,
    null /+EVENT_361+/,
    null /+EVENT_362+/,
    null /+EVENT_363+/,
    null /+EVENT_364+/,
    null /+EVENT_365+/,
    null /+EVENT_366+/,
    null /+EVENT_367+/,
    null /+EVENT_368+/,
    null /+EVENT_369+/,
    null /+EVENT_370+/,
    null /+EVENT_371+/,
    null /+EVENT_372+/,
    null /+EVENT_373+/,
    null /+EVENT_374+/,
    null /+EVENT_375_404+/,
    null /+EVENT_376_405+/,
    null /+EVENT_377_406+/,
    null /+EVENT_378_407+/,
    null /+EVENT_379_408+/,
    null /+EVENT_380+/,
    null /+EVENT_381+/,
    null /+EVENT_382+/,
    null /+EVENT_383+/,
    null /+EVENT_384+/,
    null /+EVENT_385+/,
    null /+EVENT_386+/,
    null /+EVENT_387+/,
    null /+EVENT_388+/,
    null /+EVENT_389_393+/,
    null /+EVENT_390_394+/,
    null /+EVENT_391+/,
    null /+EVENT_392+/,
    null /+EVENT_389_393+/,
    null /+EVENT_390_394+/,
    null /+EVENT_395+/,
    null /+EVENT_396+/,
    null /+EVENT_397+/,
    null /+EVENT_398+/,
    null /+EVENT_399+/,
    null /+EVENT_400+/,
    null /+EVENT_401+/,
    null /+EVENT_402+/,
    null /+EVENT_403+/,
    null /+EVENT_375_404+/,
    null /+EVENT_376_405+/,
    null /+EVENT_377_406+/,
    null /+EVENT_378_407+/,
    null /+EVENT_379_408+/,
    null /+EVENT_409+/,
    null /+EVENT_410+/,
    null /+EVENT_411+/,
    null /+EVENT_412+/,
    null /+EVENT_413+/,
    null /+EVENT_414+/,
    null /+EVENT_415+/,
    null /+EVENT_416+/,
    null /+EVENT_417+/,
    null /+EVENT_418+/,
    null /+EVENT_419+/,
    null /+EVENT_420+/,
    null /+EVENT_421+/,
    null /+EVENT_422+/,
    null /+EVENT_423+/,
    null /+EVENT_424+/,
    null /+EVENT_425+/,
    null /+EVENT_426+/,
    null /+EVENT_427+/,
    null /+EVENT_428+/,
    null /+EVENT_429+/,
    null /+EVENT_430+/,
    null /+EVENT_431_432_433_434+/,
    null /+EVENT_431_432_433_434+/,
    null /+EVENT_431_432_433_434+/,
    null /+EVENT_431_432_433_434+/,
    null /+EVENT_435+/,
    null /+EVENT_436+/,
    null /+EVENT_437+/,
    null /+EVENT_438+/,
    null /+EVENT_439+/,
    null /+EVENT_440+/,
    null /+EVENT_441+/,
    null /+EVENT_442+/,
    null /+EVENT_443+/,
    null /+EVENT_444+/,
    null /+EVENT_445+/,
    null /+EVENT_446+/,
    null /+EVENT_447+/,
    null /+EVENT_448+/,
    null /+EVENT_449+/,
    null /+EVENT_450+/,
    null /+EVENT_451+/,
    null /+EVENT_452+/,
    null /+EVENT_453+/,
    null /+EVENT_454+/,
    null /+EVENT_455+/,
    null /+EVENT_456+/,
    null /+EVENT_457+/,
    null /+EVENT_458+/,
    null /+EVENT_459+/,
    null /+EVENT_460+/,
    null /+EVENT_461+/,
    null /+EVENT_462+/,
    null /+EVENT_463+/,
    null /+EVENT_464+/,
    null /+EVENT_465+/,
    null /+EVENT_466+/,
    null /+EVENT_467+/,
    null /+EVENT_468+/,
    null /+EVENT_469+/,
    null /+EVENT_470+/,
    null /+EVENT_471+/,
    null /+EVENT_472+/,
    null /+EVENT_473+/,
    null /+EVENT_474+/,
    null /+EVENT_475+/,
    null /+EVENT_476+/,
    null /+EVENT_477+/,
    null /+EVENT_478+/,
    null /+EVENT_479+/,
    null /+EVENT_480+/,
    null /+EVENT_481+/,
    null /+EVENT_482+/,
    null /+EVENT_483+/,
    null /+EVENT_484+/,
    null /+EVENT_485+/,
    null /+EVENT_486+/,
    null /+EVENT_487+/,
    null /+EVENT_488+/,
    null /+EVENT_489+/,
    null /+EVENT_490+/,
    null /+EVENT_491+/,
    null /+EVENT_492+/,
    null /+EVENT_493+/,
    null /+EVENT_494+/,
    null /+EVENT_495+/,
    null /+EVENT_496+/,
    null /+EVENT_497+/,
    null /+EVENT_498+/,
    null /+EVENT_499+/,
    null /+EVENT_500+/,
    null /+EVENT_501+/,
    null /+EVENT_502+/,
    null /+EVENT_503+/,
    null /+EVENT_504+/,
    null /+EVENT_505+/,
    null /+EVENT_506+/,
    null /+EVENT_507+/,
    null /+EVENT_508+/,
    null /+EVENT_509+/,
    null /+EVENT_510+/,
    null /+EVENT_511+/,
    null /+EVENT_512+/,
    null /+EVENT_513+/,
    null /+EVENT_514+/,
    null /+EVENT_515+/,
    null /+EVENT_516+/,
    null /+EVENT_517+/,
    null /+EVENT_518+/,
    null /+EVENT_519+/,
    null /+EVENT_520+/,
    null /+EVENT_521+/,
    null /+EVENT_522+/,
    null /+EVENT_523+/,
    null /+EVENT_524+/,
    null /+EVENT_525+/,
    null /+EVENT_526+/,
    null /+EVENT_527+/,
    null /+EVENT_528+/,
    null /+EVENT_529+/,
    null /+EVENT_530+/,
    null /+EVENT_531+/,
    null /+EVENT_532+/,
    null /+EVENT_533+/,
    null /+EVENT_534+/,
    null /+EVENT_535+/,
    null /+EVENT_536+/,
    null /+EVENT_537+/,
    null /+EVENT_538+/,
    null /+EVENT_539+/,
    null /+EVENT_540+/,
    null /+EVENT_541+/,
    null /+EVENT_542+/,
    null /+EVENT_543+/,
    null /+EVENT_544+/,
    null /+EVENT_545+/,
    null /+EVENT_546+/,
    null /+EVENT_547+/,
    null /+EVENT_548+/,
    null /+EVENT_549+/,
    null /+EVENT_550+/,
    null /+EVENT_551+/,
    null /+EVENT_552+/,
    null /+EVENT_553+/,
    null /+EVENT_554+/,
    null /+EVENT_555+/,
    null /+EVENT_556+/,
    null /+EVENT_557+/,
    null /+EVENT_558+/,
    null /+EVENT_559+/,
    null /+EVENT_560+/,
    null /+EVENT_561+/,
    null /+EVENT_562+/,
    null /+EVENT_563+/,
    null /+EVENT_564+/,
    null /+EVENT_565+/,
    null /+EVENT_566+/,
    null /+EVENT_567+/,
    null /+EVENT_568+/,
    null /+EVENT_569+/,
    null /+EVENT_570+/,
    null /+EVENT_571+/,
    null /+EVENT_572+/,
    null /+EVENT_573+/,
    null /+EVENT_574+/,
    null /+EVENT_575+/,
    null /+EVENT_576+/,
    null /+EVENT_577+/,
    null /+EVENT_578+/,
    null /+EVENT_579+/,
    null /+EVENT_580+/,
    null /+EVENT_581+/,
    null /+EVENT_582+/,
    null /+EVENT_583+/,
    null /+EVENT_584+/,
    null /+EVENT_585+/,
    null /+EVENT_586+/,
    null /+EVENT_587+/,
    null /+EVENT_588+/,
    null /+EVENT_589+/,
    null /+EVENT_590+/,
    null /+EVENT_591+/,
    null /+EVENT_592+/,
    null /+EVENT_593+/,
    null /+EVENT_594+/,
    null /+EVENT_595+/,
    null /+EVENT_596+/,
    null /+EVENT_597+/,
    null /+EVENT_598+/,
    null /+EVENT_599+/,
    null /+EVENT_600+/,
    null /+EVENT_601+/,
    null /+EVENT_602+/,
    null /+EVENT_603+/,
    null /+EVENT_604+/,
    null /+EVENT_605+/,
    null /+EVENT_606+/,
    null /+EVENT_607+/,
    null /+EVENT_608+/,
    null /+EVENT_609+/,
    null /+EVENT_610+/,
    null /+EVENT_611+/,
    null /+EVENT_612+/,
    null /+EVENT_613+/,
    null /+EVENT_614+/,
    null /+EVENT_615+/,
    null /+EVENT_616+/,
    null /+EVENT_617+/,
    null /+EVENT_618+/,
    null /+EVENT_619+/,
    null /+EVENT_620+/,
    null /+EVENT_621+/,
    null /+EVENT_622+/,
    null /+EVENT_623+/,
    null /+EVENT_624+/,
    null /+EVENT_625+/,
    null /+EVENT_626+/,
    null /+EVENT_627+/,
    null /+EVENT_628+/,
    null /+EVENT_629+/,
    null /+EVENT_630+/,
    null /+EVENT_631+/,
    null /+EVENT_632+/,
    null /+EVENT_633+/,
    null /+EVENT_634+/,
    null /+EVENT_635+/,
    null /+EVENT_636+/,
    null /+EVENT_637+/,
    null /+EVENT_638+/,
    null /+EVENT_639+/,
    null /+EVENT_640+/,
    null /+EVENT_641+/,
    null /+EVENT_642+/,
    null /+EVENT_643+/,
    null /+EVENT_644+/,
    null /+EVENT_645+/,
    null /+EVENT_646+/,
    null /+EVENT_647+/,
    null /+EVENT_648+/,
    null /+EVENT_649+/,
    null /+EVENT_650+/,
    null /+EVENT_651+/,
    null /+EVENT_652+/,
    null /+EVENT_653+/,
    null /+EVENT_654+/,
    null /+EVENT_655+/,
    null /+EVENT_656+/,
    null /+EVENT_657+/,
    null /+EVENT_658+/,
    null /+EVENT_659+/,
    null /+EVENT_660+/,
    null /+EVENT_661+/,
    null /+EVENT_662+/,
    null /+EVENT_663+/,
    null /+EVENT_664+/,
    null /+EVENT_665+/,
    null /+EVENT_666+/,
    null /+EVENT_667+/,
    null /+EVENT_668+/,
    null /+EVENT_669+/,
    null /+EVENT_670+/,
    null /+EVENT_671+/,
    null /+EVENT_672+/,
    null /+EVENT_673+/,
    null /+EVENT_674+/,
    null /+EVENT_675+/,
    null /+EVENT_676+/,
    null /+EVENT_677+/,
    null /+EVENT_678+/,
    null /+EVENT_679+/,
    null /+EVENT_680+/,
    null /+EVENT_681+/,
    null /+EVENT_682+/,
    null /+EVENT_683+/,
    null /+EVENT_684+/,
    null /+EVENT_685+/,
    null /+EVENT_686+/,
    null /+EVENT_687+/,
    null /+EVENT_688+/,
    null /+EVENT_689+/,
    null /+EVENT_690+/,
    null /+EVENT_691+/,
    null /+EVENT_692+/,
    null /+EVENT_693+/,
    null /+EVENT_694+/,
    null /+EVENT_695+/,
    null /+EVENT_696+/,
    null /+EVENT_697+/,
    null /+EVENT_698+/,
    null /+EVENT_699+/,
    null /+EVENT_700+/,
    null /+EVENT_701+/,
    null /+EVENT_702+/,
    null /+EVENT_703+/,
    null /+EVENT_704+/,
    null /+EVENT_705+/,
    null /+EVENT_706+/,
    null /+EVENT_707+/,
    null /+EVENT_708+/,
    null /+EVENT_709+/,
    null /+EVENT_710+/,
    null /+EVENT_711+/,
    null /+EVENT_712+/,
    null /+EVENT_713+/,
    null /+EVENT_714+/,
    null /+EVENT_715+/,
    null /+EVENT_716+/,
    null /+EVENT_717+/,
    null /+EVENT_718+/,
    null /+EVENT_719+/,
    null /+EVENT_720+/,
    null /+EVENT_721+/,
    null /+EVENT_722+/,
    null /+EVENT_723+/,
    null /+EVENT_724+/,
    null /+EVENT_725+/,
    null /+EVENT_726+/,
    null /+EVENT_727+/,
    null /+EVENT_728+/,
    null /+EVENT_729+/,
    null /+EVENT_730+/,
    null /+EVENT_731+/,
    null /+EVENT_732+/,
    null /+EVENT_733+/,
    null /+EVENT_734+/,
    null /+EVENT_735+/,
    null /+EVENT_736+/,
    null /+EVENT_737+/,
    null /+EVENT_738+/,
    null /+EVENT_739+/,
    null /+EVENT_740+/,
    null /+EVENT_741+/,
    null /+EVENT_742+/,
    null /+EVENT_743+/,
    null /+EVENT_744+/,
    null /+EVENT_745+/,
    null /+EVENT_746+/,
    null /+EVENT_747+/,
    null /+EVENT_748+/,
    null /+EVENT_749+/,
    null /+EVENT_750+/,
    null /+EVENT_751+/,
    null /+EVENT_752+/,
    null /+EVENT_753+/,
    null /+EVENT_754+/,
    null /+EVENT_755+/,
    null /+EVENT_756+/,
    null /+EVENT_757+/,
    null /+EVENT_758+/,
    null /+EVENT_759+/,
    null /+EVENT_760+/,
    null /+EVENT_761+/,
    null /+EVENT_762+/,
    null /+EVENT_763+/,
    null /+EVENT_764+/,
    null /+EVENT_765+/,
    null /+EVENT_766+/,
    null /+EVENT_767+/,
    null /+EVENT_768+/,
    null /+EVENT_769+/,
    null /+EVENT_770+/,
    null /+EVENT_771+/,
    null /+EVENT_772+/,
    null /+EVENT_773+/,
    null /+EVENT_774+/,
    null /+EVENT_775+/,
    null /+EVENT_776+/,
    null /+EVENT_777+/,
    null /+EVENT_778+/,
    null /+EVENT_779+/,
    null /+EVENT_780+/,
    null /+EVENT_781+/,
    null /+EVENT_782+/,
    null /+EVENT_783+/,
    null /+EVENT_784+/,
    null /+EVENT_785+/,
    null /+EVENT_786+/,
    null /+EVENT_787+/,
    null /+EVENT_788+/,
    null /+EVENT_789+/,
    null /+EVENT_790+/,
    null /+EVENT_791+/,
    null /+EVENT_792+/,
    null /+EVENT_793+/,
    null /+EVENT_794+/,
    null /+EVENT_795+/,
    null /+EVENT_796+/,
    null /+EVENT_797+/,
    null /+EVENT_798+/,
    null /+EVENT_799+/,
    null /+EVENT_800+/,
    null /+EVENT_801+/,
    null /+EVENT_802+/,
    null /+EVENT_803+/,
    null /+EVENT_804+/,
    null /+EVENT_805+/,
    null /+EVENT_806+/,
    null /+EVENT_807+/,
    null /+EVENT_808+/,
    null /+EVENT_809+/,
    null /+EVENT_810+/,
    null /+EVENT_811+/,
    null /+EVENT_812+/,
    null /+EVENT_813+/,
    null /+EVENT_814+/,
    null /+EVENT_815+/,
    null /+EVENT_816+/,
    null /+EVENT_817+/,
    null /+EVENT_818+/,
    null /+EVENT_819+/,
    null /+EVENT_820+/,
    null /+EVENT_821+/,
    null /+EVENT_822+/,
    null /+EVENT_823+/,
    null /+EVENT_824+/,
    null /+EVENT_825+/,
    null /+EVENT_826+/,
    null /+EVENT_827+/,
    null /+EVENT_828+/,
    null /+EVENT_829+/,
    null /+EVENT_830+/,
    null /+EVENT_831+/,
    null /+EVENT_832+/,
    null /+EVENT_833+/,
    null /+EVENT_834+/,
    null /+EVENT_835+/,
    null /+EVENT_836+/,
    null /+EVENT_837+/,
    null /+EVENT_838+/,
    null /+EVENT_839+/,
    null /+EVENT_840+/,
    null /+EVENT_841+/,
    null /+EVENT_842+/,
    null /+EVENT_843+/,
    null /+EVENT_844+/,
    null /+EVENT_845+/,
    null /+EVENT_846+/,
    null /+EVENT_847+/,
    null /+EVENT_848+/,
    null /+EVENT_849+/,
    null /+EVENT_850+/,
    null /+EVENT_851+/,
    null /+EVENT_852+/,
    null /+EVENT_853+/,
    null /+EVENT_854+/,
    null /+EVENT_855+/,
    null /+EVENT_856+/,
    null /+EVENT_857+/,
    null /+EVENT_858+/,
    null /+EVENT_859+/,
    null /+EVENT_860+/,
    null /+EVENT_861+/,
    null /+EVENT_862+/,
    null /+EVENT_863+/,
    null /+EVENT_864+/,
    null /+EVENT_865+/,
    null /+EVENT_866+/,
    null /+EVENT_867+/,
    null /+EVENT_868+/,
    null /+EVENT_869+/,
    null /+EVENT_870+/,
    null /+EVENT_871+/,
    null /+EVENT_872+/,
    null /+EVENT_873+/,
    null /+EVENT_874+/,
    null /+EVENT_875+/,
    null /+EVENT_876+/,
    null /+EVENT_877+/,
    null /+EVENT_878+/,
    null /+EVENT_879+/,
    null /+EVENT_880+/,
    null /+EVENT_881+/,
    null /+EVENT_882+/,
    null /+EVENT_883+/,
    null /+EVENT_884+/,
    null /+EVENT_885+/,
    null /+EVENT_886+/,
    null /+EVENT_887+/,
    null /+EVENT_888+/,
    null /+EVENT_889+/,
    null /+EVENT_890+/,
    null /+EVENT_891+/,
    null /+EVENT_892+/,
    null /+EVENT_893+/,
    null /+EVENT_894+/,
];

/// $C40B51
void UnknownC40B51() {
    StopMusic();
    UnknownC08D79(1);
    SetBG3VRAMLocation(BGTileMapSize.normal, 0x4000, 0);
    TM_MIRROR = 4;
    UnknownC08726();
}

/// $C40B75
noreturn UnknownC40B75() {
    CopyToVram(0, 0xA00, 0, &Unknown7F0000[0]);
    CopyToVram(0, 0x800, 0x4000, &Unknown7F0000[0x4000]);
    memcpy(&palettes[0][0], &WarningPalette[0], 0x10);
    UnknownC0856B(0x18);
    FadeInWithMosaic(1, 1, 0);
    while (true) {}
}

/// $C40BE8
immutable ubyte[512] UnknownC40BE8 = [0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];

/// $C41A9E
short Decomp(const(void)*, void*);

/// $C41EFF
short UnknownC41EFF(short, short, short, short);

/// $C41FFF
FixedPoint1616 UnknownC41FFF(short arg1, short arg2) {
    short a;
    if (UnknownC4205D[((arg1 >> 8) & 0xFC) >> 2] == 0x100) {
        a = arg2;
    } else {
        a = UnknownC4213F(UnknownC4205D[((arg1 >> 8) & 0xFC) >> 2], arg2);
    }
    short a2;
    if (UnknownC420BD[((arg1 >> 8) & 0xFC)] == 0x100) {
        a2 = arg2;
    } else {
        a2 = UnknownC4213F(UnknownC420BD[((arg1 >> 8) & 0xFC)], arg2);
    }
    if ((((arg1 >> 8) & 0xFC) < 0x20) || (((arg1 >> 8) & 0xFC) >= 0x62)) {
        a2 = cast(short)-cast(int)a2;
    }
    if ((((arg1 >> 8) & 0xFC) >= 0x4C) && (((arg1 >> 8) & 0xFC) < 0x80)) {
        a = cast(short)-cast(int)a;
    }
    return FixedPoint1616(a2, a);
}

/// $C4205D
immutable ushort[48] UnknownC4205D = [
    0x0000,
    0x0019,
    0x0032,
    0x004A,
    0x0062,
    0x0079,
    0x008E,
    0x00A2,
    0x00B5,
    0x00C6,
    0x00D5,
    0x00E2,
    0x00EC,
    0x00F5,
    0x00FB,
    0x00FE,
    0x0100,
    0x00FE,
    0x00FB,
    0x00F5,
    0x00ED,
    0x00E2,
    0x00D5,
    0x00C6,
    0x00B5,
    0x00A2,
    0x008E,
    0x0079,
    0x0062,
    0x004A,
    0x0032,
    0x0019,
    0x0000,
    0x0019,
    0x0032,
    0x004A,
    0x0062,
    0x0079,
    0x008E,
    0x00A2,
    0x00B5,
    0x00C6,
    0x00D5,
    0x00E2,
    0x00EC,
    0x00F5,
    0x00FB,
    0x00FE,
];

/// $C420BD
immutable ushort[65] UnknownC420BD = [
    0x0100,
    0x00FE,
    0x00FB,
    0x00F5,
    0x00EC,
    0x00E2,
    0x00D5,
    0x00C6,
    0x00B5,
    0x00A3,
    0x008E,
    0x0079,
    0x0062,
    0x004B,
    0x0032,
    0x0019,
    0x0000,
    0x0019,
    0x0032,
    0x004A,
    0x0062,
    0x0079,
    0x008E,
    0x00A2,
    0x00B5,
    0x00C6,
    0x00D5,
    0x00E2,
    0x00EC,
    0x00F5,
    0x00FB,
    0x00FE,
    0x0100,
    0x00FE,
    0x00FB,
    0x00F5,
    0x00ED,
    0x00E2,
    0x00D5,
    0x00C6,
    0x00B5,
    0x00A2,
    0x008E,
    0x0079,
    0x0062,
    0x004A,
    0x0032,
    0x0019,
    0x0000,
    0x0019,
    0x0032,
    0x004A,
    0x0062,
    0x0079,
    0x008E,
    0x00A2,
    0x00B5,
    0x00C6,
    0x00D5,
    0x00E2,
    0x00EC,
    0x00F5,
    0x00FB,
    0x00FE,
    0x0100,
];

/// $C4213F
short UnknownC4213F(short arg1, short arg2) {
    return cast(short)((((arg2 & 0xFF00) >> 8) * (arg1 & 0xFF)) + ((arg2 & 0xFF) * (arg1 & 0xFF) >> 8));
}

/// $C426ED
void UnknownC426ED() {
    for (short i = 0; i != 0x200; i += 2) {
        Unknown7F0000[0x800 + i] += Unknown7F0000[0x200 + i];
        Unknown7F0000[0x800 + i + 1] += Unknown7F0000[0x200 + i + 1];
        ushort a = (cast(ushort*)&Unknown7F0000[0x800 + i])[0];
        if ((a & 0x8000) != 0) {
            Unknown7F0000[0x200 + i] = 0;
            Unknown7F0000[0x200 + i + 1] = 0;
            a = 0;
        } else {
            a &= 0x1F00;
            if (a == 0x1F00) {
                Unknown7F0000[0x200 + i] = 0;
                Unknown7F0000[0x200 + i + 1] = 0;
                a = 0x1F00;
            }
        }
        a = ((a & 0xFF) << 8) | ((a >> 8) & 0xFF);
        Unknown7F0000[0xA00 + i] += Unknown7F0000[0x400 + i];
        Unknown7F0000[0xA00 + i + 1] += Unknown7F0000[0x400 + i + 1];
        ushort a2 = (cast(ushort*)&Unknown7F0000[0xA00 + i])[0];
        if ((a2 & 0x8000) != 0) {
            Unknown7F0000[0x400 + i] = 0;
            Unknown7F0000[0x400 + i + 1] = 0;
            a2 = 0;
        } else {
            a2 &= 0x1F00;
            if (a2 == 0x1F00) {
                Unknown7F0000[0x400 + i] = 0;
                Unknown7F0000[0x400 + i + 1] = 0;
                a2 = 0x1F00;
            }
        }
        a = cast(ushort)((a2 >> 3) | a);
        Unknown7F0000[0xC00 + i] += Unknown7F0000[0x600 + i];
        Unknown7F0000[0xC00 + i + 1] += Unknown7F0000[0x600 + i + 1];
        a2 = (cast(ushort*)&Unknown7F0000[0xC00 + i])[0];
        if ((a2 & 0x8000) != 0) {
            Unknown7F0000[0x400 + i] = 0;
            Unknown7F0000[0x400 + i + 1] = 0;
            a2 = 0;
        } else {
            a2 &= 0x1F00;
            if (a2 == 0x1F00) {
                Unknown7F0000[0x600 + i] = 0;
                Unknown7F0000[0x600 + i + 1] = 0;
                a2 = 0x1F00;
            }
        }
        (cast(ushort*)&palettes)[i / 2] = cast(ushort)((a2 << 2) | a);
    }
    Unknown7E0030 = 0x18;
}

/// $C429E8
void UnknownC429E8(short channel) {
    //segmented addressing stuff
    //DMAChannels[channel].A1B = 0x7E;
    //DMAChannels[channel].DASB = 0x7E;
    DMAChannels[channel].BBAD = 0x2C;
    DMAChannels[channel].DMAP = DMATransferUnit.Word;
    DMAChannels[channel].A1T = &Unknown7EADB8[0];
    HDMAEN_MIRROR |= DMAFlags[channel];

}

/// $C42A1F
immutable short[17] UnknownC42A1F = [
    0x0008,
    0x0008,
    0x000C,
    0x0010,
    0x0018,
    0x0008,
    0x000C,
    0x0008,
    0x0010,
    0x0018,
    0x000C,
    0x0008,
    0x0010,
    0x0018,
    0x0020,
    0x0020,
    0x0020,
];

/// $C42A41
immutable short[17] UnknownC42A41 = [
    0x0008,
    0x0008,
    0x0008,
    0x0008,
    0x0008,
    0x0018,
    0x0018,
    0x0018,
    0x0018,
    0x0018,
    0x0020,
    0x0028,
    0x0028,
    0x0028,
    0x0028,
    0x0038,
    0x0048,
];

/// $C42AEB
immutable short[17] UnknownC42AEB = [
    0x000A,
    0x0000,
    0x000A,
    0x000A,
    0x000A,
    0x0018,
    0x0018,
    0x0018,
    0x0010,
    0x0010,
    0x0000,
    0x0028,
    0x0020,
    0x0020,
    0x0020,
    0x0000,
    0x0041,
];

/// $C42B0D
immutable UnknownC42B0DEntry[17] UnknownC42B0D = [
    UnknownC42B0DEntry(1, 0, [
            [UnknownC42B0DSubEntry(0xF8, 0x00, 0x00, 0xF8, 0x80), UnknownC42B0DSubEntry(0xF8, 0x00, 0x40, 0xF8, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(1, 0, [
            [UnknownC42B0DSubEntry(0xF8, 0x00, 0x00, 0xF8, 0x80), UnknownC42B0DSubEntry(0xF8, 0x00, 0x40, 0xF8, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(2, 0, [
            [UnknownC42B0DSubEntry(0xF8, 0x00, 0x00, 0xF4, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x00, 0x04, 0x80)],
            [UnknownC42B0DSubEntry(0xF8, 0x00, 0x40, 0xFC, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x40, 0xEC, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(2, 0, [
            [UnknownC42B0DSubEntry(0xF8, 0x00, 0x00, 0xF0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x00, 0x00, 0x80)],
            [UnknownC42B0DSubEntry(0xF8, 0x00, 0x40, 0x00, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x40, 0xF0, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(3, 0, [
            [UnknownC42B0DSubEntry(0xF8, 0x00, 0x00, 0xE8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x00, 0xF8, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x04, 0x00, 0x08, 0x80), UnknownC42B0DSubEntry(0xF8, 0x00, 0x40, 0x08, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x02, 0x40, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x04, 0x40, 0xE8, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(2, 1, [
            [UnknownC42B0DSubEntry(0xE8, 0x00, 0x00, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x00, 0xF8, 0x80)],
            [UnknownC42B0DSubEntry(0xE8, 0x00, 0x40, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x40, 0xF8, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(4, 2, [
            [UnknownC42B0DSubEntry(0xE8, 0x00, 0x00, 0xF4, 0x00), UnknownC42B0DSubEntry(0xE8, 0x02, 0x00, 0x04, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x04, 0x00, 0xF4, 0x00), UnknownC42B0DSubEntry(0xF8, 0x06, 0x00, 0x04, 0x80)],
            [UnknownC42B0DSubEntry(0xE8, 0x00, 0x40, 0xFC, 0x00), UnknownC42B0DSubEntry(0xE8, 0x02, 0x40, 0xEC, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x04, 0x40, 0xFC, 0x00), UnknownC42B0DSubEntry(0xF8, 0x06, 0x40, 0xEC, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(2, 1, [
            [UnknownC42B0DSubEntry(0xE8, 0x00, 0x00, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x00, 0xF8, 0x80)],
            [UnknownC42B0DSubEntry(0xE8, 0x00, 0x40, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x02, 0x40, 0xF8, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(4, 2, [
            [UnknownC42B0DSubEntry(0xE8, 0x00, 0x00, 0xF0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x02, 0x00, 0x00, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x04, 0x00, 0xF0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x06, 0x00, 0x00, 0x80)],
            [UnknownC42B0DSubEntry(0xE8, 0x00, 0x40, 0x00, 0x00), UnknownC42B0DSubEntry(0xE8, 0x02, 0x40, 0xF0, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x04, 0x40, 0x00, 0x00), UnknownC42B0DSubEntry(0xF8, 0x06, 0x40, 0xF0, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(6, 3, [
            [UnknownC42B0DSubEntry(0xE8, 0x00, 0x00, 0xE8, 0x00), UnknownC42B0DSubEntry(0xE8, 0x02, 0x00, 0xF8, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x04, 0x00, 0x08, 0x00), UnknownC42B0DSubEntry(0xF8, 0x06, 0x00, 0xE8, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x08, 0x00, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x0A, 0x00, 0x08, 0x80)],
            [UnknownC42B0DSubEntry(0xE8, 0x00, 0x40, 0x08, 0x00), UnknownC42B0DSubEntry(0xE8, 0x02, 0x40, 0xF8, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x04, 0x40, 0xE8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x06, 0x40, 0x08, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x08, 0x40, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x0A, 0x40, 0xE8, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(6, 4, [
            [UnknownC42B0DSubEntry(0xE0, 0x00, 0x00, 0xF4, 0x00), UnknownC42B0DSubEntry(0xE0, 0x02, 0x00, 0x04, 0x00)],
            [UnknownC42B0DSubEntry(0xF0, 0x04, 0x00, 0xF4, 0x00), UnknownC42B0DSubEntry(0xF0, 0x06, 0x00, 0x04, 0x00)],
            [UnknownC42B0DSubEntry(0x00, 0x08, 0x00, 0xF4, 0x00), UnknownC42B0DSubEntry(0x00, 0x0A, 0x00, 0x04, 0x80)],
            [UnknownC42B0DSubEntry(0xE0, 0x00, 0x40, 0xFC, 0x00), UnknownC42B0DSubEntry(0xE0, 0x02, 0x40, 0xEC, 0x00)],
            [UnknownC42B0DSubEntry(0xF0, 0x04, 0x40, 0xFC, 0x00), UnknownC42B0DSubEntry(0xF0, 0x06, 0x40, 0xEC, 0x00)],
            [UnknownC42B0DSubEntry(0x00, 0x08, 0x40, 0xFC, 0x00), UnknownC42B0DSubEntry(0x00, 0x0A, 0x40, 0xEC, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(3, 2, [
            [UnknownC42B0DSubEntry(0xD8, 0x00, 0x00, 0xF8, 0x00), UnknownC42B0DSubEntry(0xE8, 0x02, 0x00, 0xF8, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x04, 0x00, 0xF8, 0x80), UnknownC42B0DSubEntry(0xD8, 0x00, 0x40, 0xF8, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x02, 0x40, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x04, 0x40, 0xF8, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(6, 4, [
            [UnknownC42B0DSubEntry(0xD8, 0x00, 0x00, 0xF0, 0x00), UnknownC42B0DSubEntry(0xD8, 0x02, 0x00, 0x00, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x04, 0x00, 0xF0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x06, 0x00, 0x00, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x08, 0x00, 0xF0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x0A, 0x00, 0x00, 0x80)],
            [UnknownC42B0DSubEntry(0xD8, 0x00, 0x40, 0x00, 0x00), UnknownC42B0DSubEntry(0xD8, 0x02, 0x40, 0xF0, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x04, 0x40, 0x00, 0x00), UnknownC42B0DSubEntry(0xE8, 0x06, 0x40, 0xF0, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x08, 0x40, 0x00, 0x00), UnknownC42B0DSubEntry(0xF8, 0x0A, 0x40, 0xF0, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(9, 6, [
            [UnknownC42B0DSubEntry(0xD8, 0x00, 0x00, 0xE8, 0x00), UnknownC42B0DSubEntry(0xD8, 0x02, 0x00, 0xF8, 0x00)],
            [UnknownC42B0DSubEntry(0xD8, 0x04, 0x00, 0x08, 0x00), UnknownC42B0DSubEntry(0xE8, 0x06, 0x00, 0xE8, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x08, 0x00, 0xF8, 0x00), UnknownC42B0DSubEntry(0xE8, 0x0A, 0x00, 0x08, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x0C, 0x00, 0xE8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x0E, 0x00, 0xF8, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x10, 0x00, 0x08, 0x80), UnknownC42B0DSubEntry(0xD8, 0x00, 0x40, 0x08, 0x00)],
            [UnknownC42B0DSubEntry(0xD8, 0x02, 0x40, 0xF8, 0x00), UnknownC42B0DSubEntry(0xD8, 0x04, 0x40, 0xE8, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x06, 0x40, 0x08, 0x00), UnknownC42B0DSubEntry(0xE8, 0x08, 0x40, 0xF8, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x0A, 0x40, 0xE8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x0C, 0x40, 0x08, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x0E, 0x40, 0xF8, 0x00), UnknownC42B0DSubEntry(0xF8, 0x10, 0x40, 0xE8, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(12, 8, [
            [UnknownC42B0DSubEntry(0xD8, 0x00, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xD8, 0x02, 0x00, 0xF0, 0x00)],
            [UnknownC42B0DSubEntry(0xD8, 0x04, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xD8, 0x06, 0x00, 0x10, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x08, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x0A, 0x00, 0xF0, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x0C, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xE8, 0x0E, 0x00, 0x10, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x10, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x12, 0x00, 0xF0, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x14, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xF8, 0x16, 0x00, 0x10, 0x80)],
            [UnknownC42B0DSubEntry(0xD8, 0x00, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xD8, 0x02, 0x40, 0x00, 0x00)],
            [UnknownC42B0DSubEntry(0xD8, 0x04, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xD8, 0x06, 0x40, 0xE0, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x08, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xE8, 0x0A, 0x40, 0x00, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x0C, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x0E, 0x40, 0xE0, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x10, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xF8, 0x12, 0x40, 0x00, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x14, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x16, 0x40, 0xE0, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(16, 8, [
            [UnknownC42B0DSubEntry(0xC8, 0x00, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xC8, 0x02, 0x00, 0xF0, 0x00)],
            [UnknownC42B0DSubEntry(0xC8, 0x04, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xC8, 0x06, 0x00, 0x10, 0x00)],
            [UnknownC42B0DSubEntry(0xD8, 0x08, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xD8, 0x0A, 0x00, 0xF0, 0x00)],
            [UnknownC42B0DSubEntry(0xD8, 0x0C, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xD8, 0x0E, 0x00, 0x10, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x10, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x12, 0x00, 0xF0, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x14, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xE8, 0x16, 0x00, 0x10, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x18, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x1A, 0x00, 0xF0, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x1C, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xF8, 0x1E, 0x00, 0x10, 0x80)],
            [UnknownC42B0DSubEntry(0xC8, 0x00, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xC8, 0x02, 0x40, 0x00, 0x00)],
            [UnknownC42B0DSubEntry(0xC8, 0x04, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xC8, 0x06, 0x40, 0xE0, 0x00)],
            [UnknownC42B0DSubEntry(0xD8, 0x08, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xD8, 0x0A, 0x40, 0x00, 0x00)],
            [UnknownC42B0DSubEntry(0xD8, 0x0C, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xD8, 0x0E, 0x40, 0xE0, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x10, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xE8, 0x12, 0x40, 0x00, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x14, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x16, 0x40, 0xE0, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x18, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xF8, 0x1A, 0x40, 0x00, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x1C, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x1E, 0x40, 0xE0, 0x80)],
        ]
    ),
    UnknownC42B0DEntry(20, 8, [
            [UnknownC42B0DSubEntry(0xB8, 0x00, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xB8, 0x02, 0x00, 0xF0, 0x00)],
            [UnknownC42B0DSubEntry(0xB8, 0x04, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xB8, 0x06, 0x00, 0x10, 0x00)],
            [UnknownC42B0DSubEntry(0xC8, 0x08, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xC8, 0x0A, 0x00, 0xF0, 0x00)],
            [UnknownC42B0DSubEntry(0xC8, 0x0C, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xC8, 0x0E, 0x00, 0x10, 0x00)],
            [UnknownC42B0DSubEntry(0xD8, 0x10, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xD8, 0x12, 0x00, 0xF0, 0x00)],
            [UnknownC42B0DSubEntry(0xD8, 0x14, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xD8, 0x16, 0x00, 0x10, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x18, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x1A, 0x00, 0xF0, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x1C, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xE8, 0x1E, 0x00, 0x10, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x20, 0x00, 0xE0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x22, 0x00, 0xF0, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x24, 0x00, 0x00, 0x00), UnknownC42B0DSubEntry(0xF8, 0x26, 0x00, 0x10, 0x80)],
            [UnknownC42B0DSubEntry(0xB8, 0x00, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xB8, 0x02, 0x40, 0x00, 0x00)],
            [UnknownC42B0DSubEntry(0xB8, 0x04, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xB8, 0x06, 0x40, 0xE0, 0x00)],
            [UnknownC42B0DSubEntry(0xC8, 0x08, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xC8, 0x0A, 0x40, 0x00, 0x00)],
            [UnknownC42B0DSubEntry(0xC8, 0x0C, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xC8, 0x0E, 0x40, 0xE0, 0x00)],
            [UnknownC42B0DSubEntry(0xD8, 0x10, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xD8, 0x12, 0x40, 0x00, 0x00)],
            [UnknownC42B0DSubEntry(0xD8, 0x14, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xD8, 0x16, 0x40, 0xE0, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x18, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xE8, 0x1A, 0x40, 0x00, 0x00)],
            [UnknownC42B0DSubEntry(0xE8, 0x1C, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xE8, 0x1E, 0x40, 0xE0, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x20, 0x40, 0x10, 0x00), UnknownC42B0DSubEntry(0xF8, 0x22, 0x40, 0x00, 0x00)],
            [UnknownC42B0DSubEntry(0xF8, 0x24, 0x40, 0xF0, 0x00), UnknownC42B0DSubEntry(0xF8, 0x26, 0x40, 0xE0, 0x80)],
        ]
    )
];

/// $C42F45
void SetPartyTickCallbacks(short leaderEntityID, void function() leaderCallback, void function() partyCallback) {
    EntityTickCallbacks[leaderEntityID] = leaderCallback;
    for (int i = 6; i > 0; i--) {
        EntityTickCallbacks[leaderEntityID++] = partyCallback;
    }
}

/// $C42F8C
immutable ushort[88] UnknownC42F8C = [
    0x0000,
    0x0020,
    0x0040,
    0x0060,
    0x0080,
    0x00A0,
    0x00C0,
    0x00E0,
    0x0200,
    0x0220,
    0x0240,
    0x0260,
    0x0280,
    0x02A0,
    0x02C0,
    0x02E0,
    0x0400,
    0x0420,
    0x0440,
    0x0460,
    0x0480,
    0x04A0,
    0x04C0,
    0x04E0,
    0x0600,
    0x0620,
    0x0640,
    0x0660,
    0x0680,
    0x06A0,
    0x06C0,
    0x06E0,
    0x0800,
    0x0820,
    0x0840,
    0x0860,
    0x0880,
    0x08A0,
    0x08C0,
    0x08E0,
    0x0A00,
    0x0A20,
    0x0A40,
    0x0A60,
    0x0A80,
    0x0AA0,
    0x0AC0,
    0x0AE0,
    0x0C00,
    0x0C20,
    0x0C40,
    0x0C60,
    0x0C80,
    0x0CA0,
    0x0CC0,
    0x0CE0,
    0x0E00,
    0x0E20,
    0x0E40,
    0x0E60,
    0x0E80,
    0x0EA0,
    0x0EC0,
    0x0EE0,
    0x1000,
    0x1020,
    0x1040,
    0x1060,
    0x1080,
    0x10A0,
    0x10C0,
    0x10E0,
    0x1200,
    0x1220,
    0x1240,
    0x1260,
    0x1280,
    0x12A0,
    0x12C0,
    0x12E0,
    0x1400,
    0x1420,
    0x1440,
    0x1460,
    0x1480,
    0x14A0,
    0x14C0,
    0x14E0,
];

/// $C4303C
immutable ushort[88] UnknownC4303C = [
    0x0000,
    0x0002,
    0x0004,
    0x0006,
    0x0008,
    0x000A,
    0x000C,
    0x000E,
    0x0020,
    0x0022,
    0x0024,
    0x0026,
    0x0028,
    0x002A,
    0x002C,
    0x002E,
    0x0040,
    0x0042,
    0x0044,
    0x0046,
    0x0048,
    0x004A,
    0x004C,
    0x004E,
    0x0060,
    0x0062,
    0x0064,
    0x0066,
    0x0068,
    0x006A,
    0x006C,
    0x006E,
    0x0080,
    0x0082,
    0x0084,
    0x0086,
    0x0088,
    0x008A,
    0x008C,
    0x008E,
    0x00A0,
    0x00A2,
    0x00A4,
    0x00A6,
    0x00A8,
    0x00AA,
    0x00AC,
    0x00AE,
    0x00C0,
    0x00C2,
    0x00C4,
    0x00C6,
    0x00C8,
    0x00CA,
    0x00CC,
    0x00CE,
    0x00E0,
    0x00E2,
    0x00E4,
    0x00E6,
    0x00E8,
    0x00EA,
    0x00EC,
    0x00EE,
    0x0100,
    0x0102,
    0x0104,
    0x0106,
    0x0108,
    0x010A,
    0x010C,
    0x010E,
    0x0120,
    0x0122,
    0x0124,
    0x0126,
    0x0128,
    0x012A,
    0x012C,
    0x012E,
    0x0140,
    0x0142,
    0x0144,
    0x0146,
    0x0148,
    0x014A,
    0x014C,
    0x014E,
];

/// $C430EC
void VelocityStore() {
    for (short i = 0; i < 14; i++) {
        horizontalMovementSpeeds[i].down.combined = 0;
        horizontalMovementSpeeds[i].up.combined = 0;
        verticalMovementSpeeds[i].left.combined = 0;
        verticalMovementSpeeds[i].right.combined = 0;
        verticalMovementSpeeds[i].down.combined = 0;
        horizontalMovementSpeeds[i].right.combined = 0;

        verticalMovementSpeeds[i].up.combined = -defaultMovementSpeeds[i].combined;
        horizontalMovementSpeeds[i].left.combined = -defaultMovementSpeeds[i].combined;

        verticalMovementSpeeds[i].downLeft.combined = defaultMovementSpeedsDiagonal[i].combined;
        verticalMovementSpeeds[i].downRight.combined = defaultMovementSpeedsDiagonal[i].combined;
        horizontalMovementSpeeds[i].downRight.combined = defaultMovementSpeedsDiagonal[i].combined;
        horizontalMovementSpeeds[i].upRight.combined = defaultMovementSpeedsDiagonal[i].combined;

        verticalMovementSpeeds[i].upLeft.combined = -defaultMovementSpeedsDiagonal[i].combined;
        verticalMovementSpeeds[i].upRight.combined = -defaultMovementSpeedsDiagonal[i].combined;
        horizontalMovementSpeeds[i].downLeft.combined = -defaultMovementSpeedsDiagonal[i].combined;
        horizontalMovementSpeeds[i].upLeft.combined = -defaultMovementSpeedsDiagonal[i].combined;
    }
}

/// $C432B1
void UnknownC432B1() {
    for (short i = 0; i < 0x1E; i++) {
        EntitySurfaceFlags[i] = 0;
    }
    for (short i = 0; i < 6; i++) {
        for (short j = 0; j < 7; j++) {
            PartyCharacters[i].afflictions[j] = 0;
        }
    }
    gameState.partyStatus = 0;
}

/// $C43317
void UnknownC43317() {
    for (short i = 0; i < 6; i++) {
        ChosenFourPtrs[i] = &PartyCharacters[i];
    }
}

/// $C43568
void UnknownC43568() {
    WaitUntilNextFrame();
    UnknownC2DB3F();
}

/// $C436D7
void UnknownC436D7(short arg1, short arg2) {
    ushort* x0E  = &WindowStats[WindowTable[arg1]].tilemapBuffer[WindowStats[WindowTable[arg1]].width * arg2 * 2];
    for (short i = 0; i != WindowStats[WindowTable[arg1]].width * 2; i++) {
        *(x0E++) = 0x40;
    }
}

/// $C43739
void UnknownC43739(short arg1);

/// $C437B8
void UnknownC437B8(short arg1) {
    ushort* x14 = &WindowStats[WindowTable[arg1]].tilemapBuffer[0];
    ushort* x12 = &WindowStats[WindowTable[arg1]].tilemapBuffer[0];
    ushort* x04 = &WindowStats[WindowTable[arg1]].tilemapBuffer[WindowStats[WindowTable[arg1]].width * 2];
    for (short i = 0; i != WindowStats[WindowTable[arg1]].width * 2; i++) {
        UnknownC44AF7(*(x14++));
    }
    for (short i = 0; i != (WindowStats[WindowTable[arg1]].height - 2) * WindowStats[WindowTable[arg1]].width; i++) {
        *(x12++) = *(x04++);
    }
    UnknownC436D7(arg1, (WindowStats[WindowTable[arg1]].height / 2) - 1);
}

/// $C438B1
void PrintNewLine() {
    if (CurrentFocusWindow == -1) {
        return;
    }
    UnknownC45E96();
    if (WindowStats[WindowTable[CurrentFocusWindow]].font != 0) {
        UnknownC45E96();
    }
    if (WindowStats[WindowTable[CurrentFocusWindow]].text_y != (WindowStats[WindowTable[CurrentFocusWindow]].height / 2) - 1) {
        WindowStats[WindowTable[CurrentFocusWindow]].text_y++;
    }
    UnknownC437B8(CurrentFocusWindow);
    WindowStats[WindowTable[CurrentFocusWindow]].text_x = 0;
}

/// $C43B15 - Unknown, but looks like it resets the color of existing text in the focused window
void UnknownC43B15() {
    WinStat* x12 = &WindowStats[WindowTable[CurrentFocusWindow]];
    ushort* y = &x12.tilemapBuffer[x12.width * x12.text_y * 2];
    ushort x0E;
    for (x0E = cast(ushort)(x12.width - 1); y[x0E] == 0x40; x0E--) {}
    ushort x12_2 = x12.text_x;
    ushort* x = &y[x12_2];
    while (x12_2 < x0E) {
        x[0] &= (x[0] & 0x3FF) | x12.tileAttributes;
        x[x12.width] = (x[x12.width] & 0x3FF) | x12.tileAttributes;
        x++;
        x12_2++;
    }
}

/// $C43874
void UnknownC43874(short arg1, short arg2, short arg3) {
    UnknownC43CAA();
    WindowStats[WindowTable[arg1]].text_x = arg2;
    WindowStats[WindowTable[arg1]].text_y = arg3;
}

/// $C438A5
void UnknownC438A5(short arg1, short arg2) {
    UnknownC43874(CurrentFocusWindow, arg1, arg2);
}

/// $C43BB9 - Unknown, but looks like it prints optionally highlighted text
void UnknownC43BB9(short maxLength, short highlighted, ubyte* text) {
    if (WindowTable[CurrentFocusWindow] == -1) {
        return;
    }
    if ((CurrentFocusWindow != 0x18) && (CurrentFocusWindow != 0x19) && (CurrentFocusWindow != 0x14) && (CurrentFocusWindow != 0x24)) {
        return;
    }
    WinStat* x14 = &WindowStats[WindowTable[CurrentFocusWindow]];
    short x12 = WindowStats[WindowTable[CurrentFocusWindow]].tileAttributes;
    short x10 = WindowStats[WindowTable[CurrentFocusWindow]].text_x;
    ushort* x04 = &WindowStats[WindowTable[CurrentFocusWindow]].tilemapBuffer[WindowStats[WindowTable[CurrentFocusWindow]].text_y * WindowStats[WindowTable[CurrentFocusWindow]].width * 2 + x10];
    while ((*text != 0) && (maxLength != 0)) {
        if (*x04 == 0x40) {
            break;
        }
        if (highlighted != 0) {
            UnknownEF00E6(x04, x14.width, x12);
        } else {
            UnknownEF00BB(x04, x14.width, x12);
        }
        x10++;
        x04++;
        text++;
        maxLength--;
    }
    x14.text_x = x10;
    Unknown7E9622 = 0;
}

/// $C43CAA
void UnknownC43CAA() {
    if (++VWFTile > 0x33) {
        VWFTile = 0;
        VWFX = 0;
    } else {
        VWFX = cast(ushort)(VWFTile * 8);
    }
    Unknown7E9654 = 0;
    Unknown7E9652 = VWFX;
}

/// $C43CD2 - Set text position on focused window (for menu options)
void UnknownC43CD2(MenuOpt* opt, short x, short y) {
    UnknownC438A5F(x, y);
    if (opt.pixel_align != 0) {
        VWFX += opt.pixel_align;
        memset(&VWFBuffer[VWFTile][0], 0xFF, 0x20);
    }
    Unknown7E5E79 = 0;
}

/// $C43DDB
void UnknownC43DDB(MenuOpt* menuEntry) {
    UnknownC438A5F(menuEntry.text_x, menuEntry.text_y);
    UnknownC43F77(0x2F);
    UnknownC43CAA();
    if (menuEntry.pixel_align != 0) {
        UnknownC43CD2(menuEntry, menuEntry.text_x, menuEntry.text_y);
    }
}

immutable ubyte[0x400] UnknownC43915 = [0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00];

/// $C43D24
void UnknownC43D24(ushort arg1, short arg2) {
    UnknownC438A5F(arg1, arg2);
    if (Unknown7E5E72 == 0) {
        return;
    }
    VWFX += Unknown7E5E72;
    memset(&VWFBuffer[VWFTile][0], 0xFF, 0x20);
    Unknown7E5E73 = Unknown7E5E72;
    Unknown7E5E72 = 0;
}

/// $C43D75
void UnknownC43D75(ushort arg1, short arg2) {
    Unknown7E5E72 = cast(ubyte)(arg1 & 7);
    UnknownC43D24(arg1 / 8, arg2);
}

/// $C43F53
void UnknownC43F53() {
    for (short i = 0; i < 0x20; i++) {
        Unknown7E1AD6[i] = UnknownC20958[i];
    }
}

/// $C43F77
void UnknownC43F77(short arg1) {
    if (CurrentFocusWindow == -1) {
        return;
    }
    ushort* x0E = &WindowStats[WindowTable[CurrentFocusWindow]].tilemapBuffer[WindowStats[WindowTable[CurrentFocusWindow]].text_x * WindowStats[WindowTable[CurrentFocusWindow]].text_y];
    UnknownC44E4D(x0E[0]);
    UnknownC44E4D(x0E[WindowStats[WindowTable[CurrentFocusWindow]].width]);
    if (arg1 == 0x2F) {
        Unknown7E5E75 = 0;
    }
    UnknownC10BA1F(arg1);
    if (WindowTable[CurrentFocusWindow] != window_tail) {
        Unknown7E9623 = 1;
    }
    short x;
    if (Unknown7E964F == 2) {
        x = 1;
    } else if (Unknown7E964F == 3) {
        x = 0;
    } else {
        x = 0;
        if (BlinkingTriangleFlag == 0) {
            x = 1;
        }
    }
    if ((x != 0) && (Unknown7E9622 == 0) && (arg1 != 0x20)) {
        PlaySfx(Sfx.TextPrint);
    }
    if (Unknown7E9622 == 0) {
        for (short i = cast(short)(SelectedTextSpeed + 1); i != 0; i--) {
            Win_Tick();
        }
    }
}

/// $C445E1
void UnknownC445E1(Unknown7E96AAEntry*, const(ubyte)*);

/// $C44963
void UnknownC44963(short arg1) {
    switch (arg1) {
        case 1:
            CopyToVram(0, 0x1800, 0x7000, &Unknown7F0000[0x2000]);
            goto case;
        case 0:
            CopyToVram(0, 0x450, 0x6000, &Unknown7F0000[0]);
            CopyToVram(0, 0x60, 0x6278, &Unknown7F0000[0x4F0]);
            CopyToVram(0, 0xB0, 0x62F8, &Unknown7F0000[0x5F0]);
            CopyToVram(0, 0xA0, 0x6380, &Unknown7F0000[0x700]);
            CopyToVram(0, 0x10, 0x6400, &Unknown7F0000[0x800]);
            CopyToVram(0, 0x10, 0x6480, &Unknown7F0000[0x900]);
            break;
        case 2:
            CopyToVram(0, 0x450, 0x6000, &Unknown7F0000[0]);
            CopyToVram(0, 0x60, 0x6278, &Unknown7F0000[0x4F0]);
            CopyToVram(0, 0xB0, 0x62F8, &Unknown7F0000[0x5F0]);
            CopyToVram(0, 0xA0, 0x6380, &Unknown7F0000[0x700]);
            CopyToVram(0, 0x10, 0x6400, &Unknown7F0000[0x800]);
            CopyToVram(0, 0x10, 0x6480, &Unknown7F0000[0x900]);
            CopyToVram(0, 0x1800, 0x7000, &Unknown7F0000[0x2000]);
            break;
        default: break;
    }
}

/// $C44AD7
immutable ushort[16] UnknownC44AD7 = [
    0xFFFE,
    0xFFFD,
    0xFFFB,
    0xFFF7,
    0xFFEF,
    0xFFDF,
    0xFFBF,
    0xFF7F,
    0xFEFF,
    0xFDFF,
    0xFBFF,
    0xF7FF,
    0xEFFF,
    0xDFFF,
    0xBFFF,
    0x7FFF,
];

/// $C44AF7
void UnknownC44AF7(short arg1) {
    short x10 = arg1 & 0x3FF;
    if (UnknownC43915[x10] != 0) {
        return;
    }
    Unknown7E1AD6[x10 >> 4] &= UnknownC44AD7[x10 & 0xF];
}

/// $C44B3A
void RenderText(short width, short sizeof_tile, const(ubyte)* gfx_data) {
    short i;
    short new_vwftile;
    short pixel_x = VWFX & 7;
    ubyte* bufptr = &VWFBuffer[VWFTile][0];
    const(ubyte)* gfxptr = gfx_data;

    if (pixel_x == 0) { /* Is this the first time we're writing to this tile? */
        memset(bufptr, 0xFF, sizeof_tile*2);
    }

    bufptr++; /* Move to high byte */
    for (i = 0; i < sizeof_tile; i++) {
        *bufptr &= (((*gfxptr) ^ 255) >> pixel_x) ^ 255; /* Is this right? Don't know! */
        /* *bufptr &= arrEFC51B[pixel_x][*gfxptr]; */

        ++gfxptr;
        bufptr += 2;
    }

    VWFX += width;
    if (VWFX >= VWFBuffer.length*8) VWFX -= VWFBuffer.length*8;

    new_vwftile = VWFX >> 3;
    if (new_vwftile == VWFTile) return; /* Bail out if going to write on the same tile */

    /* Well, we're in a new tile now */
    VWFTile = new_vwftile;

    pixel_x = cast(short)(8 - pixel_x);
    bufptr = &VWFBuffer[VWFTile][0];
    gfxptr = gfx_data;

    memset(bufptr, 0xFF, sizeof_tile*2); /* We need to clear what was previously in this, now new, tile */
    if (pixel_x == 8) return;

    bufptr++; /* Move to high byte */
    for (i = 0; i < sizeof_tile; i++) {
        *bufptr = cast(ubyte)((((*gfxptr) ^ 255) << pixel_x) ^ 255); /* Is this right? Don't know! */
        /* *bufptr = arrEFCD1B[pixel_x][*gfxptr]; */

        ++gfxptr;
        bufptr += 2;
    }
}

/// $C44E44
void UnknownC44E44() {
    Unknown7E9654 = 0;
    Unknown7E9652 = 0;
}

/// $C44E4D
void UnknownC44E4D(short arg1) {
    if ((arg1 & 0x3FF) == 0x40) {
        return;
    }
    if ((arg1 & 0x3FF) == 0x00) {
        return;
    }
    UnknownC44AF7(arg1);
}

/// $C44FF3
short UnknownC44FF3(short arg1, short fontID, ubyte* arg3) {
    short result;
    for (short i = 0; i < arg1; i++) {
        // is this really what's happening? what's the point???
        result = cast(short)(Unknown7E5E6D + FontConfigTable[fontID].data[(*(arg3++) - 0x50) & 0x7F] + i);
    }
    return result;
}

/// $C4507A
void UnknownC4507A(uint* arg1) {
    ubyte[8] x12;
    if (CurrentFocusWindow == -1) {
        return;
    }
    ubyte Unknown7E5E75Copy = Unknown7E5E75;
    Unknown7E5E75 = 0;
    short x24 = UnknownC10C55(arg1);
    ubyte* x22 = &Unknown7E895A[7 - x24];
    ubyte* x20 = x22;
    short x1E = WindowStats[WindowTable[CurrentFocusWindow]].text_x;
    short x1C = WindowStats[WindowTable[CurrentFocusWindow]].text_y;
    short x04 = Unknown7E5E6D + FontConfigTable[WindowStats[WindowTable[CurrentFocusWindow]].font].data[4];

    for (short i = 0; i < x24; i++) {
        x12[i] = cast(ubyte)(*x22 + 0x60);
        x22++;
    }
    short x18 = cast(short)(x04 + UnknownC44FF3(x24, WindowStats[WindowTable[CurrentFocusWindow]].font, &x12[0]));
    x18 += Unknown7E5E6D;
    Unknown7E5E71 =1;
    UnknownC43D75(cast(short)((WindowStats[WindowTable[CurrentFocusWindow]].width - 1) * 8 - x18), WindowStats[WindowTable[CurrentFocusWindow]].text_y);
    PrintLetterF(0x54);
    while (x24 != 0) {
        PrintLetterF(*(x20++) + 0x60);
        x24--;
    }
    Unknown7E5E71 = 0;
    UnknownC438A5F(cast(short)(WindowStats[WindowTable[CurrentFocusWindow]].width - 1), WindowStats[WindowTable[CurrentFocusWindow]].text_y);
    UnknownC43F77(0x24);
    UnknownC438A5F(x1E, x1C);
    Unknown7E5E75 = Unknown7E5E75Copy;
}

/// $C45502
immutable ubyte[13] BattleBackRowText = EBString!13("the Back Row");

/// $C4562F
immutable ubyte[8] PowersOfTwo8Bit = [1 << 0, 1 << 1, 1 << 2, 1 << 3, 1 << 4, 1 << 5, 1 << 6, 1 << 7];

/// $C45637
ubyte FindItemInInventory(short arg1, short arg2) {
    for (int i = 0; i < 14; i++) {
        if (PartyCharacters[arg1 - 1].items[i] == arg2) {
            return cast(ubyte)arg1;
        }
    }
    return 0;
}

/// $C45683
ubyte FindItemInInventory2(short arg1, short arg2) {
    if (arg1 == 0xFF) {
        for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
            if (FindItemInInventory(gameState.partyMembers[i], arg2) != 0) {
                return gameState.partyMembers[i];
            }
        }
        return 0;
    } else {
        return FindItemInInventory(arg1, arg2);
    }
}

/// $C456E4
short FindInventorySpace(short arg1) {
    for (short i = 0; i < 14; i++) {
        if (PartyCharacters[arg1 - 1].items[i] == 0) {
            return arg1;
        }
    }
    return 0;
}

/// $C4577D
short FindInventorySpace2(short arg1) {
    if (arg1 == 0xFF) {
        for (short i = 0; i < gameState.playerControlledPartyMemberCount; i++) {
            if (FindInventorySpace(gameState.partyMembers[i] != 0)) {
                return gameState.partyMembers[i];
            }
        }
        return 0;
    } else {
        return FindInventorySpace(arg1);
    }
}

/// $C4577D
ubyte ChangeEquippedWeapon(ushort character, ubyte slot) {
    PartyCharacters[character - 1].equipment[EquipmentSlot.Weapon] = slot;
    RecalcCharacterPostmathOffense(character);
    RecalcCharacterPostmathGuts(character);
    RecalcCharacterMissRate(character);
    return PartyCharacters[character - 1].equipment[EquipmentSlot.Weapon];
}

/// $C457CA
ubyte ChangeEquippedBody(ushort character, ubyte slot) {
    PartyCharacters[character - 1].equipment[EquipmentSlot.Body] = slot;
    RecalcCharacterPostmathDefense(character);
    RecalcCharacterPostmathSpeed(character);
    CalcResistances(character);
    return PartyCharacters[character - 1].equipment[EquipmentSlot.Body];
}

/// $C45815
ubyte ChangeEquippedArms(ushort character, ubyte slot) {
    PartyCharacters[character - 1].equipment[EquipmentSlot.Arms] = slot;
    RecalcCharacterPostmathDefense(character);
    RecalcCharacterPostmathLuck(character);
    CalcResistances(character);
    return PartyCharacters[character - 1].equipment[EquipmentSlot.Arms];
}

/// $C45860
ubyte ChangeEquippedOther(ushort character, ubyte slot) {
    PartyCharacters[character - 1].equipment[EquipmentSlot.Other] = slot;
    RecalcCharacterPostmathDefense(character);
    RecalcCharacterPostmathLuck(character);
    CalcResistances(character);
    return PartyCharacters[character - 1].equipment[EquipmentSlot.Other];
}


// wrong name
immutable ushort[7][7] StatusEquipWindowText = [
    [0x0007, 0x0160, 0x0161, 0x0162, 0x0163, 0x0164, 0x0165],
    [0x0166, 0x0167, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
    [0x0168, 0x0169, 0x0007, 0x0007, 0x0007, 0x0000, 0x0000],
    [0x016A, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
    [0x0007, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
    [0x0007, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
    [0x0007, 0x0007, 0x0007, 0x0007, 0x0000, 0x0000, 0x0000]
];

// ditto
immutable ushort[7][7] StatusEquipWindowText2 = [
    [0x0020, 0x000D, 0x000E, 0x000F, 0x001D, 0x001E, 0x001F],
    [0x001C, 0x012F, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
    [0x000C, 0x013F, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
    [0x000B, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
    [0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
    [0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020],
    [0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0020, 0x0000]
];
// ditto
immutable ushort[7][7] StatusEquipWindowText3 = [
    [0x0002, 0x0006, 0x0006, 0x0006, 0x0006, 0x0006, 0x0006],
    [0x0006, 0x0006, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
    [0x0006, 0x0006, 0x0006, 0x0006, 0x0006, 0x0000, 0x0000],
    [0x0006, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
    [0x0004, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
    [0x0004, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000, 0x0000],
    [0x0004, 0x0004, 0x0004, 0x0004, 0x0000, 0x0000, 0x0000],
];

/// $C45E96
void UnknownC45E96() {
    while (DMATransferFlag != 0) {}
    for (short i =0; i < 0x20; i++) {
        Unknown7E9D23[i][0] = 0xFF;
    }
    VWFTile = 0;
    VWFX = 0;
    if (++Unknown7E9E27 >= 0x30) {
        Unknown7E9E27 = 0;
    }
    Unknown7E9E29 = 0;
    UnknownC44E44();
}

/// $C45F7B
ubyte randMod(ubyte arg1) {
    return cast(ubyte)(rand() % (arg1 + 1));
}

/// $C46028
short UnknownC46028(short arg1) {
    for (short i = 0; i < 0x1E; i++) {
        if (EntityTPTEntrySprites[i] == arg1) {
            return i;
        }
    }
    return -1;
}

/// $C4608C
short UnknownC4608C(short arg1) {
    if (arg1 == 0) {
        return gameState.currentPartyMembers;
    }
    for (short i = 0; i < 6; i++) {
        if (arg1 == gameState.unknown96[i]) {
            return gameState.unknownA2[i];
        }
    }
    return -1;
}

/// $C464B5
short CreatePreparedEntityNPC(short npcID, short actionScript) {
    short result = CreateEntity(NPCConfig[npcID].sprite, actionScript, -1, EntityPreparedXCoordinate, EntityPreparedYCoordinate);
    EntityDirections[result] = EntityPreparedDirection;
    EntityTPTEntries[result] = npcID;
    return result;
}

/// $C46507
short CreatePreparedEntitySprite(short sprite, short actionScript) {
    short result = CreateEntity(sprite, actionScript, -1, EntityPreparedXCoordinate, EntityPreparedYCoordinate);
    EntityDirections[result] = EntityPreparedDirection;
    return result;
}

/// $C46631
void UnknownC46631(short arg1) {
    if (arg1 != 0xFF) {
        short a = UnknownC4608C(arg1);
        if (a == -1) {
            return;
        }
        EntityTickCallbackFlags[a] &= (0xFFFF ^ (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED));
        return;
    }
    EntityTickCallbackFlags[23] &= 0x3FFF;
    for (short i = 0; i < gameState.partyCount; i++) {
        EntityTickCallbackFlags[gameState.unknownA2[i]] &= (0xFFFF ^ (OBJECT_TICK_DISABLED | OBJECT_MOVE_DISABLED));
    }
}

/// $C47370
void LoadBackgroundAnimation(short bg, short arg2) {
    UnknownC08726();
    UnknownC08D79(9);
    SetBG1VRAMLocation(BGTileMapSize.normal, 0x5800, 0x0000);
    SetBG2VRAMLocation(BGTileMapSize.normal, 0x5C00, 0x1000);
    LoadBattleBG(bg, arg2, 4);
    UnknownC08744();
}

/// $C474A8
void UnknownC474A8(short);

/// $C47C3F
//definitely need to check this one over
void LoadWindowGraphics() {
    Decomp(&TextWindowGraphics[0], &Unknown7F0000[0]);
    memcpy(&Unknown7F0000[0x2000], &Unknown7F0000[0x1000], 0x2A00);
    memset(&Unknown7F0000[0x3200], 0, 0x600);
    if (TextWindowProperties[gameState.textFlavour - 1].unknown == 8) {
        Decomp(&FlavouredTextGraphics[0], &Unknown7F0000[0x100]);
    }
    ushort* x24 = cast(ushort*)&Unknown7F0000[0x2A00];
    for (short i = 0; i < 4; i++) {
        VWFTile = 0;
        VWFX = 0;
        memset(&VWFBuffer[0][0], 0xFF, 0x340);
        Unknown7E9654 = 0;
        Unknown7E9652 = 0;
        ubyte* x0A = &PartyCharacters[i].name[0];
        VWFX = 2;
        for (short j = 0; x0A[0] != 0; j++) {
            RenderText(6, FontConfigTable[Font.Battle].width, &FontConfigTable[Font.Battle].graphics[FontConfigTable[Font.Battle].height * ((*x0A - 0x50) & 0x7F)]);
            x0A++;
        }
        for (short j = 0; j < 4; j++) {
            memcpy(&Unknown7F0000[0x2A00 + j * 16 + i * 64], &VWFBuffer[j][0], 0x10);
            memcpy(&Unknown7F0000[0x2A00 + j * 16 + i * 64 + 0x100], &VWFBuffer[j][16], 0x10);
        }
    }
    for (short i = 0; i < 0x20; i++) {
        ubyte* x1A = &Unknown7F0000[0x70];
        for (short j = 0; j < 8; j++) {
            x24[0] = (x24[0] & 0xFF00) | ((x24[0] >> 8) ^ 0xFF) | x1A[0];
            x24++;
            x1A++;
        }
    }
    ushort* x16 = cast(ushort*)&Unknown7F0000[0x2C00];

    for (const(ushort)* x24_2 = &StatusEquipWindowText2[0][0]; *x24_2 != 0; x24_2++) {
        if (*x24_2 == 0x20) {
            continue;
        }
        ushort* x0A = cast(ushort*)(&Unknown7F0000[(*x24_2 & 0xFFF0) + *x24_2]);
        ubyte* x1A = &Unknown7F0000[0x70];
        for (short i = 0; i < 8; i++) {
            x16[0] = (x0A[0] & 0xFF00) | ((x0A[0] >> 8) ^ 0xFF) | x1A[0];
            x16[0x100] = (x0A[0x100] & 0xFF00) | ((x0A[0x100] >> 8) ^ 0xFF) | x1A[0x100];
            x16++;
            x0A++;
            x1A += 2;
        }
    }
}

/// $C47F87
void UnknownC47F87() {
    switch(ChosenFourPtrs[gameState.playerControlledPartyMembers[gameState.playerControlledPartyMemberCount - 1]].afflictions[0]) {
        case 0:
        case 1:
            if (Unknown7EB4B6 != 0) {
                goto default;
            }
            memcpy(palettes.ptr, TextWindowDeathPalette.ptr, 0x40);
            break;
        default:
            memcpy(palettes.ptr, (cast(void*)TextWindowFlavourPalettes.ptr) + TextWindowProperties[gameState.textFlavour].offset, 0x40);
            break;
    }
    CurrentTextPalette[0] = 0;
    UnknownC0856B(8);
}

/// $C4800B
void UndrawFlyoverText() {
    SetBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
    UnknownC2038B();
    LoadWindowGraphics();
    UnknownC44963(2);
    UnknownC47F87();
    Unknown7E0030 = 0x18;
}

/// $C48ECE
short IsValidItemTransformation(short arg1) {
    if (LoadedItemTransformations[arg1].transformationCountdown != 0) {
        return 1;
    }
    if (LoadedItemTransformations[arg1].sfxFrequency != 0) {
        return 1;
    }
    return 0;
}

/// $C48EEB
void InitializeItemTransformation(short arg1) {
    if (IsValidItemTransformation(arg1) == 0) {
        Unknown7E9F2C = 0x3C;
        Unknown7E9F2A++;
    }
    LoadedItemTransformations[arg1].sfx = TimedItemTransformationTable[arg1].sfx;
    LoadedItemTransformations[arg1].sfxFrequency = TimedItemTransformationTable[arg1].sfxFrequency;
    LoadedItemTransformations[arg1].sfxCountdown = cast(ubyte)(TimedItemTransformationTable[arg1].sfxFrequency + randMod(2) - 1);
    LoadedItemTransformations[arg1].transformationCountdown = TimedItemTransformationTable[arg1].transformationTime;
}

/// $C48F98
void UnknownC48F98(short arg1) {
    if (IsValidItemTransformation(arg1) == 0) {
        return;
    }
    Unknown7E9F2A--;
    LoadedItemTransformations[arg1].sfxFrequency = 0;
    LoadedItemTransformations[arg1].transformationCountdown = 0;
}

/// $C48FC4
void ProcessItemTransformations() {
    if (BattleSwirlFlag + BattleSwirlCountdown != 0) {
        return;
    }
    if (Unknown7EB4B6 != 0) {
        return;
    }
    if (gameState.unknownB0 == 2) {
        return;
    }
    if (--Unknown7E9F2C != 0) {
        return;
    }
    Unknown7E9F2C = 0x3C;
    LoadedItemTransformation* x02 = LoadedItemTransformations.ptr;
    short x14 = 1;
    short x12 = 0;
    for (short i = 0; i < 4; i++) {
        if ((x14 != 0) && (x02.sfxFrequency != 0) && (x02.sfxCountdown-- == 0)) {
            x02.sfxCountdown = cast(ubyte)(x02.sfxFrequency + randMod(2) - 1);
            PlaySfx(x02.sfx);
            x14 = 0;
        }
        if (x02.transformationCountdown != 0) {
            if (x02.transformationCountdown-- == 0) {
                GiveItemToCharacter(TakeItemFromCharacter(0xFF, TimedItemTransformationTable[i].item), TimedItemTransformationTable[i].targetItem);
            }
        }
        x02++;
    }
}

/// $C490EE
short UnknownC490EE() {
    short x04 = UnknownC46028(0x178);
    if (x04 == -1) {
        return 0;
    }
    if (EntityAbsXTable[x04] < gameState.leaderX.integer - 0x40) {
        return 1;
    }
    if (EntityAbsXTable[x04] == gameState.leaderX.integer + 0x40) {
        if (EntityAbsYTable[x04] < gameState.leaderY.integer - 0x40) {
            return 1;
        }
        if (EntityAbsYTable[x04] > gameState.leaderY.integer + 0x40) {
            return 1;
        }
    } else {
        return 1;
    }
    short x10 = cast(short)(EntityAbsYTable[x04] - gameState.leaderY.integer);
    if (x10 < 0) {
        x10 = cast(short)-cast(int)x10;
    }
    short x12 = cast(short)(EntityAbsXTable[x04] - gameState.leaderX.integer);
    if (x12 < 0) {
        x12 = cast(short)-cast(int)x12;
    }
    if (x10 + x12 < 16) {
        return 10;
    }
    return ((UnknownC41EFF(gameState.leaderX.integer, gameState.leaderY.integer, EntityAbsXTable[x04], EntityAbsYTable[x04]) + 0x1000) / 0x2000) + 2;
}

immutable ubyte*[8] FlyoverTextPointers;

/// $C491EE
ushort UnknownC491EE(ushort arg1, ushort arg2, short arg3) {
    return cast(ushort)((arg2 - arg1) / arg3);
}

/// $C49209
void UnknownC49208(short arg1) {
    ushort* buf = cast(ushort*)(&Unknown7F0000[0]);
    ushort* x06 = &buf[0x3C00];
    for (short i = 0; i < 0x60; i++) {
        buf[0x3C80 + i] = UnknownC491EE(palettes[2][i] & 0x1F, x06[0] & 0x1F, arg1);
        buf[0x3D00 + i] = UnknownC491EE((palettes[2][i] & 0x3E0) >> 5, (x06[0] & 0x3E0) >> 5, arg1);
        buf[0x3D80 + i] = UnknownC491EE((palettes[2][i] & 0x7C00) >> 10, (x06[0] & 0x7C00) >> 10, arg1);

        buf[0x3E00 + i] = ((palettes[2][i] & 0x1F) << 8) & 0xFF00;
        buf[0x3E80 + i] = (palettes[2][i] & 0x3E0) << 3;
        buf[0x3F00 + i] = (palettes[2][i] & 0x7C00) >> 2;
        x06++;
    }
}

/// $C492D2
void UnknownC492D2() {
    ushort* x12 = &palettes[2][0];
    ushort* buf = cast(ushort*)&Unknown7F0000[0];
    for (short i = 0; i < 0x60; i++) {
        buf[0x3E00 + i * 2] += buf[0x3C80 + i * 2];
        buf[0x3E80 + i * 2] += buf[0x3D00 + i * 2];
        buf[0x3F00 + i * 2] += buf[0x3D80 + i * 2];
        x12[0] = ((buf[0x3E00 + i * 2] >> 8) & 0x1F) | (((buf[0x3E80 + i * 2] >> 8) & 0x1F) << 5) | (((buf[0x3F00 + i * 2] >> 8) & 0x1F) << 10);
        x12++;
    }
}

/// $C49496
ushort UnknownC49496(ushort arg1, short arg2) {
    ushort red;
    ushort green;
    ushort blue;
    if (arg2 < 0x32) {
        red = cast(ushort)((arg1 & 0x1F) * arg2 * 5);
        green = cast(ushort)(((arg1 >> 5) & 0x1F) * arg2 * 5);
        blue = cast(ushort)(((arg1 >> 10) & 0x1F) * arg2 * 5);
        if (red > 0x1E45) {
            red = 0x1F00;
        }
        if (green > 0x1E45) {
            green = 0x1F00;
        }
        if (blue > 0x1E45) {
            blue = 0x1F00;
        }
    } else if (arg2 != 0x32) {
        red = 0x1F00;
        green = 0x1F00;
        blue = 0x1F00;
    }
    return cast(ushort)(((red >> 8) & 0xFF) | (((green >> 8) & 0xFF) << 5) | (((blue >> 8) & 0xFF) << 10));
}

/// $C4954C
void UnknownC4954C(short arg1, ushort* arg2) {
    ushort* x06 = cast(ushort*)(&Unknown7F0000[0]);
    for (short i = 0; i < 0x100; i++) {
        *(x06++) = UnknownC49496(*(arg2++), arg1);
    }
}

/// $C4958E
void UnknownC4958E(short arg1, short arg2, ushort* arg3) {
    ushort* x06 = cast(ushort*)&Unknown7F0000[0];
    memset(&Unknown7F0000[0x200], 0, 0x1000);
    for (ubyte i = 0; i < 0x100; i += 16) {
        for (ubyte j = i; j < i + 16; j++) {
            ubyte x02;
            if ((arg2 & 1) != 0) {
                x02 = x06[j] & 0xFF;
            } else {
                x02 = arg3[j] & 0xFF;
                x06[j] = x02;
            }
            x06[0x200 + j] = UnknownC491EE(arg3[j] & 0x1F, x02 & 0x1F, arg1);
            x06[0x400 + j] = UnknownC491EE((arg3[j] & 0x3E0) >> 5, (x02 & 0x3E0) >> 5, arg1);
            x06[0x600 + j] = UnknownC491EE((arg3[j] & 0x7C00) >> 10, (x02 & 0x7C00) >> 10, arg1);
        }
        for (short j = i; j < i + 16; j++) {
            x06[0x400 + j] = ((arg3[j] & 0x1F) << 8) & 0xFF00;
            x06[0x500 + j] = (arg3[j] & 0x3E0) << 3;
            x06[0x600 + j] = (arg3[j] & 0x7C00) >> 2;
        }
        arg2 >>= 1;
    }
}

/// $C496E7
void UnknownC496E7(short arg1, short arg2) {
    UnknownC4958E(arg1, arg2, &palettes[0][0]);
}

/// $C496F9
void UnknownC496F9();

/// $C49740
void UnknownC49740() {
    memcpy(palettes.ptr, Unknown7F0000.ptr, 0x200);
    UnknownC0856B(0x18);
}

/// $C4984B
void UnknownC4984B() {
    ushort* x0E = cast(ushort*)&VWFBuffer[0][0];
    for (short i = 0x340; i != 0; i--) {
        x0E[0] ^= 0xFFFF;
        x0E++;
    }
}

/// $C49875
void UnknownC49875(ubyte arg1, ushort width, ubyte* buf, const(ubyte)* fontData) {
    ubyte* x02 = &buf[Unknown7E9F31];
    ubyte* x12 = x02;
    ubyte* x06 = buf;
    for (short i = 0; 2 > i; i++) {
        for (short j = 0; j < 8; j++) {
            *(x02 + 1) &= ((x06[0] ^ 0xFF) >> (Unknown7E9F2F % 8)) ^ 0xFF;
            *x02 = *(x02 + 1);
            x02 += 2;
            x06++;
        }
        x02 = &buf[Unknown7E9F31 + 0x1A0];
    }
    Unknown7E9F2F += arg1;
    if (Unknown7E9F2F / 8 == Unknown7E9F31) {
        return;
    }
    arg1 = cast(ubyte)((Unknown7E9F2F / 8) * 16);
    Unknown7E9F31 = arg1;
    for (short i = 0; 2 > i; i++) {
        for (short j = 0; j < 8; j++) {
            *(x02 + 1) &= ((x06[0] ^ 0xFF) << (8 - (Unknown7E9F2F % 8))) ^ 0xFF;
            *x02 = *(x02 + 1);
            x02 += 2;
            x06++;
        }
        x02 = &buf[arg1 + 0x1A0];
    }
}

/// $C4999B
void UnknownC4999B(ubyte arg1) {
    arg1 = (arg1 - 0x50) & 0x7F;
    const(ubyte)* x06 = &FontConfigTable[Font.Large].graphics[arg1 * FontConfigTable[Font.Large].height];
    ubyte x02 = cast(ubyte)(FontConfigTable[Font.Large].data[arg1] + 1);
    while (x02 > 8) {
        UnknownC49875(8, FontConfigTable[Font.Large].width, &VWFBuffer[0][0], x06);
        x02 -= 8;
        x06 += FontConfigTable[Font.Large].width;
    }
    UnknownC49875(x02, FontConfigTable[Font.Large].width, &VWFBuffer[0][0], x06);
}

/// $C49A56
void UnknownC49A56() {
    UnknownC08726();
    SetBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
    CopyToVram(3, 0x3800, 0x6000, &Unknown7F0000[0]);
    memcpy(&palettes[0][0], &MovementTextStringPalette[0], 8);
    Unknown7E0030 = 0x18;
    memset(&VWFBuffer[0][0], 0xFF, 0x680);
    ushort y = 0x10;
    for (short i = 0; i < 0x20; i++) {
        bg2Buffer[i * 32] = 0;
        bg2Buffer[i * 32 + 2] = 0;
        bg2Buffer[i * 32 + 4] = 0;
        for (short j = 0; j < 0x1D; j++) {
            bg2Buffer[i * 32 + j] = cast(ushort)(0x2000 + y);
            y++;
        }
        bg2Buffer[i * 32 + 58] = 0;
        bg2Buffer[i * 32 + 60] = 0;
        bg2Buffer[i * 32 + 62] = 0;
    }
    CopyToVram(0, 0x800, 0x7C00, cast(ubyte*)&bg2Buffer[0]);
    Unknown7E3C18 = 0x1A;
    Unknown7E3C1C = 0;
    Unknown7E3C1E = -1;
    Unknown7E3C20 = 0;
    Unknown7E3C14 = 0;
    Unknown7E3C16 = 0;
    Unknown7E9F2F = 0;
    Unknown7E9F31 = 0;
    UnknownC08744();
}

/// $C49B6E
void UnknownC49B6E(short arg1) {
    UnknownC4984B();
    if (Unknown7E9F2D * 0x1A0 + 0x4E0 > 0x3400) {
        if (0x3400 - Unknown7E9F2D * 0x1A0 != 0) {
            CopyToVram(0, cast(short)(0x3400 - Unknown7E9F2D * 0x1A0), cast(ushort)(0xD0 * Unknown7E9F2D + 0x6150), &VWFBuffer[0][0]);
        }
        if (Unknown7E9F2D * 0x1A0 + 0x4E0 - 0x3400 != 0) {
            //CopyToVram(0, Unknown7E9F2D * 0x1A0 + 0x4E0 - 0x3400, 0x6150, 0x6892 - Unknown7E9F2D * 0x1A0);
        }
    } else {
        CopyToVram(0, 0x4E0, cast(ushort)(0xD0 * Unknown7E9F2D + 0x6150), &VWFBuffer[0][0]);
    }
    Unknown7E3C1E = -1;
    Unknown7E3C20 = 0;
    WaitUntilNextFrame();
}

/// $C49C56
void UnknownC49C56(short arg1) {
    Unknown7E3C16 += arg1;
    Unknown7E3C14 = 0;
    Unknown7E9F2D += Unknown7E3C16 / 8 + 1;
    if (Unknown7E9F2D >= 0x20) {
        Unknown7E9F2D -= 0x20;
    }
    UnknownC08F8B();
    memset(&VWFBuffer[0][0], 0xFF, 0x680);
    Unknown7E3C16 &= 7;
    Unknown7E9F2F = 0;
    Unknown7E9F31 = 0;
}

/// $C49CA8
void UnknownC49CA8(ubyte arg1) {
    Unknown7E9F2F += arg1 + 8;
    Unknown7E9F31 = cast(short)((Unknown7E9F2F / 8) * 16);
}

/// $C49CC3
void UnknownC49CC3(ubyte arg1, short arg2) {
    ubyte* x06 = &PartyCharacters[arg1 - 1].name[0];
    for (short i = 0; (i < 5) && (x06[0] > 0x4F); i++) {
        UnknownC4999B(*(x06++));
    }
}

/// $C49D16
// seems weird, but mother 2 did make use of the other args
void UnknownC49D16(ubyte arg1, short, short) {
    UnknownC4999B(arg1);
}

/// $C49EC4
void UnknownC49EC4(short id) {
    ushort x02 = EntityTickCallbackFlags[23];
    EntityTickCallbackFlags[23] |= 0xC000;
    UnknownC49A56();
    immutable(ubyte)* x06 = FlyoverTextPointers[id];
    Unknown7E5E6E = 0;
    while (true) {
        switch(*(x06++)) {
            case 0:
                TM_MIRROR = 4;
                FadeInWithMosaic(1, 3, 0);
                for (short i = 0; i < 0xB4; i++) {
                    WaitUntilNextFrame();
                }
                FadeOutWithMosaic(1, 3, 0);
                TM_MIRROR = 0x17;
                ushort* buf = bg2Buffer.ptr;
                for (short i = 0x380; i != 0; i--) {
                    *(buf++) = 0;
                }
                Unknown7E5E6E = 0xFF;
                UnknownC08726();
                UndrawFlyoverText();
                EntityTickCallbackFlags[23] = x02;
                UnknownC08744();
                return;
            case 2:
                Unknown7E9F2D = *(x06++);
                break;
            case 9:
                UnknownC49B6E(0x18);
                WaitUntilNextFrame();
                UnknownC49C56(0x18);
                break;
            case 1:
                UnknownC49CA8(*(x06++));
                break;
            case 8:
                UnknownC49CC3(*(x06++), 0xC);
                break;
            default:
                UnknownC49D16(*(x06 - 1), 0, 0xC);
                break;
        }
    }
}

/// $C4A08D
immutable ushort[33] DeadTargettableActions = [
    BattleActions.PSILifeupAlpha,
    BattleActions.PSILifeupBeta,
    BattleActions.PSILifeupGamma,
    BattleActions.PSILifeupOmega,
    BattleActions.PSIHealingAlpha,
    BattleActions.PSIHealingBeta,
    BattleActions.PSIHealingGamma,
    BattleActions.PSIHealingOmega,
    BattleActions.Action135,
    BattleActions.Action136,
    BattleActions.Action137,
    BattleActions.Action138,
    BattleActions.Action139,
    BattleActions.HandAid,
    BattleActions.Action141,
    BattleActions.Action142,
    BattleActions.Action143,
    BattleActions.Action144,
    BattleActions.Action145,
    BattleActions.Action146,
    BattleActions.Action147,
    BattleActions.Action148,
    BattleActions.WetTowel,
    BattleActions.RefreshingHerb,
    BattleActions.SecretHerb,
    BattleActions.FullStatusHeal,
    BattleActions.Action153,
    BattleActions.Action154,
    BattleActions.Action155,
    BattleActions.Action156,
    BattleActions.Action157,
    BattleActions.Action158,
    0,
];

/// $C4A228
void UnknownC4A228(Battler* battler, short arg2) {
    for (short i = 0; i < Unknown7EAD56; i++) {
        if (Unknown7EAD7A[i] != arg2) {
            continue;
        }
        battler.currentTarget = cast(ubyte)(arg2 + 1);
        return;
    }
    for (short i = 0; i < Unknown7EAD58; i++) {
        if (Unknown7EAD82[i] != arg2) {
            continue;
        }
        battler.currentTarget = cast(ubyte)(i + Unknown7EAD56 + 1);
        return;
    }
}

/// $C4A228
immutable uint[32] PowersOfTwo32Bit = [
    1 << 0,
    1 << 1,
    1 << 2,
    1 << 3,
    1 << 4,
    1 << 5,
    1 << 6,
    1 << 7,
    1 << 8,
    1 << 9,
    1 << 10,
    1 << 11,
    1 << 12,
    1 << 13,
    1 << 14,
    1 << 15,
    1 << 16,
    1 << 17,
    1 << 18,
    1 << 19,
    1 << 20,
    1 << 21,
    1 << 22,
    1 << 23,
    1 << 24,
    1 << 25,
    1 << 26,
    1 << 27,
    1 << 28,
    1 << 29,
    1 << 30,
    1 << 31,
];

/// $C4A331
immutable ushort[22] GiygasDeathStaticTransitionDelays = [
    8 * 60,
    3 * 6,
    4 * 60,
    3 * 6,
    2 * 60,
    1 * 6,
    1 * 60,
    6 * 6,
    3 * 60,
    3 * 6,
    2 * 60,
    1 * 6,
    2 * 6,
    3 * 6,
    6 * 6,
    1 * 60,
    3 * 6,
    3 * 60,
    2 * 6,
    4 * 60,
    1 * 6,
    0
];

/// $C4A35D
immutable FinalGiygasPrayerNoiseEntry[13] FinalGiygasPrayerNoiseTable = [
        FinalGiygasPrayerNoiseEntry(Sfx.DoorOpen, 90),
        FinalGiygasPrayerNoiseEntry(Sfx.DoorOpen, 25),
        FinalGiygasPrayerNoiseEntry(Sfx.DoorClose, 90),
        FinalGiygasPrayerNoiseEntry(Sfx.DoorOpen, 25),
        FinalGiygasPrayerNoiseEntry(Sfx.DoorClose, 75),
        FinalGiygasPrayerNoiseEntry(Sfx.DoorOpen, 10),
        FinalGiygasPrayerNoiseEntry(Sfx.DoorOpen, 8),
        FinalGiygasPrayerNoiseEntry(Sfx.DoorOpen, 10),
        FinalGiygasPrayerNoiseEntry(Sfx.DoorClose, 6),
        FinalGiygasPrayerNoiseEntry(Sfx.DoorClose, 6),
        FinalGiygasPrayerNoiseEntry(Sfx.DoorClose, 6),
        FinalGiygasPrayerNoiseEntry(Sfx.DoorClose, 6),
        FinalGiygasPrayerNoiseEntry(Sfx.DoorClose, 0),
];

/// $C4A377
void UnknownC4A377() {
    UnknownC08D79(3);
    SetBG1VRAMLocation(BGTileMapSize.normal, 0x7800, 0);
    SetBG2VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
    Decomp(&BattleBGGraphicsPointers[animatedBackgrounds[295].graphics][0], &Unknown7F0000[0]);
    CopyToVram(0, 0x2000, 0x6000, &Unknown7F0000[0]);
    Decomp(&BattleBGArrangementPointers[animatedBackgrounds[295].graphics][0], &Unknown7F0000[0]);
    for (short i = 0; i < 0x800; i += 2) {
        Unknown7F0000[i + 1] = (Unknown7F0000[i + 1] & 0xDF) | 8;
    }
    CopyToVram(0, 0x800, 0x7C00, &Unknown7F0000[0]);
    UnknownC2CFE5(&LoadedBGDataLayer1, &animatedBackgrounds[295]);
    LoadedBGDataLayer1.PalettePointer = &palettes[2];
    memcpy(&LoadedBGDataLayer1.Palette[0], &BattleBGPalettePointers[animatedBackgrounds[295].palette][0], 0x20);
    memcpy(&LoadedBGDataLayer1.Palette2[0], &BattleBGPalettePointers[animatedBackgrounds[295].palette][0], 0x20);
    memcpy(&LoadedBGDataLayer1.PalettePointer[0], &LoadedBGDataLayer1.Palette[0], 0x20);
    LoadedBGDataLayer1.TargetLayer = 2;
    GenerateBattleBGFrame(&LoadedBGDataLayer1, 0);
    LoadedBGDataLayer2.TargetLayer = 0;
}

/// $C4A591
immutable byte[61] UnknownC4A591 = [
    0, 14, 23, 23, 12, -5, -18, -16, 0, 15, 12, -6, -14, 0, 13, 2, -11, 0, 10, -4, -7, 8, 0, -6, 7, -2, -3, 6, -5, 3, 0, -2, 3, -4, 4, -4, 4, -3, 3, -3, 3, -2, 2, -1, 0, 1, -2, 2, -1, -1, 2, -1, 0, 1, -1, -1, 1, 0, -1, 0, 1
];

/// $C4A5CE
immutable Unknown7EAECCEntry[2] UnknownC4A5CE = [
    Unknown7EAECCEntry(0x3D, 0x00, 0x0080, 0x0070, 0x0000, 0x0000, 0x0000, 0x0000, 0x00E0, 0x00B7, 0x0004, 0x0003),
    Unknown7EAECCEntry(0),
];

/// $C4A5FA
immutable Unknown7EAECCEntry[2] UnknownC4A5FA = [
    Unknown7EAECCEntry(0x64, 0x00, 0x0080, 0x0070, 0x0000, 0x0000, 0x0000, 0x0000, 0x00E0, 0x00B7, 0x0004, 0x0003),
    Unknown7EAECCEntry(0),
];

/// $C4A626
immutable Unknown7EAECCEntry[2] UnknownC4A626 = [
    Unknown7EAECCEntry(0x3D, 0x00, 0x0080, 0x0070, 0x8000, 0x8000, 0x0000, 0x0000, 0xFF20, 0xFF49, 0xFFFC, 0xFFFD),
    Unknown7EAECCEntry(0),
];

/// $C4A652
immutable Unknown7EAECCEntry[2] UnknownC4A652 = [
    Unknown7EAECCEntry(0x64, 0x00, 0x0080, 0x0070, 0x8000, 0x8000, 0x0000, 0x0000, 0xFF20, 0xFF49, 0xFFFC, 0xFFFD),
    Unknown7EAECCEntry(0),
];

/// $C4A67E
void UnknownC4A67E(short arg1, short arg2) {
    if ((arg2 & 2) != 0) {
        Unknown7EAEC6 = 1;
    } else {
        Unknown7EAEC6 = 0;
    }
    if ((arg2 & 1) != 0) {
        Unknown7EAEC7 = 1;
    } else {
        Unknown7EAEC7 = 0;
    }
    if ((arg2 & 4) != 0) {
        Unknown7EAEC8 = 32;
    } else {
        Unknown7EAEC8 = 31;
    }
    Unknown7EAEC2 = 1;
    Unknown7EAEC3 = SwirlPrimaryTable[arg1][0];
    Unknown7EAEC4 = SwirlPrimaryTable[arg1][2];
    Unknown7EAEC5 = SwirlPrimaryTable[arg1][1];
    if (Unknown7EAEC7 != 0) {
        Unknown7EAEC5 += Unknown7EAEC4;
    }
    Unknown7EAECC = null;
    if (arg1 == 0) {
        Unknown7EAECC = &UnknownC4A5CE[0];
    }
    Unknown7EAEC9 = 0;
    Unknown7EAECA = 0;
    Unknown7EAEC8 = 1;
    if ((arg2 & 0x80) != 0) {
        Unknown7EAEE4 = cast(ubyte)arg1;
        Unknown7EAEC3 = 4;
        Unknown7EAEE5 = 0;
        Unknown7EAEE6 = 6;
    } else {
        Unknown7EAEE4 = 0;
    }
    UnknownC0B0AA();
}

/// $C4A7B0
void UnknownC4A7B0() {
    if (Unknown7EAEC2 == 0) {
        return;
    }
    if (Unknown7EAECC != null) {
        if (--Unknown7EAEC2 == 0)  {
            if (Unknown7EAECC.unknown0 == 0) {
                Unknown7EAECC = null;
                return;
            }
            if (Unknown7EAECC.unknown2 != 0x8000) {
                Unknown7EAED0 = Unknown7EAECC.unknown2;
            }
            if (Unknown7EAECC.unknown4 != 0x8000) {
                Unknown7EAED2 = Unknown7EAECC.unknown4;
            }
            if (Unknown7EAECC.unknown6 != 0x8000) {
                Unknown7EAED4 = Unknown7EAECC.unknown6;
            }
            if (Unknown7EAECC.unknown8 != 0x8000) {
                Unknown7EAED6 = Unknown7EAECC.unknown8;
            }
            Unknown7EAED8 = Unknown7EAECC.unknown10;
            Unknown7EAEDA = Unknown7EAECC.unknown12;
            Unknown7EAEDC = Unknown7EAECC.unknown14;
            Unknown7EAEDE = Unknown7EAECC.unknown16;
            Unknown7EAEE0 = Unknown7EAECC.unknown18;
            Unknown7EAEE2 = Unknown7EAECC.unknown20;
            Unknown7EAECC++;
        }
        Unknown7EAED0 += Unknown7EAED8;
        Unknown7EAED2 += Unknown7EAEDA;
        Unknown7EAEDC += Unknown7EAEE0;
        Unknown7EAEDE += Unknown7EAEE2;
        if ((0 > Unknown7EAEDC) && (Unknown7EAED4 < -cast(int)Unknown7EAEDC)) {
            Unknown7EAED4 = 0;
        } else {
            Unknown7EAED4 += Unknown7EAEDC;
        }
        if ((0 > Unknown7EAEDE) && (Unknown7EAED6 < -cast(int)Unknown7EAEDE)) {
            Unknown7EAED6 = 0;
        } else {
            Unknown7EAED6 += Unknown7EAEDE;
        }
        if ((Unknown7EAED4 == 0) && (Unknown7EAED6 == 0)) {
            Unknown7EAEC2 = 0;
            Unknown7EAECC = null;
        }
        UnknownC0B149(Unknown7EAED0, Unknown7EAED2, (Unknown7EAED4 >> 8) & 0xFF, (Unknown7EAED6 >> 8) & 0xFF);
        UnknownC0B0EF(3, 0x41);
        SetWindowMask(Unknown7EAEC8, (Unknown7EAEC6 >> 8) & 0xFF);
        return;
    }

    if (--Unknown7EAEC2 != 0) {
        return;
    }
    while (true) { //pretty weird but I'm not sure how else to express this mass of branches
        if (Unknown7EAEC4 != 0) {
            Unknown7EAEC2 = Unknown7EAEC3;
            UnknownC0AE34(Unknown7EAEC9 + 3);
            Unknown7EAEC9++;
            Unknown7EAEC9 &= 1;
            if (Unknown7EAEC7 == 0) {
                UnknownC0B0B8(Unknown7EAEC9 + 3, &SwirlPointerTable[Unknown7EAEC5 + 1][0]);
            } else {
                UnknownC0B0B8(Unknown7EAEC9 + 3, &SwirlPointerTable[Unknown7EAEC5 - 1][0]);
            }
            SetWindowMask(Unknown7EAEC8, Unknown7EAEC6);
            Unknown7EAEC4--;
            return;
        }
        if (Unknown7EAEE4 != 0) {
            if (--Unknown7EAEE6 != 0) {
                Unknown7EAEC4 = SwirlPrimaryTable[Unknown7EAEE4][2];
                Unknown7EAEE6 = SwirlPrimaryTable[Unknown7EAEE4][1];
                if (Unknown7EAEC7 == 0) {
                    continue;
                }
                Unknown7EAEE6 += Unknown7EAEC4;
                continue;
            }
            switch (++Unknown7EAEE5) {
                case 1:
                    Unknown7EAEE6 = 7;
                    Unknown7EAEC3 = 3;
                    break;
                case 2:
                    Unknown7EAEE6 = 6;
                    Unknown7EAEC3 = 2;
                    break;
                case 3:
                    Unknown7EAEE6 = 12;
                    Unknown7EAEC3 = 1;
                    break;
                default: break;
            }
            if (Unknown7EAEE6 != 0) {
                continue;
            }
        }
        if (Unknown7EAECA != 0) {
            Unknown7EAEC2 = 1;
            Unknown7EAECA--;
            return;
        }
        break;
    }
    if (Unknown7EAECB == 0) {
        return;
    }
    UnknownC0AE34(Unknown7EAEC9 + 3);
    SetWindowMask(0, 0);
    UnknownC2DE96();
    SetColData(0, 0, 0);
    UnknownC0AFCD(Unknown7EAD8A);
}

/// $C4C2DE
void UnknownC4C2DE() {
    if (Unknown7E4DC4 == 0) {
        ChangeMusic(Music.YouLose);
        FadeOutWithMosaic(1, 1, 0);
    }
    Unknown7E4472 = 0;
    Unknown7E4474 = 0;
    Unknown7E9F2A = 0;
    UnknownC08D79(9);
    SetBG1VRAMLocation(BGTileMapSize.normal, 0x5800, 0);
    SetBG3VRAMLocation(BGTileMapSize.normal, 0x7C00, 0x6000);
    Decomp(&UnknownE1CFAF[0], &Unknown7F0000[0]);
    if (gameState.partyMembers[0] == 3) {
        CopyToVram(0, 0x8000, 0, &Unknown7F8000[0]);
    } else {
        CopyToVram(0, 0x8000, 0, &Unknown7F0000[0]);
    }
    Decomp(&UnknownE1D5E8[0], &Unknown7F0000[0]);
    CopyToVram(0, 0x800, 0x5800, &Unknown7F0000[0]);
    Decomp(&UnknownE1D4F4[0], cast(ubyte*)&palettes[0][0]);
    memcpy(&palettes[7][0], &palettes[0][0], 0x20);
    memset(&palettes[1][0], 0, 0xC0);
    memcpy(&palettes[2][0], &palettes[7][0], 0x20);
    UnknownC200D9();
    LoadWindowGraphics();
    UnknownC44963(1);
    UnknownC47F87();
    UnknownC0856B(0x18);
    TM_MIRROR = 5;
    Unknown7E4DC4 = 0;
    BG2_Y_POS = 0;
    BG2_X_POS = 0;
    BG1_X_POS = 0;
    BG1_X_POS = 0;
    FadeIn(1, 1);
    UnknownC0888B();
}

/// $C4C45F
void UnknownC4C45F(short arg1) {
    memcpy(&Unknown7F0000[0x7800], &palettes[2][0], 0xC0);
    memcpy(&Unknown7F0000[0x7800 + (arg1 << 5)], &palettes[7][0], 0x20);
    memcpy(&Unknown7F0000[0x7800 + ((arg1 - 1) << 5)], &palettes[6][0], 0x20);
}

/// $C4C519
short UnknownC4C519(short arg1, short arg2) {
    UnknownC4C45F(arg1);
    UnknownC49208(arg2);
    while (arg2 != 0) {
        if (pad_press[0] != 0) {
            return -1;
        }
        UnknownC492D2();
        WaitUntilNextFrame();
        arg2--;
    }
    memcpy(&palettes[2][0], &Unknown7F0000[0x7800], 0xC0);
    return 0;
}

/// $C4C567
short SkippablePause(short arg1) {
    while (arg1 != 0) {
        if (pad_press[0] != 0) {
            return -1;
        }
        WaitUntilNextFrame();
        arg1--;
    }
    return 0;
}

/// $C4C58F
void UnknownC4C58F(short arg1) {
    UnknownC4954C(0x64, &palettes[0][0]);
    UnknownC496E7(arg1, -1);
    for (short i = 0; i < arg1; i++) {
        UnknownC426ED();
        WaitUntilNextFrame();
    }
    memset(&palettes[0][0], 0xFF, 0x200);
    UnknownC0856B(0x18);
    WaitUntilNextFrame();
}

/// $C4C60E
void UnknownC4C60E(short arg1) {
    UnknownC496E7(arg1, -1);
    for (short i = 0; i < arg1; i++) {
        UnknownC426ED();
        OAMClear();
        UnknownC09466();
        UpdateScreen();
        WaitUntilNextFrame();
    }
    UnknownC49740();
}

/// $C4C64D
short UnknownC4C64D() {
    SkippablePause(0x3C);
    DisplayText(TextGameOver);
    UnknownC1DD5F();
    if (getEventFlag(EventFlag.NoContinueSelected) == 0) {
        SkippablePause(0x3C);
        return -1;
    }
    if (SkippablePause(0x3C) != 0) {
        return 0;
    }
    if (UnknownC4C519(1, 0x5A) != 0) {
        return 0;
    }
    if (SkippablePause(1) != 0) {
        return 0;
    }
    if (UnknownC4C519(2, 0x5A) != 0) {
        return 0;
    }
    if (SkippablePause(1) != 0) {
        return 0;
    }
    if (UnknownC4C519(3, 0x5A) != 0) {
        return 0;
    }
    if (SkippablePause(1) != 0) {
        return 0;
    }
    if (UnknownC4C519(4, 8) != 0) {
        return 0;
    }
    return 0;
}

/// $C4C718
short Spawn() {
    UnknownC0943C();
    UnknownC4C2DE();
    short result = UnknownC4C64D();
    if (result != 0) {
        FadeOutWithMosaic(2, 1, 0);
        UnknownC09451();
        return result;
    }
    UnknownC4C58F(0x20);
    UnknownC0AC0C(2);
    TM_MIRROR = 0x17;
    Unknown7E436E = -1;
    Unknown7E5DD4 = -1;
    CurrentMusicTrack = 0xFFFF;
    Unknown7E4676 = 1;
    WaitUntilNextFrame();
    InitializeMap(RespawnX, RespawnY, 6);
    Unknown7E4DC6 = &PartyCharacters[gameState.partyMembers[0]];
    for (short i = 0; i < 6; i++) {
        Unknown7E4DC6.afflictions[i] = 0;
    }
    Unknown7E4DC6.hp.target = Unknown7E4DC6.maxHP;
    Unknown7E4DC6.hp.current.integer = Unknown7E4DC6.maxHP;
    Unknown7E4DC6.pp.target = 0;
    Unknown7E4DC6.pp.current.integer = 0;
    gameState.moneyCarried = (gameState.moneyCarried & 1) + gameState.moneyCarried / 2;
    UnknownC07B52();
    for (short i = 1; 10 < i; i++) {
        setEventFlag(i, 0);
    }
    for (short i = 0; i < 0x1E; i++) {
        EntityCollidedObjects[i] = 0xFFFF;
    }
    UnknownC064D4();
    Unknown7E9E56 = 0;
    Unknown7E5D58 = 0;
    SpawnBuzzBuzz();
    OAMClear();
    UnknownC09451();
    UnknownC4C60E(0x20);
    return result;
}

/// $C4D274
ubyte GetTownMapID(short x, short y) {
    return MapDataPerSectorTownMapData[y / 0x80][((x >> 8) & 0xFF)].unknown0;
}

/// $C4D2A8
void UnknownC4D2A8() {
    if (Unknown7EB4B2 == 0) {
        Unknown7EB4B2 = 0xC;
        short x10 = palettes[8][1];
        for (short i = 1; i < 4; i++) {
            palettes[4][i] = palettes[4][i - 1];
        }
        palettes[8][1] = x10;
        UnknownC0856B(16);
    }
    Unknown7EB4B2--;
}

/// $C4D2F0
void UnknownC4D2F0() {
    switch (MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown0 & 0x70) {
        case 0x10:
            UnknownC08C58F(&UnknownE1F44C[TownMapMapping[2]][0], MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1, MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2 - 8);
            break;
        case 0x20:
            UnknownC08C58F(&UnknownE1F44C[TownMapMapping[3]][0], MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1, MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2 + 8);
            break;
        case 0x40:
            UnknownC08C58F(&UnknownE1F44C[TownMapMapping[4]][0], MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1 - 8, MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2 - 8);
            break;
        case 0x30:
            UnknownC08C58F(&UnknownE1F44C[TownMapMapping[5]][0], MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1 + 16, MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2);
            break;
        default:
            break;
    }
    if (Unknown7EB4B0 < 10) {
        UnknownC08C58F(&UnknownE1F44C[TownMapMapping[1]][0], MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1, MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2);
    } else {
        UnknownC08C58F(&UnknownE1F44C[TownMapMapping[0]][0], MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown1, MapDataPerSectorTownMapData[gameState.leaderY.integer / 0x80][(gameState.leaderX.integer >> 8) & 0xFF].unknown2);
    }
    if (--Unknown7EB4B0 == 0) {
        Unknown7EB4B0 = 0x14;
    }
}

/// $C4D43F
void UnknownC4D43F(short arg1) {
    Unknown7E2400 = 0;
    //not used - segmented addressing stuff
    //ubyte savedBank = UnknownC088A5(bankbyte(&UnknownE1F44C[0]));
    for (const(TownMapIconPlacement)* x06 = &TownMapIconPlacementTable[arg1][0]; x06.unknown0 != 0xFF; x06++) {
        short x14 = 1;
        if ((UnknownE1F47A[x06.unknown2] != 0) && (Unknown7EB4AE < 10)) {
            x14 = 0;
        }
        short x12 = 0;
        if (x06.eventFlag < 0x8000) {
            x12 = 1;
        }
        if (getEventFlag(x06.eventFlag & 0x7FFF) != x12) {
            x14 = 0;
        }
        if (x14 == 0) {
            continue;
        }
        UnknownC08C58F(&UnknownE1F44C[x06.unknown2][0], x06.unknown0, x06.unknown1);
    }
    UnknownC4D2F0();
    if (--Unknown7EB4AE == 0) {
        Unknown7EB4AE = 0x3C;
    }
    // see above
    //UnknownC088A5(savedBank);
    UnknownC4D2A8();
}

/// $C4D552
void LoadTownMapData(short arg1) {
    FadeOut(2, 1);
    Decomp(&TownMapGraphicsPointerTable[arg1][0], &Unknown7F0000[0]);
    while (Unknown7E0028 != 0) {}
    memcpy(&palettes[0][0], &Unknown7F0000[0], 0x40);
    memcpy(&palettes[16][0], &TownMapIconPalette[0], 0x100);
    SetBG1VRAMLocation(BGTileMapSize.normal, 0x3000, 0);
    SetOAMSize(3);
    CGADSUB = 0;
    CGWSEL = 0;
    TM_MIRROR = 1;
    TD_MIRROR = 0;
    CopyToVram(0, 0x800, 0x3000, &Unknown7F0000[0x40]);
    CopyToVram2(0, 0x4000, 0, &Unknown7F0000[0x840]);
    CopyToVram(0, 0x2400, 0x6000, &TownMapLabelGfx[0]);
    UnknownC0856B(0x18);
    TM_MIRROR = 0x11;
    BG1_Y_POS = 0;
    BG1_X_POS = 0;
    UpdateScreen();
    FadeIn(2, 1);
}

/// $C4D681
short DisplayTownMap() {
    Unknown7EB4AE = 0x3C;
    Unknown7EB4B0 = 0x14;
    Unknown7EB4B2 = 0xC;
    short x10 = GetTownMapID(gameState.leaderX.integer, gameState.leaderY.integer);
    if (x10 == 0) {
        return 0;
    }
    LoadTownMapData(cast(short)(x10 - 1));
    while(((pad_press[0] & (PAD_A | PAD_L)) == 0) && ((pad_press[0] & (PAD_B | PAD_SELECT)) == 0) && ((pad_press[0] & PAD_L) == 0) && ((pad_press[0] & PAD_X) == 0)) {
        WaitUntilNextFrame();
        OAMClear();
        UnknownC4D43F(cast(short)(x10 - 1));
        UpdateScreen();
    }
    FadeOut(2, 1);
    for (short i = 0; i < 16; i++) {
        WaitUntilNextFrame();
        OAMClear();
        UnknownC4D43F(cast(short)(x10 - 1));
        UpdateScreen();
    }
    Unknown7E5DD8 = 1;
    ReloadMap();
    Unknown7E5DD4 = Unknown7E5DD6;
    UndrawFlyoverText();
    Unknown7E5DD8 = 0;
    TM_MIRROR = 0x17;
    FadeIn(2, 1);
    return x10;
}

/// $C4D989
short UnknownC4D989(short arg1) {
    UnknownC0927C();
    UnknownC01A86();
    AllocSpriteMem(short.min, 0);
    InitializeMiscObjectData();
    Unknown7E4A58 = 1;
    Unknown7E4A5A = 0;
    SetBoundaryBehaviour(0);
    EntityAllocationMinSlot = 0x17;
    EntityAllocationMaxSlot = 0x18;
    InitEntity(1, 0, 0);
    UnknownC02D29();
    for (short i = 0; i < 6; i++) {
        gameState.partyMembers[i] = 0;
    }
    UnknownC0B65F(0x1D60, 0xB08);
    UnknownC03A24();
    memset(&palettes[0][0], 0, 0x200);
    OverworldInitialize();
    TM_MIRROR = 0;
    UnknownC2EA15(0);
    UnknownC4A7B0();
    Unknown7E9641 = 0;
    short x12 = 0;
    short x14 = 0;
    DisplayText(AttractModeText[arg1]);
    while (Unknown7E9641 == 0) {
        UnknownC4A7B0();
        if (((pad_press[0] & PAD_A) != 0) || ((pad_press[0] & PAD_B) != 0) || ((pad_press[0] & PAD_START) != 0)) {
            x12 = 1;
            break;
        }
        UnknownC1004E();
        if ((x14 == 0) || (x14 == 1)) {
            TM_MIRROR = 0x13;
        }
        x14++;
    }
    UnknownC2EA74();
    while (UnknownC2EACF() != 0) {
        UnknownC1004E();
        UnknownC4A7B0();
    }
    FadeOut(1, 1);
    while (Unknown7E0028 != 0) {
        UnknownC1004E();
    }
    UnknownC2EAAA();
    Unknown7E9641 = 0;
    UnknownC021E6();
    return x12;
}

/// $C4DAD2
void InitIntro() {
    short x02 = 0;
    Unknown7EB4B6 = 1;
    UnknownC0AC0C(2);
    UnknownC0927C();
    UnknownC200D9();
    UnknownC432B1();
    Unknown7E5DD8 = 1;
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
    short x;
    while (x == 0) {
        switch (x02) {
            case 0:
                if (LogoScreen() != 0) {
                    UnknownC0AC0C(2);
                    if ((INIDISP_MIRROR & 0x80) != 0) {
                        FadeOutWithMosaic(4, 1, 0);
                    }
                    ChangeMusic(Music.TitleScreen);
                    x = ShowTitleScreen(1);
                    x02 = 2;
                } else {
                    x = 0;
                }
                break;
            case 1:
                ChangeMusic(Music.GasStation);
                if (GasStation() != 0) {
                    UnknownC0AC0C(2);
                    if ((INIDISP_MIRROR & 0x80) != 0) {
                        FadeOutWithMosaic(4, 1, 0);
                    }
                    CGADSUB = 0;
                    CGWSEL = 0;
                    TM_MIRROR = 1;
                    TD_MIRROR = 0;
                    ChangeMusic(Music.TitleScreen);
                    x = ShowTitleScreen(1);
                    x02++;
                } else {
                    x = 0;
                }
                break;
            case 2:
                ChangeMusic(Music.TitleScreen);
                x = ShowTitleScreen(0);
                break;
            case 3:
                ChangeMusic(Music.AttractMode);
                x = UnknownC4D989(0);
                break;
            case 4:
                x = UnknownC4D989(2);
                break;
            case 5:
                x = UnknownC4D989(3);
                break;
            case 6:
                x = UnknownC4D989(4);
                break;
            case 7:
                x = UnknownC4D989(5);
                break;
            case 8:
                x = UnknownC4D989(6);
                break;
            case 9:
                x = UnknownC4D989(7);
                break;
            case 10:
                x = UnknownC4D989(9);
                break;
            default:
                x02 = 1;
                break;
        }
        x02++;
    }
    UnknownC0AC0C(2);
    Unknown7E0028 = 0;
    if ((INIDISP_MIRROR & 0x80) != 0) {
        FadeOutWithMosaic(4, 1, 0);
    }
    CGADSUB = 0;
    CGWSEL = 0;
    TM_MIRROR = 1;
    TD_MIRROR = 0;
    Unknown7E5DD8 = 0;
}

/// $C4E366 - some debugging code deleted from earthbound
void UnknownC4E366() {
    version(JPN) {
        UnknownC4DE98();
        short x0E = 0;
        while (true) {
            BG1_X_POS = 0;
            BG1_Y_POS = 0;
            UpdateScreen();
            WaitUntilNextFrame();
            if ((pad_state[0] & PAD_R) == 0) {
                UnknownC4E2D7(x0E, x0E);
                UnknownC4DED0();
                if (++x0E == 8) {
                    x0E = 0;
                }
            }
        }
    }
}

/// $C4????
void* Path_sbrk(size_t inc) {
    void *ptr = path_heap_current;
    path_heap_current = cast(byte*)path_heap_current + inc;
    return ptr;
}

/// $C4????
ushort Path_GetHeapSize() {
    return cast(ushort)(cast(byte*)path_heap_current - cast(byte*)path_heap_start);
}


/*
 * Finds a path from pathers to targets
 * Return value is still a mystery
 *
 * heap_size                Size of the heap used for allocation of various temporary arrays/structs
 * heap_start               Pointer to the start of the heap
 * matrix_dim               Pointer to a VecYX struct containing the pathfinding matrix dimensions
 * matrix                   FAR pointer to the pathfinding matrix
 * border_size              Size of the border used for the start positions of deliverymen
 * target_count             Amount of VecYX elements in the `targets_pos` array
 * targets_pos              Array of VecYX containing the positions of the targets
 * pather_count             Amount of Pather elements in the `pathers` array
 * pathers                  Array of Pather for the pathfinding objects
 * unk1                     Unknown (-1 as called from $C0BA35)
 * unk2                     Unknown, always 0xFC
 * search_radius            Just a guess...
 */
ushort Path_Main(ushort heap_size, void *heap_start, VecYX *matrix_dim,
                   ubyte *matrix, ushort border_size, ushort target_count,
                   VecYX* targets_pos, ushort pather_count, Pather* pathers,
                   ushort unk1, ushort unk2, ushort search_radius)
{
    ushort dp20 = 0;

    path_heap_start   = heap_start;
    path_heap_current = heap_start;
    path_heap_end     = cast(byte*)heap_start + heap_size;

    path_matrix_rows   = matrix_dim.y;
    path_matrix_cols   = matrix_dim.x;
    path_matrix_border = border_size;
    path_matrix_size   = cast(ushort)(path_matrix_rows * path_matrix_cols);
    path_matrix_buffer = matrix;

    ushort *ptr = cast(ushort*)Path_sbrk(search_radius*int.sizeof + int.sizeof); // dp1E
    path_B408 = ptr;
    path_B40A = ptr + cast(size_t)heap_start;
    path_B40C = ptr;
    path_B40E = ptr;

    path_cardinal_offset[0] = cast(short)-cast(int)path_matrix_cols; // NORTH
    path_cardinal_offset[1] =  1;                // EAST
    path_cardinal_offset[2] =  path_matrix_cols; // SOUTH
    path_cardinal_offset[3] = -1;                // WEST

    // NORTH
    path_cardinal_index[0].y = -1;
    path_cardinal_index[0].x =  0;
    // EAST
    path_cardinal_index[1].y =  0;
    path_cardinal_index[1].x =  1;
    // SOUTH
    path_cardinal_index[2].y =  1;
    path_cardinal_index[2].x =  0;
    // WEST
    path_cardinal_index[3].y =  0;
    path_cardinal_index[3].x = -1;

    // NORTHEAST
    path_diagonal_index[0].y = -1;
    path_diagonal_index[0].x =  1;
    // SOUTHEAST
    path_diagonal_index[1].y =  1;
    path_diagonal_index[1].x =  1;
    // SOUTHWEST
    path_diagonal_index[2].y =  1;
    path_diagonal_index[2].x = -1;
    // NORTHWEST
    path_diagonal_index[3].y = -1;
    path_diagonal_index[3].x = -1;

    if (unk2 >= PATH_FB) {
        unk2 = PATH_FB;
    }

    Pather **dp1C = cast(Pather**)Path_sbrk(pather_count * (Pather*).sizeof);
    Path_C4B859(pather_count, pathers, dp1C);

    VecYX **dp2A = cast(VecYX**)Path_sbrk(unk2 * (VecYX*).sizeof); // Allocate space on heap for pathfinding tile positions
    Path_InitMatrix();

    ushort dp1A = 0;
    ushort dp18 = 0;
    ushort dp04;
    for (dp04 = 0; dp04 < pather_count; dp04++) {
        ushort dp1E;

        Pather *dp02 = dp1C[dp04];
        Pather *dp32 = dp02;

        if (dp02.hitbox.y != dp1A || dp02.hitbox.x != dp18) {
            ushort dp16 = 1;
            dp1A = dp02.hitbox.y;
            dp18 = dp02.hitbox.x;

            for (dp1E = cast(short)(dp04 + 1); dp1E < pather_count; dp1E++) {
                // X REGISTER = &dp1C[dp1E]

                if (dp1C[dp1E].hitbox.y != dp1A) break;
                if (dp1C[dp1E].hitbox.x != dp18) break;

                dp16++;
            }

            Path_C4B923(dp16, &dp1C[dp04]);
            Path_C4BAF6(target_count, targets_pos, dp02, dp16, unk2, unk1);
        }

        dp02.point_count = Path_C4BD9A(&dp02.origin, unk2, dp2A);
        ushort dp14 = Path_C4BF7F(cast(ushort)dp02.point_count, dp2A);

        VecYX *dp22 = cast(VecYX*)Path_sbrk(dp14 * VecYX.sizeof);

        for (dp1E = 0; dp1E < dp14; ++dp1E) {
            dp22[dp1E].y = dp2A[dp1E].y;
            dp22[dp1E].x = dp2A[dp1E].x;
        }

        dp02 = dp32;
        dp02.field0A = dp14;
        dp02.points = dp22;

        if (dp14) {
            ++dp20;
        }
    }

    return dp20;
}

// Initializes the border around the pathfind matrix to PATH_UNWALKABLE
void Path_InitMatrix() {
    int i;
    for (i = 0; i < path_matrix_rows; ++i) {
        ubyte dp0E = PATH_UNWALKABLE;
        path_matrix_buffer[((path_matrix_cols - 1) * i) + (path_matrix_cols - 1)] = dp0E;
        path_matrix_buffer[(path_matrix_cols - 1) * i] = dp0E;
    }

    for (i = 0; i < path_matrix_cols; ++i) {
        ubyte dp0E = PATH_UNWALKABLE;
        path_matrix_buffer[(path_matrix_rows - 1) + i] = dp0E;
        path_matrix_buffer[i] = dp0E;
    }
}

// TODO: Path_InitPathers?
void Path_C4B859(ushort pather_count, Pather *pathers, Pather **pather_table) {
    // X REGISTER = pathers

    ushort dp1A = cast(ushort)(pather_count - 1);

    // Scope for dp18 where it's seen as an ushort
    {
        ushort dp18;
        for (dp18 = 0; dp18 < pather_count; dp18++) {
            // Y REGISTER = dp18 * sizeof(pather_table)
            // dp02 = dp18 * sizeof(Pather)

            pather_table[dp18] = &pathers[dp18];
        }
    }

    if (pather_count <= 1) return;

    ushort dp04;
    for (dp04 = 0; dp04 < dp1A; ++dp04) {
        ushort dp16 = 0xFFFF;
        ushort dp14 = 0xFFFF;
        ushort dp0E;

        ushort dp12;
        for (dp12 = dp04; dp12 < pather_count; dp12++) { // Y REGISTER
            ushort dp10 = pather_table[dp12].hitbox.y;
            ushort dp02 = pather_table[dp12].hitbox.x;

            /* TODO: This is some really odd output code...
             * C4/B8BE: A5 10        LDA $10
             * C4/B8C0: C5 16        CMP $16
             * C4/B8C2: F0 0C        BEQ $B8D0
             * C4/B8C4: A2 00 00     LDX #$0000
             * C4/B8C7: C5 16        CMP $16
             * C4/B8C9: B0 11        BCS $B8DC
             * C4/B8CB: A2 01 00     LDX #$0001
             * C4/B8CE: 80 0C        BRA $B8DC
             * C4/B8D0: A2 00 00     LDX #$0000
             * C4/B8D3: A5 02        LDA $02
             * C4/B8D5: C5 14        CMP $14
             * C4/B8D7: B0 03        BCS $B8DC
             * C4/B8D9: A2 01 00     LDX #$0001
             */
            int tmp; // X REGISTER
            if (dp10 != dp16) {
                tmp = (dp10 < dp16);
            } else {
                tmp = (dp02 < dp14);
            }

            // Should be always true for the first iteration
            if (tmp) {
                dp16 = dp10;
                dp14 = dp02;
                dp0E = dp12;
            }
        }

        Pather *dp18 = pather_table[dp04];
        pather_table[dp04] = pather_table[dp0E];
        pather_table[dp0E] = dp18;
    }
}

// TODO: Finds possible start points?
void Path_C4B923(ushort count, Pather **pathers) {
    ushort dp14;
    for (dp14 = 0; dp14 < path_matrix_size; dp14++) {
        if (path_matrix_buffer[dp14] != PATH_UNWALKABLE) {
            path_matrix_buffer[dp14] = PATH_MAYBE_START;
        }
    }

    ushort dp12; // also dp02
    for (dp12 = 0; dp12 < count; dp12++) {
        Pather *dp10 = pathers[dp12]; // also Y REGISTER

        if (dp10.from_offscreen == 0) {
            // Starting point is the same as current position
            if (path_matrix_buffer[(path_matrix_cols * dp10.origin.y) + dp10.origin.x] != PATH_UNWALKABLE) {
                path_matrix_buffer[(path_matrix_cols * dp10.origin.y) + dp10.origin.x] = PATH_START;
            }
        } else {
            // Starting from offscreen
            ushort dp0E;
            ushort i; // X REGISTER
            for (dp0E = 0; dp0E < path_matrix_border; dp0E++) {
                for (i = 0; i < path_matrix_cols; ++i) {
                    if (path_matrix_buffer[(dp0E * path_matrix_cols) + i] != PATH_UNWALKABLE) {
                        path_matrix_buffer[(dp0E * path_matrix_cols) + i] = PATH_START;
                    }
                }
            }

            for (dp0E = cast(ushort)(path_matrix_rows - path_matrix_border); dp0E < path_matrix_rows; dp0E++) {
                for (i = 0; i < path_matrix_cols; ++i) {
                    if (path_matrix_buffer[(dp0E * path_matrix_cols) + i] != PATH_UNWALKABLE) {
                        path_matrix_buffer[(dp0E * path_matrix_cols) + i] = PATH_START;
                    }
                }
            }

            for (i = 0; i < path_matrix_border; ++i) {
                for (dp14 = 0; dp14 < path_matrix_rows; dp14++) {
                    if (path_matrix_buffer[(dp14 * path_matrix_cols) + i] != PATH_UNWALKABLE) {
                        path_matrix_buffer[(dp14 * path_matrix_cols) + i] = PATH_START;
                    }
                }
            }

            for (i = 0; i < path_matrix_cols - path_matrix_border; ++i) {
                for (dp14 = 0; dp14 < path_matrix_rows; dp14++) {
                    if (path_matrix_buffer[(dp14 * path_matrix_cols) + i] != PATH_UNWALKABLE) {
                        path_matrix_buffer[(dp14 * path_matrix_cols) + i] = PATH_START;
                    }
                }
            }

            dp10.origin.y = 0;
            dp10.origin.x = 0;
        }
    }
}

void Path_C4BAF6(ushort target_count, VecYX *targets_pos, Pather *pather, ushort unk1, ushort unk2, ushort unk3) {
    ushort dp19 = pather.hitbox.y;
    ushort dp17 = pather.hitbox.x;
    ushort dp15 = 0;
    ushort dp13 = 0;

    path_B40E = path_B408;
    path_B40C = path_B408;

    ushort dp11;
    for (dp11 = 0; dp11 < target_count; dp11++) {
        *path_B40E = cast(ushort)((targets_pos[dp11].y * path_matrix_cols) + targets_pos[dp11].x);

        /*
         * C4/BB54: AD 0E B4     LDA $B40E
         * C4/BB57: CD 0A B4     CMP $B40A
         * C4/BB5A: D0 05        BNE $BB61
         * C4/BB5C: AE 08 B4     LDX $B408
         * C4/BB5F: 80 05        BRA $BB66
         * C4/BB61: AE 0E B4     LDX $B40E
         * C4/BB64: E8           INX
         * C4/BB65: E8           INX
         * C4/BB66: 8E 0E B4     STX $B40E
         */
        path_B40E = (path_B40E == path_B40A) ? path_B408 : path_B40E + 1;
    }

    while (path_B40C != path_B40E) {
        ushort dp02 = *path_B40C;

        /*
         * C4/BB81: AD 0C B4     LDA $B40C
         * C4/BB84: CD 0A B4     CMP $B40A
         * C4/BB87: D0 05        BNE $BB8E
         * C4/BB89: AE 08 B4     LDX $B408
         * C4/BB8C: 80 05        BRA $BB93
         * C4/BB8E: AE 0C B4     LDX $B40C
         * C4/BB91: E8           INX
         * C4/BB92: E8           INX
         * C4/BB93: 8E 0C B4     STX $B40C
         */
        path_B40C = (path_B40C == path_B40A) ? path_B408 : path_B40C + 1;

        ubyte dp00 = path_matrix_buffer[dp02];
        if (dp00 < PATH_MAYBE_START) continue; // Ignore PATH_MAYBE_START or PATH_START

        ushort flag = 1;   // Y REGISTER
        ushort tmp = dp02; // X REGISTER
        ushort dp04;

        for (dp11 = 0; dp11 < dp19; tmp += path_matrix_cols, dp11++) {
            for (dp04 = 0; dp04 < dp17; ++dp04) {
                if (path_matrix_buffer[tmp + dp04] == PATH_UNWALKABLE) {
                    flag = 0;
                    goto exit_loop;
                }
            }
        }

exit_loop:
        if (!flag) {
            path_matrix_buffer[dp02] = PATH_FC;
        } else {
            if (dp00 == PATH_START) {
                ++dp15;
                if (pather.from_offscreen == 1) {
                    pather.origin.y = cast(short)(tmp / path_matrix_cols);
                    pather.origin.x = cast(short)(tmp % path_matrix_cols);
                }
            }

            dp00 = PATH_FC;

            ushort dp0F;
            for (dp0F = 0; dp0F < 4; dp0F++) {
                dp11 = cast(ushort)(dp02 + path_cardinal_offset[dp0F]);
                ubyte dp01 = path_matrix_buffer[dp11];
                if (dp01 >= PATH_MAYBE_START) { // if PATH_MAYBE_START or PATH_START
                    /*
                     * C4/BC8C: AD 0C B4     LDA $B40C
                     * C4/BC8F: CD 08 B4     CMP $B408
                     * C4/BC92: D0 10        BNE $BCA4
                     * C4/BC94: A0 00 00     LDY #$0000
                     * C4/BC97: AD 0E B4     LDA $B40E
                     * C4/BC9A: CD 0A B4     CMP $B40A
                     * C4/BC9D: D0 15        BNE $BCB4
                     * C4/BC9F: A0 01 00     LDY #$0001
                     * C4/BCA2: 80 10        BRA $BCB4
                     * C4/BCA4: A0 00 00     LDY #$0000
                     * C4/BCA7: AD 0E B4     LDA $B40E
                     * C4/BCAA: 1A           INC
                     * C4/BCAB: 1A           INC
                     * C4/BCAC: CD 0C B4     CMP $B40C
                     * C4/BCAF: D0 03        BNE $BCB4
                     * C4/BCB1: A0 01 00     LDY #$0001
                     */
                    if (path_B40C == path_B408) {
                        flag = (path_B40E == path_B40A);
                    } else {
                        flag = (path_B40E + 1 == path_B40C);
                    }

                    if (!flag) {
                        *path_B40E = dp11;

                        /*
                         * C4/BCC1: AD 0E B4     LDA $B40E
                         * C4/BCC4: CD 0A B4     CMP $B40A
                         * C4/BCC7: D0 05        BNE $BCCE
                         * C4/BCC9: AC 08 B4     LDY $B408
                         * C4/BCCC: 80 05        BRA $BCD3
                         * C4/BCCE: AC 0E B4     LDY $B40E
                         * C4/BCD1: C8           INY
                         * C4/BCD2: C8           INY
                         * C4/BCD3: 8C 0E B4     STY $B40E
                         */
                        path_B40E = (path_B40E == path_B40A) ? path_B408 : path_B40E + 1;
                    }
                } else if (dp00 > dp01) {
                    dp00 = dp01;
                }
            }

            if (dp00 == PATH_FC) {
                path_matrix_buffer[dp02] = 0;
            } else {
                ubyte dp0E = cast(ubyte)(dp00 + 1);
                path_matrix_buffer[dp02] = dp0E;

                if (dp0E == unk2) {
                    for (dp11 = 0; dp11 < 4; dp11++) {
                        if (path_matrix_buffer[ dp02 + path_cardinal_offset[dp11] ] >= PATH_MAYBE_START) { // if PATH_MAYBE_START or PATH_START
                            path_matrix_buffer[ dp02 + path_cardinal_offset[dp11] ] = PATH_FC;
                        }
                    }
                }
            }

            ++dp13;
            if (unk3 <= dp13 || dp15 == unk1) return;
        }
    }
}

ushort Path_C4BD9A(VecYX *start, ushort max_points, VecYX **points) {
    ushort dp28 = start.y;
    ushort dp26 = start.x;
    ushort dp24 = 0;

    ubyte dp00 = path_matrix_buffer[(dp28 * path_matrix_cols) + dp26];
    if (dp00 > PATH_FB) { // if PATH_FC, PATH_UNWALKABLE, PATH_MAYBE_START, PATH_START
        return 0;
    }

    if (max_points == 0) {
        return 0;
    }

    points[0].y = dp28;
    points[0].x = dp26;


    ushort dp22 = 1;
    while (dp00 != 0) {
        ushort dp20 = 666; // No, really.
        ushort dp1E = 666;

        ushort dp0E;
        ushort dp10;
        ushort dp12;
        ushort dp14;

        dp00--;

        ushort dp1C = dp24; // Also dp02

        for (dp24 = 0; dp24 < 4; ++dp24) {
            ushort tmp = cast(ushort)(path_cardinal_index[dp1C].y + dp28); // X REGISTER
            ushort dp1A = cast(ushort)(path_cardinal_index[dp1C].x + dp26);

            ushort dp04 = dp1C & 3;

            if (path_matrix_buffer[(path_matrix_cols * tmp) + dp1A] == dp00) {
                if (dp20 == 666) {
                    dp20 = dp1C;
                    dp0E = tmp;
                    dp10 = dp1A;
                }

                ushort dp18 = cast(ushort)(path_diagonal_index[dp1C].y + dp28);
                ushort dp16 = cast(ushort)(path_diagonal_index[dp1C].x + dp26);

                if (path_matrix_buffer[(dp18 * path_matrix_cols) + dp16] == dp00 - 1) {
                    ushort dp02 = cast(ushort)(path_cardinal_index[dp04].x + dp26);
                    if (path_matrix_buffer[((path_cardinal_index[dp04].y + dp28) * path_matrix_cols) + dp02] == dp00) {
                        dp1E = dp1C;
                        dp12 = dp18;
                        dp14 = dp16;
                        goto exit_loop;
                    }
                }
            }

            dp1C = dp04;
        }

exit_loop:
        if (dp1E != 666) {
            dp28 = dp12;
            dp26 = dp14;
            dp24 = dp1E;
            dp00--;
        } else {
            if (dp20 == 666) break;

            dp28 = dp0E;
            dp26 = dp10;
            dp24 = dp20;
        }

        if (max_points == dp22) return dp22;

        points[dp22].y = dp28;
        points[dp22].x = dp26;

        ++dp22;
    }

    return dp22;
}

ushort Path_C4BF7F(ushort count, VecYX **points) {
    if (count >= 3) {
        ushort dp04 = points[1].y;
        ushort dp1A = points[1].x; // Also dp02

        ushort dp18 = cast(ushort)(dp04 - points[0].y);
        ushort dp16 = cast(ushort)(dp1A - points[0].x);

        ushort dp14 = 1;
        ushort dp12;

        for (dp12 = 2; dp12 != count; ++dp12) {
            ushort dp10 = points[dp12].y;
            ushort dp0E = points[dp12].x; // Also Y REGISTER

            if (dp04 + dp18 == dp10 && dp1A + dp16 == dp0E) {
                points[dp14].y = dp10;
                points[dp14].x = dp0E;
            } else {
                ++dp14;
                points[dp14].y = dp10;
                points[dp14].x = dp0E;

                dp18 = cast(ushort)(dp10 - dp04);
                dp16 = cast(ushort)(dp0E - dp1A);
            }

            dp04 = dp10;
            dp1A = dp0E;
        }

        count = cast(ushort)(dp14 + 1);
    }

    return count;
}

immutable MusicDataset[191] MusicDatasetTable = [
    MusicDataset(0x00, 0xFF, 0x01),
    MusicDataset(0x02, 0x03, 0x04),
    MusicDataset(0x02, 0x03, 0x04),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0x06),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0x07),
    MusicDataset(0x05, 0x08, 0x09),
    MusicDataset(0x05, 0x08, 0x0A),
    MusicDataset(0x05, 0x08, 0x0B),
    MusicDataset(0x05, 0x08, 0x0C),
    MusicDataset(0x05, 0x08, 0x0D),
    MusicDataset(0x05, 0x08, 0x0E),
    MusicDataset(0x05, 0x08, 0x0F),
    MusicDataset(0x05, 0x08, 0x10),
    MusicDataset(0x05, 0x08, 0x11),
    MusicDataset(0x05, 0x08, 0x12),
    MusicDataset(0x05, 0x08, 0x13),
    MusicDataset(0x05, 0x08, 0x13),
    MusicDataset(0x05, 0x08, 0x14),
    MusicDataset(0x05, 0x15, 0x16),
    MusicDataset(0x05, 0xFF, 0x17),
    MusicDataset(0x05, 0xFF, 0x17),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x18, 0x19),
    MusicDataset(0x05, 0x15, 0x1A),
    MusicDataset(0x05, 0x1B, 0x1C),
    MusicDataset(0x05, 0x1B, 0x1D),
    MusicDataset(0x05, 0x1B, 0x1E),
    MusicDataset(0x05, 0x1B, 0x1F),
    MusicDataset(0x05, 0x08, 0x20),
    MusicDataset(0x05, 0x21, 0x22),
    MusicDataset(0x05, 0x23, 0x24),
    MusicDataset(0x05, 0x25, 0x26),
    MusicDataset(0x05, 0x25, 0x27),
    MusicDataset(0x05, 0x28, 0x29),
    MusicDataset(0x05, 0x2A, 0x2B),
    MusicDataset(0x05, 0x2C, 0x2D),
    MusicDataset(0x05, 0x08, 0x2E),
    MusicDataset(0x05, 0x2F, 0x30),
    MusicDataset(0x05, 0x2F, 0x31),
    MusicDataset(0x05, 0x32, 0x33),
    MusicDataset(0x05, 0x34, 0x35),
    MusicDataset(0x05, 0x36, 0x37),
    MusicDataset(0x05, 0x38, 0x39),
    MusicDataset(0x05, 0x3A, 0x3B),
    MusicDataset(0x05, 0x3C, 0x3D),
    MusicDataset(0x05, 0x3C, 0x3E),
    MusicDataset(0x05, 0x3C, 0x3F),
    MusicDataset(0x05, 0x40, 0x41),
    MusicDataset(0x05, 0x42, 0x43),
    MusicDataset(0x05, 0x18, 0x44),
    MusicDataset(0x05, 0x18, 0x45),
    MusicDataset(0x05, 0x46, 0x47),
    MusicDataset(0x05, 0x48, 0x49),
    MusicDataset(0x05, 0x4A, 0x4B),
    MusicDataset(0x05, 0x4C, 0x4D),
    MusicDataset(0x05, 0x4C, 0x4D),
    MusicDataset(0x05, 0x4E, 0x4F),
    MusicDataset(0x05, 0x50, 0x51),
    MusicDataset(0x05, 0x52, 0x53),
    MusicDataset(0x05, 0x54, 0x55),
    MusicDataset(0x05, 0x54, 0x56),
    MusicDataset(0x05, 0x54, 0x57),
    MusicDataset(0x05, 0x46, 0x58),
    MusicDataset(0x05, 0x59, 0x5A),
    MusicDataset(0x05, 0x2C, 0x5B),
    MusicDataset(0x05, 0x5C, 0x5D),
    MusicDataset(0x05, 0x2C, 0x5E),
    MusicDataset(0x05, 0x2C, 0x5E),
    MusicDataset(0x05, 0x5F, 0x60),
    MusicDataset(0x05, 0x2C, 0x61),
    MusicDataset(0x05, 0x62, 0x63),
    MusicDataset(0x05, 0x23, 0x64),
    MusicDataset(0x05, 0xFF, 0x65),
    MusicDataset(0x05, 0xFF, 0x66),
    MusicDataset(0x05, 0xFF, 0x67),
    MusicDataset(0x05, 0x54, 0x68),
    MusicDataset(0x05, 0x69, 0x6A),
    MusicDataset(0x05, 0x54, 0x6B),
    MusicDataset(0x6C, 0xFF, 0x6D),
    MusicDataset(0x05, 0x6E, 0x6F),
    MusicDataset(0x05, 0x6E, 0x70),
    MusicDataset(0x05, 0x6E, 0x71),
    MusicDataset(0x05, 0x72, 0x73),
    MusicDataset(0x05, 0x74, 0x75),
    MusicDataset(0x05, 0x76, 0x77),
    MusicDataset(0x05, 0x76, 0x78),
    MusicDataset(0x05, 0x15, 0x79),
    MusicDataset(0x05, 0x7A, 0x7B),
    MusicDataset(0x05, 0x7C, 0x7D),
    MusicDataset(0x05, 0x7E, 0x7F),
    MusicDataset(0x05, 0x7E, 0x80),
    MusicDataset(0x05, 0x15, 0x81),
    MusicDataset(0x05, 0x2C, 0x5E),
    MusicDataset(0x05, 0x2C, 0x5E),
    MusicDataset(0x05, 0xFF, 0x82),
    MusicDataset(0x05, 0x83, 0x0E),
    MusicDataset(0x05, 0x83, 0x0E),
    MusicDataset(0x05, 0x83, 0x84),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0x83, 0x85),
    MusicDataset(0x05, 0x15, 0x86),
    MusicDataset(0x05, 0x83, 0x84),
    MusicDataset(0x05, 0xFF, 0x87),
    MusicDataset(0x05, 0x08, 0x88),
    MusicDataset(0x05, 0x83, 0x84),
    MusicDataset(0x05, 0x21, 0x22),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0x89),
    MusicDataset(0x05, 0x2F, 0x8A),
    MusicDataset(0x05, 0xFF, 0x67),
    MusicDataset(0x05, 0xFF, 0x67),
    MusicDataset(0x05, 0x8B, 0x8C),
    MusicDataset(0x05, 0x8B, 0x8D),
    MusicDataset(0x05, 0x54, 0x57),
    MusicDataset(0x05, 0x08, 0x8E),
    MusicDataset(0x05, 0xFF, 0x8F),
    MusicDataset(0x05, 0x1B, 0x90),
    MusicDataset(0x05, 0x72, 0x91),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0x25, 0x26),
    MusicDataset(0x05, 0x08, 0x0A),
    MusicDataset(0x05, 0x08, 0x0A),
    MusicDataset(0x05, 0x08, 0x0A),
    MusicDataset(0x05, 0x59, 0x92),
    MusicDataset(0x05, 0x72, 0x73),
    MusicDataset(0x05, 0xFF, 0x93),
    MusicDataset(0x05, 0x18, 0x94),
    MusicDataset(0x05, 0x36, 0x37),
    MusicDataset(0x05, 0x1B, 0x1C),
    MusicDataset(0x05, 0x2C, 0x61),
    MusicDataset(0x05, 0x83, 0x95),
    MusicDataset(0x05, 0x54, 0x96),
    MusicDataset(0x05, 0x54, 0x96),
    MusicDataset(0x05, 0x83, 0x85),
    MusicDataset(0x05, 0x1B, 0x97),
    MusicDataset(0x05, 0x83, 0x95),
    MusicDataset(0x05, 0x83, 0x85),
    MusicDataset(0x05, 0x83, 0x98),
    MusicDataset(0x05, 0xFF, 0x91),
    MusicDataset(0x05, 0x83, 0x95),
    MusicDataset(0x02, 0x99, 0x9A),
    MusicDataset(0x02, 0x03, 0x04),
    MusicDataset(0x05, 0x2C, 0x9B),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x18, 0x9E),
    MusicDataset(0x05, 0x38, 0x9F),
    MusicDataset(0x05, 0x2F, 0xA0),
    MusicDataset(0x05, 0xA1, 0xA2),
    MusicDataset(0x05, 0x08, 0x88),
    MusicDataset(0x00, 0xFF, 0x01),
    MusicDataset(0x02, 0x99, 0xA3),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0x83, 0x85),
    MusicDataset(0x05, 0x3C, 0xA4),
    MusicDataset(0x05, 0xA5, 0xA6),
    MusicDataset(0x05, 0xA1, 0xA2),
    MusicDataset(0x05, 0xFF, 0x66),
    MusicDataset(0x05, 0x52, 0x53),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0xFF, 0xFF),
    MusicDataset(0x05, 0x4E, 0x4F),
    MusicDataset(0x05, 0x4C, 0xA7),
    MusicDataset(0x05, 0x4E, 0x4F),
    MusicDataset(0x05, 0x2F, 0xA8),
    MusicDataset(0x05, 0x9C, 0x9D),
    MusicDataset(0x05, 0x52, 0x53),
    MusicDataset(0x05, 0x50, 0x51),
];

immutable ubyte[][169] MusicPackPointerTable = [
    cast(immutable(ubyte)[])import("audiopacks/0.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/1.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/2.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/3.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/4.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/5.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/6.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/7.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/8.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/9.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/10.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/11.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/12.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/13.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/14.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/15.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/16.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/17.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/18.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/19.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/20.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/21.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/22.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/23.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/24.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/25.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/26.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/27.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/28.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/29.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/30.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/31.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/32.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/33.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/34.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/35.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/36.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/37.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/38.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/39.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/40.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/41.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/42.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/43.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/44.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/45.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/46.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/47.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/48.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/49.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/50.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/51.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/52.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/53.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/54.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/55.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/56.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/57.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/58.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/59.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/60.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/61.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/62.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/63.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/64.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/65.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/66.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/67.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/68.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/69.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/70.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/71.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/72.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/73.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/74.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/75.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/76.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/77.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/78.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/79.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/80.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/81.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/82.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/83.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/84.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/85.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/86.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/87.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/88.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/89.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/90.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/91.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/92.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/93.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/94.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/95.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/96.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/97.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/98.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/99.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/100.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/101.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/102.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/103.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/104.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/105.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/106.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/107.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/108.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/109.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/110.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/111.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/112.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/113.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/114.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/115.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/116.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/117.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/118.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/119.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/120.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/121.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/122.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/123.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/124.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/125.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/126.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/127.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/128.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/129.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/130.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/131.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/132.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/133.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/134.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/135.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/136.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/137.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/138.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/139.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/140.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/141.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/142.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/143.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/144.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/145.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/146.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/147.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/148.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/149.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/150.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/151.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/152.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/153.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/154.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/155.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/156.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/157.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/158.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/159.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/160.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/161.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/162.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/163.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/164.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/165.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/166.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/167.spcpack"),
    cast(immutable(ubyte)[])import("audiopacks/168.spcpack"),
];

/// $C4FBBD
void ChangeMusic(short track) {
    if (track == CurrentMusicTrack) {
        return;
    }
    if (Unknown7EB4B6 == 0) {
        PlaySfxUnknown();
    }
    if ((track < Music.SoundstoneRecordingGiantStep) || (track > Music.SoundstoneRecordingFireSpring)) {
        UnknownC0AC0C(1);
        StopMusic();
    }
    CurrentMusicTrack = track;
    const(MusicDataset)* dataset = &MusicDatasetTable[track - 1];
    if ((dataset.primarySamplePack != CurrentPrimarySamplePack) || (dataset.primarySamplePack != 0xFF)) {
        CurrentPrimarySamplePack = dataset.primarySamplePack;
        // not using segmented addressing...
        //LoadSPC700Data(MusicPackPointerTable[dataset.primarySamplePack].addr & Unknown7EB547, UnknownC4FB42(MusicPackPointerTable[dataset.primarySamplePack].bank));
        LoadSPC700Data(&MusicPackPointerTable[dataset.primarySamplePack][0]);
    }
    if ((dataset.secondarySamplePack != CurrentSecondarySamplePack) || (dataset.secondarySamplePack != 0xFF)) {
        CurrentSecondarySamplePack = dataset.secondarySamplePack;
        //LoadSPC700Data(MusicPackPointerTable[dataset.secondarySamplePack].addr & Unknown7EB547, UnknownC4FB42(MusicPackPointerTable[dataset.secondarySamplePack].bank));
        LoadSPC700Data(&MusicPackPointerTable[dataset.secondarySamplePack][0]);
    }
    if ((dataset.sequencePack != CurrentSequencePack) || (dataset.sequencePack != 0xFF)) {
        CurrentSequencePack = dataset.sequencePack;
        //LoadSPC700Data(MusicPackPointerTable[dataset.sequencePack].addr & Unknown7EB547, UnknownC4FB42(MusicPackPointerTable[dataset.sequencePack].bank));
        LoadSPC700Data(&MusicPackPointerTable[dataset.sequencePack][0]);
    }
    UnknownC0ABBD(track);
}

/// $C4FB58
void InitializeSPC700() {
    CurrentSequencePack = 0xFFFF;
    CurrentPrimarySamplePack = 0xFFFF;
    Unknown7EB543 = MusicDatasetTable[0].sequencePack;
    CurrentSecondarySamplePack = MusicDatasetTable[0].sequencePack;
    //LoadSPC700Data(MusicPackPointerTable[MusicDatasetTable[0].sequencePack].addr & Unknown7EB547, UnknownC4FB42(MusicPackPointerTable[MusicDatasetTable[0].sequencePack].bank));
    LoadSPC700Data(&MusicPackPointerTable[MusicDatasetTable[0].sequencePack][0]);
    SectorBoundaryBehaviourFlag = 1;
}

/// $C4FD18
void UnknownC4FD18(short arg1) {
    if (arg1 == 0) {
        LoadSPC700Data(&StereoMonoData[7]);
    } else {
        LoadSPC700Data(&StereoMonoData[0]);
    }
}

/// $C4FD45
void SetBoundaryBehaviour(short val) {
    SectorBoundaryBehaviourFlag = val;
}

