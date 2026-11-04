"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %16 = "arith.constant"() <{value = 0 : index}> : () -> index
    %17 = "arith.constant"() <{value = 1 : index}> : () -> index
    %18 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x3xf32>
    %19 = "memref.dim"(%18, %16) : (memref<2x3xf32>, index) -> index
    %20 = "memref.dim"(%18, %17) : (memref<2x3xf32>, index) -> index
    "scf.parallel"(%16, %16, %19, %20, %17, %17) <{operandSegmentSizes = array<i32: 2, 2, 2, 0>}> ({
    ^bb0(%arg4: index, %arg5: index):
      %22 = "arith.muli"(%arg4, %20) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %23 = "arith.addi"(%22, %arg5) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %24 = "arith.index_cast"(%23) : (index) -> i64
      %25 = "arith.sitofp"(%24) : (i64) -> f32
      "memref.store"(%25, %18, %arg4, %arg5) : (f32, memref<2x3xf32>, index, index) -> ()
      "scf.reduce"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    %21 = "memref.cast"(%18) : (memref<2x3xf32>) -> memref<*xf32>
    "func.call"(%21) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.call"(%18) <{callee = @cast_ranked_memref_to_static_shape}> : (memref<2x3xf32>) -> ()
    "func.call"(%18) <{callee = @cast_ranked_memref_to_dynamic_shape}> : (memref<2x3xf32>) -> ()
    "func.call"(%18) <{callee = @cast_unranked_memref_to_static_shape}> : (memref<2x3xf32>) -> ()
    "func.call"(%18) <{callee = @cast_unranked_memref_to_dynamic_shape}> : (memref<2x3xf32>) -> ()
    "memref.dealloc"(%18) : (memref<2x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x3xf32>) -> (), sym_name = "cast_ranked_memref_to_static_shape"}> ({
  ^bb0(%arg3: memref<2x3xf32>):
    %14 = "memref.reinterpret_cast"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 6, 1>, static_strides = array<i64: 1, 1>}> : (memref<2x3xf32>) -> memref<6x1xf32>
    %15 = "memref.cast"(%14) : (memref<6x1xf32>) -> memref<*xf32>
    "func.call"(%15) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x3xf32>) -> (), sym_name = "cast_ranked_memref_to_dynamic_shape"}> ({
  ^bb0(%arg2: memref<2x3xf32>):
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index
    %10 = "arith.constant"() <{value = 1 : index}> : () -> index
    %11 = "arith.constant"() <{value = 6 : index}> : () -> index
    %12 = "memref.reinterpret_cast"(%arg2, %9, %10, %11, %11, %10) <{operandSegmentSizes = array<i32: 1, 1, 2, 2>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<2x3xf32>, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
    %13 = "memref.cast"(%12) : (memref<?x?xf32, strided<[?, ?], offset: ?>>) -> memref<*xf32>
    "func.call"(%13) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x3xf32>) -> (), sym_name = "cast_unranked_memref_to_static_shape"}> ({
  ^bb0(%arg1: memref<2x3xf32>):
    %6 = "memref.cast"(%arg1) : (memref<2x3xf32>) -> memref<*xf32>
    %7 = "memref.reinterpret_cast"(%6) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 6, 1>, static_strides = array<i64: 1, 1>}> : (memref<*xf32>) -> memref<6x1xf32>
    %8 = "memref.cast"(%7) : (memref<6x1xf32>) -> memref<*xf32>
    "func.call"(%8) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x3xf32>) -> (), sym_name = "cast_unranked_memref_to_dynamic_shape"}> ({
  ^bb0(%arg0: memref<2x3xf32>):
    %0 = "memref.cast"(%arg0) : (memref<2x3xf32>) -> memref<*xf32>
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 6 : index}> : () -> index
    %4 = "memref.reinterpret_cast"(%0, %1, %2, %3, %3, %2) <{operandSegmentSizes = array<i32: 1, 1, 2, 2>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<*xf32>, index, index, index, index, index) -> memref<?x?xf32, strided<[?, ?], offset: ?>>
    %5 = "memref.cast"(%4) : (memref<?x?xf32, strided<[?, ?], offset: ?>>) -> memref<*xf32>
    "func.call"(%5) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

