"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32, vector<8xf32>, ptr)>, linkage = #llvm.linkage<external>, sym_name = "intrinsics", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg282: f32, %arg283: f32, %arg284: vector<8xf32>, %arg285: !llvm.ptr):
    %315 = "llvm.intr.fmuladd"(%arg282, %arg283, %arg282) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32, f32) -> f32
    %316 = "llvm.intr.fmuladd"(%arg284, %arg284, %arg284) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    %317 = "llvm.intr.fma"(%arg282, %arg283, %arg282) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32, f32) -> f32
    %318 = "llvm.intr.fma"(%arg284, %arg284, %arg284) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>, vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "llvm.intr.prefetch"(%arg285) <{cache = 1 : i32, hint = 3 : i32, rw = 0 : i32}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (f32)>, linkage = #llvm.linkage<external>, sym_name = "fpclass_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg281: f32):
    %314 = "llvm.intr.is.fpclass"(%arg281) <{bit = 0 : i32}> : (f32) -> i1
    "llvm.return"(%314) : (i1) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "exp_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg279: f32, %arg280: vector<8xf32>):
    %312 = "llvm.intr.exp"(%arg279) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %313 = "llvm.intr.exp"(%arg280) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "exp2_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg277: f32, %arg278: vector<8xf32>):
    %310 = "llvm.intr.exp2"(%arg277) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %311 = "llvm.intr.exp2"(%arg278) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "exp10_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg275: f32, %arg276: vector<8xf32>):
    %308 = "llvm.intr.exp10"(%arg275) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %309 = "llvm.intr.exp10"(%arg276) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "ldexp_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg272: f32, %arg273: vector<8xf32>, %arg274: i32):
    %306 = "llvm.intr.ldexp"(%arg272, %arg274) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, i32) -> f32
    %307 = "llvm.intr.ldexp"(%arg273, %arg274) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>, i32) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "frexp_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg270: f32, %arg271: vector<8xf32>):
    %304 = "llvm.intr.frexp"(%arg270) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> !llvm.struct<(f32, i32)>
    %305 = "llvm.intr.frexp"(%arg271) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> !llvm.struct<(vector<8xf32>, i32)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "log_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg268: f32, %arg269: vector<8xf32>):
    %302 = "llvm.intr.log"(%arg268) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %303 = "llvm.intr.log"(%arg269) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "log10_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg266: f32, %arg267: vector<8xf32>):
    %300 = "llvm.intr.log10"(%arg266) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %301 = "llvm.intr.log10"(%arg267) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "log2_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg264: f32, %arg265: vector<8xf32>):
    %298 = "llvm.intr.log2"(%arg264) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %299 = "llvm.intr.log2"(%arg265) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "fabs_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg262: f32, %arg263: vector<8xf32>):
    %296 = "llvm.intr.fabs"(%arg262) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %297 = "llvm.intr.fabs"(%arg263) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "arithmetic_fence_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg260: f32, %arg261: vector<8xf32>):
    %294 = "llvm.intr.arithmetic.fence"(%arg260) : (f32) -> f32
    %295 = "llvm.intr.arithmetic.fence"(%arg261) : (vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "sqrt_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg258: f32, %arg259: vector<8xf32>):
    %292 = "llvm.intr.sqrt"(%arg258) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %293 = "llvm.intr.sqrt"(%arg259) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "ceil_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg256: f32, %arg257: vector<8xf32>):
    %290 = "llvm.intr.ceil"(%arg256) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %291 = "llvm.intr.ceil"(%arg257) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "floor_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg254: f32, %arg255: vector<8xf32>):
    %288 = "llvm.intr.floor"(%arg254) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %289 = "llvm.intr.floor"(%arg255) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "trig_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg252: f32, %arg253: vector<8xf32>):
    %280 = "llvm.intr.sin"(%arg252) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %281 = "llvm.intr.sin"(%arg253) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    %282 = "llvm.intr.cos"(%arg252) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %283 = "llvm.intr.cos"(%arg253) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    %284 = "llvm.intr.tan"(%arg252) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %285 = "llvm.intr.tan"(%arg253) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    %286 = "llvm.intr.sincos"(%arg252) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> !llvm.struct<(f32, f32)>
    %287 = "llvm.intr.sincos"(%arg253) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> !llvm.struct<(vector<8xf32>, vector<8xf32>)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "inv_trig_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg250: f32, %arg251: vector<8xf32>):
    %274 = "llvm.intr.asin"(%arg250) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %275 = "llvm.intr.asin"(%arg251) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    %276 = "llvm.intr.acos"(%arg250) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %277 = "llvm.intr.acos"(%arg251) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    %278 = "llvm.intr.atan"(%arg250) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %279 = "llvm.intr.atan"(%arg251) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32, vector<8xf32>, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "atan2_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg246: f32, %arg247: f32, %arg248: vector<8xf32>, %arg249: vector<8xf32>):
    %272 = "llvm.intr.atan2"(%arg246, %arg247) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %273 = "llvm.intr.atan2"(%arg248, %arg249) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "hyperbolic_trig_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg244: f32, %arg245: vector<8xf32>):
    %266 = "llvm.intr.sinh"(%arg244) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %267 = "llvm.intr.sinh"(%arg245) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    %268 = "llvm.intr.cosh"(%arg244) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %269 = "llvm.intr.cosh"(%arg245) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    %270 = "llvm.intr.tanh"(%arg244) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %271 = "llvm.intr.tanh"(%arg245) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32, vector<8xf32>, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "copysign_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg240: f32, %arg241: f32, %arg242: vector<8xf32>, %arg243: vector<8xf32>):
    %264 = "llvm.intr.copysign"(%arg240, %arg241) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %265 = "llvm.intr.copysign"(%arg242, %arg243) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32, vector<8xf32>, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "pow_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg236: f32, %arg237: f32, %arg238: vector<8xf32>, %arg239: vector<8xf32>):
    %262 = "llvm.intr.pow"(%arg236, %arg237) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %263 = "llvm.intr.pow"(%arg238, %arg239) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f64, vector<8xf32>, vector<8xf64>)>, linkage = #llvm.linkage<external>, sym_name = "rint_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg232: f32, %arg233: f64, %arg234: vector<8xf32>, %arg235: vector<8xf64>):
    %258 = "llvm.intr.rint"(%arg232) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %259 = "llvm.intr.rint"(%arg233) <{fastmathFlags = #llvm.fastmath<none>}> : (f64) -> f64
    %260 = "llvm.intr.rint"(%arg234) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    %261 = "llvm.intr.rint"(%arg235) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf64>) -> vector<8xf64>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f64, vector<8xf32>, vector<8xf64>)>, linkage = #llvm.linkage<external>, sym_name = "nearbyint_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg228: f32, %arg229: f64, %arg230: vector<8xf32>, %arg231: vector<8xf64>):
    %254 = "llvm.intr.nearbyint"(%arg228) <{fastmathFlags = #llvm.fastmath<none>}> : (f32) -> f32
    %255 = "llvm.intr.nearbyint"(%arg229) <{fastmathFlags = #llvm.fastmath<none>}> : (f64) -> f64
    %256 = "llvm.intr.nearbyint"(%arg230) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> vector<8xf32>
    %257 = "llvm.intr.nearbyint"(%arg231) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf64>) -> vector<8xf64>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f64, vector<2xf32>, vector<2xf64>)>, linkage = #llvm.linkage<external>, sym_name = "lround_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg224: f32, %arg225: f64, %arg226: vector<2xf32>, %arg227: vector<2xf64>):
    %246 = "llvm.intr.lround"(%arg224) : (f32) -> i32
    %247 = "llvm.intr.lround"(%arg224) : (f32) -> i64
    %248 = "llvm.intr.lround"(%arg225) : (f64) -> i32
    %249 = "llvm.intr.lround"(%arg225) : (f64) -> i64
    %250 = "llvm.intr.lround"(%arg226) : (vector<2xf32>) -> vector<2xi32>
    %251 = "llvm.intr.lround"(%arg227) : (vector<2xf64>) -> vector<2xi32>
    %252 = "llvm.intr.lround"(%arg226) : (vector<2xf32>) -> vector<2xi64>
    %253 = "llvm.intr.lround"(%arg227) : (vector<2xf64>) -> vector<2xi64>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f64)>, linkage = #llvm.linkage<external>, sym_name = "llround_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg222: f32, %arg223: f64):
    %244 = "llvm.intr.llround"(%arg222) : (f32) -> i64
    %245 = "llvm.intr.llround"(%arg223) : (f64) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f64, vector<2xf32>, vector<2xf64>)>, linkage = #llvm.linkage<external>, sym_name = "lrint_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg218: f32, %arg219: f64, %arg220: vector<2xf32>, %arg221: vector<2xf64>):
    %236 = "llvm.intr.lrint"(%arg218) : (f32) -> i32
    %237 = "llvm.intr.lrint"(%arg218) : (f32) -> i64
    %238 = "llvm.intr.lrint"(%arg219) : (f64) -> i32
    %239 = "llvm.intr.lrint"(%arg219) : (f64) -> i64
    %240 = "llvm.intr.lrint"(%arg220) : (vector<2xf32>) -> vector<2xi32>
    %241 = "llvm.intr.lrint"(%arg221) : (vector<2xf64>) -> vector<2xi32>
    %242 = "llvm.intr.lrint"(%arg220) : (vector<2xf32>) -> vector<2xi64>
    %243 = "llvm.intr.lrint"(%arg221) : (vector<2xf64>) -> vector<2xi64>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f64, vector<2xf32>, vector<2xf64>)>, linkage = #llvm.linkage<external>, sym_name = "llrint_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg214: f32, %arg215: f64, %arg216: vector<2xf32>, %arg217: vector<2xf64>):
    %232 = "llvm.intr.llrint"(%arg214) : (f32) -> i64
    %233 = "llvm.intr.llrint"(%arg215) : (f64) -> i64
    %234 = "llvm.intr.llrint"(%arg216) : (vector<2xf32>) -> vector<2xi64>
    %235 = "llvm.intr.llrint"(%arg217) : (vector<2xf64>) -> vector<2xi64>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "bitreverse_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg212: i32, %arg213: vector<8xi32>):
    %230 = "llvm.intr.bitreverse"(%arg212) : (i32) -> i32
    %231 = "llvm.intr.bitreverse"(%arg213) : (vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "byteswap_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg210: i32, %arg211: vector<8xi32>):
    %228 = "llvm.intr.bswap"(%arg210) : (i32) -> i32
    %229 = "llvm.intr.bswap"(%arg211) : (vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "ctlz_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg208: i32, %arg209: vector<8xi32>):
    %226 = "llvm.intr.ctlz"(%arg208) <{is_zero_poison = false}> : (i32) -> i32
    %227 = "llvm.intr.ctlz"(%arg209) <{is_zero_poison = true}> : (vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "cttz_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg206: i32, %arg207: vector<8xi32>):
    %224 = "llvm.intr.cttz"(%arg206) <{is_zero_poison = false}> : (i32) -> i32
    %225 = "llvm.intr.cttz"(%arg207) <{is_zero_poison = true}> : (vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "abs_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg204: i32, %arg205: vector<8xi32>):
    %222 = "llvm.intr.abs"(%arg204) <{is_int_min_poison = false}> : (i32) -> i32
    %223 = "llvm.intr.abs"(%arg205) <{is_int_min_poison = true}> : (vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "ctpop_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg202: i32, %arg203: vector<8xi32>):
    %220 = "llvm.intr.ctpop"(%arg202) : (i32) -> i32
    %221 = "llvm.intr.ctpop"(%arg203) : (vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, vector<8xi32>, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "fshl_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg196: i32, %arg197: i32, %arg198: i32, %arg199: vector<8xi32>, %arg200: vector<8xi32>, %arg201: vector<8xi32>):
    %218 = "llvm.intr.fshl"(%arg196, %arg197, %arg198) : (i32, i32, i32) -> i32
    %219 = "llvm.intr.fshl"(%arg199, %arg200, %arg201) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, i32, vector<8xi32>, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "fshr_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg190: i32, %arg191: i32, %arg192: i32, %arg193: vector<8xi32>, %arg194: vector<8xi32>, %arg195: vector<8xi32>):
    %216 = "llvm.intr.fshr"(%arg190, %arg191, %arg192) : (i32, i32, i32) -> i32
    %217 = "llvm.intr.fshr"(%arg193, %arg194, %arg195) : (vector<8xi32>, vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32, vector<8xf32>, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "maximum_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg186: f32, %arg187: f32, %arg188: vector<8xf32>, %arg189: vector<8xf32>):
    %214 = "llvm.intr.maximum"(%arg186, %arg187) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %215 = "llvm.intr.maximum"(%arg188, %arg189) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32, vector<8xf32>, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "minimum_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg182: f32, %arg183: f32, %arg184: vector<8xf32>, %arg185: vector<8xf32>):
    %212 = "llvm.intr.minimum"(%arg182, %arg183) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %213 = "llvm.intr.minimum"(%arg184, %arg185) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32, vector<8xf32>, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "maxnum_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg178: f32, %arg179: f32, %arg180: vector<8xf32>, %arg181: vector<8xf32>):
    %210 = "llvm.intr.maxnum"(%arg178, %arg179) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %211 = "llvm.intr.maxnum"(%arg180, %arg181) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32, vector<8xf32>, vector<8xf32>)>, linkage = #llvm.linkage<external>, sym_name = "minnum_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg174: f32, %arg175: f32, %arg176: vector<8xf32>, %arg177: vector<8xf32>):
    %208 = "llvm.intr.minnum"(%arg174, %arg175) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, f32) -> f32
    %209 = "llvm.intr.minnum"(%arg176, %arg177) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "smax_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg170: i32, %arg171: i32, %arg172: vector<8xi32>, %arg173: vector<8xi32>):
    %206 = "llvm.intr.smax"(%arg170, %arg171) : (i32, i32) -> i32
    %207 = "llvm.intr.smax"(%arg172, %arg173) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "smin_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg166: i32, %arg167: i32, %arg168: vector<8xi32>, %arg169: vector<8xi32>):
    %204 = "llvm.intr.smin"(%arg166, %arg167) : (i32, i32) -> i32
    %205 = "llvm.intr.smin"(%arg168, %arg169) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "umax_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg162: i32, %arg163: i32, %arg164: vector<8xi32>, %arg165: vector<8xi32>):
    %202 = "llvm.intr.umax"(%arg162, %arg163) : (i32, i32) -> i32
    %203 = "llvm.intr.umax"(%arg164, %arg165) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "umin_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg158: i32, %arg159: i32, %arg160: vector<8xi32>, %arg161: vector<8xi32>):
    %200 = "llvm.intr.umin"(%arg158, %arg159) : (i32, i32) -> i32
    %201 = "llvm.intr.umin"(%arg160, %arg161) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "fake_use", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg156: i32, %arg157: !llvm.ptr):
    "llvm.intr.fake.use"(%arg156) : (i32) -> ()
    "llvm.intr.fake.use"(%arg157) : (!llvm.ptr) -> ()
    "llvm.intr.fake.use"(%arg156, %arg157) : (i32, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i1)>, linkage = #llvm.linkage<external>, sym_name = "assume_without_opbundles", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg155: i1):
    "llvm.intr.assume"(%arg155) <{op_bundle_sizes = array<i32>}> : (i1) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "assume_with_opbundles", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg154: !llvm.ptr):
    %198 = "llvm.mlir.constant"() <{value = true}> : () -> i1
    %199 = "llvm.mlir.constant"() <{value = 8 : i32}> : () -> i32
    "llvm.intr.assume"(%198, %arg154, %199) <{op_bundle_sizes = array<i32: 2>, op_bundle_tags = ["align"]}> : (i1, !llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<8xf32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "vector_reductions", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg151: f32, %arg152: vector<8xf32>, %arg153: vector<8xi32>):
    %181 = "llvm.intr.vector.reduce.add"(%arg153) : (vector<8xi32>) -> i32
    %182 = "llvm.intr.vector.reduce.and"(%arg153) : (vector<8xi32>) -> i32
    %183 = "llvm.intr.vector.reduce.fmax"(%arg152) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> f32
    %184 = "llvm.intr.vector.reduce.fmin"(%arg152) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> f32
    %185 = "llvm.intr.vector.reduce.fmaximum"(%arg152) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> f32
    %186 = "llvm.intr.vector.reduce.fminimum"(%arg152) <{fastmathFlags = #llvm.fastmath<none>}> : (vector<8xf32>) -> f32
    %187 = "llvm.intr.vector.reduce.mul"(%arg153) : (vector<8xi32>) -> i32
    %188 = "llvm.intr.vector.reduce.or"(%arg153) : (vector<8xi32>) -> i32
    %189 = "llvm.intr.vector.reduce.smax"(%arg153) : (vector<8xi32>) -> i32
    %190 = "llvm.intr.vector.reduce.smin"(%arg153) : (vector<8xi32>) -> i32
    %191 = "llvm.intr.vector.reduce.umax"(%arg153) : (vector<8xi32>) -> i32
    %192 = "llvm.intr.vector.reduce.umin"(%arg153) : (vector<8xi32>) -> i32
    %193 = "llvm.intr.vector.reduce.fadd"(%arg151, %arg152) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<8xf32>) -> f32
    %194 = "llvm.intr.vector.reduce.fmul"(%arg151, %arg152) <{fastmathFlags = #llvm.fastmath<none>}> : (f32, vector<8xf32>) -> f32
    %195 = "llvm.intr.vector.reduce.fadd"(%arg151, %arg152) <{fastmathFlags = #llvm.fastmath<reassoc>}> : (f32, vector<8xf32>) -> f32
    %196 = "llvm.intr.vector.reduce.fmul"(%arg151, %arg152) <{fastmathFlags = #llvm.fastmath<reassoc>}> : (f32, vector<8xf32>) -> f32
    %197 = "llvm.intr.vector.reduce.xor"(%arg153) : (vector<8xi32>) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<64xf32>, vector<48xf32>, ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "matrix_intrinsics", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg147: vector<64xf32>, %arg148: vector<48xf32>, %arg149: !llvm.ptr, %arg150: i64):
    %178 = "llvm.intr.matrix.multiply"(%arg147, %arg148) <{lhs_columns = 16 : i32, lhs_rows = 4 : i32, rhs_columns = 3 : i32}> : (vector<64xf32>, vector<48xf32>) -> vector<12xf32>
    %179 = "llvm.intr.matrix.transpose"(%arg148) <{columns = 16 : i32, rows = 3 : i32}> : (vector<48xf32>) -> vector<48xf32>
    %180 = "llvm.intr.matrix.column.major.load"(%arg149, %arg150) <{columns = 16 : i32, isVolatile = false, rows = 3 : i32}> : (!llvm.ptr, i64) -> vector<48xf32>
    "llvm.intr.matrix.column.major.store"(%180, %arg149, %arg150) <{columns = 16 : i32, isVolatile = false, rows = 3 : i32}> : (vector<48xf32>, !llvm.ptr, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<7xi1> (i64, i64)>, linkage = #llvm.linkage<external>, sym_name = "get_active_lane_mask", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg145: i64, %arg146: i64):
    %177 = "llvm.intr.get.active.lane.mask"(%arg145, %arg146) : (i64, i64) -> vector<7xi1>
    "llvm.return"(%177) : (vector<7xi1>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, vector<7xi1>)>, linkage = #llvm.linkage<external>, sym_name = "masked_load_store_intrinsics", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg143: !llvm.ptr, %arg144: vector<7xi1>):
    %174 = "llvm.intr.masked.load"(%arg143, %arg144) <{alignment = 1 : i32}> : (!llvm.ptr, vector<7xi1>) -> vector<7xf32>
    %175 = "llvm.intr.masked.load"(%arg143, %arg144) <{alignment = 1 : i32, nontemporal}> : (!llvm.ptr, vector<7xi1>) -> vector<7xf32>
    %176 = "llvm.intr.masked.load"(%arg143, %arg144, %174) <{alignment = 1 : i32}> : (!llvm.ptr, vector<7xi1>, vector<7xf32>) -> vector<7xf32>
    "llvm.intr.masked.store"(%175, %arg143, %arg144) <{alignment = 1 : i32}> : (vector<7xf32>, !llvm.ptr, vector<7xi1>) -> ()
    "llvm.intr.masked.store"(%175, %arg143, %arg144) <{alignment = 1 : i32, nontemporal}> : (vector<7xf32>, !llvm.ptr, vector<7xi1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<7x!llvm.ptr>, vector<7xi1>)>, linkage = #llvm.linkage<external>, sym_name = "masked_gather_scatter_intrinsics", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg141: vector<7x!llvm.ptr>, %arg142: vector<7xi1>):
    %172 = "llvm.intr.masked.gather"(%arg141, %arg142) <{alignment = 1 : i32}> : (vector<7x!llvm.ptr>, vector<7xi1>) -> vector<7xf32>
    %173 = "llvm.intr.masked.gather"(%arg141, %arg142, %172) <{alignment = 1 : i32}> : (vector<7x!llvm.ptr>, vector<7xi1>, vector<7xf32>) -> vector<7xf32>
    "llvm.intr.masked.scatter"(%173, %arg141, %arg142) <{alignment = 1 : i32}> : (vector<7xf32>, vector<7x!llvm.ptr>, vector<7xi1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, vector<7xi1>, vector<7xf32>)>, linkage = #llvm.linkage<external>, sym_name = "masked_expand_compress_intrinsics", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg138: !llvm.ptr, %arg139: vector<7xi1>, %arg140: vector<7xf32>):
    %171 = "llvm.intr.masked.expandload"(%arg138, %arg139, %arg140) : (!llvm.ptr, vector<7xi1>, vector<7xf32>) -> vector<7xf32>
    "llvm.intr.masked.compressstore"(%171, %arg138, %arg139) : (vector<7xf32>, !llvm.ptr, vector<7xi1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, vector<7xi1>, vector<7xf32>)>, linkage = #llvm.linkage<external>, sym_name = "masked_expand_compress_intrinsics_with_alignment", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg135: !llvm.ptr, %arg136: vector<7xi1>, %arg137: vector<7xf32>):
    %170 = "llvm.intr.masked.expandload"(%arg135, %arg136, %arg137) <{arg_attrs = [{llvm.align = 8 : i32}, {}, {}]}> : (!llvm.ptr, vector<7xi1>, vector<7xf32>) -> vector<7xf32>
    "llvm.intr.masked.compressstore"(%170, %arg135, %arg136) <{arg_attrs = [{}, {llvm.align = 8 : i32}, {}]}> : (vector<7xf32>, !llvm.ptr, vector<7xi1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i16, ptr, ptr, ptr, i32, ptr)>, linkage = #llvm.linkage<external>, sym_name = "annotate_intrinsics", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg128: !llvm.ptr, %arg129: i16, %arg130: !llvm.ptr, %arg131: !llvm.ptr, %arg132: !llvm.ptr, %arg133: i32, %arg134: !llvm.ptr):
    "llvm.intr.var.annotation"(%arg128, %arg131, %arg132, %arg133, %arg134) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr) -> ()
    %168 = "llvm.intr.ptr.annotation"(%arg130, %arg131, %arg132, %arg133, %arg134) : (!llvm.ptr, !llvm.ptr, !llvm.ptr, i32, !llvm.ptr) -> !llvm.ptr
    %169 = "llvm.intr.annotation"(%arg129, %arg131, %arg132, %arg133) : (i16, !llvm.ptr, !llvm.ptr, i32) -> i16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "trap_intrinsics", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.intr.trap"() : () -> ()
    "llvm.intr.debugtrap"() : () -> ()
    "llvm.intr.ubsantrap"() <{failureKind = 1 : i8}> : () -> ()
    "llvm.intr.trap"() : () -> ()
    "llvm.intr.debugtrap"() : () -> ()
    "llvm.intr.ubsantrap"() <{failureKind = 1 : i8}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "memcpy_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg125: i32, %arg126: !llvm.ptr, %arg127: !llvm.ptr):
    "llvm.intr.memcpy"(%arg126, %arg127, %arg125) <{arg_attrs = [{llvm.align = 4 : i64}, {llvm.align = 8 : i64}, {}], isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.intr.memcpy.inline"(%arg126, %arg127) <{arg_attrs = [{llvm.align = 4 : i64}, {}], isVolatile = true, len = 10 : i32}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.intr.memcpy.inline"(%arg126, %arg127) <{isVolatile = true, len = 10 : i64}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.intr.memcpy"(%arg126, %arg127, %arg125) <{arg_attrs = [{llvm.align = 4 : i64}, {llvm.align = 8 : i64}], isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "memmove_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg122: i32, %arg123: !llvm.ptr, %arg124: !llvm.ptr):
    "llvm.intr.memmove"(%arg123, %arg124, %arg122) <{arg_attrs = [{llvm.align = 4 : i64}, {llvm.align = 8 : i64}, {}], isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr, i8)>, linkage = #llvm.linkage<external>, sym_name = "memset_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg119: i32, %arg120: !llvm.ptr, %arg121: i8):
    %167 = "llvm.mlir.constant"() <{value = false}> : () -> i1
    "llvm.intr.memset"(%arg120, %arg121, %arg119) <{arg_attrs = [{llvm.align = 8 : i64}, {}, {}], isVolatile = false}> : (!llvm.ptr, i8, i32) -> ()
    "llvm.intr.memset.inline"(%arg120, %arg121) <{arg_attrs = [{llvm.align = 8 : i64}, {}], isVolatile = true, len = 10 : i32}> : (!llvm.ptr, i8) -> ()
    "llvm.intr.memset.inline"(%arg120, %arg121) <{isVolatile = true, len = 10 : i64}> : (!llvm.ptr, i8) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "sadd_with_overflow_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg115: i32, %arg116: i32, %arg117: vector<8xi32>, %arg118: vector<8xi32>):
    %165 = "llvm.intr.sadd.with.overflow"(%arg115, %arg116) : (i32, i32) -> !llvm.struct<(i32, i1)>
    %166 = "llvm.intr.sadd.with.overflow"(%arg117, %arg118) : (vector<8xi32>, vector<8xi32>) -> !llvm.struct<(vector<8xi32>, vector<8xi1>)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "uadd_with_overflow_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg111: i32, %arg112: i32, %arg113: vector<8xi32>, %arg114: vector<8xi32>):
    %163 = "llvm.intr.uadd.with.overflow"(%arg111, %arg112) : (i32, i32) -> !llvm.struct<(i32, i1)>
    %164 = "llvm.intr.uadd.with.overflow"(%arg113, %arg114) : (vector<8xi32>, vector<8xi32>) -> !llvm.struct<(vector<8xi32>, vector<8xi1>)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "ssub_with_overflow_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg107: i32, %arg108: i32, %arg109: vector<8xi32>, %arg110: vector<8xi32>):
    %161 = "llvm.intr.ssub.with.overflow"(%arg107, %arg108) : (i32, i32) -> !llvm.struct<(i32, i1)>
    %162 = "llvm.intr.ssub.with.overflow"(%arg109, %arg110) : (vector<8xi32>, vector<8xi32>) -> !llvm.struct<(vector<8xi32>, vector<8xi1>)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "usub_with_overflow_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg103: i32, %arg104: i32, %arg105: vector<8xi32>, %arg106: vector<8xi32>):
    %159 = "llvm.intr.usub.with.overflow"(%arg103, %arg104) : (i32, i32) -> !llvm.struct<(i32, i1)>
    %160 = "llvm.intr.usub.with.overflow"(%arg105, %arg106) : (vector<8xi32>, vector<8xi32>) -> !llvm.struct<(vector<8xi32>, vector<8xi1>)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "smul_with_overflow_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg99: i32, %arg100: i32, %arg101: vector<8xi32>, %arg102: vector<8xi32>):
    %157 = "llvm.intr.smul.with.overflow"(%arg99, %arg100) : (i32, i32) -> !llvm.struct<(i32, i1)>
    %158 = "llvm.intr.smul.with.overflow"(%arg101, %arg102) : (vector<8xi32>, vector<8xi32>) -> !llvm.struct<(vector<8xi32>, vector<8xi1>)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "umul_with_overflow_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg95: i32, %arg96: i32, %arg97: vector<8xi32>, %arg98: vector<8xi32>):
    %155 = "llvm.intr.umul.with.overflow"(%arg95, %arg96) : (i32, i32) -> !llvm.struct<(i32, i1)>
    %156 = "llvm.intr.umul.with.overflow"(%arg97, %arg98) : (vector<8xi32>, vector<8xi32>) -> !llvm.struct<(vector<8xi32>, vector<8xi1>)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "is_constant", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg94: i32):
    %154 = "llvm.intr.is.constant"(%arg94) : (i32) -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32)>, linkage = #llvm.linkage<external>, sym_name = "expect", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg93: i32):
    %152 = "llvm.mlir.constant"() <{value = 42 : i32}> : () -> i32
    %153 = "llvm.intr.expect"(%arg93, %152) : (i32, i32) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i16)>, linkage = #llvm.linkage<external>, sym_name = "expect_with_probability", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg92: i16):
    %150 = "llvm.mlir.constant"() <{value = 42 : i16}> : () -> i16
    %151 = "llvm.intr.expect.with.probability"(%arg92, %150) <{prob = 5.000000e-01 : f64}> : (i16, i16) -> i16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, alignment = 4 : i64, dso_local, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "tls_var", thread_local_, unnamed_addr = 0 : i64, value = 0 : i32, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "threadlocal_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %148 = "llvm.mlir.addressof"() <{global_name = @tls_var}> : () -> !llvm.ptr
    %149 = "llvm.intr.threadlocal.address"(%148) : (!llvm.ptr) -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "sadd_sat_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg88: i32, %arg89: i32, %arg90: vector<8xi32>, %arg91: vector<8xi32>):
    %146 = "llvm.intr.sadd.sat"(%arg88, %arg89) : (i32, i32) -> i32
    %147 = "llvm.intr.sadd.sat"(%arg90, %arg91) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "uadd_sat_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg84: i32, %arg85: i32, %arg86: vector<8xi32>, %arg87: vector<8xi32>):
    %144 = "llvm.intr.uadd.sat"(%arg84, %arg85) : (i32, i32) -> i32
    %145 = "llvm.intr.uadd.sat"(%arg86, %arg87) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "ssub_sat_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg80: i32, %arg81: i32, %arg82: vector<8xi32>, %arg83: vector<8xi32>):
    %142 = "llvm.intr.ssub.sat"(%arg80, %arg81) : (i32, i32) -> i32
    %143 = "llvm.intr.ssub.sat"(%arg82, %arg83) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "usub_sat_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg76: i32, %arg77: i32, %arg78: vector<8xi32>, %arg79: vector<8xi32>):
    %140 = "llvm.intr.usub.sat"(%arg76, %arg77) : (i32, i32) -> i32
    %141 = "llvm.intr.usub.sat"(%arg78, %arg79) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "sshl_sat_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg72: i32, %arg73: i32, %arg74: vector<8xi32>, %arg75: vector<8xi32>):
    %138 = "llvm.intr.sshl.sat"(%arg72, %arg73) : (i32, i32) -> i32
    %139 = "llvm.intr.sshl.sat"(%arg74, %arg75) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, i32, vector<8xi32>, vector<8xi32>)>, linkage = #llvm.linkage<external>, sym_name = "ushl_sat_test", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg68: i32, %arg69: i32, %arg70: vector<8xi32>, %arg71: vector<8xi32>):
    %136 = "llvm.intr.ushl.sat"(%arg68, %arg69) : (i32, i32) -> i32
    %137 = "llvm.intr.ushl.sat"(%arg70, %arg71) : (vector<8xi32>, vector<8xi32>) -> vector<8xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "coro_id", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %131 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %132 = "llvm.mlir.constant"() <{value = 16 : i64}> : () -> i64
    %133 = "llvm.alloca"(%132) <{elem_type = i8}> : (i64) -> !llvm.ptr
    %134 = "llvm.mlir.zero"() : () -> !llvm.ptr
    %135 = "llvm.intr.coro.id"(%131, %133, %134, %134) : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> token
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "coro_begin", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg67: !llvm.ptr):
    %127 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %128 = "llvm.mlir.zero"() : () -> !llvm.ptr
    %129 = "llvm.intr.coro.id"(%127, %128, %128, %128) : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> token
    %130 = "llvm.intr.coro.begin"(%129, %arg67) : (token, !llvm.ptr) -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "coro_size", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %125 = "llvm.intr.coro.size"() : () -> i64
    %126 = "llvm.intr.coro.size"() : () -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "coro_align", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %123 = "llvm.intr.coro.align"() : () -> i64
    %124 = "llvm.intr.coro.align"() : () -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "coro_save", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg66: !llvm.ptr):
    %122 = "llvm.intr.coro.save"(%arg66) : (!llvm.ptr) -> token
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i1)>, linkage = #llvm.linkage<external>, sym_name = "coro_suspend", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg65: i1):
    %118 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %119 = "llvm.mlir.zero"() : () -> !llvm.ptr
    %120 = "llvm.intr.coro.id"(%118, %119, %119, %119) : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> token
    %121 = "llvm.intr.coro.suspend"(%120, %arg65) : (token, i1) -> i8
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i1)>, linkage = #llvm.linkage<external>, sym_name = "coro_end", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg63: !llvm.ptr, %arg64: i1):
    %116 = "llvm.mlir.none"() : () -> token
    %117 = "llvm.intr.coro.end"(%arg63, %arg64, %116) : (!llvm.ptr, i1, token) -> !llvm.void
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "coro_free", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg62: !llvm.ptr):
    %112 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %113 = "llvm.mlir.zero"() : () -> !llvm.ptr
    %114 = "llvm.intr.coro.id"(%112, %113, %113, %113) : (i32, !llvm.ptr, !llvm.ptr, !llvm.ptr) -> token
    %115 = "llvm.intr.coro.free"(%114, %arg62) : (token, !llvm.ptr) -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "coro_resume", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg61: !llvm.ptr):
    "llvm.intr.coro.resume"(%arg61) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i1)>, linkage = #llvm.linkage<external>, sym_name = "coro_promise", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg58: !llvm.ptr, %arg59: i32, %arg60: i1):
    %111 = "llvm.intr.coro.promise"(%arg58, %arg59, %arg60) : (!llvm.ptr, i32, i1) -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "eh_typeid_for", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg57: !llvm.ptr):
    %110 = "llvm.intr.eh.typeid.for"(%arg57) : (!llvm.ptr) -> i32
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "stack_save", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %108 = "llvm.intr.stacksave"() : () -> !llvm.ptr
    %109 = "llvm.intr.stacksave"() : () -> !llvm.ptr<1>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "stack_restore", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg55: !llvm.ptr, %arg56: !llvm.ptr<1>):
    "llvm.intr.stackrestore"(%arg55) : (!llvm.ptr) -> ()
    "llvm.intr.stackrestore"(%arg56) : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<8xi32>, vector<8xi32>, vector<8xf32>, vector<8xf32>, vector<8xi64>, vector<8xf64>, vector<8x!llvm.ptr>, i32, f32, ptr, ptr, vector<8xi1>, i32)>, linkage = #llvm.linkage<external>, sym_name = "vector_predication_intrinsics", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg42: vector<8xi32>, %arg43: vector<8xi32>, %arg44: vector<8xf32>, %arg45: vector<8xf32>, %arg46: vector<8xi64>, %arg47: vector<8xf64>, %arg48: vector<8x!llvm.ptr>, %arg49: i32, %arg50: f32, %arg51: !llvm.ptr, %arg52: !llvm.ptr, %arg53: vector<8xi1>, %arg54: i32):
    %57 = "llvm.intr.vp.add"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %58 = "llvm.intr.vp.sub"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %59 = "llvm.intr.vp.mul"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %60 = "llvm.intr.vp.sdiv"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %61 = "llvm.intr.vp.udiv"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %62 = "llvm.intr.vp.srem"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %63 = "llvm.intr.vp.urem"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %64 = "llvm.intr.vp.ashr"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %65 = "llvm.intr.vp.lshr"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %66 = "llvm.intr.vp.shl"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %67 = "llvm.intr.vp.or"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %68 = "llvm.intr.vp.and"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %69 = "llvm.intr.vp.xor"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %70 = "llvm.intr.vp.smax"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %71 = "llvm.intr.vp.smin"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %72 = "llvm.intr.vp.umax"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %73 = "llvm.intr.vp.umin"(%arg42, %arg43, %arg53, %arg54) : (vector<8xi32>, vector<8xi32>, vector<8xi1>, i32) -> vector<8xi32>
    %74 = "llvm.intr.vp.fadd"(%arg44, %arg45, %arg53, %arg54) : (vector<8xf32>, vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %75 = "llvm.intr.vp.fsub"(%arg44, %arg45, %arg53, %arg54) : (vector<8xf32>, vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %76 = "llvm.intr.vp.fmul"(%arg44, %arg45, %arg53, %arg54) : (vector<8xf32>, vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %77 = "llvm.intr.vp.fdiv"(%arg44, %arg45, %arg53, %arg54) : (vector<8xf32>, vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %78 = "llvm.intr.vp.frem"(%arg44, %arg45, %arg53, %arg54) : (vector<8xf32>, vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %79 = "llvm.intr.vp.fneg"(%arg44, %arg53, %arg54) : (vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %80 = "llvm.intr.vp.fma"(%arg44, %arg45, %arg45, %arg53, %arg54) : (vector<8xf32>, vector<8xf32>, vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %81 = "llvm.intr.vp.fmuladd"(%arg44, %arg45, %arg45, %arg53, %arg54) : (vector<8xf32>, vector<8xf32>, vector<8xf32>, vector<8xi1>, i32) -> vector<8xf32>
    %82 = "llvm.intr.vp.reduce.add"(%arg49, %arg42, %arg53, %arg54) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %83 = "llvm.intr.vp.reduce.mul"(%arg49, %arg42, %arg53, %arg54) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %84 = "llvm.intr.vp.reduce.and"(%arg49, %arg42, %arg53, %arg54) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %85 = "llvm.intr.vp.reduce.or"(%arg49, %arg42, %arg53, %arg54) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %86 = "llvm.intr.vp.reduce.xor"(%arg49, %arg42, %arg53, %arg54) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %87 = "llvm.intr.vp.reduce.smax"(%arg49, %arg42, %arg53, %arg54) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %88 = "llvm.intr.vp.reduce.smin"(%arg49, %arg42, %arg53, %arg54) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %89 = "llvm.intr.vp.reduce.umax"(%arg49, %arg42, %arg53, %arg54) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %90 = "llvm.intr.vp.reduce.umin"(%arg49, %arg42, %arg53, %arg54) : (i32, vector<8xi32>, vector<8xi1>, i32) -> i32
    %91 = "llvm.intr.vp.reduce.fadd"(%arg50, %arg44, %arg53, %arg54) : (f32, vector<8xf32>, vector<8xi1>, i32) -> f32
    %92 = "llvm.intr.vp.reduce.fmul"(%arg50, %arg44, %arg53, %arg54) : (f32, vector<8xf32>, vector<8xi1>, i32) -> f32
    %93 = "llvm.intr.vp.reduce.fmax"(%arg50, %arg44, %arg53, %arg54) : (f32, vector<8xf32>, vector<8xi1>, i32) -> f32
    %94 = "llvm.intr.vp.reduce.fmin"(%arg50, %arg44, %arg53, %arg54) : (f32, vector<8xf32>, vector<8xi1>, i32) -> f32
    %95 = "llvm.intr.vp.select"(%arg53, %arg42, %arg43, %arg54) : (vector<8xi1>, vector<8xi32>, vector<8xi32>, i32) -> vector<8xi32>
    %96 = "llvm.intr.vp.merge"(%arg53, %arg42, %arg43, %arg54) : (vector<8xi1>, vector<8xi32>, vector<8xi32>, i32) -> vector<8xi32>
    "llvm.intr.vp.store"(%arg42, %arg51, %arg53, %arg54) : (vector<8xi32>, !llvm.ptr, vector<8xi1>, i32) -> ()
    %97 = "llvm.intr.vp.load"(%arg51, %arg53, %arg54) : (!llvm.ptr, vector<8xi1>, i32) -> vector<8xi32>
    "llvm.intr.experimental.vp.strided.store"(%arg42, %arg51, %arg49, %arg53, %arg54) : (vector<8xi32>, !llvm.ptr, i32, vector<8xi1>, i32) -> ()
    %98 = "llvm.intr.experimental.vp.strided.load"(%arg51, %arg49, %arg53, %arg54) : (!llvm.ptr, i32, vector<8xi1>, i32) -> vector<8xi32>
    %99 = "llvm.intr.vp.trunc"(%arg46, %arg53, %arg54) : (vector<8xi64>, vector<8xi1>, i32) -> vector<8xi32>
    %100 = "llvm.intr.vp.zext"(%arg42, %arg53, %arg54) : (vector<8xi32>, vector<8xi1>, i32) -> vector<8xi64>
    %101 = "llvm.intr.vp.sext"(%arg42, %arg53, %arg54) : (vector<8xi32>, vector<8xi1>, i32) -> vector<8xi64>
    %102 = "llvm.intr.vp.fptrunc"(%arg47, %arg53, %arg54) : (vector<8xf64>, vector<8xi1>, i32) -> vector<8xf32>
    %103 = "llvm.intr.vp.fpext"(%arg44, %arg53, %arg54) : (vector<8xf32>, vector<8xi1>, i32) -> vector<8xf64>
    %104 = "llvm.intr.vp.fptoui"(%arg47, %arg53, %arg54) : (vector<8xf64>, vector<8xi1>, i32) -> vector<8xi64>
    %105 = "llvm.intr.vp.fptosi"(%arg47, %arg53, %arg54) : (vector<8xf64>, vector<8xi1>, i32) -> vector<8xi64>
    %106 = "llvm.intr.vp.ptrtoint"(%arg48, %arg53, %arg54) : (vector<8x!llvm.ptr>, vector<8xi1>, i32) -> vector<8xi64>
    %107 = "llvm.intr.vp.inttoptr"(%arg46, %arg53, %arg54) : (vector<8xi64>, vector<8xi1>, i32) -> vector<8x!llvm.ptr>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<8xi32>, vector<4xi32>, vector<[4]xi32>)>, linkage = #llvm.linkage<external>, sym_name = "vector_insert_extract", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg39: vector<8xi32>, %arg40: vector<4xi32>, %arg41: vector<[4]xi32>):
    %50 = "llvm.intr.vector.insert"(%arg41, %arg39) <{pos = 0 : i64}> : (vector<[4]xi32>, vector<8xi32>) -> vector<[4]xi32>
    %51 = "llvm.intr.vector.insert"(%arg41, %arg40) <{pos = 0 : i64}> : (vector<[4]xi32>, vector<4xi32>) -> vector<[4]xi32>
    %52 = "llvm.intr.vector.insert"(%51, %arg40) <{pos = 4 : i64}> : (vector<[4]xi32>, vector<4xi32>) -> vector<[4]xi32>
    %53 = "llvm.intr.vector.insert"(%arg39, %arg40) <{pos = 4 : i64}> : (vector<8xi32>, vector<4xi32>) -> vector<8xi32>
    %54 = "llvm.intr.vector.extract"(%52) <{pos = 0 : i64}> : (vector<[4]xi32>) -> vector<8xi32>
    %55 = "llvm.intr.vector.extract"(%52) <{pos = 0 : i64}> : (vector<[4]xi32>) -> vector<4xi32>
    %56 = "llvm.intr.vector.extract"(%arg39) <{pos = 6 : i64}> : (vector<8xi32>) -> vector<2xi32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<4xf64>, vector<[8]xi32>)>, linkage = #llvm.linkage<external>, sym_name = "vector_deinterleave2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg37: vector<4xf64>, %arg38: vector<[8]xi32>):
    %48 = "llvm.intr.vector.deinterleave2"(%arg37) : (vector<4xf64>) -> !llvm.struct<(vector<2xf64>, vector<2xf64>)>
    %49 = "llvm.intr.vector.deinterleave2"(%arg38) : (vector<[8]xi32>) -> !llvm.struct<(vector<[4]xi32>, vector<[4]xi32>)>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "lifetime", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %46 = "llvm.mlir.constant"() <{value = 16 : i64}> : () -> i64
    %47 = "llvm.alloca"(%46) <{elem_type = i8}> : (i64) -> !llvm.ptr
    "llvm.intr.lifetime.start"(%47) : (!llvm.ptr) -> ()
    "llvm.intr.lifetime.end"(%47) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "invariant", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg36: !llvm.ptr):
    %45 = "llvm.intr.invariant.start"(%arg36) <{size = 16 : i64}> : (!llvm.ptr) -> !llvm.ptr
    "llvm.intr.invariant.end"(%45, %arg36) <{size = 16 : i64}> : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "invariant_group", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg35: !llvm.ptr):
    %43 = "llvm.intr.launder.invariant.group"(%arg35) : (!llvm.ptr) -> !llvm.ptr
    %44 = "llvm.intr.strip.invariant.group"(%arg35) : (!llvm.ptr) -> !llvm.ptr
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<f32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "ssa_copy", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg34: f32):
    %42 = "llvm.intr.ssa.copy"(%arg34) : (f32) -> f32
    "llvm.return"(%42) : (f32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<ptr (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "ptrmask", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg32: !llvm.ptr, %arg33: i64):
    %41 = "llvm.intr.ptrmask"(%arg32, %arg33) : (!llvm.ptr, i64) -> !llvm.ptr
    "llvm.return"(%41) : (!llvm.ptr) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<8x!llvm.ptr> (vector<8x!llvm.ptr>, vector<8xi64>)>, linkage = #llvm.linkage<external>, sym_name = "vector_ptrmask", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg30: vector<8x!llvm.ptr>, %arg31: vector<8xi64>):
    %40 = "llvm.intr.ptrmask"(%arg30, %arg31) : (vector<8x!llvm.ptr>, vector<8xi64>) -> vector<8x!llvm.ptr>
    "llvm.return"(%40) : (vector<8x!llvm.ptr>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fadd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg28: f32, %arg29: vector<4xf32>):
    %38 = "llvm.intr.experimental.constrained.fadd"(%arg28, %arg28) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f32, f32) -> f32
    %39 = "llvm.intr.experimental.constrained.fadd"(%arg29, %arg29) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fsub", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg26: f32, %arg27: vector<4xf32>):
    %36 = "llvm.intr.experimental.constrained.fsub"(%arg26, %arg26) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f32, f32) -> f32
    %37 = "llvm.intr.experimental.constrained.fsub"(%arg27, %arg27) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fmul", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg24: f32, %arg25: vector<4xf32>):
    %34 = "llvm.intr.experimental.constrained.fmul"(%arg24, %arg24) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f32, f32) -> f32
    %35 = "llvm.intr.experimental.constrained.fmul"(%arg25, %arg25) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fdiv", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg22: f32, %arg23: vector<4xf32>):
    %32 = "llvm.intr.experimental.constrained.fdiv"(%arg22, %arg22) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f32, f32) -> f32
    %33 = "llvm.intr.experimental.constrained.fdiv"(%arg23, %arg23) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_frem", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg20: f32, %arg21: vector<4xf32>):
    %30 = "llvm.intr.experimental.constrained.frem"(%arg20, %arg20) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f32, f32) -> f32
    %31 = "llvm.intr.experimental.constrained.frem"(%arg21, %arg21) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fma", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: f32, %arg19: vector<4xf32>):
    %28 = "llvm.intr.experimental.constrained.fma"(%arg18, %arg18, %arg18) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f32, f32, f32) -> f32
    %29 = "llvm.intr.experimental.constrained.fma"(%arg19, %arg19, %arg19) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (vector<4xf32>, vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fmuladd", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg16: f32, %arg17: vector<4xf32>):
    %26 = "llvm.intr.experimental.constrained.fmuladd"(%arg16, %arg16, %arg16) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f32, f32, f32) -> f32
    %27 = "llvm.intr.experimental.constrained.fmuladd"(%arg17, %arg17, %arg17) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (vector<4xf32>, vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_uitofp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg14: i32, %arg15: vector<4xi32>):
    %20 = "llvm.intr.experimental.constrained.uitofp"(%arg14) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (i32) -> f32
    %21 = "llvm.intr.experimental.constrained.uitofp"(%arg14) <{fpExceptionBehavior = 1 : i64, roundingmode = 1 : i64}> : (i32) -> f32
    %22 = "llvm.intr.experimental.constrained.uitofp"(%arg14) <{fpExceptionBehavior = 2 : i64, roundingmode = 2 : i64}> : (i32) -> f32
    %23 = "llvm.intr.experimental.constrained.uitofp"(%arg14) <{fpExceptionBehavior = 0 : i64, roundingmode = 3 : i64}> : (i32) -> f32
    %24 = "llvm.intr.experimental.constrained.uitofp"(%arg14) <{fpExceptionBehavior = 0 : i64, roundingmode = 4 : i64}> : (i32) -> f32
    %25 = "llvm.intr.experimental.constrained.uitofp"(%arg15) <{fpExceptionBehavior = 2 : i64, roundingmode = 2 : i64}> : (vector<4xi32>) -> vector<4xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_sitofp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: i32, %arg13: vector<4xi32>):
    %14 = "llvm.intr.experimental.constrained.sitofp"(%arg12) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (i32) -> f32
    %15 = "llvm.intr.experimental.constrained.sitofp"(%arg12) <{fpExceptionBehavior = 1 : i64, roundingmode = 1 : i64}> : (i32) -> f32
    %16 = "llvm.intr.experimental.constrained.sitofp"(%arg12) <{fpExceptionBehavior = 2 : i64, roundingmode = 2 : i64}> : (i32) -> f32
    %17 = "llvm.intr.experimental.constrained.sitofp"(%arg12) <{fpExceptionBehavior = 0 : i64, roundingmode = 3 : i64}> : (i32) -> f32
    %18 = "llvm.intr.experimental.constrained.sitofp"(%arg12) <{fpExceptionBehavior = 0 : i64, roundingmode = 4 : i64}> : (i32) -> f32
    %19 = "llvm.intr.experimental.constrained.sitofp"(%arg13) <{fpExceptionBehavior = 2 : i64, roundingmode = 2 : i64}> : (vector<4xi32>) -> vector<4xf32>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f64, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fptrunc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg10: f64, %arg11: vector<4xf32>):
    %8 = "llvm.intr.experimental.constrained.fptrunc"(%arg10) <{fpExceptionBehavior = 0 : i64, roundingmode = 0 : i64}> : (f64) -> f32
    %9 = "llvm.intr.experimental.constrained.fptrunc"(%arg10) <{fpExceptionBehavior = 1 : i64, roundingmode = 1 : i64}> : (f64) -> f32
    %10 = "llvm.intr.experimental.constrained.fptrunc"(%arg10) <{fpExceptionBehavior = 2 : i64, roundingmode = 2 : i64}> : (f64) -> f32
    %11 = "llvm.intr.experimental.constrained.fptrunc"(%arg10) <{fpExceptionBehavior = 0 : i64, roundingmode = 3 : i64}> : (f64) -> f32
    %12 = "llvm.intr.experimental.constrained.fptrunc"(%arg10) <{fpExceptionBehavior = 0 : i64, roundingmode = 4 : i64}> : (f64) -> f32
    %13 = "llvm.intr.experimental.constrained.fptrunc"(%arg11) <{fpExceptionBehavior = 2 : i64, roundingmode = 2 : i64}> : (vector<4xf32>) -> vector<4xf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, vector<4xf32>)>, linkage = #llvm.linkage<external>, sym_name = "experimental_constrained_fpext", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: f32, %arg9: vector<4xf32>):
    %4 = "llvm.intr.experimental.constrained.fpext"(%arg8) <{fpExceptionBehavior = 0 : i64}> : (f32) -> f64
    %5 = "llvm.intr.experimental.constrained.fpext"(%arg8) <{fpExceptionBehavior = 1 : i64}> : (f32) -> f64
    %6 = "llvm.intr.experimental.constrained.fpext"(%arg8) <{fpExceptionBehavior = 2 : i64}> : (f32) -> f64
    %7 = "llvm.intr.experimental.constrained.fpext"(%arg9) <{fpExceptionBehavior = 2 : i64}> : (vector<4xf32>) -> vector<4xf64>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i2 (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "ucmp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: i32, %arg7: i32):
    %3 = "llvm.intr.ucmp"(%arg6, %arg7) : (i32, i32) -> i2
    "llvm.return"(%3) : (i2) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi32> (vector<4xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "vector_ucmp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: vector<4xi32>, %arg5: vector<4xi32>):
    %2 = "llvm.intr.ucmp"(%arg4, %arg5) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "llvm.return"(%2) : (vector<4xi32>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i2 (i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "scmp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: i32, %arg3: i32):
    %1 = "llvm.intr.scmp"(%arg2, %arg3) : (i32, i32) -> i2
    "llvm.return"(%1) : (i2) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi32> (vector<4xi32>, vector<4xi32>)>, linkage = #llvm.linkage<external>, sym_name = "vector_scmp", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xi32>, %arg1: vector<4xi32>):
    %0 = "llvm.intr.scmp"(%arg0, %arg1) : (vector<4xi32>, vector<4xi32>) -> vector<4xi32>
    "llvm.return"(%0) : (vector<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

