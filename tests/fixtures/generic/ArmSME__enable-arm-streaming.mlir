"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "arm_streaming"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "not_arm_streaming"}> ({
    "func.return"() : () -> ()
  }) {llvm.enable_arm_streaming_ignore} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "requires_arm_streaming"}> ({
    %5 = "arm_sme.get_tile"() : () -> vector<[4]x[4]xi32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "does_not_require_arm_streaming"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<[4]xf32>) -> vector<[4]xf32>, sym_name = "contains_scalable_vectors"}> ({
  ^bb0(%arg9: vector<[4]xf32>):
    %4 = "arith.addf"(%arg9, %arg9) <{fastmath = #arith.fastmath<none>}> : (vector<[4]xf32>, vector<[4]xf32>) -> vector<[4]xf32>
    "func.return"(%4) : (vector<[4]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xf32>, sym_name = "no_scalable_vectors"}> ({
  ^bb0(%arg8: vector<4xf32>):
    %3 = "arith.addf"(%arg8, %arg8) <{fastmath = #arith.fastmath<none>}> : (vector<4xf32>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%3) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, vector<[4]xindex>, vector<[4]xi1>, vector<[4]xf32>) -> vector<[4]xf32>, sym_name = "contains_gather"}> ({
  ^bb0(%arg4: memref<?xf32>, %arg5: vector<[4]xindex>, %arg6: vector<[4]xi1>, %arg7: vector<[4]xf32>):
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "vector.gather"(%arg4, %1, %arg5, %arg6, %arg7) : (memref<?xf32>, index, vector<[4]xindex>, vector<[4]xi1>, vector<[4]xf32>) -> vector<[4]xf32>
    "func.return"(%2) : (vector<[4]xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, vector<[4]xindex>, vector<[4]xi1>, vector<[4]xf32>) -> (), sym_name = "contains_scatter"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: vector<[4]xindex>, %arg2: vector<[4]xi1>, %arg3: vector<[4]xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    "vector.scatter"(%arg0, %0, %arg1, %arg2, %arg3) : (memref<?xf32>, index, vector<[4]xindex>, vector<[4]xi1>, vector<[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

