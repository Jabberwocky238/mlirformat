"builtin.module"() ({
  "gpu.module"() <{sym_name = "kernels"}> ({
    "gpu.func"() <{function_type = (memref<32x32xf16, #spirv.storage_class<StorageBuffer>>) -> (), kernel}> ({
    ^bb0(%arg25: memref<32x32xf16, #spirv.storage_class<StorageBuffer>> loc("<stdin>":4:10)):
      %27 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":5:13)
      %28 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":6:13)
      %29 = "gpu.subgroup_mma_load_matrix"(%arg25, %27, %28) <{leadDimension = 32 : index}> : (memref<32x32xf16, #spirv.storage_class<StorageBuffer>>, index, index) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":7:13)
      %30 = "gpu.subgroup_mma_load_matrix"(%arg25, %27, %28) <{leadDimension = 32 : index, transpose}> : (memref<32x32xf16, #spirv.storage_class<StorageBuffer>>, index, index) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":8:13)
      "gpu.return"() : () -> () loc("<stdin>":9:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>, sym_name = "gpu_wmma_load_op"} : () -> () loc("<stdin>":3:5)
    "gpu.func"() <{function_type = (memref<32x32xf16, #spirv.storage_class<StorageBuffer>>, !gpu.mma_matrix<16x16xf16, "COp">) -> (), kernel}> ({
    ^bb0(%arg23: memref<32x32xf16, #spirv.storage_class<StorageBuffer>> loc("<stdin>":12:10), %arg24: !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":12:74)):
      %25 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":13:13)
      %26 = "arith.constant"() <{value = 16 : index}> : () -> index loc("<stdin>":14:13)
      "gpu.subgroup_mma_store_matrix"(%arg24, %arg23, %25, %26) <{leadDimension = 32 : index}> : (!gpu.mma_matrix<16x16xf16, "COp">, memref<32x32xf16, #spirv.storage_class<StorageBuffer>>, index, index) -> () loc("<stdin>":15:7)
      "gpu.subgroup_mma_store_matrix"(%arg24, %arg23, %25, %26) <{leadDimension = 32 : index, transpose}> : (!gpu.mma_matrix<16x16xf16, "COp">, memref<32x32xf16, #spirv.storage_class<StorageBuffer>>, index, index) -> () loc("<stdin>":16:7)
      "gpu.return"() : () -> () loc("<stdin>":17:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>, sym_name = "gpu_wmma_store_op"} : () -> () loc("<stdin>":11:5)
    "gpu.func"() <{function_type = (!gpu.mma_matrix<16x16xf16, "AOp">, !gpu.mma_matrix<16x16xf16, "BOp">, !gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>) -> (), kernel}> ({
    ^bb0(%arg19: !gpu.mma_matrix<16x16xf16, "AOp"> loc("<stdin>":20:10), %arg20: !gpu.mma_matrix<16x16xf16, "BOp"> loc("<stdin>":20:53), %arg21: !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":20:96), %arg22: memref<16x16xf16, #spirv.storage_class<StorageBuffer>> loc("<stdin>":20:139)):
      %23 = "gpu.subgroup_mma_compute"(%arg19, %arg20, %arg21) : (!gpu.mma_matrix<16x16xf16, "AOp">, !gpu.mma_matrix<16x16xf16, "BOp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":21:13)
      %24 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":22:13)
      "gpu.subgroup_mma_store_matrix"(%23, %arg22, %24, %24) <{leadDimension = 32 : index}> : (!gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>, index, index) -> () loc("<stdin>":23:7)
      "gpu.return"() : () -> () loc("<stdin>":24:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>, sym_name = "gpu_wmma_mma_op"} : () -> () loc("<stdin>":19:5)
    "gpu.func"() <{function_type = (!gpu.mma_matrix<16x16xsi8, "AOp">, !gpu.mma_matrix<16x16xsi8, "BOp">, !gpu.mma_matrix<16x16xi32, "COp">, memref<16x16xi32, #spirv.storage_class<StorageBuffer>>) -> (), kernel}> ({
    ^bb0(%arg15: !gpu.mma_matrix<16x16xsi8, "AOp"> loc("<stdin>":27:10), %arg16: !gpu.mma_matrix<16x16xsi8, "BOp"> loc("<stdin>":27:53), %arg17: !gpu.mma_matrix<16x16xi32, "COp"> loc("<stdin>":27:96), %arg18: memref<16x16xi32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":27:139)):
      %21 = "gpu.subgroup_mma_compute"(%arg15, %arg16, %arg17) : (!gpu.mma_matrix<16x16xsi8, "AOp">, !gpu.mma_matrix<16x16xsi8, "BOp">, !gpu.mma_matrix<16x16xi32, "COp">) -> !gpu.mma_matrix<16x16xi32, "COp"> loc("<stdin>":28:13)
      %22 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":29:13)
      "gpu.subgroup_mma_store_matrix"(%21, %arg18, %22, %22) <{leadDimension = 32 : index}> : (!gpu.mma_matrix<16x16xi32, "COp">, memref<16x16xi32, #spirv.storage_class<StorageBuffer>>, index, index) -> () loc("<stdin>":30:7)
      "gpu.return"() : () -> () loc("<stdin>":31:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>, sym_name = "gpu_wmma_signed_i8_mma_op"} : () -> () loc("<stdin>":26:5)
    "gpu.func"() <{function_type = (memref<16x16xf16, #spirv.storage_class<StorageBuffer>>) -> (), kernel}> ({
    ^bb0(%arg14: memref<16x16xf16, #spirv.storage_class<StorageBuffer>> loc("<stdin>":34:10)):
      %18 = "arith.constant"() <{value = 1.000000e+00 : f16}> : () -> f16 loc("<stdin>":35:13)
      %19 = "gpu.subgroup_mma_constant_matrix"(%18) : (f16) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":36:13)
      %20 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":37:13)
      "gpu.subgroup_mma_store_matrix"(%19, %arg14, %20, %20) <{leadDimension = 32 : index}> : (!gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>, index, index) -> () loc("<stdin>":38:7)
      "gpu.return"() : () -> () loc("<stdin>":39:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>, sym_name = "gpu_wmma_constant_op"} : () -> () loc("<stdin>":33:5)
    "gpu.func"() <{function_type = (!gpu.mma_matrix<16x16xf32, "AOp">, memref<16x16xf32, #spirv.storage_class<StorageBuffer>>) -> (), kernel}> ({
    ^bb0(%arg12: !gpu.mma_matrix<16x16xf32, "AOp"> loc("<stdin>":42:10), %arg13: memref<16x16xf32, #spirv.storage_class<StorageBuffer>> loc("<stdin>":42:53)):
      %16 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":43:13)
      %17 = "gpu.subgroup_mma_extract_thread_local"(%arg12, %16) : (!gpu.mma_matrix<16x16xf32, "AOp">, index) -> f32 loc("<stdin>":44:13)
      "memref.store"(%17, %arg13, %16, %16) : (f32, memref<16x16xf32, #spirv.storage_class<StorageBuffer>>, index, index) -> () loc("<stdin>":45:7)
      "gpu.return"() : () -> () loc("<stdin>":46:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>, sym_name = "gpu_wmma_extract_thread_local_op"} : () -> () loc("<stdin>":41:5)
    "gpu.func"() <{function_type = (f16, !gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>) -> (), kernel}> ({
    ^bb0(%arg9: f16 loc("<stdin>":49:10), %arg10: !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":49:22), %arg11: memref<16x16xf16, #spirv.storage_class<StorageBuffer>> loc("<stdin>":49:65)):
      %14 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":50:13)
      %15 = "gpu.subgroup_mma_insert_thread_local"(%arg9, %arg10, %14) : (f16, !gpu.mma_matrix<16x16xf16, "COp">, index) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":51:13)
      "gpu.subgroup_mma_store_matrix"(%15, %arg11, %14, %14) <{leadDimension = 16 : index}> : (!gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>, index, index) -> () loc("<stdin>":52:7)
      "gpu.return"() : () -> () loc("<stdin>":53:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>, sym_name = "gpu_wmma_insert_thread_local_op"} : () -> () loc("<stdin>":48:5)
    "gpu.func"() <{function_type = (!gpu.mma_matrix<16x16xf16, "COp">, !gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>) -> (), kernel}> ({
    ^bb0(%arg6: !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":56:10), %arg7: !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":56:52), %arg8: memref<16x16xf16, #spirv.storage_class<StorageBuffer>> loc("<stdin>":56:94)):
      %7 = "gpu.subgroup_mma_elementwise"(%arg6, %arg7) <{opType = #gpu<mma_element_wise addf>}> : (!gpu.mma_matrix<16x16xf16, "COp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":57:12)
      %8 = "gpu.subgroup_mma_elementwise"(%7) <{opType = #gpu<mma_element_wise negatef>}> : (!gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":58:12)
      %9 = "gpu.subgroup_mma_elementwise"(%8, %arg6) <{opType = #gpu<mma_element_wise divf>}> : (!gpu.mma_matrix<16x16xf16, "COp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":59:12)
      %10 = "gpu.subgroup_mma_elementwise"(%9, %arg6) <{opType = #gpu<mma_element_wise mulf>}> : (!gpu.mma_matrix<16x16xf16, "COp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":60:13)
      %11 = "gpu.subgroup_mma_elementwise"(%10) <{opType = #gpu<mma_element_wise extf>}> : (!gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf32, "COp"> loc("<stdin>":61:13)
      %12 = "gpu.subgroup_mma_elementwise"(%11) <{opType = #gpu<mma_element_wise truncf>}> : (!gpu.mma_matrix<16x16xf32, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":62:13)
      %13 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":63:13)
      "gpu.subgroup_mma_store_matrix"(%12, %arg8, %13, %13) <{leadDimension = 32 : index}> : (!gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>, index, index) -> () loc("<stdin>":64:7)
      "gpu.return"() : () -> () loc("<stdin>":65:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>, sym_name = "gpu_wmma_elementwise_op_default"} : () -> () loc("<stdin>":55:5)
    "gpu.func"() <{function_type = (!gpu.mma_matrix<16x16xf16, "COp">, f16, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>) -> (), kernel}> ({
    ^bb0(%arg3: !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":68:10), %arg4: f16 loc("<stdin>":68:52), %arg5: memref<16x16xf16, #spirv.storage_class<StorageBuffer>> loc("<stdin>":68:64)):
      %3 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":69:12)
      %4 = "gpu.subgroup_mma_constant_matrix"(%arg4) : (f16) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":70:12)
      %5 = "gpu.subgroup_mma_elementwise"(%arg3, %4) <{opType = #gpu<mma_element_wise mulf>}> : (!gpu.mma_matrix<16x16xf16, "COp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":71:12)
      "gpu.subgroup_mma_store_matrix"(%5, %arg5, %3, %3) <{leadDimension = 32 : index}> : (!gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>, index, index) -> () loc("<stdin>":72:7)
      %6 = "gpu.subgroup_mma_elementwise"(%4, %5) <{opType = #gpu<mma_element_wise mulf>}> : (!gpu.mma_matrix<16x16xf16, "COp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":73:12)
      "gpu.subgroup_mma_store_matrix"(%6, %arg5, %3, %3) <{leadDimension = 32 : index}> : (!gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>, index, index) -> () loc("<stdin>":74:7)
      "gpu.return"() : () -> () loc("<stdin>":75:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>, sym_name = "gpu_wmma_elementwise_op_matrix_times_scalar"} : () -> () loc("<stdin>":67:5)
    "gpu.func"() <{function_type = (!gpu.mma_matrix<16x16xf16, "COp">, f16, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>) -> (), kernel}> ({
    ^bb0(%arg0: !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":78:10), %arg1: f16 loc("<stdin>":78:52), %arg2: memref<16x16xf16, #spirv.storage_class<StorageBuffer>> loc("<stdin>":78:64)):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":79:12)
      %1 = "gpu.subgroup_mma_constant_matrix"(%arg1) : (f16) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":80:12)
      %2 = "gpu.subgroup_mma_elementwise"(%arg0, %1) <{opType = #gpu<mma_element_wise addf>}> : (!gpu.mma_matrix<16x16xf16, "COp">, !gpu.mma_matrix<16x16xf16, "COp">) -> !gpu.mma_matrix<16x16xf16, "COp"> loc("<stdin>":81:12)
      "gpu.subgroup_mma_store_matrix"(%2, %arg2, %0, %0) <{leadDimension = 32 : index}> : (!gpu.mma_matrix<16x16xf16, "COp">, memref<16x16xf16, #spirv.storage_class<StorageBuffer>>, index, index) -> () loc("<stdin>":82:7)
      "gpu.return"() : () -> () loc("<stdin>":83:7)
    }) {spirv.entry_point_abi = #spirv.entry_point_abi<workgroup_size = [32, 4, 1]>, sym_name = "gpu_wmma_elementwise_op_matrix_plus_scalar"} : () -> () loc("<stdin>":77:5)
  }) : () -> () loc("<stdin>":2:3)
}) {gpu.container_module, spirv.target_env = #spirv.target_env<#spirv.vce<v1.6, [Shader, CooperativeMatrixKHR, Float16, Int8], [SPV_KHR_storage_buffer_storage_class, SPV_KHR_cooperative_matrix]>, #spirv.resource_limits<>>} : () -> () loc("<stdin>":1:1)
