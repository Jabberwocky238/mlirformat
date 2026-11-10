"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x6xf32>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2xf32>
    %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %8 = "arith.constant"() <{value = 1.600000e+01 : f32}> : () -> f32
    %9 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %10 = "arith.constant"() <{value = 6.000000e+00 : f32}> : () -> f32
    %11 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %12 = "arith.constant"() <{value = 1.000000e+01 : f32}> : () -> f32
    %13 = "arith.constant"() <{value = 1.100000e+01 : f32}> : () -> f32
    %14 = "arith.constant"() <{value = 0 : index}> : () -> index
    %15 = "arith.constant"() <{value = 1 : index}> : () -> index
    %16 = "arith.constant"() <{value = 2 : index}> : () -> index
    %17 = "arith.constant"() <{value = 3 : index}> : () -> index
    %18 = "arith.constant"() <{value = 4 : index}> : () -> index
    %19 = "arith.constant"() <{value = 5 : index}> : () -> index
    %20 = "arith.constant"() <{value = 6 : index}> : () -> index
    %21 = "memref.cast"(%0) : (memref<2x6xf32>) -> memref<*xf32>
    "gpu.host_register"(%21) : (memref<*xf32>) -> ()
    %22 = "memref.cast"(%1) : (memref<2xf32>) -> memref<*xf32>
    "gpu.host_register"(%22) : (memref<*xf32>) -> ()
    %23 = "memref.cast"(%2) : (memref<2xf32>) -> memref<*xf32>
    "gpu.host_register"(%23) : (memref<*xf32>) -> ()
    "memref.store"(%3, %0, %14, %14) : (f32, memref<2x6xf32>, index, index) -> ()
    "memref.store"(%4, %0, %14, %15) : (f32, memref<2x6xf32>, index, index) -> ()
    "memref.store"(%5, %0, %14, %16) : (f32, memref<2x6xf32>, index, index) -> ()
    "memref.store"(%6, %0, %14, %17) : (f32, memref<2x6xf32>, index, index) -> ()
    "memref.store"(%7, %0, %14, %18) : (f32, memref<2x6xf32>, index, index) -> ()
    "memref.store"(%8, %0, %14, %19) : (f32, memref<2x6xf32>, index, index) -> ()
    "memref.store"(%5, %0, %15, %14) : (f32, memref<2x6xf32>, index, index) -> ()
    "memref.store"(%9, %0, %15, %15) : (f32, memref<2x6xf32>, index, index) -> ()
    "memref.store"(%10, %0, %15, %16) : (f32, memref<2x6xf32>, index, index) -> ()
    "memref.store"(%11, %0, %15, %17) : (f32, memref<2x6xf32>, index, index) -> ()
    "memref.store"(%12, %0, %15, %18) : (f32, memref<2x6xf32>, index, index) -> ()
    "memref.store"(%13, %0, %15, %19) : (f32, memref<2x6xf32>, index, index) -> ()
    "gpu.launch"(%16, %15, %15, %20, %15, %15) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
      %24 = "memref.load"(%0, %arg0, %arg3) : (memref<2x6xf32>, index, index) -> f32
      %25 = "gpu.all_reduce"(%24) <{op = #gpu<all_reduce_op add>, uniform}> ({
      }) : (f32) -> f32
      "memref.store"(%25, %1, %arg0) : (f32, memref<2xf32>, index) -> ()
      %26 = "gpu.all_reduce"(%24) <{op = #gpu<all_reduce_op mul>, uniform}> ({
      }) : (f32) -> f32
      "memref.store"(%26, %2, %arg0) : (f32, memref<2xf32>, index) -> ()
      "gpu.terminator"() : () -> ()
    }) : (index, index, index, index, index, index) -> ()
    "func.call"(%22) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.call"(%23) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

