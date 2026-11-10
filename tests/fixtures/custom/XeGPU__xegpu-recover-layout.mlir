module {
}

// -----
module {
  gpu.module @test_for {
    gpu.func @for_basic(%arg0: memref<8x128xf16>, %arg1: memref<128x16xf16>, %arg2: memref<8x16xf32>) {
      %c0 = arith.constant 0 : index
      %c128 = arith.constant 128 : index
      %c16 = arith.constant 16 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x128xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<128x16xf16> -> !xegpu.tensor_desc<16x16xf16>
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xf32>
      %2 = scf.for %arg3 = %c0 to %c128 step %c16 iter_args(%arg4 = %cst) -> (vector<8x16xf32>) {
        %4 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
        %5 = xegpu.load_nd %1[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
        %6 = xegpu.dpas %4, %5, %arg4 {layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
        scf.yield %6 : vector<8x16xf32>
      }
      %3 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %2, %3[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_while {
    gpu.func @while_basic(%arg0: memref<1024xf32>, %arg1: memref<1024xf32>) {
      %c1_i32 = arith.constant 1 : i32
      %c10_i32 = arith.constant 10 : i32
      %c0_i32 = arith.constant 0 : i32
      %0 = xegpu.create_nd_tdesc %arg0 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32>
      %1 = xegpu.load_nd %0[0] <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32> -> vector<256xf32>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32>
      %3:2 = scf.while (%arg2 = %1, %arg3 = %c0_i32) : (vector<256xf32>, i32) -> (vector<256xf32>, i32) {
        %4 = arith.cmpi slt, %arg3, %c10_i32 : i32
        scf.condition(%4) %arg2, %arg3 : vector<256xf32>, i32
      } do {
      ^bb0(%arg2: vector<256xf32>, %arg3: i32):
        xegpu.store_nd %arg2, %2[0] <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : vector<256xf32>, !xegpu.tensor_desc<256xf32>
        %4 = arith.addi %arg3, %c1_i32 : i32
        %5 = xegpu.load_nd %0[256] <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32> -> vector<256xf32>
        scf.yield %5, %4 : vector<256xf32>, i32
      }
      xegpu.store_nd %3#0, %2[0] <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : vector<256xf32>, !xegpu.tensor_desc<256xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_if {
    gpu.func @if_basic(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>, %arg2: i1, %arg3: !xegpu.tensor_desc<8x16xf32>) {
      %0 = xegpu.load_nd %arg0[0, 0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %1 = scf.if %arg2 -> (vector<16x16xf16>) {
        %3 = xegpu.load_nd %arg1[0, 0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
        scf.yield %3 : vector<16x16xf16>
      } else {
        %3 = xegpu.load_nd %arg1[0, 0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
        scf.yield %3 : vector<16x16xf16>
      }
      %2 = xegpu.dpas %0, %1 {layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16> -> vector<8x16xf32>
      xegpu.store_nd %2, %arg3[0, 0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
  }
}

