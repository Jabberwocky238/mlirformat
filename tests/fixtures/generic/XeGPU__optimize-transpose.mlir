"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<64x64xf16>, vector<8x16xf16>) -> vector<8x16xf32>}> ({
    ^bb0(%arg0: memref<64x64xf16>, %arg1: vector<8x16xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 32 : index}> : () -> index
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<64x64xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>>
      %3 = "xegpu.load_nd"(%2, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> {result_layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>>, index, index) -> vector<16x16xf16>
      %4 = "vector.transpose"(%3) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : (vector<16x16xf16>) -> vector<16x16xf16>
      %5 = "xegpu.dpas"(%arg1, %4) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      "gpu.return"(%5) : (vector<8x16xf32>) -> ()
    }) {sym_name = "no_scf", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<64x64xi8>, vector<8x32xi8>) -> vector<8x16xi32>}> ({
    ^bb0(%arg0: memref<64x64xi8>, %arg1: vector<8x32xi8>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 64 : index}> : () -> index
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<64x64xi8>) -> !xegpu.tensor_desc<16x32xi8, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 4]>>
      %3 = "xegpu.load_nd"(%2, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> {result_layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 4]>} : (!xegpu.tensor_desc<16x32xi8, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 4]>>, index, index) -> vector<16x32xi8>
      %4 = "vector.transpose"(%3) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [4, 1]>} : (vector<16x32xi8>) -> vector<32x16xi8>
      %5 = "xegpu.dpas"(%arg1, %4) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x32xi8>, vector<32x16xi8>) -> vector<8x16xi32>
      "gpu.return"(%5) : (vector<8x16xi32>) -> ()
    }) {sym_name = "no_scf_i8", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<256x256xf16>, memref<256x256xf16>, memref<256x256xf32>) -> ()}> ({
    ^bb0(%arg0: memref<256x256xf16>, %arg1: memref<256x256xf16>, %arg2: memref<256x256xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 16 : index}> : () -> index
      %2 = "arith.constant"() <{value = 256 : index}> : () -> index
      %3 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x256xf32>) -> !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      %4 = "xegpu.load_nd"(%3, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (!xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> vector<8x16xf32>
      %5 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<8x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      %6 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>>
      %7 = "scf.for"(%0, %2, %1, %4) ({
      ^bb0(%arg3: index, %arg4: vector<8x16xf32>):
        %8 = "xegpu.load_nd"(%5, %0, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (!xegpu.tensor_desc<8x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> vector<8x16xf16>
        %9 = "xegpu.load_nd"(%6, %0, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>>, index, index) -> vector<16x16xf16>
        %10 = "vector.transpose"(%9) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : (vector<16x16xf16>) -> vector<16x16xf16>
        %11 = "xegpu.dpas"(%8, %10, %arg4) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
        "scf.yield"(%11) : (vector<8x16xf32>) -> ()
      }) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (index, index, index, vector<8x16xf32>) -> vector<8x16xf32>
      "xegpu.store_nd"(%7, %3, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm_b_transpose", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (memref<256x256xf16>, memref<256x256xf16>, memref<256x256xf32>) -> ()}> ({
    ^bb0(%arg0: memref<256x256xf16>, %arg1: memref<256x256xf16>, %arg2: memref<256x256xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 16 : index}> : () -> index
      %2 = "arith.constant"() <{value = 256 : index}> : () -> index
      "scf.for"(%0, %2, %1) ({
      ^bb0(%arg3: index):
        %3 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x256xf32>) -> !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
        %4 = "xegpu.load_nd"(%3, %arg3, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (!xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> vector<8x16xf32>
        %5 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<8x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
        %6 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>>
        %7 = "scf.for"(%0, %2, %1, %4) ({
        ^bb0(%arg4: index, %arg5: vector<8x16xf32>):
          %8 = "xegpu.load_nd"(%5, %arg3, %arg4) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (!xegpu.tensor_desc<8x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> vector<8x16xf16>
          %9 = "xegpu.load_nd"(%6, %arg3, %arg4) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (!xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>>, index, index) -> vector<16x16xf16>
          %10 = "vector.transpose"(%9) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : (vector<16x16xf16>) -> vector<16x16xf16>
          %11 = "xegpu.dpas"(%8, %10, %arg5) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
          "scf.yield"(%11) : (vector<8x16xf32>) -> ()
        }) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (index, index, index, vector<8x16xf32>) -> vector<8x16xf32>
        "xegpu.store_nd"(%7, %3, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "nested_scf", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (vector<8x16xf16>, memref<256x256xf16>, memref<256x256xf32>) -> ()}> ({
    ^bb0(%arg0: vector<8x16xf16>, %arg1: memref<256x256xf16>, %arg2: memref<256x256xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 16 : index}> : () -> index
      %2 = "arith.constant"() <{value = 32 : index}> : () -> index
      %3 = "arith.constant"() <{value = 256 : index}> : () -> index
      %4 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x256xf32>) -> !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      %5 = "xegpu.load_nd"(%4, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (!xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> vector<8x16xf32>
      %6 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>>
      %7:4 = "scf.for"(%0, %3, %2, %5, %5, %5, %5) ({
      ^bb0(%arg3: index, %arg4: vector<8x16xf32>, %arg5: vector<8x16xf32>, %arg6: vector<8x16xf32>, %arg7: vector<8x16xf32>):
        %8 = "xegpu.load_nd"(%6, %0, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (!xegpu.tensor_desc<32x32xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>>, index, index) -> vector<32x32xf16>
        %9 = "vector.extract_strided_slice"(%8) <{offsets = [0, 0], sizes = [16, 16], strides = [1, 1]}> {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (vector<32x32xf16>) -> vector<16x16xf16>
        %10 = "vector.extract_strided_slice"(%8) <{offsets = [0, 16], sizes = [16, 16], strides = [1, 1]}> {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (vector<32x32xf16>) -> vector<16x16xf16>
        %11 = "vector.extract_strided_slice"(%8) <{offsets = [16, 0], sizes = [16, 16], strides = [1, 1]}> {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (vector<32x32xf16>) -> vector<16x16xf16>
        %12 = "vector.extract_strided_slice"(%8) <{offsets = [16, 16], sizes = [16, 16], strides = [1, 1]}> {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (vector<32x32xf16>) -> vector<16x16xf16>
        %13 = "vector.transpose"(%9) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : (vector<16x16xf16>) -> vector<16x16xf16>
        %14 = "vector.transpose"(%10) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : (vector<16x16xf16>) -> vector<16x16xf16>
        %15 = "vector.transpose"(%11) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : (vector<16x16xf16>) -> vector<16x16xf16>
        %16 = "vector.transpose"(%12) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : (vector<16x16xf16>) -> vector<16x16xf16>
        %17 = "xegpu.dpas"(%arg0, %13, %arg4) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
        %18 = "xegpu.dpas"(%arg0, %14, %arg5) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
        %19 = "xegpu.dpas"(%arg0, %15, %arg6) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
        %20 = "xegpu.dpas"(%arg0, %16, %arg7) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
        "scf.yield"(%17, %18, %19, %20) : (vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>) -> ()
      }) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_1 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_2 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_3 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (index, index, index, vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>) -> (vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>)
      "xegpu.store_nd"(%7#0, %4, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "xegpu.store_nd"(%7#1, %4, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "xegpu.store_nd"(%7#2, %4, %1, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "xegpu.store_nd"(%7#3, %4, %1, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "large_loads", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (vector<8x16xf16>, memref<256x256xf16>, memref<256x256xf32>) -> ()}> ({
    ^bb0(%arg0: vector<8x16xf16>, %arg1: memref<256x256xf16>, %arg2: memref<256x256xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 16 : index}> : () -> index
      %2 = "arith.constant"() <{value = 32 : index}> : () -> index
      %3 = "arith.constant"() <{value = 256 : index}> : () -> index
      %4 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x256xf32>) -> !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      %5 = "xegpu.load_nd"(%4, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> vector<8x16xf32>
      %6 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>}> : (memref<256x256xf16>) -> !xegpu.tensor_desc<32x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>>
      %7:4 = "scf.for"(%0, %3, %2, %5, %5, %5, %5) ({
      ^bb0(%arg3: index, %arg4: vector<8x16xf32>, %arg5: vector<8x16xf32>, %arg6: vector<8x16xf32>, %arg7: vector<8x16xf32>):
        %8 = "xegpu.load_nd"(%6, %0, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>}> : (!xegpu.tensor_desc<32x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>>, index, index) -> vector<2x32x16xf16>
        %9 = "vector.extract"(%8) <{static_position = array<i64: 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (vector<2x32x16xf16>) -> vector<32x16xf16>
        %10 = "vector.extract"(%8) <{static_position = array<i64: 1>}> {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (vector<2x32x16xf16>) -> vector<32x16xf16>
        %11 = "vector.extract_strided_slice"(%9) <{offsets = [0, 0], sizes = [16, 16], strides = [1, 1]}> {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (vector<32x16xf16>) -> vector<16x16xf16>
        %12 = "vector.extract_strided_slice"(%9) <{offsets = [16, 0], sizes = [16, 16], strides = [1, 1]}> {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (vector<32x16xf16>) -> vector<16x16xf16>
        %13 = "vector.extract_strided_slice"(%10) <{offsets = [0, 0], sizes = [16, 16], strides = [1, 1]}> {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (vector<32x16xf16>) -> vector<16x16xf16>
        %14 = "vector.extract_strided_slice"(%10) <{offsets = [16, 0], sizes = [16, 16], strides = [1, 1]}> {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : (vector<32x16xf16>) -> vector<16x16xf16>
        %15 = "vector.transpose"(%11) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : (vector<16x16xf16>) -> vector<16x16xf16>
        %16 = "vector.transpose"(%12) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : (vector<16x16xf16>) -> vector<16x16xf16>
        %17 = "vector.transpose"(%13) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : (vector<16x16xf16>) -> vector<16x16xf16>
        %18 = "vector.transpose"(%14) <{permutation = array<i64: 1, 0>}> {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : (vector<16x16xf16>) -> vector<16x16xf16>
        %19 = "xegpu.dpas"(%arg0, %15, %arg4) {layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
        %20 = "xegpu.dpas"(%arg0, %16, %arg5) {layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
        %21 = "xegpu.dpas"(%arg0, %17, %arg6) {layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
        %22 = "xegpu.dpas"(%arg0, %18, %arg7) {layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
        "scf.yield"(%19, %20, %21, %22) : (vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>) -> ()
      }) {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_1 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_2 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_3 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : (index, index, index, vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>) -> (vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>)
      "xegpu.store_nd"(%7#0, %4, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "xegpu.store_nd"(%7#1, %4, %0, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "xegpu.store_nd"(%7#2, %4, %1, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "xegpu.store_nd"(%7#3, %4, %1, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "array_length", workgroup_attributions = 0 : i64} : () -> ()
  }) : () -> ()
}) : () -> ()

