#map = affine_map<(d0) -> (d0 + 7)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> memref<*xf32>, sym_name = "test_clone"}> ({
  ^bb0(%arg18: memref<*xf32>):
    %19 = "bufferization.clone"(%arg18) : (memref<*xf32>) -> memref<*xf32>
    "func.return"(%19) : (memref<*xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xi64>, tensor<*xi64>) -> (memref<?xi64, #map>, memref<*xi64, 1>), sym_name = "test_to_buffer"}> ({
  ^bb0(%arg16: tensor<?xi64>, %arg17: tensor<*xi64>):
    %17 = "bufferization.to_buffer"(%arg16) : (tensor<?xi64>) -> memref<?xi64, #map>
    %18 = "bufferization.to_buffer"(%arg17) : (tensor<*xi64>) -> memref<*xi64, 1>
    "func.return"(%17, %18) : (memref<?xi64, #map>, memref<*xi64, 1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2xf32>) -> tensor<2xf32>, sym_name = "test_to_tensor"}> ({
  ^bb0(%arg15: memref<2xf32>):
    %16 = "bufferization.to_tensor"(%arg15) <{restrict, writable}> : (memref<2xf32>) -> tensor<2xf32>
    "func.return"(%16) : (tensor<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x5xf32>, index) -> tensor<?x5xf32>, sym_name = "test_alloc_tensor_op"}> ({
  ^bb0(%arg13: tensor<?x5xf32>, %arg14: index):
    %7 = "bufferization.alloc_tensor"(%arg14) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?x5xf32>
    %8 = "bufferization.alloc_tensor"(%arg13) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (tensor<?x5xf32>) -> tensor<?x5xf32>
    %9 = "bufferization.alloc_tensor"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> tensor<5x6xf32>
    %10 = "bufferization.alloc_tensor"(%arg14, %arg14) <{operandSegmentSizes = array<i32: 2, 0, 0>}> : (index, index) -> tensor<?x?xf32>
    %11 = "bufferization.alloc_tensor"(%arg13) <{operandSegmentSizes = array<i32: 0, 1, 0>}> {escape = true} : (tensor<?x5xf32>) -> tensor<?x5xf32>
    %12 = "bufferization.alloc_tensor"(%arg13) <{operandSegmentSizes = array<i32: 0, 1, 0>}> {escape = false} : (tensor<?x5xf32>) -> tensor<?x5xf32>
    %13 = "arith.constant"() <{value = 100 : index}> : () -> index
    %14 = "bufferization.alloc_tensor"(%13) <{operandSegmentSizes = array<i32: 0, 0, 1>}> : (index) -> tensor<100x100xf64, #sparse>
    %15 = "bufferization.alloc_tensor"(%arg14) <{memory_space = "foo", operandSegmentSizes = array<i32: 1, 0, 0>}> : (index) -> tensor<?xf32>
    "func.return"(%8) : (tensor<?x5xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4xi32>) -> (), sym_name = "test_dealloc_tensor_op"}> ({
  ^bb0(%arg12: tensor<4xi32>):
    "bufferization.dealloc_tensor"(%arg12) : (tensor<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>, memref<?xf32, 3>, tensor<5xf32>) -> tensor<?xf32>, sym_name = "test_materialize_in_destination_op"}> ({
  ^bb0(%arg8: tensor<?xf32>, %arg9: tensor<?xf32>, %arg10: memref<?xf32, 3>, %arg11: tensor<5xf32>):
    %5 = "bufferization.materialize_in_destination"(%arg8, %arg9) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "bufferization.materialize_in_destination"(%arg8, %arg10) <{restrict, writable}> : (tensor<?xf32>, memref<?xf32, 3>) -> ()
    %6 = "bufferization.materialize_in_destination"(%arg8, %arg11) : (tensor<?xf32>, tensor<5xf32>) -> tensor<5xf32>
    "func.return"(%5) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2xf32>, memref<4xi32>, i1, i1, memref<?xf32>, memref<*xf64>) -> (i1, i1), sym_name = "test_dealloc_op"}> ({
  ^bb0(%arg2: memref<2xf32>, %arg3: memref<4xi32>, %arg4: i1, %arg5: i1, %arg6: memref<?xf32>, %arg7: memref<*xf64>):
    %4:2 = "bufferization.dealloc"(%arg2, %arg3, %arg4, %arg5, %arg6, %arg7) <{operandSegmentSizes = array<i32: 2, 2, 2>}> : (memref<2xf32>, memref<4xi32>, i1, i1, memref<?xf32>, memref<*xf64>) -> (i1, i1)
    "bufferization.dealloc"(%arg2, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (memref<2xf32>, i1) -> ()
    "bufferization.dealloc"() <{operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> ()
    "func.return"(%4#0, %4#1) : (i1, i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<42xf32>) -> tensor<42xf32>, sym_name = "test_builtin_custom_builtin_type_conversion"}> ({
  ^bb0(%arg1: tensor<42xf32>):
    %2 = "bufferization.to_buffer"(%arg1) : (tensor<42xf32>) -> !test.test_memref<[42], f32>
    %3 = "bufferization.to_tensor"(%2) : (!test.test_memref<[42], f32>) -> tensor<42xf32>
    "func.return"(%3) : (tensor<42xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!test.test_tensor<[42], f32>) -> !test.test_tensor<[42], f32>, sym_name = "test_custom_builtin_custom_type_conversion"}> ({
  ^bb0(%arg0: !test.test_tensor<[42], f32>):
    %0 = "bufferization.to_buffer"(%arg0) : (!test.test_tensor<[42], f32>) -> memref<42xf32>
    %1 = "bufferization.to_tensor"(%0) : (memref<42xf32>) -> !test.test_tensor<[42], f32>
    "func.return"(%1) : (!test.test_tensor<[42], f32>) -> ()
  }) : () -> ()
}) : () -> ()

