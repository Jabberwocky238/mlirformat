"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<8192xi8, 3>) -> ()}> ({
    ^bb0(%arg1: memref<8192xi8, 3>):
      %3 = "arith.constant"() <{value = 0 : index}> : () -> index
      %4 = "xegpu.create_mem_desc"(%arg1) : (memref<8192xi8, 3>) -> !xegpu.mem_desc<4096xbf16>
      %5 = "xegpu.load_matrix"(%4, %3) <{const_offsets = array<i64: -9223372036854775808>, layout = #xegpu.layout<sg_layout = [16], sg_data = [256], inst_data = [16], lane_layout = [16], lane_data = [1]>}> : (!xegpu.mem_desc<4096xbf16>, index) -> vector<4096xbf16>
      "xegpu.store_matrix"(%5, %4, %3) <{const_offsets = array<i64: -9223372036854775808>, layout = #xegpu.layout<sg_layout = [16], sg_data = [256], inst_data = [16], lane_layout = [16], lane_data = [1]>}> : (vector<4096xbf16>, !xegpu.mem_desc<4096xbf16>, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "test_load_store_matrix_1d"} : () -> ()
    "gpu.func"() <{function_type = (memref<16384xi8, 3>) -> ()}> ({
    ^bb0(%arg0: memref<16384xi8, 3>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_mem_desc"(%arg0) : (memref<16384xi8, 3>) -> !xegpu.mem_desc<64x128xbf16>
      %2 = "xegpu.load_matrix"(%1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [16, 32], inst_data = [1, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.mem_desc<64x128xbf16>, index, index) -> vector<64x128xbf16>
      "xegpu.store_matrix"(%2, %1, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [16, 32], inst_data = [1, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<64x128xbf16>, !xegpu.mem_desc<64x128xbf16>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "test_load_store_matrix_2d"} : () -> ()
  }) : () -> ()
}) : () -> ()

