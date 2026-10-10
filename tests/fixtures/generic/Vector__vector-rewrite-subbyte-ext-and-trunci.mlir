"builtin.module"() ({
  "func.func"() <{function_type = (vector<1xi4>) -> vector<1xi8>, sym_name = "unaligned_extsi_i4_to_i8"}> ({
  ^bb0(%arg23: vector<1xi4>):
    %23 = "arith.extsi"(%arg23) : (vector<1xi4>) -> vector<1xi8>
    "func.return"(%23) : (vector<1xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi2>) -> vector<2xi8>, sym_name = "unaligned_extsi_i2_to_i8"}> ({
  ^bb0(%arg22: vector<2xi2>):
    %22 = "arith.extsi"(%arg22) : (vector<2xi2>) -> vector<2xi8>
    "func.return"(%22) : (vector<2xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi4>) -> vector<8xi8>, sym_name = "aligned_extsi_i4_to_i8"}> ({
  ^bb0(%arg21: vector<8xi4>):
    %21 = "arith.extsi"(%arg21) : (vector<8xi4>) -> vector<8xi8>
    "func.return"(%21) : (vector<8xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi2>) -> vector<8xi8>, sym_name = "aligned_extsi_i2_to_i8"}> ({
  ^bb0(%arg20: vector<8xi2>):
    %20 = "arith.extsi"(%arg20) : (vector<8xi2>) -> vector<8xi8>
    "func.return"(%20) : (vector<8xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi4>) -> vector<8xi32>, sym_name = "aligned_extsi_i4_to_i32"}> ({
  ^bb0(%arg19: vector<8xi4>):
    %19 = "arith.extsi"(%arg19) : (vector<8xi4>) -> vector<8xi32>
    "func.return"(%19) : (vector<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi2>) -> vector<8xi32>, sym_name = "aligned_extsi_i2_to_i32"}> ({
  ^bb0(%arg18: vector<8xi2>):
    %18 = "arith.extsi"(%arg18) : (vector<8xi2>) -> vector<8xi32>
    "func.return"(%18) : (vector<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x32xi4>) -> vector<8x32xi32>, sym_name = "aligned_extsi_i4_to_i32_2d"}> ({
  ^bb0(%arg17: vector<8x32xi4>):
    %17 = "arith.extsi"(%arg17) : (vector<8x32xi4>) -> vector<8x32xi32>
    "func.return"(%17) : (vector<8x32xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x32xi2>) -> vector<8x32xi32>, sym_name = "aligned_extsi_i2_to_i32_2d"}> ({
  ^bb0(%arg16: vector<8x32xi2>):
    %16 = "arith.extsi"(%arg16) : (vector<8x32xi2>) -> vector<8x32xi32>
    "func.return"(%16) : (vector<8x32xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi8>) -> vector<8xi4>, sym_name = "aligned_trunci_i8_to_i4"}> ({
  ^bb0(%arg15: vector<8xi8>):
    %15 = "arith.trunci"(%arg15) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi8>) -> vector<8xi4>
    "func.return"(%15) : (vector<8xi4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>) -> vector<8xi4>, sym_name = "aligned_trunci_i32_to_i4"}> ({
  ^bb0(%arg14: vector<8xi32>):
    %14 = "arith.trunci"(%arg14) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi32>) -> vector<8xi4>
    "func.return"(%14) : (vector<8xi4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x32xi32>) -> vector<8x32xi4>, sym_name = "aligned_trunci_2d"}> ({
  ^bb0(%arg13: vector<8x32xi32>):
    %13 = "arith.trunci"(%arg13) <{overflowFlags = #arith.overflow<none>}> : (vector<8x32xi32>) -> vector<8x32xi4>
    "func.return"(%13) : (vector<8x32xi4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x8x32xi32>) -> vector<3x8x32xi4>, sym_name = "aligned_trunci_nd"}> ({
  ^bb0(%arg12: vector<3x8x32xi32>):
    %12 = "arith.trunci"(%arg12) <{overflowFlags = #arith.overflow<none>}> : (vector<3x8x32xi32>) -> vector<3x8x32xi4>
    "func.return"(%12) : (vector<3x8x32xi4>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi8>) -> vector<8xi2>, sym_name = "aligned_trunci_i8_to_i2_no_match"}> ({
  ^bb0(%arg11: vector<8xi8>):
    %11 = "arith.trunci"(%arg11) <{overflowFlags = #arith.overflow<none>}> : (vector<8xi8>) -> vector<8xi2>
    "func.return"(%11) : (vector<8xi2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi4>) -> vector<8xi8>, sym_name = "aligned_extui_i4_to_i8"}> ({
  ^bb0(%arg10: vector<8xi4>):
    %10 = "arith.extui"(%arg10) : (vector<8xi4>) -> vector<8xi8>
    "func.return"(%10) : (vector<8xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi2>) -> vector<8xi8>, sym_name = "aligned_extui_i2_to_i8"}> ({
  ^bb0(%arg9: vector<8xi2>):
    %9 = "arith.extui"(%arg9) : (vector<8xi2>) -> vector<8xi8>
    "func.return"(%9) : (vector<8xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi4>) -> vector<8xi32>, sym_name = "aligned_extui_i4_to_i32"}> ({
  ^bb0(%arg8: vector<8xi4>):
    %8 = "arith.extui"(%arg8) : (vector<8xi4>) -> vector<8xi32>
    "func.return"(%8) : (vector<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi2>) -> vector<8xi32>, sym_name = "aligned_extui_i2_to_i32"}> ({
  ^bb0(%arg7: vector<8xi2>):
    %7 = "arith.extui"(%arg7) : (vector<8xi2>) -> vector<8xi32>
    "func.return"(%7) : (vector<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x32xi4>) -> vector<8x32xi32>, sym_name = "aligned_extui_i4_to_i32_2d"}> ({
  ^bb0(%arg6: vector<8x32xi4>):
    %6 = "arith.extui"(%arg6) : (vector<8x32xi4>) -> vector<8x32xi32>
    "func.return"(%6) : (vector<8x32xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x32xi2>) -> vector<8x32xi32>, sym_name = "aligned_extui_i2_to_i32_2d"}> ({
  ^bb0(%arg5: vector<8x32xi2>):
    %5 = "arith.extui"(%arg5) : (vector<8x32xi2>) -> vector<8x32xi32>
    "func.return"(%5) : (vector<8x32xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi4>) -> vector<8xf32>, sym_name = "aligned_sitofp"}> ({
  ^bb0(%arg4: vector<8xi4>):
    %4 = "arith.sitofp"(%arg4) : (vector<8xi4>) -> vector<8xf32>
    "func.return"(%4) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x32xi4>) -> vector<8x32xf32>, sym_name = "aligned_sitofp_2d"}> ({
  ^bb0(%arg3: vector<8x32xi4>):
    %3 = "arith.sitofp"(%arg3) : (vector<8x32xi4>) -> vector<8x32xf32>
    "func.return"(%3) : (vector<8x32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi4>) -> vector<8xf32>, sym_name = "aligned_uitofp"}> ({
  ^bb0(%arg2: vector<8xi4>):
    %2 = "arith.uitofp"(%arg2) : (vector<8xi4>) -> vector<8xf32>
    "func.return"(%2) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8x32xi4>) -> vector<8x32xf32>, sym_name = "aligned_uitofp_2d"}> ({
  ^bb0(%arg1: vector<8x32xi4>):
    %1 = "arith.uitofp"(%arg1) : (vector<8x32xi4>) -> vector<8x32xf32>
    "func.return"(%1) : (vector<8x32xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%0) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.vector.rewrite_narrow_types"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

