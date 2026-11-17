"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, f32, index) -> (f32, f32), sym_name = "atomic_rmw_no_conversion"}> ({
  ^bb0(%arg0: memref<10xf32> loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:31), %arg2: index loc("<stdin>":3:43)):
    %0 = "memref.atomic_rmw"(%arg1, %arg0, %arg2) <{kind = 0 : i64}> : (f32, memref<10xf32>, index) -> f32 loc("<stdin>":4:10)
    %1 = "memref.atomic_rmw"(%arg1, %arg0, %arg2) <{kind = 4 : i64}> : (f32, memref<10xf32>, index) -> f32 loc("<stdin>":5:10)
    "func.return"(%0, %1) : (f32, f32) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
