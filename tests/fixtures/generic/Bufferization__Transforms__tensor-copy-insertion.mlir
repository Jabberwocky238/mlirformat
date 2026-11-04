"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, index, f32) -> (tensor<?xf32>, tensor<?xf32>), sym_name = "read_after_write_conflict"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: index, %arg2: f32):
    %0 = "tensor.insert"(%arg2, %arg0, %arg1) : (f32, tensor<?xf32>, index) -> tensor<?xf32>
    "func.return"(%0, %arg0) : (tensor<?xf32>, tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<5xf32>, sym_name = "return_alloc_tensor"}> ({
    %0 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<5xf32>
    "func.return"(%0) : (tensor<5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, index) -> (tensor<5xf32>, tensor<5xf32>), sym_name = "do_not_copy_undefined_tensor"}> ({
  ^bb0(%arg0: f32, %arg1: index):
    %0 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<5xf32>
    %1 = "tensor.insert"(%arg0, %0, %arg1) : (f32, tensor<5xf32>, index) -> tensor<5xf32>
    "func.return"(%0, %1) : (tensor<5xf32>, tensor<5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5xf32>, f32) -> (tensor<5xf32>, tensor<5xf32>), sym_name = "do_not_copy_when_overwritten"}> ({
  ^bb0(%arg0: tensor<5xf32>, %arg1: f32):
    %0 = "linalg.generic"(%arg0) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<5xf32>) -> tensor<5xf32>
    "func.return"(%arg0, %0) : (tensor<5xf32>, tensor<5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5xf32>, f32) -> tensor<3xf32>, sym_name = "do_not_copy_when_result_not_read"}> ({
  ^bb0(%arg0: tensor<5xf32>, %arg1: f32):
    %0 = "tensor.extract_slice"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 3>, static_strides = array<i64: 1>}> : (tensor<5xf32>) -> tensor<3xf32>
    %1 = "linalg.generic"(%0) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<3xf32>) -> tensor<3xf32>
    "func.return"(%1) : (tensor<3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

