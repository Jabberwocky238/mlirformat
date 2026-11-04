module attributes {gpu.container_module} {
  func.func @matvec(%arg0: index) {
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] (%arg0) : memref<?xindex>
    %memref_0, %asyncToken_1 = gpu.alloc async [%asyncToken] (%arg0) : memref<?xf64>
    %spmat, %asyncToken_2 = gpu.create_coo async [%asyncToken_1] %arg0, %arg0, %arg0, %memref, %memref, %memref_0 : memref<?xindex>, memref<?xindex>, memref<?xf64>
    %dnTensor, %asyncToken_3 = gpu.create_dn_tensor async [%asyncToken_2] %memref_0, %arg0 : index into memref<?xf64>
    %bufferSz, %asyncToken_4 = gpu.spmv_buffer_size async [%asyncToken_3] %spmat, %dnTensor, %dnTensor into f64
    %1 = gpu.spmv async [%asyncToken_4] %spmat, %dnTensor, %dnTensor, %memref_0 : memref<?xf64> into f64
    %2 = gpu.destroy_sp_mat async [%1] %spmat
    %3 = gpu.destroy_dn_tensor async [%2] %dnTensor
    gpu.wait [%3]
    return
  }
  func.func @matmul(%arg0: index) {
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] (%arg0) : memref<?xindex>
    %memref_0, %asyncToken_1 = gpu.alloc async [%asyncToken] (%arg0) : memref<?xf64>
    %spmat, %asyncToken_2 = gpu.create_csr async [%asyncToken_1] %arg0, %arg0, %arg0, %memref, %memref, %memref_0 : memref<?xindex>, memref<?xindex>, memref<?xf64>
    %dnTensor, %asyncToken_3 = gpu.create_dn_tensor async [%asyncToken_2] %memref_0, %arg0, %arg0 : index, index into memref<?xf64>
    %bufferSzs, %asyncToken_4 = gpu.spmm_buffer_size async [%asyncToken_3] %spmat, %dnTensor, %dnTensor : index into f64
    %1 = gpu.spmm async [%asyncToken_4] %spmat, %dnTensor, %dnTensor, %memref_0 : memref<?xf64> into f64
    %2 = gpu.destroy_sp_mat async [%1] %spmat
    %3 = gpu.destroy_dn_tensor async [%2] %dnTensor
    gpu.wait [%3]
    return
  }
  func.func @spgemm(%arg0: index) {
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] (%arg0) : memref<?xindex>
    %memref_0, %asyncToken_1 = gpu.alloc async [%asyncToken] (%arg0) : memref<?xf32>
    %spmat, %asyncToken_2 = gpu.create_csr async [%asyncToken_1] %arg0, %arg0, %arg0, %memref, %memref, %memref_0 : memref<?xindex>, memref<?xindex>, memref<?xf32>
    %spmat_3, %asyncToken_4 = gpu.create_csr async [%asyncToken_2] %arg0, %arg0, %arg0, %memref, %memref, %memref_0 : memref<?xindex>, memref<?xindex>, memref<?xf32>
    %spmat_5, %asyncToken_6 = gpu.create_csr async [%asyncToken_4] %arg0, %arg0, %arg0, %memref, %memref, %memref_0 : memref<?xindex>, memref<?xindex>, memref<?xf32>
    %desc, %asyncToken_7 = gpu.spgemm_create_descr async [%asyncToken_6]
    %alloc = memref.alloc() : memref<0xi8>
    %c0 = arith.constant 0 : index
    %bufferSzNew, %asyncToken_8 = gpu.spgemm_work_estimation_or_compute async [%asyncToken_7]{ WORK_ESTIMATION} %spmat, %spmat_3, %spmat_5, %desc, %c0, %alloc : f32 into memref<0xi8>
    %bufferSzNew_9, %asyncToken_10 = gpu.spgemm_work_estimation_or_compute async [%asyncToken_8]{ COMPUTE} %spmat, %spmat_3, %spmat_5, %desc, %c0, %alloc : f32 into memref<0xi8>
    %rows, %cols, %nnz, %asyncToken_11 = gpu.spmat_get_size async [%asyncToken_10] %spmat_5
    %1 = gpu.set_csr_pointers async [%asyncToken_10] %spmat_5, %memref, %memref, %memref_0 : memref<?xindex>, memref<?xindex>, memref<?xf32>
    %2 = gpu.spgemm_copy async [%1] %spmat, %spmat_3, %spmat_5, %desc : f32
    %3 = gpu.spgemm_destroy_descr async [%2] %desc
    %4 = gpu.destroy_sp_mat async [%3] %spmat
    %5 = gpu.destroy_sp_mat async [%4] %spmat_3
    %6 = gpu.destroy_sp_mat async [%5] %spmat_5
    gpu.wait [%6]
    return
  }
  func.func @sddmm(%arg0: index) {
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] (%arg0) : memref<?xindex>
    %memref_0, %asyncToken_1 = gpu.alloc async [%asyncToken] (%arg0) : memref<?xf64>
    %spmat, %asyncToken_2 = gpu.create_csr async [%asyncToken_1] %arg0, %arg0, %arg0, %memref, %memref, %memref_0 : memref<?xindex>, memref<?xindex>, memref<?xf64>
    %dnTensor, %asyncToken_3 = gpu.create_dn_tensor async [%asyncToken_2] %memref_0, %arg0, %arg0 : index, index into memref<?xf64>
    %bufferSz, %asyncToken_4 = gpu.sddmm_buffer_size async [%asyncToken_3] %dnTensor, %dnTensor, %spmat into f64
    %1 = gpu.sddmm async [%asyncToken_4] %dnTensor, %dnTensor, %spmat, %memref_0 : memref<?xf64> into f64
    %2 = gpu.destroy_sp_mat async [%1] %spmat
    %3 = gpu.destroy_dn_tensor async [%2] %dnTensor
    gpu.wait [%3]
    return
  }
  func.func @csc_and_bsr(%arg0: index) {
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] (%arg0) : memref<?xindex>
    %memref_0, %asyncToken_1 = gpu.alloc async [%asyncToken] (%arg0) : memref<?xf64>
    %spmat, %asyncToken_2 = gpu.create_csc async [%asyncToken_1] %arg0, %arg0, %arg0, %memref, %memref, %memref_0 : memref<?xindex>, memref<?xindex>, memref<?xf64>
    %spmat_3, %asyncToken_4 = gpu.create_bsr async [%asyncToken_2] %arg0, %arg0, %arg0, %arg0, %arg0, %memref, %memref, %memref_0 : memref<?xindex>, memref<?xindex>, memref<?xf64>
    %1 = gpu.destroy_sp_mat async [%asyncToken_4] %spmat
    %2 = gpu.destroy_sp_mat async [%1] %spmat_3
    gpu.wait [%2]
    return
  }
}

