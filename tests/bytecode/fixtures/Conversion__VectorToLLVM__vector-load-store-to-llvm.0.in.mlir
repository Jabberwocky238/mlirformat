"builtin.module"() ({
  "func.func"() <{function_type = (memref<200x100xf32>, index, index) -> vector<8xf32>, sym_name = "load"}> ({
  ^bb0(%arg0: memref<200x100xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:36), %arg2: index loc("<stdin>":3:50)):
    %0 = "vector.load"(%arg0, %arg1, %arg2) : (memref<200x100xf32>, index, index) -> vector<8xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<8xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
