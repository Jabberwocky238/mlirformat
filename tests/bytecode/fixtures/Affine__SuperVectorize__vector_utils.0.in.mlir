"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> f32, sym_name = "vector_add_2d"}> ({
  ^bb0(%arg7: index loc("<stdin>":11:8), %arg8: index loc("<stdin>":11:22)):
    %4 = "memref.alloc"(%arg7, %arg8) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":12:10)
    %5 = "memref.alloc"(%arg7, %arg8) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":13:10)
    %6 = "memref.alloc"(%arg7, %arg8) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32> loc("<stdin>":14:10)
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":15:10)
    %8 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":16:10)
    %9 = "arith.constant"() <{value = dense<1.000000e+00> : vector<8x256xf32>}> : () -> vector<8x256xf32> loc("<stdin>":17:10)
    %10 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1x3x7x8x8xf32>}> : () -> vector<1x3x7x8x8xf32> loc("<stdin>":18:11)
    %11 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1x3x7x4x4xf32>}> : () -> vector<1x3x7x4x4xf32> loc("<stdin>":19:11)
    %12 = "arith.constant"() <{value = dense<1.000000e+00> : vector<3x4x5x8xf32>}> : () -> vector<3x4x5x8xf32> loc("<stdin>":20:11)
    %13 = "arith.constant"() <{value = dense<1.000000e+00> : vector<3x4x4x8xf32>}> : () -> vector<3x4x4x8xf32> loc("<stdin>":21:11)
    %14 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1x2x10x32xf32>}> : () -> vector<1x2x10x32xf32> loc("<stdin>":22:11)
    %15 = "arith.constant"() <{value = 7 : index}> : () -> index loc("<stdin>":23:11)
    %16 = "arith.constant"() <{value = 42 : index}> : () -> index loc("<stdin>":24:11)
    %17 = "memref.load"(%6, %15, %16) : (memref<?x?xf32>, index, index) -> f32 loc("<stdin>":25:11)
    "func.return"(%17) : (f32) -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (memref<20x30xf32>, memref<20xf32>) -> (), sym_name = "double_loop_nest"}> ({
  ^bb0(%arg3: memref<20x30xf32> loc("<stdin>":29:8), %arg4: memref<20xf32> loc("<stdin>":29:34)):
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (20)>}> ({
    ^bb0(%arg5: index loc("<stdin>":31:10)):
      %2 = "affine.load"(%arg4, %arg5) <{map = affine_map<(d0) -> (d0)>}> : (memref<20xf32>, index) -> f32 loc("<stdin>":32:12)
      "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (30)>}> ({
      ^bb0(%arg6: index loc("<stdin>":34:12)):
        %3 = "affine.load"(%arg3, %arg5, %arg6) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<20x30xf32>, index, index) -> f32 loc("<stdin>":35:14)
        "affine.store"(%3, %arg3, %arg5, %arg6) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (f32, memref<20x30xf32>, index, index) -> () loc("<stdin>":36:9)
        "affine.yield"() : () -> () loc("<stdin>":37:9)
      }) : () -> () loc("<stdin>":33:7)
      "affine.store"(%2, %arg4, %arg5) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<20xf32>, index) -> () loc("<stdin>":39:7)
      "affine.yield"() : () -> () loc("<stdin>":40:7)
    }) : () -> () loc("<stdin>":30:5)
    "func.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (memref<82x97xf32>) -> (), sym_name = "transfer_rank_mismatch_no_crash"}> ({
  ^bb0(%arg0: memref<82x97xf32> loc("<stdin>":45:8)):
    %0 = "ub.poison"() <{value = #ub.poison}> : () -> f32 loc("<stdin>":46:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (82)>}> ({
    ^bb0(%arg1: index loc("<stdin>":48:10)):
      "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 128 : index, upperBoundMap = affine_map<() -> (97)>}> ({
      ^bb0(%arg2: index loc("<stdin>":50:12)):
        %1 = "vector.transfer_read"(%arg0, %arg1, %arg2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = affine_map<(d0, d1) -> (d1)>}> : (memref<82x97xf32>, index, index, f32) -> vector<128xf32> loc("<stdin>":51:14)
        "affine.yield"() : () -> () loc("<stdin>":52:9)
      }) : () -> () loc("<stdin>":49:7)
      "affine.yield"() : () -> () loc("<stdin>":54:7)
    }) : () -> () loc("<stdin>":47:5)
    "func.return"() : () -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":44:3)
}) : () -> () loc("<stdin>":9:1)
