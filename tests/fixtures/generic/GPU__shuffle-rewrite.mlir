"builtin.module"() ({
  "func.func"() <{function_type = (index, f64, i32, i32, memref<f64, 1>) -> (), sym_name = "shuffleF64"}> ({
  ^bb0(%arg0: index, %arg1: f64, %arg2: i32, %arg3: i32, %arg4: memref<f64, 1>):
    "gpu.launch"(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index, %arg14: index, %arg15: index, %arg16: index):
      %0:2 = "gpu.shuffle"(%arg1, %arg2, %arg3) <{mode = #gpu<shuffle_mode xor>}> : (f64, i32, i32) -> (f64, i1)
      "memref.store"(%0#0, %arg4) : (f64, memref<f64, 1>) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, i64, i32, i32, memref<i64, 1>) -> (), sym_name = "shuffleI64"}> ({
  ^bb0(%arg0: index, %arg1: i64, %arg2: i32, %arg3: i32, %arg4: memref<i64, 1>):
    "gpu.launch"(%arg0, %arg0, %arg0, %arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index, %arg13: index, %arg14: index, %arg15: index, %arg16: index):
      %0:2 = "gpu.shuffle"(%arg1, %arg2, %arg3) <{mode = #gpu<shuffle_mode xor>}> : (i64, i32, i32) -> (i64, i1)
      "memref.store"(%0#0, %arg4) : (i64, memref<i64, 1>) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> vector<4xf16>, sym_name = "gpu_shuffle_unsupported"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "arith.constant"() <{value = 4 : i32}> : () -> i32
    %1 = "arith.constant"() <{value = 64 : i32}> : () -> i32
    %2:2 = "gpu.shuffle"(%arg0, %0, %1) <{mode = #gpu<shuffle_mode xor>}> : (vector<4xf16>, i32, i32) -> (vector<4xf16>, i1)
    "func.return"(%2#0) : (vector<4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

