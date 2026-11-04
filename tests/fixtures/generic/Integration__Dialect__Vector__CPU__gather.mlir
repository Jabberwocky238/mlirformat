"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>, sym_name = "gather8"}> ({
  ^bb0(%arg1: memref<?xf32>, %arg2: vector<8xi32>, %arg3: vector<8xi1>, %arg4: vector<8xf32>):
    %34 = "arith.constant"() <{value = 0 : index}> : () -> index
    %35 = "vector.gather"(%arg1, %34, %arg2, %arg3, %arg4) : (memref<?xf32>, index, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    "func.return"(%35) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "memref.alloc"(%2) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      %32 = "arith.index_cast"(%arg0) : (index) -> i32
      %33 = "arith.sitofp"(%32) : (i32) -> f32
      "memref.store"(%33, %3, %arg0) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %4 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %6 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %7 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %8 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %9 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %10 = "arith.constant"() <{value = 6 : i32}> : () -> i32
    %11 = "arith.constant"() <{value = 9 : i32}> : () -> i32
    %12 = "vector.broadcast"(%4) : (i32) -> vector<8xi32>
    %13 = "vector.insert"(%10, %12) <{static_position = array<i64: 1>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %14 = "vector.insert"(%5, %13) <{static_position = array<i64: 2>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %15 = "vector.insert"(%7, %14) <{static_position = array<i64: 3>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %16 = "vector.insert"(%9, %15) <{static_position = array<i64: 4>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %17 = "vector.insert"(%8, %16) <{static_position = array<i64: 5>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %18 = "vector.insert"(%11, %17) <{static_position = array<i64: 6>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %19 = "vector.insert"(%6, %18) <{static_position = array<i64: 7>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %20 = "arith.constant"() <{value = -7.000000e+00 : f32}> : () -> f32
    %21 = "vector.broadcast"(%20) : (f32) -> vector<8xf32>
    %22 = "arith.constant"() <{value = true}> : () -> i1
    %23 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<8xi1>
    %24 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 8>}> : () -> vector<8xi1>
    %25 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4>}> : () -> vector<8xi1>
    %26 = "vector.insert"(%22, %25) <{static_position = array<i64: 7>}> : (i1, vector<8xi1>) -> vector<8xi1>
    %27 = "func.call"(%3, %19, %24, %21) <{callee = @gather8}> : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%27) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    %28 = "func.call"(%3, %19, %23, %21) <{callee = @gather8}> : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%28) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    %29 = "func.call"(%3, %19, %25, %21) <{callee = @gather8}> : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    %30 = "func.call"(%3, %19, %26, %21) <{callee = @gather8}> : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%30) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    %31 = "func.call"(%3, %19, %24, %21) <{callee = @gather8}> : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%31) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "memref.dealloc"(%3) : (memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

