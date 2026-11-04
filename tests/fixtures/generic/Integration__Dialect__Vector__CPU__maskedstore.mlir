"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> (), sym_name = "maskedstore16"}> ({
  ^bb0(%arg9: memref<?xf32>, %arg10: vector<16xi1>, %arg11: vector<16xf32>):
    %24 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.maskedstore"(%arg9, %24, %arg10, %arg11) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> (), sym_name = "maskedstore16_at8"}> ({
  ^bb0(%arg6: memref<?xf32>, %arg7: vector<16xi1>, %arg8: vector<16xf32>):
    %23 = "arith.constant"() <{value = 8 : index}> : () -> index
    "vector.maskedstore"(%arg6, %23, %arg7, %arg8) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "printmem16"}> ({
  ^bb0(%arg3: memref<?xf32>):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index
    %16 = "arith.constant"() <{value = 1 : index}> : () -> index
    %17 = "arith.constant"() <{value = 16 : index}> : () -> index
    %18 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %19 = "vector.broadcast"(%18) : (f32) -> vector<16xf32>
    %20 = "scf.for"(%15, %17, %16, %19) ({
    ^bb0(%arg4: index, %arg5: vector<16xf32>):
      %21 = "memref.load"(%arg3, %arg4) : (memref<?xf32>, index) -> f32
      %22 = "vector.insert"(%21, %arg5, %arg4) <{static_position = array<i64: -9223372036854775808>}> : (f32, vector<16xf32>, index) -> vector<16xf32>
      "scf.yield"(%22) : (vector<16xf32>) -> ()
    }) : (index, index, index, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 16 : index}> : () -> index
    %4 = "memref.alloc"(%3) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    "scf.for"(%1, %3, %2) ({
    ^bb0(%arg2: index):
      "memref.store"(%0, %4, %arg2) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %5 = "vector.broadcast"(%0) : (f32) -> vector<16xf32>
    %6 = "scf.for"(%1, %3, %2, %5) ({
    ^bb0(%arg0: index, %arg1: vector<16xf32>):
      %12 = "arith.index_cast"(%arg0) : (index) -> i32
      %13 = "arith.sitofp"(%12) : (i32) -> f32
      %14 = "vector.insert"(%13, %arg1, %arg0) <{static_position = array<i64: -9223372036854775808>}> : (f32, vector<16xf32>, index) -> vector<16xf32>
      "scf.yield"(%14) : (vector<16xf32>) -> ()
    }) : (index, index, index, vector<16xf32>) -> vector<16xf32>
    %7 = "arith.constant"() <{value = true}> : () -> i1
    %8 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1>
    %9 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 8>}> : () -> vector<16xi1>
    %10 = "vector.insert"(%7, %9) <{static_position = array<i64: 13>}> : (i1, vector<16xi1>) -> vector<16xi1>
    %11 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1>
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    "func.call"(%4) <{callee = @printmem16}> : (memref<?xf32>) -> ()
    "func.call"(%4, %8, %6) <{callee = @maskedstore16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    "func.call"(%4) <{callee = @printmem16}> : (memref<?xf32>) -> ()
    "func.call"(%4, %9, %6) <{callee = @maskedstore16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    "func.call"(%4) <{callee = @printmem16}> : (memref<?xf32>) -> ()
    "func.call"(%4, %10, %6) <{callee = @maskedstore16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    "func.call"(%4) <{callee = @printmem16}> : (memref<?xf32>) -> ()
    "func.call"(%4, %11, %6) <{callee = @maskedstore16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    "func.call"(%4) <{callee = @printmem16}> : (memref<?xf32>) -> ()
    "func.call"(%4, %9, %6) <{callee = @maskedstore16_at8}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    "func.call"(%4) <{callee = @printmem16}> : (memref<?xf32>) -> ()
    "memref.dealloc"(%4) : (memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

