"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<8x16xf16>, memref<16x16xf16>, memref<8x16xf32>) -> ()}> ({
    ^bb0(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      %2 = "xegpu.load_nd"(%1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> vector<8x16xf16>
      %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>>
      %4 = "xegpu.load_nd"(%3, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>>, index, index) -> vector<16x16xf16>
      %5 = "xegpu.dpas"(%2, %4) <{layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      %6 = "math.exp"(%5) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x16xf32>) -> vector<8x16xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      "xegpu.store_nd"(%6, %7, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_dpas_postop_store", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<1024x1024xbf16>, memref<1024x1024xbf16>, memref<1024x1024xf32>) -> ()}> ({
    ^bb0(%arg0: memref<1024x1024xbf16>, %arg1: memref<1024x1024xbf16>, %arg2: memref<1024x1024xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 16 : index}> : () -> index
      %2 = "arith.constant"() <{value = 8 : index}> : () -> index
      %3 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %4 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %5 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %6 = "arith.muli"(%4, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %7 = "arith.muli"(%5, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      %9 = "xegpu.load_nd"(%8, %6, %7) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> vector<8x16xf32>
      %10 = "scf.for"(%0, %3, %1, %9) ({
      ^bb0(%arg3: index, %arg4: vector<8x16xf32>):
        %11 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024x1024xbf16>) -> !xegpu.tensor_desc<8x16xbf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
        %12 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<1024x1024xbf16>) -> !xegpu.tensor_desc<16x16xbf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>>
        %13 = "xegpu.load_nd"(%11, %6, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xbf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> vector<8x16xbf16>
        %14 = "xegpu.load_nd"(%12, %arg3, %7) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<16x16xbf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>>, index, index) -> vector<16x16xbf16>
        %15 = "xegpu.dpas"(%13, %14, %arg4) <{layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xbf16>, vector<16x16xbf16>, vector<8x16xf32>) -> vector<8x16xf32>
        "scf.yield"(%15) : (vector<8x16xf32>) -> ()
      }) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (index, index, index, vector<8x16xf32>) -> vector<8x16xf32>
      "xegpu.store_nd"(%10, %8, %6, %7) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<256xf16>, i1) -> ()}> ({
    ^bb0(%arg0: memref<256xf16>, %arg1: i1):
      %0 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : () -> vector<16xi1>
      %1 = "arith.constant"() <{value = dense<12> : vector<16xindex>}> {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : () -> vector<16xindex>
      %2 = "scf.if"(%arg1) ({
        %4 = "xegpu.load"(%arg0, %1, %0) <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>}> : (memref<256xf16>, vector<16xindex>, vector<16xi1>) -> vector<16x8xf16>
        "scf.yield"(%4) : (vector<16x8xf16>) -> ()
      }, {
        %3 = "arith.constant"() <{value = dense<1.200000e+01> : vector<16x8xf16>}> {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : () -> vector<16x8xf16>
        "scf.yield"(%3) : (vector<16x8xf16>) -> ()
      }) {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (i1) -> vector<16x8xf16>
      "xegpu.store"(%2, %arg0, %1, %0) <{chunk_size = 8 : i64}> : (vector<16x8xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scatter_ops_scf_yield", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<256xf16>) -> ()}> ({
    ^bb0(%arg0: memref<256xf16>):
      %0 = "llvm.mlir.poison"() : () -> i1
      %1 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : () -> vector<16xi1>
      %2 = "arith.constant"() <{value = dense<12> : vector<16xindex>}> {layout_result_0 = #xegpu.layout<lane_layout = [16], lane_data = [1]>} : () -> vector<16xindex>
      "scf.if"(%0) ({
        %3 = "xegpu.load"(%arg0, %2, %1) <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>}> : (memref<256xf16>, vector<16xindex>, vector<16xi1>) -> vector<16x8xf16>
        "xegpu.store"(%3, %arg0, %2, %1) <{chunk_size = 8 : i64}> : (vector<16x8xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scatter_ops_scf_non_yield", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<8x16xf16>, memref<16x8xi32>, memref<8x16xf32>) -> ()}> ({
    ^bb0(%arg0: memref<8x16xf16>, %arg1: memref<16x8xi32>, %arg2: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      %2 = "xegpu.load_nd"(%1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> vector<8x16xf16>
      %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<16x8xi32>) -> !xegpu.tensor_desc<16x8xi32, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>>
      %4 = "xegpu.load_nd"(%3, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<16x8xi32, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>>, index, index) -> vector<16x8xi32>
      %5 = "vector.bitcast"(%4) {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (vector<16x8xi32>) -> vector<16x16xf16>
      %6 = "vector.transpose"(%5) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : (vector<16x16xf16>) -> vector<16x16xf16>
      %7 = "xegpu.dpas"(%2, %6) <{layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      "xegpu.store_nd"(%7, %8, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "mma_transpose_b", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (index, !xegpu.tensor_desc<16x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, memref<16x16xf32>) -> ()}> ({
    ^bb0(%arg0: index, %arg1: !xegpu.tensor_desc<16x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, %arg2: memref<16x16xf32>):
      %0 = "arith.constant"() <{value = 128 : index}> : () -> index
      %1 = "arith.constant"() <{value = 1 : index}> : () -> index
      %2 = "arith.constant"() <{value = 0 : index}> : () -> index
      %3 = "some_def"() {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : () -> vector<16x1xf32>
      %4 = "some_def"() {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : () -> vector<16x16xf32>
      %5:2 = "scf.for"(%2, %0, %1, %4, %3) ({
      ^bb0(%arg3: index, %arg4: vector<16x16xf32>, %arg5: vector<16x1xf32>):
        %6 = "some_def"(%arg5) {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16x1xf32>) -> vector<16x1xf32>
        %7 = "some_def"(%arg4, %6) {layout_operand_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_operand_1 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16x16xf32>, vector<16x1xf32>) -> vector<16x16xf32>
        "scf.yield"(%7, %6) : (vector<16x16xf32>, vector<16x1xf32>) -> ()
      }) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (index, index, index, vector<16x16xf32>, vector<16x1xf32>) -> (vector<16x16xf32>, vector<16x1xf32>)
      "xegpu.store_nd"(%5#0, %arg1, %2, %2) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<16x16xf32>, !xegpu.tensor_desc<16x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "warp_scf_for_unused_uniform_for_result", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (!xegpu.mem_desc<32x32xf32>) -> ()}> ({
    ^bb0(%arg0: !xegpu.mem_desc<32x32xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.load_matrix"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.mem_desc<32x32xf32>, index, index) -> vector<2x8xf32>
      "xegpu.store_matrix"(%1, %arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [2, 8], lane_data = [1, 1]>}> : (vector<2x8xf32>, !xegpu.mem_desc<32x32xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_store_matrix_1", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (!xegpu.mem_desc<32x32xf32>) -> ()}> ({
    ^bb0(%arg0: !xegpu.mem_desc<32x32xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 1 : index}> : () -> index
      %2 = "xegpu.load_matrix"(%arg0, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [4, 4], lane_data = [2, 1]>}> : (!xegpu.mem_desc<32x32xf32>, index, index) -> vector<8x4xf32>
      "xegpu.store_matrix"(%2, %arg0, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [4, 4], lane_data = [2, 1]>}> : (vector<8x4xf32>, !xegpu.mem_desc<32x32xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_store_matrix_2", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (!xegpu.mem_desc<32x32xf32, #xegpu.mem_layout<block = [16, 1], stride = [1, 32]>>) -> ()}> ({
    ^bb0(%arg0: !xegpu.mem_desc<32x32xf32, #xegpu.mem_layout<block = [16, 1], stride = [1, 32]>>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 1 : index}> : () -> index
      %2 = "xegpu.load_matrix"(%arg0, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, subgroup_block_io}> : (!xegpu.mem_desc<32x32xf32, #xegpu.mem_layout<block = [16, 1], stride = [1, 32]>>, index, index) -> vector<16x2xf32>
      "xegpu.store_matrix"(%2, %arg0, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, subgroup_block_io}> : (vector<16x2xf32>, !xegpu.mem_desc<32x32xf32, #xegpu.mem_layout<block = [16, 1], stride = [1, 32]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_store_matrix_3", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<16x16xf16>, memref<16x16xf16>) -> ()}> ({
    ^bb0(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16xf16>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>} : () -> vector<16xf16>
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      %4 = "xegpu.load_nd"(%2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> vector<16x16xf16>
      %5 = "vector.multi_reduction"(%4, %1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>} : (vector<16x16xf16>, vector<16xf16>) -> vector<16xf16>
      %6 = "vector.broadcast"(%5) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16xf16>) -> vector<16x16xf16>
      "xegpu.store_nd"(%6, %3, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_broadcast_1d_to_2d_broadcast_within_lane", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<16xf16>, memref<16x16xf16>) -> ()}> ({
    ^bb0(%arg0: memref<16xf16>, %arg1: memref<16x16xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16>}> {layout_result_0 = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [1]>} : () -> vector<16xi1>
      %2 = "xegpu.load"(%arg0, %0, %1) <{layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [1]>}> : (memref<16xf16>, index, vector<16xi1>) -> vector<16xf16>
      %3 = "vector.shape_cast"(%2) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16xf16>) -> vector<16x1xf16>
      %4 = "vector.broadcast"(%3) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16x1xf16>) -> vector<16x16xf16>
      %5 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      "xegpu.store_nd"(%4, %5, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_broadcast_2d_to_2d_across_lane_lower_to_noop_case", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<16xf16>, memref<16x16xf16>) -> ()}> ({
    ^bb0(%arg0: memref<16xf16>, %arg1: memref<16x16xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %2 = "arith.index_cast"(%1) : (index) -> i16
      %3 = "arith.bitcast"(%2) : (i16) -> f16
      %4 = "vector.broadcast"(%3) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (f16) -> vector<16x16xf16>
      %5 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      "xegpu.store_nd"(%4, %5, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_shape_cast_scalar_to_vector", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

