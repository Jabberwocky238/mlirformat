#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
#map2 = affine_map<(d0, d1) -> (d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> memref<?x?xf32>, sym_name = "alloc_2d_filled_f32"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index
    %15 = "arith.constant"() <{value = 1 : index}> : () -> index
    %16 = "arith.constant"() <{value = 10 : index}> : () -> index
    %17 = "arith.constant"() <{value = 100 : index}> : () -> index
    %18 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    "scf.for"(%14, %arg0, %15) ({
    ^bb0(%arg2: index):
      "scf.for"(%14, %arg1, %15) ({
      ^bb0(%arg3: index):
        %19 = "arith.muli"(%arg3, %17) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %20 = "arith.addi"(%arg2, %19) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %21 = "arith.index_cast"(%20) : (index) -> i32
        %22 = "arith.sitofp"(%21) : (i32) -> f32
        "memref.store"(%22, %18, %arg2, %arg3) : (f32, memref<?x?xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"(%18) : (memref<?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 3 : index}> : () -> index
    %4 = "arith.constant"() <{value = 6 : index}> : () -> index
    %5 = "arith.constant"() <{value = -4.200000e+01 : f32}> : () -> f32
    %6 = "func.call"(%4, %4) <{callee = @alloc_2d_filled_f32}> : (index, index) -> memref<?x?xf32>
    %7 = "memref.cast"(%6) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%7) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %8 = "vector.transfer_read"(%6, %1, %1, %5) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<5x5xf32>
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xf32>) -> ()
    %9 = "vector.transfer_read"(%6, %1, %1, %5) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (memref<?x?xf32>, index, index, f32) -> vector<5x5xf32>
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xf32>) -> ()
    "vector.transfer_write"(%9, %6, %0, %0) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 1, 2, 0>, permutation_map = #map1}> : (vector<5x5xf32>, memref<?x?xf32>, index, index) -> ()
    %10 = "vector.transfer_read"(%6, %1, %1, %5) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<5x5xf32>
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xf32>) -> ()
    %11 = "vector.transfer_read"(%6, %2, %3, %5) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map}> : (memref<?x?xf32>, index, index, f32) -> vector<5x5xf32>
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xf32>) -> ()
    %12 = "vector.transfer_read"(%6, %2, %3, %5) <{in_bounds = [false, false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map1}> : (memref<?x?xf32>, index, index, f32) -> vector<5x5xf32>
    "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (vector<5x5xf32>) -> ()
    %13 = "vector.transfer_read"(%6, %2, %3, %5) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 2, 1, 0>, permutation_map = #map2}> : (memref<?x?xf32>, index, index, f32) -> vector<5xf32>
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<5xf32>) -> ()
    "memref.dealloc"(%6) : (memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

