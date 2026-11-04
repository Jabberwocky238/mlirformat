"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %7 = "memref.alloc"(%2, %2) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    "memref.store"(%3, %7, %0, %0) : (f32, memref<?x?xf32>, index, index) -> ()
    "memref.store"(%4, %7, %0, %1) : (f32, memref<?x?xf32>, index, index) -> ()
    "memref.store"(%5, %7, %1, %0) : (f32, memref<?x?xf32>, index, index) -> ()
    "memref.store"(%6, %7, %1, %1) : (f32, memref<?x?xf32>, index, index) -> ()
    %8 = "memref.subview"(%7, %1, %2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index) -> memref<?xf32, strided<[1], offset: ?>>
    %9 = "memref.subview"(%7, %1, %2) <{operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, 1>, static_strides = array<i64: 1, 1>}> : (memref<?x?xf32>, index, index) -> memref<?xf32, strided<[?], offset: ?>>
    %10 = "memref.cast"(%7) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %11 = "memref.cast"(%8) : (memref<?xf32, strided<[1], offset: ?>>) -> memref<*xf32>
    "func.call"(%11) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %12 = "memref.cast"(%9) : (memref<?xf32, strided<[?], offset: ?>>) -> memref<*xf32>
    "func.call"(%12) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%7) : (memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

