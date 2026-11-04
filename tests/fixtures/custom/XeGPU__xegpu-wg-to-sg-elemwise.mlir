module {
  gpu.module @test_elementwise_ops {
    gpu.func @unary_ops_sg_layout_only(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>>
      %1 = xegpu.load_nd %0 <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>}> : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>> -> vector<24x32xf32>
      %2 = math.exp %1 {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>} : vector<24x32xf32>
      %3 = arith.negf %1 {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8]>} : vector<24x32xf32>
      gpu.return
    }
    gpu.func @unary_ops(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0 <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>> -> vector<24x32xf32>
      %2 = math.exp %1 {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : vector<24x32xf32>
      %3 = arith.negf %1 {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : vector<24x32xf32>
      gpu.return
    }
    gpu.func @binary_ops(%arg0: memref<24x32xf32>, %arg1: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %1 = xegpu.create_nd_tdesc %arg1[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %2 = xegpu.load_nd %0 <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>> -> vector<24x32xf32>
      %3 = xegpu.load_nd %1 <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>> -> vector<24x32xf32>
      %4 = arith.addf %2, %3 {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : vector<24x32xf32>
      %5 = math.powf %2, %3 {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : vector<24x32xf32>
      gpu.return
    }
    gpu.func @ternary_ops(%arg0: memref<24x32xf32>, %arg1: memref<24x32xf32>, %arg2: memref<24x32xi1>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %1 = xegpu.create_nd_tdesc %arg1[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %2 = xegpu.create_nd_tdesc %arg2[0, 0] : memref<24x32xi1> -> !xegpu.tensor_desc<24x32xi1, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %3 = xegpu.load_nd %0 <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>> -> vector<24x32xf32>
      %4 = xegpu.load_nd %1 <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>> -> vector<24x32xf32>
      %5 = xegpu.load_nd %2 <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xi1, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>> -> vector<24x32xi1>
      %6 = arith.select %5, %3, %4 {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : vector<24x32xi1>, vector<24x32xf32>
      %7 = math.fma %3, %4, %3 {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : vector<24x32xf32>
      gpu.return
    }
    gpu.func @type_conversion_ops(%arg0: memref<24x32xf32>, %arg1: memref<24x32xi32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %1 = xegpu.create_nd_tdesc %arg1[0, 0] : memref<24x32xi32> -> !xegpu.tensor_desc<24x32xi32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %2 = xegpu.load_nd %0 <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>> -> vector<24x32xf32>
      %3 = xegpu.load_nd %1 <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xi32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>> -> vector<24x32xi32>
      %4 = arith.truncf %2 {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : vector<24x32xf32> to vector<24x32xf16>
      %5 = arith.bitcast %3 {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : vector<24x32xi32> to vector<24x32xf32>
      gpu.return
    }
    gpu.func @comparison_ops(%arg0: memref<24x32xf32>, %arg1: memref<24x32xf32>, %arg2: memref<24x32xi32>, %arg3: memref<24x32xi32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %1 = xegpu.create_nd_tdesc %arg1[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %2 = xegpu.create_nd_tdesc %arg2[0, 0] : memref<24x32xi32> -> !xegpu.tensor_desc<24x32xi32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %3 = xegpu.create_nd_tdesc %arg3[0, 0] : memref<24x32xi32> -> !xegpu.tensor_desc<24x32xi32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>>
      %4 = xegpu.load_nd %0 <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>> -> vector<24x32xf32>
      %5 = xegpu.load_nd %1 <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>> -> vector<24x32xf32>
      %6 = xegpu.load_nd %2 <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xi32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>> -> vector<24x32xi32>
      %7 = xegpu.load_nd %3 <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xi32, #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>> -> vector<24x32xi32>
      %8 = arith.cmpf ult, %4, %5 {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : vector<24x32xf32>
      %9 = arith.cmpi eq, %6, %7 {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [12, 8], lane_layout = [2, 8], lane_data = [1, 1]>} : vector<24x32xi32>
      gpu.return
    }
    gpu.func @elementwise_ops_rr_assignment(%arg0: memref<24x32xf32>, %arg1: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>>
      %1 = xegpu.create_nd_tdesc %arg1[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>>
      %2 = xegpu.load_nd %0 <{layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>> -> vector<24x32xf32>
      %3 = xegpu.load_nd %1 <{layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>}> : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>> -> vector<24x32xf32>
      %4 = arith.negf %2 {layout_result_0 = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>} : vector<24x32xf32>
      %5 = math.powf %2, %3 {layout_result_0 = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2], lane_layout = [2, 2], lane_data = [1, 1]>} : vector<24x32xf32>
      gpu.return
    }
  }
}

