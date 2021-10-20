module earthbound.bank2F;

import std;

immutable ubyte[2048] t = cartesianProduct(iota(8), iota(256)).map!(x => cast(ubyte)(((x[1] ^ 255) >> x[0]) ^ 255)).array;
immutable ubyte[2048] t2 = cartesianProduct(iota(8), iota(256)).map!(x => cast(ubyte)(((x[1] ^ 255) << x[0]) ^ 255)).array;

// $EF0115 - Clear the focused window and do something unknown?
void     UnknownEF0115(short);