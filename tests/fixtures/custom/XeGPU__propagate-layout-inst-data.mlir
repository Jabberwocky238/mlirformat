module {
  gpu.module @test {
    func.func @load_store_no_array_len(%arg0: memref<8x32xf32>, %arg1: memref<8x32xf32>) {
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x32xf32> -> !xegpu.tensor_desc<8x32xf32>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<8x32xf32> -> !xegpu.tensor_desc<8x32xf32>
      xegpu.prefetch_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<8x32xf32>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<8x32xf32> -> vector<8x32xf32>
      xegpu.store_nd %2, %1[0, 0]  : vector<8x32xf32>, !xegpu.tensor_desc<8x32xf32>
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
  gpu.module @test_kernel {
    gpu.func @elementwise_with_inst_data_only(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf16>) {
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c32 : index
      %1 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16>
      %3 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16>
      scf.for %arg3 = %c0 to %c1024 step %c32 {
        %4 = xegpu.load_nd %1[0, %arg3]  : !xegpu.tensor_desc<16x32xf16> -> vector<16x32xf16>
        %5 = xegpu.load_nd %2[0, %arg3]  : !xegpu.tensor_desc<16x32xf16> -> vector<16x32xf16>
        %6 = arith.addf %4, %5 : vector<16x32xf16>
        xegpu.store_nd %6, %3[0, %arg3]  : vector<16x32xf16>, !xegpu.tensor_desc<16x32xf16>
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
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c32 : index
      %1 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xf16> -> !xegpu.tensor_desc<12x32xf16>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xf16> -> !xegpu.tensor_desc<12x32xf16>
      %3 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf16> -> !xegpu.tensor_desc<12x32xf16>
      scf.for %arg3 = %c0 to %c1024 step %c32 {
        %4 = xegpu.load_nd %1[0, %arg3]  : !xegpu.tensor_desc<12x32xf16> -> vector<12x32xf16>
        %5 = xegpu.load_nd %2[0, %arg3]  : !xegpu.tensor_desc<12x32xf16> -> vector<12x32xf16>
        %6 = arith.addf %4, %5 : vector<12x32xf16>
        xegpu.store_nd %6, %3[0, %arg3]  : vector<12x32xf16>, !xegpu.tensor_desc<12x32xf16>
      }
      gpu.return
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
    func.func @scatter_ops_coalesce_chunksize(%arg0: memref<512xf32>) {
      %cst = arith.constant dense<true> : vector<16x32xi1>
      %cst_0 = arith.constant dense<12> : vector<16x32xindex>
      %0 = xegpu.load %arg0[%cst_0], %cst  : memref<512xf32>, vector<16x32xindex>, vector<16x32xi1> -> vector<16x32xf32>
      xegpu.store %0, %arg0[%cst_0], %cst <{layout = #xegpu.layout<inst_data = [16, 16]>}> : vector<16x32xf32>, memref<512xf32>, vector<16x32xindex>, vector<16x32xi1>
      return
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
    func.func @vector_shape_cast_expand_non_unit_dims(%arg0: memref<1024xf16>, %arg1: memref<16xf16>) {
      %cst = arith.constant dense<true> : vector<1024xi1>
      %0 = vector.step : vector<1024xindex>
      %1 = xegpu.load %arg0[%0], %cst  : memref<1024xf16>, vector<1024xindex>, vector<1024xi1> -> vector<1024xf16>
      %2 = vector.shape_cast %1 : vector<1024xf16> to vector<8x8x16xf16>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<8x16xf16>
      %cst_1 = arith.constant dense<0.000000e+00> : vector<16xf16>
      %3 = vector.multi_reduction <add>, %2, %cst_0 [0] : vector<8x8x16xf16> to vector<8x16xf16>
      %4 = vector.multi_reduction <add>, %3, %cst_1 [0] : vector<8x16xf16> to vector<16xf16>
      %cst_2 = arith.constant dense<true> : vector<16xi1>
      %cst_3 = arith.constant dense<1> : vector<16xindex>
      xegpu.store %4, %arg1[%cst_3], %cst_2 <{layout = #xegpu.layout<inst_data = [16]>}> : vector<16xf16>, memref<16xf16>, vector<16xindex>, vector<16xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_2d_reduction_with_fractional_subgroup_size(%arg0: memref<1024xf16>, %arg1: memref<16xf16>) {
      %cst = arith.constant dense<true> : vector<16xi1>
      %0 = vector.step : vector<16xindex>
      %1 = xegpu.load %arg0[%0], %cst  : memref<1024xf16>, vector<16xindex>, vector<16xi1> -> vector<16xf16>
      %2 = vector.shape_cast %1 : vector<16xf16> to vector<1x16x1xf16>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<1xf16>
      %3 = vector.multi_reduction <add>, %2, %cst_0 [1, 2] : vector<1x16x1xf16> to vector<1xf16>
      %cst_1 = arith.constant dense<true> : vector<1xi1>
      %cst_2 = arith.constant dense<1> : vector<1xindex>
      xegpu.store %3, %arg1[%cst_2], %cst_1 <{layout = #xegpu.slice<#xegpu.layout<inst_data = [1, 1, 16]>, dims = [1, 2]>}> : vector<1xf16>, memref<16xf16>, vector<1xindex>, vector<1xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_2d_reduction_with_fractional_subgroup_size_1x4x1(%arg0: memref<1024xf16>, %arg1: memref<16xf16>) {
      %cst = arith.constant dense<true> : vector<64xi1>
      %0 = vector.step : vector<64xindex>
      %1 = xegpu.load %arg0[%0], %cst  : memref<1024xf16>, vector<64xindex>, vector<64xi1> -> vector<64xf16>
      %2 = vector.shape_cast %1 : vector<64xf16> to vector<1x16x4xf16>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<1xf16>
      %3 = vector.multi_reduction <add>, %2, %cst_0 [1, 2] : vector<1x16x4xf16> to vector<1xf16>
      %cst_1 = arith.constant dense<true> : vector<1xi1>
      %cst_2 = arith.constant dense<1> : vector<1xindex>
      xegpu.store %3, %arg1[%cst_2], %cst_1 <{layout = #xegpu.slice<#xegpu.layout<inst_data = [1, 1, 16]>, dims = [1, 2]>}> : vector<1xf16>, memref<16xf16>, vector<1xindex>, vector<1xi1>
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
      xegpu.store %4, %arg1[%0], %cst <{layout = #xegpu.layout<inst_data = [32]>}> : vector<256xf16>, memref<256xf16>, vector<256xindex>, vector<256xi1>
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
    gpu.func @broadcast_both_leadingdims_innerdims(%arg0: memref<32x2x192xf32>, %arg1: memref<32x2x192xf32>, %arg2: memref<32x2x192xf32>) kernel attributes {known_block_size = array<i32: 768, 1, 1>, known_grid_size = array<i32: 16, 1, 1>} {
      %cst = arith.constant dense<true> : vector<2x2x6x32xi1>
      %cst_0 = arith.constant dense<1.000000e+00> : vector<2x2x6x32xf32>
      %intptr = memref.extract_aligned_pointer_as_index %arg2 : memref<32x2x192xf32> -> index
      %0 = arith.index_cast %intptr : index to i64
      %1 = vector.step : vector<6xindex>
      %2 = vector.shape_cast %1 : vector<6xindex> to vector<6x1xindex>
      %3 = vector.broadcast %2 : vector<6x1xindex> to vector<2x2x6x32xindex>
      xegpu.store %cst_0, %0[%3], %cst <{layout = #xegpu.layout<inst_data = [1, 1, 1, 16]>}> : vector<2x2x6x32xf32>, i64, vector<2x2x6x32xindex>, vector<2x2x6x32xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_collapse_dims [#xevm.target<O = 3, chip = "pvc">] {
    gpu.func @shape_cast_collapse_dims_with_order(%arg0: memref<32x32xf32>) {
      %0 = vector.step : vector<1024xindex>
      %1 = vector.shape_cast %0 : vector<1024xindex> to vector<32x32xindex>
      %intptr = memref.extract_aligned_pointer_as_index %arg0 : memref<32x32xf32> -> index
      %2 = arith.index_cast %intptr : index to i64
      %cst = arith.constant dense<true> : vector<32x32xi1>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<32x32xf32>
      xegpu.store %cst_0, %2[%1], %cst <{layout = #xegpu.layout<inst_data = [32, 32]>}> : vector<32x32xf32>, i64, vector<32x32xindex>, vector<32x32xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @bitcast_ui8_to_f4(%arg0: memref<256x32xui8>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x32xui8> -> !xegpu.tensor_desc<256x32xui8>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<256x32xui8> -> vector<256x32xui8>
      %2 = vector.bitcast %1 : vector<256x32xui8> to vector<256x64xf4E2M1FN>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<inst_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 2]>, target_layout = #xegpu.layout<inst_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 2]>}> : vector<256x64xf4E2M1FN>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @bitcast_ui16_to_f4(%arg0: memref<256x16xui16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x16xui16> -> !xegpu.tensor_desc<256x16xui16>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<256x16xui16> -> vector<256x16xui16>
      %2 = vector.bitcast %1 : vector<256x16xui16> to vector<256x64xf4E2M1FN>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<inst_data = [32, 64], lane_layout = [1, 16], lane_data = [1, 4]>, target_layout = #xegpu.layout<inst_data = [32, 64], lane_layout = [1, 16], lane_data = [1, 4]>}> : vector<256x64xf4E2M1FN>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @dpas_mx_f8e5m2(%arg0: memref<16x1024xf8E5M2>, %arg1: memref<1024x32xf8E5M2>, %arg2: memref<16x32xbf16>, %arg3: memref<16x32xf8E8M0FNU>, %arg4: memref<32x32xf8E8M0FNU>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<16x32xbf16>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<16x1024xf8E5M2> -> !xegpu.tensor_desc<16x1024xf8E5M2>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<1024x32xf8E5M2> -> !xegpu.tensor_desc<1024x32xf8E5M2>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<16x1024xf8E5M2> -> vector<16x1024xf8E5M2>
      %3 = xegpu.load_nd %1[0, 0]  : !xegpu.tensor_desc<1024x32xf8E5M2> -> vector<1024x32xf8E5M2>
      %4 = xegpu.create_nd_tdesc %arg3 : memref<16x32xf8E8M0FNU> -> !xegpu.tensor_desc<16x32xf8E8M0FNU>
      %5 = xegpu.load_nd %4[0, 0]  : !xegpu.tensor_desc<16x32xf8E8M0FNU> -> vector<16x32xf8E8M0FNU>
      %6 = xegpu.create_nd_tdesc %arg4 : memref<32x32xf8E8M0FNU> -> !xegpu.tensor_desc<32x32xf8E8M0FNU>
      %7 = xegpu.load_nd %6[0, 0]  : !xegpu.tensor_desc<32x32xf8E8M0FNU> -> vector<32x32xf8E8M0FNU>
      %8 = xegpu.dpas_mx %2, %3, %cst scale_a = %5 scale_b = %7 : (vector<16x1024xf8E5M2>, vector<1024x32xf8E5M2>, vector<16x32xbf16>, vector<16x32xf8E8M0FNU>, vector<32x32xf8E8M0FNU>) -> vector<16x32xbf16>
      %9 = xegpu.create_nd_tdesc %arg2 : memref<16x32xbf16> -> !xegpu.tensor_desc<16x32xbf16>
      xegpu.store_nd %8, %9[0, 0]  : vector<16x32xbf16>, !xegpu.tensor_desc<16x32xbf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @dpas_mx_f4e2m1(%arg0: memref<16x1024xf4E2M1FN>, %arg1: memref<1024x32xf4E2M1FN>, %arg2: memref<16x32xbf16>, %arg3: memref<16x32xf8E8M0FNU>, %arg4: memref<32x32xf8E8M0FNU>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<16x32xbf16>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<16x1024xf4E2M1FN> -> !xegpu.tensor_desc<16x1024xf4E2M1FN>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<1024x32xf4E2M1FN> -> !xegpu.tensor_desc<1024x32xf4E2M1FN>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<16x1024xf4E2M1FN> -> vector<16x1024xf4E2M1FN>
      %3 = xegpu.load_nd %1[0, 0]  : !xegpu.tensor_desc<1024x32xf4E2M1FN> -> vector<1024x32xf4E2M1FN>
      %4 = xegpu.create_nd_tdesc %arg3 : memref<16x32xf8E8M0FNU> -> !xegpu.tensor_desc<16x32xf8E8M0FNU>
      %5 = xegpu.load_nd %4[0, 0]  : !xegpu.tensor_desc<16x32xf8E8M0FNU> -> vector<16x32xf8E8M0FNU>
      %6 = xegpu.create_nd_tdesc %arg4 : memref<32x32xf8E8M0FNU> -> !xegpu.tensor_desc<32x32xf8E8M0FNU>
      %7 = xegpu.load_nd %6[0, 0]  : !xegpu.tensor_desc<32x32xf8E8M0FNU> -> vector<32x32xf8E8M0FNU>
      %8 = xegpu.dpas_mx %2, %3, %cst scale_a = %5 scale_b = %7 : (vector<16x1024xf4E2M1FN>, vector<1024x32xf4E2M1FN>, vector<16x32xbf16>, vector<16x32xf8E8M0FNU>, vector<32x32xf8E8M0FNU>) -> vector<16x32xbf16>
      %9 = xegpu.create_nd_tdesc %arg2 : memref<16x32xbf16> -> !xegpu.tensor_desc<16x32xbf16>
      xegpu.store_nd %8, %9[0, 0]  : vector<16x32xbf16>, !xegpu.tensor_desc<16x32xbf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_shape_cast_collapse_innermost(%arg0: memref<4096xf16>) {
      %cst = arith.constant dense<0.000000e+00> : vector<8x16x32xf16>
      %0 = vector.shape_cast %cst : vector<8x16x32xf16> to vector<4096xf16>
      %cst_0 = arith.constant dense<true> : vector<4096xi1>
      %1 = vector.step : vector<4096xindex>
      xegpu.store %0, %arg0[%1], %cst_0 <{layout = #xegpu.layout<inst_data = [32], lane_layout = [16], lane_data = [1]>}> : vector<4096xf16>, memref<4096xf16>, vector<4096xindex>, vector<4096xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_shape_cast_collapse_lane_layout_spill_inward(%arg0: memref<512xf16>) {
      %cst = arith.constant dense<0.000000e+00> : vector<2x8x32xf16>
      %0 = vector.shape_cast %cst : vector<2x8x32xf16> to vector<512xf16>
      %cst_0 = arith.constant dense<true> : vector<512xi1>
      %1 = vector.step : vector<512xindex>
      xegpu.store %0, %arg0[%1], %cst_0 <{layout = #xegpu.layout<inst_data = [64], lane_layout = [16], lane_data = [2]>}> : vector<512xf16>, memref<512xf16>, vector<512xindex>, vector<512xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_shape_cast_collapse_multi_groups(%arg0: memref<8x128xf16>) {
      %cst = arith.constant dense<0.000000e+00> : vector<2x4x8x16xf16>
      %0 = vector.shape_cast %cst : vector<2x4x8x16xf16> to vector<8x128xf16>
      %1 = xegpu.create_nd_tdesc %arg0 : memref<8x128xf16> -> !xegpu.tensor_desc<8x128xf16>
      xegpu.store_nd %0, %1[0, 0] <{layout = #xegpu.layout<inst_data = [1, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x128xf16>, !xegpu.tensor_desc<8x128xf16>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @shape_cast_collapse_lane_layout(%arg0: memref<256x32xf8E8M0FNU>) kernel {
      %cst = arith.constant dense<5.877470e-39> : vector<8x1x32xf8E8M0FNU>
      %0 = vector.broadcast %cst : vector<8x1x32xf8E8M0FNU> to vector<8x32x32xf8E8M0FNU>
      %1 = vector.shape_cast %0 : vector<8x32x32xf8E8M0FNU> to vector<256x32xf8E8M0FNU>
      %2 = xegpu.create_nd_tdesc %arg0 : memref<256x32xf8E8M0FNU> -> !xegpu.tensor_desc<256x32xf8E8M0FNU>
      xegpu.store_nd %1, %2[0, 0] <{layout = #xegpu.layout<inst_data = [16, 4], lane_layout = [8, 4], lane_data = [2, 1], order = [0, 1]>}> : vector<256x32xf8E8M0FNU>, !xegpu.tensor_desc<256x32xf8E8M0FNU>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @complete_store_nd_inst_data(%arg0: memref<8x32xf32>) {
      %cst = arith.constant dense<0.000000e+00> : vector<8x32xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x32xf32> -> !xegpu.tensor_desc<8x32xf32>
      xegpu.store_nd %cst, %0[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : vector<8x32xf32>, !xegpu.tensor_desc<8x32xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @complete_prefetch_nd_inst_data(%arg0: memref<8x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x32xf32> -> !xegpu.tensor_desc<8x32xf32>
      xegpu.prefetch_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<8x32xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @complete_load_nd_inst_data(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>) {
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16>
      %2 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %3 = xegpu.load_nd %1[0, 0] <{layout = #xegpu.layout<inst_data = [16, 16]>}> : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
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
    func.func @complete_scatter_store_inst_data(%arg0: memref<512xf32>) {
      %cst = arith.constant dense<true> : vector<16x32xi1>
      %cst_0 = arith.constant dense<12> : vector<16x32xindex>
      %cst_1 = arith.constant dense<0.000000e+00> : vector<16x32xf32>
      xegpu.store %cst_1, %arg0[%cst_0], %cst <{layout = #xegpu.layout<inst_data = [1, 16]>}> : vector<16x32xf32>, memref<512xf32>, vector<16x32xindex>, vector<16x32xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @complete_scatter_load_inst_data(%arg0: memref<512xf32>) {
      %cst = arith.constant dense<true> : vector<16x32xi1>
      %cst_0 = arith.constant dense<12> : vector<16x32xindex>
      %0 = xegpu.load %arg0[%cst_0], %cst <{layout = #xegpu.layout<inst_data = [1, 16]>}> : memref<512xf32>, vector<16x32xindex>, vector<16x32xi1> -> vector<16x32xf32>
      xegpu.store %0, %arg0[%cst_0], %cst <{layout = #xegpu.layout<inst_data = [1, 16]>}> : vector<16x32xf32>, memref<512xf32>, vector<16x32xindex>, vector<16x32xi1>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @complete_dpas_inst_data(%arg0: vector<8x16xf16>, %arg1: vector<16x16xf16>) {
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xf32>
      %0 = xegpu.dpas %arg0, %arg1, %cst {layout_a = #xegpu.layout<inst_data = [8, 16]>, layout_b = #xegpu.layout<inst_data = [16, 16]>, layout_cd = #xegpu.layout<inst_data = [8, 16]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @complete_dpas_mx_inst_data(%arg0: vector<16x1024xf8E5M2>, %arg1: vector<1024x32xf8E5M2>, %arg2: vector<16x32xf8E8M0FNU>, %arg3: vector<32x32xf8E8M0FNU>) {
      %cst = arith.constant dense<0.000000e+00> : vector<16x32xbf16>
      %0 = xegpu.dpas_mx %arg0, %arg1, %cst scale_a = %arg2 scale_b = %arg3 {layout_a = #xegpu.layout<inst_data = [8, 32]>, layout_a_scale = #xegpu.layout<inst_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [32, 16]>, layout_b_scale = #xegpu.layout<inst_data = [1, 16]>, layout_cd = #xegpu.layout<inst_data = [8, 16]>} : (vector<16x1024xf8E5M2>, vector<1024x32xf8E5M2>, vector<16x32xbf16>, vector<16x32xf8E8M0FNU>, vector<32x32xf8E8M0FNU>) -> vector<16x32xbf16>
      return
    }
  }
}

