module {
  llvm.func @blockload2d(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32) -> vector<8xi16> {
    %0 = xevm.blockload2d %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 <{elem_size_in_bits = 16 : i32, pack_register = false, tile_height = 8 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi16>
    llvm.return %0 : vector<8xi16>
  }
}

// -----
module {
  llvm.func @blockload2d_cache_control(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32) -> vector<8xi16> {
    %0 = xevm.blockload2d %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 <{cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>, elem_size_in_bits = 16 : i32, pack_register = false, tile_height = 8 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi16>
    llvm.return %0 : vector<8xi16>
  }
}

// -----
module {
  llvm.func @blockload2d_v_blocks(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32) -> vector<16xi16> {
    %0 = xevm.blockload2d %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 <{elem_size_in_bits = 16 : i32, pack_register = false, tile_height = 8 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 2 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<16xi16>
    llvm.return %0 : vector<16xi16>
  }
}

// -----
module {
  llvm.func @blockload2d_pack_register(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32) -> vector<8xi32> {
    %0 = xevm.blockload2d %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 <{elem_size_in_bits = 16 : i32, pack_register = true, tile_height = 16 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi32>
    llvm.return %0 : vector<8xi32>
  }
}

// -----
module {
  llvm.func @blockload2d_transpose(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32) -> vector<8xi32> {
    %0 = xevm.blockload2d %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 <{elem_size_in_bits = 32 : i32, pack_register = false, tile_height = 16 : i32, tile_width = 8 : i32, transpose = true, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi32>
    llvm.return %0 : vector<8xi32>
  }
}

// -----
module {
  llvm.func @blockstore2d(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: vector<8xi32>) {
    xevm.blockstore2d %arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6 <{elem_size_in_bits = 32 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xi32>)
    llvm.return
  }
}

// -----
module {
  llvm.func @blockstore2d_cache_control(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: vector<8xi32>) {
    xevm.blockstore2d %arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6 <{cache_control = #xevm.store_cache_control<L1wt_L2uc_L3wb>, elem_size_in_bits = 32 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xi32>)
    llvm.return
  }
}

// -----
module {
  llvm.func @blockprefetch2d(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32) {
    xevm.blockprefetch2d %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 <{cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>, elem_size_in_bits = 8 : i32, tile_height = 8 : i32, tile_width = 32 : i32, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32)
    llvm.return
  }
}

// -----
module {
  llvm.func @mma(%arg0: vector<8xf32>, %arg1: vector<8xi16>, %arg2: vector<8xi32>) -> vector<8xf32> {
    %0 = xevm.mma %arg1, %arg2, %arg0 {shape = <m = 8, n = 16, k = 16>, types = <d = f32, a = f16, b = f16, c = f32>} : (vector<8xi16>, vector<8xi32>, vector<8xf32>) -> vector<8xf32>
    llvm.return %0 : vector<8xf32>
  }
}

// -----
module {
  llvm.func @memfence() {
    xevm.memfence <{addrspace = #xevm.addr_space<global>, scope = #xevm.mem_scope<workgroup>}>
    llvm.return
  }
}

// -----
module {
  llvm.func @prefetch(%arg0: !llvm.ptr<1>) {
    xevm.prefetch %arg0 <{cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>}> : (!llvm.ptr<1>)
    llvm.return
  }
}

// -----
module {
  llvm.func @llvm.load(%arg0: !llvm.ptr<1>) -> i32 {
    %0 = llvm.load %arg0 {cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>} : !llvm.ptr<1> -> i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @llvm.store(%arg0: !llvm.ptr<1>, %arg1: i32) {
    llvm.store %arg1, %arg0 {cache_control = #xevm.store_cache_control<L1wt_L2uc_L3wb>} : i32, !llvm.ptr<1>
    llvm.return
  }
}

// -----
module {
  llvm.func @blockload_as1(%arg0: !llvm.ptr<1>) -> vector<8xi16> {
    %0 = xevm.blockload %arg0 <{cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>}> : (!llvm.ptr<1>) -> vector<8xi16>
    llvm.return %0 : vector<8xi16>
  }
}

// -----
module {
  llvm.func @blockload_as3(%arg0: !llvm.ptr<3>) -> vector<16xi8> {
    %0 = xevm.blockload %arg0 <{cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>}> : (!llvm.ptr<3>) -> vector<16xi8>
    llvm.return %0 : vector<16xi8>
  }
}

// -----
module {
  llvm.func @blockload_scalar(%arg0: !llvm.ptr<3>) -> i8 {
    %0 = xevm.blockload %arg0 <{cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>}> : (!llvm.ptr<3>) -> i8
    llvm.return %0 : i8
  }
}

// -----
module {
  llvm.func @blockstore_as1(%arg0: !llvm.ptr<1>, %arg1: vector<8xi32>) {
    xevm.blockstore %arg0, %arg1 <{cache_control = #xevm.store_cache_control<L1wt_L2uc_L3wb>}> : (!llvm.ptr<1>, vector<8xi32>)
    llvm.return
  }
}

// -----
module {
  llvm.func @blockstore_as3(%arg0: !llvm.ptr<3>, %arg1: vector<2xi64>) {
    xevm.blockstore %arg0, %arg1 <{cache_control = #xevm.store_cache_control<L1wt_L2uc_L3wb>}> : (!llvm.ptr<3>, vector<2xi64>)
    llvm.return
  }
}

// -----
module {
  llvm.func @blockstore_scalar(%arg0: !llvm.ptr<3>, %arg1: i64) {
    xevm.blockstore %arg0, %arg1 <{cache_control = #xevm.store_cache_control<L1wt_L2uc_L3wb>}> : (!llvm.ptr<3>, i64)
    llvm.return
  }
}

// -----
module {
  llvm.func @local_id.x() -> i32 {
    %0 = xevm.local_id.x : i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @local_id.y() -> i32 {
    %0 = xevm.local_id.y : i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @local_id.z() -> i32 {
    %0 = xevm.local_id.z : i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @local_size.x() -> i32 {
    %0 = xevm.local_size.x : i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @local_size.y() -> i32 {
    %0 = xevm.local_size.y : i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @local_size.z() -> i32 {
    %0 = xevm.local_size.z : i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @group_id.x() -> i32 {
    %0 = xevm.group_id.x : i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @group_id.y() -> i32 {
    %0 = xevm.group_id.y : i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @group_id.z() -> i32 {
    %0 = xevm.group_id.z : i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @group_count.x() -> i32 {
    %0 = xevm.group_count.x : i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @group_count.y() -> i32 {
    %0 = xevm.group_count.y : i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @group_count.z() -> i32 {
    %0 = xevm.group_count.z : i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @lane_id() -> i32 {
    %0 = xevm.lane_id : i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @subgroup_size() -> i32 {
    %0 = xevm.subgroup_size : i32
    llvm.return %0 : i32
  }
}

// -----
module {
  llvm.func @subgroup_id() -> i32 {
    %0 = xevm.subgroup_id : i32
    llvm.return %0 : i32
  }
}

