"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>), sym_name = "scaled_ext_packed_matrix_fp4"}> ({
  ^bb0(%arg8: vector<8xf4E2M1FN>, %arg9: vector<4xf8E8M0FNU>):
    %12 = "amdgpu.scaled_ext_packed_matrix"(%arg8, %arg9) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<8xf16>
    %13 = "amdgpu.scaled_ext_packed_matrix"(%arg8, %arg9) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<8xbf16>
    %14 = "amdgpu.scaled_ext_packed_matrix"(%arg8, %arg9) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    "func.return"(%12, %13, %14) : (vector<8xf16>, vector<8xbf16>, vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>), sym_name = "scaled_ext_packed_matrix_fp8"}> ({
  ^bb0(%arg6: vector<8xf8E4M3FN>, %arg7: vector<4xf8E8M0FNU>):
    %9 = "amdgpu.scaled_ext_packed_matrix"(%arg6, %arg7) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> vector<8xf16>
    %10 = "amdgpu.scaled_ext_packed_matrix"(%arg6, %arg7) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> vector<8xbf16>
    %11 = "amdgpu.scaled_ext_packed_matrix"(%arg6, %arg7) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    "func.return"(%9, %10, %11) : (vector<8xf16>, vector<8xbf16>, vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>), sym_name = "scaled_ext_packed_matrix_bf8"}> ({
  ^bb0(%arg4: vector<8xf8E5M2>, %arg5: vector<4xf8E8M0FNU>):
    %6 = "amdgpu.scaled_ext_packed_matrix"(%arg4, %arg5) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> vector<8xf16>
    %7 = "amdgpu.scaled_ext_packed_matrix"(%arg4, %arg5) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> vector<8xbf16>
    %8 = "amdgpu.scaled_ext_packed_matrix"(%arg4, %arg5) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    "func.return"(%6, %7, %8) : (vector<8xf16>, vector<8xbf16>, vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> (vector<16xf16>, vector<16xbf16>, vector<16xf32>), sym_name = "scaled_ext_packed_matrix_fp6"}> ({
  ^bb0(%arg2: vector<16xf6E2M3FN>, %arg3: vector<4xf8E8M0FNU>):
    %3 = "amdgpu.scaled_ext_packed_matrix"(%arg2, %arg3) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> vector<16xf16>
    %4 = "amdgpu.scaled_ext_packed_matrix"(%arg2, %arg3) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> vector<16xbf16>
    %5 = "amdgpu.scaled_ext_packed_matrix"(%arg2, %arg3) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> vector<16xf32>
    "func.return"(%3, %4, %5) : (vector<16xf16>, vector<16xbf16>, vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> (vector<16xf16>, vector<16xbf16>, vector<16xf32>), sym_name = "scaled_ext_packed_matrix_bf6"}> ({
  ^bb0(%arg0: vector<16xf6E3M2FN>, %arg1: vector<4xf8E8M0FNU>):
    %0 = "amdgpu.scaled_ext_packed_matrix"(%arg0, %arg1) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> vector<16xf16>
    %1 = "amdgpu.scaled_ext_packed_matrix"(%arg0, %arg1) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> vector<16xbf16>
    %2 = "amdgpu.scaled_ext_packed_matrix"(%arg0, %arg1) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> vector<16xf32>
    "func.return"(%0, %1, %2) : (vector<16xf16>, vector<16xbf16>, vector<16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<8xi32, 1>, memref<8xi32, 3>) -> !amdgpu.tdm_base<i32>, sym_name = "make_dma_base"}> ({
  ^bb0(%arg0: index, %arg1: memref<8xi32, 1>, %arg2: memref<8xi32, 3>):
    %0 = "amdgpu.make_dma_base"(%arg1, %arg0, %arg2, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (memref<8xi32, 1>, index, memref<8xi32, 3>, index) -> !amdgpu.tdm_base<i32>
    "func.return"(%0) : (!amdgpu.tdm_base<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<8xi32, 1>, memref<8xi32, 3>) -> (!amdgpu.tdm_gather_base<i32, i16>, !amdgpu.tdm_gather_base<i32, i32>), sym_name = "make_gather_dma_base"}> ({
  ^bb0(%arg0: index, %arg1: memref<8xi32, 1>, %arg2: memref<8xi32, 3>):
    %0 = "amdgpu.make_gather_dma_base"(%arg1, %arg0, %arg2, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (memref<8xi32, 1>, index, memref<8xi32, 3>, index) -> !amdgpu.tdm_gather_base<i32, i16>
    %1 = "amdgpu.make_gather_dma_base"(%arg1, %arg0, %arg2, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (memref<8xi32, 1>, index, memref<8xi32, 3>, index) -> !amdgpu.tdm_gather_base<i32, i32>
    "func.return"(%0, %1) : (!amdgpu.tdm_gather_base<i32, i16>, !amdgpu.tdm_gather_base<i32, i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!amdgpu.tdm_base<i32>) -> !amdgpu.tdm_descriptor, sym_name = "make_dma_descriptor"}> ({
  ^bb0(%arg0: !amdgpu.tdm_base<i32>):
    %0 = "amdgpu.make_dma_descriptor"(%arg0) <{global_static_sizes = array<i64: 128, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 128, 64>}> : (!amdgpu.tdm_base<i32>) -> !amdgpu.tdm_descriptor
    "func.return"(%0) : (!amdgpu.tdm_descriptor) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!amdgpu.tdm_base<i32>, memref<8xi32, 3>, index) -> !amdgpu.tdm_descriptor, sym_name = "make_dma_descriptor_atomic_barrier"}> ({
  ^bb0(%arg0: !amdgpu.tdm_base<i32>, %arg1: memref<8xi32, 3>, %arg2: index):
    %0 = "amdgpu.make_dma_descriptor"(%arg0, %arg1, %arg2) <{global_static_sizes = array<i64: 128, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0>, shared_static_sizes = array<i64: 128, 64>}> : (!amdgpu.tdm_base<i32>, memref<8xi32, 3>, index) -> !amdgpu.tdm_descriptor
    "func.return"(%0) : (!amdgpu.tdm_descriptor) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!amdgpu.tdm_base<i32>, index, i32) -> !amdgpu.tdm_descriptor, sym_name = "make_dma_descriptor_iterate"}> ({
  ^bb0(%arg0: !amdgpu.tdm_base<i32>, %arg1: index, %arg2: i32):
    %0 = "amdgpu.make_dma_descriptor"(%arg0, %arg1, %arg2, %arg1) <{global_static_sizes = array<i64: 128, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1>, shared_static_sizes = array<i64: 128, 64>}> : (!amdgpu.tdm_base<i32>, index, i32, index) -> !amdgpu.tdm_descriptor
    "func.return"(%0) : (!amdgpu.tdm_descriptor) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!amdgpu.tdm_base<i32>, i32, i32) -> !amdgpu.tdm_descriptor, sym_name = "make_dma_descriptor_pad_enable"}> ({
  ^bb0(%arg0: !amdgpu.tdm_base<i32>, %arg1: i32, %arg2: i32):
    %0 = "amdgpu.make_dma_descriptor"(%arg0, %arg1, %arg2) <{global_static_sizes = array<i64: 128, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 128, 64>}> : (!amdgpu.tdm_base<i32>, i32, i32) -> !amdgpu.tdm_descriptor
    "func.return"(%0) : (!amdgpu.tdm_descriptor) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!amdgpu.tdm_base<i32>, index, index, index, index, index) -> !amdgpu.tdm_descriptor, sym_name = "make_dma_descriptor_dynamic"}> ({
  ^bb0(%arg0: !amdgpu.tdm_base<i32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "amdgpu.make_dma_descriptor"(%arg0, %arg2, %arg1, %arg3, %arg5, %arg4) <{global_static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, global_static_strides = array<i64: -9223372036854775808, 1>, operandSegmentSizes = array<i32: 1, 2, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: -9223372036854775808, -9223372036854775808>}> : (!amdgpu.tdm_base<i32>, index, index, index, index, index) -> !amdgpu.tdm_descriptor
    "func.return"(%0) : (!amdgpu.tdm_descriptor) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!amdgpu.tdm_base<i32>) -> !amdgpu.tdm_descriptor, sym_name = "make_dma_descriptor"}> ({
  ^bb0(%arg0: !amdgpu.tdm_base<i32>):
    %0 = "amdgpu.make_dma_descriptor"(%arg0) <{global_static_sizes = array<i64: 64, 64, 64, 128, 64>, global_static_strides = array<i64: 64, 64, 64, 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 64, 64, 64, 128, 64>}> : (!amdgpu.tdm_base<i32>) -> !amdgpu.tdm_descriptor
    "func.return"(%0) : (!amdgpu.tdm_descriptor) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!amdgpu.tdm_base<i32>, vector<16xi1>, i1) -> !amdgpu.tdm_descriptor, sym_name = "make_dma_descriptor_workgroup_mask"}> ({
  ^bb0(%arg2: !amdgpu.tdm_base<i32>, %arg3: vector<16xi1>, %arg4: i1):
    %0 = "amdgpu.make_dma_descriptor"(%arg2, %arg3, %arg4) <{global_static_sizes = array<i64: 128, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 128, 64>}> : (!amdgpu.tdm_base<i32>, vector<16xi1>, i1) -> !amdgpu.tdm_descriptor
    "func.return"(%0) : (!amdgpu.tdm_descriptor) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!amdgpu.tdm_descriptor) -> (), sym_name = "tensor_load_to_lds"}> ({
  ^bb0(%arg1: !amdgpu.tdm_descriptor):
    "amdgpu.tensor_load_to_lds"(%arg1) : (!amdgpu.tdm_descriptor) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!amdgpu.tdm_descriptor) -> (), sym_name = "tensor_store_from_lds"}> ({
  ^bb0(%arg0: !amdgpu.tdm_descriptor):
    "amdgpu.tensor_store_from_lds"(%arg0) : (!amdgpu.tdm_descriptor) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!amdgpu.tdm_gather_base<i32, i16>, vector<13xi16>) -> !amdgpu.tdm_descriptor, sym_name = "make_gather_dma_descriptor"}> ({
  ^bb0(%arg0: !amdgpu.tdm_gather_base<i32, i16>, %arg1: vector<13xi16>):
    %0 = "amdgpu.make_gather_dma_descriptor"(%arg0, %arg1) <{global_static_sizes = array<i64: 128, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 128, 64>}> : (!amdgpu.tdm_gather_base<i32, i16>, vector<13xi16>) -> !amdgpu.tdm_descriptor
    "func.return"(%0) : (!amdgpu.tdm_descriptor) -> ()
  }) : () -> ()
}) : () -> ()

