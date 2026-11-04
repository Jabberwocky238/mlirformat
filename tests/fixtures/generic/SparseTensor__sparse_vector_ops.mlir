#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1024xf32, #sparse>, tensor<1024xf32, #sparse>) -> tensor<1024xf32>, sym_name = "vops"}> ({
  ^bb0(%arg0: tensor<1024xf32, #sparse>, %arg1: tensor<1024xf32, #sparse>):
    %0 = "tensor.empty"() : () -> tensor<1024xf32>
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 255 : i64}> : () -> i64
    %4 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %6 = "linalg.generic"(%arg0, %arg1, %0) <{doc = "x(i) = a(i) ops b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %7 = "math.absf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %8 = "math.ceil"(%7) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %9 = "math.floor"(%8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %10 = "math.sqrt"(%9) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %11 = "math.expm1"(%10) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %12 = "math.sin"(%11) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %13 = "math.tanh"(%12) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %14 = "arith.negf"(%13) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      %15 = "arith.mulf"(%14, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %16 = "arith.divf"(%15, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %17 = "arith.addf"(%16, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %18 = "arith.subf"(%17, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %19 = "arith.extf"(%18) : (f32) -> f64
      %20 = "arith.bitcast"(%19) : (f64) -> i64
      %21 = "arith.addi"(%20, %20) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %22 = "arith.andi"(%21, %3) : (i64, i64) -> i64
      %23 = "arith.trunci"(%22) <{overflowFlags = #arith.overflow<none>}> : (i64) -> i16
      %24 = "arith.extsi"(%23) : (i16) -> i32
      %25 = "arith.shrsi"(%24, %4) : (i32, i32) -> i32
      %26 = "arith.shrui"(%25, %4) : (i32, i32) -> i32
      %27 = "arith.shli"(%26, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %28 = "arith.uitofp"(%27) : (i32) -> f32
      "linalg.yield"(%28) : (f32) -> ()
    }) : (tensor<1024xf32, #sparse>, tensor<1024xf32, #sparse>, tensor<1024xf32>) -> tensor<1024xf32>
    "func.return"(%6) : (tensor<1024xf32>) -> ()
  }) : () -> ()
}) : () -> ()

