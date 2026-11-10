module {
  gpu.module @test_elementwise_ops {
    gpu.func @unary_ops_sg_layout_only(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>}> : !xegpu.tensor_desc<24x32xf32> -> vector<24x32xf32>
      %2 = math.exp %1 : vector<24x32xf32>
      %3 = arith.negf %2 : vector<24x32xf32>
      %4 = xegpu.convert_layout %3 <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>}> : vector<24x32xf32>
      gpu.return
    }
    gpu.func @unary_ops(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32> -> vector<24x32xf32>
      %2 = math.exp %1 : vector<24x32xf32>
      %3 = arith.negf %2 : vector<24x32xf32>
      %4 = xegpu.convert_layout %3 <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : vector<24x32xf32>
      gpu.return
    }
    gpu.func @binary_ops(%arg0: memref<24x32xf32>, %arg1: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32>
      %2 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32> -> vector<24x32xf32>
      %3 = xegpu.load_nd %1[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32> -> vector<24x32xf32>
      %4 = arith.addf %2, %3 : vector<24x32xf32>
      %5 = math.powf %4, %3 : vector<24x32xf32>
      %6 = xegpu.convert_layout %5 <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : vector<24x32xf32>
      gpu.return
    }
    gpu.func @ternary_ops(%arg0: memref<24x32xf32>, %arg1: memref<24x32xf32>, %arg2: memref<24x32xi1>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32>
      %2 = xegpu.create_nd_tdesc %arg2 : memref<24x32xi1> -> !xegpu.tensor_desc<24x32xi1>
      %3 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32> -> vector<24x32xf32>
      %4 = xegpu.load_nd %1[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32> -> vector<24x32xf32>
      %5 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xi1> -> vector<24x32xi1>
      %6 = arith.select %5, %3, %4 : vector<24x32xi1>, vector<24x32xf32>
      %7 = math.fma %3, %4, %6 : vector<24x32xf32>
      %8 = xegpu.convert_layout %7 <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : vector<24x32xf32>
      gpu.return
    }
    gpu.func @type_conversion_ops(%arg0: memref<24x32xf32>, %arg1: memref<24x32xi32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<24x32xi32> -> !xegpu.tensor_desc<24x32xi32>
      %2 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32> -> vector<24x32xf32>
      %3 = xegpu.load_nd %1[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xi32> -> vector<24x32xi32>
      %4 = arith.truncf %2 : vector<24x32xf32> to vector<24x32xf16>
      %5 = arith.bitcast %4 : vector<24x32xf16> to vector<24x32xi16>
      %6 = xegpu.convert_layout %5 <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : vector<24x32xi16>
      gpu.return
    }
    gpu.func @comparison_ops(%arg0: memref<24x32xf32>, %arg1: memref<24x32xf32>, %arg2: memref<24x32xi32>, %arg3: memref<24x32xi32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32>
      %2 = xegpu.create_nd_tdesc %arg2 : memref<24x32xi32> -> !xegpu.tensor_desc<24x32xi32>
      %3 = xegpu.create_nd_tdesc %arg3 : memref<24x32xi32> -> !xegpu.tensor_desc<24x32xi32>
      %4 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32> -> vector<24x32xf32>
      %5 = xegpu.load_nd %1[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32> -> vector<24x32xf32>
      %6 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xi32> -> vector<24x32xi32>
      %7 = xegpu.load_nd %3[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xi32> -> vector<24x32xi32>
      %8 = arith.cmpf ult, %4, %5 : vector<24x32xf32>
      %9 = arith.cmpi eq, %6, %7 : vector<24x32xi32>
      %10 = arith.select %9, %9, %8 : vector<24x32xi1>, vector<24x32xi1>
      %11 = xegpu.convert_layout %10 <{input_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : vector<24x32xi1>
      gpu.return
    }
    gpu.func @elementwise_ops_rr_assignment(%arg0: memref<24x32xf32>, %arg1: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32>
      %2 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32> -> vector<24x32xf32>
      %3 = xegpu.load_nd %1[0, 0] <{layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32> -> vector<24x32xf32>
      %4 = arith.negf %2 : vector<24x32xf32>
      %5 = math.powf %4, %3 : vector<24x32xf32>
      %6 = xegpu.convert_layout %5 <{input_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>}> : vector<24x32xf32>
      gpu.return
    }
  }
}

