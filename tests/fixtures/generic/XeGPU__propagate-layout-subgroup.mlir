"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256x128xf32>) -> (), sym_name = "store_nd"}> ({
    ^bb0(%arg0: memref<256x128xf32>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      %1 = "xegpu.load_nd"(%0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      "xegpu.store_nd"(%1, %0) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : (vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "func.func"() <{function_type = (memref<256x128xf32>, memref<128x256xf32>) -> (), sym_name = "vector_transpose"}> ({
    ^bb0(%arg0: memref<256x128xf32>, %arg1: memref<128x256xf32>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      %1 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x256xf32>) -> !xegpu.tensor_desc<128x256xf32>
      %2 = "xegpu.load_nd"(%0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      %3 = "vector.transpose"(%2) <{permutation = array<i64: 1, 0>}> : (vector<256x128xf32>) -> vector<128x256xf32>
      "xegpu.store_nd"(%3, %1) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [16, 64], order = [1, 0]>}> : (vector<128x256xf32>, !xegpu.tensor_desc<128x256xf32>) -> ()
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<256x128xf32>, memref<128x256xf32>) -> (), kernel, known_block_size = array<i32: 1, 32, 16>}> ({
    ^bb0(%arg0: memref<256x128xf32>, %arg1: memref<128x256xf32>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<256x128xf32>) -> !xegpu.tensor_desc<256x128xf32>
      %1 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x256xf32>) -> !xegpu.tensor_desc<128x256xf32>
      %2 = "xegpu.load_nd"(%0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<256x128xf32>) -> vector<256x128xf32>
      %3 = "vector.transpose"(%2) <{permutation = array<i64: 1, 0>}> : (vector<256x128xf32>) -> vector<128x256xf32>
      "xegpu.store_nd"(%3, %1) <{const_offsets = array<i64: 0, 0>}> : (vector<128x256xf32>, !xegpu.tensor_desc<128x256xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_transpose"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<128x128xf16>, memref<128x128xf16>, memref<128x128xf32>) -> (), kernel, known_block_size = array<i32: 1, 64, 16>}> ({
    ^bb0(%arg0: memref<128x128xf16>, %arg1: memref<128x128xf16>, %arg2: memref<128x128xf32>):
      %0 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x128xf16>) -> !xegpu.tensor_desc<128x128xf16>
      %1 = "xegpu.load_nd"(%0) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<128x128xf16>) -> vector<128x128xf16>
      %2 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x128xf16>) -> !xegpu.tensor_desc<128x128xf16>
      %3 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<128x128xf16>) -> vector<128x128xf16>
      %4 = "xegpu.dpas"(%1, %3) : (vector<128x128xf16>, vector<128x128xf16>) -> vector<128x128xf32>
      %5 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x128xf32>) -> !xegpu.tensor_desc<128x128xf32>
      "xegpu.store_nd"(%4, %5) <{const_offsets = array<i64: 0, 0>}> : (vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<32x64xf32>, memref<32xf32>) -> (), kernel, known_block_size = array<i32: 1, 32, 16>}> ({
    ^bb0(%arg0: memref<32x64xf32>, %arg1: memref<32xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<32xf32>}> : () -> vector<32xf32>
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x64xf32>) -> !xegpu.tensor_desc<32x64xf32>
      %2 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<32x64xf32>) -> vector<32x64xf32>
      %3 = "vector.multi_reduction"(%2, %0) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<32x64xf32>, vector<32xf32>) -> vector<32xf32>
      %4 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32xf32>) -> !xegpu.tensor_desc<32xf32>
      "xegpu.store_nd"(%3, %4) <{const_offsets = array<i64: 0>, layout = #xegpu.layout<sg_layout = [32], sg_data = [1]>}> : (vector<32xf32>, !xegpu.tensor_desc<32xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_row_reduction"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<32x64xf32>, memref<32xf32>) -> (), kernel, known_block_size = array<i32: 1, 32, 16>}> ({
    ^bb0(%arg0: memref<32x64xf32>, %arg1: memref<32xf32>):
      %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x64xf32>) -> !xegpu.tensor_desc<32x64xf32>
      %2 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<32x64xf32>) -> vector<32x64xf32>
      %3 = "vector.multi_reduction"(%2, %0) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0, 1>}> : (vector<32x64xf32>, f32) -> f32
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_row_reduction_scalar"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<32x128xf32>, memref<32xf32>) -> (), kernel, known_block_size = array<i32: 1, 32, 16>}> ({
    ^bb0(%arg0: memref<32x128xf32>, %arg1: memref<32xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<32xf32>}> : () -> vector<32xf32>
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<32x128xf32>}> : () -> vector<32x128xf32>
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x128xf32>) -> !xegpu.tensor_desc<32x128xf32>
      %3 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<32x128xf32>) -> vector<32x128xf32>
      %4 = "vector.broadcast"(%3) : (vector<32x128xf32>) -> vector<4x32x128xf32>
      %5 = "vector.multi_reduction"(%4, %1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<4x32x128xf32>, vector<32x128xf32>) -> vector<32x128xf32>
      %6 = "vector.multi_reduction"(%5, %0) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<32x128xf32>, vector<32xf32>) -> vector<32xf32>
      %7 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
      %8 = "vector.step"() : () -> vector<32xindex>
      "xegpu.store"(%6, %arg1, %8, %7) <{layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 8], sg_data = [8, 16]>, dims = [1]>}> : (vector<32xf32>, memref<32xf32>, vector<32xindex>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_nest_reduction"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<32x128xf32>, memref<32xf32>) -> (), kernel, known_block_size = array<i32: 1, 32, 16>}> ({
    ^bb0(%arg0: memref<32x128xf32>, %arg1: memref<32xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<32xf32>}> : () -> vector<32xf32>
      %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<32x128xf32>}> : () -> vector<32x128xf32>
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x128xf32>) -> !xegpu.tensor_desc<32x128xf32>
      %3 = "xegpu.load_nd"(%2) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<32x128xf32>) -> vector<32x128xf32>
      %4 = "vector.broadcast"(%3) : (vector<32x128xf32>) -> vector<4x32x128xf32>
      %5 = "vector.multi_reduction"(%4, %1) <{kind = #vector.kind<add>, reduction_dims = array<i64: 0>}> : (vector<4x32x128xf32>, vector<32x128xf32>) -> vector<32x128xf32>
      %6 = "vector.multi_reduction"(%5, %0) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<32x128xf32>, vector<32xf32>) -> vector<32xf32>
      %7 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
      %8 = "vector.step"() : () -> vector<32xindex>
      "xegpu.store"(%6, %arg1, %8, %7) <{layout = #xegpu.slice<#xegpu.slice<#xegpu.layout<sg_layout = [1, 4, 8], sg_data = [4, 8, 32]>, dims = [0]>, dims = [1]>}> : (vector<32xf32>, memref<32xf32>, vector<32xindex>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_nest_reduction_with_nest_slice_layout"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<2048xf32, 1>) -> (), kernel}> ({
    ^bb0(%arg0: memref<2048xf32, 1>):
      %0 = "arith.constant"() <{value = dense<0> : vector<8x256xindex>}> : () -> vector<8x256xindex>
      %1 = "arith.constant"() <{value = dense<1024> : vector<8xindex>}> : () -> vector<8xindex>
      %2 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8xf32>}> : () -> vector<8xf32>
      %3 = "arith.constant"() <{value = dense<true> : vector<8x256xi1>}> : () -> vector<8x256xi1>
      %4 = "arith.constant"() <{value = dense<true> : vector<8xi1>}> : () -> vector<8xi1>
      %5 = "xegpu.load"(%arg0, %0, %3) : (memref<2048xf32, 1>, vector<8x256xindex>, vector<8x256xi1>) -> vector<8x256xf32>
      %6 = "vector.multi_reduction"(%5, %2) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<8x256xf32>, vector<8xf32>) -> vector<8xf32>
      "xegpu.store"(%6, %arg0, %1, %4) <{layout = #xegpu.slice<#xegpu.layout<sg_layout = [1, 16], sg_data = [4, 16]>, dims = [1]>}> : (vector<8xf32>, memref<2048xf32, 1>, vector<8xindex>, vector<8xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "vector_reduction_preserve_round_robin_layout"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0 * 128)>
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<2048x8192xf16>, memref<8192x4096xf16>, memref<2048x4096xf32>) -> (), kernel, known_block_size = array<i32: 4, 1, 16>}> ({
    ^bb0(%arg0: memref<2048x8192xf16>, %arg1: memref<8192x4096xf16>, %arg2: memref<2048x4096xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<128x128xf32>}> : () -> vector<128x128xf32>
      %1 = "arith.constant"() <{value = 128 : index}> : () -> index
      %2 = "arith.constant"() <{value = 8192 : index}> : () -> index
      %3 = "arith.constant"() <{value = 0 : index}> : () -> index
      %4 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %5 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %6 = "affine.apply"(%4) <{map = #map}> : (index) -> index
      %7 = "affine.apply"(%5) <{map = #map}> : (index) -> index
      %8 = "scf.for"(%3, %2, %1, %0) ({
      ^bb0(%arg3: index, %arg4: vector<128x128xf32>):
        %10 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2048x8192xf16>) -> !xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
        %11 = "xegpu.load_nd"(%10, %4, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>>, index, index) -> vector<128x128xf16>
        %12 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8192x4096xf16>) -> !xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
        %13 = "xegpu.load_nd"(%12, %arg3, %5) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>>, index, index) -> vector<128x128xf16>
        %14 = "xegpu.dpas"(%11, %13, %arg4) : (vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>) -> vector<128x128xf32>
        "scf.yield"(%14) : (vector<128x128xf32>) -> ()
      }) : (index, index, index, vector<128x128xf32>) -> vector<128x128xf32>
      %9 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2048x4096xf32>) -> !xegpu.tensor_desc<128x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      "xegpu.store_nd"(%8, %9, %6, %7) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "for_loop_dpas"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0 * 128)>
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<2048x8192xf16>, memref<8192x4096xf16>, memref<2048x4096xf32>) -> (), kernel, known_block_size = array<i32: 8, 1, 16>}> ({
    ^bb0(%arg0: memref<2048x8192xf16>, %arg1: memref<8192x4096xf16>, %arg2: memref<2048x4096xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<128x128xf32>}> : () -> vector<128x128xf32>
      %1 = "arith.constant"() <{value = 128 : index}> : () -> index
      %2 = "arith.constant"() <{value = 8192 : index}> : () -> index
      %3 = "arith.constant"() <{value = 0 : index}> : () -> index
      %4 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %5 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %6 = "affine.apply"(%4) <{map = #map}> : (index) -> index
      %7 = "affine.apply"(%5) <{map = #map}> : (index) -> index
      %8 = "scf.for"(%3, %2, %1, %0) ({
      ^bb0(%arg3: index, %arg4: vector<128x128xf32>):
        %10 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2048x8192xf16>) -> !xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
        %11 = "xegpu.load_nd"(%10, %4, %arg3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>>, index, index) -> vector<128x128xf16>
        %12 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8192x4096xf16>) -> !xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
        %13 = "xegpu.load_nd"(%12, %arg3, %5) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<128x128xf16, #xegpu.block_tdesc_attr<boundary_check = false>>, index, index) -> vector<128x128xf16>
        %14 = "xegpu.dpas"(%11, %13, %arg4) : (vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>) -> vector<128x128xf32>
        "scf.yield"(%14) : (vector<128x128xf32>) -> ()
      }) : (index, index, index, vector<128x128xf32>) -> vector<128x128xf32>
      %9 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2048x4096xf32>) -> !xegpu.tensor_desc<128x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      "xegpu.store_nd"(%8, %9, %6, %7) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32, #xegpu.block_tdesc_attr<boundary_check = false>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "for_loop_misaligned_dpas_fail"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<2048x8192xf16>, memref<8192x4096xf16>, memref<2048x4096xf32>) -> (), kernel, known_block_size = array<i32: 8, 1, 16>}> ({
    ^bb0(%arg0: memref<2048x8192xf16>, %arg1: memref<8192x4096xf16>, %arg2: memref<2048x4096xf32>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<32x64xf32>}> : () -> vector<32x64xf32>
      %1 = "arith.constant"() <{value = 16 : index}> : () -> index
      %2 = "arith.constant"() <{value = 8192 : index}> : () -> index
      %3 = "arith.constant"() <{value = 0 : index}> : () -> index
      %4 = "gpu.block_id"() <{dimension = #gpu<dim x>}> : () -> index
      %5 = "gpu.block_id"() <{dimension = #gpu<dim y>}> : () -> index
      %6 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2048x8192xf16>) -> !xegpu.tensor_desc<32x16xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
      %7 = "xegpu.load_nd"(%6, %4, %3) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x16xf16, #xegpu.block_tdesc_attr<boundary_check = false>>, index, index) -> vector<32x16xf16>
      %8 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8192x4096xf16>) -> !xegpu.tensor_desc<16x64xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
      %9 = "xegpu.load_nd"(%8, %3, %5) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<16x64xf16, #xegpu.block_tdesc_attr<boundary_check = false>>, index, index) -> vector<16x64xf16>
      %10 = "xegpu.dpas"(%7, %9, %0) : (vector<32x16xf16>, vector<16x64xf16>, vector<32x64xf32>) -> vector<32x64xf32>
      %11 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2048x4096xf32>) -> !xegpu.tensor_desc<32x64xf32, #xegpu.block_tdesc_attr<boundary_check = false>>
      "xegpu.store_nd"(%10, %11, %4, %5) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<32x64xf32>, !xegpu.tensor_desc<32x64xf32, #xegpu.block_tdesc_attr<boundary_check = false>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_fails"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<2048x8192xf16>) -> (), kernel, known_block_size = array<i32: 8, 1, 16>}> ({
    ^bb0(%arg0: memref<2048x8192xf16>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16xf16>}> : () -> vector<8x16xf16>
      %1 = "arith.constant"() <{value = 0 : index}> : () -> index
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2048x8192xf16>) -> !xegpu.tensor_desc<8x16xf16, #xegpu.block_tdesc_attr<boundary_check = false>>
      %3 = "xegpu.load_nd"(%2, %1, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<8x16xf16, #xegpu.block_tdesc_attr<boundary_check = false>>, index, index) -> vector<8x16xf16>
      %4 = "arith.addf"(%3, %0) <{fastmath = #arith.fastmath<none>}> : (vector<8x16xf16>, vector<8x16xf16>) -> vector<8x16xf16>
      "xegpu.store_nd"(%4, %2, %1, %1) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<8x16xf16>, !xegpu.tensor_desc<8x16xf16, #xegpu.block_tdesc_attr<boundary_check = false>>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_fails"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module"}> ({
    "gpu.func"() <{function_type = (!xegpu.mem_desc<1x64x128xf32>, i1) -> ()}> ({
    ^bb0(%arg0: !xegpu.mem_desc<1x64x128xf32>, %arg1: i1):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      "scf.if"(%arg1) ({
        %1 = "xegpu.load_matrix"(%arg0, %0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (!xegpu.mem_desc<1x64x128xf32>, index, index, index) -> vector<1x32x32xf32>
        "xegpu.store_matrix"(%1, %arg0, %0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [1, 4, 2], sg_data = [1, 8, 16]>}> : (vector<1x32x32xf32>, !xegpu.mem_desc<1x64x128xf32>, index, index, index) -> ()
        "scf.yield"() : () -> ()
      }, {
      }) : (i1) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "load_store_matrix"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (!xegpu.mem_desc<32x128xf32>) -> ()}> ({
    ^bb0(%arg0: !xegpu.mem_desc<32x128xf32>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.load_matrix"(%arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (!xegpu.mem_desc<32x128xf32>, index, index) -> vector<32x128xf32>
      %2 = "xegpu.convert_layout"(%1) <{input_layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 16]>, target_layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [8, 16]>}> : (vector<32x128xf32>) -> vector<32x128xf32>
      "gpu.return"() : () -> ()
    }) {sym_name = "convert_layout"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<128x512xf8E5M2>, memref<512x256xf8E5M2>, memref<128x256xbf16>, memref<128x16xf8E8M0FNU>, memref<16x256xf8E8M0FNU>) -> (), kernel, known_block_size = array<i32: 1, 64, 16>}> ({
    ^bb0(%arg0: memref<128x512xf8E5M2>, %arg1: memref<512x256xf8E5M2>, %arg2: memref<128x256xbf16>, %arg3: memref<128x16xf8E8M0FNU>, %arg4: memref<16x256xf8E8M0FNU>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<128x256xbf16>}> : () -> vector<128x256xbf16>
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x512xf8E5M2>) -> !xegpu.tensor_desc<128x512xf8E5M2>
      %2 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<128x512xf8E5M2>) -> vector<128x512xf8E5M2>
      %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<512x256xf8E5M2>) -> !xegpu.tensor_desc<512x256xf8E5M2>
      %4 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<512x256xf8E5M2>) -> vector<512x256xf8E5M2>
      %5 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x16xf8E8M0FNU>) -> !xegpu.tensor_desc<128x16xf8E8M0FNU>
      %6 = "xegpu.load_nd"(%5) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<128x16xf8E8M0FNU>) -> vector<128x16xf8E8M0FNU>
      %7 = "xegpu.create_nd_tdesc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x256xf8E8M0FNU>) -> !xegpu.tensor_desc<16x256xf8E8M0FNU>
      %8 = "xegpu.load_nd"(%7) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x256xf8E8M0FNU>) -> vector<16x256xf8E8M0FNU>
      %9 = "xegpu.dpas_mx"(%2, %4, %0, %6, %8) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<128x512xf8E5M2>, vector<512x256xf8E5M2>, vector<128x256xbf16>, vector<128x16xf8E8M0FNU>, vector<16x256xf8E8M0FNU>) -> vector<128x256xbf16>
      %10 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x256xbf16>) -> !xegpu.tensor_desc<128x256xbf16>
      "xegpu.store_nd"(%9, %10) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 32]>}> : (vector<128x256xbf16>, !xegpu.tensor_desc<128x256xbf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_mx"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<128x512xf4E2M1FN>, memref<512x128xf4E2M1FN>, memref<128x128xf32>, memref<128x16xf8E8M0FNU>, memref<16x128xf8E8M0FNU>) -> (), kernel, known_block_size = array<i32: 1, 64, 16>}> ({
    ^bb0(%arg0: memref<128x512xf4E2M1FN>, %arg1: memref<512x128xf4E2M1FN>, %arg2: memref<128x128xf32>, %arg3: memref<128x16xf8E8M0FNU>, %arg4: memref<16x128xf8E8M0FNU>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<128x128xf32>}> : () -> vector<128x128xf32>
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x512xf4E2M1FN>) -> !xegpu.tensor_desc<128x512xf4E2M1FN>
      %2 = "xegpu.load_nd"(%1) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<128x512xf4E2M1FN>) -> vector<128x512xf4E2M1FN>
      %3 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<512x128xf4E2M1FN>) -> !xegpu.tensor_desc<512x128xf4E2M1FN>
      %4 = "xegpu.load_nd"(%3) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<512x128xf4E2M1FN>) -> vector<512x128xf4E2M1FN>
      %5 = "xegpu.create_nd_tdesc"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x16xf8E8M0FNU>) -> !xegpu.tensor_desc<128x16xf8E8M0FNU>
      %6 = "xegpu.load_nd"(%5) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<128x16xf8E8M0FNU>) -> vector<128x16xf8E8M0FNU>
      %7 = "xegpu.create_nd_tdesc"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x128xf8E8M0FNU>) -> !xegpu.tensor_desc<16x128xf8E8M0FNU>
      %8 = "xegpu.load_nd"(%7) <{const_offsets = array<i64: 0, 0>}> : (!xegpu.tensor_desc<16x128xf8E8M0FNU>) -> vector<16x128xf8E8M0FNU>
      %9 = "xegpu.dpas_mx"(%2, %4, %0, %6, %8) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<128x512xf4E2M1FN>, vector<512x128xf4E2M1FN>, vector<128x128xf32>, vector<128x16xf8E8M0FNU>, vector<16x128xf8E8M0FNU>) -> vector<128x128xf32>
      %10 = "xegpu.create_nd_tdesc"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<128x128xf32>) -> !xegpu.tensor_desc<128x128xf32>
      "xegpu.store_nd"(%9, %10) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : (vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "dpas_mx_fp4"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<64x256xf16>, memref<64x32xf16>) -> (), kernel, known_block_size = array<i32: 1, 32, 16>}> ({
    ^bb0(%arg0: memref<64x256xf16>, %arg1: memref<64x32xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "arith.constant"() <{value = 32 : index}> : () -> index
      %2 = "arith.constant"() <{value = 256 : index}> : () -> index
      %3 = "arith.constant"() <{value = dense<0.000000e+00> : vector<64xf16>}> : () -> vector<64xf16>
      %4 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<64x256xf16>) -> !xegpu.tensor_desc<64x32xf16>
      %5 = "scf.for"(%0, %2, %1, %3) ({
      ^bb0(%arg2: index, %arg3: vector<64xf16>):
        %9 = "xegpu.load_nd"(%4, %arg2) <{const_offsets = array<i64: 0, -9223372036854775808>}> : (!xegpu.tensor_desc<64x32xf16>, index) -> vector<64x32xf16>
        %10 = "vector.multi_reduction"(%9, %arg3) <{kind = #vector.kind<add>, reduction_dims = array<i64: 1>}> : (vector<64x32xf16>, vector<64xf16>) -> vector<64xf16>
        "scf.yield"(%10) : (vector<64xf16>) -> ()
      }) : (index, index, index, vector<64xf16>) -> vector<64xf16>
      %6 = "vector.broadcast"(%5) : (vector<64xf16>) -> vector<32x64xf16>
      %7 = "vector.transpose"(%6) <{permutation = array<i64: 1, 0>}> : (vector<32x64xf16>) -> vector<64x32xf16>
      %8 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<64x32xf16>) -> !xegpu.tensor_desc<64x32xf16>
      "xegpu.store_nd"(%7, %8) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [4, 2], sg_data = [16, 16]>}> : (vector<64x32xf16>, !xegpu.tensor_desc<64x32xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "sum_reduction_broadcast_transpose"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<4096xf16>) -> (), kernel}> ({
    ^bb0(%arg0: memref<4096xf16>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<8x16x32xf16>}> : () -> vector<8x16x32xf16>
      %1 = "vector.shape_cast"(%0) : (vector<8x16x32xf16>) -> vector<4096xf16>
      %2 = "arith.constant"() <{value = dense<true> : vector<4096xi1>}> : () -> vector<4096xi1>
      %3 = "vector.step"() : () -> vector<4096xindex>
      "xegpu.store"(%1, %arg0, %3, %2) <{layout = #xegpu.layout<sg_layout = [8], sg_data = [512]>}> : (vector<4096xf16>, memref<4096xf16>, vector<4096xindex>, vector<4096xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "shape_cast_collapse_innermost"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<512xf16>) -> (), kernel}> ({
    ^bb0(%arg0: memref<512xf16>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2x8x32xf16>}> : () -> vector<2x8x32xf16>
      %1 = "vector.shape_cast"(%0) : (vector<2x8x32xf16>) -> vector<512xf16>
      %2 = "arith.constant"() <{value = dense<true> : vector<512xi1>}> : () -> vector<512xi1>
      %3 = "vector.step"() : () -> vector<512xindex>
      "xegpu.store"(%1, %arg0, %3, %2) <{layout = #xegpu.layout<sg_layout = [16], sg_data = [32]>}> : (vector<512xf16>, memref<512xf16>, vector<512xindex>, vector<512xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "shape_cast_collapse_sg_layout_spill_inward"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<8x128xf16>) -> (), kernel}> ({
    ^bb0(%arg0: memref<8x128xf16>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2x4x8x16xf16>}> : () -> vector<2x4x8x16xf16>
      %1 = "vector.shape_cast"(%0) : (vector<2x4x8x16xf16>) -> vector<8x128xf16>
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8x128xf16>) -> !xegpu.tensor_desc<8x128xf16>
      "xegpu.store_nd"(%1, %2) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [4, 32]>}> : (vector<8x128xf16>, !xegpu.tensor_desc<8x128xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "shape_cast_collapse_multi_groups"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<16x64xf16>) -> (), kernel}> ({
    ^bb0(%arg0: memref<16x64xf16>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<16x8x8xf16>}> : () -> vector<16x8x8xf16>
      %1 = "vector.shape_cast"(%0) : (vector<16x8x8xf16>) -> vector<16x64xf16>
      %2 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<16x64xf16>) -> !xegpu.tensor_desc<16x64xf16>
      "xegpu.store_nd"(%1, %2) <{const_offsets = array<i64: 0, 0>, layout = #xegpu.layout<sg_layout = [2, 2], sg_data = [8, 64]>}> : (vector<16x64xf16>, !xegpu.tensor_desc<16x64xf16>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "shape_cast_collapse_replicated"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<32xf16>) -> (), kernel}> ({
    ^bb0(%arg0: memref<32xf16>):
      %0 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2x16xf16>}> : () -> vector<2x16xf16>
      %1 = "vector.shape_cast"(%0) : (vector<2x16xf16>) -> vector<32xf16>
      %2 = "arith.constant"() <{value = dense<true> : vector<32xi1>}> : () -> vector<32xi1>
      %3 = "vector.step"() : () -> vector<32xindex>
      "xegpu.store"(%1, %arg0, %3, %2) <{layout = #xegpu.layout<sg_layout = [4], sg_data = [4]>}> : (vector<32xf16>, memref<32xf16>, vector<32xindex>, vector<32xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "shape_cast_collapse_sg_wraparound"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<256xf16>) -> (), kernel, known_block_size = array<i32: 256, 1, 1>}> ({
    ^bb0(%arg0: memref<256xf16>):
      %0 = "arith.constant"() <{value = dense<2.550000e+01> : vector<256xf16>}> : () -> vector<256xf16>
      %1 = "arith.constant"() <{value = dense<0> : vector<256xindex>}> : () -> vector<256xindex>
      %2 = "arith.constant"() <{value = dense<true> : vector<256xi1>}> : () -> vector<256xi1>
      "xegpu.store"(%0, %arg0, %1, %2) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>}> : (vector<256xf16>, memref<256xf16>, vector<256xindex>, vector<256xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_scatter"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (!xegpu.mem_desc<64x128xf16>, vector<64x128xf16>) -> (), kernel, known_block_size = array<i32: 512, 1, 1>}> ({
    ^bb0(%arg0: !xegpu.mem_desc<64x128xf16>, %arg1: vector<64x128xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      "xegpu.store_matrix"(%arg1, %arg0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808>}> : (vector<64x128xf16>, !xegpu.mem_desc<64x128xf16>, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_matrix"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<256xf16>) -> (), kernel, known_block_size = array<i32: 512, 1, 1>}> ({
    ^bb0(%arg0: memref<256xf16>):
      %0 = "arith.constant"() <{value = dense<2.550000e+01> : vector<256xf16>}> : () -> vector<256xf16>
      %1 = "arith.constant"() <{value = dense<0> : vector<256xindex>}> : () -> vector<256xindex>
      %2 = "arith.constant"() <{value = dense<true> : vector<256xi1>}> : () -> vector<256xi1>
      "xegpu.store"(%0, %arg0, %1, %2) <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>}> : (vector<256xf16>, memref<256xf16>, vector<256xindex>, vector<256xi1>) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "store_scatter_no_valid_sg_layout"} : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "test"}> ({
    "gpu.func"() <{function_type = (memref<32x2x32xf16>, memref<2x32x32xf16>) -> (), kernel}> ({
    ^bb0(%arg0: memref<32x2x32xf16>, %arg1: memref<2x32x32xf16>):
      %0 = "arith.constant"() <{value = 0 : index}> : () -> index
      %1 = "xegpu.create_nd_tdesc"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<32x2x32xf16>) -> !xegpu.tensor_desc<32x2x32xf16>
      %2 = "xegpu.load_nd"(%1, %0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (!xegpu.tensor_desc<32x2x32xf16>, index, index, index) -> vector<32x2x32xf16>
      %3 = "vector.transpose"(%2) <{permutation = array<i64: 1, 0, 2>}> : (vector<32x2x32xf16>) -> vector<2x32x32xf16>
      %4 = "xegpu.create_nd_tdesc"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<2x32x32xf16>) -> !xegpu.tensor_desc<2x32x32xf16>
      "xegpu.store_nd"(%3, %4, %0, %0, %0) <{const_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, layout = #xegpu.layout<sg_layout = [2, 1, 2], sg_data = [1, 32, 16], order = [1, 2, 0]>}> : (vector<2x32x32xf16>, !xegpu.tensor_desc<2x32x32xf16>, index, index, index) -> ()
      "gpu.return"() : () -> ()
    }) {sym_name = "transpose_3d_order_remap"} : () -> ()
  }) : () -> ()
}) : () -> ()

