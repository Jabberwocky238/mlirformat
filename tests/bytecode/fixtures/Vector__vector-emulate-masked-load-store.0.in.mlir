"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x5xf32>) -> vector<4xf32>, sym_name = "vector_maskedload"}> ({
  ^bb0(%arg11: memref<4x5xf32> loc("<stdin>":3:8)):
    %16 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:11)
    %17 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:11)
    %18 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":6:11)
    %19 = "vector.create_mask"(%17) : (index) -> vector<4xi1> loc("<stdin>":7:11)
    %20 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:11)
    %21 = "vector.broadcast"(%20) : (f32) -> vector<4xf32> loc("<stdin>":9:11)
    %22 = "vector.maskedload"(%arg11, %16, %18, %19, %21) : (memref<4x5xf32>, index, index, vector<4xi1>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":10:11)
    "func.return"(%22) : (vector<4xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<4x5xf32>) -> vector<4xf32>, sym_name = "vector_maskedload_with_alignment"}> ({
  ^bb0(%arg10: memref<4x5xf32> loc("<stdin>":14:8)):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":15:10)
    %10 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":16:11)
    %11 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":17:11)
    %12 = "vector.create_mask"(%10) : (index) -> vector<4xi1> loc("<stdin>":18:11)
    %13 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":19:11)
    %14 = "vector.broadcast"(%13) : (f32) -> vector<4xf32> loc("<stdin>":20:11)
    %15 = "vector.maskedload"(%arg10, %9, %11, %12, %14) <{alignment = 8 : i64}> : (memref<4x5xf32>, index, index, vector<4xi1>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":21:11)
    "func.return"(%15) : (vector<4xf32>) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":13:3)
  "func.func"() <{function_type = (memref<4x5xf32>, vector<4xf32>) -> (), sym_name = "vector_maskedstore"}> ({
  ^bb0(%arg8: memref<4x5xf32> loc("<stdin>":25:8), %arg9: vector<4xf32> loc("<stdin>":25:32)):
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":26:10)
    %6 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":27:10)
    %7 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":28:10)
    %8 = "vector.create_mask"(%6) : (index) -> vector<4xi1> loc("<stdin>":29:10)
    "vector.maskedstore"(%arg8, %5, %7, %8, %arg9) : (memref<4x5xf32>, index, index, vector<4xi1>, vector<4xf32>) -> () loc("<stdin>":30:5)
    "func.return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":24:3)
  "func.func"() <{function_type = (memref<4x5xf32>, vector<4xf32>) -> (), sym_name = "vector_maskedstore_with_alignment"}> ({
  ^bb0(%arg6: memref<4x5xf32> loc("<stdin>":34:8), %arg7: vector<4xf32> loc("<stdin>":34:32)):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":35:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":36:10)
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":37:10)
    %4 = "vector.create_mask"(%2) : (index) -> vector<4xi1> loc("<stdin>":38:10)
    "vector.maskedstore"(%arg6, %1, %3, %4, %arg7) <{alignment = 8 : i64}> : (memref<4x5xf32>, index, index, vector<4xi1>, vector<4xf32>) -> () loc("<stdin>":39:5)
    "func.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":33:3)
  "func.func"() <{function_type = (memref<f32>, vector<1xi1>, vector<1xf32>) -> vector<1xf32>, sym_name = "vector_maskedload_rank0"}> ({
  ^bb0(%arg3: memref<f32> loc("<stdin>":43:8), %arg4: vector<1xi1> loc("<stdin>":43:28), %arg5: vector<1xf32> loc("<stdin>":43:49)):
    %0 = "vector.maskedload"(%arg3, %arg4, %arg5) : (memref<f32>, vector<1xi1>, vector<1xf32>) -> vector<1xf32> loc("<stdin>":44:10)
    "func.return"(%0) : (vector<1xf32>) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (memref<f32>, vector<1xi1>, vector<1xf32>) -> (), sym_name = "vector_maskedstore_rank0"}> ({
  ^bb0(%arg0: memref<f32> loc("<stdin>":48:8), %arg1: vector<1xi1> loc("<stdin>":48:28), %arg2: vector<1xf32> loc("<stdin>":48:49)):
    "vector.maskedstore"(%arg0, %arg1, %arg2) : (memref<f32>, vector<1xi1>, vector<1xf32>) -> () loc("<stdin>":49:5)
    "func.return"() : () -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
}) : () -> () loc("<stdin>":1:1)
