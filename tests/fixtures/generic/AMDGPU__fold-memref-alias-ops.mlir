"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test_subview_folding"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf16, #gpu.address_space<workgroup>>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128xf16>
    %2 = "memref.subview"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 32, 64>, static_strides = array<i64: 1, 1>}> : (memref<64x128xf16>) -> memref<32x64xf16, strided<[128, 1]>>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    "amdgpu.gather_to_lds"(%2, %arg0, %arg1, %0, %3, %3) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = vector<8xf16>}> : (memref<32x64xf16, strided<[128, 1]>>, index, index, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "subview_folding_offset"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf16, #gpu.address_space<workgroup>>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128xf16>
    %2 = "memref.subview"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 32, 64>, static_sizes = array<i64: 32, 64>, static_strides = array<i64: 1, 1>}> : (memref<64x128xf16>) -> memref<32x64xf16, strided<[128, 1], offset: 4160>>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    "amdgpu.gather_to_lds"(%2, %arg0, %arg1, %0, %3, %3) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = vector<8xf16>}> : (memref<32x64xf16, strided<[128, 1], offset: 4160>>, index, index, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test_expand_shape"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4096xf16, #gpu.address_space<workgroup>>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8192xf16>
    %2 = "memref.expand_shape"(%1) <{reassociation = [[0, 1]], static_output_shape = array<i64: 64, 128>}> : (memref<8192xf16>) -> memref<64x128xf16>
    %3 = "memref.expand_shape"(%0) <{reassociation = [[0, 1]], static_output_shape = array<i64: 64, 64>}> : (memref<4096xf16, #gpu.address_space<workgroup>>) -> memref<64x64xf16, #gpu.address_space<workgroup>>
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    "amdgpu.gather_to_lds"(%2, %arg0, %arg1, %3, %4, %4) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = vector<8xf16>}> : (memref<64x128xf16>, index, index, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test_collapse_shape"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf16, #gpu.address_space<workgroup>>
    %1 = "memref.collapse_shape"(%0) <{reassociation = [[0, 1]]}> : (memref<64x64xf16, #gpu.address_space<workgroup>>) -> memref<4096xf16, #gpu.address_space<workgroup>>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128xf16>
    %3 = "memref.collapse_shape"(%2) <{reassociation = [[0, 1]]}> : (memref<64x128xf16>) -> memref<8192xf16>
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    "amdgpu.gather_to_lds"(%3, %arg0, %1, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, transferType = vector<8xf16>}> : (memref<8192xf16>, index, memref<4096xf16, #gpu.address_space<workgroup>>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, index, index) -> (), sym_name = "test_expand_shape_src_raw_buffer"}> ({
  ^bb0(%arg0: memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4096xf16, #gpu.address_space<workgroup>>
    %1 = "memref.expand_shape"(%arg0) <{reassociation = [[0, 1]], static_output_shape = array<i64: 64, 128>}> : (memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>) -> memref<64x128xf16, #amdgpu.address_space<fat_raw_buffer>>
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    "amdgpu.gather_to_lds"(%1, %arg1, %arg2, %0, %2) <{operandSegmentSizes = array<i32: 1, 2, 1, 1>, transferType = vector<8xf16>}> : (memref<64x128xf16, #amdgpu.address_space<fat_raw_buffer>>, index, index, memref<4096xf16, #gpu.address_space<workgroup>>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x128xf16, #amdgpu.address_space<fat_raw_buffer>>, index) -> (), sym_name = "test_src_raw_buffer_collapse_shape"}> ({
  ^bb0(%arg0: memref<64x128xf16, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4096xf16, #gpu.address_space<workgroup>>
    %1 = "memref.collapse_shape"(%arg0) <{reassociation = [[0, 1]]}> : (memref<64x128xf16, #amdgpu.address_space<fat_raw_buffer>>) -> memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    "amdgpu.gather_to_lds"(%1, %arg1, %0, %2) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, transferType = vector<8xf16>}> : (memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, index, memref<4096xf16, #gpu.address_space<workgroup>>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test_expand_shape_dst_only"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4096xf16, #gpu.address_space<workgroup>>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8192xf16>
    %2 = "memref.expand_shape"(%0) <{reassociation = [[0, 1]], static_output_shape = array<i64: 64, 64>}> : (memref<4096xf16, #gpu.address_space<workgroup>>) -> memref<64x64xf16, #gpu.address_space<workgroup>>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    "amdgpu.gather_to_lds"(%1, %arg0, %2, %arg1, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 2>, transferType = vector<8xf16>}> : (memref<8192xf16>, index, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, index, index) -> (), sym_name = "test_nop"}> ({
  ^bb0(%arg0: memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4096xf16, #gpu.address_space<workgroup>>
    "amdgpu.gather_to_lds"(%arg0, %arg1, %0, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, transferType = vector<8xf16>}> : (memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, index, memref<4096xf16, #gpu.address_space<workgroup>>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test_async_flag_preserved"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf16, #gpu.address_space<workgroup>>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128xf16>
    %2 = "memref.subview"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 32, 64>, static_strides = array<i64: 1, 1>}> : (memref<64x128xf16>) -> memref<32x64xf16, strided<[128, 1]>>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    "amdgpu.gather_to_lds"(%2, %arg0, %arg1, %0, %3, %3) <{async, operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = vector<8xf16>}> : (memref<32x64xf16, strided<[128, 1]>>, index, index, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<4xf16>, sym_name = "test_transpose_load_subview"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128xf16, #gpu.address_space<workgroup>>
    %1 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 32, 64>, static_strides = array<i64: 1, 1>}> : (memref<64x128xf16, #gpu.address_space<workgroup>>) -> memref<32x64xf16, strided<[128, 1]>, #gpu.address_space<workgroup>>
    %2 = "amdgpu.transpose_load"(%1, %arg0, %arg1) : (memref<32x64xf16, strided<[128, 1]>, #gpu.address_space<workgroup>>, index, index) -> vector<4xf16>
    "func.return"(%2) : (vector<4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<4xf16>, sym_name = "test_transpose_load_subview_offset"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128xf16, #gpu.address_space<workgroup>>
    %1 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 32, 64>, static_sizes = array<i64: 32, 64>, static_strides = array<i64: 1, 1>}> : (memref<64x128xf16, #gpu.address_space<workgroup>>) -> memref<32x64xf16, strided<[128, 1], offset: 4160>, #gpu.address_space<workgroup>>
    %2 = "amdgpu.transpose_load"(%1, %arg0, %arg1) : (memref<32x64xf16, strided<[128, 1], offset: 4160>, #gpu.address_space<workgroup>>, index, index) -> vector<4xf16>
    "func.return"(%2) : (vector<4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<4xf16>, sym_name = "test_transpose_load_expand_shape"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4096xf16, #gpu.address_space<workgroup>>
    %1 = "memref.expand_shape"(%0) <{reassociation = [[0, 1]], static_output_shape = array<i64: 32, 128>}> : (memref<4096xf16, #gpu.address_space<workgroup>>) -> memref<32x128xf16, #gpu.address_space<workgroup>>
    %2 = "amdgpu.transpose_load"(%1, %arg0, %arg1) : (memref<32x128xf16, #gpu.address_space<workgroup>>, index, index) -> vector<4xf16>
    "func.return"(%2) : (vector<4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> vector<4xf16>, sym_name = "test_transpose_load_collapse_shape"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x128xf16, #gpu.address_space<workgroup>>
    %1 = "memref.collapse_shape"(%0) <{reassociation = [[0, 1]]}> : (memref<32x128xf16, #gpu.address_space<workgroup>>) -> memref<4096xf16, #gpu.address_space<workgroup>>
    %2 = "amdgpu.transpose_load"(%1, %arg0) : (memref<4096xf16, #gpu.address_space<workgroup>>, index) -> vector<4xf16>
    "func.return"(%2) : (vector<4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> vector<4xf16>, sym_name = "test_transpose_load_nop"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x128xf16, #gpu.address_space<workgroup>>
    %1 = "amdgpu.transpose_load"(%0, %arg0, %arg1) : (memref<32x128xf16, #gpu.address_space<workgroup>>, index, index) -> vector<4xf16>
    "func.return"(%1) : (vector<4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x128xf16, #gpu.address_space<global>>, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index, index, index) -> !amdgpu.tdm_base<f16>, sym_name = "test_make_dma_base_subview"}> ({
  ^bb0(%arg0: memref<64x128xf16, #gpu.address_space<global>>, %arg1: memref<64x64xf16, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 32, 64>, static_strides = array<i64: 1, 1>}> : (memref<64x128xf16, #gpu.address_space<global>>) -> memref<32x64xf16, strided<[128, 1]>, #gpu.address_space<global>>
    %1 = "amdgpu.make_dma_base"(%0, %arg2, %arg3, %arg1, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>}> : (memref<32x64xf16, strided<[128, 1]>, #gpu.address_space<global>>, index, index, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index) -> !amdgpu.tdm_base<f16>
    "func.return"(%1) : (!amdgpu.tdm_base<f16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x128xf16, #gpu.address_space<global>>, memref<4096xf16, #gpu.address_space<workgroup>>, index, index, index, index) -> !amdgpu.tdm_base<f16>, sym_name = "test_make_dma_base_expand_shape"}> ({
  ^bb0(%arg0: memref<64x128xf16, #gpu.address_space<global>>, %arg1: memref<4096xf16, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "memref.expand_shape"(%arg1) <{reassociation = [[0, 1]], static_output_shape = array<i64: 64, 64>}> : (memref<4096xf16, #gpu.address_space<workgroup>>) -> memref<64x64xf16, #gpu.address_space<workgroup>>
    %1 = "amdgpu.make_dma_base"(%arg0, %arg2, %arg3, %0, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>}> : (memref<64x128xf16, #gpu.address_space<global>>, index, index, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index) -> !amdgpu.tdm_base<f16>
    "func.return"(%1) : (!amdgpu.tdm_base<f16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x128xf16, #gpu.address_space<global>>, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index, index, index) -> !amdgpu.tdm_gather_base<f16, i16>, sym_name = "test_make_gather_dma_base_subview"}> ({
  ^bb0(%arg0: memref<64x128xf16, #gpu.address_space<global>>, %arg1: memref<64x64xf16, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 32, 64>, static_strides = array<i64: 1, 1>}> : (memref<64x128xf16, #gpu.address_space<global>>) -> memref<32x64xf16, strided<[128, 1]>, #gpu.address_space<global>>
    %1 = "amdgpu.make_gather_dma_base"(%0, %arg2, %arg3, %arg1, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>}> : (memref<32x64xf16, strided<[128, 1]>, #gpu.address_space<global>>, index, index, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index) -> !amdgpu.tdm_gather_base<f16, i16>
    "func.return"(%1) : (!amdgpu.tdm_gather_base<f16, i16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x128xf16, #gpu.address_space<global>>, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index, index) -> !amdgpu.tdm_gather_base<f16, i16>, sym_name = "test_make_gather_dma_base_collapse_shape"}> ({
  ^bb0(%arg0: memref<64x128xf16, #gpu.address_space<global>>, %arg1: memref<64x64xf16, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index):
    %0 = "memref.collapse_shape"(%arg1) <{reassociation = [[0, 1]]}> : (memref<64x64xf16, #gpu.address_space<workgroup>>) -> memref<4096xf16, #gpu.address_space<workgroup>>
    %1 = "amdgpu.make_gather_dma_base"(%arg0, %arg2, %arg3, %0, %arg4) <{operandSegmentSizes = array<i32: 1, 2, 1, 1>}> : (memref<64x128xf16, #gpu.address_space<global>>, index, index, memref<4096xf16, #gpu.address_space<workgroup>>, index) -> !amdgpu.tdm_gather_base<f16, i16>
    "func.return"(%1) : (!amdgpu.tdm_gather_base<f16, i16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x128xf16, #gpu.address_space<global>>, memref<4096xf16, #gpu.address_space<workgroup>>, index, index, index, index) -> !amdgpu.tdm_base<f16>, sym_name = "test_make_dma_base_both_fold"}> ({
  ^bb0(%arg0: memref<64x128xf16, #gpu.address_space<global>>, %arg1: memref<4096xf16, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 32, 64>, static_sizes = array<i64: 32, 64>, static_strides = array<i64: 1, 1>}> : (memref<64x128xf16, #gpu.address_space<global>>) -> memref<32x64xf16, strided<[128, 1], offset: 4160>, #gpu.address_space<global>>
    %1 = "memref.expand_shape"(%arg1) <{reassociation = [[0, 1]], static_output_shape = array<i64: 64, 64>}> : (memref<4096xf16, #gpu.address_space<workgroup>>) -> memref<64x64xf16, #gpu.address_space<workgroup>>
    %2 = "amdgpu.make_dma_base"(%0, %arg2, %arg3, %1, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>}> : (memref<32x64xf16, strided<[128, 1], offset: 4160>, #gpu.address_space<global>>, index, index, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index) -> !amdgpu.tdm_base<f16>
    "func.return"(%2) : (!amdgpu.tdm_base<f16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x128xf16, #gpu.address_space<global>>, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index, index, index) -> !amdgpu.tdm_base<f16>, sym_name = "test_make_dma_base_nop"}> ({
  ^bb0(%arg0: memref<64x128xf16, #gpu.address_space<global>>, %arg1: memref<64x64xf16, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "amdgpu.make_dma_base"(%arg0, %arg2, %arg3, %arg1, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>}> : (memref<64x128xf16, #gpu.address_space<global>>, index, index, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index) -> !amdgpu.tdm_base<f16>
    "func.return"(%0) : (!amdgpu.tdm_base<f16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x128xf16, #gpu.address_space<global>>, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index, index, index) -> !amdgpu.tdm_gather_base<f16, i16>, sym_name = "test_make_gather_dma_base_nop"}> ({
  ^bb0(%arg0: memref<64x128xf16, #gpu.address_space<global>>, %arg1: memref<64x64xf16, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "amdgpu.make_gather_dma_base"(%arg0, %arg2, %arg3, %arg1, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>}> : (memref<64x128xf16, #gpu.address_space<global>>, index, index, memref<64x64xf16, #gpu.address_space<workgroup>>, index, index) -> !amdgpu.tdm_gather_base<f16, i16>
    "func.return"(%0) : (!amdgpu.tdm_gather_base<f16, i16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<64x128xf32, #gpu.address_space<global>>, memref<4096xf32, #gpu.address_space<workgroup>>, index, index, index, index, i1) -> (), sym_name = "test_global_load_async_to_lds_both_fold_masked"}> ({
  ^bb0(%arg0: memref<64x128xf32, #gpu.address_space<global>>, %arg1: memref<4096xf32, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: i1):
    %0 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 32, 64>, static_sizes = array<i64: 32, 64>, static_strides = array<i64: 1, 1>}> : (memref<64x128xf32, #gpu.address_space<global>>) -> memref<32x64xf32, strided<[128, 1], offset: 4160>, #gpu.address_space<global>>
    %1 = "memref.expand_shape"(%arg1) <{reassociation = [[0, 1]], static_output_shape = array<i64: 64, 64>}> : (memref<4096xf32, #gpu.address_space<workgroup>>) -> memref<64x64xf32, #gpu.address_space<workgroup>>
    "amdgpu.global_load_async_to_lds"(%0, %arg2, %arg3, %1, %arg4, %arg5, %arg6) <{operandSegmentSizes = array<i32: 1, 2, 1, 2, 1>, transferType = vector<4xf32>}> : (memref<32x64xf32, strided<[128, 1], offset: 4160>, #gpu.address_space<global>>, index, index, memref<64x64xf32, #gpu.address_space<workgroup>>, index, index, i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8192xi32, #gpu.address_space<global>>, memref<64x64xi32, #gpu.address_space<workgroup>>, index, index) -> (), sym_name = "test_global_load_async_to_lds_no_mask_dst_collapse"}> ({
  ^bb0(%arg0: memref<8192xi32, #gpu.address_space<global>>, %arg1: memref<64x64xi32, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index):
    %0 = "memref.collapse_shape"(%arg1) <{reassociation = [[0, 1]]}> : (memref<64x64xi32, #gpu.address_space<workgroup>>) -> memref<4096xi32, #gpu.address_space<workgroup>>
    "amdgpu.global_load_async_to_lds"(%arg0, %arg2, %0, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>, transferType = i32}> : (memref<8192xi32, #gpu.address_space<global>>, index, memref<4096xi32, #gpu.address_space<workgroup>>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8192xi32, #gpu.address_space<global>>, memref<64x64xi32, #gpu.address_space<workgroup>>, index, index, i1) -> (), sym_name = "test_global_load_async_to_lds_masked_dst_collapse"}> ({
  ^bb0(%arg0: memref<8192xi32, #gpu.address_space<global>>, %arg1: memref<64x64xi32, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index, %arg4: i1):
    %0 = "memref.collapse_shape"(%arg1) <{reassociation = [[0, 1]]}> : (memref<64x64xi32, #gpu.address_space<workgroup>>) -> memref<4096xi32, #gpu.address_space<workgroup>>
    "amdgpu.global_load_async_to_lds"(%arg0, %arg2, %0, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, transferType = i32}> : (memref<8192xi32, #gpu.address_space<global>>, index, memref<4096xi32, #gpu.address_space<workgroup>>, index, i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8192xf16, #gpu.address_space<global>>, index, index) -> vector<8xf16>, sym_name = "test_global_transpose_load_expand_shape"}> ({
  ^bb0(%arg0: memref<8192xf16, #gpu.address_space<global>>, %arg1: index, %arg2: index):
    %0 = "memref.expand_shape"(%arg0) <{reassociation = [[0, 1]], static_output_shape = array<i64: 64, 128>}> : (memref<8192xf16, #gpu.address_space<global>>) -> memref<64x128xf16, #gpu.address_space<global>>
    %1 = "amdgpu.global_transpose_load"(%0, %arg1, %arg2) : (memref<64x128xf16, #gpu.address_space<global>>, index, index) -> vector<8xf16>
    "func.return"(%1) : (vector<8xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<16x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, index, index, i32, i64) -> !amdgpu.ds_barrier_state, sym_name = "test_ds_barrier_ops_expand_shape"}> ({
  ^bb0(%arg0: memref<16x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg1: index, %arg2: index, %arg3: i32, %arg4: i64):
    %0 = "memref.expand_shape"(%arg0) <{reassociation = [[0, 1]], static_output_shape = array<i64: 4, 4>}> : (memref<16x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>) -> memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>
    "amdgpu.ds_barrier_init"(%0, %arg1, %arg2, %arg3) : (memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, index, index, i32) -> ()
    %1 = "amdgpu.ds_barrier_poll_state"(%0, %arg1, %arg2) : (memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, index, index) -> !amdgpu.ds_barrier_state
    "amdgpu.ds_async_barrier_arrive"(%0, %arg1, %arg2) : (memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, index, index) -> ()
    %2 = "amdgpu.ds_barrier_arrive"(%0, %arg1, %arg2, %arg4) : (memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, index, index, i64) -> !amdgpu.ds_barrier_state
    "func.return"(%2) : (!amdgpu.ds_barrier_state) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!amdgpu.tdm_base<i32>, memref<16x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, index, index) -> !amdgpu.tdm_descriptor, sym_name = "test_make_dma_descriptor_atomic_barrier_expand_shape"}> ({
  ^bb0(%arg0: !amdgpu.tdm_base<i32>, %arg1: memref<16x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg2: index, %arg3: index):
    %0 = "memref.expand_shape"(%arg1) <{reassociation = [[0, 1]], static_output_shape = array<i64: 4, 4>}> : (memref<16x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>) -> memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>
    %1 = "amdgpu.make_dma_descriptor"(%arg0, %0, %arg2, %arg3) <{global_static_sizes = array<i64: 64, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0>, shared_static_sizes = array<i64: 64, 64>}> : (!amdgpu.tdm_base<i32>, memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, index, index) -> !amdgpu.tdm_descriptor
    "func.return"(%1) : (!amdgpu.tdm_descriptor) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!amdgpu.tdm_gather_base<i32, i32>, vector<8xi32>, memref<16x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, index, index) -> !amdgpu.tdm_descriptor, sym_name = "test_make_gather_dma_descriptor_atomic_barrier_expand_shape"}> ({
  ^bb0(%arg0: !amdgpu.tdm_gather_base<i32, i32>, %arg1: vector<8xi32>, %arg2: memref<16x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg3: index, %arg4: index):
    %0 = "memref.expand_shape"(%arg2) <{reassociation = [[0, 1]], static_output_shape = array<i64: 4, 4>}> : (memref<16x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>) -> memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>
    %1 = "amdgpu.make_gather_dma_descriptor"(%arg0, %arg1, %0, %arg3, %arg4) <{global_static_sizes = array<i64: 64, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 2, 0, 0, 0>, shared_static_sizes = array<i64: 64, 64>}> : (!amdgpu.tdm_gather_base<i32, i32>, vector<8xi32>, memref<4x4x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, index, index) -> !amdgpu.tdm_descriptor
    "func.return"(%1) : (!amdgpu.tdm_descriptor) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!amdgpu.tdm_base<i32>) -> !amdgpu.tdm_descriptor, sym_name = "test_make_dma_descriptor_no_atomic_barrier"}> ({
  ^bb0(%arg0: !amdgpu.tdm_base<i32>):
    %0 = "amdgpu.make_dma_descriptor"(%arg0) <{global_static_sizes = array<i64: 64, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 64, 64>}> : (!amdgpu.tdm_base<i32>) -> !amdgpu.tdm_descriptor
    "func.return"(%0) : (!amdgpu.tdm_descriptor) -> ()
  }) : () -> ()
}) : () -> ()

