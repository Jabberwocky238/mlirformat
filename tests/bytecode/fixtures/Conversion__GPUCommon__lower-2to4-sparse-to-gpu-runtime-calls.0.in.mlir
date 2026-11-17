"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "matmul"}> ({
  ^bb0(%arg0: index loc("<stdin>":3:8)):
    %0 = "gpu.wait"() : () -> !gpu.async.token loc("<stdin>":4:10)
    %1:2 = "gpu.alloc"(%0, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (!gpu.async.token, index) -> (memref<?xf16>, !gpu.async.token) loc("<stdin>":5:12)
    %2:2 = "gpu.alloc"(%1#1, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 0>}> : (!gpu.async.token, index) -> (memref<?xf16>, !gpu.async.token) loc("<stdin>":6:12)
    %3:2 = "gpu.create_2to4_spmat"(%2#1, %arg0, %arg0, %1#0) <{pruneFlag = #gpu<prune_2to4_spmat_flag PRUNE_AND_CHECK>}> : (!gpu.async.token, index, index, memref<?xf16>) -> (!gpu.sparse.spmat_handle, !gpu.async.token) loc("<stdin>":7:12)
    %4:2 = "gpu.create_dn_tensor"(%3#1, %2#0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 2>}> : (!gpu.async.token, memref<?xf16>, index, index) -> (!gpu.sparse.dntensor_handle, !gpu.async.token) loc("<stdin>":8:12)
    %5:4 = "gpu.spmm_buffer_size"(%4#1, %3#0, %4#0, %4#0) <{computeType = f16, modeA = #gpu<mat_transpose_mode NON_TRANSPOSE>, modeB = #gpu<mat_transpose_mode NON_TRANSPOSE>, resultSegmentSizes = array<i32: 3, 1>}> : (!gpu.async.token, !gpu.sparse.spmat_handle, !gpu.sparse.dntensor_handle, !gpu.sparse.dntensor_handle) -> (index, index, index, !gpu.async.token) loc("<stdin>":9:12)
    %6 = "gpu.spmm"(%5#3, %3#0, %4#0, %4#0, %2#0, %2#0, %2#0) <{computeType = f16, modeA = #gpu<mat_transpose_mode NON_TRANSPOSE>, modeB = #gpu<mat_transpose_mode NON_TRANSPOSE>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 3>}> : (!gpu.async.token, !gpu.sparse.spmat_handle, !gpu.sparse.dntensor_handle, !gpu.sparse.dntensor_handle, memref<?xf16>, memref<?xf16>, memref<?xf16>) -> !gpu.async.token loc("<stdin>":10:10)
    %7 = "gpu.destroy_sp_mat"(%6, %3#0) : (!gpu.async.token, !gpu.sparse.spmat_handle) -> !gpu.async.token loc("<stdin>":11:10)
    %8 = "gpu.destroy_dn_tensor"(%7, %4#0) : (!gpu.async.token, !gpu.sparse.dntensor_handle) -> !gpu.async.token loc("<stdin>":12:10)
    "gpu.wait"(%8) : (!gpu.async.token) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":2:3)
}) {gpu.container_module} : () -> () loc("<stdin>":1:1)
