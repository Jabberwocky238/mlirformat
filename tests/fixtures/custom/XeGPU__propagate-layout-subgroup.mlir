module {
  gpu.module @test {
    func.func @store_nd(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      xegpu.store_nd %1, %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_transpose(%arg0: memref<256x128xf32>, %arg1: memref<128x256xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<128x256xf32> -> !xegpu.tensor_desc<128x256xf32>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      %3 = vector.transpose %2, [1, 0] : vector<256x128xf32> to vector<128x256xf32>
      xegpu.store_nd %3, %1[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 64], order = [1, 0]>}> : vector<128x256xf32>, !xegpu.tensor_desc<128x256xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @vector_transpose(%arg0: memref<256x128xf32>, %arg1: memref<128x256xf32>) kernel attributes {known_block_size = array<i32: 1, 32, 16>} {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<128x256xf32> -> !xegpu.tensor_desc<128x256xf32>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      %3 = vector.transpose %2, [1, 0] : vector<256x128xf32> to vector<128x256xf32>
      xegpu.store_nd %3, %1[0, 0]  : vector<128x256xf32>, !xegpu.tensor_desc<128x256xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @dpas(%arg0: memref<128x128xf16>, %arg1: memref<128x128xf16>, %arg2: memref<128x128xf32>) kernel attributes {known_block_size = array<i32: 1, 64, 16>} {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<128x128xf16> -> !xegpu.tensor_desc<128x128xf16>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<128x128xf16> -> vector<128x128xf16>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<128x128xf16> -> !xegpu.tensor_desc<128x128xf16>
      %3 = xegpu.load_nd %2[0, 0]  : !xegpu.tensor_desc<128x128xf16> -> vector<128x128xf16>
      %4 = xegpu.dpas %1, %3 : vector<128x128xf16>, vector<128x128xf16> -> vector<128x128xf32>
      %5 = xegpu.create_nd_tdesc %arg2 : memref<128x128xf32> -> !xegpu.tensor_desc<128x128xf32>
      xegpu.store_nd %4, %5[0, 0]  : vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @vector_row_reduction(%arg0: memref<32x64xf32>, %arg1: memref<32xf32>) kernel attributes {known_block_size = array<i32: 1, 32, 16>} {
      %cst = arith.constant dense<0.000000e+00> : vector<32xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<32x64xf32> -> !xegpu.tensor_desc<32x64xf32>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<32x64xf32> -> vector<32x64xf32>
      %2 = vector.multi_reduction <add>, %1, %cst [1] : vector<32x64xf32> to vector<32xf32>
      %3 = xegpu.create_nd_tdesc %arg1 : memref<32xf32> -> !xegpu.tensor_desc<32xf32>
      xegpu.store_nd %2, %3[0] <{layout = #xegpu.layout<sg_layout = [32], sg_data = [1]>}> : vector<32xf32>, !xegpu.tensor_desc<32xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @vector_row_reduction_scalar(%arg0: memref<32x64xf32>, %arg1: memref<32xf32>) kernel attributes {known_block_size = array<i32: 1, 32, 16>} {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = xegpu.create_nd_tdesc %arg0 : memref<32x64xf32> -> !xegpu.tensor_desc<32x64xf32>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<32x64xf32> -> vector<32x64xf32>
      %2 = vector.multi_reduction <add>, %1, %cst [0, 1] : vector<32x64xf32> to f32
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @vector_nest_reduction(%arg0: memref<32x128xf32>, %arg1: memref<32xf32>) kernel attributes {known_block_size = array<i32: 1, 32, 16>} {
      %cst = arith.constant dense<0.000000e+00> : vector<32xf32>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<32x128xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<32x128xf32> -> !xegpu.tensor_desc<32x128xf32>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<32x128xf32> -> vector<32x128xf32>
      %2 = vector.broadcast %1 : vector<32x128xf32> to vector<4x32x128xf32>
      %3 = vector.multi_reduction <add>, %2, %cst_0 [0] : vector<4x32x128xf32> to vector<32x128xf32>
      %4 = vector.multi_reduction <add>, %3, %cst [1] : vector<32x128xf32> to vector<32xf32>
      %cst_1 = arith.constant dense<true> : vector<32xi1>
      %5 = vector.step : vector<32xindex>
      xegpu.store %4, %arg1[%5], %cst_1 <{layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 8], sg_data = [8, 16]>, dims = [1]>}> : vector<32xf32>, memref<32xf32>, vector<32xindex>, vector<32xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @vector_nest_reduction_with_nest_slice_layout(%arg0: memref<32x128xf32>, %arg1: memref<32xf32>) kernel attributes {known_block_size = array<i32: 1, 32, 16>} {
      %cst = arith.constant dense<0.000000e+00> : vector<32xf32>
      %cst_0 = arith.constant dense<0.000000e+00> : vector<32x128xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<32x128xf32> -> !xegpu.tensor_desc<32x128xf32>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<32x128xf32> -> vector<32x128xf32>
      %2 = vector.broadcast %1 : vector<32x128xf32> to vector<4x32x128xf32>
      %3 = vector.multi_reduction <add>, %2, %cst_0 [0] : vector<4x32x128xf32> to vector<32x128xf32>
      %4 = vector.multi_reduction <add>, %3, %cst [1] : vector<32x128xf32> to vector<32xf32>
      %cst_1 = arith.constant dense<true> : vector<32xi1>
      %5 = vector.step : vector<32xindex>
      xegpu.store %4, %arg1[%5], %cst_1 <{layout = #xegpu.slice<#xegpu.slice<#xegpu.layout<sg_layout = [1, 4, 8], sg_data = [4, 8, 32]>, dims = [0]>, dims = [1]>}> : vector<32xf32>, memref<32xf32>, vector<32xindex>, vector<32xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @vector_reduction_preserve_round_robin_layout(%arg0: memref<2048xf32, 1>) kernel {
      %cst = arith.constant dense<0> : vector<8x256xindex>
      %cst_0 = arith.constant dense<1024> : vector<8xindex>
      %cst_1 = arith.constant dense<0.000000e+00> : vector<8xf32>
      %cst_2 = arith.constant dense<true> : vector<8x256xi1>
      %cst_3 = arith.constant dense<true> : vector<8xi1>
      %0 = xegpu.load %arg0[%cst], %cst_2  : memref<2048xf32, 1>, vector<8x256xindex>, vector<8x256xi1> -> vector<8x256xf32>
      %1 = vector.multi_reduction <add>, %0, %cst_1 [1] : vector<8x256xf32> to vector<8xf32>
      xegpu.store %1, %arg0[%cst_0], %cst_3 <{layout = #xegpu.slice<#xegpu.layout<sg_layout = [1, 16], sg_data = [4, 16]>, dims = [1]>}> : vector<8xf32>, memref<2048xf32, 1>, vector<8xindex>, vector<8xi1>
      gpu.return
    }
  }
}

// -----
#map = affine_map<()[s0] -> (s0 * 128)>
module {
  gpu.module @test {
    gpu.func @for_loop_dpas(%arg0: memref<2048x8192xf16>, %arg1: memref<8192x4096xf16>, %arg2: memref<2048x4096xf32>) kernel attributes {known_block_size = array<i32: 4, 1, 16>} {
      %cst = arith.constant dense<0.000000e+00> : vector<128x128xf32>
      %c128 = arith.constant 128 : index
      %c8192 = arith.constant 8192 : index
      %c0 = arith.constant 0 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = affine.apply #map()[%block_id_x]
      %1 = affine.apply #map()[%block_id_y]
      %2 = scf.for %arg3 = %c0 to %c8192 step %c128 iter_args(%arg4 = %cst) -> (vector<128x128xf32>) {
        %4 = xegpu.create_nd_tdesc %arg0 : memref<2048x8192xf16> -> !xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
        %5 = xegpu.load_nd %4[%block_id_x, %arg3]  : !xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>> -> vector<128x128xf16>
        %6 = xegpu.create_nd_tdesc %arg1 : memref<8192x4096xf16> -> !xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
        %7 = xegpu.load_nd %6[%arg3, %block_id_y]  : !xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>> -> vector<128x128xf16>
        %8 = xegpu.dpas %5, %7, %arg4 : vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32> -> vector<128x128xf32>
        scf.yield %8 : vector<128x128xf32>
      }
      %3 = xegpu.create_nd_tdesc %arg2 : memref<2048x4096xf32> -> !xegpu.tensor_desc<128x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      xegpu.store_nd %2, %3[%0, %1]  : vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      gpu.return
    }
  }
}

// -----
#map = affine_map<()[s0] -> (s0 * 128)>
module {
  gpu.module @test {
    gpu.func @for_loop_misaligned_dpas_fail(%arg0: memref<2048x8192xf16>, %arg1: memref<8192x4096xf16>, %arg2: memref<2048x4096xf32>) kernel attributes {known_block_size = array<i32: 8, 1, 16>} {
      %cst = arith.constant dense<0.000000e+00> : vector<128x128xf32>
      %c128 = arith.constant 128 : index
      %c8192 = arith.constant 8192 : index
      %c0 = arith.constant 0 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = affine.apply #map()[%block_id_x]
      %1 = affine.apply #map()[%block_id_y]
      %2 = scf.for %arg3 = %c0 to %c8192 step %c128 iter_args(%arg4 = %cst) -> (vector<128x128xf32>) {
        %4 = xegpu.create_nd_tdesc %arg0 : memref<2048x8192xf16> -> !xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
        %5 = xegpu.load_nd %4[%block_id_x, %arg3]  : !xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>> -> vector<128x128xf16>
        %6 = xegpu.create_nd_tdesc %arg1 : memref<8192x4096xf16> -> !xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
        %7 = xegpu.load_nd %6[%arg3, %block_id_y]  : !xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>> -> vector<128x128xf16>
        %8 = xegpu.dpas %5, %7, %arg4 : vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32> -> vector<128x128xf32>
        scf.yield %8 : vector<128x128xf32>
      }
      %3 = xegpu.create_nd_tdesc %arg2 : memref<2048x4096xf32> -> !xegpu.tensor_desc<128x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      xegpu.store_nd %2, %3[%0, %1]  : vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @dpas_fails(%arg0: memref<2048x8192xf16>, %arg1: memref<8192x4096xf16>, %arg2: memref<2048x4096xf32>) kernel attributes {known_block_size = array<i32: 8, 1, 16>} {
      %cst = arith.constant dense<0.000000e+00> : vector<32x64xf32>
      %c16 = arith.constant 16 : index
      %c8192 = arith.constant 8192 : index
      %c0 = arith.constant 0 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = xegpu.create_nd_tdesc %arg0 : memref<2048x8192xf16> -> !xegpu.tensor_desc<32x16xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
      %1 = xegpu.load_nd %0[%block_id_x, %c0]  : !xegpu.tensor_desc<32x16xf16, #xegpu.block_tdesc_attr<boundary_check = false>> -> vector<32x16xf16>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<8192x4096xf16> -> !xegpu.tensor_desc<16x64xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
      %3 = xegpu.load_nd %2[%c0, %block_id_y]  : !xegpu.tensor_desc<16x64xf16, #xegpu.block_tdesc_attr<boundary_check = false>> -> vector<16x64xf16>
      %4 = xegpu.dpas %1, %3, %cst : vector<32x16xf16>, vector<16x64xf16>, vector<32x64xf32> -> vector<32x64xf32>
      %5 = xegpu.create_nd_tdesc %arg2 : memref<2048x4096xf32> -> !xegpu.tensor_desc<32x64xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      xegpu.store_nd %4, %5[%block_id_x, %block_id_y]  : vector<32x64xf32>, !xegpu.tensor_desc<32x64xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @store_fails(%arg0: memref<2048x8192xf16>) kernel attributes {known_block_size = array<i32: 8, 1, 16>} {
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xf16>
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<2048x8192xf16> -> !xegpu.tensor_desc<8x16xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
      %1 = xegpu.load_nd %0[%c0, %c0]  : !xegpu.tensor_desc<8x16xf16, #xegpu.block_tdesc_attr<boundary_check = false>> -> vector<8x16xf16>
      %2 = arith.addf %1, %cst : vector<8x16xf16>
      xegpu.store_nd %2, %0[%c0, %c0]  : vector<8x16xf16>, !xegpu.tensor_desc<8x16xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_store_matrix(%arg0: !xegpu.mem_desc<1x64x128xf32>, %arg1: i1) {
      %c0 = arith.constant 0 : index
      scf.if %arg1 {
        %0 = xegpu.load_matrix %arg0[%c0, %c0, %c0] : !xegpu.mem_desc<1x64x128xf32>, index, index, index -> vector<1x32x32xf32>
        xegpu.store_matrix %0, %arg0[%c0, %c0, %c0] <{layout = #xegpu.layout<sg_layout = [1, 4, 2], sg_data = [1, 8, 16]>}>: vector<1x32x32xf32>, !xegpu.mem_desc<1x64x128xf32>, index, index, index
      }
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @convert_layout(%arg0: !xegpu.mem_desc<32x128xf32>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.load_matrix %arg0[%c0, %c0] : !xegpu.mem_desc<32x128xf32>, index, index -> vector<32x128xf32>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 16]>, target_layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 16]>}> : vector<32x128xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @dpas_mx(%arg0: memref<128x512xf8E5M2>, %arg1: memref<512x256xf8E5M2>, %arg2: memref<128x256xbf16>, %arg3: memref<128x16xf8E8M0FNU>, %arg4: memref<16x256xf8E8M0FNU>) kernel attributes {known_block_size = array<i32: 1, 64, 16>} {
      %cst = arith.constant dense<0.000000e+00> : vector<128x256xbf16>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<128x512xf8E5M2> -> !xegpu.tensor_desc<128x512xf8E5M2>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<128x512xf8E5M2> -> vector<128x512xf8E5M2>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<512x256xf8E5M2> -> !xegpu.tensor_desc<512x256xf8E5M2>
      %3 = xegpu.load_nd %2[0, 0]  : !xegpu.tensor_desc<512x256xf8E5M2> -> vector<512x256xf8E5M2>
      %4 = xegpu.create_nd_tdesc %arg3 : memref<128x16xf8E8M0FNU> -> !xegpu.tensor_desc<128x16xf8E8M0FNU>
      %5 = xegpu.load_nd %4[0, 0]  : !xegpu.tensor_desc<128x16xf8E8M0FNU> -> vector<128x16xf8E8M0FNU>
      %6 = xegpu.create_nd_tdesc %arg4 : memref<16x256xf8E8M0FNU> -> !xegpu.tensor_desc<16x256xf8E8M0FNU>
      %7 = xegpu.load_nd %6[0, 0]  : !xegpu.tensor_desc<16x256xf8E8M0FNU> -> vector<16x256xf8E8M0FNU>
      %8 = xegpu.dpas_mx %1, %3, %cst scale_a = %5 scale_b = %7 : (vector<128x512xf8E5M2>, vector<512x256xf8E5M2>, vector<128x256xbf16>, vector<128x16xf8E8M0FNU>, vector<16x256xf8E8M0FNU>) -> vector<128x256xbf16>
      %9 = xegpu.create_nd_tdesc %arg2 : memref<128x256xbf16> -> !xegpu.tensor_desc<128x256xbf16>
      xegpu.store_nd %8, %9[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 32]>}> : vector<128x256xbf16>, !xegpu.tensor_desc<128x256xbf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @dpas_mx_fp4(%arg0: memref<128x512xf4E2M1FN>, %arg1: memref<512x128xf4E2M1FN>, %arg2: memref<128x128xf32>, %arg3: memref<128x16xf8E8M0FNU>, %arg4: memref<16x128xf8E8M0FNU>) kernel attributes {known_block_size = array<i32: 1, 64, 16>} {
      %cst = arith.constant dense<0.000000e+00> : vector<128x128xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<128x512xf4E2M1FN> -> !xegpu.tensor_desc<128x512xf4E2M1FN>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<128x512xf4E2M1FN> -> vector<128x512xf4E2M1FN>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<512x128xf4E2M1FN> -> !xegpu.tensor_desc<512x128xf4E2M1FN>
      %3 = xegpu.load_nd %2[0, 0]  : !xegpu.tensor_desc<512x128xf4E2M1FN> -> vector<512x128xf4E2M1FN>
      %4 = xegpu.create_nd_tdesc %arg3 : memref<128x16xf8E8M0FNU> -> !xegpu.tensor_desc<128x16xf8E8M0FNU>
      %5 = xegpu.load_nd %4[0, 0]  : !xegpu.tensor_desc<128x16xf8E8M0FNU> -> vector<128x16xf8E8M0FNU>
      %6 = xegpu.create_nd_tdesc %arg4 : memref<16x128xf8E8M0FNU> -> !xegpu.tensor_desc<16x128xf8E8M0FNU>
      %7 = xegpu.load_nd %6[0, 0]  : !xegpu.tensor_desc<16x128xf8E8M0FNU> -> vector<16x128xf8E8M0FNU>
      %8 = xegpu.dpas_mx %1, %3, %cst scale_a = %5 scale_b = %7 : (vector<128x512xf4E2M1FN>, vector<512x128xf4E2M1FN>, vector<128x128xf32>, vector<128x16xf8E8M0FNU>, vector<16x128xf8E8M0FNU>) -> vector<128x128xf32>
      %9 = xegpu.create_nd_tdesc %arg2 : memref<128x128xf32> -> !xegpu.tensor_desc<128x128xf32>
      xegpu.store_nd %8, %9[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @sum_reduction_broadcast_transpose(%arg0: memref<64x256xf16>, %arg1: memref<64x32xf16>) kernel attributes {known_block_size = array<i32: 1, 32, 16>} {
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c256 = arith.constant 256 : index
      %cst = arith.constant dense<0.000000e+00> : vector<64xf16>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<64x256xf16> -> !xegpu.tensor_desc<64x32xf16>
      %1 = scf.for %arg2 = %c0 to %c256 step %c32 iter_args(%arg3 = %cst) -> (vector<64xf16>) {
        %5 = xegpu.load_nd %0[0, %arg2]  : !xegpu.tensor_desc<64x32xf16> -> vector<64x32xf16>
        %6 = vector.multi_reduction <add>, %5, %arg3 [1] : vector<64x32xf16> to vector<64xf16>
        scf.yield %6 : vector<64xf16>
      }
      %2 = vector.broadcast %1 : vector<64xf16> to vector<32x64xf16>
      %3 = vector.transpose %2, [1, 0] : vector<32x64xf16> to vector<64x32xf16>
      %4 = xegpu.create_nd_tdesc %arg1 : memref<64x32xf16> -> !xegpu.tensor_desc<64x32xf16>
      xegpu.store_nd %3, %4[0, 0] <{layout = #xegpu.layout<sg_layout = [4, 2], sg_data = [16, 16]>}> : vector<64x32xf16>, !xegpu.tensor_desc<64x32xf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @shape_cast_collapse_innermost(%arg0: memref<4096xf16>) kernel {
      %cst = arith.constant dense<0.000000e+00> : vector<8x16x32xf16>
      %0 = vector.shape_cast %cst : vector<8x16x32xf16> to vector<4096xf16>
      %cst_0 = arith.constant dense<true> : vector<4096xi1>
      %1 = vector.step : vector<4096xindex>
      xegpu.store %0, %arg0[%1], %cst_0 <{layout = #xegpu.layout<sg_layout = [8], sg_data = [512]>}> : vector<4096xf16>, memref<4096xf16>, vector<4096xindex>, vector<4096xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @shape_cast_collapse_sg_layout_spill_inward(%arg0: memref<512xf16>) kernel {
      %cst = arith.constant dense<0.000000e+00> : vector<2x8x32xf16>
      %0 = vector.shape_cast %cst : vector<2x8x32xf16> to vector<512xf16>
      %cst_0 = arith.constant dense<true> : vector<512xi1>
      %1 = vector.step : vector<512xindex>
      xegpu.store %0, %arg0[%1], %cst_0 <{layout = #xegpu.layout<sg_layout = [16], sg_data = [32]>}> : vector<512xf16>, memref<512xf16>, vector<512xindex>, vector<512xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @shape_cast_collapse_multi_groups(%arg0: memref<8x128xf16>) kernel {
      %cst = arith.constant dense<0.000000e+00> : vector<2x4x8x16xf16>
      %0 = vector.shape_cast %cst : vector<2x4x8x16xf16> to vector<8x128xf16>
      %1 = xegpu.create_nd_tdesc %arg0 : memref<8x128xf16> -> !xegpu.tensor_desc<8x128xf16>
      xegpu.store_nd %0, %1[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [4, 32]>}> : vector<8x128xf16>, !xegpu.tensor_desc<8x128xf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @shape_cast_collapse_replicated(%arg0: memref<16x64xf16>) kernel {
      %cst = arith.constant dense<0.000000e+00> : vector<16x8x8xf16>
      %0 = vector.shape_cast %cst : vector<16x8x8xf16> to vector<16x64xf16>
      %1 = xegpu.create_nd_tdesc %arg0 : memref<16x64xf16> -> !xegpu.tensor_desc<16x64xf16>
      xegpu.store_nd %0, %1[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [8, 64]>}> : vector<16x64xf16>, !xegpu.tensor_desc<16x64xf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @shape_cast_collapse_sg_wraparound(%arg0: memref<32xf16>) kernel {
      %cst = arith.constant dense<0.000000e+00> : vector<2x16xf16>
      %0 = vector.shape_cast %cst : vector<2x16xf16> to vector<32xf16>
      %cst_0 = arith.constant dense<true> : vector<32xi1>
      %1 = vector.step : vector<32xindex>
      xegpu.store %0, %arg0[%1], %cst_0 <{layout = #xegpu.layout<sg_layout = [4], sg_data = [4]>}> : vector<32xf16>, memref<32xf16>, vector<32xindex>, vector<32xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @store_scatter(%arg0: memref<256xf16>) kernel attributes {known_block_size = array<i32: 256, 1, 1>} {
      %cst = arith.constant dense<2.550000e+01> : vector<256xf16>
      %cst_0 = arith.constant dense<0> : vector<256xindex>
      %cst_1 = arith.constant dense<true> : vector<256xi1>
      xegpu.store %cst, %arg0[%cst_0], %cst_1 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>}> : vector<256xf16>, memref<256xf16>, vector<256xindex>, vector<256xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @store_matrix(%arg0: !xegpu.mem_desc<64x128xf16>, %arg1: vector<64x128xf16>) kernel attributes {known_block_size = array<i32: 512, 1, 1>} {
      %c0 = arith.constant 0 : index
      xegpu.store_matrix %arg1, %arg0[%c0, %c0] : vector<64x128xf16>, !xegpu.mem_desc<64x128xf16>, index, index
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @store_scatter_no_valid_sg_layout(%arg0: memref<256xf16>) kernel attributes {known_block_size = array<i32: 512, 1, 1>} {
      %cst = arith.constant dense<2.550000e+01> : vector<256xf16>
      %cst_0 = arith.constant dense<0> : vector<256xindex>
      %cst_1 = arith.constant dense<true> : vector<256xi1>
      xegpu.store %cst, %arg0[%cst_0], %cst_1 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>}> : vector<256xf16>, memref<256xf16>, vector<256xindex>, vector<256xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test {
    gpu.func @transpose_3d_order_remap(%arg0: memref<32x2x32xf16>, %arg1: memref<2x32x32xf16>) kernel {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<32x2x32xf16> -> !xegpu.tensor_desc<32x2x32xf16>
      %1 = xegpu.load_nd %0[%c0, %c0, %c0]  : !xegpu.tensor_desc<32x2x32xf16> -> vector<32x2x32xf16>
      %2 = vector.transpose %1, [1, 0, 2] : vector<32x2x32xf16> to vector<2x32x32xf16>
      %3 = xegpu.create_nd_tdesc %arg1 : memref<2x32x32xf16> -> !xegpu.tensor_desc<2x32x32xf16>
      xegpu.store_nd %2, %3[%c0, %c0, %c0] <{layout = #xegpu.layout<sg_layout = [2, 1, 2], sg_data = [1, 32, 16], order = [1, 2, 0]>}> : vector<2x32x32xf16>, !xegpu.tensor_desc<2x32x32xf16>
      gpu.return
    }
  }
}

