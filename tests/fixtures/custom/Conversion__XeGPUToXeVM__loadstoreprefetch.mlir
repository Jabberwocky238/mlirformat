module {
  gpu.module @test {
    gpu.func @load_gather_i64_src_value_offset(%arg0: i64, %arg1: vector<1xindex>, %arg2: memref<1xf16>, %arg3: vector<1xi1>) {
      %0 = xegpu.load %arg0[%arg1], %arg3 <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : i64, vector<1xindex>, vector<1xi1> -> vector<1xf16>
      %c0 = arith.constant 0 : index
      vector.store %0, %arg2[%c0] : memref<1xf16>, vector<1xf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @source_materialize_single_elem_vec(%arg0: i64, %arg1: vector<1xindex>, %arg2: memref<1xf16>, %arg3: vector<1xi1>) {
      %0 = xegpu.load %arg0[%arg1], %arg3 <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : i64, vector<1xindex>, vector<1xi1> -> vector<1xf16>
      %c0 = arith.constant 0 : index
      vector.store %0, %arg2[%c0] : memref<1xf16>, vector<1xf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @store_scatter_i64_src_value_offset(%arg0: i64, %arg1: vector<1xindex>, %arg2: vector<1xi1>) {
      %cst = arith.constant dense<2.900000e+00> : vector<1xf32>
      xegpu.store %cst, %arg0[%arg1], %arg2 <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : vector<1xf32>, i64, vector<1xindex>, vector<1xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @prefetch_i64_src_value_offset(%arg0: i64, %arg1: vector<1xindex>) {
      xegpu.prefetch %arg0[%arg1] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, offset_align_byte = 4 : i64}> : i64, vector<1xindex>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @prefetch_memref_src_value_offset(%arg0: memref<256xf32>, %arg1: vector<1xindex>) {
      xegpu.prefetch %arg0[%arg1] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : memref<256xf32>, vector<1xindex>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @load_gather_from_dyn_memref_subview(%arg0: memref<?xf16>, %arg1: vector<1xindex>, %arg2: vector<1xi1>, %arg3: memref<1xf16>) {
      %c0 = arith.constant 0 : index
      %0 = gpu.subgroup_id : index
      %subview = memref.subview %arg0[%0] [16] [1] : memref<?xf16> to memref<16xf16, strided<[1], offset: ?>>
      %1 = xegpu.load %subview[%arg1], %arg2 <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : memref<16xf16, strided<[1], offset: ?>>, vector<1xindex>, vector<1xi1> -> vector<1xf16>
      vector.store %1, %arg3[%c0] : memref<1xf16>, vector<1xf16>
      gpu.return
    }
  }
}

