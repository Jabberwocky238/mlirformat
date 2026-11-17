"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %16 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:11)
    %17 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:11)
    %18 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x3xf32> loc("<stdin>":7:11)
    %19 = "memref.dim"(%18, %16) : (memref<2x3xf32>, index) -> index loc("<stdin>":8:11)
    %20 = "memref.dim"(%18, %17) : (memref<2x3xf32>, index) -> index loc("<stdin>":9:11)
    "scf.parallel"(%16, %16, %19, %20, %17, %17) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg4: index loc("<stdin>":11:10), %arg5: index loc("<stdin>":11:24)):
      %22 = "arith.muli"(%arg4, %20) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":12:13)
      %23 = "arith.addi"(%22, %arg5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":13:13)
      %24 = "arith.index_cast"(%23) : (index) -> i64 loc("<stdin>":14:13)
      %25 = "arith.sitofp"(%24) : (i64) -> f32 loc("<stdin>":15:13)
      "memref.store"(%25, %18, %arg4, %arg5) : (f32, memref<2x3xf32>, index, index) -> () loc("<stdin>":16:7)
      "scf.reduce"() : () -> () loc("<stdin>":17:7)
    }) : (index, index, index, index, index, index) -> () loc("<stdin>":10:5)
    %21 = "memref.cast"(%18) : (memref<2x3xf32>) -> memref<*xf32> loc("<stdin>":19:11)
    "func.call"(%21) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":20:5)
    "func.call"(%18) <{callee = @cast_ranked_memref_to_static_shape}> : (memref<2x3xf32>) -> () loc("<stdin>":21:5)
    "func.call"(%18) <{callee = @cast_ranked_memref_to_dynamic_shape}> : (memref<2x3xf32>) -> () loc("<stdin>":22:5)
    "func.call"(%18) <{callee = @cast_unranked_memref_to_static_shape}> : (memref<2x3xf32>) -> () loc("<stdin>":23:5)
    "func.call"(%18) <{callee = @cast_unranked_memref_to_dynamic_shape}> : (memref<2x3xf32>) -> () loc("<stdin>":24:5)
    "memref.dealloc"(%18) : (memref<2x3xf32>) -> () loc("<stdin>":25:5)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":4:3)
  "func.func"() <{function_type = (memref<2x3xf32>) -> (), sym_name = "cast_ranked_memref_to_static_shape"}> ({
  ^bb0(%arg3: memref<2x3xf32> loc("<stdin>":29:8)):
    %14 = "memref.reinterpret_cast"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 6, 1>, static_strides = array<i64: 1, 1>}> : (memref<2x3xf32>) -> memref<6x1xf32> loc("<stdin>":30:11)
    %15 = "memref.cast"(%14) : (memref<6x1xf32>) -> memref<*xf32> loc("<stdin>":31:11)
    "func.call"(%15) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":32:5)
    "func.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (memref<2x3xf32>) -> (), sym_name = "cast_ranked_memref_to_dynamic_shape"}> ({
  ^bb0(%arg2: memref<2x3xf32> loc("<stdin>":36:8)):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":37:10)
    %10 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":38:11)
    %11 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":39:11)
    %12 = "memref.reinterpret_cast"(%arg2, %9, %10, %11, %11, %10) <{operandSegmentSizes = array<i32: 1, 1, 2, 2>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<2x3xf32>, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>> loc("<stdin>":40:11)
    %13 = "memref.cast"(%12) : (memref<?x?xf32, strided<[?, ?], offset: ?>>) -> memref<*xf32> loc("<stdin>":41:11)
    "func.call"(%13) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":42:5)
    "func.return"() : () -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":35:3)
  "func.func"() <{function_type = (memref<2x3xf32>) -> (), sym_name = "cast_unranked_memref_to_static_shape"}> ({
  ^bb0(%arg1: memref<2x3xf32> loc("<stdin>":46:8)):
    %6 = "memref.cast"(%arg1) : (memref<2x3xf32>) -> memref<*xf32> loc("<stdin>":47:10)
    %7 = "memref.reinterpret_cast"(%6) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 6, 1>, static_strides = array<i64: 1, 1>}> : (memref<*xf32>) -> memref<6x1xf32> loc("<stdin>":48:10)
    %8 = "memref.cast"(%7) : (memref<6x1xf32>) -> memref<*xf32> loc("<stdin>":49:10)
    "func.call"(%8) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":50:5)
    "func.return"() : () -> () loc("<stdin>":51:5)
  }) : () -> () loc("<stdin>":45:3)
  "func.func"() <{function_type = (memref<2x3xf32>) -> (), sym_name = "cast_unranked_memref_to_dynamic_shape"}> ({
  ^bb0(%arg0: memref<2x3xf32> loc("<stdin>":54:8)):
    %0 = "memref.cast"(%arg0) : (memref<2x3xf32>) -> memref<*xf32> loc("<stdin>":55:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":56:10)
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":57:10)
    %3 = "arith.constant"() <{value = 6 : index}> : () -> index loc("<stdin>":58:10)
    %4 = "memref.reinterpret_cast"(%0, %1, %2, %3, %3, %2) <{operandSegmentSizes = array<i32: 1, 1, 2, 2>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<*xf32>, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>> loc("<stdin>":59:10)
    %5 = "memref.cast"(%4) : (memref<?x?xf32, strided<[?, ?], offset: ?>>) -> memref<*xf32> loc("<stdin>":60:10)
    "func.call"(%5) <{callee = @printMemrefF32}> : (memref<*xf32>) -> () loc("<stdin>":61:5)
    "func.return"() : () -> () loc("<stdin>":62:5)
  }) : () -> () loc("<stdin>":53:3)
}) : () -> () loc("<stdin>":1:1)
