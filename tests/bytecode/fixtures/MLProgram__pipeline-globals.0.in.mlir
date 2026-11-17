"builtin.module"() ({
  "ml_program.global"() <{is_mutable, sym_name = "global_variable", sym_visibility = "private", type = tensor<4xi32>, value = dense<4> : tensor<4xi32>}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "global_double_load"}> ({
    %0 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32> loc("<stdin>":4:10)
    %1 = "ml_program.global_load"() <{global = @global_variable}> : () -> tensor<4xi32> loc("<stdin>":5:10)
    %2 = "unregistered.dummy"(%0, %1) : (tensor<4xi32>, tensor<4xi32>) -> tensor<4xi32> loc("<stdin>":6:10)
    "ml_program.global_store"(%2) <{global = @global_variable}> : (tensor<4xi32>) -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":1:1)
