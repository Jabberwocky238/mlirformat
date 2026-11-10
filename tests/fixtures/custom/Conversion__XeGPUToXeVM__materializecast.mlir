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

// -----
module {
  gpu.module @materializecast [#xevm.target<chip = "pvc">] {
    gpu.func @materialize_element_to_2D_single_element_vector(%arg0: memref<128xf32>) kernel {
      %c0 = arith.constant 0 : index
      %alloca = memref.alloca() : memref<512xi8, 3>
      %0 = xegpu.create_mem_desc %alloca : memref<512xi8, 3> -> !xegpu.mem_desc<8x16xf32>
      %1 = xegpu.load_matrix %0[%c0, %c0] : !xegpu.mem_desc<8x16xf32>, index, index -> vector<1x1xf32>
      %2 = vector.shape_cast %1 : vector<1x1xf32> to vector<1xf32>
      vector.store %2, %arg0[%c0] : memref<128xf32>, vector<1xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @materializecast [#xevm.target<chip = "pvc">] {
    gpu.func @materialize_2D_single_element_vector_to_element(%arg0: memref<512xi8, 3>) kernel {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<1x1xf32>
      %0 = xegpu.create_mem_desc %arg0 : memref<512xi8, 3> -> !xegpu.mem_desc<8x16xf32>
      xegpu.store_matrix %cst, %0[%c0, %c0] : vector<1x1xf32>, !xegpu.mem_desc<8x16xf32>, index, index
      gpu.return
    }
  }
}

