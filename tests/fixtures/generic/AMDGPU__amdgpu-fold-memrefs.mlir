"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test_subview_folding"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf16, 3>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128xf16>
    %2 = "memref.subview"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 32, 64>, static_strides = array<i64: 1, 1>}> : (memref<64x128xf16>) -> memref<32x64xf16, strided<[128, 1]>>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    "amdgpu.gather_to_lds"(%2, %arg0, %arg1, %0, %3, %3) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = vector<8xf16>}> : (memref<32x64xf16, strided<[128, 1]>>, index, index, memref<64x64xf16, 3>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "subview_folding_offset"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf16, 3>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128xf16>
    %2 = "memref.subview"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 32, 64>, static_sizes = array<i64: 32, 64>, static_strides = array<i64: 1, 1>}> : (memref<64x128xf16>) -> memref<32x64xf16, strided<[128, 1], offset: 4160>>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    "amdgpu.gather_to_lds"(%2, %arg0, %arg1, %0, %3, %3) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = vector<8xf16>}> : (memref<32x64xf16, strided<[128, 1], offset: 4160>>, index, index, memref<64x64xf16, 3>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test_expand_shape"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4096xf16, 3>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8192xf16>
    %2 = "memref.expand_shape"(%1) <{reassociation = [[0, 1]], static_output_shape = array<i64: 64, 128>}> : (memref<8192xf16>) -> memref<64x128xf16>
    %3 = "memref.expand_shape"(%0) <{reassociation = [[0, 1]], static_output_shape = array<i64: 64, 64>}> : (memref<4096xf16, 3>) -> memref<64x64xf16, 3>
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    "amdgpu.gather_to_lds"(%2, %arg0, %arg1, %3, %4, %4) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = vector<8xf16>}> : (memref<64x128xf16>, index, index, memref<64x64xf16, 3>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test_collapse_shape"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x64xf16, 3>
    %1 = "memref.collapse_shape"(%0) <{reassociation = [[0, 1]]}> : (memref<64x64xf16, 3>) -> memref<4096xf16, 3>
    %2 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<64x128xf16>
    %3 = "memref.collapse_shape"(%2) <{reassociation = [[0, 1]]}> : (memref<64x128xf16>) -> memref<8192xf16>
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    "amdgpu.gather_to_lds"(%3, %arg0, %1, %arg1) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, transferType = vector<8xf16>}> : (memref<8192xf16>, index, memref<4096xf16, 3>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, index, index) -> (), sym_name = "test_expand_shape_src_raw_buffer"}> ({
  ^bb0(%arg0: memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4096xf16, 3>
    %1 = "memref.expand_shape"(%arg0) <{reassociation = [[0, 1]], static_output_shape = array<i64: 64, 128>}> : (memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>) -> memref<64x128xf16, #amdgpu.address_space<fat_raw_buffer>>
    %2 = "arith.constant"() <{value = 0 : index}> : () -> index
    "amdgpu.gather_to_lds"(%1, %arg1, %arg2, %0, %2) <{operandSegmentSizes = array<i32: 1, 2, 1, 1>, transferType = vector<8xf16>}> : (memref<64x128xf16, #amdgpu.address_space<fat_raw_buffer>>, index, index, memref<4096xf16, 3>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "test_expand_shape_dst_only"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4096xf16, 3>
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8192xf16>
    %2 = "memref.expand_shape"(%0) <{reassociation = [[0, 1]], static_output_shape = array<i64: 64, 64>}> : (memref<4096xf16, 3>) -> memref<64x64xf16, 3>
    %3 = "arith.constant"() <{value = 0 : index}> : () -> index
    "amdgpu.gather_to_lds"(%1, %arg0, %2, %arg1, %3) <{operandSegmentSizes = array<i32: 1, 1, 1, 2>, transferType = vector<8xf16>}> : (memref<8192xf16>, index, memref<64x64xf16, 3>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, index, index) -> (), sym_name = "test_nop"}> ({
  ^bb0(%arg0: memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, %arg1: index, %arg2: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4096xf16, 3>
    "amdgpu.gather_to_lds"(%arg0, %arg1, %0, %arg2) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, transferType = vector<8xf16>}> : (memref<8192xf16, #amdgpu.address_space<fat_raw_buffer>>, index, memref<4096xf16, 3>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

