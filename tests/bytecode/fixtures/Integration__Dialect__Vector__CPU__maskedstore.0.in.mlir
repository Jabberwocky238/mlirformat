"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> (), sym_name = "maskedstore16"}> ({
  ^bb0(%arg9: memref<?xf32> loc("<stdin>":3:8), %arg10: vector<16xi1> loc("<stdin>":3:30), %arg11: vector<16xf32> loc("<stdin>":3:53)):
    %24 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:11)
    "vector.maskedstore"(%arg9, %24, %arg10, %arg11) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> (), sym_name = "maskedstore16_at8"}> ({
  ^bb0(%arg6: memref<?xf32> loc("<stdin>":9:8), %arg7: vector<16xi1> loc("<stdin>":9:30), %arg8: vector<16xf32> loc("<stdin>":9:52)):
    %23 = "arith.constant"() <{value = 8 : index}> : () -> index loc("<stdin>":10:11)
    "vector.maskedstore"(%arg6, %23, %arg7, %arg8) : (memref<?xf32>, index, vector<16xi1>, vector<16xf32>) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (memref<?xf32>) -> (), sym_name = "printmem16"}> ({
  ^bb0(%arg3: memref<?xf32> loc("<stdin>":15:8)):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":16:11)
    %16 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":17:11)
    %17 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":18:11)
    %18 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":19:11)
    %19 = "vector.broadcast"(%18) : (f32) -> vector<16xf32> loc("<stdin>":20:11)
    %20 = "scf.for"(%15, %17, %16, %19) ({
    ^bb0(%arg4: index loc("<stdin>":22:10), %arg5: vector<16xf32> loc("<stdin>":22:24)):
      %21 = "memref.load"(%arg3, %arg4) : (memref<?xf32>, index) -> f32 loc("<stdin>":23:13)
      %22 = "vector.insert"(%21, %arg5, %arg4) <{static_position = array<i64: -9223372036854775808>}> : (f32, vector<16xf32>, index) -> vector<16xf32> loc("<stdin>":24:13)
      "scf.yield"(%22) : (vector<16xf32>) -> () loc("<stdin>":25:7)
    }) : (index, index, index, vector<16xf32>) -> vector<16xf32> loc("<stdin>":21:11)
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> () loc("<stdin>":27:5)
    "func.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":31:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":32:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":33:10)
    %3 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":34:10)
    %4 = "memref.alloc"(%3) <{operandSegmentSizes = array<i32: 1, 0>}> : (index) -> memref<?xf32> loc("<stdin>":35:10)
    "scf.for"(%1, %3, %2) ({
    ^bb0(%arg2: index loc("<stdin>":37:10)):
      "memref.store"(%0, %4, %arg2) : (f32, memref<?xf32>, index) -> () loc("<stdin>":38:7)
      "scf.yield"() : () -> () loc("<stdin>":39:7)
    }) : (index, index, index) -> () loc("<stdin>":36:5)
    %5 = "vector.broadcast"(%0) : (f32) -> vector<16xf32> loc("<stdin>":41:10)
    %6 = "scf.for"(%1, %3, %2, %5) ({
    ^bb0(%arg0: index loc("<stdin>":43:10), %arg1: vector<16xf32> loc("<stdin>":43:24)):
      %12 = "arith.index_cast"(%arg0) : (index) -> i32 loc("<stdin>":44:13)
      %13 = "arith.sitofp"(%12) : (i32) -> f32 loc("<stdin>":45:13)
      %14 = "vector.insert"(%13, %arg1, %arg0) <{static_position = array<i64: -9223372036854775808>}> : (f32, vector<16xf32>, index) -> vector<16xf32> loc("<stdin>":46:13)
      "scf.yield"(%14) : (vector<16xf32>) -> () loc("<stdin>":47:7)
    }) : (index, index, index, vector<16xf32>) -> vector<16xf32> loc("<stdin>":42:10)
    %7 = "arith.constant"() <{value = true}> : () -> i1 loc("<stdin>":49:10)
    %8 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<16xi1> loc("<stdin>":50:10)
    %9 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 8>}> : () -> vector<16xi1> loc("<stdin>":51:10)
    %10 = "vector.insert"(%7, %9) <{static_position = array<i64: 13>}> : (i1, vector<16xi1>) -> vector<16xi1> loc("<stdin>":52:11)
    %11 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> : () -> vector<16xi1> loc("<stdin>":53:11)
    "vector.print"(%6) <{punctuation = #vector.punctuation<newline>}> : (vector<16xf32>) -> () loc("<stdin>":54:5)
    "func.call"(%4) <{callee = @printmem16}> : (memref<?xf32>) -> () loc("<stdin>":55:5)
    "func.call"(%4, %8, %6) <{callee = @maskedstore16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> () loc("<stdin>":56:5)
    "func.call"(%4) <{callee = @printmem16}> : (memref<?xf32>) -> () loc("<stdin>":57:5)
    "func.call"(%4, %9, %6) <{callee = @maskedstore16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> () loc("<stdin>":58:5)
    "func.call"(%4) <{callee = @printmem16}> : (memref<?xf32>) -> () loc("<stdin>":59:5)
    "func.call"(%4, %10, %6) <{callee = @maskedstore16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> () loc("<stdin>":60:5)
    "func.call"(%4) <{callee = @printmem16}> : (memref<?xf32>) -> () loc("<stdin>":61:5)
    "func.call"(%4, %11, %6) <{callee = @maskedstore16}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> () loc("<stdin>":62:5)
    "func.call"(%4) <{callee = @printmem16}> : (memref<?xf32>) -> () loc("<stdin>":63:5)
    "func.call"(%4, %9, %6) <{callee = @maskedstore16_at8}> : (memref<?xf32>, vector<16xi1>, vector<16xf32>) -> () loc("<stdin>":64:5)
    "func.call"(%4) <{callee = @printmem16}> : (memref<?xf32>) -> () loc("<stdin>":65:5)
    "memref.dealloc"(%4) : (memref<?xf32>) -> () loc("<stdin>":66:5)
    "func.return"() : () -> () loc("<stdin>":67:5)
  }) : () -> () loc("<stdin>":30:3)
}) : () -> () loc("<stdin>":1:1)
