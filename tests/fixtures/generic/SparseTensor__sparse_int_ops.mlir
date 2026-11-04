#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32xi64, #sparse>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "add"}> ({
  ^bb0(%arg50: tensor<32xi64, #sparse>, %arg51: tensor<32xi64>, %arg52: tensor<32xi64>):
    %25 = "linalg.generic"(%arg50, %arg51, %arg52) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg53: i64, %arg54: i64, %arg55: i64):
      %26 = "arith.addi"(%arg53, %arg54) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%26) : (i64) -> ()
    }) : (tensor<32xi64, #sparse>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>
    "func.return"(%25) : (tensor<32xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi64, #sparse>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "sub"}> ({
  ^bb0(%arg44: tensor<32xi64, #sparse>, %arg45: tensor<32xi64>, %arg46: tensor<32xi64>):
    %23 = "linalg.generic"(%arg44, %arg45, %arg46) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg47: i64, %arg48: i64, %arg49: i64):
      %24 = "arith.subi"(%arg47, %arg48) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%24) : (i64) -> ()
    }) : (tensor<32xi64, #sparse>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>
    "func.return"(%23) : (tensor<32xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi64, #sparse>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "mul"}> ({
  ^bb0(%arg38: tensor<32xi64, #sparse>, %arg39: tensor<32xi64>, %arg40: tensor<32xi64>):
    %21 = "linalg.generic"(%arg38, %arg39, %arg40) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg41: i64, %arg42: i64, %arg43: i64):
      %22 = "arith.muli"(%arg41, %arg42) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%22) : (i64) -> ()
    }) : (tensor<32xi64, #sparse>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>
    "func.return"(%21) : (tensor<32xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi64, #sparse>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "divsbyc"}> ({
  ^bb0(%arg34: tensor<32xi64, #sparse>, %arg35: tensor<32xi64>):
    %18 = "arith.constant"() <{value = 2 : i64}> : () -> i64
    %19 = "linalg.generic"(%arg34, %arg35) <{doc = "x(i) = a(i) OP c", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg36: i64, %arg37: i64):
      %20 = "arith.divsi"(%arg36, %18) : (i64, i64) -> i64
      "linalg.yield"(%20) : (i64) -> ()
    }) : (tensor<32xi64, #sparse>, tensor<32xi64>) -> tensor<32xi64>
    "func.return"(%19) : (tensor<32xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi64, #sparse>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "divubyc"}> ({
  ^bb0(%arg30: tensor<32xi64, #sparse>, %arg31: tensor<32xi64>):
    %15 = "arith.constant"() <{value = 2 : i64}> : () -> i64
    %16 = "linalg.generic"(%arg30, %arg31) <{doc = "x(i) = a(i) OP c", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg32: i64, %arg33: i64):
      %17 = "arith.divui"(%arg32, %15) : (i64, i64) -> i64
      "linalg.yield"(%17) : (i64) -> ()
    }) : (tensor<32xi64, #sparse>, tensor<32xi64>) -> tensor<32xi64>
    "func.return"(%16) : (tensor<32xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi64, #sparse>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "and"}> ({
  ^bb0(%arg24: tensor<32xi64, #sparse>, %arg25: tensor<32xi64>, %arg26: tensor<32xi64>):
    %13 = "linalg.generic"(%arg24, %arg25, %arg26) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg27: i64, %arg28: i64, %arg29: i64):
      %14 = "arith.andi"(%arg27, %arg28) : (i64, i64) -> i64
      "linalg.yield"(%14) : (i64) -> ()
    }) : (tensor<32xi64, #sparse>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>
    "func.return"(%13) : (tensor<32xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi64, #sparse>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "or"}> ({
  ^bb0(%arg18: tensor<32xi64, #sparse>, %arg19: tensor<32xi64>, %arg20: tensor<32xi64>):
    %11 = "linalg.generic"(%arg18, %arg19, %arg20) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg21: i64, %arg22: i64, %arg23: i64):
      %12 = "arith.ori"(%arg21, %arg22) : (i64, i64) -> i64
      "linalg.yield"(%12) : (i64) -> ()
    }) : (tensor<32xi64, #sparse>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>
    "func.return"(%11) : (tensor<32xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi64, #sparse>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "xor"}> ({
  ^bb0(%arg12: tensor<32xi64, #sparse>, %arg13: tensor<32xi64>, %arg14: tensor<32xi64>):
    %9 = "linalg.generic"(%arg12, %arg13, %arg14) <{doc = "x(i) = a(i) OP b(i)", indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: i64, %arg16: i64, %arg17: i64):
      %10 = "arith.xori"(%arg15, %arg16) : (i64, i64) -> i64
      "linalg.yield"(%10) : (i64) -> ()
    }) : (tensor<32xi64, #sparse>, tensor<32xi64>, tensor<32xi64>) -> tensor<32xi64>
    "func.return"(%9) : (tensor<32xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi64, #sparse>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "ashrbyc"}> ({
  ^bb0(%arg8: tensor<32xi64, #sparse>, %arg9: tensor<32xi64>):
    %6 = "arith.constant"() <{value = 2 : i64}> : () -> i64
    %7 = "linalg.generic"(%arg8, %arg9) <{doc = "x(i) = a(i) OP c", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: i64, %arg11: i64):
      %8 = "arith.shrsi"(%arg10, %6) : (i64, i64) -> i64
      "linalg.yield"(%8) : (i64) -> ()
    }) : (tensor<32xi64, #sparse>, tensor<32xi64>) -> tensor<32xi64>
    "func.return"(%7) : (tensor<32xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi64, #sparse>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "lsrbyc"}> ({
  ^bb0(%arg4: tensor<32xi64, #sparse>, %arg5: tensor<32xi64>):
    %3 = "arith.constant"() <{value = 2 : i64}> : () -> i64
    %4 = "linalg.generic"(%arg4, %arg5) <{doc = "x(i) = a(i) OP c", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: i64, %arg7: i64):
      %5 = "arith.shrui"(%arg6, %3) : (i64, i64) -> i64
      "linalg.yield"(%5) : (i64) -> ()
    }) : (tensor<32xi64, #sparse>, tensor<32xi64>) -> tensor<32xi64>
    "func.return"(%4) : (tensor<32xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32xi64, #sparse>, tensor<32xi64>) -> tensor<32xi64>, sym_name = "lslbyc"}> ({
  ^bb0(%arg0: tensor<32xi64, #sparse>, %arg1: tensor<32xi64>):
    %0 = "arith.constant"() <{value = 2 : i64}> : () -> i64
    %1 = "linalg.generic"(%arg0, %arg1) <{doc = "x(i) = a(i) OP c", indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i64, %arg3: i64):
      %2 = "arith.shli"(%arg2, %0) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%2) : (i64) -> ()
    }) : (tensor<32xi64, #sparse>, tensor<32xi64>) -> tensor<32xi64>
    "func.return"(%1) : (tensor<32xi64>) -> ()
  }) : () -> ()
}) : () -> ()

