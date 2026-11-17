"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, memref<3x4xf32>) -> (), sym_name = "generic_op_zero_rank"}> ({
  ^bb0(%arg57: memref<f32> loc("<stdin>":22:8), %arg58: memref<3x4xf32> loc("<stdin>":22:29)):
    "linalg.generic"(%arg57, %arg58) <{indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], library_call = "some_broadcast_external_fn", operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg59: f32 loc("<stdin>":24:10), %arg60: f32 loc("<stdin>":24:23)):
      "linalg.yield"(%arg59) : (f32) -> () loc("<stdin>":25:7)
    }) : (memref<f32>, memref<3x4xf32>) -> () loc("<stdin>":23:5)
    "func.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = (f32, memref<3x4xf32>) -> (), sym_name = "generic_op_scalar"}> ({
  ^bb0(%arg53: f32 loc("<stdin>":30:8), %arg54: memref<3x4xf32> loc("<stdin>":30:21)):
    "linalg.generic"(%arg53, %arg54) <{indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], library_call = "some_broadcast_external_fn", operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg55: f32 loc("<stdin>":32:10), %arg56: f32 loc("<stdin>":32:23)):
      "linalg.yield"(%arg55) : (f32) -> () loc("<stdin>":33:7)
    }) : (f32, memref<3x4xf32>) -> () loc("<stdin>":31:5)
    "func.return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":29:3)
  "func.func"() <{function_type = (memref<i32>, memref<3x4xi32>) -> (), sym_name = "generic_index_op_zero_rank"}> ({
  ^bb0(%arg49: memref<i32> loc("<stdin>":38:8), %arg50: memref<3x4xi32> loc("<stdin>":38:29)):
    "linalg.generic"(%arg49, %arg50) <{indexing_maps = [affine_map<(d0, d1) -> ()>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], library_call = "some_broadcast_external_fn", operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg51: i32 loc("<stdin>":40:10), %arg52: i32 loc("<stdin>":40:23)):
      %18 = "linalg.index"() <{dim = 0 : i64}> : () -> index loc("<stdin>":41:13)
      %19 = "linalg.index"() <{dim = 1 : i64}> : () -> index loc("<stdin>":42:13)
      %20 = "arith.addi"(%18, %19) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":43:13)
      %21 = "arith.index_cast"(%20) : (index) -> i32 loc("<stdin>":44:13)
      %22 = "arith.addi"(%arg51, %21) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32 loc("<stdin>":45:13)
      "linalg.yield"(%22) : (i32) -> () loc("<stdin>":46:7)
    }) : (memref<i32>, memref<3x4xi32>) -> () loc("<stdin>":39:5)
    "func.return"() : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (memref<?xf32>, memref<f32>) -> (), sym_name = "generic_op_1D_reduce"}> ({
  ^bb0(%arg45: memref<?xf32> loc("<stdin>":51:8), %arg46: memref<f32> loc("<stdin>":51:31)):
    "linalg.generic"(%arg45, %arg46) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>], iterator_types = [#linalg.iterator_type<reduction>], library_call = "some_reduce_external_fn", operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg47: f32 loc("<stdin>":53:10), %arg48: f32 loc("<stdin>":53:23)):
      %17 = "arith.addf"(%arg47, %arg48) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":54:13)
      "linalg.yield"(%17) : (f32) -> () loc("<stdin>":55:7)
    }) : (memref<?xf32>, memref<f32>) -> () loc("<stdin>":52:5)
    "func.return"() : () -> () loc("<stdin>":57:5)
  }) : () -> () loc("<stdin>":50:3)
  "func.func"() <{function_type = (memref<?xf32>, memref<f32>, memref<f32>) -> (), sym_name = "generic_index_op_1D_reduce"}> ({
  ^bb0(%arg39: memref<?xf32> loc("<stdin>":60:8), %arg40: memref<f32> loc("<stdin>":60:31), %arg41: memref<f32> loc("<stdin>":60:52)):
    "linalg.generic"(%arg39, %arg40, %arg41) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> ()>, affine_map<(d0) -> ()>], iterator_types = [#linalg.iterator_type<reduction>], library_call = "some_reduce_external_fn", operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg42: f32 loc("<stdin>":62:10), %arg43: f32 loc("<stdin>":62:23), %arg44: f32 loc("<stdin>":62:36)):
      %12 = "linalg.index"() <{dim = 0 : i64}> : () -> index loc("<stdin>":63:13)
      %13 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":64:13)
      %14 = "arith.cmpi"(%13, %12) <{predicate = 0 : i64}> : (index, index) -> i1 loc("<stdin>":65:13)
      %15 = "arith.select"(%14, %arg43, %arg44) : (i1, f32, f32) -> f32 loc("<stdin>":66:13)
      %16 = "arith.addf"(%arg42, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":67:13)
      "linalg.yield"(%16) : (f32) -> () loc("<stdin>":68:7)
    }) : (memref<?xf32>, memref<f32>, memref<f32>) -> () loc("<stdin>":61:5)
    "func.return"() : () -> () loc("<stdin>":70:5)
  }) : () -> () loc("<stdin>":59:3)
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "generic_const_init"}> ({
  ^bb0(%arg37: memref<?xf32> loc("<stdin>":73:8)):
    %11 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":74:11)
    "linalg.generic"(%arg37) <{indexing_maps = [affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], library_call = "some_external_fn", operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg38: f32 loc("<stdin>":76:10)):
      "linalg.yield"(%11) : (f32) -> () loc("<stdin>":77:7)
    }) : (memref<?xf32>) -> () loc("<stdin>":75:5)
    "func.return"() : () -> () loc("<stdin>":79:5)
  }) : () -> () loc("<stdin>":72:3)
  "func.func"() <{function_type = (memref<f32>, memref<f32>, memref<f32>, i1) -> (), sym_name = "scalar_code"}> ({
  ^bb0(%arg30: memref<f32> loc("<stdin>":82:8), %arg31: memref<f32> loc("<stdin>":82:29), %arg32: memref<f32> loc("<stdin>":82:50), %arg33: i1 loc("<stdin>":82:71)):
    "linalg.generic"(%arg30, %arg31, %arg32) <{indexing_maps = [affine_map<() -> ()>, affine_map<() -> ()>, affine_map<() -> ()>], iterator_types = [], library_call = "some_external_fn", operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg34: f32 loc("<stdin>":84:10), %arg35: f32 loc("<stdin>":84:23), %arg36: f32 loc("<stdin>":84:36)):
      %10 = "scf.if"(%arg33) ({
        "scf.yield"(%arg34) : (f32) -> () loc("<stdin>":86:9)
      }, {
        "scf.yield"(%arg35) : (f32) -> () loc("<stdin>":88:9)
      }) : (i1) -> f32 loc("<stdin>":85:13)
      "linalg.yield"(%10) : (f32) -> () loc("<stdin>":90:7)
    }) : (memref<f32>, memref<f32>, memref<f32>) -> () loc("<stdin>":83:5)
    "func.return"() : () -> () loc("<stdin>":92:5)
  }) : () -> () loc("<stdin>":81:3)
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?xf32>) -> (), sym_name = "batch_reduce_matmul_as_contract"}> ({
  ^bb0(%arg24: memref<?x?x?xf32> loc("<stdin>":95:8), %arg25: memref<?x?x?xf32> loc("<stdin>":95:35), %arg26: memref<?x?xf32> loc("<stdin>":95:62)):
    "linalg.contract"(%arg24, %arg25, %arg26) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d1, d2)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg27: f32 loc("<stdin>":97:10), %arg28: f32 loc("<stdin>":97:23), %arg29: f32 loc("<stdin>":97:36)):
      %8 = "arith.mulf"(%arg27, %arg28) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":98:12)
      %9 = "arith.addf"(%arg29, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":99:12)
      "linalg.yield"(%9) : (f32) -> () loc("<stdin>":100:7)
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":96:5)
    "func.return"() : () -> () loc("<stdin>":102:5)
  }) : () -> () loc("<stdin>":94:3)
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "named_batch_matmul"}> ({
  ^bb0(%arg18: memref<?x?x?xf32> loc("<stdin>":105:8), %arg19: memref<?x?x?xf32> loc("<stdin>":105:35), %arg20: memref<?x?x?xf32> loc("<stdin>":105:62)):
    "linalg.batch_matmul"(%arg18, %arg19, %arg20) <{indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg21: f32 loc("<stdin>":107:10), %arg22: f32 loc("<stdin>":107:23), %arg23: f32 loc("<stdin>":107:36)):
      %6 = "arith.mulf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":108:12)
      %7 = "arith.addf"(%arg23, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":109:12)
      "linalg.yield"(%7) : (f32) -> () loc("<stdin>":110:7)
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> () loc("<stdin>":106:5)
    "func.return"() : () -> () loc("<stdin>":112:5)
  }) : () -> () loc("<stdin>":104:3)
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>, memref<?xf32>) -> (), sym_name = "conv1d_no_symbols"}> ({
  ^bb0(%arg12: memref<?xf32> loc("<stdin>":115:8), %arg13: memref<?xf32> loc("<stdin>":115:31), %arg14: memref<?xf32> loc("<stdin>":115:54)):
    "linalg.conv_1d"(%arg12, %arg13, %arg14) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg15: f32 loc("<stdin>":117:10), %arg16: f32 loc("<stdin>":117:23), %arg17: f32 loc("<stdin>":117:36)):
      %4 = "arith.mulf"(%arg15, %arg16) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":118:12)
      %5 = "arith.addf"(%arg17, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":119:12)
      "linalg.yield"(%5) : (f32) -> () loc("<stdin>":120:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1) -> (d0 + d1)>, affine_map<(d0, d1) -> (d1)>, affine_map<(d0, d1) -> (d0)>]} : (memref<?xf32>, memref<?xf32>, memref<?xf32>) -> () loc("<stdin>":116:5)
    "func.return"() : () -> () loc("<stdin>":122:5)
  }) : () -> () loc("<stdin>":114:3)
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "conv2d_no_symbols"}> ({
  ^bb0(%arg6: memref<?x?xf32> loc("<stdin>":125:8), %arg7: memref<?x?xf32> loc("<stdin>":125:32), %arg8: memref<?x?xf32> loc("<stdin>":125:56)):
    "linalg.conv_2d"(%arg6, %arg7, %arg8) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg9: f32 loc("<stdin>":127:10), %arg10: f32 loc("<stdin>":127:22), %arg11: f32 loc("<stdin>":127:35)):
      %2 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":128:12)
      %3 = "arith.addf"(%arg11, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":129:12)
      "linalg.yield"(%3) : (f32) -> () loc("<stdin>":130:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>, affine_map<(d0, d1, d2, d3) -> (d2, d3)>, affine_map<(d0, d1, d2, d3) -> (d0, d1)>]} : (memref<?x?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> () loc("<stdin>":126:5)
    "func.return"() : () -> () loc("<stdin>":132:5)
  }) : () -> () loc("<stdin>":124:3)
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "conv3d_no_symbols"}> ({
  ^bb0(%arg0: memref<?x?x?xf32> loc("<stdin>":135:8), %arg1: memref<?x?x?xf32> loc("<stdin>":135:34), %arg2: memref<?x?x?xf32> loc("<stdin>":135:60)):
    "linalg.conv_3d"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":137:10), %arg4: f32 loc("<stdin>":137:22), %arg5: f32 loc("<stdin>":137:34)):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":138:12)
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":139:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":140:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5) -> (d0 + d3, d1 + d4, d2 + d5)>, affine_map<(d0, d1, d2, d3, d4, d5) -> (d3, d4, d5)>, affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2)>]} : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> () loc("<stdin>":136:5)
    "func.return"() : () -> () loc("<stdin>":142:5)
  }) : () -> () loc("<stdin>":134:3)
}) : () -> () loc("<stdin>":20:1)
