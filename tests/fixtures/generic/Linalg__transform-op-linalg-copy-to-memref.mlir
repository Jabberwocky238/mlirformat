"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x64xf32>, memref<128x64xf32>) -> (), sym_name = "linalg_copy_to_memref_copy"}> ({
  ^bb0(%arg1: memref<128x64xf32>, %arg2: memref<128x64xf32>):
    "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (memref<128x64xf32>, memref<128x64xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.linalg_copy_to_memref"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x32xf32>, memref<128x64xf32>) -> (), sym_name = "linalg_copy_to_memref_copy_strides"}> ({
  ^bb0(%arg1: memref<128x32xf32>, %arg2: memref<128x64xf32>):
    %2 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128x64xf32>
    %3 = "memref.subview"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 32>, static_sizes = array<i64: 128, 32>, static_strides = array<i64: 1, 1>}> : (memref<128x64xf32>) -> memref<128x32xf32, strided<[64, 1], offset: 32>>
    "linalg.copy"(%arg1, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (memref<128x32xf32>, memref<128x32xf32, strided<[64, 1], offset: 32>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.linalg_copy_to_memref"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x64xf32>, tensor<128x64xf32>) -> tensor<128x64xf32>, sym_name = "linalg_copy_to_memref_copy_tensors"}> ({
  ^bb0(%arg1: tensor<128x64xf32>, %arg2: tensor<128x64xf32>):
    %2 = "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (tensor<128x64xf32>, tensor<128x64xf32>) -> tensor<128x64xf32>
    "func.return"(%2) : (tensor<128x64xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.linalg_copy_to_memref"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x64xf32>, memref<128x64xf64>) -> (), sym_name = "linalg_copy_to_memref_copy_different_element"}> ({
  ^bb0(%arg1: memref<128x64xf32>, %arg2: memref<128x64xf64>):
    "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f64):
      %2 = "arith.extf"(%arg3) : (f32) -> f64
      "linalg.yield"(%2) : (f64) -> ()
    }) : (memref<128x64xf32>, memref<128x64xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.linalg_copy_to_memref"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f64, memref<128x64xf64>) -> (), sym_name = "linalg_copy_to_memref_copy_scalar"}> ({
  ^bb0(%arg1: f64, %arg2: memref<128x64xf64>):
    "linalg.copy"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f64, %arg4: f64):
      "linalg.yield"(%arg3) : (f64) -> ()
    }) : (f64, memref<128x64xf64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.copy"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.linalg_copy_to_memref"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

