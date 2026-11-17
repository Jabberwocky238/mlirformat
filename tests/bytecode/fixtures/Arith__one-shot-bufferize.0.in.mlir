"builtin.module"() ({
  "func.func"() <{arg_attrs = [{bufferization.writable = true}, {bufferization.writable = true}, {}], function_type = (tensor<?xf32>, tensor<?xf32>, i1) -> (tensor<?xf32>, tensor<?xf32>), sym_name = "write_to_select_op_source"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":3:8), %arg1: tensor<?xf32> loc("<stdin>":3:30), %arg2: i1 loc("<stdin>":3:52)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":4:10)
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %2 = "tensor.insert"(%0, %arg0, %1) : (f32, tensor<?xf32>, index) -> tensor<?xf32> loc("<stdin>":6:10)
    %3 = "arith.select"(%arg2, %arg0, %arg1) : (i1, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":7:10)
    "func.return"(%3, %2) : (tensor<?xf32>, tensor<?xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
