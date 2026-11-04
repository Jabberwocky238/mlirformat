"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "test_for"}> ({
  ^bb0(%arg2: index, %arg3: index, %arg4: index):
    %30 = "emitc.expression"(%arg2, %arg3) ({
    ^bb0(%arg10: index, %arg11: index):
      %36 = "emitc.add"(%arg10, %arg11) : (index, index) -> index
      "emitc.yield"(%36) : (index) -> ()
    }) : (index, index) -> index
    %31 = "emitc.expression"(%arg3, %arg4) ({
    ^bb0(%arg8: index, %arg9: index):
      %35 = "emitc.mul"(%arg8, %arg9) : (index, index) -> index
      "emitc.yield"(%35) : (index) -> ()
    }) : (index, index) -> index
    %32 = "emitc.expression"(%arg2, %arg4) ({
    ^bb0(%arg6: index, %arg7: index):
      %34 = "emitc.div"(%arg6, %arg7) : (index, index) -> index
      "emitc.yield"(%34) : (index) -> ()
    }) : (index, index) -> index
    "emitc.for"(%30, %31, %32) ({
    ^bb0(%arg5: index):
      %33 = "emitc.call_opaque"() <{callee = "f"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_for_yield"}> ({
    %15 = "emitc.constant"() <{value = 0 : index}> : () -> index
    %16 = "emitc.constant"() <{value = 10 : index}> : () -> index
    %17 = "emitc.constant"() <{value = 1 : index}> : () -> index
    %18 = "emitc.constant"() <{value = 0 : i32}> : () -> i32
    %19 = "emitc.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %20 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %21 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f32>
    %22 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %23 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f32>
    "emitc.assign"(%22, %18) : (!emitc.lvalue<i32>, i32) -> ()
    "emitc.assign"(%23, %19) : (!emitc.lvalue<f32>, f32) -> ()
    "emitc.for"(%15, %16, %17) ({
    ^bb0(%arg1: index):
      %26 = "emitc.load"(%22) : (!emitc.lvalue<i32>) -> i32
      %27 = "emitc.call_opaque"(%26, %arg1) <{callee = "add"}> : (i32, index) -> i32
      %28 = "emitc.load"(%23) : (!emitc.lvalue<f32>) -> f32
      %29 = "emitc.call_opaque"(%28, %arg1) <{callee = "mul"}> : (f32, index) -> f32
      "emitc.assign"(%22, %27) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.assign"(%23, %29) : (!emitc.lvalue<f32>, f32) -> ()
      "emitc.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %24 = "emitc.load"(%22) : (!emitc.lvalue<i32>) -> i32
    "emitc.assign"(%20, %24) : (!emitc.lvalue<i32>, i32) -> ()
    %25 = "emitc.load"(%23) : (!emitc.lvalue<f32>) -> f32
    "emitc.assign"(%21, %25) : (!emitc.lvalue<f32>, f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_for_yield_2"}> ({
    %0 = "emitc.literal"() <{value = "0"}> : () -> index
    %1 = "emitc.literal"() <{value = "10"}> : () -> index
    %2 = "emitc.literal"() <{value = "1"}> : () -> index
    %3 = "emitc.literal"() <{value = "0"}> : () -> i32
    %4 = "emitc.literal"() <{value = "M_PI"}> : () -> f32
    %5 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %6 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f32>
    %7 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %8 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f32>
    "emitc.assign"(%7, %3) : (!emitc.lvalue<i32>, i32) -> ()
    "emitc.assign"(%8, %4) : (!emitc.lvalue<f32>, f32) -> ()
    "emitc.for"(%0, %1, %2) ({
    ^bb0(%arg0: index):
      %11 = "emitc.load"(%7) : (!emitc.lvalue<i32>) -> i32
      %12 = "emitc.call_opaque"(%11, %arg0) <{callee = "add"}> : (i32, index) -> i32
      %13 = "emitc.load"(%8) : (!emitc.lvalue<f32>) -> f32
      %14 = "emitc.call_opaque"(%13, %arg0) <{callee = "mul"}> : (f32, index) -> f32
      "emitc.assign"(%7, %12) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.assign"(%8, %14) : (!emitc.lvalue<f32>, f32) -> ()
      "emitc.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %9 = "emitc.load"(%7) : (!emitc.lvalue<i32>) -> i32
    "emitc.assign"(%5, %9) : (!emitc.lvalue<i32>, i32) -> ()
    %10 = "emitc.load"(%8) : (!emitc.lvalue<f32>) -> f32
    "emitc.assign"(%6, %10) : (!emitc.lvalue<f32>, f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

