"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg9: !transform.any_op loc("<stdin>":4:10)):
      %11 = "transform.structured.match"(%arg9) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func"> loc("<stdin>":5:13)
      "transform.apply_patterns"(%11) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.fold_pack_unpack_into_empty"() <{fold_single_use_only = false}> : () -> () loc("<stdin>":7:9)
      }) : (!transform.op<"func.func">) -> () loc("<stdin>":6:7)
      "transform.yield"() : () -> () loc("<stdin>":9:7)
    }) : () -> () loc("<stdin>":3:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<8x8x32x32xf32>) -> tensor<8x8x32x32xf32>, sym_name = "pack_empty"}> ({
  ^bb0(%arg8: tensor<8x8x32x32xf32> loc("<stdin>":13:8)):
    %9 = "tensor.empty"() : () -> tensor<256x256xf32> loc("<stdin>":14:10)
    %10 = "linalg.pack"(%9, %arg8) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32, 32>}> : (tensor<256x256xf32>, tensor<8x8x32x32xf32>) -> tensor<8x8x32x32xf32> loc("<stdin>":15:11)
    "func.return"(%10) : (tensor<8x8x32x32xf32>) -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (tensor<?x?x32x32xf32>, index, index) -> tensor<?x?x32x32xf32>, sym_name = "pack_empty_dynamic"}> ({
  ^bb0(%arg5: tensor<?x?x32x32xf32> loc("<stdin>":19:8), %arg6: index loc("<stdin>":19:38), %arg7: index loc("<stdin>":19:52)):
    %7 = "tensor.empty"(%arg6, %arg7) : (index, index) -> tensor<?x?xf32> loc("<stdin>":20:10)
    %8 = "linalg.pack"(%7, %arg5) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32, 32>}> : (tensor<?x?xf32>, tensor<?x?x32x32xf32>) -> tensor<?x?x32x32xf32> loc("<stdin>":21:10)
    "func.return"(%8) : (tensor<?x?x32x32xf32>) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":18:3)
  "func.func"() <{function_type = (tensor<256x256xf32>) -> tensor<256x256xf32>, sym_name = "unpack_empty"}> ({
  ^bb0(%arg4: tensor<256x256xf32> loc("<stdin>":25:8)):
    %5 = "tensor.empty"() : () -> tensor<8x8x32x32xf32> loc("<stdin>":26:10)
    %6 = "linalg.unpack"(%5, %arg4) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 32, 32>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<8x8x32x32xf32>, tensor<256x256xf32>) -> tensor<256x256xf32> loc("<stdin>":27:10)
    "func.return"(%6) : (tensor<256x256xf32>) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":24:3)
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "unpack_empty_dynamic"}> ({
  ^bb0(%arg1: tensor<?x?xf32> loc("<stdin>":31:8), %arg2: index loc("<stdin>":31:32), %arg3: index loc("<stdin>":31:46)):
    %3 = "tensor.empty"(%arg2, %arg3) : (index, index) -> tensor<?x?x32x32xf32> loc("<stdin>":32:10)
    %4 = "linalg.unpack"(%3, %arg1) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 32, 32>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<?x?x32x32xf32>, tensor<?x?xf32>) -> tensor<?x?xf32> loc("<stdin>":33:10)
    "func.return"(%4) : (tensor<?x?xf32>) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = (tensor<8x8x32x32xf32>) -> tensor<8x8x32x32xf32>, sym_name = "pack_padded_empty"}> ({
  ^bb0(%arg0: tensor<8x8x32x32xf32> loc("<stdin>":37:8)):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":38:10)
    %1 = "tensor.empty"() : () -> tensor<256x256xf32> loc("<stdin>":39:10)
    %2 = "linalg.pack"(%1, %arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 32, 32>}> : (tensor<256x256xf32>, tensor<8x8x32x32xf32>, f32) -> tensor<8x8x32x32xf32> loc("<stdin>":40:10)
    "func.return"(%2) : (tensor<8x8x32x32xf32>) -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":36:3)
}) : () -> () loc("<stdin>":1:1)
