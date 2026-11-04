"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> (), sym_name = "compress16"}> ({
  ^bb0(%arg8: memref<?xf32>, %arg9: vector<16xi1>, %arg10: vector<16xf32>):
    %30 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.compressstore"(%arg8, %30, %arg9, %arg10) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> (), sym_name = "compress16_at8"}> ({
  ^bb0(%arg5: memref<?xf32>, %arg6: vector<16xi1>, %arg7: vector<16xf32>):
    %29 = "arith.constant"() <{value = 8 : index}> : () -> index
    "vector.compressstore"(%arg5, %29, %arg6, %arg7) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "printmem16"}> ({
  ^bb0(%arg2: memref<?xf32>):
    %21 = "arith.constant"() <{value = 0 : index}> : () -> index
    %22 = "arith.constant"() <{value = 1 : index}> : () -> index
    %23 = "arith.constant"() <{value = 16 : index}> : () -> index
    %24 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %25 = "vector.broadcast"(%24) : (f32) -> vector<16xf32>
    %26 = "scf.for"(%21, %23, %22, %25) ({
    ^bb0(%arg3: index, %arg4: vector<16xf32>):
      %27 = "memref.load"(%arg2, %arg3) : (memref<?xf32>, index) -> f32
      %28 = "vector.insert"(%27, %arg4, %arg3) <{static_position = array<i64: -9223372036854775808>}> : (f32, vector<16xf32>, index) -> vector<16xf32>
      "scf.yield"(%28) : (vector<16xf32>) -> ()
    }) : (index, index, index, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "memref.alloc"(%2) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %5 = "vector.broadcast"(%4) : (f32) -> vector<16xf32>
    %6 = "scf.for"(%0, %2, %1, %5) ({
    ^bb0(%arg0: index, %arg1: vector<16xf32>):
      "memref.store"(%4, %3, %arg0) : (f32, memref<?xf32>, index) -> ()
      %18 = "arith.index_cast"(%arg0) : (index) -> i32
      %19 = "arith.sitofp"(%18) : (i32) -> f32
      %20 = "vector.insert"(%19, %arg1, %arg0) <{static_position = array<i64: -9223372036854775808>}> : (f32, vector<16xf32>, index) -> vector<16xf32>
      "scf.yield"(%20) : (vector<16xf32>) -> ()
    }) : (index, index, index, vector<16xf32>) -> vector<16xf32>
    %7 = "arith.constant"() <{value = false}> : () -> i1
    %8 = "arith.constant"() <{value = true}> : () -> i1
    %9 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1>
    %10 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1>
    %11 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4>}> : () -> vector<16xi1>
    %12 = "vector.insert"(%7, %11) <{static_position = array<i64: 0>}> : (i1, vector<16xi1>) -> vector<16xi1>
    %13 = "vector.insert"(%8, %12) <{static_position = array<i64: 7>}> : (i1, vector<16xi1>) -> vector<16xi1>
    %14 = "vector.insert"(%8, %13) <{static_position = array<i64: 11>}> : (i1, vector<16xi1>) -> vector<16xi1>
    %15 = "vector.insert"(%8, %14) <{static_position = array<i64: 13>}> : (i1, vector<16xi1>) -> vector<16xi1>
    %16 = "vector.insert"(%8, %15) <{static_position = array<i64: 15>}> : (i1, vector<16xi1>) -> vector<16xi1>
    %17 = "vector.insert"(%7, %16) <{static_position = array<i64: 2>}> : (i1, vector<16xi1>) -> vector<16xi1>
    "func.call"(%3, %9, %6) <{callee = @compress16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    "func.call"(%3) <{callee = @printmem16}> : (memref<?xf32>) -> ()
    "func.call"(%3, %10, %6) <{callee = @compress16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    "func.call"(%3) <{callee = @printmem16}> : (memref<?xf32>) -> ()
    "func.call"(%3, %17, %6) <{callee = @compress16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    "func.call"(%3) <{callee = @printmem16}> : (memref<?xf32>) -> ()
    "func.call"(%3, %16, %6) <{callee = @compress16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    "func.call"(%3) <{callee = @printmem16}> : (memref<?xf32>) -> ()
    "func.call"(%3, %11, %6) <{callee = @compress16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    "func.call"(%3) <{callee = @printmem16}> : (memref<?xf32>) -> ()
    "func.call"(%3, %11, %6) <{callee = @compress16_at8}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> ()
    "func.call"(%3) <{callee = @printmem16}> : (memref<?xf32>) -> ()
    "memref.dealloc"(%3) : (memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

