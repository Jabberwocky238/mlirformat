#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index):
      %18 = "arith.index_cast"(%arg2) : (index) -> i32
      %19 = "arith.sitofp"(%18) : (i32) -> f32
      "memref.store"(%19, %3, %arg2) : (f32, memref<8xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %4 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
    %5 = "vector.transfer_read"(%3, %0, %4) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<8xf32>, index, f32) -> vector<8xf32>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    %6 = "memref.realloc"(%3) : (memref<8xf32>) -> memref<10xf32>
    %7 = "arith.constant"() <{value = 10 : index}> : () -> index
    "scf.for"(%2, %7, %1) ({
    ^bb0(%arg1: index):
      %16 = "arith.index_cast"(%arg1) : (index) -> i32
      %17 = "arith.sitofp"(%16) : (i32) -> f32
      "memref.store"(%17, %6, %arg1) : (f32, memref<10xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %8 = "vector.transfer_read"(%6, %0, %4) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<10xf32>, index, f32) -> vector<10xf32>
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<10xf32>) -> ()
    %9 = "memref.cast"(%6) : (memref<10xf32>) -> memref<?xf32>
    %10 = "arith.constant"() <{value = 13 : index}> : () -> index
    %11 = "memref.realloc"(%9, %10) : (memref<?xf32>, index) -> memref<?xf32>
    %12 = "memref.cast"(%11) : (memref<?xf32>) -> memref<13xf32>
    "scf.for"(%7, %10, %1) ({
    ^bb0(%arg0: index):
      %14 = "arith.index_cast"(%arg0) : (index) -> i32
      %15 = "arith.sitofp"(%14) : (i32) -> f32
      "memref.store"(%15, %12, %arg0) : (f32, memref<13xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %13 = "vector.transfer_read"(%12, %0, %4) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<13xf32>, index, f32) -> vector<13xf32>
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<13xf32>) -> ()
    "memref.dealloc"(%12) : (memref<13xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

