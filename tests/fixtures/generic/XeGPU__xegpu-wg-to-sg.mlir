"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_distribution"}> ({
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg86: memref<256x128xf32>):
      %315 = "xegpu.create_nd_tdesc"(%arg86) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc"} : () -> ()
    "gpu.func"() <{function_type = (ui64, index, index, index, index) -> ()}> ({
    ^bb0(%arg81: ui64, %arg82: index, %arg83: index, %arg84: index, %arg85: index):
      %313 = "arith.constant"() <{value = 1 : index}> : () -> index
      %314 = "xegpu.create_nd_tdesc"(%arg81, %arg83, %arg82, %arg82, %313) <{const_shape = array<i64: -9223372036854775808, -9223372036854775808>, const_strides = array<i64: -9223372036854775808, -9223372036854775808>, operandSegmentSizes = array<i32: 1, 2, 2>}> : (ui64, index, index, index, index) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_with_ptr"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg80: memref<256x128xf32>):
      %311 = "xegpu.create_nd_tdesc"(%arg80) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      %312 = "xegpu.load_nd"(%311) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg79: memref<256x128xf32>):
      %309 = "xegpu.create_nd_tdesc"(%arg79) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      %310 = "xegpu.load_nd"(%309) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      "xegpu.store_nd"(%310, %309) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_nd"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg78: memref<256x128xf32>):
      %307 = "arith.constant"() <{value = 0 : index}> : () -> index
      %308 = "xegpu.create_nd_tdesc"(%arg78) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      "xegpu.prefetch_nd"(%308, %307, %307) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd"} : () -> ()
    "gpu.func"() <{function_type = (memref<128x128xf16>, memref<128x128xf16>) -> ()}> ({
    ^bb0(%arg76: memref<128x128xf16>, %arg77: memref<128x128xf16>):
      %302 = "xegpu.create_nd_tdesc"(%arg76) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x128xf16>) -> !xegpu.tensor_desc<128x128xf16>
      %303 = "xegpu.load_nd"(%302) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<128x128xf16>) -> vector<128x128xf16>
      %304 = "xegpu.create_nd_tdesc"(%arg77) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x128xf16>) -> !xegpu.tensor_desc<128x128xf16>
      %305 = "xegpu.load_nd"(%304) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<128x128xf16>) -> vector<128x128xf16>
      %306 = "xegpu.dpas"(%303, %305) <{layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<128x128xf16>, vector<128x128xf16>) -> vector<128x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas"} : () -> ()
    "gpu.func"() <{function_type = (memref<128x128xf8E5M2>, memref<128x128xf8E5M2>, memref<128x4xf8E8M0FNU>, memref<4x128xf8E8M0FNU>) -> ()}> ({
    ^bb0(%arg72: memref<128x128xf8E5M2>, %arg73: memref<128x128xf8E5M2>, %arg74: memref<128x4xf8E8M0FNU>, %arg75: memref<4x128xf8E8M0FNU>):
      %292 = "xegpu.create_nd_tdesc"(%arg72) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x128xf8E5M2>) -> !xegpu.tensor_desc<128x128xf8E5M2, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 2]>>
      %293 = "xegpu.load_nd"(%292) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 2]>}> : (!xegpu.tensor_desc<128x128xf8E5M2, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 2]>>) -> vector<128x128xf8E5M2>
      %294 = "xegpu.create_nd_tdesc"(%arg73) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x128xf8E5M2>) -> !xegpu.tensor_desc<128x128xf8E5M2, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>>
      %295 = "xegpu.load_nd"(%294) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<128x128xf8E5M2, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>>) -> vector<128x128xf8E5M2>
      %296 = "xegpu.create_nd_tdesc"(%arg74) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x4xf8E8M0FNU>) -> !xegpu.tensor_desc<128x4xf8E8M0FNU, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 4], lane_layout = [16, 1], lane_data = [1, 1]>>
      %297 = "xegpu.load_nd"(%296) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 4], lane_layout = [16, 1], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<128x4xf8E8M0FNU, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 4], lane_layout = [16, 1], lane_data = [1, 1]>>) -> vector<128x4xf8E8M0FNU>
      %298 = "xegpu.create_nd_tdesc"(%arg75) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x128xf8E8M0FNU>) -> !xegpu.tensor_desc<4x128xf8E8M0FNU, #xegpu.layout<sg_layout = [8, 8], sg_data = [4, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %299 = "xegpu.load_nd"(%298) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [4, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<4x128xf8E8M0FNU, #xegpu.layout<sg_layout = [8, 8], sg_data = [4, 16], lane_layout = [1, 16], lane_data = [1, 1]>>) -> vector<4x128xf8E8M0FNU>
      %300 = "arith.constant"() <{value = dense<0.000000e+00> : vector<128x128xbf16>}> : () -> vector<128x128xbf16>
      %301 = "xegpu.dpas_mx"(%293, %295, %300, %297, %299) <{layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 2]>, layout_a_scale = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 4], lane_layout = [16, 1], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>, layout_b_scale = #xegpu.layout<sg_layout = [8, 8], sg_data = [4, 16], lane_layout = [1, 16], lane_data = [1, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<128x128xf8E5M2>, vector<128x128xf8E5M2>, vector<128x128xbf16>, vector<128x4xf8E8M0FNU>, vector<4x128xf8E8M0FNU>) -> vector<128x128xbf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_mx"} : () -> ()
    "gpu.func"() <{function_type = (memref<128x128xf16>, memref<128x128xf16>) -> ()}> ({
    ^bb0(%arg70: memref<128x128xf16>, %arg71: memref<128x128xf16>):
      %287 = "xegpu.create_nd_tdesc"(%arg70) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x128xf16>) -> !xegpu.tensor_desc<128x128xf16>
      %288 = "xegpu.load_nd"(%287) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : (!xegpu.tensor_desc<128x128xf16>) -> vector<128x128xf16>
      %289 = "xegpu.create_nd_tdesc"(%arg71) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x128xf16>) -> !xegpu.tensor_desc<128x128xf16>
      %290 = "xegpu.load_nd"(%289) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>}> : (!xegpu.tensor_desc<128x128xf16>) -> vector<128x128xf16>
      %291 = "xegpu.dpas"(%288, %290) <{layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : (vector<128x128xf16>, vector<128x128xf16>) -> vector<128x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_no_sg_data"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x1xf32>) -> ()}> ({
    ^bb0(%arg69: memref<256x1xf32>):
      %283 = "xegpu.create_nd_tdesc"(%arg69) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x1xf32>) -> !xegpu.tensor_desc<256x1xf32>
      %284 = "xegpu.load_nd"(%283) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 1], lane_layout = [8, 1], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x1xf32>) -> vector<256x1xf32>
      %285 = "vector.broadcast"(%284) : (vector<256x1xf32>) -> vector<256x32xf32>
      %286 = "xegpu.convert_layout"(%285) <{input_layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 32], lane_layout = [8, 1], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 32], lane_layout = [8, 1], lane_data = [1, 1]>}> : (vector<256x32xf32>) -> vector<256x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "broadcast_dim1"} : () -> ()
    "gpu.func"() <{function_type = (memref<1x128xf32>) -> ()}> ({
    ^bb0(%arg68: memref<1x128xf32>):
      %279 = "xegpu.create_nd_tdesc"(%arg68) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1x128xf32>) -> !xegpu.tensor_desc<1x128xf32>
      %280 = "xegpu.load_nd"(%279) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [1, 4], sg_data = [1, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<1x128xf32>) -> vector<1x128xf32>
      %281 = "vector.broadcast"(%280) : (vector<1x128xf32>) -> vector<32x128xf32>
      %282 = "xegpu.convert_layout"(%281) <{input_layout = #xegpu.layout<sg_layout = [1, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [1, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<32x128xf32>) -> vector<32x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "broadcast_dim0"} : () -> ()
    "gpu.func"() <{function_type = (memref<1024x1024xf16>, memref<1024x1024xf16>, memref<1024x1024xf32>) -> ()}> ({
    ^bb0(%arg61: memref<1024x1024xf16>, %arg62: memref<1024x1024xf16>, %arg63: memref<1024x1024xf32>):
      %262 = "arith.constant"() <{value = 0 : index}> : () -> index
      %263 = "arith.constant"() <{value = 128 : index}> : () -> index
      %264 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %265 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %266 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %267 = "arith.muli"(%265, %263) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %268 = "arith.muli"(%266, %263) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %269 = "xegpu.create_nd_tdesc"(%arg63) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<128x128xf32>
      %270 = "xegpu.create_nd_tdesc"(%arg61) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<128x128xf16>
      %271 = "xegpu.create_nd_tdesc"(%arg62) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<128x128xf16>
      %272 = "xegpu.load_nd"(%269, %267, %268) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (!xegpu.tensor_desc<128x128xf32>, index, index) -> vector<128x128xf32>
      %273 = "xegpu.load_nd"(%270, %267, %262) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>}> : (!xegpu.tensor_desc<128x128xf16>, index, index) -> vector<128x128xf16>
      %274 = "xegpu.load_nd"(%271, %262, %268) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>}> : (!xegpu.tensor_desc<128x128xf16>, index, index) -> vector<128x128xf16>
      %275:3 = "scf.for"(%262, %264, %263, %273, %274, %272) ({
      ^bb0(%arg64: index, %arg65: vector<128x128xf16>, %arg66: vector<128x128xf16>, %arg67: vector<128x128xf32>):
        %276 = "xegpu.dpas"(%arg65, %arg66, %arg67) <{layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>) -> vector<128x128xf32>
        %277 = "xegpu.load_nd"(%270, %arg64, %262) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>}> : (!xegpu.tensor_desc<128x128xf16>, index, index) -> vector<128x128xf16>
        %278 = "xegpu.load_nd"(%271, %262, %arg64) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>}> : (!xegpu.tensor_desc<128x128xf16>, index, index) -> vector<128x128xf16>
        "scf.yield"(%277, %278, %276) : (vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>) -> ()
      }) : (index, index, index, vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>) -> (vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>)
      "xegpu.store_nd"(%275#2, %269, %267, %268) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "gemm_with_load_store_offset"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>, memref<128x256xf32>, memref<128x64xf32>) -> ()}> ({
    ^bb0(%arg58: memref<256x128xf32>, %arg59: memref<128x256xf32>, %arg60: memref<128x64xf32>):
      %244 = "gpu.subgroup_id"() : () -> index
      %245 = "arith.constant"() <{value = 0 : index}> : () -> index
      %246 = "arith.constant"() <{value = 1 : index}> : () -> index
      %247 = "arith.constant"() <{value = 2 : index}> : () -> index
      %248 = "arith.constant"() <{value = 31 : index}> : () -> index
      %249 = "arith.constant"() <{value = 3 : index}> : () -> index
      %250 = "arith.cmpi"(%244, %245) <{predicate = 5 : i64}> : (index, index) -> i1
      %251 = "arith.cmpi"(%244, %246) <{predicate = 2 : i64}> : (index, index) -> i1
      %252 = "arith.andi"(%250, %251) : (i1, i1) -> i1
      "scf.if"(%252) ({
        %260 = "xegpu.create_nd_tdesc"(%arg58) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
        %261 = "xegpu.load_nd"(%260) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
        "scf.yield"() : () -> ()
      }, {
      }) {sg_id_range = #xegpu.range<[0 : i64, 32 : i64]>} : (i1) -> ()
      %253 = "arith.cmpi"(%244, %247) <{predicate = 5 : i64}> : (index, index) -> i1
      %254 = "arith.cmpi"(%244, %248) <{predicate = 2 : i64}> : (index, index) -> i1
      %255 = "arith.andi"(%253, %254) : (i1, i1) -> i1
      "scf.if"(%255) ({
        %256 = "xegpu.create_nd_tdesc"(%arg60) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x64xf32>) -> !xegpu.tensor_desc<128x64xf32>
        %257 = "xegpu.load_nd"(%256) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<128x64xf32>) -> vector<128x64xf32>
        %258 = "math.exp"(%257) <{fastmath = #arith.fastmath<none>}> : (vector<128x64xf32>) -> vector<128x64xf32>
        %259 = "xegpu.convert_layout"(%258) <{input_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>}> : (vector<128x64xf32>) -> vector<128x64xf32>
        "scf.yield"() : () -> ()
      }, {
      }) {sg_id_range = #xegpu.range<[2 : i64, 18 : i64]>} : (i1) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_id_range"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>, memref<128x64xf32>) -> ()}> ({
    ^bb0(%arg56: memref<256x128xf32>, %arg57: memref<128x64xf32>):
      %231 = "gpu.subgroup_id"() : () -> index
      %232 = "arith.constant"() <{value = true}> : () -> i1
      %233 = "arith.constant"() <{value = 3 : index}> : () -> index
      %234 = "arith.constant"() <{value = 32 : index}> : () -> index
      %235 = "xegpu.create_nd_tdesc"(%arg56) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      %236 = "xegpu.load_nd"(%235) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      %237 = "arith.cmpi"(%231, %233) <{predicate = 5 : i64}> : (index, index) -> i1
      %238 = "arith.cmpi"(%231, %234) <{predicate = 2 : i64}> : (index, index) -> i1
      %239 = "arith.andi"(%237, %238) : (i1, i1) -> i1
      "scf.if"(%232) ({
        "scf.if"(%239) ({
          %240 = "xegpu.create_nd_tdesc"(%arg57) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x64xf32>) -> !xegpu.tensor_desc<128x64xf32>
          %241 = "xegpu.load_nd"(%240) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<128x64xf32>) -> vector<128x64xf32>
          %242 = "math.exp"(%241) <{fastmath = #arith.fastmath<none>}> : (vector<128x64xf32>) -> vector<128x64xf32>
          %243 = "xegpu.convert_layout"(%242) <{input_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>}> : (vector<128x64xf32>) -> vector<128x64xf32>
          "scf.yield"() : () -> ()
        }, {
        }) : (i1) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) {sg_id_range = #xegpu.range<[3 : i64, 19 : i64]>} : (i1) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "subgroup_id_range_nested_if"} : () -> ()
    "gpu.func"() <{function_type = (memref<?xf16>) -> ()}> ({
    ^bb0(%arg55: memref<?xf16>):
      %228 = "arith.constant"() <{value = dense<0> : vector<256x16xindex>}> : () -> vector<256x16xindex>
      %229 = "arith.constant"() <{value = dense<true> : vector<256x16xi1>}> : () -> vector<256x16xi1>
      %230 = "xegpu.load"(%arg55, %228, %229) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 4]>}> : (memref<?xf16>, vector<256x16xindex>, vector<256x16xi1>) -> vector<256x16xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_gather"} : () -> ()
    "gpu.func"() <{function_type = (memref<256xf16>) -> ()}> ({
    ^bb0(%arg54: memref<256xf16>):
      %225 = "arith.constant"() <{value = dense<2.550000e+01> : vector<256xf16>}> : () -> vector<256xf16>
      %226 = "arith.constant"() <{value = dense<0> : vector<256xindex>}> : () -> vector<256xindex>
      %227 = "arith.constant"() <{value = dense<true> : vector<256xi1>}> : () -> vector<256xi1>
      "xegpu.store"(%225, %arg54, %226, %227) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<sg_layout = [32], sg_data = [8], inst_data = [8]>}> : (vector<256xf16>, memref<256xf16>, vector<256xindex>, vector<256xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_scatter"} : () -> ()
    "gpu.func"() <{function_type = (memref<?xf16>) -> ()}> ({
    ^bb0(%arg53: memref<?xf16>):
      %222 = "arith.constant"() <{value = dense<0> : vector<256xindex>}> : () -> vector<256xindex>
      %223 = "arith.constant"() <{value = dense<true> : vector<256xi1>}> : () -> vector<256xi1>
      %224 = "xegpu.load"(%arg53, %222, %223) <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 4]>}> : (memref<?xf16>, vector<256xindex>, vector<256xi1>) -> vector<256x4xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_with_non_unit_chunk_size"} : () -> ()
    "gpu.func"() <{function_type = (memref<32768xi8, 3>) -> ()}> ({
    ^bb0(%arg52: memref<32768xi8, 3>):
      %220 = "xegpu.create_mem_desc"(%arg52) : (memref<32768xi8, 3>) -> !xegpu.mem_desc<64x128xf32>
      %221 = "xegpu.load_matrix"(%220) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [32, 32], lane_layout = [2, 8], lane_data = [1, 1]>}> : (!xegpu.mem_desc<64x128xf32>) -> vector<64x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "distribute_load_matrix"} : () -> ()
    "gpu.func"() <{function_type = (memref<32768xi8, 3>) -> ()}> ({
    ^bb0(%arg51: memref<32768xi8, 3>):
      %218 = "arith.constant"() <{value = dense<1.000000e+00> : vector<64x128xf32>}> : () -> vector<64x128xf32>
      %219 = "xegpu.create_mem_desc"(%arg51) : (memref<32768xi8, 3>) -> !xegpu.mem_desc<64x128xf32>
      "xegpu.store_matrix"(%218, %219) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [32, 32]>}> : (vector<64x128xf32>, !xegpu.mem_desc<64x128xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "distribute_store_matrix"} : () -> ()
    "gpu.func"() <{function_type = (memref<4x128xf32>) -> ()}> ({
    ^bb0(%arg50: memref<4x128xf32>):
      %213 = "arith.constant"() <{value = dense<1.000000e+00> : vector<128xf32>}> : () -> vector<128xf32>
      %214 = "xegpu.create_nd_tdesc"(%arg50) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4x128xf32>) -> !xegpu.tensor_desc<4x128xf32>
      %215 = "xegpu.load_nd"(%214) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>}> : (!xegpu.tensor_desc<4x128xf32>) -> vector<4x128xf32>
      %216 = "vector.multi_reduction"(%215, %213) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<4x128xf32>, vector<128xf32>) -> vector<128xf32>
      %217 = "xegpu.convert_layout"(%216) <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>, dims = [0]>}> : (vector<128xf32>) -> vector<128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduce_dim_0"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x64xf32>) -> ()}> ({
    ^bb0(%arg49: memref<256x64xf32>):
      %208 = "arith.constant"() <{value = dense<1.000000e+00> : vector<256xf32>}> : () -> vector<256xf32>
      %209 = "xegpu.create_nd_tdesc"(%arg49) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x64xf32>) -> !xegpu.tensor_desc<256x64xf32>
      %210 = "xegpu.load_nd"(%209) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>}> : (!xegpu.tensor_desc<256x64xf32>) -> vector<256x64xf32>
      %211 = "vector.multi_reduction"(%210, %208) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<256x64xf32>, vector<256xf32>) -> vector<256xf32>
      %212 = "xegpu.convert_layout"(%211) <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>, dims = [1]>}> : (vector<256xf32>) -> vector<256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduce_dim_1"} : () -> ()
    "gpu.func"() <{function_type = (ui64) -> ()}> ({
    ^bb0(%arg48: ui64):
      %202 = "arith.constant"() <{value = dense<0.000000e+00> : vector<4x2x6xf16>}> : () -> vector<4x2x6xf16>
      %203 = "arith.constant"() <{value = dense<0> : vector<4x2x6x32xindex>}> : () -> vector<4x2x6x32xindex>
      %204 = "arith.constant"() <{value = dense<true> : vector<4x2x6x32xi1>}> : () -> vector<4x2x6x32xi1>
      %205 = "xegpu.load"(%arg48, %203, %204) <{layout = #xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>}> : (ui64, vector<4x2x6x32xindex>, vector<4x2x6x32xi1>) -> vector<4x2x6x32xf16>
      %206 = "vector.multi_reduction"(%205, %202) <{kind = #vector.kind<add>, reduction_dims = array<i64: 3>}> : (vector<4x2x6x32xf16>, vector<4x2x6xf16>) -> vector<4x2x6xf16>
      %207 = "xegpu.convert_layout"(%206) <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>, dims = [3]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>, dims = [3]>}> : (vector<4x2x6xf16>) -> vector<4x2x6xf16>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduce_4D"} : () -> ()
    "gpu.func"() <{function_type = (memref<32x32xf32>) -> ()}> ({
    ^bb0(%arg47: memref<32x32xf32>):
      %197 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %198 = "xegpu.create_nd_tdesc"(%arg47) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x32xf32>) -> !xegpu.tensor_desc<32x32xf32>
      %199 = "xegpu.load_nd"(%198) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [8, 8]>}> : (!xegpu.tensor_desc<32x32xf32>) -> vector<32x32xf32>
      %200 = "vector.multi_reduction"(%199, %197) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0, 1>}> : (vector<32x32xf32>, f32) -> f32
      %201 = "xegpu.convert_layout"(%200) <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 4], sg_data = [8, 8]>, dims = [0, 1]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 4], sg_data = [8, 8]>, dims = [0, 1]>}> : (f32) -> f32
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduce_scalar_cross_sg"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %195 = "vector.step"() : () -> vector<128xindex>
      %196 = "xegpu.convert_layout"(%195) <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 8], sg_data = [32, 32]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 8], sg_data = [32, 32]>, dims = [1]>}> : (vector<128xindex>) -> vector<128xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_step_op_slice_attr"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %193 = "vector.step"() : () -> vector<128xindex>
      %194 = "xegpu.convert_layout"(%193) <{input_layout = #xegpu.layout<sg_layout = [16], sg_data = [8]>, target_layout = #xegpu.layout<sg_layout = [16], sg_data = [8]>}> : (vector<128xindex>) -> vector<128xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_step_op_layout_attr"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %191 = "arith.constant"() <{value = dense<10> : vector<4xindex>}> : () -> vector<4xindex>
      %192 = "xegpu.convert_layout"(%191) <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 1]>, dims = [1, 2, 3]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 1]>, dims = [1, 2, 3]>}> : (vector<4xindex>) -> vector<4xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "constant_with_slice_attr"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %186 = "arith.constant"() <{value = dense<10> : vector<128xindex>}> : () -> vector<128xindex>
      %187 = "vector.step"() : () -> vector<128xindex>
      %188 = "arith.muli"(%186, %187) <{overflowFlags = #arith.overflow<none>}> : (vector<128xindex>, vector<128xindex>) -> vector<128xindex>
      %189 = "vector.shape_cast"(%188) : (vector<128xindex>) -> vector<1x1x1x128xindex>
      %190 = "xegpu.convert_layout"(%189) <{input_layout = #xegpu.layout<sg_layout = [8, 1, 1, 4], sg_data = [1, 1, 1, 32]>, target_layout = #xegpu.layout<sg_layout = [8, 1, 1, 4], sg_data = [1, 1, 1, 32]>}> : (vector<1x1x1x128xindex>) -> vector<1x1x1x128xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_shape_cast"} : () -> ()
    "gpu.func"() <{function_type = (index, index) -> ()}> ({
    ^bb0(%arg45: index, %arg46: index):
      %183 = "arith.muli"(%arg45, %arg46) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %184 = "vector.broadcast"(%183) : (index) -> vector<4x2x6x32xindex>
      %185 = "xegpu.convert_layout"(%184) <{input_layout = #xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>, target_layout = #xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>}> : (vector<4x2x6x32xindex>) -> vector<4x2x6x32xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_broadcast"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x32xf32>) -> ()}> ({
    ^bb0(%arg44: memref<256x32xf32>):
      %179 = "xegpu.create_nd_tdesc"(%arg44) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x32xf32>) -> !xegpu.tensor_desc<256x32xf32>
      %180 = "xegpu.load_nd"(%179) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [64, 32], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>}> : (!xegpu.tensor_desc<256x32xf32>) -> vector<256x32xf32>
      %181 = "vector.transpose"(%180) <{permutation = array<i64: 1, 0>}> : (vector<256x32xf32>) -> vector<32x256xf32>
      %182 = "xegpu.convert_layout"(%181) <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<32x256xf32>) -> vector<32x256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_transpose"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %177 = "arith.constant"() <{value = dense<[[0], [16], [32], [48], [64], [80], [96], [112], [128], [144], [160], [176], [192], [208], [224], [240], [256], [272], [288], [304], [320], [336], [352], [368], [384], [400], [416], [432], [448], [464], [480], [496]]> : vector<32x1xindex>}> : () -> vector<32x1xindex>
      %178 = "xegpu.convert_layout"(%177) <{input_layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 1]>}> : (vector<32x1xindex>) -> vector<32x1xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "non_splat_constant_2D"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %175 = "arith.constant"() <{value = dense<[[0, 16, 32, 48, 64, 80, 96, 112], [8, 24, 40, 56, 72, 88, 104, 120], [16, 32, 48, 64, 80, 96, 112, 128], [24, 40, 56, 72, 88, 104, 120, 136], [32, 48, 64, 80, 96, 112, 128, 144], [40, 56, 72, 88, 104, 120, 136, 152], [48, 64, 80, 96, 112, 128, 144, 160], [56, 72, 88, 104, 120, 136, 152, 168]]> : vector<8x8xindex>}> : () -> vector<8x8xindex>
      %176 = "xegpu.convert_layout"(%175) <{input_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2]>, target_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2]>}> : (vector<8x8xindex>) -> vector<8x8xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "non_splat_constant_2D_non_unit_dim"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %171 = "arith.constant"() <{value = dense<[0, 16, 32, 48, 64, 80, 96, 112, 128, 144, 160, 176, 192, 208, 224, 240, 256, 272, 288, 304, 320, 336, 352, 368, 384, 400, 416, 432, 448, 464, 480, 496]> : vector<32xindex>}> : () -> vector<32xindex>
      %172 = "xegpu.convert_layout"(%171) <{input_layout = #xegpu.layout<sg_layout = [32], sg_data = [1]>, target_layout = #xegpu.layout<sg_layout = [32], sg_data = [1]>}> : (vector<32xindex>) -> vector<32xindex>
      %173 = "arith.constant"() <{value = dense<[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]]> : vector<1x16xindex>}> : () -> vector<1x16xindex>
      %174 = "xegpu.convert_layout"(%173) <{input_layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 16]>, target_layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 16]>}> : (vector<1x16xindex>) -> vector<1x16xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "non_splat_constant"} : () -> ()
    "gpu.func"() <{function_type = (index) -> ()}> ({
    ^bb0(%arg43: index):
      %169 = "vector.broadcast"(%arg43) : (index) -> vector<4x1x1xindex>
      %170 = "xegpu.convert_layout"(%169) <{input_layout = #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 1, 1]>, target_layout = #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 1, 1]>}> : (vector<4x1x1xindex>) -> vector<4x1x1xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "scalar_broadcast"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %167 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 8>}> : () -> vector<32xi1>
      %168 = "xegpu.convert_layout"(%167) <{input_layout = #xegpu.layout<sg_layout = [2], sg_data = [16]>, target_layout = #xegpu.layout<sg_layout = [2], sg_data = [16]>}> : (vector<32xi1>) -> vector<32xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_mask_1D"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %165 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16, 16>}> : () -> vector<256x128xi1>
      %166 = "xegpu.convert_layout"(%165) <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : (vector<256x128xi1>) -> vector<256x128xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_mask_2D"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %162 = "arith.constant"() <{value = 8 : index}> : () -> index
      %163 = "vector.create_mask"(%162) : (index) -> vector<32xi1>
      %164 = "xegpu.convert_layout"(%163) <{input_layout = #xegpu.layout<sg_layout = [2], sg_data = [16]>, target_layout = #xegpu.layout<sg_layout = [2], sg_data = [16]>}> : (vector<32xi1>) -> vector<32xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_create_mask_1D"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %159 = "arith.constant"() <{value = 16 : index}> : () -> index
      %160 = "vector.create_mask"(%159, %159) : (index, index) -> vector<256x128xi1>
      %161 = "xegpu.convert_layout"(%160) <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : (vector<256x128xi1>) -> vector<256x128xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_create_mask_2D"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %153 = "memref.alloca"() <{alignment = 1024 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4096xf32>
      %154 = "arith.constant"() <{value = dense<0> : vector<256xindex>}> : () -> vector<256xindex>
      %155 = "arith.constant"() <{value = dense<true> : vector<256xi1>}> : () -> vector<256xi1>
      %156 = "xegpu.load"(%153, %154, %155) <{chunk_size = 1 : i64, layout = #xegpu.slice<#xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>, dims = [0]>}> : (memref<4096xf32>, vector<256xindex>, vector<256xi1>) -> vector<256xf32>
      %157 = "vector.broadcast"(%156) : (vector<256xf32>) -> vector<256x256xf32>
      %158 = "xegpu.convert_layout"(%157) <{input_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>}> : (vector<256x256xf32>) -> vector<256x256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "distribute_load_slice_attr"} : () -> ()
    "gpu.func"() <{function_type = (memref<?xf32>) -> ()}> ({
    ^bb0(%arg42: memref<?xf32>):
      %147 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1x32xf32>}> : () -> vector<1x32xf32>
      %148 = "arith.constant"() <{value = dense<0> : vector<1x32x32xindex>}> : () -> vector<1x32x32xindex>
      %149 = "arith.constant"() <{value = dense<true> : vector<1x32x32xi1>}> : () -> vector<1x32x32xi1>
      %150 = "xegpu.load"(%arg42, %148, %149) <{chunk_size = 1 : i64, layout = #xegpu.layout<sg_layout = [1, 32, 1], sg_data = [1, 1, 32]>}> : (memref<?xf32>, vector<1x32x32xindex>, vector<1x32x32xi1>) -> vector<1x32x32xf32>
      %151 = "vector.multi_reduction"(%150, %147) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<1x32x32xf32>, vector<1x32xf32>) -> vector<1x32xf32>
      %152 = "xegpu.convert_layout"(%151) <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [1, 32, 1], sg_data = [1, 1, 32]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [1, 32, 1], sg_data = [1, 1, 32]>, dims = [1]>}> : (vector<1x32xf32>) -> vector<1x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduce_cross_sg_dim_1"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg41: memref<256x128xf32>):
      %142 = "arith.constant"() <{value = dense<0.000000e+00> : vector<128xf32>}> : () -> vector<128xf32>
      %143 = "xegpu.create_nd_tdesc"(%arg41) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      %144 = "xegpu.load_nd"(%143) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      %145 = "vector.multi_reduction"(%144, %142) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<256x128xf32>, vector<128xf32>) -> vector<128xf32>
      %146 = "xegpu.convert_layout"(%145) <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>, dims = [0]>}> : (vector<128xf32>) -> vector<128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduce_cross_sg_dim_0"} : () -> ()
    "gpu.func"() <{function_type = (memref<?xf32>) -> ()}> ({
    ^bb0(%arg40: memref<?xf32>):
      %136 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2x2xf32>}> : () -> vector<2x2xf32>
      %137 = "arith.constant"() <{value = dense<0> : vector<2x2x128x128xindex>}> : () -> vector<2x2x128x128xindex>
      %138 = "arith.constant"() <{value = dense<true> : vector<2x2x128x128xi1>}> : () -> vector<2x2x128x128xi1>
      %139 = "xegpu.load"(%arg40, %137, %138) <{chunk_size = 1 : i64, layout = #xegpu.layout<sg_layout = [2, 2, 4, 4], sg_data = [1, 1, 32, 32]>}> : (memref<?xf32>, vector<2x2x128x128xindex>, vector<2x2x128x128xi1>) -> vector<2x2x128x128xf32>
      %140 = "vector.multi_reduction"(%139, %136) <{kind = #vector.kind<add>, reduction_dims = array<i64: 2, 3>}> : (vector<2x2x128x128xf32>, vector<2x2xf32>) -> vector<2x2xf32>
      %141 = "xegpu.convert_layout"(%140) <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [2, 2, 4, 4], sg_data = [1, 1, 32, 32]>, dims = [2, 3]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [2, 2, 4, 4], sg_data = [1, 1, 32, 32]>, dims = [2, 3]>}> : (vector<2x2xf32>) -> vector<2x2xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduce_multi_dim"} : () -> ()
    "gpu.func"() <{function_type = (memref<?xf32>) -> ()}> ({
    ^bb0(%arg39: memref<?xf32>):
      %130 = "arith.constant"() <{value = dense<0.000000e+00> : vector<32x32xf32>}> : () -> vector<32x32xf32>
      %131 = "arith.constant"() <{value = dense<0> : vector<32x32x128x128xindex>}> : () -> vector<32x32x128x128xindex>
      %132 = "arith.constant"() <{value = dense<true> : vector<32x32x128x128xi1>}> : () -> vector<32x32x128x128xi1>
      %133 = "xegpu.load"(%arg39, %131, %132) <{chunk_size = 1 : i64, layout = #xegpu.layout<sg_layout = [2, 2, 4, 4], sg_data = [16, 16, 32, 32]>}> : (memref<?xf32>, vector<32x32x128x128xindex>, vector<32x32x128x128xi1>) -> vector<32x32x128x128xf32>
      %134 = "vector.multi_reduction"(%133, %130) <{kind = #vector.kind<add>, reduction_dims = array<i64: 2, 3>}> : (vector<32x32x128x128xf32>, vector<32x32xf32>) -> vector<32x32xf32>
      %135 = "xegpu.convert_layout"(%134) <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [2, 2, 4, 4], sg_data = [16, 16, 32, 32]>, dims = [2, 3]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [2, 2, 4, 4], sg_data = [16, 16, 32, 32]>, dims = [2, 3]>}> : (vector<32x32xf32>) -> vector<32x32xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduce_multi_dim_nou_unit_local_reduction"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg38: memref<256x128xf32>):
      %128 = "xegpu.create_nd_tdesc"(%arg38) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      %129 = "xegpu.load_nd"(%128) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [32, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd_tdesc_with_anchor_layout"} : () -> ()
    "gpu.func"() <{function_type = (memref<4096x4096xf32>, memref<4096x4096xf16>, memref<4096x4096xf16>) -> ()}> ({
    ^bb0(%arg33: memref<4096x4096xf32>, %arg34: memref<4096x4096xf16>, %arg35: memref<4096x4096xf16>):
      %110 = "arith.constant"() <{value = 32 : index}> : () -> index
      %111 = "arith.constant"() <{value = 4096 : index}> : () -> index
      %112 = "arith.constant"() <{value = 0 : index}> : () -> index
      %113 = "arith.constant"() <{value = 256 : index}> : () -> index
      %114 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %115 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %116 = "arith.muli"(%114, %113) <{overflowFlags = #arith.overflow<nsw>}> : (index, index) -> index
      %117 = "arith.muli"(%115, %113) <{overflowFlags = #arith.overflow<nsw>}> : (index, index) -> index
      %118 = "xegpu.create_nd_tdesc"(%arg33) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4096x4096xf32>) -> !xegpu.tensor_desc<256x256xf32, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>>
      %119 = "xegpu.load_nd"(%118, %116, %117) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>}> : (!xegpu.tensor_desc<256x256xf32, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>>, index, index) -> vector<256x256xf32>
      %120 = "xegpu.create_nd_tdesc"(%arg34) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<256x32xf16, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>>
      %121 = "xegpu.create_nd_tdesc"(%arg35) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4096x4096xf16>) -> !xegpu.tensor_desc<32x256xf16, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>>
      %122 = "scf.for"(%112, %111, %110, %119) ({
      ^bb0(%arg36: index, %arg37: vector<256x256xf32>):
        %123 = "xegpu.load_nd"(%120, %116, %arg36) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>}> : (!xegpu.tensor_desc<256x32xf16, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>>, index, index) -> vector<256x32xf16>
        %124 = "xegpu.load_nd"(%121, %arg36, %117) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>}> : (!xegpu.tensor_desc<32x256xf16, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>>, index, index) -> vector<32x256xf16>
        %125 = "xegpu.convert_layout"(%123) <{input_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>}> : (vector<256x32xf16>) -> vector<256x32xf16>
        %126 = "xegpu.convert_layout"(%124) <{input_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [16, 16]>}> : (vector<32x256xf16>) -> vector<32x256xf16>
        %127 = "xegpu.dpas"(%125, %126, %arg37) <{layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [16, 16]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>}> : (vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf32>) -> vector<256x256xf32>
        "scf.yield"(%127) : (vector<256x256xf32>) -> ()
      }) : (index, index, index, vector<256x256xf32>) -> vector<256x256xf32>
      "xegpu.store_nd"(%122, %118, %116, %117) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>}> : (vector<256x256xf32>, !xegpu.tensor_desc<256x256xf32, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout_no_slm"} : () -> ()
    "gpu.func"() <{function_type = (memref<128x256xf32>) -> ()}> ({
    ^bb0(%arg32: memref<128x256xf32>):
      %106 = "xegpu.create_nd_tdesc"(%arg32) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x256xf32>) -> !xegpu.tensor_desc<128x256xf32>
      %107 = "xegpu.load_nd"(%106) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 16], sg_data = [32, 16], inst_data = [16, 16]>}> : (!xegpu.tensor_desc<128x256xf32>) -> vector<128x256xf32>
      %108 = "xegpu.convert_layout"(%107) <{input_layout = #xegpu.layout<sg_layout = [4, 16], sg_data = [32, 16], inst_data = [16, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 32], inst_data = [16, 16]>}> : (vector<128x256xf32>) -> vector<128x256xf32>
      %109 = "xegpu.convert_layout"(%108) <{input_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 32], inst_data = [16, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 32], inst_data = [16, 16]>}> : (vector<128x256xf32>) -> vector<128x256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout_slm"} : () -> ()
    "gpu.func"() <{function_type = (memref<?xf32>) -> ()}> ({
    ^bb0(%arg31: memref<?xf32>):
      %101 = "arith.constant"() <{value = dense<0> : vector<8x128x256xindex>}> : () -> vector<8x128x256xindex>
      %102 = "arith.constant"() <{value = dense<true> : vector<8x128x256xi1>}> : () -> vector<8x128x256xi1>
      %103 = "xegpu.load"(%arg31, %101, %102) <{chunk_size = 1 : i64, layout = #xegpu.layout<sg_layout = [8, 4, 16], sg_data = [1, 32, 16], inst_data = [1, 16, 16]>}> : (memref<?xf32>, vector<8x128x256xindex>, vector<8x128x256xi1>) -> vector<8x128x256xf32>
      %104 = "xegpu.convert_layout"(%103) <{input_layout = #xegpu.layout<sg_layout = [8, 4, 16], sg_data = [1, 32, 16], inst_data = [1, 16, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 8, 8], sg_data = [1, 16, 32], inst_data = [1, 16, 16]>}> : (vector<8x128x256xf32>) -> vector<8x128x256xf32>
      %105 = "xegpu.convert_layout"(%104) <{input_layout = #xegpu.layout<sg_layout = [8, 8, 8], sg_data = [1, 16, 32], inst_data = [1, 16, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 8, 8], sg_data = [1, 16, 32], inst_data = [1, 16, 16]>}> : (vector<8x128x256xf32>) -> vector<8x128x256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout_3D"} : () -> ()
    "gpu.func"() <{function_type = (memref<32x32xf32>) -> ()}> ({
    ^bb0(%arg30: memref<32x32xf32>):
      %93 = "arith.constant"() <{value = dense<true> : vector<32x32xi1>}> : () -> vector<32x32xi1>
      %94 = "arith.constant"() <{value = dense<0> : vector<32x32xindex>}> : () -> vector<32x32xindex>
      %95 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %96 = "memref.extract_aligned_pointer_as_index"(%arg30) : (memref<32x32xf32>) -> index
      %97 = "arith.index_cast"(%96) : (index) -> i64
      %98 = "xegpu.load"(%97, %94, %93) <{layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>}> : (i64, vector<32x32xindex>, vector<32x32xi1>) -> vector<32x32xf32>
      %99 = "vector.multi_reduction"(%98, %95) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0, 1>}> : (vector<32x32xf32>, f32) -> f32
      %100 = "xegpu.convert_layout"(%99) <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>, dims = [0, 1]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>, dims = [0, 1]>}> : (f32) -> f32
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout_reduce_to_scalar"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x256xf32>) -> ()}> ({
    ^bb0(%arg29: memref<256x256xf32>):
      %83 = "xegpu.create_nd_tdesc"(%arg29) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf32>) -> !xegpu.tensor_desc<256x256xf32>
      %84 = "xegpu.load_nd"(%83) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32]>}> : (!xegpu.tensor_desc<256x256xf32>) -> vector<256x256xf32>
      %85 = "xegpu.convert_layout"(%84) <{input_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32]>, target_layout = #xegpu.slice<#xegpu.slice<#xegpu.slice<#xegpu.layout<sg_layout = [8, 1, 1, 8, 1, 1], sg_data = [32, 1, 16, 32, 1, 1]>, dims = [2]>, dims = [4]>, dims = [1, 3]>}> : (vector<256x256xf32>) -> vector<256x256xf32>
      %86 = "vector.shape_cast"(%85) : (vector<256x256xf32>) -> vector<256x1x256x1xf32>
      %87 = "vector.broadcast"(%86) : (vector<256x1x256x1xf32>) -> vector<256x16x256x16xf32>
      %88 = "vector.shape_cast"(%87) : (vector<256x16x256x16xf32>) -> vector<256x16x256x16x1xf32>
      %89 = "vector.broadcast"(%88) : (vector<256x16x256x16x1xf32>) -> vector<256x16x256x16x16xf32>
      %90 = "vector.shape_cast"(%89) : (vector<256x16x256x16x16xf32>) -> vector<256x16x1x256x16x16xf32>
      %91 = "vector.broadcast"(%90) : (vector<256x16x1x256x16x16xf32>) -> vector<256x16x16x256x16x16xf32>
      %92 = "xegpu.convert_layout"(%91) <{input_layout = #xegpu.layout<sg_layout = [8, 1, 1, 8, 1, 1], sg_data = [32, 16, 16, 32, 16, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 1, 1, 8, 1, 1], sg_data = [32, 16, 16, 32, 16, 16]>}> : (vector<256x16x16x256x16x16xf32>) -> vector<256x16x16x256x16x16xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "distribute_nested_slice"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg28: memref<256x128xf32>):
      %81 = "arith.constant"() <{value = dense<1.000000e+00> : vector<256x128xf32>}> : () -> vector<256x128xf32>
      %82 = "xegpu.create_nd_tdesc"(%arg28) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      "xegpu.store_nd"(%81, %82) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [16, 1], sg_data = [16, 128], inst_data = [8, 16]>}> : (vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "preserve_anchor_layout"} : () -> ()
    "gpu.func"() <{function_type = (memref<3x256x128xf32>) -> ()}> ({
    ^bb0(%arg27: memref<3x256x128xf32>):
      %80 = "xegpu.create_nd_tdesc"(%arg27) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<3x256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_from_higher_rank_memref"} : () -> ()
    "gpu.func"() <{function_type = (memref<1024x1024xf16>, memref<1024x1024xf16>, memref<1024x1024xf32>) -> ()}> ({
    ^bb0(%arg22: memref<1024x1024xf16>, %arg23: memref<1024x1024xf16>, %arg24: memref<1024x1024xf32>):
      %64 = "arith.constant"() <{value = 0 : index}> : () -> index
      %65 = "arith.constant"() <{value = 128 : index}> : () -> index
      %66 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %67 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %68 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %69 = "arith.muli"(%67, %65) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %70 = "arith.muli"(%68, %65) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %71 = "xegpu.create_nd_tdesc"(%arg24) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<128x128xf32>
      %72 = "xegpu.load_nd"(%71) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (!xegpu.tensor_desc<128x128xf32>) -> vector<128x128xf32>
      %73 = "xegpu.create_nd_tdesc"(%arg22) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<128x128xf16>
      %74 = "xegpu.create_nd_tdesc"(%arg23) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf16>) -> !xegpu.tensor_desc<128x128xf16>
      %75 = "scf.for"(%64, %66, %65, %72) ({
      ^bb0(%arg25: index, %arg26: vector<128x128xf32>):
        %77 = "xegpu.load_nd"(%73, %arg25) <{const_offsets = array<i64: 0, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>}> : (!xegpu.tensor_desc<128x128xf16>, index) -> vector<128x128xf16>
        %78 = "xegpu.load_nd"(%74, %arg25) <{const_offsets = array<i64: -9223372036854775808, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>}> : (!xegpu.tensor_desc<128x128xf16>, index) -> vector<128x128xf16>
        %79 = "xegpu.dpas"(%77, %78, %arg26) <{layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>) -> vector<128x128xf32>
        "scf.yield"(%79) : (vector<128x128xf32>) -> ()
      }) : (index, index, index, vector<128x128xf32>) -> vector<128x128xf32>
      %76 = "xegpu.create_nd_tdesc"(%arg24) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<128x128xf32>
      "xegpu.store_nd"(%75, %76) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_for"} : () -> ()
    "gpu.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> ()}> ({
    ^bb0(%arg16: memref<1024xf32>, %arg17: memref<1024xf32>):
      %53 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %54 = "arith.constant"() <{value = 10 : i32}> : () -> i32
      %55 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %56 = "arith.constant"() <{value = 256 : index}> : () -> index
      %57 = "xegpu.create_nd_tdesc"(%arg16) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32>
      %58 = "xegpu.load_nd"(%57) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32>) -> vector<256xf32>
      %59 = "xegpu.create_nd_tdesc"(%arg17) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32>
      %60:2 = "scf.while"(%58, %55) ({
      ^bb0(%arg20: vector<256xf32>, %arg21: i32):
        %63 = "arith.cmpi"(%arg21, %54) <{predicate = 2 : i64}> : (i32, i32) -> i1
        "scf.condition"(%63, %arg20, %arg21) : (i1, vector<256xf32>, i32) -> ()
      }, {
      ^bb0(%arg18: vector<256xf32>, %arg19: i32):
        "xegpu.store_nd"(%arg18, %59) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (vector<256xf32>, !xegpu.tensor_desc<256xf32>) -> ()
        %61 = "arith.addi"(%arg19, %53) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        %62 = "xegpu.load_nd"(%57, %56) <{const_offsets = array<i64: -9223372036854775808>, layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32>, index) -> vector<256xf32>
        "scf.yield"(%62, %61) : (vector<256xf32>, i32) -> ()
      }) : (vector<256xf32>, i32) -> (vector<256xf32>, i32)
      "xegpu.store_nd"(%60#0, %59) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (vector<256xf32>, !xegpu.tensor_desc<256xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_while_and_condition"} : () -> ()
    "gpu.func"() <{function_type = (memref<1024x1024xf32>, memref<1024x1024xf32>) -> ()}> ({
    ^bb0(%arg8: memref<1024x1024xf32>, %arg9: memref<1024x1024xf32>):
      %41 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %42 = "arith.constant"() <{value = 10 : i32}> : () -> i32
      %43 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %44 = "xegpu.create_nd_tdesc"(%arg8) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<128x128xf32>
      %45 = "xegpu.load_nd"(%44) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (!xegpu.tensor_desc<128x128xf32>) -> vector<128x128xf32>
      %46 = "xegpu.create_nd_tdesc"(%arg9) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024x1024xf32>) -> !xegpu.tensor_desc<128x128xf32>
      %47 = "xegpu.load_nd"(%46) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (!xegpu.tensor_desc<128x128xf32>) -> vector<128x128xf32>
      %48:3 = "scf.while"(%45, %47, %43) ({
      ^bb0(%arg13: vector<128x128xf32>, %arg14: vector<128x128xf32>, %arg15: i32):
        %52 = "arith.cmpi"(%arg15, %42) <{predicate = 2 : i64}> : (i32, i32) -> i1
        "scf.condition"(%52, %arg13, %arg14, %arg15) : (i1, vector<128x128xf32>, vector<128x128xf32>, i32) -> ()
      }, {
      ^bb0(%arg10: vector<128x128xf32>, %arg11: vector<128x128xf32>, %arg12: i32):
        %49 = "arith.addi"(%arg12, %41) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        %50 = "xegpu.load_nd"(%44) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (!xegpu.tensor_desc<128x128xf32>) -> vector<128x128xf32>
        %51 = "xegpu.load_nd"(%46) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (!xegpu.tensor_desc<128x128xf32>) -> vector<128x128xf32>
        "scf.yield"(%50, %51, %49) : (vector<128x128xf32>, vector<128x128xf32>, i32) -> ()
      }) : (vector<128x128xf32>, vector<128x128xf32>, i32) -> (vector<128x128xf32>, vector<128x128xf32>, i32)
      "xegpu.store_nd"(%48#0, %46) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32>) -> ()
      "xegpu.store_nd"(%48#1, %46) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_while_multi_vector_iter_args"} : () -> ()
    "gpu.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> ()}> ({
    ^bb0(%arg6: memref<1024xf32>, %arg7: memref<1024xf32>):
      %33 = "arith.constant"() <{value = 10 : index}> : () -> index
      %34 = "gpu.subgroup_id"() : () -> index
      %35 = "xegpu.create_nd_tdesc"(%arg6) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32>
      %36 = "xegpu.create_nd_tdesc"(%arg7) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32>
      %37 = "arith.cmpi"(%34, %33) <{predicate = 0 : i64}> : (index, index) -> i1
      %38 = "scf.if"(%37) ({
        %40 = "xegpu.load_nd"(%35) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32>) -> vector<256xf32>
        "scf.yield"(%40) : (vector<256xf32>) -> ()
      }, {
        %39 = "xegpu.load_nd"(%36) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32>) -> vector<256xf32>
        "scf.yield"(%39) : (vector<256xf32>) -> ()
      }) : (i1) -> vector<256xf32>
      "xegpu.store_nd"(%38, %35) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (vector<256xf32>, !xegpu.tensor_desc<256xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_if"} : () -> ()
    "gpu.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> ()}> ({
    ^bb0(%arg4: memref<1024xf32>, %arg5: memref<1024xf32>):
      %25 = "arith.constant"() <{value = 10 : index}> : () -> index
      %26 = "gpu.subgroup_id"() : () -> index
      %27 = "xegpu.create_nd_tdesc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32>
      %28 = "xegpu.load_nd"(%27) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32>) -> vector<256xf32>
      %29 = "arith.cmpi"(%26, %25) <{predicate = 0 : i64}> : (index, index) -> i1
      %30 = "scf.if"(%29) ({
        %32 = "xegpu.create_nd_tdesc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32>
        "scf.yield"(%32) : (!xegpu.tensor_desc<256xf32>) -> ()
      }, {
        %31 = "xegpu.create_nd_tdesc"(%arg5) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32>
        "scf.yield"(%31) : (!xegpu.tensor_desc<256xf32>) -> ()
      }) : (i1) -> !xegpu.tensor_desc<256xf32>
      "xegpu.store_nd"(%28, %30) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : (vector<256xf32>, !xegpu.tensor_desc<256xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_if_tensor_desc"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %23 = "arith.constant"() <{value = dense<1.000000e+00> : vector<256x128xf32>}> : () -> vector<256x128xf32>
      %24 = "xegpu.convert_layout"(%23) <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : (vector<256x128xf32>) -> vector<256x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "distribute_constant"} : () -> ()
    "gpu.func"() <{function_type = (memref<1x1x16xf32>) -> ()}> ({
    ^bb0(%arg3: memref<1x1x16xf32>):
      %15 = "vector.step"() : () -> vector<16xindex>
      %16 = "vector.shape_cast"(%15) : (vector<16xindex>) -> vector<1x1x16xindex>
      %17 = "arith.constant"() <{value = dense<10> : vector<1x1x16xindex>}> : () -> vector<1x1x16xindex>
      %18 = "arith.addi"(%16, %17) <{overflowFlags = #arith.overflow<none>}> : (vector<1x1x16xindex>, vector<1x1x16xindex>) -> vector<1x1x16xindex>
      %19 = "arith.constant"() <{value = dense<1.000000e+00> : vector<1x1x16xf32>}> : () -> vector<1x1x16xf32>
      %20 = "memref.extract_aligned_pointer_as_index"(%arg3) : (memref<1x1x16xf32>) -> index
      %21 = "arith.index_cast"(%20) : (index) -> i64
      %22 = "arith.constant"() <{value = dense<true> : vector<1x1x16xi1>}> : () -> vector<1x1x16xi1>
      "xegpu.store"(%19, %21, %18, %22) <{layout = #xegpu.layout<sg_layout = [1, 1, 1], sg_data = [1, 1, 16]>}> : (vector<1x1x16xf32>, i64, vector<1x1x16xindex>, vector<1x1x16xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "shape_cast_used_by_elementwise"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg2: memref<256x128xf32>):
      %9 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      %10 = "xegpu.load_nd"(%9) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      %11 = "vector.bitcast"(%10) : (vector<256x128xf32>) -> vector<256x256xi16>
      %12 = "arith.addi"(%11, %11) <{overflowFlags = #arith.overflow<none>}> : (vector<256x256xi16>, vector<256x256xi16>) -> vector<256x256xi16>
      %13 = "vector.bitcast"(%12) : (vector<256x256xi16>) -> vector<256x128xi32>
      %14 = "xegpu.convert_layout"(%13) <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : (vector<256x128xi32>) -> vector<256x128xi32>
      "gpu.return"() : () -> ()
    }) {sym_name = "bitcast_distribution"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg1: memref<256x128xf32>):
      %4 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      %5 = "xegpu.load_nd"(%4) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      %6 = "xegpu.load_nd"(%4) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      %7 = "vector.interleave"(%5, %6) : (vector<256x128xf32>, vector<256x128xf32>) -> vector<256x256xf32>
      %8 = "xegpu.convert_layout"(%7) <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64]>}> : (vector<256x256xf32>) -> vector<256x256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "interleave_distribution"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x256xf32>) -> ()}> ({
    ^bb0(%arg0: memref<256x256xf32>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x256xf32>) -> !xegpu.tensor_desc<256x256xf32>
      %1 = "xegpu.load_nd"(%0) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64]>}> : (!xegpu.tensor_desc<256x256xf32>) -> vector<256x256xf32>
      %2:2 = "vector.deinterleave"(%1) : (vector<256x256xf32>) -> (vector<256x128xf32>, vector<256x128xf32>)
      %3 = "xegpu.convert_layout"(%2#0) <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : (vector<256x128xf32>) -> vector<256x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "deinterleave_distribution"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xi32>, index) -> tensor<?xi32>, sym_name = "no_crash_on_dynamic_tensor"}> ({
  ^bb0(%arg0: tensor<?xi32>, %arg1: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "scf.for"(%0, %arg1, %1, %arg0) ({
    ^bb0(%arg2: index, %arg3: tensor<?xi32>):
      %3 = "arith.index_cast"(%arg2) : (index) -> i32
      %4 = "tensor.insert"(%3, %arg3, %arg2) : (i32, tensor<?xi32>, index) -> tensor<?xi32>
      "scf.yield"(%4) : (tensor<?xi32>) -> ()
    }) : (index, index, index, tensor<?xi32>) -> tensor<?xi32>
    "func.return"(%2) : (tensor<?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

