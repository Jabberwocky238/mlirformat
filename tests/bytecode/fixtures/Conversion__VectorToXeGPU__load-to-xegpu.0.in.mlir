"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x16x32xf32>, index) -> vector<8xf32>, sym_name = "load_1D_vector"}> ({
  ^bb0(%arg0: memref<8x16x32xf32> loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:36)):
    %0 = "vector.load"(%arg0, %arg1, %arg1, %arg1) : (memref<8x16x32xf32>, index, index, index) -> vector<8xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (vector<8xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
