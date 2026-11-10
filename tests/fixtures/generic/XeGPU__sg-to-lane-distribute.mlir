"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<1024x1024xbf16>, memref<1024x1024xbf16>, memref<1024x1024xf32>) -> ()}> ({
    ^bb0(%arg10: memref<1024x1024xbf16>, %arg11: memref<1024x1024xbf16>, %arg12: memref<1024x1024xf32>):
      %35 = "arith.constant"() <{value = 0 : index}> : () -> index
      %36 = "arith.constant"() <{value = 16 : index}> : () -> index
      %37 = "arith.constant"() <{value = 8 : index}> : () -> index
      %38 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %39 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %40 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %41 = "arith.muli"(%39, %37) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %42 = "arith.muli"(%40, %36) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %43 = "xegpu.create_nd_tdesc"(%arg12) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<8x16xf32>
      %44 = "xegpu.load_nd"(%43, %41, %42) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xf32>, index, index) -> vector<8x16xf32>
      %45 = "xegpu.create_nd_tdesc"(%arg10) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xbf16>) -> !xegpu.tensor_desc<8x16xbf16>
      %46 = "xegpu.create_nd_tdesc"(%arg11) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xbf16>) -> !xegpu.tensor_desc<16x16xbf16>
      %47 = "scf.for"(%35, %38, %36, %44) ({
      ^bb0(%arg13: index, %arg14: vector<8x16xf32>):
        %48 = "xegpu.load_nd"(%45, %41, %arg13) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xbf16>, index, index) -> vector<8x16xbf16>
        %49 = "xegpu.load_nd"(%46, %arg13, %42) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<16x16xbf16>, index, index) -> vector<16x16xbf16>
        %50 = "xegpu.dpas"(%48, %49, %arg14) <{layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xbf16>, vector<16x16xbf16>, vector<8x16xf32>) -> vector<8x16xf32>
        "scf.yield"(%50) : (vector<8x16xf32>) -> ()
      }) : (index, index, index, vector<8x16xf32>) -> vector<8x16xf32>
      "xegpu.store_nd"(%47, %43, %41, %42) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm"} : () -> ()
    "gpu.func"() <{function_type = (memref<1024x1024xbf16>, memref<1024x1024xbf16>, memref<1024x1024xf32>) -> ()}> ({
    ^bb0(%arg5: memref<1024x1024xbf16>, %arg6: memref<1024x1024xbf16>, %arg7: memref<1024x1024xf32>):
      %17 = "arith.constant"() <{value = 0 : index}> : () -> index
      %18 = "arith.constant"() <{value = 16 : index}> : () -> index
      %19 = "arith.constant"() <{value = 8 : index}> : () -> index
      %20 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %21 = "arith.constant"() <{value = dense<1.000000e+00> : vector<8x16xbf16>}> : () -> vector<8x16xbf16>
      %22 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %23 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %24 = "arith.muli"(%22, %19) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %25 = "arith.muli"(%23, %18) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %26 = "xegpu.create_nd_tdesc"(%arg7) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<8x16xf32>
      %27 = "xegpu.load_nd"(%26, %24, %25) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xf32>, index, index) -> vector<8x16xf32>
      %28 = "xegpu.create_nd_tdesc"(%arg5) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xbf16>) -> !xegpu.tensor_desc<8x16xbf16>
      %29 = "xegpu.create_nd_tdesc"(%arg6) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xbf16>) -> !xegpu.tensor_desc<16x16xbf16>
      %30 = "scf.for"(%17, %20, %18, %27) ({
      ^bb0(%arg8: index, %arg9: vector<8x16xf32>):
        %31 = "xegpu.load_nd"(%28, %24, %arg8) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xbf16>, index, index) -> vector<8x16xbf16>
        %32 = "arith.addf"(%31, %21) <{fastmath = #arith.fastmath<none>}> : (vector<8x16xbf16>, vector<8x16xbf16>) -> vector<8x16xbf16>
        %33 = "xegpu.load_nd"(%29, %arg8, %25) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<16x16xbf16>, index, index) -> vector<16x16xbf16>
        %34 = "xegpu.dpas"(%32, %33, %arg9) <{layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xbf16>, vector<16x16xbf16>, vector<8x16xf32>) -> vector<8x16xf32>
        "scf.yield"(%34) : (vector<8x16xf32>) -> ()
      }) : (index, index, index, vector<8x16xf32>) -> vector<8x16xf32>
      "xegpu.store_nd"(%30, %26, %24, %25) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm_with_preop"} : () -> ()
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
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<8x16xf32>
      %9 = "xegpu.load_nd"(%8, %6, %7) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xf32>, index, index) -> vector<8x16xf32>
      %10 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xbf16>) -> !xegpu.tensor_desc<8x16xbf16>
      %11 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xbf16>) -> !xegpu.tensor_desc<16x16xbf16>
      %12 = "scf.for"(%0, %3, %1, %9) ({
      ^bb0(%arg3: index, %arg4: vector<8x16xf32>):
        %14 = "xegpu.load_nd"(%10, %6, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xbf16>, index, index) -> vector<8x16xbf16>
        %15 = "xegpu.load_nd"(%11, %arg3, %7) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<16x16xbf16>, index, index) -> vector<16x16xbf16>
        %16 = "xegpu.dpas"(%14, %15, %arg4) <{layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xbf16>, vector<16x16xbf16>, vector<8x16xf32>) -> vector<8x16xf32>
        "scf.yield"(%16) : (vector<8x16xf32>) -> ()
      }) : (index, index, index, vector<8x16xf32>) -> vector<8x16xf32>
      %13 = "math.exp"(%12) <{fastmath = #arith.fastmath<none>}> : (vector<8x16xf32>) -> vector<8x16xf32>
      "xegpu.store_nd"(%13, %8, %6, %7) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm_with_postop"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<8x16xf16>, memref<16x16xf16>, memref<8x16xf32>) -> ()}> ({
    ^bb0(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf32>}> : () -> vector<8x16xf32>
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %3 = "xegpu.load_nd"(%2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xf16>, index, index) -> vector<8x16xf16>
      %4 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %5 = "xegpu.load_nd"(%4, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<16x16xf16>, index, index) -> vector<16x16xf16>
      %6 = "xegpu.dpas"(%3, %5, %1) <{layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
      %7 = "math.exp"(%6) <{fastmath = #arith.fastmath<none>}> : (vector<8x16xf32>) -> vector<8x16xf32>
      %8 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%7, %8, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_dpas_postop_store"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<256xf16>, i1) -> ()}> ({
    ^bb0(%arg0: memref<256xf16>, %arg1: i1):
      %0 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %1 = "arith.constant"() <{value = dense<12> : vector<16xindex>}> : () -> vector<16xindex>
      %2 = "scf.if"(%arg1) ({
        %4 = "xegpu.load"(%arg0, %1, %0) <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>}> : (memref<256xf16>, vector<16xindex>, vector<16xi1>) -> vector<16x8xf16>
        "scf.yield"(%4) : (vector<16x8xf16>) -> ()
      }, {
        %3 = "arith.constant"() <{value = dense<1.200000e+01> : vector<16x8xf16>}> : () -> vector<16x8xf16>
        "scf.yield"(%3) : (vector<16x8xf16>) -> ()
      }) : (i1) -> vector<16x8xf16>
      "xegpu.store"(%2, %arg0, %1, %0) <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>}> : (vector<16x8xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scatter_ops_scf_yield"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<256xf16>) -> ()}> ({
    ^bb0(%arg0: memref<256xf16>):
      %0 = "llvm.mlir.poison"() : () -> i1
      %1 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      %2 = "arith.constant"() <{value = dense<12> : vector<16xindex>}> : () -> vector<16xindex>
      "scf.if"(%0) ({
        %3 = "xegpu.load"(%arg0, %2, %1) <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>}> : (memref<256xf16>, vector<16xindex>, vector<16xi1>) -> vector<16x8xf16>
        "xegpu.store"(%3, %arg0, %2, %1) <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>}> : (vector<16x8xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scatter_ops_scf_non_yield"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<8x16xf16>, memref<16x8xi32>, memref<8x16xf32>) -> ()}> ({
    ^bb0(%arg0: memref<8x16xf16>, %arg1: memref<16x8xi32>, %arg2: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf32>}> : () -> vector<8x16xf32>
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %3 = "xegpu.load_nd"(%2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xf16>, index, index) -> vector<8x16xf16>
      %4 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x8xi32>) -> !xegpu.tensor_desc<16x8xi32>
      %5 = "xegpu.load_nd"(%4, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>}> : (!xegpu.tensor_desc<16x8xi32>, index, index) -> vector<16x8xi32>
      %6 = "vector.bitcast"(%5) : (vector<16x8xi32>) -> vector<16x16xf16>
      %7 = "vector.transpose"(%6) <{permutation = array<i64: 1, 0>}> : (vector<16x16xf16>) -> vector<16x16xf16>
      %8 = "xegpu.dpas"(%3, %7, %1) <{layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
      %9 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%8, %9, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "mma_transpose_b"} : () -> ()
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
    }) {sym_name = "load_store_matrix_1"} : () -> ()
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
    }) {sym_name = "load_store_matrix_2"} : () -> ()
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
    }) {sym_name = "load_store_matrix_3"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<16x16xf16>, memref<16x16xf16>) -> ()}> ({
    ^bb0(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16xf16>}> : () -> vector<16xf16>
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %4 = "xegpu.load_nd"(%2, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<16x16xf16>, index, index) -> vector<16x16xf16>
      %5 = "vector.multi_reduction"(%4, %1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<16x16xf16>, vector<16xf16>) -> vector<16xf16>
      %6 = "vector.broadcast"(%5) : (vector<16xf16>) -> vector<16x16xf16>
      "xegpu.store_nd"(%6, %3, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_broadcast_1d_to_2d_broadcast_within_lane"} : () -> ()
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
      %4 = "vector.broadcast"(%3) : (f16) -> vector<16x16xf16>
      %5 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf16>) -> !xegpu.tensor_desc<16x16xf16>
      "xegpu.store_nd"(%4, %5, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_shape_cast_scalar_to_vector"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<4x16xf32>, memref<256xf32>) -> ()}> ({
    ^bb0(%arg0: memref<4x16xf32>, %arg1: memref<256xf32>):
      %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x16xf32>) -> !xegpu.tensor_desc<4x16xf32>
      %2 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<4x16xf32>) -> vector<4x16xf32>
      %3 = "vector.broadcast"(%0) : (f32) -> vector<16xf32>
      %4 = "vector.multi_reduction"(%2, %3) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<4x16xf32>, vector<16xf32>) -> vector<16xf32>
      %5 = "vector.reduction"(%4) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<16xf32>) -> f32
      %6 = "xegpu.convert_layout"(%5) <{input_layout = #xegpu.slice<#xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, dims = [0]>}> : (f32) -> f32
      %7 = "vector.broadcast"(%6) : (f32) -> vector<16xf32>
      %8 = "arith.constant"() <{value = dense<0> : vector<16xindex>}> : () -> vector<16xindex>
      %9 = "arith.constant"() <{value = dense<true> : vector<16xi1>}> : () -> vector<16xi1>
      "xegpu.store"(%7, %arg1, %8, %9) <{layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>}> : (vector<16xf32>, memref<256xf32>, vector<16xindex>, vector<16xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduce_2d"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<16x16xf32>, memref<16x16xf32>) -> ()}> ({
    ^bb0(%arg0: memref<16x16xf32>, %arg1: memref<16x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 1 : index}> : () -> index
      %2 = "arith.constant"() <{value = 16 : index}> : () -> index
      %3 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16x16xf32>}> : () -> vector<16x16xf32>
      %4 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf32>) -> !xegpu.tensor_desc<16x16xf32>
      %5 = "xegpu.load_nd"(%4, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<16x16xf32>, index, index) -> vector<16x16xf32>
      %6 = "scf.for"(%0, %2, %1, %3) ({
      ^bb0(%arg2: index, %arg3: vector<16x16xf32>):
        %8 = "arith.addf"(%arg3, %5) <{fastmath = #arith.fastmath<none>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<16x16xf32>, vector<16x16xf32>) -> vector<16x16xf32>
        "scf.yield"(%8) : (vector<16x16xf32>) -> ()
      }) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (index, index, index, vector<16x16xf32>) -> vector<16x16xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf32>) -> !xegpu.tensor_desc<16x16xf32>
      "xegpu.store_nd"(%6, %7, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x16xf32>, !xegpu.tensor_desc<16x16xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_for_shape_cast_cleanup"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<16x16xf32>, memref<16x16xf32>) -> ()}> ({
    ^bb0(%arg0: memref<16x16xf32>, %arg1: memref<16x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %2 = "arith.constant"() <{value = 10 : i32}> : () -> i32
      %3 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %4 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf32>) -> !xegpu.tensor_desc<16x16xf32>
      %5 = "xegpu.load_nd"(%4, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<16x16xf32>, index, index) -> vector<16x16xf32>
      %6 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x16xf32>) -> !xegpu.tensor_desc<16x16xf32>
      %7:2 = "scf.while"(%5, %1) ({
      ^bb0(%arg4: vector<16x16xf32>, %arg5: i32):
        %10 = "arith.cmpi"(%arg5, %2) <{predicate = 2 : i64}> : (i32, i32) -> i1
        "scf.condition"(%10, %arg4, %arg5) : (i1, vector<16x16xf32>, i32) -> ()
      }, {
      ^bb0(%arg2: vector<16x16xf32>, %arg3: i32):
        "xegpu.store_nd"(%arg2, %6, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x16xf32>, !xegpu.tensor_desc<16x16xf32>, index, index) -> ()
        %8 = "arith.addi"(%arg3, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        %9 = "xegpu.load_nd"(%4, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<16x16xf32>, index, index) -> vector<16x16xf32>
        "scf.yield"(%9, %8) : (vector<16x16xf32>, i32) -> ()
      }) : (vector<16x16xf32>, i32) -> (vector<16x16xf32>, i32)
      "xegpu.store_nd"(%7#0, %6, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<16x16xf32>, !xegpu.tensor_desc<16x16xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_while_lane_distribute"} : () -> ()
  }) : () -> ()
}) : () -> ()

