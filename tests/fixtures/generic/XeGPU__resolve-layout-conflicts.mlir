"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<64x64xf16>) -> (), sym_name = "load_nd_with_conflicting_tensor_desc"}> ({
    ^bb0(%arg13: memref<64x64xf16>):
      %72 = "arith.constant"() <{value = 0 : index}> : () -> index
      %73 = "xegpu.create_nd_tdesc"(%arg13) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<64x64xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>
      %74 = "xegpu.load_nd"(%73, %72, %72) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>, index, index) -> vector<16x16xf16>
      "xegpu.prefetch_nd"(%73, %72, %72) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [16, 16]>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>, index, index) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = (memref<64x64xf16>) -> (), sym_name = "multiple_tensor_desc_conflicts"}> ({
    ^bb0(%arg12: memref<64x64xf16>):
      %68 = "arith.constant"() <{value = 0 : index}> : () -> index
      %69 = "xegpu.create_nd_tdesc"(%arg12) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<64x64xf16>) -> !xegpu.tensor_desc<32x16xf16, #xegpu.layout<inst_data = [8, 16]>>
      %70 = "xegpu.load_nd"(%69, %68, %68) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<32x16xf16, #xegpu.layout<inst_data = [8, 16]>>, index, index) -> vector<32x16xf16>
      %71 = "xegpu.load_nd"(%69, %68, %68) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [32, 16]>}> : (!xegpu.tensor_desc<32x16xf16, #xegpu.layout<inst_data = [8, 16]>>, index, index) -> vector<32x16xf16>
      "xegpu.prefetch_nd"(%69, %68, %68) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [16, 16]>}> : (!xegpu.tensor_desc<32x16xf16, #xegpu.layout<inst_data = [8, 16]>>, index, index) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = (memref<64x64xf16>) -> (), sym_name = "load_nd_with_conflicting_tensor_desc_in_loop"}> ({
    ^bb0(%arg8: memref<64x64xf16>):
      %60 = "arith.constant"() <{value = 0 : index}> : () -> index
      %61 = "arith.constant"() <{value = 1 : index}> : () -> index
      %62 = "arith.constant"() <{value = 4 : index}> : () -> index
      %63 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16x16xf16>}> {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : () -> vector<16x16xf16>
      %64 = "xegpu.create_nd_tdesc"(%arg8) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<64x64xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>
      %65:2 = "scf.for"(%60, %62, %61, %63, %64) ({
      ^bb0(%arg9: index, %arg10: vector<16x16xf16>, %arg11: !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>):
        %66 = "xegpu.load_nd"(%arg11, %60, %60) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>, index, index) -> vector<16x16xf16>
        %67 = "arith.addf"(%arg10, %66) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : (vector<16x16xf16>, vector<16x16xf16>) -> vector<16x16xf16>
        "scf.yield"(%67, %arg11) : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>) -> ()
      }) {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : (index, index, index, vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>) -> (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>)
      "xegpu.prefetch_nd"(%64, %60, %60) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [16, 16]>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16]>>, index, index) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "elementwise_conflict"}> ({
      %57 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : () -> vector<32x32xf16>
      %58 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [32, 16]>} : () -> vector<32x32xf16>
      %59 = "arith.addf"(%57, %58) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : (vector<32x32xf16>, vector<32x32xf16>) -> vector<32x32xf16>
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "elementwise_conflict_uniform"}> ({
      %54 = "some_op"() : () -> vector<2xf16>
      %55 = "some_op"() : () -> vector<2xf16>
      %56 = "arith.addf"(%54, %55) <{fastmath = #arith.fastmath<none>}> : (vector<2xf16>, vector<2xf16>) -> vector<2xf16>
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "broadcast_source_conflict"}> ({
      %52 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [16]>} : () -> vector<16xf16>
      %53 = "vector.broadcast"(%52) {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>} : (vector<16xf16>) -> vector<16x16xf16>
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "shapecast_source_conflict"}> ({
      %50 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [1, 2, 16]>} : () -> vector<2x4x32xf16>
      %51 = "vector.shape_cast"(%50) {layout_result_0 = #xegpu.layout<inst_data = [1, 32]>} : (vector<2x4x32xf16>) -> vector<1x256xf16>
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "bitcast_source_conflict"}> ({
      %48 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [1, 16]>} : () -> vector<32x16xf32>
      %49 = "vector.bitcast"(%48) {layout_result_0 = #xegpu.layout<inst_data = [16, 32]>} : (vector<32x16xf32>) -> vector<32x32xf16>
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "multireduction_source_conflict"}> ({
      %45 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [32, 16]>} : () -> vector<32x32xf16>
      %46 = "arith.constant"() <{value = dense<0.000000e+00> : vector<32xf16>}> {layout_result_0 = #xegpu.layout<inst_data = [32]>} : () -> vector<32xf16>
      %47 = "vector.multi_reduction"(%45, %46) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<inst_data = [16, 16]>, dims = [0]>} : (vector<32x32xf16>, vector<32xf16>) -> vector<32xf16>
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "insert_strided_slice_source_conflict"}> ({
      %42 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [1, 16]>} : () -> vector<16x16xf16>
      %43 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2x32x32xf16>}> {layout_result_0 = #xegpu.layout<inst_data = [1, 16, 16]>} : () -> vector<2x32x32xf16>
      %44 = "vector.insert_strided_slice"(%42, %43) <{offsets = [0, 0, 0], strides = [1, 1]}> {layout_result_0 = #xegpu.layout<inst_data = [1, 16, 16]>} : (vector<16x16xf16>, vector<2x32x32xf16>) -> vector<2x32x32xf16>
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "conflict_inside_loop"}> ({
      %35 = "arith.constant"() <{value = 0 : index}> : () -> index
      %36 = "arith.constant"() <{value = 1 : index}> : () -> index
      %37 = "arith.constant"() <{value = 4 : index}> : () -> index
      %38 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16x16xf16>}> {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : () -> vector<16x16xf16>
      %39 = "scf.for"(%35, %37, %36, %38) ({
      ^bb0(%arg6: index, %arg7: vector<16x16xf16>):
        %40 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>} : () -> vector<16x16xf16>
        %41 = "arith.addf"(%arg7, %40) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : (vector<16x16xf16>, vector<16x16xf16>) -> vector<16x16xf16>
        "scf.yield"(%41) : (vector<16x16xf16>) -> ()
      }) {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : (index, index, index, vector<16x16xf16>) -> vector<16x16xf16>
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "conflict_postop"}> ({
      %27 = "arith.constant"() <{value = 0 : index}> : () -> index
      %28 = "arith.constant"() <{value = 1 : index}> : () -> index
      %29 = "arith.constant"() <{value = 4 : index}> : () -> index
      %30 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16x16xf16>}> {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>} : () -> vector<16x16xf16>
      %31 = "scf.for"(%27, %29, %28, %30) ({
      ^bb0(%arg4: index, %arg5: vector<16x16xf16>):
        %33 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>} : () -> vector<16x16xf16>
        %34 = "arith.addf"(%arg5, %33) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>} : (vector<16x16xf16>, vector<16x16xf16>) -> vector<16x16xf16>
        "scf.yield"(%34) : (vector<16x16xf16>) -> ()
      }) {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>} : (index, index, index, vector<16x16xf16>) -> vector<16x16xf16>
      %32 = "math.exp"(%31) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : (vector<16x16xf16>) -> vector<16x16xf16>
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = () -> (), sym_name = "convert_layout"}> ({
      %22 = "arith.constant"() <{value = dense<0.000000e+00> : vector<32x128xf32>}> {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [4, 32]>} : () -> vector<32x128xf32>
      %23 = "xegpu.convert_layout"(%22) <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [4, 32]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [4, 32]>}> : (vector<32x128xf32>) -> vector<32x128xf32>
      %24 = "arith.constant"() <{value = dense<1.000000e+00> : vector<32x128xf32>}> {layout_result_0 = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 16]>} : () -> vector<32x128xf32>
      %25 = "arith.addf"(%23, %24) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 16]>} : (vector<32x128xf32>, vector<32x128xf32>) -> vector<32x128xf32>
      %26 = "xegpu.convert_layout"(%25) <{input_layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 16]>, target_layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 16]>}> : (vector<32x128xf32>) -> vector<32x128xf32>
      "func.return"() : () -> ()
    }) : () -> ()
    "gpu.func"() <{function_type = (i64, memref<32x32xf32>) -> (), kernel}> ({
    ^bb0(%arg2: i64, %arg3: memref<32x32xf32>):
      %12 = "arith.constant"() <{value = dense<true> : vector<32x32xi1>}> {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} : () -> vector<32x32xi1>
      %13 = "arith.constant"() <{value = dense<32> : vector<32xindex>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 1]>, dims = [1]>} : () -> vector<32xindex>
      %14 = "vector.step"() {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>, dims = [0]>} : () -> vector<32xindex>
      %15 = "arith.muli"(%14, %13) <{overflowFlags = #arith.overflow<none>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 1]>, dims = [1]>} : (vector<32xindex>, vector<32xindex>) -> vector<32xindex>
      %16 = "vector.shape_cast"(%15) {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 1]>} : (vector<32xindex>) -> vector<32x1xindex>
      %17 = "vector.broadcast"(%16) {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} : (vector<32x1xindex>) -> vector<32x32xindex>
      %18 = "vector.broadcast"(%14) {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} : (vector<32xindex>) -> vector<32x32xindex>
      %19 = "arith.addi"(%17, %18) <{overflowFlags = #arith.overflow<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} : (vector<32x32xindex>, vector<32x32xindex>) -> vector<32x32xindex>
      %20 = "xegpu.load"(%arg2, %19, %12) <{layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>}> : (i64, vector<32x32xindex>, vector<32x32xi1>) -> vector<32x32xf32>
      %21 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x32xf32>) -> !xegpu.tensor_desc<32x32xf32>
      "xegpu.store_nd"(%20, %21) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>}> : (vector<32x32xf32>, !xegpu.tensor_desc<32x32xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "step_clone_via_anchor"} : () -> ()
    "gpu.func"() <{function_type = (i64, memref<32x32xf32>) -> (), kernel}> ({
    ^bb0(%arg0: i64, %arg1: memref<32x32xf32>):
      %2 = "arith.constant"() <{value = dense<true> : vector<32x32xi1>}> {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} : () -> vector<32x32xi1>
      %3 = "arith.constant"() <{value = dense<32> : vector<32xindex>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>, dims = [0]>} : () -> vector<32xindex>
      %4 = "vector.step"() {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>, dims = [0]>} : () -> vector<32xindex>
      %5 = "arith.muli"(%4, %3) <{overflowFlags = #arith.overflow<none>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>, dims = [0]>} : (vector<32xindex>, vector<32xindex>) -> vector<32xindex>
      %6 = "vector.shape_cast"(%5) {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 1]>} : (vector<32xindex>) -> vector<32x1xindex>
      %7 = "vector.broadcast"(%6) {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} : (vector<32x1xindex>) -> vector<32x32xindex>
      %8 = "vector.broadcast"(%5) {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} : (vector<32xindex>) -> vector<32x32xindex>
      %9 = "arith.addi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>} : (vector<32x32xindex>, vector<32x32xindex>) -> vector<32x32xindex>
      %10 = "xegpu.load"(%arg0, %9, %2) <{layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>}> : (i64, vector<32x32xindex>, vector<32x32xi1>) -> vector<32x32xf32>
      %11 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x32xf32>) -> !xegpu.tensor_desc<32x32xf32>
      "xegpu.store_nd"(%10, %11) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>}> : (vector<32x32xf32>, !xegpu.tensor_desc<32x32xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "step_muli_clone_via_anchor"} : () -> ()
    "func.func"() <{function_type = () -> vector<16x32xf16>, sym_name = "extract_source_conflict_with_order"}> ({
      %0 = "some_op"() {layout_result_0 = #xegpu.layout<lane_layout = [1, 1, 1, 16], lane_data = [1, 1, 1, 1], order = [2, 3, 0, 1]>} : () -> vector<2x4x16x32xf16>
      %1 = "vector.extract"(%0) <{static_position = array<i64: 0, 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1], order = [0, 1]>} : (vector<2x4x16x32xf16>) -> vector<16x32xf16>
      "func.return"(%1) : (vector<16x32xf16>) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_convert_layout_bridge"}> ({
    "func.func"() <{function_type = () -> (), sym_name = "convert_layout_bridge_input_mismatch"}> ({
      %0 = "some_op"() {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : () -> vector<32x32xf16>
      %1 = "xegpu.convert_layout"(%0) <{input_layout = #xegpu.layout<inst_data = [16, 16]>, target_layout = #xegpu.layout<inst_data = [32, 16]>}> : (vector<32x32xf16>) -> vector<32x32xf16>
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

