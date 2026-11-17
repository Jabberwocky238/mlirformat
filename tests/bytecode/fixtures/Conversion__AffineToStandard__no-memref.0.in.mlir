"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> (), sym_name = "no_memref_op"}> ({
  ^bb0(%arg0: memref<f32> loc("<stdin>":4:8)):
    %0 = "affine.load"(%arg0) <{map = affine_map<() -> ()>}> : (memref<f32>) -> f32 loc("<stdin>":5:10)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
