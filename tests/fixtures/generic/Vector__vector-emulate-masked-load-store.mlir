"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x5xf32>) -> vector<4xf32>, sym_name = "vector_maskedload"}> ({
  ^bb0(%arg11: memref<4x5xf32>):
    %16 = "arith.constant"() <{value = 0 : index}> : () -> index
    %17 = "arith.constant"() <{value = 1 : index}> : () -> index
    %18 = "arith.constant"() <{value = 4 : index}> : () -> index
    %19 = "vector.create_mask"(%17) : (index) -> vector<4xi1>
    %20 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %21 = "vector.broadcast"(%20) : (f32) -> vector<4xf32>
    %22 = "vector.maskedload"(%arg11, %16, %18, %19, %21) : (memref<4x5xf32>, index, index, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%22) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x5xf32>) -> vector<4xf32>, sym_name = "vector_maskedload_with_alignment"}> ({
  ^bb0(%arg10: memref<4x5xf32>):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index
    %10 = "arith.constant"() <{value = 1 : index}> : () -> index
    %11 = "arith.constant"() <{value = 4 : index}> : () -> index
    %12 = "vector.create_mask"(%10) : (index) -> vector<4xi1>
    %13 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %14 = "vector.broadcast"(%13) : (f32) -> vector<4xf32>
    %15 = "vector.maskedload"(%arg10, %9, %11, %12, %14) <{alignment = 8 : i64}> : (memref<4x5xf32>, index, index, vector<4xi1>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%15) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x5xf32>, vector<4xf32>) -> (), sym_name = "vector_maskedstore"}> ({
  ^bb0(%arg8: memref<4x5xf32>, %arg9: vector<4xf32>):
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index
    %7 = "arith.constant"() <{value = 4 : index}> : () -> index
    %8 = "vector.create_mask"(%6) : (index) -> vector<4xi1>
    "vector.maskedstore"(%arg8, %5, %7, %8, %arg9) : (memref<4x5xf32>, index, index, vector<4xi1>, vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x5xf32>, vector<4xf32>) -> (), sym_name = "vector_maskedstore_with_alignment"}> ({
  ^bb0(%arg6: memref<4x5xf32>, %arg7: vector<4xf32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "vector.create_mask"(%2) : (index) -> vector<4xi1>
    "vector.maskedstore"(%arg6, %1, %3, %4, %arg7) <{alignment = 8 : i64}> : (memref<4x5xf32>, index, index, vector<4xi1>, vector<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>, vector<1xi1>, vector<1xf32>) -> vector<1xf32>, sym_name = "vector_maskedload_rank0"}> ({
  ^bb0(%arg3: memref<f32>, %arg4: vector<1xi1>, %arg5: vector<1xf32>):
    %0 = "vector.maskedload"(%arg3, %arg4, %arg5) : (memref<f32>, vector<1xi1>, vector<1xf32>) -> vector<1xf32>
    "func.return"(%0) : (vector<1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>, vector<1xi1>, vector<1xf32>) -> (), sym_name = "vector_maskedstore_rank0"}> ({
  ^bb0(%arg0: memref<f32>, %arg1: vector<1xi1>, %arg2: vector<1xf32>):
    "vector.maskedstore"(%arg0, %arg1, %arg2) : (memref<f32>, vector<1xi1>, vector<1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

