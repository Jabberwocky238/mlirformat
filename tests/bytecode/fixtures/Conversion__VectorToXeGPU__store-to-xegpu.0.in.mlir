"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>, memref<8x16x32xf32>, index) -> (), sym_name = "store_1D_vector"}> ({
  ^bb0(%arg0: vector<8xf32> loc("<stdin>":3:8), %arg1: memref<8x16x32xf32> loc("<stdin>":3:30), %arg2: index loc("<stdin>":3:58)):
    "vector.store"(%arg0, %arg1, %arg2, %arg2, %arg2) : (vector<8xf32>, memref<8x16x32xf32>, index, index, index) -> () loc("<stdin>":4:5)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
