"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<1024x1024xf16>, memref<1024x1024xf16>, memref<1024x1024xf32>) -> ()}> ({
    ^bb0(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 16 : index}> : () -> index
      %2 = "arith.constant"() <{value = 32 : index}> : () -> index
      %3 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %4 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %5 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %6 = "arith.muli"(%4, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %7 = "arith.muli"(%5, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %8 = "xegpu.create_nd_tdesc"(%arg2, %6, %7) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf32>, index, index) -> !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %9 = "xegpu.load_nd"(%8) <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (!xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>) -> vector<16x32xf32>
      %10 = "xegpu.create_nd_tdesc"(%arg0, %6, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %11 = "xegpu.create_nd_tdesc"(%arg1, %0, %7) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %12:3 = "scf.for"(%0, %3, %2, %10, %11, %9) ({
      ^bb0(%arg3: index, %arg4: !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, %arg5: !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, %arg6: vector<16x32xf32>):
        %13 = "xegpu.load_nd"(%arg4) <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>) -> vector<16x32xf16>
        %14 = "xegpu.load_nd"(%arg5) <{layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : (!xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>) -> vector<32x32xf16>
        %15 = "xegpu.dpas"(%13, %14, %arg6) <{layout_a = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, layout_cd = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (vector<16x32xf16>, vector<32x32xf16>, vector<16x32xf32>) -> vector<16x32xf32>
        %16 = "xegpu.update_nd_offset"(%arg4, %0, %2) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, index, index) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
        %17 = "xegpu.update_nd_offset"(%arg5, %2, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, index, index) -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
        "scf.yield"(%16, %17, %15) : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, vector<16x32xf32>) -> ()
      }) : (index, index, index, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, vector<16x32xf32>) -> (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, vector<16x32xf32>)
      "xegpu.store_nd"(%12#2, %8) <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (vector<16x32xf32>, !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm_with_one_to_n_lowering", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<1024x1024xf16>, memref<1024x1024xf16>, memref<1024x1024xf32>) -> ()}> ({
    ^bb0(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 16 : index}> : () -> index
      %2 = "arith.constant"() <{value = 32 : index}> : () -> index
      %3 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %4 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %5 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %6 = "arith.muli"(%4, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %7 = "arith.muli"(%5, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %8 = "xegpu.create_nd_tdesc"(%arg2, %6, %7) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf32>, index, index) -> !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %9 = "xegpu.load_nd"(%8) <{layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> vector<16x32xf32>
      %10 = "xegpu.create_nd_tdesc"(%arg0, %6, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      %11 = "xegpu.create_nd_tdesc"(%arg1, %0, %7) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>>
      %12:3 = "scf.for"(%0, %3, %2, %10, %11, %9) ({
      ^bb0(%arg3: index, %arg4: !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, %arg5: !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>>, %arg6: vector<16x32xf32>):
        %13 = "xegpu.load_nd"(%arg4) <{layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>) -> vector<16x32xf16>
        %14 = "xegpu.load_nd"(%arg5) <{layout = #xegpu.layout<inst_data = [16, 16]>}> : (!xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>>) -> vector<32x32xf16>
        %15 = "xegpu.dpas"(%13, %14, %arg6) <{layout_a = #xegpu.layout<inst_data = [8, 16]>, layout_b = #xegpu.layout<inst_data = [16, 16]>, layout_cd = #xegpu.layout<inst_data = [8, 16]>}> {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : (vector<16x32xf16>, vector<32x32xf16>, vector<16x32xf32>) -> vector<16x32xf32>
        %16 = "xegpu.update_nd_offset"(%arg4, %0, %2) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, index, index) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
        %17 = "xegpu.update_nd_offset"(%arg5, %2, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>>, index, index) -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>>
        "scf.yield"(%16, %17, %15) : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>>, vector<16x32xf32>) -> ()
      }) : (index, index, index, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>>, vector<16x32xf32>) -> (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>>, vector<16x32xf32>)
      "xegpu.store_nd"(%12#2, %8) <{layout = #xegpu.layout<inst_data = [8, 16]>}> : (vector<16x32xf32>, !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm_with_inst_data_only_attribute", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<1024x1024xf16>, memref<1024x1024xf16>, memref<1024x1024xf32>) -> ()}> ({
    ^bb0(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 8 : index}> : () -> index
      %2 = "arith.constant"() <{value = 16 : index}> : () -> index
      %3 = "arith.constant"() <{value = 32 : index}> : () -> index
      %4 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %5 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %6 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %7 = "arith.muli"(%5, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %8 = "arith.muli"(%6, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %9 = "xegpu.create_nd_tdesc"(%arg2, %7, %8) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf32>, index, index) -> !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %10 = "xegpu.load_nd"(%9) <{layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> vector<8x32xf32>
      %11 = "xegpu.create_nd_tdesc"(%arg0, %7, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>>
      %12 = "xegpu.create_nd_tdesc"(%arg1, %0, %8) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>>
      %13:3 = "scf.for"(%0, %4, %2, %11, %12, %10) ({
      ^bb0(%arg3: index, %arg4: !xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>>, %arg5: !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>>, %arg6: vector<8x32xf32>):
        %14 = "xegpu.load_nd"(%arg4) <{layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>>) -> vector<8x16xf16>
        %15 = "xegpu.load_nd"(%arg5) <{layout = #xegpu.layout<inst_data = [16, 16]>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>>) -> vector<16x32xf16>
        %16 = "xegpu.dpas"(%14, %15, %arg6) <{layout_a = #xegpu.layout<inst_data = [8, 16]>, layout_b = #xegpu.layout<inst_data = [16, 16]>, layout_cd = #xegpu.layout<inst_data = [8, 16]>}> {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : (vector<8x16xf16>, vector<16x32xf16>, vector<8x32xf32>) -> vector<8x32xf32>
        %17 = "xegpu.update_nd_offset"(%arg4, %0, %3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>>, index, index) -> !xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>>
        %18 = "xegpu.update_nd_offset"(%arg5, %3, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>>, index, index) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>>
        "scf.yield"(%17, %18, %16) : (!xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>>, vector<8x32xf32>) -> ()
      }) : (index, index, index, !xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>>, vector<8x32xf32>) -> (!xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>>, vector<8x32xf32>)
      "xegpu.store_nd"(%13#2, %9) <{layout = #xegpu.layout<inst_data = [8, 16]>}> : (vector<8x32xf32>, !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm_with_one_to_one_lowering", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<1024x1024xf16>, memref<1024x1024xf16>, memref<1024x1024xf32>) -> ()}> ({
    ^bb0(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 16 : index}> : () -> index
      %2 = "arith.constant"() <{value = 32 : index}> : () -> index
      %3 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %4 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %5 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %6 = "arith.muli"(%4, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %7 = "arith.muli"(%5, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %8 = "xegpu.create_nd_tdesc"(%arg2, %6, %7) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf32>, index, index) -> !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %9 = "xegpu.load_nd"(%8) <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (!xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>) -> vector<16x32xf32>
      %10 = "xegpu.create_nd_tdesc"(%arg0, %6, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %11 = "xegpu.create_nd_tdesc"(%arg1, %0, %7) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %12:3 = "scf.for"(%0, %3, %2, %10, %11, %9) ({
      ^bb0(%arg3: index, %arg4: !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, %arg5: !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, %arg6: vector<16x32xf32>):
        %13 = "xegpu.load_nd"(%arg4) <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>) -> vector<16x32xf16>
        %14 = "xegpu.load_nd"(%arg5) <{layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : (!xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>) -> vector<32x32xf16>
        %15 = "math.exp"(%13) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>} : (vector<16x32xf16>) -> vector<16x32xf16>
        %16 = "xegpu.dpas"(%15, %14, %arg6) <{layout_a = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, layout_cd = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> {layout_result_0 = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>} : (vector<16x32xf16>, vector<32x32xf16>, vector<16x32xf32>) -> vector<16x32xf32>
        %17 = "xegpu.update_nd_offset"(%arg4, %0, %2) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, index, index) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
        %18 = "xegpu.update_nd_offset"(%arg5, %2, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, index, index) -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
        "scf.yield"(%17, %18, %16) : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, vector<16x32xf32>) -> ()
      }) : (index, index, index, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, vector<16x32xf32>) -> (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, vector<16x32xf32>)
      "xegpu.store_nd"(%12#2, %8) <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (vector<16x32xf32>, !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm_with_elemwise_preop", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<1024x1024xf16>, memref<1024x1024xf16>, memref<1024x1024xf16>) -> ()}> ({
    ^bb0(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 32 : index}> : () -> index
      %2 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %3 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %4 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %5 = "arith.muli"(%3, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %6 = "xegpu.create_nd_tdesc"(%arg0, %5, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      %7 = "xegpu.create_nd_tdesc"(%arg1, %5, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      %8 = "xegpu.create_nd_tdesc"(%arg2, %5, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      %9:3 = "scf.for"(%0, %2, %1, %6, %7, %8) ({
      ^bb0(%arg3: index, %arg4: !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, %arg5: !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, %arg6: !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>):
        %10 = "xegpu.load_nd"(%arg4) <{layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>) -> vector<16x32xf16>
        %11 = "xegpu.load_nd"(%arg5) <{layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>) -> vector<16x32xf16>
        %12 = "arith.addf"(%10, %11) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : (vector<16x32xf16>, vector<16x32xf16>) -> vector<16x32xf16>
        "xegpu.store_nd"(%12, %arg6) <{layout = #xegpu.layout<inst_data = [8, 16]>}> : (vector<16x32xf16>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>) -> ()
        %13 = "xegpu.update_nd_offset"(%arg4, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, index, index) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
        %14 = "xegpu.update_nd_offset"(%arg5, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, index, index) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
        %15 = "xegpu.update_nd_offset"(%arg6, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, index, index) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
        "scf.yield"(%13, %14, %15) : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      }) : (index, index, index, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>) -> (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>)
      "gpu.return"() : () -> ()
    }) {sym_name = "elementwise_with_inst_data_only", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<1024x1024xf16>, memref<1024x1024xf16>, memref<1024x1024xf16>) -> ()}> ({
    ^bb0(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 32 : index}> : () -> index
      %2 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %3 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %4 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %5 = "arith.muli"(%3, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %6 = "xegpu.create_nd_tdesc"(%arg0, %5, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
      %7 = "xegpu.create_nd_tdesc"(%arg1, %5, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
      %8 = "xegpu.create_nd_tdesc"(%arg2, %5, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<1024x1024xf16>, index, index) -> !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
      %9:3 = "scf.for"(%0, %2, %1, %6, %7, %8) ({
      ^bb0(%arg3: index, %arg4: !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, %arg5: !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, %arg6: !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>):
        %10 = "xegpu.load_nd"(%arg4) <{layout = #xegpu.layout<inst_data = [8]>}> : (!xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>) -> vector<32xf16>
        %11 = "xegpu.load_nd"(%arg5) <{layout = #xegpu.layout<inst_data = [8]>}> : (!xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>) -> vector<32xf16>
        %12 = "arith.addf"(%10, %11) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<inst_data = [8]>} : (vector<32xf16>, vector<32xf16>) -> vector<32xf16>
        "xegpu.store_nd"(%12, %arg6) <{layout = #xegpu.layout<inst_data = [8]>}> : (vector<32xf16>, !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>) -> ()
        %13 = "xegpu.update_nd_offset"(%arg4, %1) <{const_offsets = array<i64: -9223372036854775808>}> : (!xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, index) -> !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
        %14 = "xegpu.update_nd_offset"(%arg5, %1) <{const_offsets = array<i64: -9223372036854775808>}> : (!xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, index) -> !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
        %15 = "xegpu.update_nd_offset"(%arg6, %1) <{const_offsets = array<i64: -9223372036854775808>}> : (!xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, index) -> !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
        "scf.yield"(%13, %14, %15) : (!xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>) -> ()
      }) : (index, index, index, !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>) -> (!xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>)
      "gpu.return"() : () -> ()
    }) {sym_name = "elementwise_1D", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<16x512xf32>, memref<512xf32>) -> ()}> ({
    ^bb0(%arg0: memref<16x512xf32>, %arg1: memref<512xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<64xf32>}> : () -> vector<64xf32>
      %1 = "arith.constant"() <{value = 64 : index}> : () -> index
      %2 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %3 = "arith.muli"(%2, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %4 = "xegpu.create_nd_tdesc"(%arg0, %3) <{const_offsets = array<i64: 0, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (memref<16x512xf32>, index) -> !xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      %5 = "xegpu.load_nd"(%4) <{layout = #xegpu.layout<inst_data = [16, 16]>}> : (!xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>>) -> vector<16x64xf32>
      %6 = "vector.multi_reduction"(%5, %0) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> {layout_result_0 = #xegpu.layout<inst_data = [16]>} : (vector<16x64xf32>, vector<64xf32>) -> vector<64xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg1, %3) <{const_offsets = array<i64: -9223372036854775808>, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (memref<512xf32>, index) -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      "xegpu.store_nd"(%6, %7) <{layout = #xegpu.layout<inst_data = [16]>}> : (vector<64xf32>, !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {VectorComputeFunctionINTEL, gpu.kernel, spirv.entry_point_abi = #spirv.entry_point_abi<>, sym_name = "reduce_dim_0", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<512x32xf32>, memref<512xf32>) -> ()}> ({
    ^bb0(%arg0: memref<512x32xf32>, %arg1: memref<512xf32>):
      %0 = "arith.constant"() <{value = 1 : index}> : () -> index
      %1 = "arith.constant"() <{value = 32 : index}> : () -> index
      %2 = "arith.constant"() <{value = dense<0.000000e+00> : vector<32xf32>}> : () -> vector<32xf32>
      %3 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %4 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %5 = "arith.muli"(%3, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %6 = "arith.muli"(%4, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %7 = "xegpu.create_nd_tdesc"(%arg0, %5, %6) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<512x32xf32>, index, index) -> !xegpu.tensor_desc<32x128xf32, #xegpu.layout<inst_data = [16, 16]>>
      %8 = "xegpu.load_nd"(%7) <{layout = #xegpu.layout<inst_data = [16, 16]>}> : (!xegpu.tensor_desc<32x128xf32, #xegpu.layout<inst_data = [16, 16]>>) -> vector<32x128xf32>
      %9 = "vector.multi_reduction"(%8, %2) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> {layout_result_0 = #xegpu.layout<inst_data = [16]>} : (vector<32x128xf32>, vector<32xf32>) -> vector<32xf32>
      %10 = "xegpu.create_nd_tdesc"(%arg1, %6) <{const_offsets = array<i64: -9223372036854775808>, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (memref<512xf32>, index) -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
      "xegpu.store_nd"(%9, %10) <{layout = #xegpu.layout<inst_data = [16]>}> : (vector<32xf32>, !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {VectorComputeFunctionINTEL, gpu.kernel, spirv.entry_point_abi = #spirv.entry_point_abi<>, sym_name = "reduce_dim_1", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<512xf32>, memref<16x512xf32>) -> ()}> ({
    ^bb0(%arg0: memref<512xf32>, %arg1: memref<16x512xf32>):
      %0 = "arith.constant"() <{value = 64 : index}> : () -> index
      %1 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %2 = "arith.muli"(%1, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %3 = "xegpu.create_nd_tdesc"(%arg0, %2) <{const_offsets = array<i64: -9223372036854775808>, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (memref<512xf32>, index) -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      %4 = "xegpu.load_nd"(%3) <{layout = #xegpu.layout<inst_data = [16]>}> : (!xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>) -> vector<64xf32>
      %5 = "vector.broadcast"(%4) {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>} : (vector<64xf32>) -> vector<16x64xf32>
      %6 = "xegpu.create_nd_tdesc"(%arg1, %2) <{const_offsets = array<i64: 0, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (memref<16x512xf32>, index) -> !xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      "xegpu.store_nd"(%5, %6) <{layout = #xegpu.layout<inst_data = [16, 16]>}> : (vector<16x64xf32>, !xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {VectorComputeFunctionINTEL, gpu.kernel, spirv.entry_point_abi = #spirv.entry_point_abi<>, sym_name = "broadcast_dim_0", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<512xf32>, memref<16x512xf32>) -> ()}> ({
    ^bb0(%arg0: memref<512xf32>, %arg1: memref<16x512xf32>):
      %0 = "arith.constant"() <{value = 32 : index}> : () -> index
      %1 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %2 = "arith.muli"(%1, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %3 = "xegpu.create_nd_tdesc"(%arg0, %2) <{const_offsets = array<i64: -9223372036854775808>, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (memref<512xf32>, index) -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
      %4 = "xegpu.load_nd"(%3) <{layout = #xegpu.layout<inst_data = [16]>}> : (!xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>) -> vector<32xf32>
      %5 = "vector.shape_cast"(%4) : (vector<32xf32>) -> vector<32x1xf32>
      %6 = "vector.broadcast"(%5) {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>} : (vector<32x1xf32>) -> vector<32x64xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg1, %2) <{const_offsets = array<i64: 0, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (memref<16x512xf32>, index) -> !xegpu.tensor_desc<32x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      "xegpu.store_nd"(%6, %7) : (vector<32x64xf32>, !xegpu.tensor_desc<32x64xf32, #xegpu.layout<inst_data = [16, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {VectorComputeFunctionINTEL, gpu.kernel, spirv.entry_point_abi = #spirv.entry_point_abi<>, sym_name = "broadcast_dim_1", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<512x8xf32>, memref<8x512xf32>) -> ()}> ({
    ^bb0(%arg0: memref<512x8xf32>, %arg1: memref<8x512xf32>):
      %0 = "arith.constant"() <{value = 32 : index}> : () -> index
      %1 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %2 = "arith.muli"(%1, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %3 = "xegpu.create_nd_tdesc"(%arg0, %2) <{const_offsets = array<i64: -9223372036854775808, 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (memref<512x8xf32>, index) -> !xegpu.tensor_desc<32x8xf32, #xegpu.layout<inst_data = [16, 8]>>
      %4 = "xegpu.load_nd"(%3) <{layout = #xegpu.layout<inst_data = [16, 8]>}> : (!xegpu.tensor_desc<32x8xf32, #xegpu.layout<inst_data = [16, 8]>>) -> vector<32x8xf32>
      %5 = "vector.transpose"(%4) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : (vector<32x8xf32>) -> vector<8x32xf32>
      %6 = "xegpu.create_nd_tdesc"(%arg1, %2) <{const_offsets = array<i64: 0, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (memref<8x512xf32>, index) -> !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      "xegpu.store_nd"(%5, %6) <{layout = #xegpu.layout<inst_data = [8, 16]>}> : (vector<8x32xf32>, !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {VectorComputeFunctionINTEL, gpu.kernel, spirv.entry_point_abi = #spirv.entry_point_abi<>, sym_name = "transpose", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg0: ui64):
      %0 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %1 = "xegpu.create_tdesc"(%arg0, %0) : (ui64, vector<32xindex>) -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
      "xegpu.prefetch"(%1) <{layout = #xegpu.layout<inst_data = [16]>}> : (!xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>) -> ()
      %2 = "arith.constant"() <{value = dense<[32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 64, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 256]> : vector<32xindex>}> : () -> vector<32xindex>
      %3 = "xegpu.update_offset"(%1, %2) : (!xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>, vector<32xindex>) -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
      %4 = "arith.constant"() <{value = 17 : index}> : () -> index
      %5 = "vector.create_mask"(%4) : (index) -> vector<32xi1>
      %6 = "xegpu.load"(%3, %5) <{layout = #xegpu.layout<inst_data = [16]>}> : (!xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>, vector<32xi1>) -> vector<32xf32>
      %7 = "arith.addf"(%6, %6) <{fastmath = #arith.fastmath<none>}> : (vector<32xf32>, vector<32xf32>) -> vector<32xf32>
      "xegpu.store"(%7, %1, %5) <{layout = #xegpu.layout<inst_data = [16]>}> : (vector<32xf32>, !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "test_prefetch_load_store_update", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg0: ui64):
      %0 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %1 = "xegpu.create_tdesc"(%arg0, %0) : (ui64, vector<32xindex>) -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      "xegpu.prefetch"(%1) <{layout = #xegpu.layout<inst_data = [16, 2]>}> : (!xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>) -> ()
      %2 = "arith.constant"() <{value = dense<[32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 64, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 256]> : vector<32xindex>}> : () -> vector<32xindex>
      %3 = "xegpu.update_offset"(%1, %2) : (!xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>, vector<32xindex>) -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      %4 = "arith.constant"() <{value = 17 : index}> : () -> index
      %5 = "vector.create_mask"(%4) : (index) -> vector<32xi1>
      %6 = "xegpu.load"(%3, %5) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : (!xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>, vector<32xi1>) -> vector<32x4xf32>
      %7 = "arith.addf"(%6, %6) <{fastmath = #arith.fastmath<none>}> : (vector<32x4xf32>, vector<32x4xf32>) -> vector<32x4xf32>
      "xegpu.store"(%7, %1, %5) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : (vector<32x4xf32>, !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "test_prefetch_load_store_update_chunk", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg0: ui64):
      %0 = "arith.constant"() <{value = dense<[[0, 8, 16, 24, 32, 40, 48, 56], [64, 72, 80, 88, 96, 104, 112, 120], [128, 136, 144, 152, 160, 168, 176, 184], [192, 200, 208, 216, 224, 232, 240, 248]]> : vector<4x8xindex>}> : () -> vector<4x8xindex>
      %1 = "xegpu.create_tdesc"(%arg0, %0) : (ui64, vector<4x8xindex>) -> !xegpu.tensor_desc<4x8x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [2, 8, 2]>>
      "xegpu.prefetch"(%1) <{layout = #xegpu.layout<inst_data = [2, 8, 2]>}> : (!xegpu.tensor_desc<4x8x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [2, 8, 2]>>) -> ()
      %2 = "arith.constant"() <{value = dense<[[32, 32, 32, 32, 32, 32, 32, 32], [32, 32, 32, 32, 32, 32, 32, 64], [128, 128, 128, 128, 128, 128, 128, 128], [128, 128, 128, 128, 128, 128, 128, 256]]> : vector<4x8xindex>}> : () -> vector<4x8xindex>
      %3 = "xegpu.update_offset"(%1, %2) : (!xegpu.tensor_desc<4x8x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [2, 8, 2]>>, vector<4x8xindex>) -> !xegpu.tensor_desc<4x8x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [2, 8, 2]>>
      %4 = "arith.constant"() <{value = 4 : index}> : () -> index
      %5 = "vector.create_mask"(%4, %4) : (index, index) -> vector<4x8xi1>
      %6 = "xegpu.load"(%3, %5) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, layout = #xegpu.layout<inst_data = [2, 8, 2]>}> : (!xegpu.tensor_desc<4x8x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [2, 8, 2]>>, vector<4x8xi1>) -> vector<4x8x4xf32>
      %7 = "arith.addf"(%6, %6) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<inst_data = [2, 8, 2]>} : (vector<4x8x4xf32>, vector<4x8x4xf32>) -> vector<4x8x4xf32>
      "xegpu.store"(%7, %1, %5) <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, layout = #xegpu.layout<inst_data = [2, 8, 2]>}> : (vector<4x8x4xf32>, !xegpu.tensor_desc<4x8x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [2, 8, 2]>>, vector<4x8xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "test_3d_scattered_tensor_desc", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<16x16xf16>, memref<16x16xf16>, memref<16x16xf32>) -> ()}> ({
    ^bb0(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<16x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<16x16xf16>, index, index) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %2 = "xegpu.create_nd_tdesc"(%arg1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<16x16xf16>, index, index) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %3 = "xegpu.load_nd"(%1) <{layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>) -> vector<16x16xf16>
      %4 = "xegpu.load_nd"(%2) <{layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>) -> vector<16x16xf16>
      %5 = "xegpu.convert_layout"(%3) <{input_layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, target_layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (vector<16x16xf16>) -> vector<16x16xf16>
      %6 = "xegpu.dpas"(%5, %4) <{layout_a = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, layout_cd = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> {layout_result_0 = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>} : (vector<16x16xf16>, vector<16x16xf16>) -> vector<16x16xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (memref<16x16xf32>, index, index) -> !xegpu.tensor_desc<16x16xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      "xegpu.store_nd"(%6, %7) <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (vector<16x16xf32>, !xegpu.tensor_desc<16x16xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (vector<8x32x2xf16>) -> vector<8x32x2xf16>}> ({
    ^bb0(%arg0: vector<8x32x2xf16>):
      %0 = "xegpu.convert_layout"(%arg0) <{input_layout = #xegpu.layout<inst_data = [8, 32, 2], lane_layout = [1, 16, 1], lane_data = [8, 1, 2]>, target_layout = #xegpu.layout<inst_data = [8, 16, 2], lane_layout = [1, 16, 1], lane_data = [8, 1, 2]>}> : (vector<8x32x2xf16>) -> vector<8x32x2xf16>
      %1 = "math.exp"(%0) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<inst_data = [8, 16, 2], lane_layout = [1, 16, 1], lane_data = [8, 1, 2]>} : (vector<8x32x2xf16>) -> vector<8x32x2xf16>
      "gpu.return"(%1) : (vector<8x32x2xf16>) -> ()
    }) {sym_name = "convert_layout", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<4096xi8, 3>) -> vector<32x32xf32>}> ({
    ^bb0(%arg0: memref<4096xi8, 3>):
      %0 = "xegpu.create_mem_desc"(%arg0) : (memref<4096xi8, 3>) -> !xegpu.mem_desc<32x32xf32>
      %1 = "xegpu.load_matrix"(%0) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.mem_desc<32x32xf32>) -> vector<32x32xf32>
      "gpu.return"(%1) : (vector<32x32xf32>) -> ()
    }) {sym_name = "unroll_load_matrix", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (vector<32x32xf32>, memref<32768xi8, 3>) -> ()}> ({
    ^bb0(%arg0: vector<32x32xf32>, %arg1: memref<32768xi8, 3>):
      %0 = "xegpu.create_mem_desc"(%arg1) : (memref<32768xi8, 3>) -> !xegpu.mem_desc<64x128xf32>
      "xegpu.store_matrix"(%arg0, %0) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (vector<32x32xf32>, !xegpu.mem_desc<64x128xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "unroll_store_matrix", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (ui64) -> vector<32xf32>}> ({
    ^bb0(%arg0: ui64):
      %0 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %1 = "arith.constant"() <{value = 17 : index}> : () -> index
      %2 = "vector.create_mask"(%1) : (index) -> vector<32xi1>
      %3 = "xegpu.load"(%arg0, %0, %2) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : (ui64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
      "gpu.return"(%3) : (vector<32xf32>) -> ()
    }) {sym_name = "load_with_offsets", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg0: ui64):
      %0 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %1 = "arith.constant"() <{value = 17 : index}> : () -> index
      %2 = "vector.create_mask"(%1) : (index) -> vector<32xi1>
      %3 = "arith.constant"() <{value = dense<1.023000e+03> : vector<32xf32>}> : () -> vector<32xf32>
      "xegpu.store"(%3, %arg0, %0, %2) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : (vector<32xf32>, ui64, vector<32xindex>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_with_offsets", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (ui64) -> vector<32x4xf32>}> ({
    ^bb0(%arg0: ui64):
      %0 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %1 = "arith.constant"() <{value = 17 : index}> : () -> index
      %2 = "vector.create_mask"(%1) : (index) -> vector<32xi1>
      %3 = "xegpu.load"(%arg0, %0, %2) <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : (ui64, vector<32xindex>, vector<32xi1>) -> vector<32x4xf32>
      "gpu.return"(%3) : (vector<32x4xf32>) -> ()
    }) {sym_name = "load_with_offsets_chunk", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg0: ui64):
      %0 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %1 = "arith.constant"() <{value = 17 : index}> : () -> index
      %2 = "vector.create_mask"(%1) : (index) -> vector<32xi1>
      %3 = "arith.constant"() <{value = dense<1.023000e+03> : vector<32x4xf32>}> : () -> vector<32x4xf32>
      "xegpu.store"(%3, %arg0, %0, %2) <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : (vector<32x4xf32>, ui64, vector<32xindex>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_with_offsets_chunk", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (ui64) -> vector<1x1x32xf32>}> ({
    ^bb0(%arg0: ui64):
      %0 = "arith.constant"() <{value = dense<[[[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]]]> : vector<1x1x32xindex>}> {layout_result_0 = #xegpu.layout<inst_data = [1, 1, 16]>} : () -> vector<1x1x32xindex>
      %1 = "arith.constant"() <{value = dense<true> : vector<1x1x32xi1>}> {layout_result_0 = #xegpu.layout<inst_data = [1, 1, 16]>} : () -> vector<1x1x32xi1>
      %2 = "xegpu.load"(%arg0, %0, %1) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [1, 1, 16]>}> : (ui64, vector<1x1x32xindex>, vector<1x1x32xi1>) -> vector<1x1x32xf32>
      "gpu.return"(%2) : (vector<1x1x32xf32>) -> ()
    }) {sym_name = "remove_unit_dim_inst_data", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<1024x1024xf32>, memref<1024x1024xf32>, memref<1024x1024xf32>) -> ()}> ({
    ^bb0(%arg0: memref<1024x1024xf32>, %arg1: memref<1024x1024xf32>, %arg2: memref<1024x1024xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>
      %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>
      %3 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>
      %4 = "xegpu.load_nd"(%1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [1, 16]>}> : (!xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>, index, index) -> vector<1x32xf32>
      %5 = "xegpu.load_nd"(%2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [1, 16]>}> : (!xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>, index, index) -> vector<1x32xf32>
      %6 = "arith.addf"(%4, %5) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<inst_data = [1, 16]>} : (vector<1x32xf32>, vector<1x32xf32>) -> vector<1x32xf32>
      "xegpu.store_nd"(%6, %3, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [1, 16]>}> : (vector<1x32xf32>, !xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_store_nd_with_offsets", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (ui64, ui64, ui64) -> ()}> ({
    ^bb0(%arg0: ui64, %arg1: ui64, %arg2: ui64):
      %0 = "arith.constant"() <{value = dense<[[[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]]]> : vector<1x1x32xindex>}> {layout_result_0 = #xegpu.layout<inst_data = [1, 1, 32]>} : () -> vector<1x1x32xindex>
      %1 = "arith.constant"() <{value = dense<true> : vector<1x1x32xi1>}> {layout_result_0 = #xegpu.layout<inst_data = [1, 1, 32]>} : () -> vector<1x1x32xi1>
      %2 = "xegpu.load"(%arg0, %0, %1) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [1, 1, 32]>}> : (ui64, vector<1x1x32xindex>, vector<1x1x32xi1>) -> vector<1x1x32xf32>
      %3 = "xegpu.load"(%arg1, %0, %1) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [1, 1, 32]>}> : (ui64, vector<1x1x32xindex>, vector<1x1x32xi1>) -> vector<1x1x32xf32>
      %4 = "arith.addf"(%2, %3) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<inst_data = [1, 1, 32]>} : (vector<1x1x32xf32>, vector<1x1x32xf32>) -> vector<1x1x32xf32>
      "xegpu.store"(%4, %arg2, %0, %1) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [1, 1, 32]>}> : (vector<1x1x32xf32>, ui64, vector<1x1x32xindex>, vector<1x1x32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_add_store_leading_unit_dims", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

