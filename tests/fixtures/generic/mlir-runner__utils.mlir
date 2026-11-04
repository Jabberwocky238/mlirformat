"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "print_0d"}> ({
    %15 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %16 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32>
    "memref.store"(%15, %16) : (f32, memref<f32>) -> ()
    %17 = "memref.cast"(%16) : (memref<f32>) -> memref<*xf32>
    "func.call"(%17) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%16) : (memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "print_1d"}> ({
    %11 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32>
    %13 = "memref.cast"(%12) : (memref<16xf32>) -> memref<?xf32>
    "linalg.fill"(%11, %13) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (f32, memref<?xf32>) -> ()
    %14 = "memref.cast"(%13) : (memref<?xf32>) -> memref<*xf32>
    "func.call"(%14) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%12) : (memref<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "print_3d"}> ({
    %5 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x4x5xf32>
    %8 = "memref.cast"(%7) : (memref<3x4x5xf32>) -> memref<?x?x?xf32>
    "linalg.fill"(%5, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg0: f32, %arg1: f32):
      "linalg.yield"(%arg0) : (f32) -> ()
    }) : (f32, memref<?x?x?xf32>) -> ()
    %9 = "arith.constant"() <{value = 2 : index}> : () -> index
    "memref.store"(%6, %8, %9, %9, %9) : (f32, memref<?x?x?xf32>, index, index, index) -> ()
    %10 = "memref.cast"(%8) : (memref<?x?x?xf32>) -> memref<*xf32>
    "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "memref.dealloc"(%7) : (memref<3x4x5xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "vector_splat_2d"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    %2 = "vector.broadcast"(%1) : (f32) -> vector<4x4xf32>
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x1xvector<4x4xf32>>
    "memref.store"(%2, %3, %0, %0) : (vector<4x4xf32>, memref<1x1xvector<4x4xf32>>, index, index) -> ()
    %4 = "memref.cast"(%3) : (memref<1x1xvector<4x4xf32>>) -> memref<?x?xvector<4x4xf32>>
    "func.call"(%4) <{callee = @printMemrefVector4x4xf32}> : (memref<?x?xvector<4x4xf32>>) -> ()
    "memref.dealloc"(%3) : (memref<1x1xvector<4x4xf32>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xvector<4x4xf32>>) -> (), sym_name = "printMemrefVector4x4xf32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
}) : () -> ()

