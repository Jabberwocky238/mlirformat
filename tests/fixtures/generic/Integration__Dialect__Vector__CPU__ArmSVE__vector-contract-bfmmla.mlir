#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0) -> (d0)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4x4xf32>) -> memref<4x?xf32>, sym_name = "prepareAccTestData", sym_visibility = "private"}> ({
  ^bb0(%arg3: vector<4x4xf32>):
    %29 = "arith.constant"() <{value = 0 : index}> : () -> index
    %30 = "arith.constant"() <{value = 1 : index}> : () -> index
    %31 = "arith.constant"() <{value = 4 : index}> : () -> index
    %32 = "vector.vscale"() : () -> index
    %33 = "arith.muli"(%31, %32) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %34 = "memref.alloc"(%33) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<4x?xf32>
    "scf.for"(%29, %33, %31) ({
    ^bb0(%arg4: index):
      "vector.transfer_write"(%arg3, %34, %29, %arg4) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xf32>, memref<4x?xf32>, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"(%34) : (memref<4x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xbf16>) -> memref<4x4xbf16>, sym_name = "prepareLHSTestData", sym_visibility = "private"}> ({
  ^bb0(%arg2: vector<4x4xbf16>):
    %27 = "arith.constant"() <{value = 0 : index}> : () -> index
    %28 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x4xbf16>
    "vector.transfer_write"(%arg2, %28, %27, %27) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xbf16>, memref<4x4xbf16>, index, index) -> ()
    "func.return"(%28) : (memref<4x4xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4x4xbf16>) -> memref<?xbf16>, sym_name = "prepareRHSTestData", sym_visibility = "private"}> ({
  ^bb0(%arg0: vector<4x4xbf16>):
    %20 = "arith.constant"() <{value = 0 : index}> : () -> index
    %21 = "arith.constant"() <{value = 1 : index}> : () -> index
    %22 = "arith.constant"() <{value = 4 : index}> : () -> index
    %23 = "vector.vscale"() : () -> index
    %24 = "arith.muli"(%22, %23) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %25 = "memref.alloc"(%24) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?x4xbf16>
    "scf.for"(%20, %24, %22) ({
    ^bb0(%arg1: index):
      "vector.transfer_write"(%arg0, %25, %arg1, %20) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map}> : (vector<4x4xbf16>, memref<?x4xbf16>, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %26 = "memref.collapse_shape"(%25) <{reassociation = [[0, 1]]}> : (memref<?x4xbf16>) -> memref<?xbf16>
    "func.return"(%26) : (memref<?xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_bfmmla"}> ({
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 0.000000e+00 : bf16}> : () -> bf16
    %5 = "arith.constant"() <{value = dense<[[0.699999988, 1.000000e+00, -1.000000e-01, 1.800000e+00], [-5.000000e-01, 0.899999976, 0.699999988, -0.699999988], [5.000000e-01, -1.300000e+00, -2.200000e+00, 1.000000e-01], [-0.699999988, 1.000000e+00, 1.700000e+00, -1.000000e+00]]> : vector<4x4xf32>}> : () -> vector<4x4xf32>
    %6 = "func.call"(%5) <{callee = @prepareAccTestData}> : (vector<4x4xf32>) -> memref<4x?xf32>
    %7 = "vector.transfer_read"(%6, %2, %2, %3) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x?xf32>, index, index, f32) -> vector<4x[4]xf32>
    %8 = "arith.constant"() <{value = dense<[[1.000980e-01, 6.992180e-01, -8.984370e-01, 1.296880e+00], [-1.601560e+00, 6.992180e-01, -3.007810e-01, -3.007810e-01], [-4.003910e-01, 6.015630e-01, 8.007810e-01, -5.000000e-01], [-6.015630e-01, -1.000000e+00, -1.000000e+00, -1.000000e+00]]> : vector<4x4xbf16>}> : () -> vector<4x4xbf16>
    %9 = "func.call"(%8) <{callee = @prepareLHSTestData}> : (vector<4x4xbf16>) -> memref<4x4xbf16>
    %10 = "vector.transfer_read"(%9, %2, %2, %4) <{in_bounds = [true, true], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<4x4xbf16>, index, index, bf16) -> vector<4x4xbf16>
    %11 = "arith.constant"() <{value = dense<[[6.015630e-01, 1.296880e+00, 1.000980e-01, -8.984370e-01], [5.000000e-01, 1.601560e+00, 1.796880e+00, 1.601560e+00], [-2.001950e-01, 4.003910e-01, 1.000000e+00, 4.003910e-01], [-1.296880e+00, -2.001950e-01, -2.203130e+00, 3.007810e-01]]> : vector<4x4xbf16>}> : () -> vector<4x4xbf16>
    %12 = "func.call"(%11) <{callee = @prepareRHSTestData}> : (vector<4x4xbf16>) -> memref<?xbf16>
    %13 = "vector.transfer_read"(%12, %2, %4) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map1}> : (memref<?xbf16>, index, bf16) -> vector<[16]xbf16>
    %14 = "vector.shape_cast"(%13) : (vector<[16]xbf16>) -> vector<[4]x4xbf16>
    %15 = "vector.contract"(%10, %14, %7) <{fastmath = #arith.fastmath<none>, indexing_maps = [#map2, #map3, #map4], iterator_types = [#vector.iterator_type<parallel>, #vector.iterator_type<parallel>, #vector.iterator_type<reduction>], kind = #vector.kind<add>}> : (vector<4x4xbf16>, vector<[4]x4xbf16>, vector<4x[4]xf32>) -> vector<4x[4]xf32>
    "vector.print"() <{punctuation = #vector.punctuation<newline>, stringLiteral = "Result(BFMMLA):\0A"}> : () -> ()
    %16 = "vector.extract"(%15) <{static_position = array<i64: 0>}> : (vector<4x[4]xf32>) -> vector<[4]xf32>
    %17 = "vector.extract"(%15) <{static_position = array<i64: 1>}> : (vector<4x[4]xf32>) -> vector<[4]xf32>
    %18 = "vector.extract"(%15) <{static_position = array<i64: 2>}> : (vector<4x[4]xf32>) -> vector<[4]xf32>
    %19 = "vector.extract"(%15) <{static_position = array<i64: 3>}> : (vector<4x[4]xf32>) -> vector<[4]xf32>
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xf32>) -> ()
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xf32>) -> ()
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xf32>) -> ()
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]xf32>) -> ()
    "memref.dealloc"(%6) : (memref<4x?xf32>) -> ()
    "memref.dealloc"(%9) : (memref<4x4xbf16>) -> ()
    "memref.dealloc"(%12) : (memref<?xbf16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 128 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 256 : i32}> : () -> i32
    "func.call"(%0) <{callee = @setArmVLBits}> : (i32) -> ()
    "func.call"() <{callee = @test_bfmmla}> : () -> ()
    "func.call"(%1) <{callee = @setArmVLBits}> : (i32) -> ()
    "func.call"() <{callee = @test_bfmmla}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmVLBits", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

