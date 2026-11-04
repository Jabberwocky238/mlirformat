module {
  llvm.func @mgpuCreateSparseLtEnv()
  llvm.func @mgpuDestroySparseLtEnv()
  func.func @matmul24(%arg0: memref<16x32xf16>, %arg1: memref<32x16xf16>, %arg2: memref<16x16xf16>) {
    %cst = arith.constant 0.000000e+00 : f16
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c1048576 = arith.constant 1048576 : index
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] () : memref<16x32xf16>
    %memref_0, %asyncToken_1 = gpu.alloc async [%asyncToken] () : memref<32x16xf16>
    %memref_2, %asyncToken_3 = gpu.alloc async [%asyncToken_1] () : memref<16x16xf16>
    %1 = gpu.memcpy async [%asyncToken_3] %memref, %arg0 : memref<16x32xf16>, memref<16x32xf16>
    %2 = gpu.memcpy async [%1] %memref_0, %arg1 : memref<32x16xf16>, memref<32x16xf16>
    %3 = gpu.memcpy async [%2] %memref_2, %arg2 : memref<16x16xf16>, memref<16x16xf16>
    %spMat, %asyncToken_4 = gpu.create_2to4_spmat async [%3]{ PRUNE_AND_CHECK} %c16, %c32, %memref : memref<16x32xf16>
    %dnTensor, %asyncToken_5 = gpu.create_dn_tensor async [%asyncToken_4] %memref_0, %c32, %c16 : index, index into memref<32x16xf16>
    %dnTensor_6, %asyncToken_7 = gpu.create_dn_tensor async [%asyncToken_5] %memref_2, %c16, %c16 : index, index into memref<16x16xf16>
    %bufferSzs:3, %asyncToken_8 = gpu.spmm_buffer_size async [%asyncToken_7] %spMat, %dnTensor, %dnTensor_6 : index, index, index into f16
    %memref_9, %asyncToken_10 = gpu.alloc async [%asyncToken_8] (%bufferSzs#0) : memref<?xf16>
    %memref_11, %asyncToken_12 = gpu.alloc async [%asyncToken_10] (%bufferSzs#1) : memref<?xf16>
    %memref_13, %asyncToken_14 = gpu.alloc async [%asyncToken_12] (%bufferSzs#2) : memref<?xf16>
    %4 = gpu.spmm async [%asyncToken_14] %spMat, %dnTensor, %dnTensor_6, %memref_9, %memref_11, %memref_13 : memref<?xf16>, memref<?xf16>, memref<?xf16> into f16
    %5 = gpu.destroy_sp_mat async [%4] %spMat
    %6 = gpu.destroy_dn_tensor async [%5] %dnTensor
    %7 = gpu.destroy_dn_tensor async [%6] %dnTensor_6
    %8 = gpu.memcpy async [%7] %arg2, %memref_2 : memref<16x16xf16>, memref<16x16xf16>
    %9 = gpu.dealloc async [%8] %memref_2 : memref<16x16xf16>
    %10 = gpu.dealloc async [%9] %memref_0 : memref<32x16xf16>
    %11 = gpu.dealloc async [%10] %memref : memref<16x32xf16>
    %12 = gpu.dealloc async [%11] %memref_13 : memref<?xf16>
    %13 = gpu.dealloc async [%12] %memref_11 : memref<?xf16>
    %14 = gpu.dealloc async [%13] %memref_9 : memref<?xf16>
    gpu.wait [%14]
    return
  }
  func.func @main() {
    llvm.call @mgpuCreateSparseLtEnv() : () -> ()
    %cst = arith.constant 0.000000e+00 : f16
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %alloc = memref.alloc() : memref<16x32xf16>
    %alloc_0 = memref.alloc() : memref<32x16xf16>
    %alloc_1 = memref.alloc() : memref<16x16xf16>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        %cst_2 = arith.constant 0.000000e+00 : f16
        %0 = arith.addi %arg0, %arg1 : index
        %1 = arith.addi %0, %c1 : index
        %2 = arith.index_cast %1 : index to i32
        %3 = arith.sitofp %2 : i32 to f16
        %4 = arith.muli %arg1, %c2 : index
        %5 = arith.addi %4, %c1 : index
        memref.store %3, %alloc[%arg0, %4] : memref<16x32xf16>
        memref.store %cst_2, %alloc[%arg0, %5] : memref<16x32xf16>
      }
    }
    scf.for %arg0 = %c0 to %c8 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c1 {
        %0 = arith.subi %arg0, %arg1 : index
        %1 = arith.index_cast %0 : index to i32
        %2 = arith.sitofp %1 : i32 to f16
        %3 = arith.addi %arg0, %c8 : index
        memref.store %2, %alloc_0[%arg1, %arg0] : memref<32x16xf16>
        memref.store %2, %alloc_0[%arg1, %3] : memref<32x16xf16>
      }
    }
    scf.for %arg0 = %c0 to %c16 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        memref.store %cst, %alloc_1[%arg0, %arg1] : memref<16x16xf16>
      }
    }
    scf.for %arg0 = %c0 to %c16 step %c1 {
      %0 = vector.transfer_read %alloc[%arg0, %c0], %cst : memref<16x32xf16>, vector<32xf16>
      vector.print %0 : vector<32xf16>
    }
    scf.for %arg0 = %c0 to %c32 step %c1 {
      %0 = vector.transfer_read %alloc_0[%arg0, %c0], %cst : memref<32x16xf16>, vector<16xf16>
      vector.print %0 : vector<16xf16>
    }
    call @matmul24(%alloc, %alloc_0, %alloc_1) : (memref<16x32xf16>, memref<32x16xf16>, memref<16x16xf16>) -> ()
    scf.for %arg0 = %c0 to %c16 step %c1 {
      %0 = vector.transfer_read %alloc_1[%arg0, %c0], %cst : memref<16x16xf16>, vector<16xf16>
      vector.print %0 : vector<16xf16>
    }
    llvm.call @mgpuDestroySparseLtEnv() : () -> ()
    return
  }
}

