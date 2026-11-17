"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>) -> (), sym_name = "fill2DMemrefRows"}> ({
  ^bb0(%arg6: memref<?x?xf32> loc("<stdin>":5:8)):
    %25 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":6:11)
    %26 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":7:11)
    %27 = "memref.dim"(%arg6, %25) : (memref<?x?xf32>, index) -> index loc("<stdin>":8:11)
    %28 = "memref.dim"(%arg6, %26) : (memref<?x?xf32>, index) -> index loc("<stdin>":9:11)
    "scf.for"(%25, %27, %26) ({
    ^bb0(%arg7: index loc("<stdin>":11:10)):
      "scf.for"(%25, %28, %26) ({
      ^bb0(%arg8: index loc("<stdin>":13:12)):
        %29 = "arith.addi"(%arg7, %26) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":14:15)
        %30 = "arith.index_cast"(%29) : (index) -> i32 loc("<stdin>":15:15)
        %31 = "arith.sitofp"(%30) : (i32) -> f32 loc("<stdin>":16:15)
        "memref.store"(%31, %arg6, %arg7, %arg8) : (f32, memref<?x?xf32>, index, index) -> () loc("<stdin>":17:9)
        "scf.yield"() : () -> () loc("<stdin>":18:9)
      }) : (index, index, index) -> () loc("<stdin>":12:7)
      "scf.yield"() : () -> () loc("<stdin>":20:7)
    }) : (index, index, index) -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (index, index) -> (), sym_name = "testTransposedReadWithMask"}> ({
  ^bb0(%arg4: index loc("<stdin>":25:8), %arg5: index loc("<stdin>":25:22)):
    %15 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x16xf32> loc("<stdin>":26:11)
    %16 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x4xf32> loc("<stdin>":27:11)
    %17 = "memref.cast"(%15) : (memref<4x16xf32>) -> memref<?x?xf32> loc("<stdin>":28:11)
    %18 = "memref.cast"(%16) : (memref<16x4xf32>) -> memref<?x?xf32> loc("<stdin>":29:11)
    "func.call"(%17) <{callee = @fill2DMemrefRows}> : (memref<?x?xf32>) -> () loc("<stdin>":30:5)
    %19 = "vector.create_mask"(%arg4, %arg5) : (index, index) -> vector<[4]x[16]xi1> loc("<stdin>":31:11)
    %20 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":32:11)
    %21 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":33:11)
    %22 = "vector.transfer_read"(%17, %21, %21, %20, %19) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 1>, permutation_map = affine_map<(d0, d1) -> (d1, d0)>}> : (memref<?x?xf32>, index, index, f32, vector<[4]x[16]xi1>) -> vector<[16]x[4]xf32> loc("<stdin>":34:11)
    "vector.transfer_write"(%22, %18, %21, %21) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<[16]x[4]xf32>, memref<?x?xf32>, index, index) -> () loc("<stdin>":35:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Input memref:\0A"}> : () -> () loc("<stdin>":36:5)
    %23 = "memref.cast"(%17) : (memref<?x?xf32>) -> memref<*xf32> loc("<stdin>":37:11)
    "func.call"(%23) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":38:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Masked transposed result:\0A"}> : () -> () loc("<stdin>":39:5)
    %24 = "memref.cast"(%18) : (memref<?x?xf32>) -> memref<*xf32> loc("<stdin>":40:11)
    "func.call"(%24) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":41:5)
    "func.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":24:3)
  "func.func"() <{function_type = (index, index) -> (), sym_name = "testTransposedWriteWithMask"}> ({
  ^bb0(%arg0: index loc("<stdin>":45:8), %arg1: index loc("<stdin>":45:22)):
    %5 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<16x4xf32> loc("<stdin>":46:10)
    %6 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x16xf32> loc("<stdin>":47:10)
    %7 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":48:10)
    "linalg.fill"(%7, %6) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":50:10), %arg3: f32 loc("<stdin>":50:22)):
      "linalg.yield"(%arg2) : (f32) -> () loc("<stdin>":51:7)
    }) : (f32, memref<4x16xf32>) -> () loc("<stdin>":49:5)
    %8 = "memref.cast"(%5) : (memref<16x4xf32>) -> memref<?x?xf32> loc("<stdin>":53:10)
    %9 = "memref.cast"(%6) : (memref<4x16xf32>) -> memref<?x?xf32> loc("<stdin>":54:10)
    "func.call"(%8) <{callee = @fill2DMemrefRows}> : (memref<?x?xf32>) -> () loc("<stdin>":55:5)
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":56:11)
    %11 = "vector.transfer_read"(%8, %10, %10, %7) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<?x?xf32>, index, index, f32) -> vector<[16]x[4]xf32> loc("<stdin>":57:11)
    %12 = "vector.create_mask"(%arg0, %arg1) : (index, index) -> vector<[4]x[16]xi1> loc("<stdin>":58:11)
    "vector.transfer_write"(%11, %9, %10, %10, %12) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 1>, permutation_map = affine_map<(d0, d1) -> (d1, d0)>}> : (vector<[16]x[4]xf32>, memref<?x?xf32>, index, index, vector<[4]x[16]xi1>) -> () loc("<stdin>":59:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Input memref:\0A"}> : () -> () loc("<stdin>":60:5)
    %13 = "memref.cast"(%8) : (memref<?x?xf32>) -> memref<*xf32> loc("<stdin>":61:11)
    "func.call"(%13) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":62:5)
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Masked transposed result:\0A"}> : () -> () loc("<stdin>":63:5)
    %14 = "memref.cast"(%9) : (memref<?x?xf32>) -> memref<*xf32> loc("<stdin>":64:11)
    "func.call"(%14) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":65:5)
    "func.return"() : () -> () loc("<stdin>":66:5)
  }) : () -> () loc("<stdin>":44:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 128 : i32}> : () -> i32 loc("<stdin>":69:10)
    "func.call"(%0) <{callee = @setArmSVLBits}> : (i32) -> () loc("<stdin>":70:5)
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":71:10)
    %2 = "arith.constant"() <{value = 15 : index}> : () -> index loc("<stdin>":72:10)
    "func.call"(%1, %2) <{callee = @testTransposedReadWithMask}> : (index, index) -> () loc("<stdin>":73:5)
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index loc("<stdin>":74:10)
    %4 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":75:10)
    "func.call"(%3, %4) <{callee = @testTransposedWriteWithMask}> : (index, index) -> () loc("<stdin>":76:5)
    "func.return"() : () -> () loc("<stdin>":77:5)
  }) : () -> () loc("<stdin>":68:3)
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":79:3)
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmSVLBits", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":81:3)
}) : () -> () loc("<stdin>":3:1)
