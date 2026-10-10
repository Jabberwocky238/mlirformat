"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg9: !transform.any_op):
      %11 = "transform.structured.match"(%arg9) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.op<"func.func">
      "transform.apply_patterns"(%11) <{max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.linalg.fold_pack_unpack_into_empty"() <{fold_single_use_only = false}> : () -> ()
      }) : (!transform.op<"func.func">) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (tensor<8x8x32x32xf32>) -> tensor<8x8x32x32xf32>, sym_name = "pack_empty"}> ({
  ^bb0(%arg8: tensor<8x8x32x32xf32>):
    %9 = "tensor.empty"() : () -> tensor<256x256xf32>
    %10 = "linalg.pack"(%9, %arg8) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32, 32>}> : (tensor<256x256xf32>, tensor<8x8x32x32xf32>) -> tensor<8x8x32x32xf32>
    "func.return"(%10) : (tensor<8x8x32x32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x32x32xf32>, index, index) -> tensor<?x?x32x32xf32>, sym_name = "pack_empty_dynamic"}> ({
  ^bb0(%arg5: tensor<?x?x32x32xf32>, %arg6: index, %arg7: index):
    %7 = "tensor.empty"(%arg6, %arg7) : (index, index) -> tensor<?x?xf32>
    %8 = "linalg.pack"(%7, %arg5) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32, 32>}> : (tensor<?x?xf32>, tensor<?x?x32x32xf32>) -> tensor<?x?x32x32xf32>
    "func.return"(%8) : (tensor<?x?x32x32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<256x256xf32>) -> tensor<256x256xf32>, sym_name = "unpack_empty"}> ({
  ^bb0(%arg4: tensor<256x256xf32>):
    %5 = "tensor.empty"() : () -> tensor<8x8x32x32xf32>
    %6 = "linalg.unpack"(%5, %arg4) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 32, 32>}> : (tensor<8x8x32x32xf32>, tensor<256x256xf32>) -> tensor<256x256xf32>
    "func.return"(%6) : (tensor<256x256xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "unpack_empty_dynamic"}> ({
  ^bb0(%arg1: tensor<?x?xf32>, %arg2: index, %arg3: index):
    %3 = "tensor.empty"(%arg2, %arg3) : (index, index) -> tensor<?x?x32x32xf32>
    %4 = "linalg.unpack"(%3, %arg1) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 32, 32>}> : (tensor<?x?x32x32xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%4) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x8x32x32xf32>) -> tensor<8x8x32x32xf32>, sym_name = "pack_padded_empty"}> ({
  ^bb0(%arg0: tensor<8x8x32x32xf32>):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<256x256xf32>
    %2 = "linalg.pack"(%1, %arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 32, 32>}> : (tensor<256x256xf32>, tensor<8x8x32x32xf32>, f32) -> tensor<8x8x32x32xf32>
    "func.return"(%2) : (tensor<8x8x32x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

