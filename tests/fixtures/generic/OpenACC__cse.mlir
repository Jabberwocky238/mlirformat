"builtin.module"() ({
  "func.func"() <{function_type = (memref<10xf32>, index) -> (f32, f32), sym_name = "cse_across_acc_set"}> ({
  ^bb0(%arg0: memref<10xf32>, %arg1: index):
    %0 = "memref.load"(%arg0, %arg1) : (memref<10xf32>, index) -> f32
    %1 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    "acc.set"(%1) <{operandSegmentSizes = array<i32: 0, 1, 0>}> : (i32) -> ()
    %2 = "memref.load"(%arg0, %arg1) : (memref<10xf32>, index) -> f32
    "func.return"(%0, %2) : (f32, f32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (memref<8xf32, #gpu.address_space<workgroup>>, memref<8xf32, #gpu.address_space<workgroup>>), sym_name = "cse_gpu_shared_memory_not_merged"}> ({
    %0 = "acc.gpu_shared_memory"() <{num_copies = 1 : i64, static_upper_bound_bytes = 256 : i64}> : () -> memref<8xf32, #gpu.address_space<workgroup>>
    %1 = "acc.gpu_shared_memory"() <{num_copies = 1 : i64, static_upper_bound_bytes = 256 : i64}> : () -> memref<8xf32, #gpu.address_space<workgroup>>
    "func.return"(%0, %1) : (memref<8xf32, #gpu.address_space<workgroup>>, memref<8xf32, #gpu.address_space<workgroup>>) -> ()
  }) : () -> ()
}) : () -> ()

