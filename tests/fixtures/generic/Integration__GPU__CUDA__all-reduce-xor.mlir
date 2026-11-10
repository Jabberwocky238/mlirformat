"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x6xi32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xi32>
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "arith.constant"() <{value = 2 : i32}> : () -> i32
    %5 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %6 = "arith.constant"() <{value = 8 : i32}> : () -> i32
    %7 = "arith.constant"() <{value = 16 : i32}> : () -> i32
    %8 = "arith.constant"() <{value = 3 : i32}> : () -> i32
    %9 = "arith.constant"() <{value = 6 : i32}> : () -> i32
    %10 = "arith.constant"() <{value = 7 : i32}> : () -> i32
    %11 = "arith.constant"() <{value = 10 : i32}> : () -> i32
    %12 = "arith.constant"() <{value = 11 : i32}> : () -> i32
    %13 = "arith.constant"() <{value = 0 : index}> : () -> index
    %14 = "arith.constant"() <{value = 1 : index}> : () -> index
    %15 = "arith.constant"() <{value = 2 : index}> : () -> index
    %16 = "arith.constant"() <{value = 3 : index}> : () -> index
    %17 = "arith.constant"() <{value = 4 : index}> : () -> index
    %18 = "arith.constant"() <{value = 5 : index}> : () -> index
    %19 = "arith.constant"() <{value = 6 : index}> : () -> index
    %20 = "memref.cast"(%0) : (memref<2x6xi32>) -> memref<*xi32>
    "gpu.host_register"(%20) : (memref<*xi32>) -> ()
    %21 = "memref.cast"(%1) : (memref<2xi32>) -> memref<*xi32>
    "gpu.host_register"(%21) : (memref<*xi32>) -> ()
    "memref.store"(%2, %0, %13, %13) : (i32, memref<2x6xi32>, index, index) -> ()
    "memref.store"(%3, %0, %13, %14) : (i32, memref<2x6xi32>, index, index) -> ()
    "memref.store"(%4, %0, %13, %15) : (i32, memref<2x6xi32>, index, index) -> ()
    "memref.store"(%5, %0, %13, %16) : (i32, memref<2x6xi32>, index, index) -> ()
    "memref.store"(%6, %0, %13, %17) : (i32, memref<2x6xi32>, index, index) -> ()
    "memref.store"(%7, %0, %13, %18) : (i32, memref<2x6xi32>, index, index) -> ()
    "memref.store"(%4, %0, %14, %13) : (i32, memref<2x6xi32>, index, index) -> ()
    "memref.store"(%8, %0, %14, %14) : (i32, memref<2x6xi32>, index, index) -> ()
    "memref.store"(%9, %0, %14, %15) : (i32, memref<2x6xi32>, index, index) -> ()
    "memref.store"(%10, %0, %14, %16) : (i32, memref<2x6xi32>, index, index) -> ()
    "memref.store"(%11, %0, %14, %17) : (i32, memref<2x6xi32>, index, index) -> ()
    "memref.store"(%12, %0, %14, %18) : (i32, memref<2x6xi32>, index, index) -> ()
    "gpu.launch"(%15, %14, %14, %19, %14, %14) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
      %22 = "memref.load"(%0, %arg0, %arg3) : (memref<2x6xi32>, index, index) -> i32
      %23 = "gpu.all_reduce"(%22) <{op = #gpu<all_reduce_op xor>, uniform}> ({
      }) : (i32) -> i32
      "memref.store"(%23, %1, %arg0) : (i32, memref<2xi32>, index) -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.call"(%21) <{callee = @printMemrefI32}> : (memref<*xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xi32>) -> (), sym_name = "printMemrefI32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

