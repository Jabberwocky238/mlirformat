"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<4x64x256xf16>, memref<4x256x64xf16>, memref<4x64x64xf32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<4x64x256xf16>, %arg1: memref<4x256x64xf16>, %arg2: memref<4x64x64xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 32 : index}> : () -> index
      %2 = "arith.constant"() <{value = 64 : index}> : () -> index
      %3 = "arith.constant"() <{value = 96 : index}> : () -> index
      %4 = "arith.constant"() <{value = 256 : index}> : () -> index
      %5 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %6 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %7 = "gpu.block_id"() <{dimension = #gpu<dim z>}> : () -> index
      %8 = "arith.muli"(%5, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %9 = "arith.muli"(%6, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %10 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x64x64xf32>) -> !xegpu.tensor_desc<4x64x64xf32, #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 16], inst_data = [1, 8, 16]>>
      %11 = "xegpu.load_nd"(%10, %7, %8, %9) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 16], inst_data = [1, 8, 16]>}> : (!xegpu.tensor_desc<4x64x64xf32, #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 16], inst_data = [1, 8, 16]>>, index, index, index) -> vector<4x64x64xf32>
      %12 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x64x256xf16>) -> !xegpu.tensor_desc<4x64x32xf16, #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 32], inst_data = [1, 8, 16]>>
      %13 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x256x64xf16>) -> !xegpu.tensor_desc<4x32x64xf16, #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 32, 16], inst_data = [1, 16, 16]>>
      %14 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x64x256xf16>) -> !xegpu.tensor_desc<4x64x32xf16, #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>
      "xegpu.prefetch_nd"(%14, %7, %8, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : (!xegpu.tensor_desc<4x64x32xf16, #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>, index, index, index) -> ()
      "xegpu.prefetch_nd"(%14, %7, %8, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : (!xegpu.tensor_desc<4x64x32xf16, #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>, index, index, index) -> ()
      "xegpu.prefetch_nd"(%14, %7, %8, %2) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : (!xegpu.tensor_desc<4x64x32xf16, #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>, index, index, index) -> ()
      %15 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x256x64xf16>) -> !xegpu.tensor_desc<4x32x64xf16, #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>
      "xegpu.prefetch_nd"(%15, %7, %0, %9) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : (!xegpu.tensor_desc<4x32x64xf16, #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>, index, index, index) -> ()
      "xegpu.prefetch_nd"(%15, %7, %1, %9) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : (!xegpu.tensor_desc<4x32x64xf16, #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>, index, index, index) -> ()
      "xegpu.prefetch_nd"(%15, %7, %2, %9) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : (!xegpu.tensor_desc<4x32x64xf16, #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>, index, index, index) -> ()
      %16 = "scf.for"(%0, %4, %1, %11) ({
      ^bb0(%arg3: index, %arg4: vector<4x64x64xf32>):
        %17 = "xegpu.load_nd"(%12, %7, %8, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 32], inst_data = [1, 8, 16]>}> : (!xegpu.tensor_desc<4x64x32xf16, #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 32], inst_data = [1, 8, 16]>>, index, index, index) -> vector<4x64x32xf16>
        %18 = "xegpu.load_nd"(%13, %7, %arg3, %9) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 32, 16], inst_data = [1, 16, 16]>}> : (!xegpu.tensor_desc<4x32x64xf16, #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 32, 16], inst_data = [1, 16, 16]>>, index, index, index) -> vector<4x32x64xf16>
        %19 = "arith.addi"(%arg3, %3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        "xegpu.prefetch_nd"(%14, %7, %8, %19) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : (!xegpu.tensor_desc<4x64x32xf16, #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>, index, index, index) -> ()
        "xegpu.prefetch_nd"(%15, %7, %19, %9) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : (!xegpu.tensor_desc<4x32x64xf16, #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>, index, index, index) -> ()
        %20 = "xegpu.dpas"(%17, %18, %arg4) <{layout_a = #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 32], inst_data = [1, 8, 16]>, layout_b = #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 32, 16], inst_data = [1, 16, 16]>, layout_cd = #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 16], inst_data = [1, 8, 16]>}> : (vector<4x64x32xf16>, vector<4x32x64xf16>, vector<4x64x64xf32>) -> vector<4x64x64xf32>
        "scf.yield"(%20) : (vector<4x64x64xf32>) -> ()
      }) : (index, index, index, vector<4x64x64xf32>) -> vector<4x64x64xf32>
      "xegpu.store_nd"(%16, %10, %7, %8, %9) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 16], inst_data = [1, 8, 16]>}> : (vector<4x64x64xf32>, !xegpu.tensor_desc<4x64x64xf32, #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 16], inst_data = [1, 8, 16]>>, index, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "test_kernel"} : () -> ()
  }) : () -> ()
}) : () -> ()

