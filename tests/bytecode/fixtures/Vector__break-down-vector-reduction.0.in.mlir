"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>) -> (f32, f32, f32, f32, f32, f32), sym_name = "reduce_2x_f32"}> ({
  ^bb0(%arg12: vector<2xf32> loc("<stdin>":3:8)):
    %19 = "vector.reduction"(%arg12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<2xf32>) -> f32 loc("<stdin>":4:11)
    %20 = "vector.reduction"(%arg12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<2xf32>) -> f32 loc("<stdin>":5:11)
    %21 = "vector.reduction"(%arg12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minnumf>}> : (vector<2xf32>) -> f32 loc("<stdin>":6:11)
    %22 = "vector.reduction"(%arg12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxnumf>}> : (vector<2xf32>) -> f32 loc("<stdin>":7:11)
    %23 = "vector.reduction"(%arg12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minimumf>}> : (vector<2xf32>) -> f32 loc("<stdin>":8:11)
    %24 = "vector.reduction"(%arg12) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maximumf>}> : (vector<2xf32>) -> f32 loc("<stdin>":9:11)
    "func.return"(%19, %20, %21, %22, %23, %24) : (f32, f32, f32, f32, f32, f32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<2xi32>) -> (i32, i32, i32, i32, i32, i32, i32, i32, i32), sym_name = "reduce_2x_i32"}> ({
  ^bb0(%arg11: vector<2xi32> loc("<stdin>":13:8)):
    %10 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<2xi32>) -> i32 loc("<stdin>":14:11)
    %11 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<mul>}> : (vector<2xi32>) -> i32 loc("<stdin>":15:11)
    %12 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minsi>}> : (vector<2xi32>) -> i32 loc("<stdin>":16:11)
    %13 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxsi>}> : (vector<2xi32>) -> i32 loc("<stdin>":17:11)
    %14 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<minui>}> : (vector<2xi32>) -> i32 loc("<stdin>":18:11)
    %15 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<maxui>}> : (vector<2xi32>) -> i32 loc("<stdin>":19:11)
    %16 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<and>}> : (vector<2xi32>) -> i32 loc("<stdin>":20:11)
    %17 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<or>}> : (vector<2xi32>) -> i32 loc("<stdin>":21:11)
    %18 = "vector.reduction"(%arg11) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<xor>}> : (vector<2xi32>) -> i32 loc("<stdin>":22:11)
    "func.return"(%10, %11, %12, %13, %14, %15, %16, %17, %18) : (i32, i32, i32, i32, i32, i32, i32, i32, i32) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<1xf32>) -> f32, sym_name = "reduce_1x_f32"}> ({
  ^bb0(%arg10: vector<1xf32> loc("<stdin>":26:8)):
    %9 = "vector.reduction"(%arg10) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<1xf32>) -> f32 loc("<stdin>":27:10)
    "func.return"(%9) : (f32) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (vector<1xf32>, f32) -> f32, sym_name = "reduce_1x_acc_f32"}> ({
  ^bb0(%arg8: vector<1xf32> loc("<stdin>":31:8), %arg9: f32 loc("<stdin>":31:30)):
    %8 = "vector.reduction"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<1xf32>, f32) -> f32 loc("<stdin>":32:10)
    "func.return"(%8) : (f32) -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = (vector<1xi32>, i32) -> i32, sym_name = "reduce_1x_acc_i32"}> ({
  ^bb0(%arg6: vector<1xi32> loc("<stdin>":36:8), %arg7: i32 loc("<stdin>":36:30)):
    %7 = "vector.reduction"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<1xi32>, i32) -> i32 loc("<stdin>":37:10)
    "func.return"(%7) : (i32) -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":35:3)
  "func.func"() <{function_type = (vector<2xf32>, f32) -> (f32, f32), sym_name = "reduce_2x_acc_f32"}> ({
  ^bb0(%arg4: vector<2xf32> loc("<stdin>":41:8), %arg5: f32 loc("<stdin>":41:30)):
    %5 = "vector.reduction"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<2xf32>, f32) -> f32 loc("<stdin>":42:10)
    %6 = "vector.reduction"(%arg4, %arg5) <{fastmath = #arith.fastmath<nnan>, kind = #vector.kind<mul>}> : (vector<2xf32>, f32) -> f32 loc("<stdin>":43:10)
    "func.return"(%5, %6) : (f32, f32) -> () loc("<stdin>":44:5)
  }) : () -> () loc("<stdin>":40:3)
  "func.func"() <{function_type = (vector<3xf32>) -> f32, sym_name = "reduce_3x_f32"}> ({
  ^bb0(%arg3: vector<3xf32> loc("<stdin>":47:8)):
    %4 = "vector.reduction"(%arg3) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<3xf32>) -> f32 loc("<stdin>":48:10)
    "func.return"(%4) : (f32) -> () loc("<stdin>":49:5)
  }) : () -> () loc("<stdin>":46:3)
  "func.func"() <{function_type = (vector<3xf32>, index) -> f32, sym_name = "reduce_mask_3x_f32"}> ({
  ^bb0(%arg1: vector<3xf32> loc("<stdin>":52:8), %arg2: index loc("<stdin>":52:30)):
    %1 = "vector.create_mask"(%arg2) : (index) -> vector<3xi1> loc("<stdin>":53:10)
    %2 = "vector.mask"(%1) ({
      %3 = "vector.reduction"(%arg1) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<3xf32>) -> f32 loc("<stdin>":55:12)
      "vector.yield"(%3) : (f32) -> () loc("<stdin>":56:7)
    }) : (vector<3xi1>) -> f32 loc("<stdin>":54:10)
    "func.return"(%2) : (f32) -> () loc("<stdin>":58:5)
  }) : () -> () loc("<stdin>":51:3)
  "func.func"() <{function_type = (vector<[1]xf32>) -> f32, sym_name = "reduce_scalable_f32"}> ({
  ^bb0(%arg0: vector<[1]xf32> loc("<stdin>":61:8)):
    %0 = "vector.reduction"(%arg0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<[1]xf32>) -> f32 loc("<stdin>":62:10)
    "func.return"(%0) : (f32) -> () loc("<stdin>":63:5)
  }) : () -> () loc("<stdin>":60:3)
}) : () -> () loc("<stdin>":1:1)
