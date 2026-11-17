"builtin.module"() ({
  "func.func"() <{function_type = (vector<[8]xf32>, vector<[8]xf32>) -> vector<[8]x[8]xf32>, sym_name = "outerproduct_f32_scalable_8x8_no_acc"}> ({
  ^bb0(%arg0: vector<[8]xf32> loc("<stdin>":3:8), %arg1: vector<[8]xf32> loc("<stdin>":3:32)):
    %0 = "vector.outerproduct"(%arg0, %arg1) <{kind = #vector.kind<add>}> : (vector<[8]xf32>, vector<[8]xf32>) -> vector<[8]x[8]xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<[8]x[8]xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
