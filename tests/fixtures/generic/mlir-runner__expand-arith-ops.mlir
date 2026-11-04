"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "trunc_bf16"}> ({
  ^bb0(%arg0: f32):
    %22 = "arith.truncf"(%arg0) : (f32) -> bf16
    %23 = "arith.extf"(%22) : (bf16) -> f32
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 1065385984 : i32}> : () -> i32
    %1 = "arith.bitcast"(%0) : (i32) -> f32
    "func.call"(%1) <{callee = @trunc_bf16}> : (f32) -> ()
    %2 = "arith.constant"() <{value = 1065451520 : i32}> : () -> i32
    %3 = "arith.bitcast"(%2) : (i32) -> f32
    "func.call"(%3) <{callee = @trunc_bf16}> : (f32) -> ()
    %4 = "arith.constant"() <{value = -1082097664 : i32}> : () -> i32
    %5 = "arith.bitcast"(%4) : (i32) -> f32
    "func.call"(%5) <{callee = @trunc_bf16}> : (f32) -> ()
    %6 = "arith.constant"() <{value = -1082097663 : i32}> : () -> i32
    %7 = "arith.bitcast"(%6) : (i32) -> f32
    "func.call"(%7) <{callee = @trunc_bf16}> : (f32) -> ()
    %8 = "arith.constant"() <{value = 2139095040 : i32}> : () -> i32
    %9 = "arith.bitcast"(%8) : (i32) -> f32
    "func.call"(%9) <{callee = @trunc_bf16}> : (f32) -> ()
    %10 = "arith.constant"() <{value = -8388608 : i32}> : () -> i32
    %11 = "arith.bitcast"(%10) : (i32) -> f32
    "func.call"(%11) <{callee = @trunc_bf16}> : (f32) -> ()
    %12 = "arith.constant"() <{value = 2139095039 : i32}> : () -> i32
    %13 = "arith.bitcast"(%12) : (i32) -> f32
    "func.call"(%13) <{callee = @trunc_bf16}> : (f32) -> ()
    %14 = "arith.constant"() <{value = -8388609 : i32}> : () -> i32
    %15 = "arith.bitcast"(%14) : (i32) -> f32
    "func.call"(%15) <{callee = @trunc_bf16}> : (f32) -> ()
    %16 = "arith.constant"() <{value = 2139029503 : i32}> : () -> i32
    %17 = "arith.bitcast"(%16) : (i32) -> f32
    "func.call"(%17) <{callee = @trunc_bf16}> : (f32) -> ()
    %18 = "arith.constant"() <{value = 1070596095 : i32}> : () -> i32
    %19 = "arith.bitcast"(%18) : (i32) -> f32
    "func.call"(%19) <{callee = @trunc_bf16}> : (f32) -> ()
    %20 = "arith.constant"() <{value = -1076887553 : i32}> : () -> i32
    %21 = "arith.bitcast"(%20) : (i32) -> f32
    "func.call"(%21) <{callee = @trunc_bf16}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

