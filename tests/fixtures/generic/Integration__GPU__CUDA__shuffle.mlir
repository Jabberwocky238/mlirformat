"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<13xf32>
    %1 = "memref.cast"(%0) : (memref<13xf32>) -> memref<?xf32>
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    %4 = "memref.dim"(%1, %3) : (memref<?xf32>, index) -> index
    %5 = "memref.cast"(%1) : (memref<?xf32>) -> memref<*xf32>
    "gpu.host_register"(%5) : (memref<*xf32>) -> ()
    "gpu.launch"(%2, %2, %2, %4, %2, %2) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
      %6 = "arith.index_cast"(%arg3) : (index) -> i32
      %7 = "arith.sitofp"(%6) : (i32) -> f32
      %8 = "arith.index_cast"(%arg9) : (index) -> i32
      %9 = "arith.constant"() <{value = 4 : i32}> : () -> i32
      %10:2 = "gpu.shuffle"(%7, %9, %8) <{mode = #gpu<shuffle_mode xor>}> : (f32, i32, i32) -> (f32, i1)
      "cf.cond_br"(%10#1, %10#0)[^bb2, ^bb1] <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (i1, f32) -> ()
    ^bb1:  // pred: ^bb0
      %11 = "arith.constant"() <{value = -1.000000e+00 : f32}> : () -> f32
      "cf.br"(%11)[^bb2] : (f32) -> ()
    ^bb2(%12: f32):  // 2 preds: ^bb0, ^bb1
      "memref.store"(%12, %1, %arg3) : (f32, memref<?xf32>, index) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.call"(%5) <{callee = @printMemrefF32}> : (memref<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

