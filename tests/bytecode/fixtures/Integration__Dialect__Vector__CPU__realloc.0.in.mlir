"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8xf32> loc("<stdin>":7:10)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index loc("<stdin>":9:10)):
      %18 = "arith.index_cast"(%arg2) : (index) -> i32 loc("<stdin>":10:13)
      %19 = "arith.sitofp"(%18) : (i32) -> f32 loc("<stdin>":11:13)
      "memref.store"(%19, %3, %arg2) : (f32, memref<8xf32>, index) -> () loc("<stdin>":12:7)
      "scf.yield"() : () -> () loc("<stdin>":13:7)
    }) : (index, index, index) -> () loc("<stdin>":8:5)
    %4 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32 loc("<stdin>":15:10)
    %5 = "vector.transfer_read"(%3, %0, %4) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<8xf32>, index, f32) -> vector<8xf32> loc("<stdin>":16:10)
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> () loc("<stdin>":17:5)
    %6 = "memref.realloc"(%3) : (memref<8xf32>) -> memref<10xf32> loc("<stdin>":18:10)
    %7 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":19:10)
    "scf.for"(%2, %7, %1) ({
    ^bb0(%arg1: index loc("<stdin>":21:10)):
      %16 = "arith.index_cast"(%arg1) : (index) -> i32 loc("<stdin>":22:13)
      %17 = "arith.sitofp"(%16) : (i32) -> f32 loc("<stdin>":23:13)
      "memref.store"(%17, %6, %arg1) : (f32, memref<10xf32>, index) -> () loc("<stdin>":24:7)
      "scf.yield"() : () -> () loc("<stdin>":25:7)
    }) : (index, index, index) -> () loc("<stdin>":20:5)
    %8 = "vector.transfer_read"(%6, %0, %4) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<10xf32>, index, f32) -> vector<10xf32> loc("<stdin>":27:10)
    "vector.print"(%8) <{punctuation = #vector.punctuation<newline>}> : (vector<10xf32>) -> () loc("<stdin>":28:5)
    %9 = "memref.cast"(%6) : (memref<10xf32>) -> memref<?xf32> loc("<stdin>":29:10)
    %10 = "arith.constant"() <{value = 13 : index}> : () -> index loc("<stdin>":30:11)
    %11 = "memref.realloc"(%9, %10) : (memref<?xf32>, index) -> memref<?xf32> loc("<stdin>":31:11)
    %12 = "memref.cast"(%11) : (memref<?xf32>) -> memref<13xf32> loc("<stdin>":32:11)
    "scf.for"(%7, %10, %1) ({
    ^bb0(%arg0: index loc("<stdin>":34:10)):
      %14 = "arith.index_cast"(%arg0) : (index) -> i32 loc("<stdin>":35:13)
      %15 = "arith.sitofp"(%14) : (i32) -> f32 loc("<stdin>":36:13)
      "memref.store"(%15, %12, %arg0) : (f32, memref<13xf32>, index) -> () loc("<stdin>":37:7)
      "scf.yield"() : () -> () loc("<stdin>":38:7)
    }) : (index, index, index) -> () loc("<stdin>":33:5)
    %13 = "vector.transfer_read"(%12, %0, %4) <{in_bounds = [false], operandSegmentSizes = array<i32: 1, 1, 1, 0>, permutation_map = affine_map<(d0) -> (d0)>}> : (memref<13xf32>, index, f32) -> vector<13xf32> loc("<stdin>":40:11)
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<13xf32>) -> () loc("<stdin>":41:5)
    "memref.dealloc"(%12) : (memref<13xf32>) -> () loc("<stdin>":42:5)
    "func.return"() : () -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
