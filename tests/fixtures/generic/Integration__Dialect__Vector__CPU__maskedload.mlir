"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>, sym_name = "maskedload16"}> ({
  ^bb0(%arg4: memref<?xf32>, %arg5: vector<16xi1>, %arg6: vector<16xf32>):
    %24 = "arith.constant"() <{value = 0 : index}> : () -> index
    %25 = "vector.maskedload"(%arg4, %24, %arg5, %arg6) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%25) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>, sym_name = "maskedload16_at8"}> ({
  ^bb0(%arg1: memref<?xf32>, %arg2: vector<16xi1>, %arg3: vector<16xf32>):
    %22 = "arith.constant"() <{value = 8 : index}> : () -> index
    %23 = "vector.maskedload"(%arg1, %22, %arg2, %arg3) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%23) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "memref.alloc"(%2) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      %20 = "arith.index_cast"(%arg0) : (index) -> i32
      %21 = "arith.sitofp"(%20) : (i32) -> f32
      "memref.store"(%21, %3, %arg0) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %4 = "arith.constant"() <{value = -7.000000e+00 : f32}> : () -> f32
    %5 = "vector.broadcast"(%4) : (f32) -> vector<16xf32>
    %6 = "arith.constant"() <{value = false}> : () -> i1
    %7 = "arith.constant"() <{value = true}> : () -> i1
    %8 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1>
    %9 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1>
    %10 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 8>}> : () -> vector<16xi1>
    %11 = "vector.insert"(%6, %10) <{static_position = array<i64: 0>}> : (i1, vector<16xi1>) -> vector<16xi1>
    %12 = "vector.insert"(%7, %11) <{static_position = array<i64: 13>}> : (i1, vector<16xi1>) -> vector<16xi1>
    %13 = "vector.insert"(%7, %12) <{static_position = array<i64: 14>}> : (i1, vector<16xi1>) -> vector<16xi1>
    %14 = "vector.insert"(%7, %13) <{static_position = array<i64: 14>}> : (i1, vector<16xi1>) -> vector<16xi1>
    %15 = "func.call"(%3, %8, %5) <{callee = @maskedload16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    %16 = "func.call"(%3, %9, %5) <{callee = @maskedload16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    %17 = "func.call"(%3, %10, %5) <{callee = @maskedload16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    %18 = "func.call"(%3, %14, %5) <{callee = @maskedload16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    %19 = "func.call"(%3, %10, %5) <{callee = @maskedload16_at8}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    "memref.dealloc"(%3) : (memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

