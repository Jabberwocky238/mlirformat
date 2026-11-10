module {
  gpu.module @test {
    func.func @load_nd_with_conflicting_tensor_desc(%arg0: memref<64x64xf16>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<64x64xf16> -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>
      %1 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>> -> vector<16x16xf16>
      xegpu.prefetch_nd %0[%c0, %c0] <{layout = #xegpu.layout<inst_data = [16, 16]>}> : !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>
      return
    }
    func.func @multiple_tensor_desc_conflicts(%arg0: memref<64x64xf16>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<64x64xf16> -> !xegpu.tensor_desc<32x16xf16, #xegpu.layout<inst_data = [8, 16]>>
      %1 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<32x16xf16, #xegpu.layout<inst_data = [8, 16]>> -> vector<32x16xf16>
      %2 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<inst_data = [32, 16]>}> : !xegpu.tensor_desc<32x16xf16, #xegpu.layout<inst_data = [8, 16]>> -> vector<32x16xf16>
      xegpu.prefetch_nd %0[%c0, %c0] <{layout = #xegpu.layout<inst_data = [16, 16]>}> : !xegpu.tensor_desc<32x16xf16, #xegpu.layout<inst_data = [8, 16]>>
      return
    }
    func.func @load_nd_with_conflicting_tensor_desc_in_loop(%arg0: memref<64x64xf16>) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      %cst = arith.constant {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} dense<0.000000e+00> : vector<16x16xf16>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<64x64xf16> -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>
      %1:2 = scf.for %arg1 = %c0 to %c4 step %c1 iter_args(%arg2 = %cst, %arg3 = %0) -> (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>) {
        %2 = xegpu.load_nd %arg3[%c0, %c0] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>> -> vector<16x16xf16>
        %3 = arith.addf %arg2, %2 {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : vector<16x16xf16>
        scf.yield %3, %arg3 : vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>
      } {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>}
      xegpu.prefetch_nd %0[%c0, %c0] <{layout = #xegpu.layout<inst_data = [16, 16]>}> : !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>
      return
    }
    func.func @elementwise_conflict() {
      %0 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : () -> vector<32x32xf16>
      %1 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [32, 16]>} : () -> vector<32x32xf16>
      %2 = arith.addf %0, %1 {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : vector<32x32xf16>
      return
    }
    func.func @elementwise_conflict_uniform() {
      %0 = "some_op"() : () -> vector<2xf16>
      %1 = "some_op"() : () -> vector<2xf16>
      %2 = arith.addf %0, %1 : vector<2xf16>
      return
    }
    func.func @broadcast_source_conflict() {
      %0 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [16]>} : () -> vector<16xf16>
      %1 = vector.broadcast %0 {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>} : vector<16xf16> to vector<16x16xf16>
      return
    }
    func.func @shapecast_source_conflict() {
      %0 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [1, 2, 16]>} : () -> vector<2x4x32xf16>
      %1 = vector.shape_cast %0 {layout_result_0 = #xegpu.layout<inst_data = [1, 32]>} : vector<2x4x32xf16> to vector<1x256xf16>
      return
    }
    func.func @bitcast_source_conflict() {
      %0 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [1, 16]>} : () -> vector<32x16xf32>
      %1 = vector.bitcast %0 {layout_result_0 = #xegpu.layout<inst_data = [16, 32]>} : vector<32x16xf32> to vector<32x32xf16>
      return
    }
    func.func @multireduction_source_conflict() {
      %0 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [32, 16]>} : () -> vector<32x32xf16>
      %cst = arith.constant {layout_result_0 = #xegpu.layout<inst_data = [32]>} dense<0.000000e+00> : vector<32xf16>
      %1 = vector.multi_reduction <add>, %0, %cst {layout_result_0 = #xegpu.slice<#xegpu.layout<inst_data = [16, 16]>, dims = [0]>} [0] : vector<32x32xf16> to vector<32xf16>
      return
    }
    func.func @insert_strided_slice_source_conflict() {
      %0 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [1, 16]>} : () -> vector<16x16xf16>
      %cst = arith.constant {layout_result_0 = #xegpu.layout<inst_data = [1, 16, 16]>} dense<0.000000e+00> : vector<2x32x32xf16>
      %1 = vector.insert_strided_slice %0, %cst {layout_result_0 = #xegpu.layout<inst_data = [1, 16, 16]>, offsets = [0, 0, 0], strides = [1, 1]} : vector<16x16xf16> into vector<2x32x32xf16>
      return
    }
    func.func @conflict_inside_loop() {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      %cst = arith.constant {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} dense<0.000000e+00> : vector<16x16xf16>
      %0 = scf.for %arg0 = %c0 to %c4 step %c1 iter_args(%arg1 = %cst) -> (vector<16x16xf16>) {
        %1 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>} : () -> vector<16x16xf16>
        %2 = arith.addf %arg1, %1 {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : vector<16x16xf16>
        scf.yield %2 : vector<16x16xf16>
      } {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>}
      return
    }
    func.func @conflict_postop() {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c4 = arith.constant 4 : index
      %cst = arith.constant {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>} dense<0.000000e+00> : vector<16x16xf16>
      %0 = scf.for %arg0 = %c0 to %c4 step %c1 iter_args(%arg1 = %cst) -> (vector<16x16xf16>) {
        %2 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>} : () -> vector<16x16xf16>
        %3 = arith.addf %arg1, %2 {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>} : vector<16x16xf16>
        scf.yield %3 : vector<16x16xf16>
      } {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>}
      %1 = math.exp %0 {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : vector<16x16xf16>
      return
    }
    func.func @convert_layout() {
      %cst = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [4, 32]>} dense<0.000000e+00> : vector<32x128xf32>
      %0 = xegpu.convert_layout %cst <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [4, 32]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [4, 32]>}> : vector<32x128xf32>
      %cst_0 = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 16]>} dense<1.000000e+00> : vector<32x128xf32>
      %1 = arith.addf %0, %cst_0 {layout_result_0 = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 16]>} : vector<32x128xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 16]>, target_layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 16]>}> : vector<32x128xf32>
      return
    }
    gpu.func @step_clone_via_anchor(%arg0: i64, %arg1: memref<32x32xf32>) kernel {
      %cst = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} dense<true> : vector<32x32xi1>
      %cst_0 = arith.constant {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 1]>, dims = [1]>} dense<32> : vector<32xindex>
      %0 = vector.step {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>, dims = [0]>} : vector<32xindex>
      %1 = arith.muli %0, %cst_0 {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 1]>, dims = [1]>} : vector<32xindex>
      %2 = vector.shape_cast %1 {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 1]>} : vector<32xindex> to vector<32x1xindex>
      %3 = vector.broadcast %2 {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} : vector<32x1xindex> to vector<32x32xindex>
      %4 = vector.broadcast %0 {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} : vector<32xindex> to vector<32x32xindex>
      %5 = arith.addi %3, %4 {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} : vector<32x32xindex>
      %6 = xegpu.load %arg0[%5], %cst <{layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>}> : i64, vector<32x32xindex>, vector<32x32xi1> -> vector<32x32xf32>
      %7 = xegpu.create_nd_tdesc %arg1 : memref<32x32xf32> -> !xegpu.tensor_desc<32x32xf32>
      xegpu.store_nd %6, %7[0, 0] <{layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>}> : vector<32x32xf32>, !xegpu.tensor_desc<32x32xf32>
      gpu.return
    }
    gpu.func @step_muli_clone_via_anchor(%arg0: i64, %arg1: memref<32x32xf32>) kernel {
      %cst = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} dense<true> : vector<32x32xi1>
      %cst_0 = arith.constant {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>, dims = [0]>} dense<32> : vector<32xindex>
      %0 = vector.step {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>, dims = [0]>} : vector<32xindex>
      %1 = arith.muli %0, %cst_0 {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>, dims = [0]>} : vector<32xindex>
      %2 = vector.shape_cast %1 {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 1]>} : vector<32xindex> to vector<32x1xindex>
      %3 = vector.broadcast %2 {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} : vector<32x1xindex> to vector<32x32xindex>
      %4 = vector.broadcast %1 {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} : vector<32xindex> to vector<32x32xindex>
      %5 = arith.addi %3, %4 {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} : vector<32x32xindex>
      %6 = xegpu.load %arg0[%5], %cst <{layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>}> : i64, vector<32x32xindex>, vector<32x32xi1> -> vector<32x32xf32>
      %7 = xegpu.create_nd_tdesc %arg1 : memref<32x32xf32> -> !xegpu.tensor_desc<32x32xf32>
      xegpu.store_nd %6, %7[0, 0] <{layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>}> : vector<32x32xf32>, !xegpu.tensor_desc<32x32xf32>
      gpu.return
    }
    func.func @extract_source_conflict_with_order() -> vector<16x32xf16> {
      %0 = "some_op"() {layout_result_0 = #xegpu.layout<lane_layout = [1, 1, 1, 16], lane_data = [1, 1, 1, 1], order = [2, 3, 0, 1]>} : () -> vector<2x4x16x32xf16>
      %1 = vector.extract %0[0, 0] {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [0, 1]>} : vector<16x32xf16> from vector<2x4x16x32xf16>
      return %1 : vector<16x32xf16>
    }
  }
}

// -----
module {
  gpu.module @test_convert_layout_bridge {
    func.func @convert_layout_bridge_input_mismatch() {
      %0 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : () -> vector<32x32xf16>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<inst_data = [16, 16]>, target_layout = #xegpu.layout<inst_data = [32, 16]>}> : vector<32x32xf16>
      return
    }
  }
}

