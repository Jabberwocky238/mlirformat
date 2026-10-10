"builtin.module"() ({
  "func.func"() <{function_type = (f32) -> (), sym_name = "test_math"}> ({
  ^bb0(%arg0: f32):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    "gpu.launch"(%1, %1, %1, %0, %1, %1) <{operandSegmentSizes = array<i32: 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index, %arg12: index):
      %2 = "math.exp"(%arg0) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "gpu.printf"(%2) <{format = "%f"}> : (f32) -> ()
      "gpu.terminator"() : () -> ()
    }) {workgroup_attributions = 0 : i64} : (index, index, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

