"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> (), sym_name = "scatter8"}> ({
  ^bb0(%arg4: memref<?xf32>, %arg5: vector<8xi32>, %arg6: vector<8xi1>, %arg7: vector<8xf32>):
    %51 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.scatter"(%arg4, %51, %arg5, %arg6, %arg7) : (memref<?xf32>, index, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "printmem8"}> ({
  ^bb0(%arg1: memref<?xf32>):
    %43 = "arith.constant"() <{value = 0 : index}> : () -> index
    %44 = "arith.constant"() <{value = 1 : index}> : () -> index
    %45 = "arith.constant"() <{value = 8 : index}> : () -> index
    %46 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %47 = "vector.broadcast"(%46) : (f32) -> vector<8xf32>
    %48 = "scf.for"(%43, %45, %44, %47) ({
    ^bb0(%arg2: index, %arg3: vector<8xf32>):
      %49 = "memref.load"(%arg1, %arg2) : (memref<?xf32>, index) -> f32
      %50 = "vector.insert"(%49, %arg3, %arg2) <{static_position = array<i64: -9223372036854775808>}> : (f32, vector<8xf32>, index) -> vector<8xf32>
      "scf.yield"(%50) : (vector<8xf32>) -> ()
    }) : (index, index, index, vector<8xf32>) -> vector<8xf32>
    "vector.print"(%48) <{punctuation = #vector.punctuation<newline>}> : (vector<8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "memref.alloc"(%2) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32>
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg0: index):
      %41 = "arith.index_cast"(%arg0) : (index) -> i32
      %42 = "arith.sitofp"(%41) : (i32) -> f32
      "memref.store"(%42, %3, %arg0) : (f32, memref<?xf32>, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    %4 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %6 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %7 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %8 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %9 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %10 = "arith.constant"() <{value = 6 : i32}> : () -> i32
    %11 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %12 = "vector.broadcast"(%11) : (i32) -> vector<8xi32>
    %13 = "vector.insert"(%4, %12) <{static_position = array<i64: 1>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %14 = "vector.insert"(%5, %13) <{static_position = array<i64: 2>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %15 = "vector.insert"(%10, %14) <{static_position = array<i64: 3>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %16 = "vector.insert"(%6, %15) <{static_position = array<i64: 4>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %17 = "vector.insert"(%8, %16) <{static_position = array<i64: 5>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %18 = "vector.insert"(%9, %17) <{static_position = array<i64: 6>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %19 = "vector.insert"(%7, %18) <{static_position = array<i64: 7>}> : (i32, vector<8xi32>) -> vector<8xi32>
    %20 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %21 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %22 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %23 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %24 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %25 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %26 = "arith.constant"() <{value = 6.000000e+00 : f32}> : () -> f32
    %27 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %28 = "vector.broadcast"(%20) : (f32) -> vector<8xf32>
    %29 = "vector.insert"(%21, %28) <{static_position = array<i64: 1>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %30 = "vector.insert"(%22, %29) <{static_position = array<i64: 2>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %31 = "vector.insert"(%23, %30) <{static_position = array<i64: 3>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %32 = "vector.insert"(%24, %31) <{static_position = array<i64: 4>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %33 = "vector.insert"(%25, %32) <{static_position = array<i64: 5>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %34 = "vector.insert"(%26, %33) <{static_position = array<i64: 6>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %35 = "vector.insert"(%27, %34) <{static_position = array<i64: 7>}> : (f32, vector<8xf32>) -> vector<8xf32>
    %36 = "arith.constant"() <{value = true}> : () -> i1
    %37 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<8xi1>
    %38 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 4>}> : () -> vector<8xi1>
    %39 = "vector.insert"(%36, %38) <{static_position = array<i64: 7>}> : (i1, vector<8xi1>) -> vector<8xi1>
    %40 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 8>}> : () -> vector<8xi1>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<8xi32>) -> ()
    "func.call"(%3) <{callee = @printmem8}> : (memref<?xf32>) -> ()
    "func.call"(%3, %19, %37, %35) <{callee = @scatter8}> : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> ()
    "func.call"(%3) <{callee = @printmem8}> : (memref<?xf32>) -> ()
    "func.call"(%3, %19, %38, %35) <{callee = @scatter8}> : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> ()
    "func.call"(%3) <{callee = @printmem8}> : (memref<?xf32>) -> ()
    "func.call"(%3, %19, %39, %35) <{callee = @scatter8}> : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> ()
    "func.call"(%3) <{callee = @printmem8}> : (memref<?xf32>) -> ()
    "func.call"(%3, %19, %40, %35) <{callee = @scatter8}> : (memref<?xf32>, vector<8xi32>, vector<8xi1>, vector<8xf32>) -> ()
    "func.call"(%3) <{callee = @printmem8}> : (memref<?xf32>) -> ()
    "memref.dealloc"(%3) : (memref<?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

