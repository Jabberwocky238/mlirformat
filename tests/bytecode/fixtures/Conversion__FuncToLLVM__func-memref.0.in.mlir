"builtin.module"() ({
  "func.func"() <{arg_attrs = [{llvm.noalias}, {llvm.noalias}], function_type = (memref<2xf32>, memref<2xf32>) -> (), sym_name = "check_noalias"}> ({
  ^bb0(%arg0: memref<2xf32> loc("<stdin>":3:8), %arg1: memref<2xf32> loc("<stdin>":3:30)):
    "func.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
