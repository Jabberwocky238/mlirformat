"builtin.module"() ({
  "memref.global"() <{constant, initial_value = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00], [6.000000e+00, 7.000000e+00, 8.000000e+00], [9.000000e+00, 1.000000e+01, 1.100000e+01], [1.200000e+01, 1.300000e+01, 1.400000e+01]]> : tensor<5x3xf32>, sym_name = "__constant_5x3xf32", sym_visibility = "private", type = memref<5x3xf32>}> : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.get_global"() <{name = @__constant_5x3xf32}> : () -> memref<5x3xf32>
    %1 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 2, 0>, static_sizes = array<i64: 3, 3>, static_strides = array<i64: 1, 1>}> : (memref<5x3xf32>) -> memref<3x3xf32, strided<[3, 1], offset: 6>>
    %2 = "memref.cast"(%1) : (memref<3x3xf32, strided<[3, 1], offset: 6>>) -> memref<*xf32>
    "func.call"(%2) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %3 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 2>, static_sizes = array<i64: 5, 1>, static_strides = array<i64: 1, 1>}> : (memref<5x3xf32>) -> memref<5x1xf32, strided<[3, 1], offset: 2>>
    %4 = "memref.cast"(%3) : (memref<5x1xf32, strided<[3, 1], offset: 2>>) -> memref<*xf32>
    "func.call"(%4) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %5 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 2>, static_sizes = array<i64: 5, 1>, static_strides = array<i64: 1, 1>}> : (memref<5x3xf32>) -> memref<5xf32, strided<[3], offset: 2>>
    %6 = "memref.cast"(%5) : (memref<5xf32, strided<[3], offset: 2>>) -> memref<*xf32>
    "func.call"(%6) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %7 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 0>, static_sizes = array<i64: 1, 3>, static_strides = array<i64: 1, 1>}> : (memref<5x3xf32>) -> memref<3xf32, strided<[1], offset: 3>>
    %8 = "memref.cast"(%7) : (memref<3xf32, strided<[1], offset: 3>>) -> memref<*xf32>
    "func.call"(%8) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

