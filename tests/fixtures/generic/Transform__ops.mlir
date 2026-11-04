"builtin.module"() ({
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg42: !transform.any_op):
    "transform.sequence"(%arg42) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg43: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.with_pdl_patterns"() ({
  ^bb0(%arg40: !transform.any_op):
    "transform.sequence"(%arg40) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg41: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg36: !transform.any_op):
    %9 = "transform.sequence"(%arg36) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg39: !transform.any_op):
      "transform.yield"(%arg39) : (!transform.any_op) -> ()
    }) : (!transform.any_op) -> !transform.any_op
    "transform.sequence"(%9) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg38: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.sequence"(%9) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg37: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg30: !transform.any_op, %arg31: !transform.any_op, %arg32: !transform.any_op):
    "transform.sequence"(%arg30, %arg31, %arg32) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg33: !transform.any_op, %arg34: !transform.any_op, %arg35: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : (!transform.any_op, !transform.any_op, !transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg24: !transform.any_op, %arg25: !transform.any_op, %arg26: !transform.any_op):
    "transform.sequence"(%arg24, %arg25, %arg26) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg27: !transform.any_op, %arg28: !transform.any_op, %arg29: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : (!transform.any_op, !transform.any_op, !transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg18: !transform.any_op, %arg19: !transform.any_op, %arg20: !transform.any_op):
    "transform.sequence"(%arg18, %arg19, %arg20) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg21: !transform.any_op, %arg22: !transform.any_op, %arg23: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : (!transform.any_op, !transform.any_op, !transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg5: !transform.any_op, %arg6: !transform.any_value, %arg7: !transform.any_param):
    "transform.foreach"(%arg5) ({
    ^bb0(%arg17: !transform.any_op):
      "transform.yield"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.foreach"(%arg5, %arg6, %arg7) ({
    ^bb0(%arg14: !transform.any_op, %arg15: !transform.any_value, %arg16: !transform.any_param):
      "transform.yield"() : () -> ()
    }) : (!transform.any_op, !transform.any_value, !transform.any_param) -> ()
    %7 = "transform.foreach"(%arg5, %arg6, %arg7) ({
    ^bb0(%arg11: !transform.any_op, %arg12: !transform.any_value, %arg13: !transform.any_param):
      "transform.yield"(%arg11) : (!transform.any_op) -> ()
    }) : (!transform.any_op, !transform.any_value, !transform.any_param) -> !transform.any_op
    %8:2 = "transform.foreach"(%arg5, %arg6, %arg7) ({
    ^bb0(%arg8: !transform.any_op, %arg9: !transform.any_value, %arg10: !transform.any_param):
      "transform.yield"(%arg10, %arg9) : (!transform.any_param, !transform.any_value) -> ()
    }) : (!transform.any_op, !transform.any_value, !transform.any_param) -> (!transform.any_param, !transform.any_value)
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg4: !transform.any_op):
    %5 = "transform.cast"(%arg4) : (!transform.any_op) -> !transform.any_op
    %6 = "transform.cast"(%5) : (!transform.any_op) -> !transform.op<"builtin.module">
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg3: !transform.any_op):
    "transform.print"(%arg3) : (!transform.any_op) -> ()
    "transform.print"() : () -> ()
    "transform.print"(%arg3) <{name = "test"}> : (!transform.any_op) -> ()
    "transform.print"() <{name = "test"}> : () -> ()
    "transform.print"() <{assume_verified, name = "test"}> : () -> ()
    "transform.print"(%arg3) <{assume_verified}> : (!transform.any_op) -> ()
    "transform.print"(%arg3) <{use_local_scope}> : (!transform.any_op) -> ()
    "transform.print"(%arg3) <{skip_regions}> : (!transform.any_op) -> ()
    "transform.print"(%arg3) <{assume_verified, skip_regions, use_local_scope}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg2: !transform.any_op):
    %3 = "transform.structured.match"(%arg2) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
    %4:4 = "transform.structured.tile_using_for"(%3) <{scalable_sizes = array<i1: false, false, true>, static_sizes = array<i64: 4, 4, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg1: !transform.any_op):
    %1 = "transform.structured.match"(%arg1) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
    %2:4 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: true, false, false>, static_sizes = array<i64: 2, 4, 8>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op)
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.param.constant"() <{value = "example_string"}> : () -> !transform.any_param
    "transform.yield"() : () -> ()
  }) : () -> ()
}) : () -> ()

