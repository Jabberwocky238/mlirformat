"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>) -> (f32, f32, f32, f32, f32, f32), sym_name = "reduce_2x_f32"}> ({
  ^bb0(%arg12: vector<2xf32>):
    %19 = "vector.reduction"(%arg12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<2xf32>) -> f32
    %20 = "vector.reduction"(%arg12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<2xf32>) -> f32
    %21 = "vector.reduction"(%arg12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minnumf>}> : (vector<2xf32>) -> f32
    %22 = "vector.reduction"(%arg12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxnumf>}> : (vector<2xf32>) -> f32
    %23 = "vector.reduction"(%arg12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minimumf>}> : (vector<2xf32>) -> f32
    %24 = "vector.reduction"(%arg12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maximumf>}> : (vector<2xf32>) -> f32
    "func.return"(%19, %20, %21, %22, %23, %24) : (f32, f32, f32, f32, f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi32>) -> (i32, i32, i32, i32, i32, i32, i32, i32, i32), sym_name = "reduce_2x_i32"}> ({
  ^bb0(%arg11: vector<2xi32>):
    %10 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<2xi32>) -> i32
    %11 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<2xi32>) -> i32
    %12 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minsi>}> : (vector<2xi32>) -> i32
    %13 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxsi>}> : (vector<2xi32>) -> i32
    %14 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minui>}> : (vector<2xi32>) -> i32
    %15 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxui>}> : (vector<2xi32>) -> i32
    %16 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<and>}> : (vector<2xi32>) -> i32
    %17 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<or>}> : (vector<2xi32>) -> i32
    %18 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<xor>}> : (vector<2xi32>) -> i32
    "func.return"(%10, %11, %12, %13, %14, %15, %16, %17, %18) : (i32, i32, i32, i32, i32, i32, i32, i32, i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1xf32>) -> f32, sym_name = "reduce_1x_f32"}> ({
  ^bb0(%arg10: vector<1xf32>):
    %9 = "vector.reduction"(%arg10) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<1xf32>) -> f32
    "func.return"(%9) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1xf32>, f32) -> f32, sym_name = "reduce_1x_acc_f32"}> ({
  ^bb0(%arg8: vector<1xf32>, %arg9: f32):
    %8 = "vector.reduction"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<1xf32>, f32) -> f32
    "func.return"(%8) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<1xi32>, i32) -> i32, sym_name = "reduce_1x_acc_i32"}> ({
  ^bb0(%arg6: vector<1xi32>, %arg7: i32):
    %7 = "vector.reduction"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<1xi32>, i32) -> i32
    "func.return"(%7) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, f32) -> (f32, f32), sym_name = "reduce_2x_acc_f32"}> ({
  ^bb0(%arg4: vector<2xf32>, %arg5: f32):
    %5 = "vector.reduction"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<2xf32>, f32) -> f32
    %6 = "vector.reduction"(%arg4, %arg5) <{fastmath = #arith.fastmath<nnan>, kind = #vector.kind<mul>}> : (vector<2xf32>, f32) -> f32
    "func.return"(%5, %6) : (f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>) -> f32, sym_name = "reduce_3x_f32"}> ({
  ^bb0(%arg3: vector<3xf32>):
    %4 = "vector.reduction"(%arg3) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<3xf32>) -> f32
    "func.return"(%4) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf32>, index) -> f32, sym_name = "reduce_mask_3x_f32"}> ({
  ^bb0(%arg1: vector<3xf32>, %arg2: index):
    %1 = "vector.create_mask"(%arg2) : (index) -> vector<3xi1>
    %2 = "vector.mask"(%1) ({
      %3 = "vector.reduction"(%arg1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<3xf32>) -> f32
      "vector.yield"(%3) : (f32) -> ()
    }) : (vector<3xi1>) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[1]xf32>) -> f32, sym_name = "reduce_scalable_f32"}> ({
  ^bb0(%arg0: vector<[1]xf32>):
    %0 = "vector.reduction"(%arg0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<[1]xf32>) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

