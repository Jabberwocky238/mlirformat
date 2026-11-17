"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, tensor<?xf32>, index, index, index) -> (tensor<?xf32>, tensor<?xf32>), sym_name = "scf_for"}> ({
  ^bb0(%arg0: tensor<?xf32> loc("<stdin>":3:8), %arg1: tensor<?xf32> loc("<stdin>":3:30), %arg2: index loc("<stdin>":3:52), %arg3: index loc("<stdin>":3:66), %arg4: index loc("<stdin>":3:80)):
    %0:2 = "scf.for"(%arg2, %arg3, %arg4, %arg0, %arg1) ({
    ^bb0(%arg5: index loc("<stdin>":5:10), %arg6: tensor<?xf32> loc("<stdin>":5:24), %arg7: tensor<?xf32> loc("<stdin>":5:46)):
      "scf.yield"(%arg6, %arg7) : (tensor<?xf32>, tensor<?xf32>) -> () loc("<stdin>":6:7)
    }) : (index, index, index, tensor<?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>) loc("<stdin>":4:12)
    "func.return"(%0#0, %0#1) : (tensor<?xf32>, tensor<?xf32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
