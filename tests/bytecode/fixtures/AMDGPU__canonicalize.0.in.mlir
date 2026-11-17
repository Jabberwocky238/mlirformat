"builtin.module"() ({
  "func.func"() <{function_type = (memref<4xf32>) -> f32, sym_name = "known_oob_load"}> ({
  ^bb0(%arg0: memref<4xf32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 4 : i32}> : () -> i32 loc("<stdin>":4:10)
    %1 = "amdgpu.raw_buffer_load"(%arg0, %0) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 1, 0>}> : (memref<4xf32>, i32) -> f32 loc("<stdin>":5:10)
    "func.return"(%1) : (f32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
