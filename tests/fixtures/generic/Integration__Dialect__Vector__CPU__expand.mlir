"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>, sym_name = "expand16"}> ({
  ^bb0(%arg4: memref<?xf32>, %arg5: vector<16xi1>, %arg6: vector<16xf32>):
    %32 = "arith.constant"() <{value = 0 : index}> : () -> index
    %33 = "vector.expandload"(%arg4, %32, %arg5, %arg6) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%33) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>, sym_name = "expand16_at8"}> ({
  ^bb0(%arg1: memref<?xf32>, %arg2: vector<16xi1>, %arg3: vector<16xf32>):
    %30 = "arith.constant"() <{value = 8 : index}> : () -> index
    %31 = "vector.expandload"(%arg1, %30, %arg2, %arg3) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%31) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 16 : index}> : () -> index
    %3 = "memref.alloc"(%2) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      %28 = "arith.index_cast"(%arg0) : (index) -> i32
      %29 = "arith.sitofp"(%28) : (i32) -> f32
      "memref.store"(%29, %3, %arg0) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %4 = "arith.constant"() <{value = -7.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 7.6999998 : f32}> : () -> f32
    %6 = "vector.broadcast"(%4) : (f32) -> vector<16xf32>
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
    %18 = "func.call"(%3, %9, %6) <{callee = @expand16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    %19 = "func.call"(%3, %10, %6) <{callee = @expand16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    %20 = "func.call"(%3, %11, %6) <{callee = @expand16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    %21 = "func.call"(%3, %16, %6) <{callee = @expand16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    %22 = "func.call"(%3, %17, %6) <{callee = @expand16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    %23 = "vector.insert"(%5, %6) <{static_position = array<i64: 1>}> : (f32, vector<16xf32>) -> vector<16xf32>
    %24 = "vector.insert"(%5, %23) <{static_position = array<i64: 2>}> : (f32, vector<16xf32>) -> vector<16xf32>
    %25 = "vector.insert"(%5, %24) <{static_position = array<i64: 14>}> : (f32, vector<16xf32>) -> vector<16xf32>
    %26 = "func.call"(%3, %17, %25) <{callee = @expand16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    %27 = "func.call"(%3, %11, %6) <{callee = @expand16_at8}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> vector<16xf32>
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> ()
    "memref.dealloc"(%3) : (memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

