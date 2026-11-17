"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "add"}> ({
  ^bb0(%arg50: tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":5:8), %arg51: tensor<32xi64> loc("<stdin>":5:41), %arg52: tensor<32xi64> loc("<stdin>":5:65)):
    %25 = "linalg.generic"(%arg50, %arg51, %arg52) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg53: i64 loc("<stdin>":7:10), %arg54: i64 loc("<stdin>":7:23), %arg55: i64 loc("<stdin>":7:36)):
      %26 = "arith.addi"(%arg53, %arg54) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":8:13)
      "linalg.yield"(%26) : (i64) -> () loc("<stdin>":9:7)
    }) : (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64> loc("<stdin>":6:11)
    "func.return"(%25) : (tensor<32xi64>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "sub"}> ({
  ^bb0(%arg44: tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":14:8), %arg45: tensor<32xi64> loc("<stdin>":14:41), %arg46: tensor<32xi64> loc("<stdin>":14:65)):
    %23 = "linalg.generic"(%arg44, %arg45, %arg46) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg47: i64 loc("<stdin>":16:10), %arg48: i64 loc("<stdin>":16:23), %arg49: i64 loc("<stdin>":16:36)):
      %24 = "arith.subi"(%arg47, %arg48) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":17:13)
      "linalg.yield"(%24) : (i64) -> () loc("<stdin>":18:7)
    }) : (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64> loc("<stdin>":15:11)
    "func.return"(%23) : (tensor<32xi64>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "mul"}> ({
  ^bb0(%arg38: tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":23:8), %arg39: tensor<32xi64> loc("<stdin>":23:41), %arg40: tensor<32xi64> loc("<stdin>":23:65)):
    %21 = "linalg.generic"(%arg38, %arg39, %arg40) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg41: i64 loc("<stdin>":25:10), %arg42: i64 loc("<stdin>":25:23), %arg43: i64 loc("<stdin>":25:36)):
      %22 = "arith.muli"(%arg41, %arg42) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":26:13)
      "linalg.yield"(%22) : (i64) -> () loc("<stdin>":27:7)
    }) : (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64> loc("<stdin>":24:11)
    "func.return"(%21) : (tensor<32xi64>) -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "divsbyc"}> ({
  ^bb0(%arg34: tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":32:8), %arg35: tensor<32xi64> loc("<stdin>":32:41)):
    %18 = "arith.constant"() <{value = 2 : i64}> : () -> i64 loc("<stdin>":33:11)
    %19 = "linalg.generic"(%arg34, %arg35) <{doc = "x(i) = a(i) OP c", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg36: i64 loc("<stdin>":35:10), %arg37: i64 loc("<stdin>":35:23)):
      %20 = "arith.divsi"(%arg36, %18) : (i64, i64) -> i64 loc("<stdin>":36:13)
      "linalg.yield"(%20) : (i64) -> () loc("<stdin>":37:7)
    }) : (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>) -> tensor<32xi64> loc("<stdin>":34:11)
    "func.return"(%19) : (tensor<32xi64>) -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":31:3)
  "func.func"() <{function_type = (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "divubyc"}> ({
  ^bb0(%arg30: tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":42:8), %arg31: tensor<32xi64> loc("<stdin>":42:41)):
    %15 = "arith.constant"() <{value = 2 : i64}> : () -> i64 loc("<stdin>":43:11)
    %16 = "linalg.generic"(%arg30, %arg31) <{doc = "x(i) = a(i) OP c", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg32: i64 loc("<stdin>":45:10), %arg33: i64 loc("<stdin>":45:23)):
      %17 = "arith.divui"(%arg32, %15) : (i64, i64) -> i64 loc("<stdin>":46:13)
      "linalg.yield"(%17) : (i64) -> () loc("<stdin>":47:7)
    }) : (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>) -> tensor<32xi64> loc("<stdin>":44:11)
    "func.return"(%16) : (tensor<32xi64>) -> () loc("<stdin>":49:5)
  }) : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "and"}> ({
  ^bb0(%arg24: tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":52:8), %arg25: tensor<32xi64> loc("<stdin>":52:41), %arg26: tensor<32xi64> loc("<stdin>":52:65)):
    %13 = "linalg.generic"(%arg24, %arg25, %arg26) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg27: i64 loc("<stdin>":54:10), %arg28: i64 loc("<stdin>":54:23), %arg29: i64 loc("<stdin>":54:36)):
      %14 = "arith.andi"(%arg27, %arg28) : (i64, i64) -> i64 loc("<stdin>":55:13)
      "linalg.yield"(%14) : (i64) -> () loc("<stdin>":56:7)
    }) : (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64> loc("<stdin>":53:11)
    "func.return"(%13) : (tensor<32xi64>) -> () loc("<stdin>":58:5)
  }) : () -> () loc("<stdin>":51:3)
  "func.func"() <{function_type = (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "or"}> ({
  ^bb0(%arg18: tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":61:8), %arg19: tensor<32xi64> loc("<stdin>":61:41), %arg20: tensor<32xi64> loc("<stdin>":61:65)):
    %11 = "linalg.generic"(%arg18, %arg19, %arg20) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg21: i64 loc("<stdin>":63:10), %arg22: i64 loc("<stdin>":63:23), %arg23: i64 loc("<stdin>":63:36)):
      %12 = "arith.ori"(%arg21, %arg22) : (i64, i64) -> i64 loc("<stdin>":64:13)
      "linalg.yield"(%12) : (i64) -> () loc("<stdin>":65:7)
    }) : (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64> loc("<stdin>":62:11)
    "func.return"(%11) : (tensor<32xi64>) -> () loc("<stdin>":67:5)
  }) : () -> () loc("<stdin>":60:3)
  "func.func"() <{function_type = (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "xor"}> ({
  ^bb0(%arg12: tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":70:8), %arg13: tensor<32xi64> loc("<stdin>":70:41), %arg14: tensor<32xi64> loc("<stdin>":70:65)):
    %9 = "linalg.generic"(%arg12, %arg13, %arg14) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: i64 loc("<stdin>":72:10), %arg16: i64 loc("<stdin>":72:23), %arg17: i64 loc("<stdin>":72:36)):
      %10 = "arith.xori"(%arg15, %arg16) : (i64, i64) -> i64 loc("<stdin>":73:13)
      "linalg.yield"(%10) : (i64) -> () loc("<stdin>":74:7)
    }) : (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64> loc("<stdin>":71:10)
    "func.return"(%9) : (tensor<32xi64>) -> () loc("<stdin>":76:5)
  }) : () -> () loc("<stdin>":69:3)
  "func.func"() <{function_type = (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "ashrbyc"}> ({
  ^bb0(%arg8: tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":79:8), %arg9: tensor<32xi64> loc("<stdin>":79:40)):
    %6 = "arith.constant"() <{value = 2 : i64}> : () -> i64 loc("<stdin>":80:10)
    %7 = "linalg.generic"(%arg8, %arg9) <{doc = "x(i) = a(i) OP c", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: i64 loc("<stdin>":82:10), %arg11: i64 loc("<stdin>":82:23)):
      %8 = "arith.shrsi"(%arg10, %6) : (i64, i64) -> i64 loc("<stdin>":83:12)
      "linalg.yield"(%8) : (i64) -> () loc("<stdin>":84:7)
    }) : (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>) -> tensor<32xi64> loc("<stdin>":81:10)
    "func.return"(%7) : (tensor<32xi64>) -> () loc("<stdin>":86:5)
  }) : () -> () loc("<stdin>":78:3)
  "func.func"() <{function_type = (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "lsrbyc"}> ({
  ^bb0(%arg4: tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":89:8), %arg5: tensor<32xi64> loc("<stdin>":89:40)):
    %3 = "arith.constant"() <{value = 2 : i64}> : () -> i64 loc("<stdin>":90:10)
    %4 = "linalg.generic"(%arg4, %arg5) <{doc = "x(i) = a(i) OP c", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: i64 loc("<stdin>":92:10), %arg7: i64 loc("<stdin>":92:22)):
      %5 = "arith.shrui"(%arg6, %3) : (i64, i64) -> i64 loc("<stdin>":93:12)
      "linalg.yield"(%5) : (i64) -> () loc("<stdin>":94:7)
    }) : (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>) -> tensor<32xi64> loc("<stdin>":91:10)
    "func.return"(%4) : (tensor<32xi64>) -> () loc("<stdin>":96:5)
  }) : () -> () loc("<stdin>":88:3)
  "func.func"() <{function_type = (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "lslbyc"}> ({
  ^bb0(%arg0: tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":99:8), %arg1: tensor<32xi64> loc("<stdin>":99:40)):
    %0 = "arith.constant"() <{value = 2 : i64}> : () -> i64 loc("<stdin>":100:10)
    %1 = "linalg.generic"(%arg0, %arg1) <{doc = "x(i) = a(i) OP c", indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i64 loc("<stdin>":102:10), %arg3: i64 loc("<stdin>":102:22)):
      %2 = "arith.shli"(%arg2, %0) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":103:12)
      "linalg.yield"(%2) : (i64) -> () loc("<stdin>":104:7)
    }) : (tensor<32xi64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, tensor<32xi64>) -> tensor<32xi64> loc("<stdin>":101:10)
    "func.return"(%1) : (tensor<32xi64>) -> () loc("<stdin>":106:5)
  }) : () -> () loc("<stdin>":98:3)
}) : () -> () loc("<stdin>":3:1)
