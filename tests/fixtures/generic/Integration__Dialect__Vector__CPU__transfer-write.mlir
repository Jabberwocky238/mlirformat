#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "transfer_write16_inbounds_1d"}> ({
  ^bb0(%arg10: memref<?xf32>, %arg11: index):
    %48 = "arith.constant"() <{value = 1.600000e+01 : f32}> : () -> f32
    %49 = "vector.broadcast"(%48) : (f32) -> vector<16xf32>
    "vector.transfer_write"(%49, %arg10, %arg11) <{in_bounds = [true], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<16xf32>, memref<?xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "transfer_write13_1d"}> ({
  ^bb0(%arg8: memref<?xf32>, %arg9: index):
    %46 = "arith.constant"() <{value = 1.300000e+01 : f32}> : () -> f32
    %47 = "vector.broadcast"(%46) : (f32) -> vector<13xf32>
    "vector.transfer_write"(%47, %arg8, %arg9) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<13xf32>, memref<?xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, index) -> (), sym_name = "transfer_write17_1d"}> ({
  ^bb0(%arg6: memref<?xf32>, %arg7: index):
    %44 = "arith.constant"() <{value = 1.700000e+01 : f32}> : () -> f32
    %45 = "vector.broadcast"(%44) : (f32) -> vector<17xf32>
    "vector.transfer_write"(%45, %arg6, %arg7) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<17xf32>, memref<?xf32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> vector<32xf32>, sym_name = "transfer_read_1d"}> ({
  ^bb0(%arg5: memref<?xf32>):
    %41 = "arith.constant"() <{value = 0 : index}> : () -> index
    %42 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %43 = "vector.transfer_read"(%arg5, %41, %42) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf32>, index, f32) -> vector<32xf32>
    "func.return"(%43) : (vector<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x4x4xf32>) -> (), sym_name = "transfer_write_inbounds_3d"}> ({
  ^bb0(%arg4: memref<4x4x4xf32>):
    %22 = "arith.constant"() <{value = 0 : index}> : () -> index
    %23 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %24 = "vector.broadcast"(%23) : (f32) -> vector<2x3x4xf32>
    %25 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %26 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %27 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %28 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %29 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %30 = "arith.constant"() <{value = 6.000000e+00 : f32}> : () -> f32
    %31 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %32 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %33 = "vector.insert"(%25, %24) <{static_position = array<i64: 0, 0, 0>}> : (f32, vector<2x3x4xf32>) -> vector<2x3x4xf32>
    %34 = "vector.insert"(%26, %33) <{static_position = array<i64: 0, 0, 3>}> : (f32, vector<2x3x4xf32>) -> vector<2x3x4xf32>
    %35 = "vector.insert"(%27, %34) <{static_position = array<i64: 0, 2, 0>}> : (f32, vector<2x3x4xf32>) -> vector<2x3x4xf32>
    %36 = "vector.insert"(%28, %35) <{static_position = array<i64: 0, 2, 3>}> : (f32, vector<2x3x4xf32>) -> vector<2x3x4xf32>
    %37 = "vector.insert"(%29, %36) <{static_position = array<i64: 1, 0, 0>}> : (f32, vector<2x3x4xf32>) -> vector<2x3x4xf32>
    %38 = "vector.insert"(%30, %37) <{static_position = array<i64: 1, 0, 3>}> : (f32, vector<2x3x4xf32>) -> vector<2x3x4xf32>
    %39 = "vector.insert"(%31, %38) <{static_position = array<i64: 1, 2, 0>}> : (f32, vector<2x3x4xf32>) -> vector<2x3x4xf32>
    %40 = "vector.insert"(%32, %39) <{static_position = array<i64: 1, 2, 3>}> : (f32, vector<2x3x4xf32>) -> vector<2x3x4xf32>
    "vector.transfer_write"(%40, %arg4, %22, %22, %22) <{in_bounds = [true, true, true], operandSegmentSizes = array<i32: 1, 1, 3, 0>, permutation_map = #map1}> : (vector<2x3x4xf32>, memref<4x4x4xf32>, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 32 : index}> : () -> index
    %3 = "memref.alloc"(%2) <{alignment = 64 : i64, operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg3: index):
      %21 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      "memref.store"(%21, %3, %arg3) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %4 = "func.call"(%3) <{callee = @transfer_read_1d}> : (memref<?xf32>) -> vector<32xf32>
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (vector<32xf32>) -> ()
    %5 = "arith.constant"() <{value = 3 : index}> : () -> index
    "func.call"(%3, %5) <{callee = @transfer_write16_inbounds_1d}> : (memref<?xf32>, index) -> ()
    %6 = "func.call"(%3) <{callee = @transfer_read_1d}> : (memref<?xf32>) -> vector<32xf32>
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<32xf32>) -> ()
    "func.call"(%3, %5) <{callee = @transfer_write13_1d}> : (memref<?xf32>, index) -> ()
    %7 = "func.call"(%3) <{callee = @transfer_read_1d}> : (memref<?xf32>) -> vector<32xf32>
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<32xf32>) -> ()
    %8 = "arith.constant"() <{value = 7 : index}> : () -> index
    "func.call"(%3, %5) <{callee = @transfer_write17_1d}> : (memref<?xf32>, index) -> ()
    %9 = "func.call"(%3) <{callee = @transfer_read_1d}> : (memref<?xf32>) -> vector<32xf32>
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (vector<32xf32>) -> ()
    %10 = "arith.constant"() <{value = 8 : index}> : () -> index
    "func.call"(%3, %10) <{callee = @transfer_write13_1d}> : (memref<?xf32>, index) -> ()
    %11 = "func.call"(%3) <{callee = @transfer_read_1d}> : (memref<?xf32>) -> vector<32xf32>
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<32xf32>) -> ()
    %12 = "arith.constant"() <{value = 14 : index}> : () -> index
    "func.call"(%3, %12) <{callee = @transfer_write17_1d}> : (memref<?xf32>, index) -> ()
    %13 = "func.call"(%3) <{callee = @transfer_read_1d}> : (memref<?xf32>) -> vector<32xf32>
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<32xf32>) -> ()
    %14 = "arith.constant"() <{value = 19 : index}> : () -> index
    "func.call"(%3, %14) <{callee = @transfer_write13_1d}> : (memref<?xf32>, index) -> ()
    %15 = "func.call"(%3) <{callee = @transfer_read_1d}> : (memref<?xf32>) -> vector<32xf32>
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<32xf32>) -> ()
    "memref.dealloc"(%3) : (memref<?xf32>) -> ()
    %16 = "arith.constant"() <{value = 4 : index}> : () -> index
    %17 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x4x4xf32>
    "scf.for"(%0, %16, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%0, %16, %1) ({
      ^bb0(%arg1: index):
        "scf.for"(%0, %16, %1) ({
        ^bb0(%arg2: index):
          %20 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
          "memref.store"(%20, %17, %arg0, %arg1, %arg2) : (f32, memref<4x4x4xf32>, index, index, index) -> ()
          "scf.yield"() : () -> ()
        }) : (index, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.call"(%17) <{callee = @transfer_write_inbounds_3d}> : (memref<4x4x4xf32>) -> ()
    %18 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %19 = "vector.transfer_read"(%17, %0, %0, %0, %18) <{in_bounds = [false, false, false], operandSegmentSizes = array<i32: 1, 3, 1, 0>, permutation_map = #map2}> : (memref<4x4x4xf32>, index, index, index, f32) -> vector<4x4x4xf32>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<4x4x4xf32>) -> ()
    "memref.dealloc"(%17) : (memref<4x4x4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

