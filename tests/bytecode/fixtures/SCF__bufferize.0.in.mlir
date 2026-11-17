"builtin.module"() ({
  "func.func"() <{function_type = (i1, tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>, sym_name = "if"}> ({
  ^bb0(%arg0: i1 loc("<stdin>":3:8), %arg1: tensor<?xf32> loc("<stdin>":3:19), %arg2: tensor<?xf32> loc("<stdin>":3:41)):
    %0 = "scf.if"(%arg0) ({
      "scf.yield"(%arg1) : (tensor<?xf32>) -> () loc("<stdin>":5:7)
    }, {
      "scf.yield"(%arg2) : (tensor<?xf32>) -> () loc("<stdin>":7:7)
    }) : (i1) -> tensor<?xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<?xf32>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
