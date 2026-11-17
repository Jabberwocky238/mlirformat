"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "test_for"}> ({
  ^bb0(%arg2: index loc("<stdin>":3:8), %arg3: index loc("<stdin>":3:22), %arg4: index loc("<stdin>":3:36)):
    %30 = "emitc.expression"(%arg2, %arg3) ({
    ^bb0(%arg10: index loc("<stdin>":5:10), %arg11: index loc("<stdin>":5:25)):
      %36 = "emitc.add"(%arg10, %arg11) : (index, index) -> index loc("<stdin>":6:13)
      "emitc.yield"(%36) : (index) -> () loc("<stdin>":7:7)
    }) : (index, index) -> index loc("<stdin>":4:11)
    %31 = "emitc.expression"(%arg3, %arg4) ({
    ^bb0(%arg8: index loc("<stdin>":10:10), %arg9: index loc("<stdin>":10:24)):
      %35 = "emitc.mul"(%arg8, %arg9) : (index, index) -> index loc("<stdin>":11:13)
      "emitc.yield"(%35) : (index) -> () loc("<stdin>":12:7)
    }) : (index, index) -> index loc("<stdin>":9:11)
    %32 = "emitc.expression"(%arg2, %arg4) ({
    ^bb0(%arg6: index loc("<stdin>":15:10), %arg7: index loc("<stdin>":15:24)):
      %34 = "emitc.div"(%arg6, %arg7) : (index, index) -> index loc("<stdin>":16:13)
      "emitc.yield"(%34) : (index) -> () loc("<stdin>":17:7)
    }) : (index, index) -> index loc("<stdin>":14:11)
    "emitc.for"(%30, %31, %32) ({
    ^bb0(%arg5: index loc("<stdin>":20:10)):
      %33 = "emitc.call_opaque"() <{callee = "f"}> : () -> i32 loc("<stdin>":21:13)
      "emitc.yield"() : () -> () loc("<stdin>":22:7)
    }) : (index, index, index) -> () loc("<stdin>":19:5)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "test_for_yield"}> ({
    %15 = "emitc.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":27:11)
    %16 = "emitc.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":28:11)
    %17 = "emitc.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":29:11)
    %18 = "emitc.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":30:11)
    %19 = "emitc.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":31:11)
    %20 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32> loc("<stdin>":32:11)
    %21 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f32> loc("<stdin>":33:11)
    %22 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32> loc("<stdin>":34:11)
    %23 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f32> loc("<stdin>":35:11)
    "emitc.assign"(%22, %18) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":36:5)
    "emitc.assign"(%23, %19) : (!emitc.lvalue<f32>, f32) -> () loc("<stdin>":37:5)
    "emitc.for"(%15, %16, %17) ({
    ^bb0(%arg1: index loc("<stdin>":39:10)):
      %26 = "emitc.load"(%22) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":40:13)
      %27 = "emitc.call_opaque"(%26, %arg1) <{callee = "add"}> : (i32, index) -> i32 loc("<stdin>":41:13)
      %28 = "emitc.load"(%23) : (!emitc.lvalue<f32>) -> f32 loc("<stdin>":42:13)
      %29 = "emitc.call_opaque"(%28, %arg1) <{callee = "mul"}> : (f32, index) -> f32 loc("<stdin>":43:13)
      "emitc.assign"(%22, %27) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":44:7)
      "emitc.assign"(%23, %29) : (!emitc.lvalue<f32>, f32) -> () loc("<stdin>":45:7)
      "emitc.yield"() : () -> () loc("<stdin>":46:7)
    }) : (index, index, index) -> () loc("<stdin>":38:5)
    %24 = "emitc.load"(%22) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":48:11)
    "emitc.assign"(%20, %24) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":49:5)
    %25 = "emitc.load"(%23) : (!emitc.lvalue<f32>) -> f32 loc("<stdin>":50:11)
    "emitc.assign"(%21, %25) : (!emitc.lvalue<f32>, f32) -> () loc("<stdin>":51:5)
    "func.return"() : () -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = () -> (), sym_name = "test_for_yield_2"}> ({
    %0 = "emitc.literal"() <{value = "0"}> : () -> index loc("<stdin>":55:10)
    %1 = "emitc.literal"() <{value = "10"}> : () -> index loc("<stdin>":56:10)
    %2 = "emitc.literal"() <{value = "1"}> : () -> index loc("<stdin>":57:10)
    %3 = "emitc.literal"() <{value = "0"}> : () -> i32 loc("<stdin>":58:10)
    %4 = "emitc.literal"() <{value = "M_PI"}> : () -> f32 loc("<stdin>":59:10)
    %5 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32> loc("<stdin>":60:10)
    %6 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f32> loc("<stdin>":61:10)
    %7 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32> loc("<stdin>":62:10)
    %8 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f32> loc("<stdin>":63:10)
    "emitc.assign"(%7, %3) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":64:5)
    "emitc.assign"(%8, %4) : (!emitc.lvalue<f32>, f32) -> () loc("<stdin>":65:5)
    "emitc.for"(%0, %1, %2) ({
    ^bb0(%arg0: index loc("<stdin>":67:10)):
      %11 = "emitc.load"(%7) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":68:13)
      %12 = "emitc.call_opaque"(%11, %arg0) <{callee = "add"}> : (i32, index) -> i32 loc("<stdin>":69:13)
      %13 = "emitc.load"(%8) : (!emitc.lvalue<f32>) -> f32 loc("<stdin>":70:13)
      %14 = "emitc.call_opaque"(%13, %arg0) <{callee = "mul"}> : (f32, index) -> f32 loc("<stdin>":71:13)
      "emitc.assign"(%7, %12) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":72:7)
      "emitc.assign"(%8, %14) : (!emitc.lvalue<f32>, f32) -> () loc("<stdin>":73:7)
      "emitc.yield"() : () -> () loc("<stdin>":74:7)
    }) : (index, index, index) -> () loc("<stdin>":66:5)
    %9 = "emitc.load"(%7) : (!emitc.lvalue<i32>) -> i32 loc("<stdin>":76:10)
    "emitc.assign"(%5, %9) : (!emitc.lvalue<i32>, i32) -> () loc("<stdin>":77:5)
    %10 = "emitc.load"(%8) : (!emitc.lvalue<f32>) -> f32 loc("<stdin>":78:11)
    "emitc.assign"(%6, %10) : (!emitc.lvalue<f32>, f32) -> () loc("<stdin>":79:5)
    "func.return"() : () -> () loc("<stdin>":80:5)
  }) : () -> () loc("<stdin>":54:3)
}) : () -> () loc("<stdin>":1:1)
