"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>, sym_name = "gather8"}> ({
  ^bb0(%arg2: memref<?x?xf32>, %arg3: vector<8xi32>, %arg4: vector<8xi1>, %arg5: vector<8xf32>):
    %37 = "arith.constant"() <{value = 0 : index}> : () -> index
    %38 = "vector.gather"(%arg2, %37, %37, %arg3, %arg4, %arg5) : (memref<?x?xf32>, index, index, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    "func.return"(%38) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 10 : index}> : () -> index
    %3 = "arith.constant"() <{value = 5 : index}> : () -> index
    %4 = "memref.alloc"(%2, %3) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      "scf.for"(%0, %3, %1) ({
      ^bb0(%arg1: index):
        %33 = "arith.muli"(%arg0, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %34 = "arith.addi"(%arg1, %33) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %35 = "arith.index_cast"(%34) : (index) -> i32
        %36 = "arith.sitofp"(%35) : (i32) -> f32
        "memref.store"(%36, %4, %arg0, %arg1) : (f32, memref<?x?xf32>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %5 = "memref.cast"(%4) : (memref<?x?xf32>) -> memref<*xf32>
    "func.call"(%5) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    %6 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %7 = "vector.broadcast"(%6) : (i32) -> vector<8xi32>
    %8 = "arith.constant"() <{value = 16 : i32}> : () -> i32
    %9 = "vector.insert"(%8, %7) <{static_position = array<i64: 1>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %10 = "arith.constant"() <{value = 11 : i32}> : () -> i32
    %11 = "vector.insert"(%10, %9) <{static_position = array<i64: 2>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %12 = "arith.constant"() <{value = 33 : i32}> : () -> i32
    %13 = "vector.insert"(%12, %11) <{static_position = array<i64: 3>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %14 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %15 = "vector.insert"(%14, %13) <{static_position = array<i64: 4>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %16 = "arith.constant"() <{value = 44 : i32}> : () -> i32
    %17 = "vector.insert"(%16, %15) <{static_position = array<i64: 5>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %18 = "arith.constant"() <{value = 19 : i32}> : () -> i32
    %19 = "vector.insert"(%18, %17) <{static_position = array<i64: 6>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %20 = "arith.constant"() <{value = 22 : i32}> : () -> i32
    %21 = "vector.insert"(%20, %19) <{static_position = array<i64: 7>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %22 = "arith.constant"() <{value = -7.000000e+00 : f32}> : () -> f32
    %23 = "vector.broadcast"(%22) : (f32) -> vector<8xf32>
    %24 = "arith.constant"() <{value = true}> : () -> i1
    %25 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<8xi1>
    %26 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 8>}> : () -> vector<8xi1>
    %27 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4>}> : () -> vector<8xi1>
    %28 = "vector.insert"(%24, %27) <{static_position = array<i64: 7>}> : (i1, vector<8xi1>) -> vector<8xi1>
    %29 = "func.call"(%4, %21, %26, %23) <{callee = @gather8}> : (memref<?x?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    %30 = "func.call"(%4, %21, %25, %23) <{callee = @gather8}> : (memref<?x?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%30) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    %31 = "func.call"(%4, %21, %27, %23) <{callee = @gather8}> : (memref<?x?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%31) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    %32 = "func.call"(%4, %21, %28, %23) <{callee = @gather8}> : (memref<?x?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%32) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "memref.dealloc"(%4) : (memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

