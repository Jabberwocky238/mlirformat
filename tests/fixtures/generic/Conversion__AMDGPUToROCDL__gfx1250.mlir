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
  "func.func"() <{function_type = (index, memref<8xi32, #gpu.address_space<global>>, memref<8xi32, #gpu.address_space<workgroup>>) -> !amdgpu.tdm_base<i32>, sym_name = "make_dma_base"}> ({
  ^bb0(%arg0: index, %arg1: memref<8xi32, #gpu.address_space<global>>, %arg2: memref<8xi32, #gpu.address_space<workgroup>>):
    %0 = "amdgpu.make_dma_base"(%arg1, %arg0, %arg2, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (memref<8xi32, #gpu.address_space<global>>, index, memref<8xi32, #gpu.address_space<workgroup>>, index) -> !amdgpu.tdm_base<i32>
    "func.return"(%0) : (!amdgpu.tdm_base<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, memref<8xi32, #gpu.address_space<global>>, memref<8xi32, #gpu.address_space<workgroup>>) -> (!amdgpu.tdm_gather_base<i32, i16>, !amdgpu.tdm_gather_base<i32, i32>), sym_name = "make_gather_dma_base"}> ({
  ^bb0(%arg0: index, %arg1: memref<8xi32, #gpu.address_space<global>>, %arg2: memref<8xi32, #gpu.address_space<workgroup>>):
    %0 = "amdgpu.make_gather_dma_base"(%arg1, %arg0, %arg2, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (memref<8xi32, #gpu.address_space<global>>, index, memref<8xi32, #gpu.address_space<workgroup>>, index) -> !amdgpu.tdm_gather_base<i32, i16>
    %1 = "amdgpu.make_gather_dma_base"(%arg1, %arg0, %arg2, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (memref<8xi32, #gpu.address_space<global>>, index, memref<8xi32, #gpu.address_space<workgroup>>, index) -> !amdgpu.tdm_gather_base<i32, i32>
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
  "func.func"() <{function_type = (!amdgpu.tdm_base<i32>, memref<2x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, index) -> !amdgpu.tdm_descriptor, sym_name = "make_dma_descriptor_atomic_barrier"}> ({
  ^bb0(%arg0: !amdgpu.tdm_base<i32>, %arg1: memref<2x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg2: index):
    %0 = "amdgpu.make_dma_descriptor"(%arg0, %arg1, %arg2) <{global_static_sizes = array<i64: 128, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0>, shared_static_sizes = array<i64: 128, 64>}> : (!amdgpu.tdm_base<i32>, memref<2x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, index) -> !amdgpu.tdm_descriptor
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
  ^bb0(%arg14: !amdgpu.tdm_base<i32>, %arg15: vector<16xi1>, %arg16: i1):
    %7 = "amdgpu.make_dma_descriptor"(%arg14, %arg15, %arg16) <{global_static_sizes = array<i64: 128, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 128, 64>}> : (!amdgpu.tdm_base<i32>, vector<16xi1>, i1) -> !amdgpu.tdm_descriptor
    "func.return"(%7) : (!amdgpu.tdm_descriptor) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!amdgpu.tdm_descriptor) -> (), sym_name = "tensor_load_to_lds"}> ({
  ^bb0(%arg13: !amdgpu.tdm_descriptor):
    "amdgpu.tensor_load_to_lds"(%arg13) : (!amdgpu.tdm_descriptor) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!amdgpu.tdm_descriptor) -> (), sym_name = "tensor_store_from_lds"}> ({
  ^bb0(%arg12: !amdgpu.tdm_descriptor):
    "amdgpu.tensor_store_from_lds"(%arg12) : (!amdgpu.tdm_descriptor) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!amdgpu.tdm_gather_base<i32, i16>, vector<13xi16>) -> !amdgpu.tdm_descriptor, sym_name = "make_gather_dma_descriptor"}> ({
  ^bb0(%arg10: !amdgpu.tdm_gather_base<i32, i16>, %arg11: vector<13xi16>):
    %6 = "amdgpu.make_gather_dma_descriptor"(%arg10, %arg11) <{global_static_sizes = array<i64: 128, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 128, 64>}> : (!amdgpu.tdm_gather_base<i32, i16>, vector<13xi16>) -> !amdgpu.tdm_descriptor
    "func.return"(%6) : (!amdgpu.tdm_descriptor) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, i32) -> (), sym_name = "ds_barrier_init"}> ({
  ^bb0(%arg8: memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg9: i32):
    "amdgpu.ds_barrier_init"(%arg8, %arg9) : (memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>) -> !amdgpu.ds_barrier_state, sym_name = "ds_barrier_poll_state"}> ({
  ^bb0(%arg7: memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>):
    %5 = "amdgpu.ds_barrier_poll_state"(%arg7) : (memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>) -> !amdgpu.ds_barrier_state
    "func.return"(%5) : (!amdgpu.ds_barrier_state) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>) -> (), sym_name = "ds_async_barrier_arrive"}> ({
  ^bb0(%arg6: memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>):
    "amdgpu.ds_async_barrier_arrive"(%arg6) : (memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, i64) -> !amdgpu.ds_barrier_state, sym_name = "ds_barrier_arrive"}> ({
  ^bb0(%arg4: memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg5: i64):
    %4 = "amdgpu.ds_barrier_arrive"(%arg4, %arg5) : (memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, i64) -> !amdgpu.ds_barrier_state
    "func.return"(%4) : (!amdgpu.ds_barrier_state) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!amdgpu.ds_barrier_state) -> i32, sym_name = "ds_barrier_state_phase"}> ({
  ^bb0(%arg3: !amdgpu.ds_barrier_state):
    %3 = "amdgpu.ds_barrier_state_phase"(%arg3) : (!amdgpu.ds_barrier_state) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!amdgpu.ds_barrier_state) -> i32, sym_name = "ds_barrier_state_pending_count"}> ({
  ^bb0(%arg2: !amdgpu.ds_barrier_state):
    %2 = "amdgpu.ds_barrier_state_pending_count"(%arg2) : (!amdgpu.ds_barrier_state) -> i32
    "func.return"(%2) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!amdgpu.ds_barrier_state) -> i32, sym_name = "ds_barrier_state_init_count"}> ({
  ^bb0(%arg1: !amdgpu.ds_barrier_state):
    %1 = "amdgpu.ds_barrier_state_init_count"(%arg1) : (!amdgpu.ds_barrier_state) -> i32
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!amdgpu.ds_barrier_state) -> i1, sym_name = "ds_barrier_state_phase_parity"}> ({
  ^bb0(%arg0: !amdgpu.ds_barrier_state):
    %0 = "amdgpu.ds_barrier_state_phase_parity"(%arg0) : (!amdgpu.ds_barrier_state) -> i1
    "func.return"(%0) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x72xf32, #gpu.address_space<global>>) -> (), sym_name = "global_load_async_to_lds_b32"}> ({
  ^bb0(%arg0: memref<128x72xf32, #gpu.address_space<global>>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 12 : index}> : () -> index
    %2 = "arith.constant"() <{value = 32 : index}> : () -> index
    %3 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf32, #gpu.address_space<workgroup>>
    "amdgpu.global_load_async_to_lds"(%arg0, %1, %0, %3, %2, %0) <{operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>, transferType = f32}> : (memref<128x72xf32, #gpu.address_space<global>>, index, index, memref<64x64xf32, #gpu.address_space<workgroup>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x72xi8, #gpu.address_space<global>>) -> (), sym_name = "global_load_async_to_lds_b8"}> ({
  ^bb0(%arg0: memref<128x72xi8, #gpu.address_space<global>>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xi8, #gpu.address_space<workgroup>>
    "amdgpu.global_load_async_to_lds"(%arg0, %0, %0, %1, %0, %0) <{operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>, transferType = i8}> : (memref<128x72xi8, #gpu.address_space<global>>, index, index, memref<64x64xi8, #gpu.address_space<workgroup>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x72xf32, #gpu.address_space<global>>) -> (), sym_name = "global_load_async_to_lds_b64"}> ({
  ^bb0(%arg0: memref<128x72xf32, #gpu.address_space<global>>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf32, #gpu.address_space<workgroup>>
    "amdgpu.global_load_async_to_lds"(%arg0, %0, %0, %1, %0, %0) <{operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>, transferType = vector<2xf32>}> : (memref<128x72xf32, #gpu.address_space<global>>, index, index, memref<64x64xf32, #gpu.address_space<workgroup>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x72xf32, #gpu.address_space<global>>) -> (), sym_name = "global_load_async_to_lds_b128"}> ({
  ^bb0(%arg0: memref<128x72xf32, #gpu.address_space<global>>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf32, #gpu.address_space<workgroup>>
    "amdgpu.global_load_async_to_lds"(%arg0, %0, %0, %1, %0, %0) <{operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>, transferType = vector<4xf32>}> : (memref<128x72xf32, #gpu.address_space<global>>, index, index, memref<64x64xf32, #gpu.address_space<workgroup>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<512xi32, #gpu.address_space<global>>, index, index) -> (), sym_name = "global_load_async_to_lds_dynamic_indices"}> ({
  ^bb0(%arg0: memref<512xi32, #gpu.address_space<global>>, %arg1: index, %arg2: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256xi32, #gpu.address_space<workgroup>>
    "amdgpu.global_load_async_to_lds"(%arg0, %arg1, %0, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, transferType = i32}> : (memref<512xi32, #gpu.address_space<global>>, index, memref<256xi32, #gpu.address_space<workgroup>>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<128x72xf32, #gpu.address_space<global>>, i1) -> (), sym_name = "global_load_async_to_lds_b128_masked"}> ({
  ^bb0(%arg0: memref<128x72xf32, #gpu.address_space<global>>, %arg1: i1):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf32, #gpu.address_space<workgroup>>
    "amdgpu.global_load_async_to_lds"(%arg0, %0, %0, %1, %0, %0, %arg1) <{operandSegmentSizes = array<i32: 1, 2, 1, 2, 1>, transferType = vector<4xf32>}> : (memref<128x72xf32, #gpu.address_space<global>>, index, index, memref<64x64xf32, #gpu.address_space<workgroup>>, index, index, i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

