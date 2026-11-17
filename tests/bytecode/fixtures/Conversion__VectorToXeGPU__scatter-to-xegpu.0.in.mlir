"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (vector<8xf32>, memref<8x16x32xf32>, index, index, index, vector<8xindex>, vector<8xi1>) -> ()}> ({
    ^bb0(%arg0: vector<8xf32> loc("<stdin>":4:10), %arg1: memref<8x16x32xf32> loc("<stdin>":4:32), %arg2: index loc("<stdin>":4:60), %arg3: index loc("<stdin>":4:74), %arg4: index loc("<stdin>":4:88), %arg5: vector<8xindex> loc("<stdin>":4:102), %arg6: vector<8xi1> loc("<stdin>":4:126)):
      "vector.scatter"(%arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg0) : (memref<8x16x32xf32>, index, index, index, vector<8xindex>, vector<8xi1>, vector<8xf32>) -> () loc("<stdin>":5:7)
      "gpu.return"() : () -> () loc("<stdin>":6:7)
    }) {sym_name = "store_1D_vector"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
