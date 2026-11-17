"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi64>, memref<?xi64>, index) -> (), sym_name = "streaming_kernel_copy"}> ({
  ^bb0(%arg1: memref<?xi64> loc("<stdin>":4:8), %arg2: memref<?xi64> loc("<stdin>":4:30), %arg3: index loc("<stdin>":4:52)):
    %11 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:11)
    %12 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":6:11)
    %13 = "vector.vscale"() : () -> index loc("<stdin>":7:11)
    %14 = "arith.muli"(%12, %13) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":8:11)
    "scf.for"(%11, %arg3, %14) ({
    ^bb0(%arg4: index loc("<stdin>":10:10)):
      %15 = "vector.load"(%arg1, %arg4) : (memref<?xi64>, index) -> vector<[2]xi64> loc("<stdin>":11:13)
      "vector.store"(%15, %arg2, %arg4) : (vector<[2]xi64>, memref<?xi64>, index) -> () loc("<stdin>":12:7)
      "scf.yield"() : () -> () loc("<stdin>":13:7)
    }) : (index, index, index) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) {arm_streaming} : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> i32, sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":18:10)
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":19:10)
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":20:10)
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":21:10)
    %4 = "arith.constant"() <{value = 32 : index}> : () -> index loc("<stdin>":22:10)
    %5 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xi64> loc("<stdin>":23:10)
    %6 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xi64> loc("<stdin>":24:10)
    %7 = "arith.constant"() <{value = dense<[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32]> : vector<32xi64>}> : () -> vector<32xi64> loc("<stdin>":25:10)
    "vector.transfer_write"(%7, %5, %2) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (vector<32xi64>, memref<32xi64>, index) -> () loc("<stdin>":26:5)
    %8 = "memref.cast"(%5) : (memref<32xi64>) -> memref<?xi64> loc("<stdin>":27:10)
    %9 = "memref.cast"(%6) : (memref<32xi64>) -> memref<?xi64> loc("<stdin>":28:10)
    "func.call"(%8, %9, %4) <{callee = @streaming_kernel_copy}> : (memref<?xi64>, memref<?xi64>, index) -> () loc("<stdin>":29:5)
    "scf.for"(%2, %4, %3) ({
    ^bb0(%arg0: index loc("<stdin>":31:10)):
      %10 = "vector.transfer_read"(%6, %arg0, %0) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<32xi64>, index, i64) -> vector<4xi64> loc("<stdin>":32:13)
      "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<4xi64>) -> () loc("<stdin>":33:7)
      "scf.yield"() : () -> () loc("<stdin>":34:7)
    }) : (index, index, index) -> () loc("<stdin>":30:5)
    "memref.dealloc"(%5) : (memref<32xi64>) -> () loc("<stdin>":36:5)
    "memref.dealloc"(%6) : (memref<32xi64>) -> () loc("<stdin>":37:5)
    "func.return"(%1) : (i32) -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":2:1)
