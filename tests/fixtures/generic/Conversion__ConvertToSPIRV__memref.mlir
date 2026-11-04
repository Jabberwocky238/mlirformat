"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, memref<f32>) -> (), sym_name = "load_store_float_rank_zero"}> ({
  ^bb0(%arg8: memref<f32>, %arg9: memref<f32>):
    %3 = "memref.load"(%arg8) : (memref<f32>) -> f32
    "memref.store"(%3, %arg9) : (f32, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4xi32>, memref<4xi32>, index) -> (), sym_name = "load_store_int_rank_one"}> ({
  ^bb0(%arg5: memref<4xi32>, %arg6: memref<4xi32>, %arg7: index):
    %2 = "memref.load"(%arg5, %arg7) : (memref<4xi32>, index) -> i32
    "memref.store"(%2, %arg6, %arg7) : (i32, memref<4xi32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xi32>, memref<8xi32>, index) -> (), sym_name = "load_store_larger_memref"}> ({
  ^bb0(%arg2: memref<8xi32>, %arg3: memref<8xi32>, %arg4: index):
    %1 = "memref.load"(%arg2, %arg4) : (memref<8xi32>, index) -> i32
    "memref.store"(%1, %arg3, %arg4) : (i32, memref<8xi32>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<vector<4xi32>>, memref<vector<4xi32>>) -> (), sym_name = "load_store_vector"}> ({
  ^bb0(%arg0: memref<vector<4xi32>>, %arg1: memref<vector<4xi32>>):
    %0 = "memref.load"(%arg0) : (memref<vector<4xi32>>) -> vector<4xi32>
    "memref.store"(%0, %arg1) : (vector<4xi32>, memref<vector<4xi32>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], [SPV_KHR_storage_buffer_storage_class]>, #spirv.resource_limits<>>} : () -> ()

