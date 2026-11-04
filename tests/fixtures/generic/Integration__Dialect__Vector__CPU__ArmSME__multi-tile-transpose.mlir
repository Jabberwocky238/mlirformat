#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "fill2DMemrefRows"}> ({
  ^bb0(%arg6: memref<?x?xf32>):
    %25 = "arith.constant"() <{value = 0 : index}> : () -> index
    %26 = "arith.constant"() <{value = 1 : index}> : () -> index
    %27 = "memref.dim"(%arg6, %25) : (memref<?x?xf32>, index) -> index
    %28 = "memref.dim"(%arg6, %26) : (memref<?x?xf32>, index) -> index
    "scf.for"(%25, %27, %26) ({
    ^bb0(%arg7: index):
      "scf.for"(%25, %28, %26) ({
      ^bb0(%arg8: index):
        %29 = "arith.addi"(%arg7, %26) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %30 = "arith.index_cast"(%29) : (index) -> i32
        %31 = "arith.sitofp"(%30) : (i32) -> f32
        "memref.store"(%31, %arg6, %arg7, %arg8) : (f32, memref<?x?xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "testTransposedReadWithMask"}> ({
  ^bb0(%arg4: index, %arg5: index):
    %15 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x16xf32>
    %16 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x4xf32>
    %17 = "memref.cast"(%15) : (memref<4x16xf32>) -> memref<?x?xf32>
    %18 = "memref.cast"(%16) : (memref<16x4xf32>) -> memref<?x?xf32>
    "func.call"(%17) <{callee = @fill2DMemrefRows}> : (memref<?x?xf32>) -> ()
    %19 = "vector.create_mask"(%arg4, %arg5) : (index, index) -> vector<[4]x[16]xi1>
    %20 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %21 = "arith.constant"() <{value = 0 : index}> : () -> index
    %22 = "vector.transfer_read"(%17, %21, %21, %20, %19) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32, vector<[4]x[16]xi1>) -> vector<[16]x[4]xf32>
    "vector.transfer_write"(%22, %18, %21, %21) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<[16]x[4]xf32>, memref<?x?xf32>, index, index) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Input memref:\0A"}> : () -> ()
    %23 = "memref.cast"(%17) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%23) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Masked transposed result:\0A"}> : () -> ()
    %24 = "memref.cast"(%18) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%24) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "testTransposedWriteWithMask"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %5 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x4xf32>
    %6 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x16xf32>
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    "linalg.fill"(%7, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (f32, memref<4x16xf32>) -> ()
    %8 = "memref.cast"(%5) : (memref<16x4xf32>) -> memref<?x?xf32>
    %9 = "memref.cast"(%6) : (memref<4x16xf32>) -> memref<?x?xf32>
    "func.call"(%8) <{callee = @fill2DMemrefRows}> : (memref<?x?xf32>) -> ()
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index
    %11 = "vector.transfer_read"(%8, %10, %10, %7) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (memref<?x?xf32>, index, index, f32) -> vector<[16]x[4]xf32>
    %12 = "vector.create_mask"(%arg0, %arg1) : (index, index) -> vector<[4]x[16]xi1>
    "vector.transfer_write"(%11, %9, %10, %10, %12) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = #map}> : (vector<[16]x[4]xf32>, memref<?x?xf32>, index, index, vector<[4]x[16]xi1>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Input memref:\0A"}> : () -> ()
    %13 = "memref.cast"(%8) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%13) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Masked transposed result:\0A"}> : () -> ()
    %14 = "memref.cast"(%9) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%14) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 128 : i32}> : () -> i32
    "func.call"(%0) <{callee = @setArmSVLBits}> : (i32) -> ()
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "arith.constant"() <{value = 15 : index}> : () -> index
    "func.call"(%1, %2) <{callee = @testTransposedReadWithMask}> : (index, index) -> ()
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 8 : index}> : () -> index
    "func.call"(%3, %4) <{callee = @testTransposedWriteWithMask}> : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmSVLBits", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

