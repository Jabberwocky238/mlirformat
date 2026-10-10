"builtin.module"() ({
  "func.func"() <{function_type = (tensor<129x47x16x16xf32>, tensor<17x2x16x16x32x8xf32>) -> tensor<17x2x16x16x32x8xf32>, sym_name = "pack"}> ({
  ^bb0(%arg1: tensor<129x47x16x16xf32>, %arg2: tensor<17x2x16x16x32x8xf32>):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.pack"(%arg1, %arg2, %2) <{inner_dims_pos = array<i64: 1, 0>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 32, 8>}> : (tensor<129x47x16x16xf32>, tensor<17x2x16x16x32x8xf32>, f32) -> tensor<17x2x16x16x32x8xf32>
    "func.return"(%3) : (tensor<17x2x16x16x32x8xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.op<"linalg.pack">
      %1:3 = "transform.structured.lower_pack"(%0) <{lowerPadLikeWithInsertSlice = true}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x8xf32>, tensor<8x8x16x1xf32>) -> tensor<8x8x16x1xf32>, sym_name = "pack"}> ({
  ^bb0(%arg1: tensor<128x8xf32>, %arg2: tensor<8x8x16x1xf32>):
    %2 = "linalg.pack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 16, 1>}> : (tensor<128x8xf32>, tensor<8x8x16x1xf32>) -> tensor<8x8x16x1xf32>
    "func.return"(%2) : (tensor<8x8x16x1xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.op<"linalg.pack">
      %1:3 = "transform.structured.lower_pack"(%0) <{lowerPadLikeWithInsertSlice = true}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<129x47x16x16xf32>, tensor<1x1x1x1x136x64x16x16xf32>) -> tensor<1x1x1x1x136x64x16x16xf32>, sym_name = "pack_as_pad"}> ({
  ^bb0(%arg1: tensor<129x47x16x16xf32>, %arg2: tensor<1x1x1x1x136x64x16x16xf32>):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.pack"(%arg1, %arg2, %2) <{inner_dims_pos = array<i64: 0, 1, 2, 3>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 136, 64, 16, 16>}> : (tensor<129x47x16x16xf32>, tensor<1x1x1x1x136x64x16x16xf32>, f32) -> tensor<1x1x1x1x136x64x16x16xf32>
    "func.return"(%3) : (tensor<1x1x1x1x136x64x16x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.op<"linalg.pack">
      %1:3 = "transform.structured.lower_pack"(%0) <{lowerPadLikeWithInsertSlice = true}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<129x47x16x16xf32>, tensor<1x1x1x1x136x64x16x16xf32>) -> tensor<1x1x1x1x136x64x16x16xf32>, sym_name = "pack_as_pad_disabled_insert_slice"}> ({
  ^bb0(%arg1: tensor<129x47x16x16xf32>, %arg2: tensor<1x1x1x1x136x64x16x16xf32>):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.pack"(%arg1, %arg2, %2) <{inner_dims_pos = array<i64: 0, 1, 2, 3>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 136, 64, 16, 16>}> : (tensor<129x47x16x16xf32>, tensor<1x1x1x1x136x64x16x16xf32>, f32) -> tensor<1x1x1x1x136x64x16x16xf32>
    "func.return"(%3) : (tensor<1x1x1x1x136x64x16x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.op<"linalg.pack">
      %1:3 = "transform.structured.lower_pack"(%0) <{lowerPadLikeWithInsertSlice = false}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<129x47x16x16xf32>, tensor<1x1x16x16x136x64xf32>) -> tensor<1x1x16x16x136x64xf32>, sym_name = "pack_not_a_pad"}> ({
  ^bb0(%arg1: tensor<129x47x16x16xf32>, %arg2: tensor<1x1x16x16x136x64xf32>):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.pack"(%arg1, %arg2, %2) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 136, 64>}> : (tensor<129x47x16x16xf32>, tensor<1x1x16x16x136x64xf32>, f32) -> tensor<1x1x16x16x136x64xf32>
    "func.return"(%3) : (tensor<1x1x16x16x136x64xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.op<"linalg.pack">
      %1:3 = "transform.structured.lower_pack"(%0) <{lowerPadLikeWithInsertSlice = true}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<17x2x16x16x32x8xf32>, tensor<129x47x16x16xf32>) -> tensor<129x47x16x16xf32>, sym_name = "unpack"}> ({
  ^bb0(%arg1: tensor<17x2x16x16x32x8xf32>, %arg2: tensor<129x47x16x16xf32>):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.unpack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 1, 0>, static_inner_tiles = array<i64: 32, 8>}> : (tensor<17x2x16x16x32x8xf32>, tensor<129x47x16x16xf32>) -> tensor<129x47x16x16xf32>
    "func.return"(%3) : (tensor<129x47x16x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %1:4 = "transform.structured.lower_unpack"(%0) <{lowerUnpadLikeWithExtractSlice = true}> : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<17x2x16x16x32x8xf32>, tensor<129x47x16x16xf32>) -> tensor<129x47x16x16xf32>, sym_name = "unpack_with_identity_outer_dims_perm"}> ({
  ^bb0(%arg1: tensor<17x2x16x16x32x8xf32>, %arg2: tensor<129x47x16x16xf32>):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.unpack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 1, 0>, outer_dims_perm = array<i64: 0, 1, 2, 3>, static_inner_tiles = array<i64: 32, 8>}> : (tensor<17x2x16x16x32x8xf32>, tensor<129x47x16x16xf32>) -> tensor<129x47x16x16xf32>
    "func.return"(%3) : (tensor<129x47x16x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %1:4 = "transform.structured.lower_unpack"(%0) <{lowerUnpadLikeWithExtractSlice = true}> : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x1x1x136x64x16x16xf32>, tensor<129x47x16x16xf32>) -> tensor<129x47x16x16xf32>, sym_name = "unpack_as_pad"}> ({
  ^bb0(%arg1: tensor<1x1x1x1x136x64x16x16xf32>, %arg2: tensor<129x47x16x16xf32>):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.unpack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 0, 1, 2, 3>, static_inner_tiles = array<i64: 136, 64, 16, 16>}> : (tensor<1x1x1x1x136x64x16x16xf32>, tensor<129x47x16x16xf32>) -> tensor<129x47x16x16xf32>
    "func.return"(%3) : (tensor<129x47x16x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %1:4 = "transform.structured.lower_unpack"(%0) <{lowerUnpadLikeWithExtractSlice = true}> : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x1x1x136x64x16x16xf32>, tensor<129x47x16x16xf32>) -> tensor<129x47x16x16xf32>, sym_name = "unpack_as_pad_disabled_extract_slice"}> ({
  ^bb0(%arg1: tensor<1x1x1x1x136x64x16x16xf32>, %arg2: tensor<129x47x16x16xf32>):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.unpack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 0, 1, 2, 3>, static_inner_tiles = array<i64: 136, 64, 16, 16>}> : (tensor<1x1x1x1x136x64x16x16xf32>, tensor<129x47x16x16xf32>) -> tensor<129x47x16x16xf32>
    "func.return"(%3) : (tensor<129x47x16x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %1:4 = "transform.structured.lower_unpack"(%0) <{lowerUnpadLikeWithExtractSlice = false}> : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100x200x128x256xi32>, tensor<200x4x16x100x16x32xi32>) -> tensor<200x4x16x100x16x32xi32>, sym_name = "pack_with_outer_dims_perm"}> ({
  ^bb0(%arg1: tensor<100x200x128x256xi32>, %arg2: tensor<200x4x16x100x16x32xi32>):
    %2 = "linalg.pack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 3, 2>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 2, 3, 0>, static_inner_tiles = array<i64: 16, 32>}> : (tensor<100x200x128x256xi32>, tensor<200x4x16x100x16x32xi32>) -> tensor<200x4x16x100x16x32xi32>
    "func.return"(%2) : (tensor<200x4x16x100x16x32xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.op<"linalg.pack">
      %1:3 = "transform.structured.lower_pack"(%0) <{lowerPadLikeWithInsertSlice = true}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4225x12xf32>, tensor<265x12x16x1xf32>) -> tensor<265x12x16x1xf32>, sym_name = "pack_with_pad"}> ({
  ^bb0(%arg1: tensor<4225x12xf32>, %arg2: tensor<265x12x16x1xf32>):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.pack"(%arg1, %arg2, %2) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 16, 1>}> : (tensor<4225x12xf32>, tensor<265x12x16x1xf32>, f32) -> tensor<265x12x16x1xf32>
    "func.return"(%3) : (tensor<265x12x16x1xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.op<"linalg.pack">
      %1:3 = "transform.structured.lower_pack"(%0) <{lowerPadLikeWithInsertSlice = true}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100x200x127x255xi32>, tensor<200x4x16x100x16x32xi32>) -> tensor<200x4x16x100x16x32xi32>, sym_name = "pack_with_pad_and_outer_dims_perm"}> ({
  ^bb0(%arg1: tensor<100x200x127x255xi32>, %arg2: tensor<200x4x16x100x16x32xi32>):
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "linalg.pack"(%arg1, %arg2, %2) <{inner_dims_pos = array<i64: 3, 2>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, outer_dims_perm = array<i64: 1, 2, 3, 0>, static_inner_tiles = array<i64: 16, 32>}> : (tensor<100x200x127x255xi32>, tensor<200x4x16x100x16x32xi32>, i32) -> tensor<200x4x16x100x16x32xi32>
    "func.return"(%3) : (tensor<200x4x16x100x16x32xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.op<"linalg.pack">
      %1:3 = "transform.structured.lower_pack"(%0) <{lowerPadLikeWithInsertSlice = true}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> tensor<?x?x16x32xf32>, sym_name = "dynamic_pack_pad_transpose_inner_and_outer_dims"}> ({
  ^bb0(%arg1: tensor<?x?xf32>):
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 1 : index}> : () -> index
    %4 = "tensor.dim"(%arg1, %2) : (tensor<?x?xf32>, index) -> index
    %5 = "tensor.dim"(%arg1, %3) : (tensor<?x?xf32>, index) -> index
    %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = 16 : index}> : () -> index
    %8 = "arith.constant"() <{value = 32 : index}> : () -> index
    %9 = "arith.ceildivui"(%4, %8) : (index, index) -> index
    %10 = "arith.ceildivui"(%5, %7) : (index, index) -> index
    %11 = "tensor.empty"(%10, %9) : (index, index) -> tensor<?x?x16x32xf32>
    %12 = "linalg.pack"(%arg1, %11, %6) <{inner_dims_pos = array<i64: 1, 0>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 16, 32>}> : (tensor<?x?xf32>, tensor<?x?x16x32xf32>, f32) -> tensor<?x?x16x32xf32>
    "func.return"(%12) : (tensor<?x?x16x32xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.op<"linalg.pack">
      %1:3 = "transform.structured.lower_pack"(%0) <{lowerPadLikeWithInsertSlice = true}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<129x47x16x16xf32>, tensor<1x1x1x1x136x64x16x16xf32>) -> tensor<1x1x1x1x136x64x16x16xf32>, sym_name = "pack_as_pad_with_outer_dims_perm"}> ({
  ^bb0(%arg1: tensor<129x47x16x16xf32>, %arg2: tensor<1x1x1x1x136x64x16x16xf32>):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.pack"(%arg1, %arg2, %2) <{inner_dims_pos = array<i64: 0, 1, 2, 3>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, outer_dims_perm = array<i64: 1, 2, 3, 0>, static_inner_tiles = array<i64: 136, 64, 16, 16>}> : (tensor<129x47x16x16xf32>, tensor<1x1x1x1x136x64x16x16xf32>, f32) -> tensor<1x1x1x1x136x64x16x16xf32>
    "func.return"(%3) : (tensor<1x1x1x1x136x64x16x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.op<"linalg.pack">
      %1:3 = "transform.structured.lower_pack"(%0) <{lowerPadLikeWithInsertSlice = true}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x1x1x1xf32>, tensor<1x1x1x1x8x1xf32>) -> tensor<1x1x1x1x8x1xf32>, sym_name = "pack_as_pad_with_unit_dims"}> ({
  ^bb0(%arg1: tensor<3x1x1x1xf32>, %arg2: tensor<1x1x1x1x8x1xf32>):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.pack"(%arg1, %arg2, %2) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 8, 1>}> : (tensor<3x1x1x1xf32>, tensor<1x1x1x1x8x1xf32>, f32) -> tensor<1x1x1x1x8x1xf32>
    "func.return"(%3) : (tensor<1x1x1x1x8x1xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pack"]}> : (!transform.any_op) -> !transform.op<"linalg.pack">
      %1:3 = "transform.structured.lower_pack"(%0) <{lowerPadLikeWithInsertSlice = true}> : (!transform.op<"linalg.pack">) -> (!transform.op<"tensor.pad">, !transform.op<"tensor.expand_shape">, !transform.op<"linalg.transpose">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x2x49x16x16xf32>, tensor<32x?x?xf32>) -> tensor<32x?x?xf32>, sym_name = "unpack_with_dynamic_dest"}> ({
  ^bb0(%arg1: tensor<32x2x49x16x16xf32>, %arg2: tensor<32x?x?xf32>):
    %2 = "linalg.unpack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 1, 2>, static_inner_tiles = array<i64: 16, 16>}> : (tensor<32x2x49x16x16xf32>, tensor<32x?x?xf32>) -> tensor<32x?x?xf32>
    "func.return"(%2) : (tensor<32x?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %1:4 = "transform.structured.lower_unpack"(%0) <{lowerUnpadLikeWithExtractSlice = true}> : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x8x16xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "unpack_with_dynamic_input_dest"}> ({
  ^bb0(%arg1: tensor<?x?x8x16xf32>, %arg2: tensor<?x?xf32>):
    %2 = "linalg.unpack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 16>}> : (tensor<?x?x8x16xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%2) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %1:4 = "transform.structured.lower_unpack"(%0) <{lowerUnpadLikeWithExtractSlice = true}> : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "unpack_fully_dynamic"}> ({
  ^bb0(%arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: index, %arg4: index):
    %2 = "linalg.unpack"(%arg1, %arg2, %arg3, %arg4) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<?x?x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    "func.return"(%2) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %1:4 = "transform.structured.lower_unpack"(%0) <{lowerUnpadLikeWithExtractSlice = true}> : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x1x1x136x64x16x16xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "unpack_as_pad_dynamic"}> ({
  ^bb0(%arg1: tensor<1x1x1x1x136x64x16x16xf32>, %arg2: tensor<?x?x?x?xf32>):
    %2 = "linalg.unpack"(%arg1, %arg2) <{inner_dims_pos = array<i64: 0, 1, 2, 3>, static_inner_tiles = array<i64: 136, 64, 16, 16>}> : (tensor<1x1x1x1x136x64x16x16xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%2) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %1:4 = "transform.structured.lower_unpack"(%0) <{lowerUnpadLikeWithExtractSlice = true}> : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64xf32>, tensor<2x4x32x8xf32>) -> tensor<32x64xf32>, sym_name = "unpack_with_outer_dims_perm"}> ({
  ^bb0(%arg1: tensor<32x64xf32>, %arg2: tensor<2x4x32x8xf32>):
    %2 = "linalg.unpack"(%arg2, %arg1) <{inner_dims_pos = array<i64: 1, 0>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 32, 8>}> : (tensor<2x4x32x8xf32>, tensor<32x64xf32>) -> tensor<32x64xf32>
    "func.return"(%2) : (tensor<32x64xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.unpack"]}> : (!transform.any_op) -> !transform.op<"linalg.unpack">
      %1:4 = "transform.structured.lower_unpack"(%0) <{lowerUnpadLikeWithExtractSlice = true}> : (!transform.op<"linalg.unpack">) -> (!transform.op<"tensor.empty">, !transform.op<"linalg.transpose">, !transform.op<"tensor.collapse_shape">, !transform.op<"tensor.extract_slice">)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

