"builtin.module"() ({
  "func.func"() <{arg_attrs = [{bufferization.writable = false}, {bufferization.writable = true}, {}, {}, {}], function_type = (tensor<?xf32>, tensor<?xf32>, index, index, index) -> (tensor<?xf32>, tensor<?xf32>), sym_name = "scf_for_yield_only"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":3:8), %arg1: tensor<?xf32> loc("<stdin>":3:30), %arg2: index loc("<stdin>":3:52), %arg3: index loc("<stdin>":3:66), %arg4: index loc("<stdin>":3:80)):
    %0 = "scf.for"(%arg2, %arg3, %arg4, %arg0) ({
    ^bb0(%arg7: index loc("<stdin>":5:10), %arg8: tensor<?xf32> loc("<stdin>":5:24)):
      "scf.yield"(%arg8) : (tensor<?xf32>) -> () loc("<stdin>":6:7)
    }) : (index, index, index, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":4:10)
    %1 = "scf.for"(%arg2, %arg3, %arg4, %arg1) ({
    ^bb0(%arg5: index loc("<stdin>":9:10), %arg6: tensor<?xf32> loc("<stdin>":9:24)):
      "scf.yield"(%arg6) : (tensor<?xf32>) -> () loc("<stdin>":10:7)
    }) : (index, index, index, tensor<?xf32>) -> tensor<?xf32> loc("<stdin>":8:10)
    "func.return"(%0, %1) : (tensor<?xf32>, tensor<?xf32>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
