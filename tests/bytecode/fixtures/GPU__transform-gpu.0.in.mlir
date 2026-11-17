"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x32xf32>, memref<2x32xf32>, memref<32xf32>, f32, !gpu.async.token) -> memref<2x32xf32>, sym_name = "blocks_3d"}> ({
  ^bb0(%arg1: memref<2x32xf32> loc("<stdin>":3:8), %arg2: memref<2x32xf32> loc("<stdin>":3:33), %arg3: memref<32xf32> loc("<stdin>":3:58), %arg4: f32 loc("<stdin>":3:81), %arg5: !gpu.async.token loc("<stdin>":3:93)):
    %2 = "arith.constant"() <{value = 9 : index}> : () -> index loc("<stdin>":4:10)
    %3 = "arith.constant"() <{value = 7 : index}> : () -> index loc("<stdin>":5:10)
    %4 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":6:10)
    %5 = "gpu.launch"(%arg5, %4, %4, %4, %4, %4, %4) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0>}> ({
    ^bb0(%arg6: index loc("<stdin>":8:10), %arg7: index loc("<stdin>":8:24), %arg8: index loc("<stdin>":8:38), %arg9: index loc("<stdin>":8:52), %arg10: index loc("<stdin>":8:66), %arg11: index loc("<stdin>":8:81), %arg12: index loc("<stdin>":8:96), %arg13: index loc("<stdin>":8:111), %arg14: index loc("<stdin>":8:126), %arg15: index loc("<stdin>":8:141), %arg16: index loc("<stdin>":8:156), %arg17: index loc("<stdin>":8:171)):
      "scf.forall"(%3, %2) <{mapping = [#gpu.block<x>, #gpu.block<y>], operandSegmentSizes = array<i32: 0, 2, 0, 0>, staticLowerBound = array<i64: 0, 0>, staticStep = array<i64: 1, 1>, staticUpperBound = array<i64: -9223372036854775808, -9223372036854775808>}> ({
      ^bb0(%arg18: index loc("<stdin>":10:12), %arg19: index loc("<stdin>":10:27)):
        %6 = "memref.load"(%arg1, %arg18, %arg19) : (memref<2x32xf32>, index, index) -> f32 loc("<stdin>":11:14)
        %7 = "memref.load"(%arg2, %arg18, %arg19) : (memref<2x32xf32>, index, index) -> f32 loc("<stdin>":12:14)
        %8 = "math.fma"(%arg4, %6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32, f32) -> f32 loc("<stdin>":13:14)
        "memref.store"(%8, %arg2, %arg18, %arg19) : (f32, memref<2x32xf32>, index, index) -> () loc("<stdin>":14:9)
        "scf.forall.in_parallel"() ({
        ^bb0:
        }) : () -> () loc("<stdin>":15:9)
      }) : (index, index) -> () loc("<stdin>":9:7)
      "gpu.terminator"() : () -> () loc("<stdin>":19:7)
    }) : (!gpu.async.token, index, index, index, index, index, index) -> !gpu.async.token loc("<stdin>":7:10)
    "func.return"(%arg2) : (memref<2x32xf32>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":25:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["gpu.launch"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":26:12)
      %1 = "transform.gpu.map_forall_to_blocks"(%0) <{grid_dims = array<i64: 12, 9, 1>}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":27:12)
      "transform.yield"() : () -> () loc("<stdin>":28:7)
    }) : () -> () loc("<stdin>":24:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":23:3)
}) : () -> () loc("<stdin>":1:1)
