module attributes {gpu.container_module} {
  func.func @matmul(%arg0: index) {
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] (%arg0) : memref<?xf16>
    %memref_0, %asyncToken_1 = gpu.alloc async [%asyncToken] (%arg0) : memref<?xf16>
    %spMat, %asyncToken_2 = gpu.create_2to4_spmat async [%asyncToken_1]{PRUNE_AND_CHECK} %arg0, %arg0, %memref : memref<?xf16>
    %dnTensor, %asyncToken_3 = gpu.create_dn_tensor async [%asyncToken_2] %memref_0, %arg0, %arg0 : index, index into memref<?xf16>
    %bufferSzs:3, %asyncToken_4 = gpu.spmm_buffer_size async [%asyncToken_3] %spMat, %dnTensor, %dnTensor : index, index, index into f16
    %1 = gpu.spmm async [%asyncToken_4] %spMat, %dnTensor, %dnTensor, %memref_0, %memref_0, %memref_0 : memref<?xf16>, memref<?xf16>, memref<?xf16> into f16
    %2 = gpu.destroy_sp_mat async [%1] %spMat
    %3 = gpu.destroy_dn_tensor async [%2] %dnTensor
    gpu.wait [%3]
    return
  }
}

