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
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %9 = "xegpu.load_nd"(%8) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (!xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>) -> vector<16x32xf32>
      %10 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %11 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %12 = "scf.for"(%0, %3, %2, %9) ({
      ^bb0(%arg3: index, %arg4: vector<16x32xf32>):
        %13 = "xegpu.load_nd"(%10, %0, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, index, index) -> vector<16x32xf16>
        %14 = "xegpu.load_nd"(%11, %arg3, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : (!xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, index, index) -> vector<32x32xf16>
        %15 = "xegpu.dpas"(%13, %14, %arg4) <{layout_a = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, layout_cd = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (vector<16x32xf16>, vector<32x32xf16>, vector<16x32xf32>) -> vector<16x32xf32>
        "scf.yield"(%15) : (vector<16x32xf32>) -> ()
      }) : (index, index, index, vector<16x32xf32>) -> vector<16x32xf32>
      "xegpu.store_nd"(%12, %8) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (vector<16x32xf32>, !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm_with_one_to_n_lowering"} : () -> ()
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
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %9 = "xegpu.load_nd"(%8) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> vector<16x32xf32>
      %10 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      %11 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>>
      %12 = "scf.for"(%0, %3, %2, %9) ({
      ^bb0(%arg3: index, %arg4: vector<16x32xf32>):
        %13 = "xegpu.load_nd"(%10, %0, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, index, index) -> vector<16x32xf16>
        %14 = "xegpu.load_nd"(%11, %arg3, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [16, 16]>}> : (!xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>>, index, index) -> vector<32x32xf16>
        %15 = "xegpu.dpas"(%13, %14, %arg4) <{layout_a = #xegpu.layout<inst_data = [8, 16]>, layout_b = #xegpu.layout<inst_data = [16, 16]>, layout_cd = #xegpu.layout<inst_data = [8, 16]>}> : (vector<16x32xf16>, vector<32x32xf16>, vector<16x32xf32>) -> vector<16x32xf32>
        "scf.yield"(%15) : (vector<16x32xf32>) -> ()
      }) : (index, index, index, vector<16x32xf32>) -> vector<16x32xf32>
      "xegpu.store_nd"(%12, %8) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (vector<16x32xf32>, !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm_with_inst_data_only_attribute"} : () -> ()
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
      %9 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %10 = "xegpu.load_nd"(%9) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> vector<8x32xf32>
      %11 = "arith.constant"() <{value = 2 : index}> : () -> index
      %12 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>>
      %13 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>>
      %14 = "scf.for"(%0, %4, %2, %10) ({
      ^bb0(%arg3: index, %arg4: vector<8x32xf32>):
        %15 = "arith.muli"(%arg3, %11) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
        %16 = "xegpu.load_nd"(%12, %0, %15) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>>, index, index) -> vector<8x16xf16>
        %17 = "xegpu.load_nd"(%13, %15, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [16, 16]>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>>, index, index) -> vector<16x32xf16>
        %18 = "xegpu.dpas"(%16, %17, %arg4) <{layout_a = #xegpu.layout<inst_data = [8, 16]>, layout_b = #xegpu.layout<inst_data = [16, 16]>, layout_cd = #xegpu.layout<inst_data = [8, 16]>}> : (vector<8x16xf16>, vector<16x32xf16>, vector<8x32xf32>) -> vector<8x32xf32>
        "scf.yield"(%18) : (vector<8x32xf32>) -> ()
      }) : (index, index, index, vector<8x32xf32>) -> vector<8x32xf32>
      "xegpu.store_nd"(%14, %9) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (vector<8x32xf32>, !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm_with_one_to_one_lowering"} : () -> ()
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
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %9 = "xegpu.load_nd"(%8) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (!xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>) -> vector<16x32xf32>
      %10 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %11 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %12 = "scf.for"(%0, %3, %2, %9) ({
      ^bb0(%arg3: index, %arg4: vector<16x32xf32>):
        %13 = "xegpu.load_nd"(%10, %0, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, index, index) -> vector<16x32xf16>
        %14 = "xegpu.load_nd"(%11, %arg3, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : (!xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, index, index) -> vector<32x32xf16>
        %15 = "math.exp"(%13) <{fastmath = #arith.fastmath<none>}> : (vector<16x32xf16>) -> vector<16x32xf16>
        %16 = "xegpu.dpas"(%15, %14, %arg4) <{layout_a = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, layout_cd = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (vector<16x32xf16>, vector<32x32xf16>, vector<16x32xf32>) -> vector<16x32xf32>
        "scf.yield"(%16) : (vector<16x32xf32>) -> ()
      }) : (index, index, index, vector<16x32xf32>) -> vector<16x32xf32>
      "xegpu.store_nd"(%12, %8) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (vector<16x32xf32>, !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm_with_elemwise_preop"} : () -> ()
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
      %6 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      %7 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg3: index):
        %9 = "xegpu.load_nd"(%6, %0, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, index, index) -> vector<16x32xf16>
        %10 = "xegpu.load_nd"(%7, %0, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, index, index) -> vector<16x32xf16>
        %11 = "arith.addf"(%9, %10) <{fastmath = #arith.fastmath<none>}> : (vector<16x32xf16>, vector<16x32xf16>) -> vector<16x32xf16>
        "xegpu.store_nd"(%11, %8, %0, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (vector<16x32xf16>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "elementwise_with_inst_data_only"} : () -> ()
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
      %6 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
      %7 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg3: index):
        %9 = "xegpu.load_nd"(%6, %arg3) <{const_offsets = array<i64: -9223372036854775808>, layout = #xegpu.layout<inst_data = [8]>}> : (!xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, index) -> vector<32xf16>
        %10 = "xegpu.load_nd"(%7, %arg3) <{const_offsets = array<i64: -9223372036854775808>, layout = #xegpu.layout<inst_data = [8]>}> : (!xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, index) -> vector<32xf16>
        %11 = "arith.addf"(%9, %10) <{fastmath = #arith.fastmath<none>}> : (vector<32xf16>, vector<32xf16>) -> vector<32xf16>
        "xegpu.store_nd"(%11, %8, %arg3) <{const_offsets = array<i64: -9223372036854775808>, layout = #xegpu.layout<inst_data = [8]>}> : (vector<32xf16>, !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "elementwise_1D"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<16x512xf32>, memref<512xf32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<16x512xf32>, %arg1: memref<512xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<64xf32>}> : () -> vector<64xf32>
      %1 = "arith.constant"() <{value = 64 : index}> : () -> index
      %2 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %3 = "arith.muli"(%2, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %4 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x512xf32>) -> !xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      %5 = "xegpu.load_nd"(%4) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [16, 16]>}> : (!xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>>) -> vector<16x64xf32>
      %6 = "vector.multi_reduction"(%5, %0) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<16x64xf32>, vector<64xf32>) -> vector<64xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<512xf32>) -> !xegpu.tensor_desc<64xf32, #xegpu.slice<#xegpu.layout<inst_data = [16, 16]>, dims = [0]>>
      "xegpu.store_nd"(%6, %7) <{const_offsets = array<i64: 0>, layout = #xegpu.slice<#xegpu.layout<inst_data = [16, 16]>, dims = [0]>}> : (vector<64xf32>, !xegpu.tensor_desc<64xf32, #xegpu.slice<#xegpu.layout<inst_data = [16, 16]>, dims = [0]>>) -> ()
      "gpu.return"() : () -> ()
    }) {VectorComputeFunctionINTEL, spirv.entry_point_abi = #spirv.entry_point_abi<>, sym_name = "reduce_dim_0"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<512x32xf32>, memref<512xf32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<512x32xf32>, %arg1: memref<512xf32>):
      %0 = "arith.constant"() <{value = 1 : index}> : () -> index
      %1 = "arith.constant"() <{value = 32 : index}> : () -> index
      %2 = "arith.constant"() <{value = dense<0.000000e+00> : vector<32xf32>}> : () -> vector<32xf32>
      %3 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %4 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %5 = "arith.muli"(%3, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %6 = "arith.muli"(%4, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %7 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<512x32xf32>) -> !xegpu.tensor_desc<32x128xf32, #xegpu.layout<inst_data = [16, 16]>>
      %8 = "xegpu.load_nd"(%7) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [16, 16]>}> : (!xegpu.tensor_desc<32x128xf32, #xegpu.layout<inst_data = [16, 16]>>) -> vector<32x128xf32>
      %9 = "vector.multi_reduction"(%8, %2) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<32x128xf32>, vector<32xf32>) -> vector<32xf32>
      %10 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<512xf32>) -> !xegpu.tensor_desc<32xf32, #xegpu.slice<#xegpu.layout<inst_data = [16, 16]>, dims = [1]>>
      "xegpu.store_nd"(%9, %10) <{const_offsets = array<i64: 0>, layout = #xegpu.slice<#xegpu.layout<inst_data = [16, 16]>, dims = [1]>}> : (vector<32xf32>, !xegpu.tensor_desc<32xf32, #xegpu.slice<#xegpu.layout<inst_data = [16, 16]>, dims = [1]>>) -> ()
      "gpu.return"() : () -> ()
    }) {VectorComputeFunctionINTEL, spirv.entry_point_abi = #spirv.entry_point_abi<>, sym_name = "reduce_dim_1"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<512xf32>, memref<16x512xf32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<512xf32>, %arg1: memref<16x512xf32>):
      %0 = "arith.constant"() <{value = 64 : index}> : () -> index
      %1 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %2 = "arith.muli"(%1, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %3 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<512xf32>) -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      %4 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<inst_data = [16]>}> : (!xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>) -> vector<64xf32>
      %5 = "vector.broadcast"(%4) : (vector<64xf32>) -> vector<16x64xf32>
      %6 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x512xf32>) -> !xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      "xegpu.store_nd"(%5, %6) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [16, 16]>}> : (vector<16x64xf32>, !xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {VectorComputeFunctionINTEL, spirv.entry_point_abi = #spirv.entry_point_abi<>, sym_name = "broadcast_dim_0"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<512xf32>, memref<16x512xf32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<512xf32>, %arg1: memref<16x512xf32>):
      %0 = "arith.constant"() <{value = 32 : index}> : () -> index
      %1 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %2 = "arith.muli"(%1, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %3 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<512xf32>) -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
      %4 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<inst_data = [16]>}> : (!xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>) -> vector<32xf32>
      %5 = "vector.shape_cast"(%4) : (vector<32xf32>) -> vector<32x1xf32>
      %6 = "vector.broadcast"(%5) : (vector<32x1xf32>) -> vector<32x64xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x512xf32>) -> !xegpu.tensor_desc<32x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      "xegpu.store_nd"(%6, %7) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [16, 16]>}> : (vector<32x64xf32>, !xegpu.tensor_desc<32x64xf32, #xegpu.layout<inst_data = [16, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {VectorComputeFunctionINTEL, spirv.entry_point_abi = #spirv.entry_point_abi<>, sym_name = "broadcast_dim_1"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<512x8xf32>, memref<8x512xf32>) -> (), kernel}> ({
    ^bb0(%arg0: memref<512x8xf32>, %arg1: memref<8x512xf32>):
      %0 = "arith.constant"() <{value = 32 : index}> : () -> index
      %1 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %2 = "arith.muli"(%1, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %3 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<512x8xf32>) -> !xegpu.tensor_desc<32x8xf32, #xegpu.layout<inst_data = [16, 8]>>
      %4 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [16, 8]>}> : (!xegpu.tensor_desc<32x8xf32, #xegpu.layout<inst_data = [16, 8]>>) -> vector<32x8xf32>
      %5 = "vector.transpose"(%4) <{permutation = array<i64: 1, 0>}> : (vector<32x8xf32>) -> vector<8x32xf32>
      %6 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x512xf32>) -> !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      "xegpu.store_nd"(%5, %6) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (vector<8x32xf32>, !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {VectorComputeFunctionINTEL, spirv.entry_point_abi = #spirv.entry_point_abi<>, sym_name = "transpose"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (ui64, ui64) -> ()}> ({
    ^bb0(%arg0: ui64, %arg1: ui64):
      %0 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 32>}> : () -> vector<32xi1>
      %1 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %2 = "xegpu.load"(%arg0, %1, %0) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : (ui64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
      "xegpu.store"(%2, %arg1, %1, %0) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : (vector<32xf32>, ui64, vector<32xindex>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "test_vector_constant_mask"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (ui64, ui64) -> ()}> ({
    ^bb0(%arg0: ui64, %arg1: ui64):
      %0 = "arith.constant"() <{value = 16 : index}> : () -> index
      %1 = "vector.create_mask"(%0) : (index) -> vector<32xi1>
      %2 = "arith.constant"() <{value = dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>}> : () -> vector<32xindex>
      %3 = "xegpu.load"(%arg0, %2, %1) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : (ui64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
      "xegpu.store"(%3, %arg1, %2, %1) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : (vector<32xf32>, ui64, vector<32xindex>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "test_vector_create_mask"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (ui64, ui64) -> ()}> ({
    ^bb0(%arg0: ui64, %arg1: ui64):
      %0 = "arith.constant"() <{value = 16 : index}> : () -> index
      %1 = "vector.step"() : () -> vector<32xindex>
      %2 = "vector.create_mask"(%0) : (index) -> vector<32xi1>
      %3 = "xegpu.load"(%arg0, %1, %2) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : (ui64, vector<32xindex>, vector<32xi1>) -> vector<32xf32>
      "xegpu.store"(%3, %arg1, %1, %2) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : (vector<32xf32>, ui64, vector<32xindex>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "test_vector_step"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<16x16xf16>, memref<16x16xf16>, memref<16x16xf32>) -> ()}> ({
    ^bb0(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<16x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %3 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>) -> vector<16x16xf16>
      %4 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>) -> vector<16x16xf16>
      %5 = "xegpu.convert_layout"(%3) <{input_layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, target_layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (vector<16x16xf16>) -> vector<16x16xf16>
      %6 = "xegpu.dpas"(%5, %4) <{layout_a = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, layout_cd = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (vector<16x16xf16>, vector<16x16xf16>) -> vector<16x16xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf32>) -> !xegpu.tensor_desc<16x16xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      "xegpu.store_nd"(%6, %7) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : (vector<16x16xf32>, !xegpu.tensor_desc<16x16xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<16x16xf16>, memref<4xf16>) -> ()}> ({
    ^bb0(%arg0: memref<16x16xf16>, %arg1: memref<4xf16>):
      %0 = "arith.constant"() <{value = 0.000000e+00 : f16}> : () -> f16
      %1 = "arith.constant"() <{value = 0 : index}> : () -> index
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [8, 16]>>
      %3 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [8, 16]>>) -> vector<16x16xf16>
      %4 = "vector.multi_reduction"(%3, %0) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0, 1>}> : (vector<16x16xf16>, f16) -> f16
      %5 = "xegpu.convert_layout"(%4) <{input_layout = #xegpu.slice<#xegpu.layout<inst_data = [8, 16]>, dims = [0, 1]>, target_layout = #xegpu.slice<#xegpu.layout<inst_data = [8, 16]>, dims = [0, 1]>}> : (f16) -> f16
      "memref.store"(%5, %arg1, %1) : (f16, memref<4xf16>, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout_scalar"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (vector<2xf32>) -> vector<2xf32>}> ({
    ^bb0(%arg0: vector<2xf32>):
      %0 = "xegpu.convert_layout"(%arg0) <{input_layout = #xegpu.slice<#xegpu.layout<inst_data = [1, 16]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<inst_data = [1, 16], lane_layout = [1, 16], lane_data = [1, 1]>, dims = [1]>}> : (vector<2xf32>) -> vector<2xf32>
      "gpu.return"(%0) : (vector<2xf32>) -> ()
    }) {sym_name = "convert_layout_drop_inst_data_to_null"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (vector<1xf32>) -> vector<1xf32>}> ({
    ^bb0(%arg0: vector<1xf32>):
      %0 = "xegpu.convert_layout"(%arg0) <{input_layout = #xegpu.layout<inst_data = [1]>, target_layout = #xegpu.slice<#xegpu.layout<inst_data = [1, 1, 16]>, dims = [1, 2]>}> : (vector<1xf32>) -> vector<1xf32>
      "gpu.return"(%0) : (vector<1xf32>) -> ()
    }) {sym_name = "convert_layout_drop_slice_inst_data_to_null"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (vector<8x32x2xf16>) -> vector<8x32x2xf16>}> ({
    ^bb0(%arg0: vector<8x32x2xf16>):
      %0 = "xegpu.convert_layout"(%arg0) <{input_layout = #xegpu.layout<inst_data = [4, 32, 2], lane_layout = [1, 16, 1], lane_data = [4, 1, 2]>, target_layout = #xegpu.layout<inst_data = [4, 16, 2], lane_layout = [1, 16, 1], lane_data = [4, 1, 1]>}> : (vector<8x32x2xf16>) -> vector<8x32x2xf16>
      %1 = "math.exp"(%0) <{fastmath = #arith.fastmath<none>}> : (vector<8x32x2xf16>) -> vector<8x32x2xf16>
      %2 = "xegpu.convert_layout"(%1) <{input_layout = #xegpu.layout<inst_data = [4, 16, 2], lane_layout = [1, 16, 1], lane_data = [4, 1, 1]>, target_layout = #xegpu.layout<inst_data = [4, 16, 2], lane_layout = [1, 16, 1], lane_data = [4, 1, 1]>}> : (vector<8x32x2xf16>) -> vector<8x32x2xf16>
      "gpu.return"(%1) : (vector<8x32x2xf16>) -> ()
    }) {sym_name = "convert_layout"} : () -> ()
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
    }) {sym_name = "unroll_load_matrix"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (vector<1x32xf32>, memref<32768xi8, 3>) -> ()}> ({
    ^bb0(%arg0: vector<1x32xf32>, %arg1: memref<32768xi8, 3>):
      %0 = "xegpu.create_mem_desc"(%arg1) : (memref<32768xi8, 3>) -> !xegpu.mem_desc<64x128xf32>
      "xegpu.store_matrix"(%arg0, %0) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [1, 16]>}> : (vector<1x32xf32>, !xegpu.mem_desc<64x128xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "unroll_store_matrix"} : () -> ()
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
    }) {sym_name = "load_with_offsets"} : () -> ()
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
    }) {sym_name = "store_with_offsets"} : () -> ()
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
    }) {sym_name = "load_with_offsets_chunk"} : () -> ()
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
    }) {sym_name = "store_with_offsets_chunk"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (ui64) -> vector<1x1x32xf32>}> ({
    ^bb0(%arg0: ui64):
      %0 = "arith.constant"() <{value = dense<[[[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]]]> : vector<1x1x32xindex>}> : () -> vector<1x1x32xindex>
      %1 = "arith.constant"() <{value = dense<true> : vector<1x1x32xi1>}> : () -> vector<1x1x32xi1>
      %2 = "xegpu.load"(%arg0, %0, %1) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [1, 1, 16]>}> : (ui64, vector<1x1x32xindex>, vector<1x1x32xi1>) -> vector<1x1x32xf32>
      "gpu.return"(%2) : (vector<1x1x32xf32>) -> ()
    }) {sym_name = "preserve_unit_dim_of_load_inst_data"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<1024x1024xf32>, memref<1024x1024xf32>, memref<1024x1024xf32>) -> ()}> ({
    ^bb0(%arg0: memref<1024x1024xf32>, %arg1: memref<1024x1024xf32>, %arg2: memref<1024x1024xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>
      %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>
      %3 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>
      %4 = "xegpu.load_nd"(%1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [1, 16]>}> : (!xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>, index, index) -> vector<1x32xf32>
      %5 = "xegpu.load_nd"(%2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [1, 16]>}> : (!xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>, index, index) -> vector<1x32xf32>
      %6 = "arith.addf"(%4, %5) <{fastmath = #arith.fastmath<none>}> : (vector<1x32xf32>, vector<1x32xf32>) -> vector<1x32xf32>
      "xegpu.store_nd"(%6, %3, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [1, 16]>}> : (vector<1x32xf32>, !xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_store_nd_with_offsets"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (ui64, ui64, ui64) -> ()}> ({
    ^bb0(%arg0: ui64, %arg1: ui64, %arg2: ui64):
      %0 = "arith.constant"() <{value = dense<[[[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]]]> : vector<1x1x32xindex>}> : () -> vector<1x1x32xindex>
      %1 = "arith.constant"() <{value = dense<true> : vector<1x1x32xi1>}> : () -> vector<1x1x32xi1>
      %2 = "xegpu.load"(%arg0, %0, %1) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [1, 1, 16]>}> : (ui64, vector<1x1x32xindex>, vector<1x1x32xi1>) -> vector<1x1x32xf32>
      %3 = "xegpu.load"(%arg1, %0, %1) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [1, 1, 16]>}> : (ui64, vector<1x1x32xindex>, vector<1x1x32xi1>) -> vector<1x1x32xf32>
      %4 = "arith.addf"(%2, %3) <{fastmath = #arith.fastmath<none>}> : (vector<1x1x32xf32>, vector<1x1x32xf32>) -> vector<1x1x32xf32>
      "xegpu.store"(%4, %arg2, %0, %1) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [1, 1, 16]>}> : (vector<1x1x32xf32>, ui64, vector<1x1x32xindex>, vector<1x1x32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_add_store_leading_unit_dims"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<1024x1024xf4E2M1FN>, memref<1024x1024xf4E2M1FN>, memref<1024x1024xf32>, memref<1024x64xf8E8M0FNU>, memref<64x1024xf8E8M0FNU>) -> ()}> ({
    ^bb0(%arg0: memref<1024x1024xf4E2M1FN>, %arg1: memref<1024x1024xf4E2M1FN>, %arg2: memref<1024x1024xf32>, %arg3: memref<1024x64xf8E8M0FNU>, %arg4: memref<64x1024xf8E8M0FNU>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 16 : index}> : () -> index
      %2 = "arith.constant"() <{value = 32 : index}> : () -> index
      %3 = "arith.constant"() <{value = 64 : index}> : () -> index
      %4 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %5 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %6 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %7 = "arith.muli"(%5, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %8 = "arith.muli"(%6, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %9 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %10 = "xegpu.load_nd"(%9) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (!xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> vector<16x32xf32>
      %11 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf4E2M1FN>) -> !xegpu.tensor_desc<16x64xf4E2M1FN, #xegpu.layout<inst_data = [8, 32]>>
      %12 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf4E2M1FN>) -> !xegpu.tensor_desc<64x32xf4E2M1FN, #xegpu.layout<inst_data = [32, 16]>>
      %13 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x64xf8E8M0FNU>) -> !xegpu.tensor_desc<16x2xf8E8M0FNU, #xegpu.layout<inst_data = [8, 1]>>
      %14 = "xegpu.create_nd_tdesc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<64x1024xf8E8M0FNU>) -> !xegpu.tensor_desc<2x32xf8E8M0FNU, #xegpu.layout<inst_data = [1, 16]>>
      %15 = "scf.for"(%0, %4, %3, %10) ({
      ^bb0(%arg5: index, %arg6: vector<16x32xf32>):
        %16 = "xegpu.load_nd"(%11, %0, %arg5) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [8, 32]>}> : (!xegpu.tensor_desc<16x64xf4E2M1FN, #xegpu.layout<inst_data = [8, 32]>>, index, index) -> vector<16x64xf4E2M1FN>
        %17 = "xegpu.load_nd"(%12, %arg5, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [32, 16]>}> : (!xegpu.tensor_desc<64x32xf4E2M1FN, #xegpu.layout<inst_data = [32, 16]>>, index, index) -> vector<64x32xf4E2M1FN>
        %18 = "xegpu.load_nd"(%13, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [8, 1]>}> : (!xegpu.tensor_desc<16x2xf8E8M0FNU, #xegpu.layout<inst_data = [8, 1]>>, index, index) -> vector<16x2xf8E8M0FNU>
        %19 = "xegpu.load_nd"(%14, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [1, 16]>}> : (!xegpu.tensor_desc<2x32xf8E8M0FNU, #xegpu.layout<inst_data = [1, 16]>>, index, index) -> vector<2x32xf8E8M0FNU>
        %20 = "xegpu.dpas_mx"(%16, %17, %arg6, %18, %19) <{layout_a = #xegpu.layout<inst_data = [8, 32]>, layout_a_scale = #xegpu.layout<inst_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [32, 16]>, layout_b_scale = #xegpu.layout<inst_data = [1, 16]>, layout_cd = #xegpu.layout<inst_data = [8, 16]>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : (vector<16x64xf4E2M1FN>, vector<64x32xf4E2M1FN>, vector<16x32xf32>, vector<16x2xf8E8M0FNU>, vector<2x32xf8E8M0FNU>) -> vector<16x32xf32>
        "scf.yield"(%20) : (vector<16x32xf32>) -> ()
      }) {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : (index, index, index, vector<16x32xf32>) -> vector<16x32xf32>
      "xegpu.store_nd"(%15, %9) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<inst_data = [8, 16]>}> : (vector<16x32xf32>, !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_mx"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<4x8x32xf16>, memref<4x32x16xf16>, memref<4x8x16xf32>) -> ()}> ({
    ^bb0(%arg0: memref<4x8x32xf16>, %arg1: memref<4x32x16xf16>, %arg2: memref<4x8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x8x16xf32>) -> !xegpu.tensor_desc<4x8x16xf32, #xegpu.layout<inst_data = [1, 8, 16]>>
      %2 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0, 0>, layout = #xegpu.layout<inst_data = [1, 8, 16]>}> : (!xegpu.tensor_desc<4x8x16xf32, #xegpu.layout<inst_data = [1, 8, 16]>>) -> vector<4x8x16xf32>
      %3 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x8x32xf16>) -> !xegpu.tensor_desc<4x8x32xf16, #xegpu.layout<inst_data = [1, 8, 16]>>
      %4 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x32x16xf16>) -> !xegpu.tensor_desc<4x32x16xf16, #xegpu.layout<inst_data = [1, 16, 16]>>
      %5 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0, 0>, layout = #xegpu.layout<inst_data = [1, 8, 16]>}> : (!xegpu.tensor_desc<4x8x32xf16, #xegpu.layout<inst_data = [1, 8, 16]>>) -> vector<4x8x32xf16>
      %6 = "xegpu.load_nd"(%4) <{const_offsets = array<i64: 0, 0, 0>, layout = #xegpu.layout<inst_data = [1, 16, 16]>}> : (!xegpu.tensor_desc<4x32x16xf16, #xegpu.layout<inst_data = [1, 16, 16]>>) -> vector<4x32x16xf16>
      %7 = "xegpu.dpas"(%5, %6, %2) <{layout_a = #xegpu.layout<inst_data = [1, 8, 16]>, layout_b = #xegpu.layout<inst_data = [1, 16, 16]>, layout_cd = #xegpu.layout<inst_data = [1, 8, 16]>}> : (vector<4x8x32xf16>, vector<4x32x16xf16>, vector<4x8x16xf32>) -> vector<4x8x16xf32>
      "xegpu.store_nd"(%7, %1) <{const_offsets = array<i64: 0, 0, 0>, layout = #xegpu.layout<inst_data = [1, 8, 16]>}> : (vector<4x8x16xf32>, !xegpu.tensor_desc<4x8x16xf32, #xegpu.layout<inst_data = [1, 8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm_3d_batch_blocking"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (memref<2x16x64xf4E2M1FN>, memref<2x64x32xf4E2M1FN>, memref<2x16x32xf32>, memref<2x16x2xf8E8M0FNU>, memref<2x2x32xf8E8M0FNU>) -> ()}> ({
    ^bb0(%arg0: memref<2x16x64xf4E2M1FN>, %arg1: memref<2x64x32xf4E2M1FN>, %arg2: memref<2x16x32xf32>, %arg3: memref<2x16x2xf8E8M0FNU>, %arg4: memref<2x2x32xf8E8M0FNU>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2x16x32xf32>) -> !xegpu.tensor_desc<2x16x32xf32, #xegpu.layout<inst_data = [1, 8, 16]>>
      %2 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0, 0>, layout = #xegpu.layout<inst_data = [1, 8, 16]>}> : (!xegpu.tensor_desc<2x16x32xf32, #xegpu.layout<inst_data = [1, 8, 16]>>) -> vector<2x16x32xf32>
      %3 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2x16x64xf4E2M1FN>) -> !xegpu.tensor_desc<2x16x64xf4E2M1FN, #xegpu.layout<inst_data = [1, 8, 64]>>
      %4 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2x64x32xf4E2M1FN>) -> !xegpu.tensor_desc<2x64x32xf4E2M1FN, #xegpu.layout<inst_data = [1, 64, 16]>>
      %5 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2x16x2xf8E8M0FNU>) -> !xegpu.tensor_desc<2x16x2xf8E8M0FNU, #xegpu.layout<inst_data = [1, 8, 2]>>
      %6 = "xegpu.create_nd_tdesc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2x2x32xf8E8M0FNU>) -> !xegpu.tensor_desc<2x2x32xf8E8M0FNU, #xegpu.layout<inst_data = [1, 2, 16]>>
      %7 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0, 0>, layout = #xegpu.layout<inst_data = [1, 8, 64]>}> : (!xegpu.tensor_desc<2x16x64xf4E2M1FN, #xegpu.layout<inst_data = [1, 8, 64]>>) -> vector<2x16x64xf4E2M1FN>
      %8 = "xegpu.load_nd"(%4) <{const_offsets = array<i64: 0, 0, 0>, layout = #xegpu.layout<inst_data = [1, 64, 16]>}> : (!xegpu.tensor_desc<2x64x32xf4E2M1FN, #xegpu.layout<inst_data = [1, 64, 16]>>) -> vector<2x64x32xf4E2M1FN>
      %9 = "xegpu.load_nd"(%5) <{const_offsets = array<i64: 0, 0, 0>, layout = #xegpu.layout<inst_data = [1, 8, 2]>}> : (!xegpu.tensor_desc<2x16x2xf8E8M0FNU, #xegpu.layout<inst_data = [1, 8, 2]>>) -> vector<2x16x2xf8E8M0FNU>
      %10 = "xegpu.load_nd"(%6) <{const_offsets = array<i64: 0, 0, 0>, layout = #xegpu.layout<inst_data = [1, 2, 16]>}> : (!xegpu.tensor_desc<2x2x32xf8E8M0FNU, #xegpu.layout<inst_data = [1, 2, 16]>>) -> vector<2x2x32xf8E8M0FNU>
      %11 = "xegpu.dpas_mx"(%7, %8, %2, %9, %10) <{layout_a = #xegpu.layout<inst_data = [1, 8, 64]>, layout_a_scale = #xegpu.layout<inst_data = [1, 8, 2]>, layout_b = #xegpu.layout<inst_data = [1, 64, 16]>, layout_b_scale = #xegpu.layout<inst_data = [1, 2, 16]>, layout_cd = #xegpu.layout<inst_data = [1, 8, 16]>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<2x16x64xf4E2M1FN>, vector<2x64x32xf4E2M1FN>, vector<2x16x32xf32>, vector<2x16x2xf8E8M0FNU>, vector<2x2x32xf8E8M0FNU>) -> vector<2x16x32xf32>
      "xegpu.store_nd"(%11, %1) <{const_offsets = array<i64: 0, 0, 0>, layout = #xegpu.layout<inst_data = [1, 8, 16]>}> : (vector<2x16x32xf32>, !xegpu.tensor_desc<2x16x32xf32, #xegpu.layout<inst_data = [1, 8, 16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_mx_3d_batch_blocking"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_kernel"}> ({
    "gpu.func"() <{function_type = (i1, i64) -> ()}> ({
    ^bb0(%arg0: i1, %arg1: i64):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1:2 = "scf.if"(%arg0) ({
        %9 = "arith.constant"() <{value = dense<1.000000e+00> : vector<16x64xf32>}> : () -> vector<16x64xf32>
        %10 = "arith.constant"() <{value = dense<1.000000e+00> : vector<16xf32>}> : () -> vector<16xf32>
        "scf.yield"(%9, %10) : (vector<16x64xf32>, vector<16xf32>) -> ()
      }, {
        %7 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16x64xf32>}> : () -> vector<16x64xf32>
        %8 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16xf32>}> : () -> vector<16xf32>
        "scf.yield"(%7, %8) : (vector<16x64xf32>, vector<16xf32>) -> ()
      }) : (i1) -> (vector<16x64xf32>, vector<16xf32>)
      %2 = "vector.broadcast"(%1#1) : (vector<16xf32>) -> vector<64x16xf32>
      %3 = "vector.transpose"(%2) <{permutation = array<i64: 1, 0>}> : (vector<64x16xf32>) -> vector<16x64xf32>
      %4 = "arith.addf"(%1#0, %3) <{fastmath = #arith.fastmath<none>}> : (vector<16x64xf32>, vector<16x64xf32>) -> vector<16x64xf32>
      %5 = "arith.truncf"(%4) : (vector<16x64xf32>) -> vector<16x64xf16>
      %6 = "xegpu.create_nd_tdesc"(%arg1) <{const_shape = array<i64: 16, 64>, const_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i64) -> !xegpu.tensor_desc<16x64xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      "xegpu.store_nd"(%5, %6, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x64xf16>, !xegpu.tensor_desc<16x64xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "if_one_to_n_results"} : () -> ()
  }) : () -> ()
}) : () -> ()

