"builtin.module"() ({
  "gpu.module"() <{sym_name = "test_distribution"}> ({
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg26: memref<256x128xf32>):
      %88 = "xegpu.create_nd_tdesc"(%arg26) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg25: memref<256x128xf32>):
      %86 = "xegpu.create_nd_tdesc"(%arg25) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      %87 = "xegpu.load_nd"(%86) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "load_nd"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg24: memref<256x128xf32>):
      %84 = "xegpu.create_nd_tdesc"(%arg24) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      %85 = "xegpu.load_nd"(%84) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      "xegpu.store_nd"(%85, %84) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_nd_with_offset"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg23: memref<256x128xf32>):
      %83 = "xegpu.create_nd_tdesc"(%arg23) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      "xegpu.prefetch_nd"(%83) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "prefetch_nd"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf16>, memref<128x256xf16>) -> ()}> ({
    ^bb0(%arg21: memref<256x128xf16>, %arg22: memref<128x256xf16>):
      %78 = "xegpu.create_nd_tdesc"(%arg21) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf16>) -> !xegpu.tensor_desc<256x128xf16>
      %79 = "xegpu.load_nd"(%78) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<256x128xf16>) -> vector<256x128xf16>
      %80 = "xegpu.create_nd_tdesc"(%arg22) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x256xf16>) -> !xegpu.tensor_desc<128x256xf16>
      %81 = "xegpu.load_nd"(%80) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>}> : (!xegpu.tensor_desc<128x256xf16>) -> vector<128x256xf16>
      %82 = "xegpu.dpas"(%79, %81) <{layout_a = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<256x128xf16>, vector<128x256xf16>) -> vector<256x256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x64xf32>) -> ()}> ({
    ^bb0(%arg20: memref<256x64xf32>):
      %73 = "arith.constant"() <{value = dense<1.000000e+00> : vector<256xf32>}> : () -> vector<256xf32>
      %74 = "xegpu.create_nd_tdesc"(%arg20) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x64xf32>) -> !xegpu.tensor_desc<256x64xf32>
      %75 = "xegpu.load_nd"(%74) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>}> : (!xegpu.tensor_desc<256x64xf32>) -> vector<256x64xf32>
      %76 = "vector.multi_reduction"(%75, %73) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<256x64xf32>, vector<256xf32>) -> vector<256xf32>
      %77 = "xegpu.convert_layout"(%76) <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [8, 1], sg_data = [16, 64]>, dims = [1]>}> : (vector<256xf32>) -> vector<256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduce_dim_1"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %71 = "arith.constant"() <{value = dense<[[0], [16], [32], [48], [64], [80], [96], [112], [128], [144], [160], [176], [192], [208], [224], [240], [256], [272], [288], [304], [320], [336], [352], [368], [384], [400], [416], [432], [448], [464], [480], [496]]> : vector<32x1xindex>}> : () -> vector<32x1xindex>
      %72 = "xegpu.convert_layout"(%71) <{input_layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [2, 1]>, target_layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [2, 1]>}> : (vector<32x1xindex>) -> vector<32x1xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "non_splat_constant"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg19: memref<256x128xf32>):
      %67 = "xegpu.create_nd_tdesc"(%arg19) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      %68 = "xegpu.load_nd"(%67) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 16], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      %69 = "vector.transpose"(%68) <{permutation = array<i64: 1, 0>}> : (vector<256x128xf32>) -> vector<128x256xf32>
      %70 = "xegpu.convert_layout"(%69) <{input_layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 32], lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [16, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : (vector<128x256xf32>) -> vector<128x256xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_transpose"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %65 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 16, 16>}> : () -> vector<256x128xi1>
      %66 = "xegpu.convert_layout"(%65) <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16]>}> : (vector<256x128xi1>) -> vector<256x128xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_mask_2D"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %62 = "arith.constant"() <{value = 16 : index}> : () -> index
      %63 = "vector.create_mask"(%62, %62) : (index, index) -> vector<256x128xi1>
      %64 = "xegpu.convert_layout"(%63) <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 16]>}> : (vector<256x128xi1>) -> vector<256x128xi1>
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_create_mask_2D"} : () -> ()
    "gpu.func"() <{function_type = (memref<4096x128xf32>, memref<4096x128xf32>) -> ()}> ({
    ^bb0(%arg17: memref<4096x128xf32>, %arg18: memref<4096x128xf32>):
      %54 = "arith.constant"() <{value = dense<0xFF800000> : vector<256xf32>}> : () -> vector<256xf32>
      %55 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %56 = "xegpu.create_nd_tdesc"(%arg17) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4096x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      %57 = "xegpu.load_nd"(%56, %55) <{const_offsets = array<i64: -9223372036854775808, 0>, layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>}> : (!xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>>, index) -> vector<256x128xf32>
      %58 = "vector.multi_reduction"(%57, %54) <{kind = #vector.kind<maximumf>, reduction_dims = array<i64: 1>}> : (vector<256x128xf32>, vector<256xf32>) -> vector<256xf32>
      %59 = "vector.shape_cast"(%58) : (vector<256xf32>) -> vector<256x1xf32>
      %60 = "vector.broadcast"(%59) : (vector<256x1xf32>) -> vector<256x128xf32>
      %61 = "xegpu.create_nd_tdesc"(%arg17) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<4096x128xf32>) -> !xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      "xegpu.store_nd"(%60, %61, %55) <{const_offsets = array<i64: -9223372036854775808, 0>, layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 128], inst_data = [8, 16]>}> : (vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>>, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "distribute_shapecast_expandunitdims_broadcast"} : () -> ()
    "gpu.func"() <{function_type = (memref<2048xf32, 1>) -> (), kernel}> ({
    ^bb0(%arg16: memref<2048xf32, 1>):
      %48 = "arith.constant"() <{value = dense<0> : vector<8x256xindex>}> : () -> vector<8x256xindex>
      %49 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8xf32>}> : () -> vector<8xf32>
      %50 = "arith.constant"() <{value = dense<true> : vector<8x256xi1>}> : () -> vector<8x256xi1>
      %51 = "xegpu.load"(%arg16, %48, %50) <{layout = #xegpu.layout<sg_layout = [1, 16], sg_data = [4, 16]>}> : (memref<2048xf32, 1>, vector<8x256xindex>, vector<8x256xi1>) -> vector<8x256xf32>
      %52 = "vector.multi_reduction"(%51, %49) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<8x256xf32>, vector<8xf32>) -> vector<8xf32>
      %53 = "xegpu.convert_layout"(%52) <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [1, 16], sg_data = [4, 16]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [1, 16], sg_data = [4, 16]>, dims = [1]>}> : (vector<8xf32>) -> vector<8xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "reduction_cross_sg_rr"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %46 = "arith.constant"() <{value = dense<0> : vector<8xindex>}> : () -> vector<8xindex>
      %47 = "xegpu.convert_layout"(%46) <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [16, 1], sg_data = [16, 4], order = [0, 1]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [16, 1], sg_data = [16, 4], order = [0, 1]>, dims = [0]>}> : (vector<8xindex>) -> vector<8xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "splat_constant"} : () -> ()
    "gpu.func"() <{function_type = () -> ()}> ({
      %43 = "vector.step"() : () -> vector<8xindex>
      %44 = "vector.broadcast"(%43) : (vector<8xindex>) -> vector<256x8xindex>
      %45 = "xegpu.convert_layout"(%44) <{input_layout = #xegpu.layout<sg_layout = [16, 1], sg_data = [16, 4]>, target_layout = #xegpu.layout<sg_layout = [16, 1], sg_data = [16, 4]>}> : (vector<256x8xindex>) -> vector<256x8xindex>
      "gpu.return"() : () -> ()
    }) {sym_name = "step_broadcast"} : () -> ()
    "gpu.func"() <{function_type = (memref<256x128xf32>) -> ()}> ({
    ^bb0(%arg15: memref<256x128xf32>):
      %42 = "xegpu.create_nd_tdesc"(%arg15) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 64]>>
      "gpu.return"() : () -> ()
    }) {sym_name = "create_nd_tdesc_with_shared_data"} : () -> ()
    "gpu.func"() <{function_type = (memref<128x1xf32>) -> ()}> ({
    ^bb0(%arg14: memref<128x1xf32>):
      %38 = "xegpu.create_nd_tdesc"(%arg14) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x1xf32>) -> !xegpu.tensor_desc<128x1xf32>
      %39 = "xegpu.load_nd"(%38) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 1], sg_data = [16, 1], lane_layout = [8, 1], lane_data = [1, 1]>}> : (!xegpu.tensor_desc<128x1xf32>) -> vector<128x1xf32>
      %40 = "vector.broadcast"(%39) : (vector<128x1xf32>) -> vector<128x64xf32>
      %41 = "xegpu.convert_layout"(%40) <{input_layout = #xegpu.layout<sg_layout = [4, 1], sg_data = [16, 32], lane_layout = [8, 1], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [4, 1], sg_data = [16, 32], lane_layout = [8, 1], lane_data = [1, 1]>}> : (vector<128x64xf32>) -> vector<128x64xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "broadcast"} : () -> ()
    "gpu.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> ()}> ({
    ^bb0(%arg11: memref<1024xf32>, %arg12: memref<1024xf32>):
      %30 = "arith.constant"() <{value = 1 : index}> : () -> index
      %31 = "arith.constant"() <{value = 10 : index}> : () -> index
      %32 = "arith.constant"() <{value = 0 : index}> : () -> index
      %33 = "arith.constant"() <{value = 256 : index}> : () -> index
      %34 = "arith.constant"() <{value = 1024 : index}> : () -> index
      %35 = "xegpu.create_nd_tdesc"(%arg11) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32>
      %36 = "xegpu.create_nd_tdesc"(%arg12) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32>
      "scf.for"(%32, %34, %33) ({
      ^bb0(%arg13: index):
        %37 = "xegpu.load_nd"(%35, %arg13) <{const_offsets = array<i64: -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32>, index) -> vector<256xf32>
        "xegpu.store_nd"(%37, %36, %arg13) <{const_offsets = array<i64: -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (vector<256xf32>, !xegpu.tensor_desc<256xf32>, index) -> ()
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_for"} : () -> ()
    "gpu.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> ()}> ({
    ^bb0(%arg5: memref<1024xf32>, %arg6: memref<1024xf32>):
      %19 = "arith.constant"() <{value = 1 : i32}> : () -> i32
      %20 = "arith.constant"() <{value = 10 : i32}> : () -> i32
      %21 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      %22 = "arith.constant"() <{value = 256 : index}> : () -> index
      %23 = "xegpu.create_nd_tdesc"(%arg5) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32>
      %24 = "xegpu.load_nd"(%23) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32>) -> vector<256xf32>
      %25 = "xegpu.create_nd_tdesc"(%arg6) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32>
      %26:2 = "scf.while"(%24, %21) ({
      ^bb0(%arg9: vector<256xf32>, %arg10: i32):
        %29 = "arith.cmpi"(%arg10, %20) <{predicate = 2 : i64}> : (i32, i32) -> i1
        "scf.condition"(%29, %arg9, %arg10) : (i1, vector<256xf32>, i32) -> ()
      }, {
      ^bb0(%arg7: vector<256xf32>, %arg8: i32):
        "xegpu.store_nd"(%arg7, %25) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (vector<256xf32>, !xegpu.tensor_desc<256xf32>) -> ()
        %27 = "arith.addi"(%arg8, %19) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
        %28 = "xegpu.load_nd"(%23, %22) <{const_offsets = array<i64: -9223372036854775808>, layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32>, index) -> vector<256xf32>
        "scf.yield"(%28, %27) : (vector<256xf32>, i32) -> ()
      }) : (vector<256xf32>, i32) -> (vector<256xf32>, i32)
      "xegpu.store_nd"(%26#0, %25) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (vector<256xf32>, !xegpu.tensor_desc<256xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_while_and_condition"} : () -> ()
    "gpu.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> ()}> ({
    ^bb0(%arg3: memref<1024xf32>, %arg4: memref<1024xf32>):
      %11 = "arith.constant"() <{value = 10 : index}> : () -> index
      %12 = "gpu.subgroup_id"() : () -> index
      %13 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32>
      %14 = "xegpu.create_nd_tdesc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32>
      %15 = "arith.cmpi"(%12, %11) <{predicate = 0 : i64}> : (index, index) -> i1
      %16 = "scf.if"(%15) ({
        %18 = "xegpu.load_nd"(%13) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32>) -> vector<256xf32>
        "scf.yield"(%18) : (vector<256xf32>) -> ()
      }, {
        %17 = "xegpu.load_nd"(%14) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32>) -> vector<256xf32>
        "scf.yield"(%17) : (vector<256xf32>) -> ()
      }) : (i1) -> vector<256xf32>
      "xegpu.store_nd"(%16, %13) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (vector<256xf32>, !xegpu.tensor_desc<256xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_if"} : () -> ()
    "gpu.func"() <{function_type = (memref<1024xf32>, memref<1024xf32>) -> ()}> ({
    ^bb0(%arg1: memref<1024xf32>, %arg2: memref<1024xf32>):
      %3 = "arith.constant"() <{value = 10 : index}> : () -> index
      %4 = "gpu.subgroup_id"() : () -> index
      %5 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      %6 = "xegpu.load_nd"(%5) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [8], sg_data = [16]>}> : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> vector<256xf32>
      %7 = "arith.cmpi"(%4, %3) <{predicate = 0 : i64}> : (index, index) -> i1
      %8 = "scf.if"(%7) ({
        %10 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        "scf.yield"(%10) : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> ()
      }, {
        %9 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<1024xf32>) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
        "scf.yield"(%9) : (!xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> ()
      }) : (i1) -> !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>
      "xegpu.store_nd"(%6, %8) <{const_offsets = array<i64: 0>}> : (vector<256xf32>, !xegpu.tensor_desc<256xf32, #xegpu.layout<sg_layout = [8], sg_data = [16]>>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "scf_if_tensor_desc"} : () -> ()
    "gpu.func"() <{function_type = (memref<32x64xf32>) -> ()}> ({
    ^bb0(%arg0: memref<32x64xf32>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x64xf32>) -> !xegpu.tensor_desc<32x64xf32>
      %1 = "xegpu.load_nd"(%0) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [16, 16]>}> : (!xegpu.tensor_desc<32x64xf32>) -> vector<32x64xf32>
      %2 = "xegpu.convert_layout"(%1) <{input_layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [16, 16]>, target_layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [16, 16], inst_data = [8, 16]>}> : (vector<32x64xf32>) -> vector<32x64xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout_optimal"} : () -> ()
  }) : () -> ()
}) : () -> ()

