"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "func"}> ({
  ^bb0(%arg1: index loc("<stdin>":3:8), %arg2: index loc("<stdin>":3:22)):
    "scf.forall"(%arg1, %arg2) <{operandSegmentSizes = array<i32: 0, 2, 0, 0>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 1, 1>, staticUpperBound = array<i64: -9223372036854775808, -9223372036854775808>}> ({
    ^bb0(%arg3: index loc("<stdin>":5:10), %arg4: index loc("<stdin>":5:24)):
      %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:12)
      %3 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x32xf32> loc("<stdin>":7:12)
      %4 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x32xf32> loc("<stdin>":8:12)
      "memref.store"(%2, %3, %arg3, %arg4) : (f32, memref<2x32xf32>, index, index) -> () loc("<stdin>":9:7)
      "memref.store"(%2, %4, %arg3, %arg4) : (f32, memref<2x32xf32>, index, index) -> () loc("<stdin>":10:7)
      "scf.forall.in_parallel"() ({
      ^bb0:
      }) : () -> () loc("<stdin>":11:7)
    }) : (index, index) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":19:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["memref.alloca"]}> : (!transform.any_op) -> !transform.op<"memref.alloca"> loc("<stdin>":20:12)
      %1:2 = "transform.memref.alloca_to_global"(%0) : (!transform.op<"memref.alloca">) -> (!transform.any_op, !transform.any_op) loc("<stdin>":21:14)
      "transform.yield"() : () -> () loc("<stdin>":22:7)
    }) : () -> () loc("<stdin>":18:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":1:1)
