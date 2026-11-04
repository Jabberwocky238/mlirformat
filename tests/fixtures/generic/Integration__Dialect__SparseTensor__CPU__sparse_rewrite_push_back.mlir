#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %6 = "memref.alloc"(%1) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xindex>
    %7 = "memref.alloc"(%1) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    "memref.store"(%0, %6, %0) : (index, memref<?xindex>, index) -> ()
    %8:2 = "sparse_tensor.push_back"(%0, %7, %5) : (index, memref<?xf32>, f32) -> (memref<?xf32>, index)
    %9:2 = "sparse_tensor.push_back"(%8#1, %8#0, %4, %2) : (index, memref<?xf32>, f32, index) -> (memref<?xf32>, index)
    %10 = "memref.dim"(%9#0, %0) : (memref<?xf32>, index) -> index
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    "vector.print"(%9#1) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
    %11 = "vector.transfer_read"(%9#0, %0, %3) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<?xf32>, index, f32) -> vector<11xf32>
    "vector.print"(%11) <{punctuation = #vector.punctuation<newline>}> : (vector<11xf32>) -> ()
    "memref.dealloc"(%6) : (memref<?xindex>) -> ()
    "memref.dealloc"(%9#0) : (memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

