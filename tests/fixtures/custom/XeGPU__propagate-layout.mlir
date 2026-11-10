module {
  gpu.module @test {
    func.func @dpas_f16(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %3 = xegpu.load_nd %1[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %4 = xegpu.dpas %2, %3, %cst : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
      %5 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %4, %5[0, 0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @dpas_f16_result_f16(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf16>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xf16>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %3 = xegpu.load_nd %1[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %4 = xegpu.dpas %2, %3, %cst : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf16> -> vector<8x16xf16>
      %5 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      xegpu.store_nd %4, %5[0, 0]  : vector<8x16xf16>, !xegpu.tensor_desc<8x16xf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @dpas_i8(%arg0: vector<8x32xi8>, %arg1: vector<32x16xi8>, %arg2: memref<8x16xi32>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.dpas %arg0, %arg1 : vector<8x32xi8>, vector<32x16xi8> -> vector<8x16xi32>
      %1 = xegpu.create_nd_tdesc %arg2 : memref<8x16xi32> -> !xegpu.tensor_desc<8x16xi32>
      xegpu.store_nd %0, %1[0, 0]  : vector<8x16xi32>, !xegpu.tensor_desc<8x16xi32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @load_with_transpose_effect(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %3 = xegpu.load_nd %1[0, 0] <{transpose = array<i64: 1, 0>}> : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %4 = xegpu.dpas %2, %3, %cst : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
      %5 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %4, %5[0, 0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_transpose(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %3 = xegpu.load_nd %1[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %4 = vector.transpose %3, [1, 0] : vector<16x16xf16> to vector<16x16xf16>
      %5 = xegpu.dpas %2, %4, %cst : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
      %6 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %5, %6[0, 0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @extf_truncf(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>) -> vector<8x16xf32> {
      %0 = xegpu.load_nd %arg0[0, 0]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %1 = xegpu.load_nd %arg1[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %2 = arith.extf %1 : vector<16x16xf16> to vector<16x16xf32>
      %3 = arith.truncf %2 : vector<16x16xf32> to vector<16x16xf16>
      %4 = xegpu.dpas %0, %3 : vector<8x16xf16>, vector<16x16xf16> -> vector<8x16xf32>
      %5 = xegpu.convert_layout %4 <{input_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x16xf32>
      return %4 : vector<8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @load_gather_with_coalesce_chunksize(%arg0: memref<8x16xf16>, %arg1: memref<256xf16>, %arg2: memref<8x16xf32>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %cst = arith.constant dense<0> : vector<16x16xindex>
      %cst_0 = arith.constant dense<true> : vector<16x16xi1>
      %2 = xegpu.load %arg1[%cst], %cst_0  : memref<256xf16>, vector<16x16xindex>, vector<16x16xi1> -> vector<16x16xf16>
      %3 = vector.transpose %2, [1, 0] : vector<16x16xf16> to vector<16x16xf16>
      %4 = xegpu.dpas %1, %3 : vector<8x16xf16>, vector<16x16xf16> -> vector<8x16xf32>
      %5 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %4, %5[0, 0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @scatter_ops_coalesce_chunksize(%arg0: memref<128xf16>) {
      %cst = arith.constant dense<true> : vector<16x8xi1>
      %cst_0 = arith.constant dense<12> : vector<16x8xindex>
      %0 = xegpu.load %arg0[%cst_0], %cst  : memref<128xf16>, vector<16x8xindex>, vector<16x8xi1> -> vector<16x8xf16>
      xegpu.store %0, %arg0[%cst_0], %cst  : vector<16x8xf16>, memref<128xf16>, vector<16x8xindex>, vector<16x8xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @scatter_ops(%arg0: memref<256xf16>) {
      %cst = arith.constant dense<true> : vector<16xi1>
      %cst_0 = arith.constant dense<12> : vector<16xindex>
      %0 = xegpu.load %arg0[%cst_0], %cst  : memref<256xf16>, vector<16xindex>, vector<16xi1> -> vector<16xf16>
      xegpu.store %0, %arg0[%cst_0], %cst  : vector<16xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @scatter_ops_custom_perm_layout(%arg0: memref<256xf16>) {
      %cst = arith.constant dense<true> : vector<16xi1>
      %cst_0 = arith.constant dense<12> : vector<16xindex>
      %0 = xegpu.load %arg0[%cst_0], %cst  : memref<256xf16>, vector<16xindex>, vector<16xi1> -> vector<16xf16>
      %1 = arith.addf %0, %0 : vector<16xf16>
      xegpu.store %1, %arg0[%cst_0], %cst <{layout = #xegpu.layout<lane_layout = [8], lane_data = [1]>}> : vector<16xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @scatter_ops_preserve_load_perm_layout(%arg0: memref<256xf16>) {
      %cst = arith.constant dense<true> : vector<16xi1>
      %cst_0 = arith.constant dense<12> : vector<16xindex>
      %0 = xegpu.load %arg0[%cst_0], %cst <{layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : memref<256xf16>, vector<16xindex>, vector<16xi1> -> vector<16xf16>
      %1 = arith.addf %0, %0 : vector<16xf16>
      xegpu.store %1, %arg0[%cst_0], %cst <{layout = #xegpu.layout<lane_layout = [8], lane_data = [1]>}> : vector<16xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_bitcast_i16_to_f16(%arg0: memref<8x16xi16>, %arg1: memref<16x16xi16>, %arg2: memref<8x16xf32>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xi16> -> !xegpu.tensor_desc<8x16xi16>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<16x16xi16> -> !xegpu.tensor_desc<16x16xi16>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x16xi16> -> vector<8x16xi16>
      %3 = xegpu.load_nd %1[0, 0]  : !xegpu.tensor_desc<16x16xi16> -> vector<16x16xi16>
      %4 = vector.bitcast %2 : vector<8x16xi16> to vector<8x16xf16>
      %5 = vector.bitcast %3 : vector<16x16xi16> to vector<16x16xf16>
      %6 = xegpu.dpas %4, %5 : vector<8x16xf16>, vector<16x16xf16> -> vector<8x16xf32>
      %7 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %6, %7[0, 0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_bitcast_i32_to_f16(%arg0: memref<8x16xf16>, %arg1: memref<16x8xi32>, %arg2: memref<8x16xf32>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<16x8xi32> -> !xegpu.tensor_desc<16x8xi32>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %3 = xegpu.load_nd %1[0, 0]  : !xegpu.tensor_desc<16x8xi32> -> vector<16x8xi32>
      %4 = vector.bitcast %3 : vector<16x8xi32> to vector<16x16xf16>
      %5 = vector.transpose %4, [1, 0] : vector<16x16xf16> to vector<16x16xf16>
      %6 = xegpu.dpas %2, %5 : vector<8x16xf16>, vector<16x16xf16> -> vector<8x16xf32>
      %7 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %6, %7[0, 0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_bitcast_i16_to_i32(%arg0: memref<8x32xi16>, %arg1: memref<8x16xi32>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x32xi16> -> !xegpu.tensor_desc<8x32xi16>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<8x16xi32> -> !xegpu.tensor_desc<8x16xi32>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x32xi16> -> vector<8x32xi16>
      %3 = vector.bitcast %2 : vector<8x32xi16> to vector<8x16xi32>
      xegpu.store_nd %3, %1[0, 0]  : vector<8x16xi32>, !xegpu.tensor_desc<8x16xi32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_bitcast_require_cross_lane_shuffle(%arg0: memref<8x16xi32>, %arg1: memref<8x32xi16>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xi32> -> !xegpu.tensor_desc<8x16xi32>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<8x32xi16> -> !xegpu.tensor_desc<8x32xi16>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x16xi32> -> vector<8x16xi32>
      %3 = vector.bitcast %2 : vector<8x16xi32> to vector<8x32xi16>
      xegpu.store_nd %3, %1[0, 0]  : vector<8x32xi16>, !xegpu.tensor_desc<8x32xi16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @binary_op_one_use(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>, %arg2: !xegpu.tensor_desc<8x16xf32>) {
      %0 = xegpu.load_nd %arg0[0, 0]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %1 = xegpu.load_nd %arg1[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %2 = xegpu.load_nd %arg1[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %3 = arith.addf %1, %2 : vector<16x16xf16>
      %4 = xegpu.dpas %0, %3 : vector<8x16xf16>, vector<16x16xf16> -> vector<8x16xf32>
      xegpu.store_nd %4, %arg2[0, 0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @binary_op_multiple_uses(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>, %arg2: !xegpu.tensor_desc<8x16xf32>, %arg3: !xegpu.tensor_desc<16x16xf16>) {
      %0 = xegpu.load_nd %arg0[0, 0]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %1 = xegpu.load_nd %arg1[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %cst = arith.constant dense<1.000000e+00> : vector<16x16xf16>
      %2 = arith.addf %1, %cst : vector<16x16xf16>
      %3 = xegpu.dpas %0, %2 : vector<8x16xf16>, vector<16x16xf16> -> vector<8x16xf32>
      xegpu.store_nd %3, %arg2[0, 0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %2, %arg3[0, 0]  : vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @for_op(%arg0: memref<8x128xf16>, %arg1: memref<128x16xf16>, %arg2: memref<8x16xf32>) {
      %c0 = arith.constant 0 : index
      %c128 = arith.constant 128 : index
      %c16 = arith.constant 16 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x128xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<128x16xf16> -> !xegpu.tensor_desc<16x16xf16>
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xf32>
      %2 = scf.for %arg3 = %c0 to %c128 step %c16 iter_args(%arg4 = %cst) -> (vector<8x16xf32>) {
        %4 = xegpu.load_nd %0[0, %arg3]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
        %5 = xegpu.load_nd %1[%arg3, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
        %6 = xegpu.dpas %4, %5, %arg4 : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
        scf.yield %6 : vector<8x16xf32>
      }
      %3 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %2, %3[0, 0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @if_single_use(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>, %arg2: i1, %arg3: !xegpu.tensor_desc<8x16xf32>) {
      %0 = xegpu.load_nd %arg0[0, 0]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %1 = scf.if %arg2 -> (vector<16x16xf16>) {
        %3 = xegpu.load_nd %arg1[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
        scf.yield %3 : vector<16x16xf16>
      } else {
        %3 = xegpu.load_nd %arg1[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
        scf.yield %3 : vector<16x16xf16>
      }
      %2 = xegpu.dpas %0, %1 : vector<8x16xf16>, vector<16x16xf16> -> vector<8x16xf32>
      xegpu.store_nd %2, %arg3[0, 0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @if_multiple_uses(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>, %arg2: i1, %arg3: !xegpu.tensor_desc<8x16xf32>, %arg4: !xegpu.tensor_desc<16x16xf16>) {
      %0 = xegpu.load_nd %arg0[0, 0]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %1 = scf.if %arg2 -> (vector<16x16xf16>) {
        %3 = xegpu.load_nd %arg1[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
        scf.yield %3 : vector<16x16xf16>
      } else {
        %3 = xegpu.load_nd %arg1[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
        scf.yield %3 : vector<16x16xf16>
      }
      %2 = xegpu.dpas %0, %1 : vector<8x16xf16>, vector<16x16xf16> -> vector<8x16xf32>
      xegpu.store_nd %2, %arg3[0, 0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %1, %arg4[0, 0]  : vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_outer_reduction(%arg0: vector<16x16xf32>, %arg1: memref<256xf32>) {
      %cst = arith.constant dense<0.000000e+00> : vector<16xf32>
      %cst_0 = arith.constant dense<true> : vector<16xi1>
      %0 = vector.step : vector<16xindex>
      %1 = vector.multi_reduction <add>, %arg0, %cst [0] : vector<16x16xf32> to vector<16xf32>
      xegpu.store %1, %arg1[%0], %cst_0  : vector<16xf32>, memref<256xf32>, vector<16xindex>, vector<16xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_inner_reduction(%arg0: vector<16x16xf32>, %arg1: memref<256xf32>) {
      %cst = arith.constant dense<0.000000e+00> : vector<16xf32>
      %cst_0 = arith.constant dense<true> : vector<16xi1>
      %0 = vector.step : vector<16xindex>
      %1 = vector.multi_reduction <add>, %arg0, %cst [1] : vector<16x16xf32> to vector<16xf32>
      xegpu.store %1, %arg1[%0], %cst_0  : vector<16xf32>, memref<256xf32>, vector<16xindex>, vector<16xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @store_with_offset(%arg0: memref<256xf32>) {
      %c32 = arith.constant 32 : index
      %cst = arith.constant dense<true> : vector<16xi1>
      %0 = vector.step : vector<16xindex>
      %cst_0 = arith.constant dense<1.000000e+00> : vector<16xf32>
      xegpu.store %cst_0, %arg0[%0], %cst  : vector<16xf32>, memref<256xf32>, vector<16xindex>, vector<16xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @store_nd_with_offset_2d(%arg0: memref<256x256xf32>) {
      %c32 = arith.constant 32 : index
      %cst = arith.constant dense<1.000000e+00> : vector<16x16xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x256xf32> -> !xegpu.tensor_desc<16x16xf32>
      xegpu.store_nd %cst, %0[%c32, %c32]  : vector<16x16xf32>, !xegpu.tensor_desc<16x16xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @prefetch_2d(%arg0: memref<256x256xf16>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x256xf16> -> !xegpu.tensor_desc<16x16xf16>
      xegpu.prefetch_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<16x16xf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @prefetch_1d(%arg0: memref<256xf16>) {
      %0 = vector.step : vector<16xindex>
      xegpu.prefetch %arg0[%0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : memref<256xf16>, vector<16xindex>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @scf_while_and_condition(%arg0: memref<256xf32>, %arg1: memref<256xf32>) {
      %c0_i32 = arith.constant 0 : i32
      %c16_i32 = arith.constant 16 : i32
      %c16 = arith.constant 16 : index
      %c256_i32 = arith.constant 256 : i32
      %cst = arith.constant dense<true> : vector<16xi1>
      %0 = vector.step : vector<16xindex>
      %1 = xegpu.load %arg0[%0], %cst  : memref<256xf32>, vector<16xindex>, vector<16xi1> -> vector<16xf32>
      %2:2 = scf.while (%arg2 = %1, %arg3 = %c0_i32) : (vector<16xf32>, i32) -> (vector<16xf32>, i32) {
        %3 = arith.cmpi slt, %arg3, %c256_i32 : i32
        scf.condition(%3) %arg2, %arg3 : vector<16xf32>, i32
      } do {
      ^bb0(%arg2: vector<16xf32>, %arg3: i32):
        xegpu.store %arg2, %arg1[%0], %cst  : vector<16xf32>, memref<256xf32>, vector<16xindex>, vector<16xi1>
        %3 = arith.addi %arg3, %c16_i32 : i32
        %4 = arith.index_cast %3 : i32 to index
        %5 = vector.broadcast %4 : index to vector<16xindex>
        %6 = xegpu.load %arg0[%0], %cst  : memref<256xf32>, vector<16xindex>, vector<16xi1> -> vector<16xf32>
        scf.yield %6, %3 : vector<16xf32>, i32
      }
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_shape_cast_1d_to_2d_dim1_distributed(%arg0: !xegpu.tensor_desc<16x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<16xf16>
      %0 = xegpu.load_nd %arg0[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %1 = vector.multi_reduction <add>, %0, %cst [0] : vector<16x16xf16> to vector<16xf16>
      %2 = vector.shape_cast %1 : vector<16xf16> to vector<1x16xf16>
      %3 = vector.broadcast %2 : vector<1x16xf16> to vector<16x16xf16>
      xegpu.store_nd %3, %arg1[0, 0]  : vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_shape_cast_1d_to_2d_dim0_broadcasted(%arg0: !xegpu.tensor_desc<16x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<16xf16>
      %0 = xegpu.load_nd %arg0[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %1 = vector.multi_reduction <add>, %0, %cst [1] : vector<16x16xf16> to vector<16xf16>
      %2 = vector.shape_cast %1 : vector<16xf16> to vector<16x1xf16>
      %3 = vector.broadcast %2 : vector<16x1xf16> to vector<16x16xf16>
      xegpu.store_nd %3, %arg1[0, 0]  : vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @broadcast_both_leadingdims_innerdims(%arg0: memref<32x2x192xf32>, %arg1: memref<32x2x192xf32>, %arg2: memref<32x2x192xf32>) kernel attributes {known_block_size = array<i32: 768, 1, 1>, known_grid_size = array<i32: 16, 1, 1>} {
      %cst = arith.constant dense<1.000000e+00> : vector<1x1x1x16xf32>
      %cst_0 = arith.constant dense<true> : vector<1x1x1x16xi1>
      %c6 = arith.constant 6 : index
      %intptr = memref.extract_aligned_pointer_as_index %arg2 : memref<32x2x192xf32> -> index
      %0 = arith.index_cast %intptr : index to i64
      %1 = gpu.subgroup_id : index
      %2 = arith.remui %1, %c6 : index
      %3 = arith.remui %2, %c6 : index
      %4 = vector.step : vector<1xindex>
      %5 = vector.broadcast %3 : index to vector<1xindex>
      %6 = arith.addi %4, %5 : vector<1xindex>
      %7 = vector.broadcast %6 : vector<1xindex> to vector<1x1x1x16xindex>
      xegpu.store %cst, %0[%7], %cst_0 <{chunk_size = 1 : i64}> : vector<1x1x1x16xf32>, i64, vector<1x1x1x16xindex>, vector<1x1x1x16xi1>
      xegpu.store %cst, %0[%7], %cst_0 <{chunk_size = 1 : i64}> : vector<1x1x1x16xf32>, i64, vector<1x1x1x16xindex>, vector<1x1x1x16xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_shape_cast_expand_non_unit_dims(%arg0: memref<128xf16>, %arg1: memref<16xf16>) {
      %cst = arith.constant dense<true> : vector<128xi1>
      %0 = vector.step : vector<128xindex>
      %1 = xegpu.load %arg0[%0], %cst  : memref<128xf16>, vector<128xindex>, vector<128xi1> -> vector<128xf16>
      %2 = vector.shape_cast %1 : vector<128xf16> to vector<1x8x16xf16>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<8x16xf16>
      %cst_1 = arith.constant dense<0.000000e+00> : vector<16xf16>
      %3 = vector.multi_reduction <add>, %2, %cst_0 [0] : vector<1x8x16xf16> to vector<8x16xf16>
      %4 = vector.multi_reduction <add>, %3, %cst_1 [0] : vector<8x16xf16> to vector<16xf16>
      %cst_2 = arith.constant dense<true> : vector<16xi1>
      %cst_3 = arith.constant dense<1> : vector<16xindex>
      xegpu.store %4, %arg1[%cst_3], %cst_2 <{layout = #xegpu.layout<lane_layout = [16], lane_data = [1]>}> : vector<16xf16>, memref<16xf16>, vector<16xindex>, vector<16xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_2d_reduction_with_fractional_subgroup_size(%arg0: memref<1024xf16>, %arg1: memref<16xf16>) {
      %cst = arith.constant dense<true> : vector<1xi1>
      %0 = vector.step : vector<1xindex>
      %1 = xegpu.load %arg0[%0], %cst  : memref<1024xf16>, vector<1xindex>, vector<1xi1> -> vector<1xf16>
      %2 = vector.shape_cast %1 : vector<1xf16> to vector<1x1x1xf16>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<1xf16>
      %3 = vector.multi_reduction <add>, %2, %cst_0 [1, 2] : vector<1x1x1xf16> to vector<1xf16>
      %cst_1 = arith.constant dense<true> : vector<1xi1>
      %cst_2 = arith.constant dense<1> : vector<1xindex>
      xegpu.store %3, %arg1[%cst_2], %cst_1  : vector<1xf16>, memref<16xf16>, vector<1xindex>, vector<1xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_2d_reduction_scalar(%arg0: memref<1024xf16>, %arg1: memref<16xf16>) {
      %cst = arith.constant dense<true> : vector<1xi1>
      %0 = vector.step : vector<1xindex>
      %1 = xegpu.load %arg0[%0], %cst  : memref<1024xf16>, vector<1xindex>, vector<1xi1> -> vector<1xf16>
      %2 = vector.shape_cast %1 : vector<1xf16> to vector<1x1x1xf16>
      %cst_0 = arith.constant 0.000000e+00 : f16
      %3 = vector.multi_reduction <add>, %2, %cst_0 [0, 1, 2] : vector<1x1x1xf16> to f16
      %true = arith.constant true
      %c1 = arith.constant 1 : index
      xegpu.store %3, %arg1[%c1], %true  : f16, memref<16xf16>, index, i1
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_reduction_scalar(%arg0: memref<1024xf16>, %arg1: memref<16xf16>) {
      %cst = arith.constant dense<true> : vector<16xi1>
      %0 = vector.step : vector<16xindex>
      %1 = xegpu.load %arg0[%0], %cst  : memref<1024xf16>, vector<16xindex>, vector<16xi1> -> vector<16xf16>
      %2 = vector.reduction <add>, %1 : vector<16xf16> into f16
      %true = arith.constant true
      %c1 = arith.constant 1 : index
      xegpu.store %2, %arg1[%c1], %true  : f16, memref<16xf16>, index, i1
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_2d_reduction_with_fractional_subgroup_size_1x4(%arg0: memref<1024xf16>, %arg1: memref<16xf16>) {
      %cst = arith.constant dense<true> : vector<4xi1>
      %0 = vector.step : vector<4xindex>
      %1 = xegpu.load %arg0[%0], %cst  : memref<1024xf16>, vector<4xindex>, vector<4xi1> -> vector<4xf16>
      %2 = vector.shape_cast %1 : vector<4xf16> to vector<1x4xf16>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<1xf16>
      %3 = vector.multi_reduction <add>, %2, %cst_0 [1, 2] : vector<1x4xf16> to vector<1xf16>
      %cst_1 = arith.constant dense<true> : vector<1xi1>
      %cst_2 = arith.constant dense<1> : vector<1xindex>
      xegpu.store %3, %arg1[%cst_2], %cst_1  : vector<1xf16>, memref<16xf16>, vector<1xindex>, vector<1xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_reduction_broadcast_transpose(%arg0: memref<1024x64xf32>, %arg1: memref<1024x64xf32>) {
      %cst = arith.constant dense<0.000000e+00> : vector<1xf32>
      %cst_0 = arith.constant dense<0xFF800000> : vector<1x16xf32>
      %cst_1 = arith.constant dense<0.000000e+00> : vector<8xf32>
      %c0 = arith.constant 0 : index
      %0 = vector.multi_reduction <add>, %cst_0, %cst [1] : vector<1x16xf32> to vector<1xf32>
      %1 = vector.insert_strided_slice %0, %cst_1 {offsets = [0], strides = [1]} : vector<1xf32> into vector<8xf32>
      %2 = arith.addf %1, %cst_1 : vector<8xf32>
      %3 = vector.broadcast %2 : vector<8xf32> to vector<16x8xf32>
      %4 = vector.transpose %3, [1, 0] : vector<16x8xf32> to vector<8x16xf32>
      %5 = xegpu.create_nd_tdesc %arg1 : memref<1024x64xf32> -> !xegpu.tensor_desc<8x16xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      xegpu.store_nd %4, %5[%c0, %c0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_shape_cast_expand_and_merge(%arg0: memref<256xf16>, %arg1: memref<256xf16>) {
      %cst = arith.constant dense<true> : vector<256xi1>
      %0 = vector.step : vector<256xindex>
      %1 = xegpu.load %arg0[%0], %cst  : memref<256xf16>, vector<256xindex>, vector<256xi1> -> vector<256xf16>
      %2 = vector.shape_cast %1 : vector<256xf16> to vector<2x4x32xf16>
      %3 = vector.shape_cast %2 : vector<2x4x32xf16> to vector<1x256xf16>
      %4 = vector.shape_cast %3 : vector<1x256xf16> to vector<256xf16>
      xegpu.store %4, %arg1[%0], %cst <{layout = #xegpu.layout<lane_layout = [16], lane_data = [2]>}> : vector<256xf16>, memref<256xf16>, vector<256xindex>, vector<256xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_broadcast_1d_to_2d_broadcast_along_row(%arg0: !xegpu.tensor_desc<16x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<16xf16>
      %0 = xegpu.load_nd %arg0[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %1 = vector.multi_reduction <add>, %0, %cst [0] : vector<16x16xf16> to vector<16xf16>
      %2 = vector.broadcast %1 : vector<16xf16> to vector<16x16xf16>
      xegpu.store_nd %2, %arg1[0, 0]  : vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_broadcast_2d_to_2d_along_column(%arg0: !xegpu.tensor_desc<16x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<16xf16>
      %0 = xegpu.load_nd %arg0[0, 0]  : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %1 = vector.multi_reduction <add>, %0, %cst [1] : vector<16x16xf16> to vector<16xf16>
      %2 = vector.shape_cast %1 : vector<16xf16> to vector<16x1xf16>
      %3 = math.exp %2 : vector<16x1xf16>
      %4 = vector.broadcast %3 : vector<16x1xf16> to vector<16x16xf16>
      xegpu.store_nd %4, %arg1[0, 0]  : vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_broadcast_scalar_to_vector(%arg0: !xegpu.tensor_desc<16x16xf16>) {
      %cst = arith.constant 0.000000e+00 : f16
      %0 = vector.broadcast %cst : f16 to vector<16x16xf16>
      xegpu.store_nd %0, %arg0[0, 0]  : vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @store_matrix(%arg0: !xegpu.mem_desc<16x64xf16>) {
      %cst = arith.constant dense<0.000000e+00> : vector<16x16xf16>
      xegpu.store_matrix %cst, %arg0[8, 8] : vector<16x16xf16>, !xegpu.mem_desc<16x64xf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @insert_strided_slice_lane_layout_no_packing(%arg0: memref<4x64xf32>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<1.000000e+00> : vector<2x32xf32>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<4x64xf32>
      %0 = vector.insert_strided_slice %cst, %cst_0 {offsets = [0, 0], strides = [1, 1]} : vector<2x32xf32> into vector<4x64xf32>
      %1 = xegpu.create_nd_tdesc %arg0 : memref<4x64xf32> -> !xegpu.tensor_desc<4x64xf32>
      xegpu.store_nd %0, %1[0, 0]  : vector<4x64xf32>, !xegpu.tensor_desc<4x64xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @insert_strided_slice_lane_layout_with_packing(%arg0: memref<4x64xf16>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<1.000000e+00> : vector<2x32xf16>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<4x64xf16>
      %0 = vector.insert_strided_slice %cst, %cst_0 {offsets = [0, 0], strides = [1, 1]} : vector<2x32xf16> into vector<4x64xf16>
      %1 = xegpu.create_nd_tdesc %arg0 : memref<4x64xf16> -> !xegpu.tensor_desc<4x64xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>>
      xegpu.store_nd %0, %1[0, 0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>}> : vector<4x64xf16>, !xegpu.tensor_desc<4x64xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 2]>>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @insert_strided_slice_with_slice_layout(%arg0: memref<8x16xf32>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<1.000000e+00> : vector<1xf32>
      %cst_0 = arith.constant dense<1.000000e+00> : vector<16xf32>
      %0 = vector.insert_strided_slice %cst, %cst_0 {offsets = [15], strides = [1]} : vector<1xf32> into vector<16xf32>
      %1 = vector.extract_strided_slice %0 {offsets = [0], sizes = [8], strides = [1]} : vector<16xf32> to vector<8xf32>
      %2 = vector.broadcast %1 : vector<8xf32> to vector<16x8xf32>
      %3 = vector.transpose %2, [1, 0] : vector<16x8xf32> to vector<8x16xf32>
      %4 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %3, %4[0, 0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @load_store_matrix(%arg0: !xegpu.mem_desc<64x128xf32>, %arg1: i1) {
      %c0 = arith.constant 0 : index
      scf.if %arg1 {
        %0 = xegpu.load_matrix %arg0[%c0, %c0] : !xegpu.mem_desc<64x128xf32>, index, index -> vector<2x1xf32>
        xegpu.store_matrix %0, %arg0[%c0, %c0] : vector<2x1xf32>, !xegpu.mem_desc<64x128xf32>, index, index
      }
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @dpas_mx_fp4(%arg0: memref<8x64xf4E2M1FN>, %arg1: memref<64x16xf4E2M1FN>, %arg2: memref<8x16xbf16>, %arg3: memref<8x2xf8E8M0FNU>, %arg4: memref<2x16xf8E8M0FNU>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xbf16>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x64xf4E2M1FN> -> !xegpu.tensor_desc<8x64xf4E2M1FN>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<64x16xf4E2M1FN> -> !xegpu.tensor_desc<64x16xf4E2M1FN>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x64xf4E2M1FN> -> vector<8x64xf4E2M1FN>
      %3 = xegpu.load_nd %1[0, 0]  : !xegpu.tensor_desc<64x16xf4E2M1FN> -> vector<64x16xf4E2M1FN>
      %4 = xegpu.create_nd_tdesc %arg3 : memref<8x2xf8E8M0FNU> -> !xegpu.tensor_desc<8x2xf8E8M0FNU>
      %5 = xegpu.load_nd %4[0, 0]  : !xegpu.tensor_desc<8x2xf8E8M0FNU> -> vector<8x2xf8E8M0FNU>
      %6 = xegpu.create_nd_tdesc %arg4 : memref<2x16xf8E8M0FNU> -> !xegpu.tensor_desc<2x16xf8E8M0FNU>
      %7 = xegpu.load_nd %6[0, 0]  : !xegpu.tensor_desc<2x16xf8E8M0FNU> -> vector<2x16xf8E8M0FNU>
      %8 = xegpu.dpas_mx %2, %3, %cst scale_a = %5 scale_b = %7 : (vector<8x64xf4E2M1FN>, vector<64x16xf4E2M1FN>, vector<8x16xbf16>, vector<8x2xf8E8M0FNU>, vector<2x16xf8E8M0FNU>) -> vector<8x16xbf16>
      %9 = xegpu.create_nd_tdesc %arg2 : memref<8x16xbf16> -> !xegpu.tensor_desc<8x16xbf16>
      xegpu.store_nd %8, %9[0, 0]  : vector<8x16xbf16>, !xegpu.tensor_desc<8x16xbf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @dpas_mx_fp4(%arg0: memref<8x64xf4E2M1FN>, %arg1: memref<64x16xf4E2M1FN>, %arg2: memref<8x16xbf16>, %arg3: memref<8x2xf8E8M0FNU>, %arg4: memref<2x16xf8E8M0FNU>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xbf16>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x64xf4E2M1FN> -> !xegpu.tensor_desc<8x64xf4E2M1FN>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<64x16xf4E2M1FN> -> !xegpu.tensor_desc<64x16xf4E2M1FN>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x64xf4E2M1FN> -> vector<8x64xf4E2M1FN>
      %3 = xegpu.load_nd %1[0, 0]  : !xegpu.tensor_desc<64x16xf4E2M1FN> -> vector<64x16xf4E2M1FN>
      %4 = xegpu.create_nd_tdesc %arg3 : memref<8x2xf8E8M0FNU> -> !xegpu.tensor_desc<8x2xf8E8M0FNU>
      %5 = xegpu.load_nd %4[0, 0]  : !xegpu.tensor_desc<8x2xf8E8M0FNU> -> vector<8x2xf8E8M0FNU>
      %6 = xegpu.create_nd_tdesc %arg4 : memref<2x16xf8E8M0FNU> -> !xegpu.tensor_desc<2x16xf8E8M0FNU>
      %7 = xegpu.load_nd %6[0, 0]  : !xegpu.tensor_desc<2x16xf8E8M0FNU> -> vector<2x16xf8E8M0FNU>
      %8 = xegpu.dpas_mx %2, %3, %cst scale_a = %5 scale_b = %7 : (vector<8x64xf4E2M1FN>, vector<64x16xf4E2M1FN>, vector<8x16xbf16>, vector<8x2xf8E8M0FNU>, vector<2x16xf8E8M0FNU>) -> vector<8x16xbf16>
      %9 = xegpu.create_nd_tdesc %arg2 : memref<8x16xbf16> -> !xegpu.tensor_desc<8x16xbf16>
      xegpu.store_nd %8, %9[0, 0]  : vector<8x16xbf16>, !xegpu.tensor_desc<8x16xbf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_interleave_f16(%arg0: memref<8x16xf16>, %arg1: memref<8x16xf16>, %arg2: memref<8x32xf16>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %3 = xegpu.load_nd %1[0, 0]  : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %4 = vector.interleave %2, %3 : vector<8x16xf16> -> vector<8x32xf16>
      %5 = xegpu.create_nd_tdesc %arg2 : memref<8x32xf16> -> !xegpu.tensor_desc<8x32xf16>
      xegpu.store_nd %4, %5[0, 0]  : vector<8x32xf16>, !xegpu.tensor_desc<8x32xf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_deinterleave_f16(%arg0: memref<8x32xf16>, %arg1: memref<8x16xf16>, %arg2: memref<8x16xf16>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x32xf16> -> !xegpu.tensor_desc<8x32xf16>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x32xf16> -> vector<8x32xf16>
      %res1, %res2 = vector.deinterleave %1 : vector<8x32xf16> -> vector<8x16xf16>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %3 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      xegpu.store_nd %res1, %2[0, 0]  : vector<8x16xf16>, !xegpu.tensor_desc<8x16xf16>
      xegpu.store_nd %res2, %3[0, 0]  : vector<8x16xf16>, !xegpu.tensor_desc<8x16xf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @broadcast_slice_expanded_dim(%arg0: !xegpu.mem_desc<16x4xbf16>) {
      %cst = arith.constant dense<5.000000e-01> : vector<16x4xf4E2M1FN>
      %cst_0 = arith.constant dense<1.000000e+00> : vector<1x4xf8E8M0FNU>
      %0 = vector.broadcast %cst_0 : vector<1x4xf8E8M0FNU> to vector<1x16x4xf8E8M0FNU>
      %1 = vector.shape_cast %0 : vector<1x16x4xf8E8M0FNU> to vector<16x4xf8E8M0FNU>
      %2 = arith.scaling_extf %cst, %1 {layout_result_0 = #xegpu.layout<lane_layout = [8, 4], lane_data = [2, 1], order = [0, 1]>} : vector<16x4xf4E2M1FN>, vector<16x4xf8E8M0FNU> to vector<16x4xbf16>
      xegpu.store_matrix %2, %arg0[0, 0] <{layout = #xegpu.layout<lane_layout = [8, 4], lane_data = [2, 1], order = [0, 1]>}>: vector<16x4xbf16>, !xegpu.mem_desc<16x4xbf16>
      return
    }
  }
}

