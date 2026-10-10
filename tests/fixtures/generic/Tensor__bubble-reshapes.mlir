"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>, sym_name = "bubble_parallel_reshapes"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2], [3]]}> : (tensor<?x?x?x?xf32>) -> tensor<?x?x?xf32>
    %1 = "tensor.expand_shape"(%0, %arg1, %arg2, %arg3, %arg4) <{reassociation = [[0], [1], [2, 3]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (tensor<?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>
    "func.return"(%1) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>, sym_name = "no_bubble_full_intersecting_reshapes"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2], [3]]}> : (tensor<?x?x?x?xf32>) -> tensor<?x?x?xf32>
    %1 = "tensor.expand_shape"(%0, %arg1, %arg2, %arg3, %arg4) <{reassociation = [[0], [1, 2], [3]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (tensor<?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>
    "func.return"(%1) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>, sym_name = "no_bubble_partial_intersecting_reshapes"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1, 2], [3]]}> : (tensor<?x?x?x?xf32>) -> tensor<?x?xf32>
    %1 = "tensor.expand_shape"(%0, %arg1, %arg2, %arg3, %arg4) <{reassociation = [[0, 1], [2, 3]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (tensor<?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>
    "func.return"(%1) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1xf32>) -> tensor<1x1x1xf32>, sym_name = "no_bubble_0d_tensor_reshapes"}> ({
  ^bb0(%arg0: tensor<1x1xf32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = []}> : (tensor<1x1xf32>) -> tensor<f32>
    %1 = "tensor.expand_shape"(%0) <{reassociation = [], static_output_shape = array<i64: 1, 1, 1>}> : (tensor<f32>) -> tensor<1x1x1xf32>
    "func.return"(%1) : (tensor<1x1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x?x4x32x4x?xf16>, index, index) -> tensor<4x?x4x128x?x32xf16>, sym_name = "bubble_expand_match_non_unit_size_reassocation"}> ({
  ^bb0(%arg0: tensor<4x?x4x32x4x?xf16>, %arg1: index, %arg2: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1, 2], [3, 4], [5]]}> : (tensor<4x?x4x32x4x?xf16>) -> tensor<?x128x?xf16>
    %1 = "tensor.expand_shape"(%0, %arg1, %arg2) <{reassociation = [[0, 1, 2], [3], [4, 5]], static_output_shape = array<i64: 4, -9223372036854775808, 4, 128, -9223372036854775808, 32>}> : (tensor<?x128x?xf16>, index, index) -> tensor<4x?x4x128x?x32xf16>
    "func.return"(%1) : (tensor<4x?x4x128x?x32xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x?x4x128x?xf16>, index, index) -> tensor<4x?x4x128x?x32xf16>, sym_name = "no_collapse_generated"}> ({
  ^bb0(%arg0: tensor<4x?x4x128x?xf16>, %arg1: index, %arg2: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1, 2], [3], [4]]}> : (tensor<4x?x4x128x?xf16>) -> tensor<?x128x?xf16>
    %1 = "tensor.expand_shape"(%0, %arg1, %arg2) <{reassociation = [[0, 1, 2], [3], [4, 5]], static_output_shape = array<i64: 4, -9223372036854775808, 4, 128, -9223372036854775808, 32>}> : (tensor<?x128x?xf16>, index, index) -> tensor<4x?x4x128x?x32xf16>
    "func.return"(%1) : (tensor<4x?x4x128x?x32xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x?x4x128x?x?x?xf16>, index, index, index) -> tensor<4x?x4x128x?x?xf16>, sym_name = "no_expand_generated"}> ({
  ^bb0(%arg0: tensor<4x?x4x128x?x?x?xf16>, %arg1: index, %arg2: index, %arg3: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1, 2], [3], [4], [5, 6]]}> : (tensor<4x?x4x128x?x?x?xf16>) -> tensor<?x128x?x?xf16>
    %1 = "tensor.expand_shape"(%0, %arg1, %arg2, %arg3) <{reassociation = [[0, 1, 2], [3], [4], [5]], static_output_shape = array<i64: 4, -9223372036854775808, 4, 128, -9223372036854775808, -9223372036854775808>}> : (tensor<?x128x?x?xf16>, index, index, index) -> tensor<4x?x4x128x?x?xf16>
    "func.return"(%1) : (tensor<4x?x4x128x?x?xf16>) -> ()
  }) : () -> ()
}) : () -> ()

