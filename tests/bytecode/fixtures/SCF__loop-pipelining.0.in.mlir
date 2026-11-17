"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?xf32>) -> (), sym_name = "simple_pipeline"}> ({
  ^bb0(%arg0: memref<?xf32> loc("<stdin>":3:8), %arg1: memref<?xf32> loc("<stdin>":3:30)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":6:10)
    %3 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":7:10)
    "scf.for"(%0, %2, %1) ({
    ^bb0(%arg2: index loc("<stdin>":9:10)):
      %4 = "memref.load"(%arg0, %arg2) {__test_pipelining_op_order__ = 2 : i64, __test_pipelining_stage__ = 0 : i64} : (memref<?xf32>, index) -> f32 loc("<stdin>":10:12)
      %5 = "arith.addf"(%4, %3) <{fastmath = #arith.fastmath<none>}> {__test_pipelining_op_order__ = 0 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, f32) -> f32 loc("<stdin>":11:12)
      "memref.store"(%5, %arg1, %arg2) {__test_pipelining_op_order__ = 1 : i64, __test_pipelining_stage__ = 1 : i64} : (f32, memref<?xf32>, index) -> () loc("<stdin>":12:7)
      "scf.yield"() : () -> () loc("<stdin>":13:7)
    }) {__test_pipelining_loop__} : (index, index, index) -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
