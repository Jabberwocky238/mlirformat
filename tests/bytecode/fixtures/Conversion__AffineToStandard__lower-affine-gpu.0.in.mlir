"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (index, memref<?xf32>) -> f32}> ({
    ^bb0(%arg0: index loc("<stdin>":5:10), %arg1: memref<?xf32> loc("<stdin>":5:24)):
      %0 = "affine.apply"(%arg0) <{map = affine_map<(d0) -> (d0)>}> : (index) -> index loc("<stdin>":6:12)
      %1 = "memref.load"(%arg1, %0) : (memref<?xf32>, index) -> f32 loc("<stdin>":7:12)
      "gpu.return"(%1) : (f32) -> () loc("<stdin>":8:7)
    }) {sym_name = "foo"} : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
