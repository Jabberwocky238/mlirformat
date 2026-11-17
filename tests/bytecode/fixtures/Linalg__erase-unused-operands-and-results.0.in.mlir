"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>) -> tensor<?xf32>, sym_name = "remove_deadargs_generic_basic"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":4:8)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":6:10)
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?xf32>, index) -> index loc("<stdin>":7:10)
    %3 = "tensor.empty"(%2) : (index) -> tensor<?xf32> loc("<stdin>":8:10)
    %4 = "tensor.empty"(%2) : (index) -> tensor<?xf32> loc("<stdin>":9:10)
    %5 = "linalg.generic"(%arg0, %3, %4) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":11:10), %arg2: f32 loc("<stdin>":11:22), %arg3: f32 loc("<stdin>":11:34)):
      %6 = "arith.addf"(%arg1, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":12:12)
      "linalg.yield"(%6) : (f32) -> () loc("<stdin>":13:7)
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":10:10)
    "func.return"(%5) : (tensor<?xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
