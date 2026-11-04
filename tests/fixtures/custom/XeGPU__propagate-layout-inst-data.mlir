module {
  gpu.module @test {
    func.func @load_store_no_array_len(%arg0: memref<8x32xf32>, %arg1: memref<8x32xf32>) {
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x32xf32> -> !xegpu.tensor_desc<8x32xf32>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<8x32xf32> -> !xegpu.tensor_desc<8x32xf32>
      xegpu.prefetch_nd %0 <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<8x32xf32>
      %2 = xegpu.load_nd %0  : !xegpu.tensor_desc<8x32xf32> -> vector<8x32xf32>
      xegpu.store_nd %2, %1  : vector<8x32xf32>, !xegpu.tensor_desc<8x32xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @dpas_f16(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xf32>
      %0 = xegpu.create_nd_tdesc %arg0[%c0, %c0] : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.create_nd_tdesc %arg1[%c0, %c0] : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16>
      %2 = xegpu.load_nd %0  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %3 = xegpu.load_nd %1  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %4 = xegpu.dpas %2, %3, %cst : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
      %5 = xegpu.create_nd_tdesc %arg2[%c0, %c0] : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %4, %5  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @elementwise_with_inst_data_only(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf16>) {
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %0 = arith.muli %block_id_x, %c32 : index
      %1 = xegpu.create_nd_tdesc %arg0[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16>
      %2 = xegpu.create_nd_tdesc %arg1[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16>
      %3 = xegpu.create_nd_tdesc %arg2[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16>
      %4:3 = scf.for %arg3 = %c0 to %c1024 step %c32 iter_args(%arg4 = %1, %arg5 = %2, %arg6 = %3) -> (!xegpu.tensor_desc<16x32xf16>, !xegpu.tensor_desc<16x32xf16>, !xegpu.tensor_desc<16x32xf16>) {
        %5 = xegpu.load_nd %arg4  : !xegpu.tensor_desc<16x32xf16> -> vector<16x32xf16>
        %6 = xegpu.load_nd %arg5  : !xegpu.tensor_desc<16x32xf16> -> vector<16x32xf16>
        %7 = arith.addf %5, %6 : vector<16x32xf16>
        xegpu.store_nd %7, %arg6  : vector<16x32xf16>, !xegpu.tensor_desc<16x32xf16>
        %8 = xegpu.update_nd_offset %arg4, [%c0, %c32] : !xegpu.tensor_desc<16x32xf16>
        %9 = xegpu.update_nd_offset %arg5, [%c0, %c32] : !xegpu.tensor_desc<16x32xf16>
        %10 = xegpu.update_nd_offset %arg6, [%c0, %c32] : !xegpu.tensor_desc<16x32xf16>
        scf.yield %8, %9, %10 : !xegpu.tensor_desc<16x32xf16>, !xegpu.tensor_desc<16x32xf16>, !xegpu.tensor_desc<16x32xf16>
      }
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @elementwise_with_inst_data_12(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf16>) {
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %0 = arith.muli %block_id_x, %c32 : index
      %1 = xegpu.create_nd_tdesc %arg0[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<12x32xf16>
      %2 = xegpu.create_nd_tdesc %arg1[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<12x32xf16>
      %3 = xegpu.create_nd_tdesc %arg2[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<12x32xf16>
      %4:3 = scf.for %arg3 = %c0 to %c1024 step %c32 iter_args(%arg4 = %1, %arg5 = %2, %arg6 = %3) -> (!xegpu.tensor_desc<12x32xf16>, !xegpu.tensor_desc<12x32xf16>, !xegpu.tensor_desc<12x32xf16>) {
        %5 = xegpu.load_nd %arg4  : !xegpu.tensor_desc<12x32xf16> -> vector<12x32xf16>
        %6 = xegpu.load_nd %arg5  : !xegpu.tensor_desc<12x32xf16> -> vector<12x32xf16>
        %7 = arith.addf %5, %6 : vector<12x32xf16>
        xegpu.store_nd %7, %arg6  : vector<12x32xf16>, !xegpu.tensor_desc<12x32xf16>
        %8 = xegpu.update_nd_offset %arg4, [%c0, %c32] : !xegpu.tensor_desc<12x32xf16>
        %9 = xegpu.update_nd_offset %arg5, [%c0, %c32] : !xegpu.tensor_desc<12x32xf16>
        %10 = xegpu.update_nd_offset %arg6, [%c0, %c32] : !xegpu.tensor_desc<12x32xf16>
        scf.yield %8, %9, %10 : !xegpu.tensor_desc<12x32xf16>, !xegpu.tensor_desc<12x32xf16>, !xegpu.tensor_desc<12x32xf16>
      }
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @scatter_ops_chunksize(%arg0: memref<256xf16>) {
      %cst = arith.constant dense<true> : vector<16xi1>
      %cst_0 = arith.constant dense<12> : vector<16xindex>
      %0 = xegpu.load %arg0[%cst_0], %cst <{chunk_size = 8 : i64}> : memref<256xf16>, vector<16xindex>, vector<16xi1> -> vector<16x8xf16>
      xegpu.store %0, %arg0[%cst_0], %cst <{chunk_size = 8 : i64}> : vector<16x8xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>
      return
    }
  }
}

