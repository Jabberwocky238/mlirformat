"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "print_0d"}> ({
    %15 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":3:11)
    %16 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f32> loc("<stdin>":4:11)
    "memref.store"(%15, %16) : (f32, memref<f32>) -> () loc("<stdin>":5:5)
    %17 = "memref.cast"(%16) : (memref<f32>) -> memref<*xf32> loc("<stdin>":6:11)
    "func.call"(%17) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":7:5)
    "memref.dealloc"(%16) : (memref<f32>) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "print_1d"}> ({
    %11 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":12:11)
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16xf32> loc("<stdin>":13:11)
    %13 = "memref.cast"(%12) : (memref<16xf32>) -> memref<?xf32> loc("<stdin>":14:11)
    "linalg.fill"(%11, %13) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":16:10), %arg3: f32 loc("<stdin>":16:22)):
      "linalg.yield"(%arg2) : (f32) -> () loc("<stdin>":17:7)
    }) : (f32, memref<?xf32>) -> () loc("<stdin>":15:5)
    %14 = "memref.cast"(%13) : (memref<?xf32>) -> memref<*xf32> loc("<stdin>":19:11)
    "func.call"(%14) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":20:5)
    "memref.dealloc"(%12) : (memref<16xf32>) -> () loc("<stdin>":21:5)
    "func.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = () -> (), sym_name = "print_3d"}> ({
    %5 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32 loc("<stdin>":25:10)
    %6 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32 loc("<stdin>":26:10)
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x4x5xf32> loc("<stdin>":27:10)
    %8 = "memref.cast"(%7) : (memref<3x4x5xf32>) -> memref<?x?x?xf32> loc("<stdin>":28:10)
    "linalg.fill"(%5, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg0: f32 loc("<stdin>":30:10), %arg1: f32 loc("<stdin>":30:22)):
      "linalg.yield"(%arg0) : (f32) -> () loc("<stdin>":31:7)
    }) : (f32, memref<?x?x?xf32>) -> () loc("<stdin>":29:5)
    %9 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":33:10)
    "memref.store"(%6, %8, %9, %9, %9) : (f32, memref<?x?x?xf32>, index, index, index) -> () loc("<stdin>":34:5)
    %10 = "memref.cast"(%8) : (memref<?x?x?xf32>) -> memref<*xf32> loc("<stdin>":35:11)
    "func.call"(%10) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":36:5)
    "memref.dealloc"(%7) : (memref<3x4x5xf32>) -> () loc("<stdin>":37:5)
    "func.return"() : () -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":24:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":40:3)
  "func.func"() <{function_type = () -> (), sym_name = "vector_splat_2d"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":43:10)
    %1 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32 loc("<stdin>":44:10)
    %2 = "vector.broadcast"(%1) : (f32) -> vector<4x4xf32> loc("<stdin>":45:10)
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x1xvector<4x4xf32>> loc("<stdin>":46:10)
    "memref.store"(%2, %3, %0, %0) : (vector<4x4xf32>, memref<1x1xvector<4x4xf32>>, index, index) -> () loc("<stdin>":47:5)
    %4 = "memref.cast"(%3) : (memref<1x1xvector<4x4xf32>>) -> memref<?x?xvector<4x4xf32>> loc("<stdin>":48:10)
    "func.call"(%4) <{callee = @printMemrefVector4x4xf32}> : (memref<?x?xvector<4x4xf32>>) -> () loc("<stdin>":49:5)
    "memref.dealloc"(%3) : (memref<1x1xvector<4x4xf32>>) -> () loc("<stdin>":50:5)
    "func.return"() : () -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (memref<?x?xvector<4x4xf32>>) -> (), sym_name = "printMemrefVector4x4xf32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":53:3)
}) : () -> () loc("<stdin>":1:1)
