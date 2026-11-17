"builtin.module"() ({
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg42: !transform.any_op loc("<stdin>":3:8)):
    "transform.sequence"(%arg42) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg43: !transform.any_op loc("<stdin>":5:10)):
      "transform.yield"() : () -> () loc("<stdin>":6:7)
    }) : (!transform.any_op) -> () loc("<stdin>":4:5)
    "transform.yield"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "transform.with_pdl_patterns"() ({
  ^bb0(%arg40: !transform.any_op loc("<stdin>":11:8)):
    "transform.sequence"(%arg40) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg41: !transform.any_op loc("<stdin>":13:10)):
      "transform.yield"() : () -> () loc("<stdin>":14:7)
    }) : (!transform.any_op) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":10:3)
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg36: !transform.any_op loc("<stdin>":18:8)):
    %9 = "transform.sequence"(%arg36) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg39: !transform.any_op loc("<stdin>":20:10)):
      "transform.yield"(%arg39) : (!transform.any_op) -> () loc("<stdin>":21:7)
    }) : (!transform.any_op) -> !transform.any_op loc("<stdin>":19:10)
    "transform.sequence"(%9) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg38: !transform.any_op loc("<stdin>":24:10)):
      "transform.yield"() : () -> () loc("<stdin>":25:7)
    }) : (!transform.any_op) -> () loc("<stdin>":23:5)
    "transform.sequence"(%9) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg37: !transform.any_op loc("<stdin>":28:10)):
      "transform.yield"() : () -> () loc("<stdin>":29:7)
    }) : (!transform.any_op) -> () loc("<stdin>":27:5)
    "transform.yield"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":17:3)
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg30: !transform.any_op loc("<stdin>":34:8), %arg31: !transform.any_op loc("<stdin>":34:35), %arg32: !transform.any_op loc("<stdin>":34:62)):
    "transform.sequence"(%arg30, %arg31, %arg32) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg33: !transform.any_op loc("<stdin>":36:10), %arg34: !transform.any_op loc("<stdin>":36:37), %arg35: !transform.any_op loc("<stdin>":36:64)):
      "transform.yield"() : () -> () loc("<stdin>":37:7)
    }) : (!transform.any_op, !transform.any_op, !transform.any_op) -> () loc("<stdin>":35:5)
    "transform.yield"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":33:3)
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg24: !transform.any_op loc("<stdin>":42:8), %arg25: !transform.any_op loc("<stdin>":42:35), %arg26: !transform.any_op loc("<stdin>":42:62)):
    "transform.sequence"(%arg24, %arg25, %arg26) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg27: !transform.any_op loc("<stdin>":44:10), %arg28: !transform.any_op loc("<stdin>":44:37), %arg29: !transform.any_op loc("<stdin>":44:64)):
      "transform.yield"() : () -> () loc("<stdin>":45:7)
    }) : (!transform.any_op, !transform.any_op, !transform.any_op) -> () loc("<stdin>":43:5)
    "transform.yield"() : () -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":41:3)
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg18: !transform.any_op loc("<stdin>":50:8), %arg19: !transform.any_op loc("<stdin>":50:35), %arg20: !transform.any_op loc("<stdin>":50:62)):
    "transform.sequence"(%arg18, %arg19, %arg20) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg21: !transform.any_op loc("<stdin>":52:10), %arg22: !transform.any_op loc("<stdin>":52:37), %arg23: !transform.any_op loc("<stdin>":52:64)):
      "transform.yield"() : () -> () loc("<stdin>":53:7)
    }) : (!transform.any_op, !transform.any_op, !transform.any_op) -> () loc("<stdin>":51:5)
    "transform.yield"() : () -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":49:3)
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg5: !transform.any_op loc("<stdin>":58:8), %arg6: !transform.any_value loc("<stdin>":58:34), %arg7: !transform.any_param loc("<stdin>":58:63)):
    "transform.foreach"(%arg5) ({
    ^bb0(%arg17: !transform.any_op loc("<stdin>":60:10)):
      "transform.yield"() : () -> () loc("<stdin>":61:7)
    }) : (!transform.any_op) -> () loc("<stdin>":59:5)
    "transform.foreach"(%arg5, %arg6, %arg7) ({
    ^bb0(%arg14: !transform.any_op loc("<stdin>":64:10), %arg15: !transform.any_value loc("<stdin>":64:37), %arg16: !transform.any_param loc("<stdin>":64:67)):
      "transform.yield"() : () -> () loc("<stdin>":65:7)
    }) : (!transform.any_op, !transform.any_value, !transform.any_param) -> () loc("<stdin>":63:5)
    %7 = "transform.foreach"(%arg5, %arg6, %arg7) ({
    ^bb0(%arg11: !transform.any_op loc("<stdin>":68:10), %arg12: !transform.any_value loc("<stdin>":68:37), %arg13: !transform.any_param loc("<stdin>":68:67)):
      "transform.yield"(%arg11) : (!transform.any_op) -> () loc("<stdin>":69:7)
    }) : (!transform.any_op, !transform.any_value, !transform.any_param) -> !transform.any_op loc("<stdin>":67:10)
    %8:2 = "transform.foreach"(%arg5, %arg6, %arg7) ({
    ^bb0(%arg8: !transform.any_op loc("<stdin>":72:10), %arg9: !transform.any_value loc("<stdin>":72:36), %arg10: !transform.any_param loc("<stdin>":72:65)):
      "transform.yield"(%arg10, %arg9) : (!transform.any_param, !transform.any_value) -> () loc("<stdin>":73:7)
    }) : (!transform.any_op, !transform.any_value, !transform.any_param) -> (!transform.any_param, !transform.any_value) loc("<stdin>":71:12)
    "transform.yield"() : () -> () loc("<stdin>":75:5)
  }) : () -> () loc("<stdin>":57:3)
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg4: !transform.any_op loc("<stdin>":78:8)):
    %5 = "transform.cast"(%arg4) : (!transform.any_op) -> !transform.any_op loc("<stdin>":79:10)
    %6 = "transform.cast"(%5) : (!transform.any_op) -> !transform.op<"builtin.module"> loc("<stdin>":80:10)
    "transform.yield"() : () -> () loc("<stdin>":81:5)
  }) : () -> () loc("<stdin>":77:3)
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg3: !transform.any_op loc("<stdin>":84:8)):
    "transform.print"(%arg3) : (!transform.any_op) -> () loc("<stdin>":85:5)
    "transform.print"() : () -> () loc("<stdin>":86:5)
    "transform.print"(%arg3) <{name = "test"}> : (!transform.any_op) -> () loc("<stdin>":87:5)
    "transform.print"() <{name = "test"}> : () -> () loc("<stdin>":88:5)
    "transform.print"() <{assume_verified, name = "test"}> : () -> () loc("<stdin>":89:5)
    "transform.print"(%arg3) <{assume_verified}> : (!transform.any_op) -> () loc("<stdin>":90:5)
    "transform.print"(%arg3) <{use_local_scope}> : (!transform.any_op) -> () loc("<stdin>":91:5)
    "transform.print"(%arg3) <{skip_regions}> : (!transform.any_op) -> () loc("<stdin>":92:5)
    "transform.print"(%arg3) <{assume_verified, skip_regions, use_local_scope}> : (!transform.any_op) -> () loc("<stdin>":93:5)
    "transform.yield"() : () -> () loc("<stdin>":94:5)
  }) : () -> () loc("<stdin>":83:3)
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg2: !transform.any_op loc("<stdin>":97:8)):
    %3 = "transform.structured.match"(%arg2) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":98:10)
    %4:4 = "transform.structured.tile_using_for"(%3) <{scalable_sizes = array<i1: false, false, true>, static_sizes = array<i64: 4, 4, 4>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":99:12)
    "transform.yield"() : () -> () loc("<stdin>":100:5)
  }) : () -> () loc("<stdin>":96:3)
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg1: !transform.any_op loc("<stdin>":103:8)):
    %1 = "transform.structured.match"(%arg1) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":104:10)
    %2:4 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: true, false, false>, static_sizes = array<i64: 2, 4, 8>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op, !transform.any_op) loc("<stdin>":105:12)
    "transform.yield"() : () -> () loc("<stdin>":106:5)
  }) : () -> () loc("<stdin>":102:3)
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":109:8)):
    %0 = "transform.param.constant"() <{value = "example_string"}> : () -> !transform.any_param loc("<stdin>":110:10)
    "transform.yield"() : () -> () loc("<stdin>":111:5)
  }) : () -> () loc("<stdin>":108:3)
}) : () -> () loc("<stdin>":1:1)
