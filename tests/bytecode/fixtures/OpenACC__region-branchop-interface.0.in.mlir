"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> memref<f32>, sym_name = "last_mod_openacc_parallel"}> ({
  ^bb0(%arg0: memref<f32> loc("<stdin>":3:8)):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":4:10)
    "acc.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>}> ({
      "memref.store"(%0, %arg0) {tag_name = "parallel_region"} : (f32, memref<f32>) -> () loc("<stdin>":6:7)
      "acc.yield"() : () -> () loc("<stdin>":7:7)
    }) : () -> () loc("<stdin>":5:5)
    %1 = "memref.load"(%arg0) {tag = "acc_parallel_after"} : (memref<f32>) -> f32 loc("<stdin>":9:10)
    "func.return"(%arg0) {tag = "acc_parallel_return"} : (memref<f32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
