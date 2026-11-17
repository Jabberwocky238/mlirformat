"builtin.module"() ({
  "ml_program.global"() <{is_mutable, sym_name = "global", sym_visibility = "private", type = tensor<i64>, value = dense<0> : tensor<i64>}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> i64, sym_name = "global_load_store"}> ({
    %0 = "arith.constant"() <{value = 127 : i64}> : () -> i64 loc("<stdin>":4:10)
    %1 = "ml_program.global_load"() <{global = @global}> : () -> tensor<i64> loc("<stdin>":5:10)
    %2 = "tensor.extract"(%1) : (tensor<i64>) -> i64 loc("<stdin>":6:10)
    %3 = "arith.muli"(%2, %0) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64 loc("<stdin>":7:10)
    %4 = "tensor.insert"(%3, %1) : (i64, tensor<i64>) -> tensor<i64> loc("<stdin>":8:10)
    "ml_program.global_store"(%4) <{global = @global}> : (tensor<i64>) -> () loc("<stdin>":9:5)
    "func.return"(%3) : (i64) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":1:1)
