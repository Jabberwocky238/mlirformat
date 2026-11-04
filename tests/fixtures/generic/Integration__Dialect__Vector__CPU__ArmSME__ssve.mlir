#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi64>, memref<?xi64>, index) -> (), sym_name = "streaming_kernel_copy"}> ({
  ^bb0(%arg1: memref<?xi64>, %arg2: memref<?xi64>, %arg3: index):
    %11 = "arith.constant"() <{value = 0 : index}> : () -> index
    %12 = "arith.constant"() <{value = 2 : index}> : () -> index
    %13 = "vector.vscale"() : () -> index
    %14 = "arith.muli"(%12, %13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    "scf.for"(%11, %arg3, %14) ({
    ^bb0(%arg4: index):
      %15 = "vector.load"(%arg1, %arg4) : (memref<?xi64>, index) -> vector<[2]xi64>
      "vector.store"(%15, %arg2, %arg4) : (vector<[2]xi64>, memref<?xi64>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) {arm_streaming} : () -> ()
  "func.func"() <{function_type = () -> i32, sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : i64}> : () -> i64
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "arith.constant"() <{value = 32 : index}> : () -> index
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xi64>
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xi64>
    %7 = "arith.constant"() <{value = dense<[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32]> : vector<32xi64>}> : () -> vector<32xi64>
    "vector.transfer_write"(%7, %5, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (vector<32xi64>, memref<32xi64>, index) -> ()
    %8 = "memref.cast"(%5) : (memref<32xi64>) -> memref<?xi64>
    %9 = "memref.cast"(%6) : (memref<32xi64>) -> memref<?xi64>
    "func.call"(%8, %9, %4) <{callee = @streaming_kernel_copy}> : (memref<?xi64>, memref<?xi64>, index) -> ()
    "scf.for"(%2, %4, %3) ({
    ^bb0(%arg0: index):
      %10 = "vector.transfer_read"(%6, %arg0, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = #map}> : (memref<32xi64>, index, i64) -> vector<4xi64>
      "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi64>) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "memref.dealloc"(%5) : (memref<32xi64>) -> ()
    "memref.dealloc"(%6) : (memref<32xi64>) -> ()
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

