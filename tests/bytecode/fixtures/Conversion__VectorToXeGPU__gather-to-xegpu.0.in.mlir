"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<8x16x32xf32>, index, index, index, vector<8xindex>, vector<8xi1>, vector<8xf32>) -> vector<8xf32>}> ({
    ^bb0(%arg0: memref<8x16x32xf32> loc("<stdin>":4:10), %arg1: index loc("<stdin>":4:38), %arg2: index loc("<stdin>":4:52), %arg3: index loc("<stdin>":4:66), %arg4: vector<8xindex> loc("<stdin>":4:80), %arg5: vector<8xi1> loc("<stdin>":4:104), %arg6: vector<8xf32> loc("<stdin>":4:125)):
      %0 = "vector.gather"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6) : (memref<8x16x32xf32>, index, index, index, vector<8xindex>, vector<8xi1>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":5:12)
      "gpu.return"(%0) : (vector<8xf32>) -> () loc("<stdin>":6:7)
    }) {sym_name = "load_1D_vector"} : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
