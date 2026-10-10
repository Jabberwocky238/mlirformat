#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>) -> vector<32xf32>, sym_name = "testAllocRead"}> ({
  ^bb0(%arg16: memref<?xf32>):
    %36 = "arith.constant"() <{value = 0 : index}> : () -> index
    %37 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %38 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32>
    %39 = "memref.subview"(%38) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32>
    "memref.copy"(%arg16, %39) : (memref<?xf32>, memref<16xf32>) -> ()
    %40 = "vector.transfer_read"(%38, %36, %37) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<32xf32>, index, f32) -> vector<32xf32>
    "memref.dealloc"(%38) : (memref<32xf32>) -> ()
    "func.return"(%40) : (vector<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> vector<32xf32>, sym_name = "testAllocFillRead"}> ({
  ^bb0(%arg13: memref<?xf32>):
    %31 = "arith.constant"() <{value = 0 : index}> : () -> index
    %32 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %33 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32>
    "linalg.fill"(%32, %33) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32, %arg15: f32):
      "linalg.yield"(%arg14) : (f32) -> ()
    }) : (f32, memref<32xf32>) -> ()
    %34 = "memref.subview"(%33) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32>
    "memref.copy"(%arg13, %34) : (memref<?xf32>, memref<16xf32>) -> ()
    %35 = "vector.transfer_read"(%33, %31, %32) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<32xf32>, index, f32) -> vector<32xf32>
    "memref.dealloc"(%33) : (memref<32xf32>) -> ()
    "func.return"(%35) : (vector<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> vector<32xf32>, sym_name = "testViewRead"}> ({
  ^bb0(%arg12: memref<?xf32>):
    %25 = "arith.constant"() <{value = 0 : index}> : () -> index
    %26 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %27 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xi8>
    %28 = "memref.view"(%27, %25) : (memref<128xi8>, index) -> memref<32xf32>
    %29 = "memref.subview"(%28) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32>
    "memref.copy"(%arg12, %29) : (memref<?xf32>, memref<16xf32>) -> ()
    %30 = "vector.transfer_read"(%28, %25, %26) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<32xf32>, index, f32) -> vector<32xf32>
    "memref.dealloc"(%27) : (memref<128xi8>) -> ()
    "func.return"(%30) : (vector<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> vector<32xf32>, sym_name = "testViewFillRead"}> ({
  ^bb0(%arg9: memref<?xf32>):
    %19 = "arith.constant"() <{value = 0 : index}> : () -> index
    %20 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %21 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xi8>
    %22 = "memref.view"(%21, %19) : (memref<128xi8>, index) -> memref<32xf32>
    %23 = "memref.subview"(%22) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32>
    "linalg.fill"(%20, %22) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      "linalg.yield"(%arg10) : (f32) -> ()
    }) : (f32, memref<32xf32>) -> ()
    "memref.copy"(%arg9, %23) : (memref<?xf32>, memref<16xf32>) -> ()
    %24 = "vector.transfer_read"(%22, %19, %20) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<32xf32>, index, f32) -> vector<32xf32>
    "memref.dealloc"(%21) : (memref<128xi8>) -> ()
    "func.return"(%24) : (vector<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<32xf32>, memref<?xf32>) -> (), sym_name = "testAllocWrite"}> ({
  ^bb0(%arg7: vector<32xf32>, %arg8: memref<?xf32>):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index
    %16 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %17 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32>
    %18 = "memref.subview"(%17) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32>
    "vector.transfer_write"(%arg7, %17, %15) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<32xf32>, memref<32xf32>, index) -> ()
    "memref.copy"(%18, %arg8) : (memref<16xf32>, memref<?xf32>) -> ()
    "memref.dealloc"(%17) : (memref<32xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<32xf32>, memref<?xf32>) -> (), sym_name = "testViewWrite"}> ({
  ^bb0(%arg5: vector<32xf32>, %arg6: memref<?xf32>):
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index
    %11 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %12 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xi8>
    %13 = "memref.view"(%12, %10) : (memref<128xi8>, index) -> memref<32xf32>
    %14 = "memref.subview"(%13) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32>
    "vector.transfer_write"(%arg5, %13, %10) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<32xf32>, memref<32xf32>, index) -> ()
    "memref.copy"(%14, %arg6) : (memref<16xf32>, memref<?xf32>) -> ()
    "memref.dealloc"(%12) : (memref<128xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> vector<32xf32>, sym_name = "failAllocFillRead"}> ({
  ^bb0(%arg2: memref<?xf32>):
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %7 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32>
    "linalg.fill"(%5, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (f32, memref<32xf32>) -> ()
    %8 = "memref.subview"(%7) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32>
    "memref.copy"(%arg2, %8) : (memref<?xf32>, memref<16xf32>) -> ()
    "some_interleaved_use"(%8) : (memref<16xf32>) -> ()
    %9 = "vector.transfer_read"(%7, %4, %6) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<32xf32>, index, f32) -> vector<32xf32>
    "memref.dealloc"(%7) : (memref<32xf32>) -> ()
    "func.return"(%9) : (vector<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<32xf32>, memref<?xf32>) -> (), sym_name = "failAllocWrite"}> ({
  ^bb0(%arg0: vector<32xf32>, %arg1: memref<?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32>
    %3 = "memref.subview"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 16>, static_strides = array<i64: 1>}> : (memref<32xf32>) -> memref<16xf32>
    "vector.transfer_write"(%arg0, %2, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<32xf32>, memref<32xf32>, index) -> ()
    "some_interleaved_use"(%3) : (memref<16xf32>) -> ()
    "memref.copy"(%3, %arg1) : (memref<16xf32>, memref<?xf32>) -> ()
    "memref.dealloc"(%2) : (memref<32xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

