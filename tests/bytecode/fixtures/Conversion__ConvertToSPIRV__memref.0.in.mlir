"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, memref<f32>) -> (), sym_name = "load_store_float_rank_zero"}> ({
  ^bb0(%arg8: memref<f32> loc("<stdin>":3:8), %arg9: memref<f32> loc("<stdin>":3:28)):
    %3 = "memref.load"(%arg8) : (memref<f32>) -> f32 loc("<stdin>":4:10)
    "memref.store"(%3, %arg9) : (f32, memref<f32>) -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<4xi32>, memref<4xi32>, index) -> (), sym_name = "load_store_int_rank_one"}> ({
  ^bb0(%arg5: memref<4xi32> loc("<stdin>":9:8), %arg6: memref<4xi32> loc("<stdin>":9:30), %arg7: index loc("<stdin>":9:52)):
    %2 = "memref.load"(%arg5, %arg7) : (memref<4xi32>, index) -> i32 loc("<stdin>":10:10)
    "memref.store"(%2, %arg6, %arg7) : (i32, memref<4xi32>, index) -> () loc("<stdin>":11:5)
    "func.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (memref<8xi32>, memref<8xi32>, index) -> (), sym_name = "load_store_larger_memref"}> ({
  ^bb0(%arg2: memref<8xi32> loc("<stdin>":15:8), %arg3: memref<8xi32> loc("<stdin>":15:30), %arg4: index loc("<stdin>":15:52)):
    %1 = "memref.load"(%arg2, %arg4) : (memref<8xi32>, index) -> i32 loc("<stdin>":16:10)
    "memref.store"(%1, %arg3, %arg4) : (i32, memref<8xi32>, index) -> () loc("<stdin>":17:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (memref<vector<4xi32>>, memref<vector<4xi32>>) -> (), sym_name = "load_store_vector"}> ({
  ^bb0(%arg0: memref<vector<4xi32>> loc("<stdin>":21:8), %arg1: memref<vector<4xi32>> loc("<stdin>":21:38)):
    %0 = "memref.load"(%arg0) : (memref<vector<4xi32>>) -> vector<4xi32> loc("<stdin>":22:10)
    "memref.store"(%0, %arg1) : (vector<4xi32>, memref<vector<4xi32>>) -> () loc("<stdin>":23:5)
    "func.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":20:3)
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
