"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xf32>) -> f32, sym_name = "reduce_add_f32"}> ({
  ^bb0(%arg0: vector<16xf32> loc("<stdin>":3:8)):
    %0 = "vector.reduction"(%arg0) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<16xf32>) -> f32 loc("<stdin>":4:10)
    "func.return"(%0) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
