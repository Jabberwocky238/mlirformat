"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "arm_streaming"}> ({
    "func.return"() : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "not_arm_streaming"}> ({
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) {llvm.enable_arm_streaming_ignore} : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = () -> (), sym_name = "requires_arm_streaming"}> ({
    %5 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xi32> loc("<stdin>":9:10)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = () -> (), sym_name = "does_not_require_arm_streaming"}> ({
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<[4]xf32>) -> vector<[4]xf32>, sym_name = "contains_scalable_vectors"}> ({
  ^bb0(%arg9: vector<[4]xf32> loc("<stdin>":16:8)):
    %4 = "arith.addf"(%arg9, %arg9) <{fastmath = #arith.fastmath<none>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32> loc("<stdin>":17:10)
    "func.return"(%4) : (vector<[4]xf32>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xf32>, sym_name = "no_scalable_vectors"}> ({
  ^bb0(%arg8: vector<4xf32> loc("<stdin>":21:8)):
    %3 = "arith.addf"(%arg8, %arg8) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32> loc("<stdin>":22:10)
    "func.return"(%3) : (vector<4xf32>) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (memref<?xf32>, vector<[4]xindex>, vector<[4]xi1>, vector<[4]xf32>) -> vector<[4]xf32>, sym_name = "contains_gather"}> ({
  ^bb0(%arg4: memref<?xf32> loc("<stdin>":26:8), %arg5: vector<[4]xindex> loc("<stdin>":26:30), %arg6: vector<[4]xi1> loc("<stdin>":26:56), %arg7: vector<[4]xf32> loc("<stdin>":26:79)):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":27:10)
    %2 = "vector.gather"(%arg4, %1, %arg5, %arg6, %arg7) : (memref<?xf32>, index, vector<[4]xindex>, vector<[4]xi1>, vector<[4]xf32>) -> vector<[4]xf32> loc("<stdin>":28:10)
    "func.return"(%2) : (vector<[4]xf32>) -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (memref<?xf32>, vector<[4]xindex>, vector<[4]xi1>, vector<[4]xf32>) -> (), sym_name = "contains_scatter"}> ({
  ^bb0(%arg0: memref<?xf32> loc("<stdin>":32:8), %arg1: vector<[4]xindex> loc("<stdin>":32:30), %arg2: vector<[4]xi1> loc("<stdin>":32:56), %arg3: vector<[4]xf32> loc("<stdin>":32:79)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":33:10)
    "vector.scatter"(%arg0, %0, %arg1, %arg2, %arg3) : (memref<?xf32>, index, vector<[4]xindex>, vector<[4]xi1>, vector<[4]xf32>) -> () loc("<stdin>":34:5)
    "func.return"() : () -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":31:3)
}) : () -> () loc("<stdin>":1:1)
