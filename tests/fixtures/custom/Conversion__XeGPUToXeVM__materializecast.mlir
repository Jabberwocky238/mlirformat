module {
  gpu.module @materializecast {
    gpu.func @materialize_memref(%arg0: memref<128xf32>) kernel {
      %c0 = arith.constant 0 : index
      %true = arith.constant true
      %0 = xegpu.load %arg0[%c0], %true  : memref<128xf32>, index, i1 -> f32
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @materializecast {
    gpu.func @materialize_ui64(%arg0: ui64) kernel {
      %c0 = arith.constant 0 : index
      %true = arith.constant true
      %0 = xegpu.load %arg0[%c0], %true  : ui64, index, i1 -> vector<1xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @materializecast {
    gpu.func @materialize_ui32(%arg0: ui32) kernel {
      %c0 = arith.constant 0 : index
      %true = arith.constant true
      %0 = xegpu.load %arg0[%c0], %true  : ui32, index, i1 -> vector<1xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @materializecast {
    gpu.func @materialize_single_index_vector(%arg0: memref<128xf32>) kernel {
      %cst = arith.constant dense<0> : vector<1xindex>
      %cst_0 = arith.constant dense<true> : vector<1xi1>
      %0 = xegpu.load %arg0[%cst], %cst_0  : memref<128xf32>, vector<1xindex>, vector<1xi1> -> vector<1xf32>
      gpu.return
    }
  }
}

