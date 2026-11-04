"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x4x?xf32>, tensor<2x4x?xf32>) -> tensor<?x4x?xf32>, sym_name = "two_dynamic_one_direct_shape"}> ({
  ^bb0(%arg0: tensor<?x4x?xf32>, %arg1: tensor<2x4x?xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "shape.shape_of"(%arg0) : (tensor<?x4x?xf32>) -> tensor<3xindex>
    %4 = "shape.get_extent"(%3, %0) : (tensor<3xindex>, index) -> index
    %5 = "test.abs"(%arg0) : (tensor<?x4x?xf32>) -> tensor<?x4x?xf32>
    %6 = "shape.with_shape"(%5, %3) : (tensor<?x4x?xf32>, tensor<3xindex>) -> !shape.value_shape
    %7 = "shape.value_of"(%6) : (!shape.value_shape) -> tensor<?x4x?xf32>
    %8 = "test.concat"(%7, %arg1) {axis = 0 : i64} : (tensor<?x4x?xf32>, tensor<2x4x?xf32>) -> tensor<?x4x?xf32>
    %9 = "shape.get_extent"(%3, %1) : (tensor<3xindex>, index) -> index
    %10 = "arith.addi"(%9, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %11 = "shape.from_extents"(%10, %2, %4) : (index, index, index) -> !shape.shape
    %12 = "shape.with_shape"(%8, %11) : (tensor<?x4x?xf32>, !shape.shape) -> !shape.value_shape
    %13 = "shape.value_of"(%12) : (!shape.value_shape) -> tensor<?x4x?xf32>
    "func.return"(%13) : (tensor<?x4x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x4x?xf32>, tensor<2x4x?xf32>) -> tensor<?x4x?xf32>, sym_name = "two_dynamic_share_same_shape"}> ({
  ^bb0(%arg0: tensor<?x4x?xf32>, %arg1: tensor<2x4x?xf32>):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    %3 = "shape.shape_of"(%arg0) : (tensor<?x4x?xf32>) -> tensor<3xindex>
    %4 = "shape.get_extent"(%3, %0) : (tensor<3xindex>, index) -> index
    %5 = "test.concat"(%arg0, %arg1) {axis = 0 : i64} : (tensor<?x4x?xf32>, tensor<2x4x?xf32>) -> tensor<?x4x?xf32>
    %6 = "shape.get_extent"(%3, %1) : (tensor<3xindex>, index) -> index
    %7 = "arith.addi"(%6, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %8 = "shape.from_extents"(%7, %2, %4) : (index, index, index) -> !shape.shape
    %9 = "shape.with_shape"(%5, %8) : (tensor<?x4x?xf32>, !shape.shape) -> !shape.value_shape
    %10 = "shape.value_of"(%9) : (!shape.value_shape) -> tensor<?x4x?xf32>
    %11 = "test.abs"(%10) : (tensor<?x4x?xf32>) -> tensor<?x4x?xf32>
    %12 = "shape.with_shape"(%11, %8) : (tensor<?x4x?xf32>, !shape.shape) -> !shape.value_shape
    %13 = "shape.value_of"(%12) : (!shape.value_shape) -> tensor<?x4x?xf32>
    "func.return"(%13) : (tensor<?x4x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x4xf32>) -> tensor<?xi32>, sym_name = "internal_dynamic_shape_source_shared"}> ({
  ^bb0(%arg0: tensor<?x4xf32>):
    %0 = "test.nonzero"(%arg0) : (tensor<?x4xf32>) -> tensor<?xi32>
    %1 = "shape.shape_of"(%0) : (tensor<?xi32>) -> tensor<1xindex>
    %2 = "shape.with_shape"(%0, %1) : (tensor<?xi32>, tensor<1xindex>) -> !shape.value_shape
    %3 = "shape.value_of"(%2) : (!shape.value_shape) -> tensor<?xi32>
    %4 = "test.abs"(%3) : (tensor<?xi32>) -> tensor<?xi32>
    %5 = "shape.with_shape"(%4, %1) : (tensor<?xi32>, tensor<1xindex>) -> !shape.value_shape
    %6 = "shape.value_of"(%5) : (!shape.value_shape) -> tensor<?xi32>
    %7 = "test.negate"(%6) : (tensor<?xi32>) -> tensor<?xi32>
    %8 = "shape.with_shape"(%7, %1) : (tensor<?xi32>, tensor<1xindex>) -> !shape.value_shape
    %9 = "shape.value_of"(%8) : (!shape.value_shape) -> tensor<?xi32>
    "func.return"(%9) : (tensor<?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x4xf32>, tensor<1xindex>) -> tensor<?xi32>, sym_name = "only_return_of_constructed_shape"}> ({
  ^bb0(%arg0: tensor<?x4xf32>, %arg1: tensor<1xindex>):
    %0 = "test.nonzero"(%arg0) : (tensor<?x4xf32>) -> tensor<?xi32>
    %1 = "shape.with_shape"(%0, %arg1) : (tensor<?xi32>, tensor<1xindex>) -> !shape.value_shape
    %2 = "shape.value_of"(%1) : (!shape.value_shape) -> tensor<?xi32>
    "func.return"(%2) : (tensor<?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x4x5xf32>, tensor<?x4x5xf32>, tensor<?x4x5xf32>) -> (tensor<?x4x5xf32>, index), sym_name = "interleaved_shape_computation"}> ({
  ^bb0(%arg0: tensor<?x4x5xf32>, %arg1: tensor<?x4x5xf32>, %arg2: tensor<?x4x5xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 4 : index}> : () -> index
    %2 = "arith.constant"() <{value = 5 : index}> : () -> index
    %3 = "shape.shape_of"(%arg0) : (tensor<?x4x5xf32>) -> tensor<3xindex>
    %4 = "shape.shape_of"(%arg1) : (tensor<?x4x5xf32>) -> tensor<3xindex>
    %5 = "shape.shape_of"(%arg2) : (tensor<?x4x5xf32>) -> tensor<3xindex>
    %6 = "test.concat"(%arg0, %arg1, %arg2) {axis = 0 : i64} : (tensor<?x4x5xf32>, tensor<?x4x5xf32>, tensor<?x4x5xf32>) -> tensor<?x4x5xf32>
    %7 = "shape.get_extent"(%3, %0) : (tensor<3xindex>, index) -> index
    %8 = "shape.get_extent"(%4, %0) : (tensor<3xindex>, index) -> index
    %9 = "shape.get_extent"(%5, %0) : (tensor<3xindex>, index) -> index
    %10 = "arith.addi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %11 = "arith.addi"(%10, %9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %12 = "shape.from_extents"(%11, %1, %2) : (index, index, index) -> !shape.shape
    %13 = "shape.with_shape"(%6, %12) : (tensor<?x4x5xf32>, !shape.shape) -> !shape.value_shape
    %14 = "shape.value_of"(%13) : (!shape.value_shape) -> tensor<?x4x5xf32>
    "func.return"(%14, %10) : (tensor<?x4x5xf32>, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x4xf32>, tensor<?x4xf32>) -> (tensor<?x4xf32>, tensor<?x4xf32>, tensor<?x4xf32>, tensor<?x4xf32>), sym_name = "multiple_reused"}> ({
  ^bb0(%arg2: tensor<?x4xf32>, %arg3: tensor<?x4xf32>):
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "arith.constant"() <{value = 4 : index}> : () -> index
    %5 = "shape.shape_of"(%arg2) : (tensor<?x4xf32>) -> tensor<2xindex>
    %6 = "shape.shape_of"(%arg3) : (tensor<?x4xf32>) -> tensor<2xindex>
    %7 = "test.concat"(%arg2, %arg3) {axis = 0 : i64} : (tensor<?x4xf32>, tensor<?x4xf32>) -> tensor<?x4xf32>
    %8 = "test.concat"(%arg2, %arg3) {axis = 0 : i64} : (tensor<?x4xf32>, tensor<?x4xf32>) -> tensor<?x4xf32>
    %9 = "shape.get_extent"(%5, %3) : (tensor<2xindex>, index) -> index
    %10 = "shape.get_extent"(%6, %3) : (tensor<2xindex>, index) -> index
    %11 = "arith.addi"(%9, %10) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %12 = "shape.from_extents"(%11, %4) : (index, index) -> !shape.shape
    %13 = "shape.with_shape"(%7, %12) : (tensor<?x4xf32>, !shape.shape) -> !shape.value_shape
    %14 = "shape.with_shape"(%8, %12) : (tensor<?x4xf32>, !shape.shape) -> !shape.value_shape
    %15 = "shape.value_of"(%13) : (!shape.value_shape) -> tensor<?x4xf32>
    %16 = "shape.value_of"(%14) : (!shape.value_shape) -> tensor<?x4xf32>
    %17 = "test.concat"(%arg2, %7) {axis = 0 : i64} : (tensor<?x4xf32>, tensor<?x4xf32>) -> tensor<?x4xf32>
    %18 = "test.concat"(%arg2, %8) {axis = 0 : i64} : (tensor<?x4xf32>, tensor<?x4xf32>) -> tensor<?x4xf32>
    %19 = "arith.addi"(%11, %9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %20 = "shape.from_extents"(%19, %4) : (index, index) -> !shape.shape
    %21 = "shape.with_shape"(%17, %20) : (tensor<?x4xf32>, !shape.shape) -> !shape.value_shape
    %22 = "shape.with_shape"(%18, %20) : (tensor<?x4xf32>, !shape.shape) -> !shape.value_shape
    %23 = "shape.value_of"(%21) : (!shape.value_shape) -> tensor<?x4xf32>
    %24 = "shape.value_of"(%22) : (!shape.value_shape) -> tensor<?x4xf32>
    "func.return"(%15, %16, %23, %24) : (tensor<?x4xf32>, tensor<?x4xf32>, tensor<?x4xf32>, tensor<?x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!shape.value_shape, !shape.value_shape) -> tensor<?xf32>, sym_name = "value_shape_with_shape"}> ({
  ^bb0(%arg0: !shape.value_shape, %arg1: !shape.value_shape):
    %0 = "shape.shape_of"(%arg0) : (!shape.value_shape) -> !shape.shape
    %1 = "shape.with_shape"(%arg1, %0) : (!shape.value_shape, !shape.shape) -> !shape.value_shape
    %2 = "shape.value_of"(%1) : (!shape.value_shape) -> tensor<?xf32>
    "func.return"(%2) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

