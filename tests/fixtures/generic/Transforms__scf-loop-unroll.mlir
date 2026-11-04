"builtin.module"() ({
  "func.func"() <{function_type = (f32, f32) -> f32, sym_name = "scf_loop_unroll_single"}> ({
  ^bb0(%arg15: f32, %arg16: f32):
    %21 = "arith.constant"() <{value = 0 : index}> : () -> index
    %22 = "arith.constant"() <{value = 10 : index}> : () -> index
    %23 = "arith.constant"() <{value = 1 : index}> : () -> index
    %24 = "scf.for"(%21, %22, %23, %arg15) ({
    ^bb0(%arg17: index, %arg18: f32):
      %25 = "arith.addf"(%arg18, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%25) : (f32) -> ()
    }) : (index, index, index, f32) -> f32
    "func.return"(%24) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, index) -> (f32, f32), sym_name = "scf_loop_unroll_double_symbolic_ub"}> ({
  ^bb0(%arg9: f32, %arg10: f32, %arg11: index):
    %16 = "arith.constant"() <{value = 0 : index}> : () -> index
    %17 = "arith.constant"() <{value = 1 : index}> : () -> index
    %18:2 = "scf.for"(%16, %arg11, %17, %arg9, %arg10) ({
    ^bb0(%arg12: index, %arg13: f32, %arg14: f32):
      %19 = "arith.addf"(%arg13, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %20 = "arith.addf"(%arg14, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "scf.yield"(%19, %20) : (f32, f32) -> ()
    }) : (index, index, index, f32, f32) -> (f32, f32)
    "func.return"(%18#0, %18#1) : (f32, f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "scf_loop_unroll_factor_1_promote"}> ({
    %12 = "arith.constant"() <{value = 1 : index}> : () -> index
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index
    %14 = "arith.constant"() <{value = 1 : index}> : () -> index
    "scf.for"(%13, %14, %12) ({
    ^bb0(%arg8: index):
      %15 = "test.foo"(%arg8) : (index) -> i32
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> index, sym_name = "scf_loop_unroll_full_single"}> ({
  ^bb0(%arg5: index):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index
    %9 = "arith.constant"() <{value = 4 : index}> : () -> index
    %10 = "scf.for"(%7, %9, %8, %8) ({
    ^bb0(%arg6: index, %arg7: index):
      %11 = "arith.addi"(%arg7, %arg5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "scf.yield"(%11) : (index) -> ()
    }) : (index, index, index, index) -> index
    "func.return"(%10) : (index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xindex>) -> index, sym_name = "scf_loop_unroll_full_outter_loops"}> ({
  ^bb0(%arg0: vector<4x4xindex>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "scf.for"(%0, %2, %1, %0) ({
    ^bb0(%arg1: index, %arg2: index):
      %4 = "scf.for"(%0, %2, %1, %arg2) ({
      ^bb0(%arg3: index, %arg4: index):
        %5 = "vector.extract"(%arg0, %arg1, %arg3) <{static_position = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<4x4xindex>, index, index) -> index
        %6 = "arith.addi"(%5, %arg4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "scf.yield"(%5) : (index) -> ()
      }) : (index, index, index, index) -> index
      "scf.yield"(%4) : (index) -> ()
    }) : (index, index, index, index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

