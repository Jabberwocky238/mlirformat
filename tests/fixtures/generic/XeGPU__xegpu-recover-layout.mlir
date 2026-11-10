"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_for"}> ({
    "gpu.func"() <{function_type = (memref<8x128xf16>, memref<128x16xf16>, memref<8x16xf32>) -> ()}> ({
    ^bb0(%arg0: memref<8x128xf16>, %arg1: memref<128x16xf16>, %arg2: memref<8x16xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 128 : index}> : () -> index
      %2 = "arith.constant"() <{value = 16 : index}> : () -> index
      %3 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x128xf16>) -> !xegpu.tensor_desc<8x16xf16>
      %4 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x16xf16>) -> !xegpu.tensor_desc<16x16xf16>
      %5 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf32>}> : () -> vector<8x16xf32>
      %6 = "scf.for"(%0, %1, %2, %5) ({
      ^bb0(%arg3: index, %arg4: vector<8x16xf32>):
        %8 = "xegpu.load_nd"(%3, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xf16>, index, index) -> vector<8x16xf16>
        %9 = "xegpu.load_nd"(%4, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<16x16xf16>, index, index) -> vector<16x16xf16>
        %10 = "xegpu.dpas"(%8, %9, %arg4) <{layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32>) -> vector<8x16xf32>
        "scf.yield"(%10) : (vector<8x16xf32>) -> ()
      }) : (index, index, index, vector<8x16xf32>) -> vector<8x16xf32>
      %7 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x16xf32>) -> !xegpu.tensor_desc<8x16xf32>
      "xegpu.store_nd"(%6, %7, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "for_basic"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_while"}> ({
    "gpu.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> ()}> ({
    ^bb0(%arg0: memref<1024xf32>, %arg1: memref<1024xf32>):
      %0 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %1 = "arith.constant"() <{value = 10 : i32}> : () -> i32
      %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %3 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32>
      %4 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32>) -> vector<256xf32>
      %5 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32>
      %6:2 = "scf.while"(%4, %2) ({
      ^bb0(%arg4: vector<256xf32>, %arg5: i32):
        %9 = "arith.cmpi"(%arg5, %1) <{predicate = 2 : i64}> : (i32, i32) -> i1
        "scf.condition"(%9, %arg4, %arg5) : (i1, vector<256xf32>, i32) -> ()
      }, {
      ^bb0(%arg2: vector<256xf32>, %arg3: i32):
        "xegpu.store_nd"(%arg2, %5) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (vector<256xf32>, !xegpu.tensor_desc<256xf32>) -> ()
        %7 = "arith.addi"(%arg3, %0) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        %8 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 256>, layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32>) -> vector<256xf32>
        "scf.yield"(%8, %7) : (vector<256xf32>, i32) -> ()
      }) : (vector<256xf32>, i32) -> (vector<256xf32>, i32)
      "xegpu.store_nd"(%6#0, %5) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (vector<256xf32>, !xegpu.tensor_desc<256xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "while_basic"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_if"}> ({
    "gpu.func"() <{function_type = (!xegpu.tensor_desc<8x16xf16>, !xegpu.tensor_desc<16x16xf16>, i1, !xegpu.tensor_desc<8x16xf32>) -> ()}> ({
    ^bb0(%arg0: !xegpu.tensor_desc<8x16xf16>, %arg1: !xegpu.tensor_desc<16x16xf16>, %arg2: i1, %arg3: !xegpu.tensor_desc<8x16xf32>):
      %0 = "xegpu.load_nd"(%arg0) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<8x16xf16>) -> vector<8x16xf16>
      %1 = "scf.if"(%arg2) ({
        %4 = "xegpu.load_nd"(%arg1) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
        "scf.yield"(%4) : (vector<16x16xf16>) -> ()
      }, {
        %3 = "xegpu.load_nd"(%arg1) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<16x16xf16>) -> vector<16x16xf16>
        "scf.yield"(%3) : (vector<16x16xf16>) -> ()
      }) : (i1) -> vector<16x16xf16>
      %2 = "xegpu.dpas"(%0, %1) <{layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf16>, vector<16x16xf16>) -> vector<8x16xf32>
      "xegpu.store_nd"(%2, %arg3) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "if_basic"} : () -> ()
  }) : () -> ()
}) : () -> ()

