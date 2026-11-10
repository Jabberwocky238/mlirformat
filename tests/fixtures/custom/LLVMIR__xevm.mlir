module {
  func.func @blockload2d(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32) -> vector<8xi16> {
    %0 = xevm.blockload2d %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 <{cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>, elem_size_in_bits = 16 : i32, pack_register = false, tile_height = 8 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi16>
    return %0 : vector<8xi16>
  }
}

// -----
module {
  func.func @blockstore2d(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: vector<8xi32>) {
    xevm.blockstore2d %arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6 <{elem_size_in_bits = 32 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xi32>)
    return
  }
}

// -----
module {
  func.func @blockprefetch2d(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32) {
    xevm.blockprefetch2d %arg0, %arg1, %arg2, %arg3, %arg4, %arg5 <{cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>, elem_size_in_bits = 8 : i32, tile_height = 8 : i32, tile_width = 32 : i32, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32)
    return
  }
}

// -----
module {
  func.func @blockload(%arg0: !llvm.ptr<1>) -> vector<4xi16> {
    %0 = xevm.blockload %arg0 <{cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>}> : (!llvm.ptr<1>) -> vector<4xi16>
    return %0 : vector<4xi16>
  }
}

// -----
module {
  func.func @blockstore(%arg0: !llvm.ptr<1>, %arg1: vector<4xi32>) {
    xevm.blockstore %arg0, %arg1  : (!llvm.ptr<1>, vector<4xi32>)
    return
  }
}

// -----
module {
  func.func @mma(%arg0: vector<8xf32>, %arg1: vector<8xi16>, %arg2: vector<8xi32>) -> vector<8xf32> {
    %0 = xevm.mma %arg1, %arg2, %arg0 {shape = <m = 8, n = 16, k = 16>, types = <d = f32, a = f16, b = f16, c = f32>} : (vector<8xi16>, vector<8xi32>, vector<8xf32>) -> vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @mma_mx(%arg0: vector<8xf32>, %arg1: vector<8xi16>, %arg2: vector<8xi32>, %arg3: vector<2xi8>, %arg4: vector<2xi8>) -> vector<8xf32> {
    %0 = xevm.mma_mx %arg1, %arg2, %arg3, %arg4, %arg0 {shape = <m = 8, n = 16, k = 64>, types = <d = f32, a = e2m1, b = e2m1, c = f32>} : (vector<8xi16>, vector<8xi32>, vector<2xi8>, vector<2xi8>, vector<8xf32>) -> vector<8xf32>
    return %0 : vector<8xf32>
  }
}

// -----
module {
  func.func @truncf_scalar() -> i8 {
    %cst = arith.constant 1.000000e+00 : bf16
    %0 = xevm.truncf %cst {src_etype = bf16, dst_etype = f8} : (bf16) -> i8
    return %0 : i8
  }
}

// -----
module {
  func.func @truncf_vector() -> vector<8xi4> {
    %cst = arith.constant dense<1.000000e+00> : vector<8xbf16>
    %0 = xevm.truncf %cst {src_etype = bf16, dst_etype = e2m1} : (vector<8xbf16>) -> vector<8xi4>
    return %0 : vector<8xi4>
  }
}

// -----
module {
  func.func @extf_scalar() -> f16 {
    %c1_i8 = arith.constant 1 : i8
    %0 = xevm.extf %c1_i8 {src_etype = bf8, dst_etype = f16} : (i8) -> f16
    return %0 : f16
  }
}

// -----
module {
  func.func @extf_vector() -> vector<8xbf16> {
    %cst = arith.constant dense<1> : vector<8xi4>
    %0 = xevm.extf %cst {src_etype = e2m1, dst_etype = bf16} : (vector<8xi4>) -> vector<8xbf16>
    return %0 : vector<8xbf16>
  }
}

// -----
module {
  func.func @memfence() {
    xevm.memfence <{addrspace = #xevm.addr_space<global>, scope = #xevm.mem_scope<workgroup>}>
    return
  }
}

// -----
module {
  func.func @prefetch(%arg0: !llvm.ptr<1>) {
    xevm.prefetch %arg0 <{cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>}> : (!llvm.ptr<1>)
    return
  }
}

// -----
module {
  gpu.module @xevm_module [#xevm.target<O = 3, chip = "pvc">] {
  }
}

// -----
module {
  llvm.func @xevm_special_ids() -> i32 {
    %0 = xevm.local_id.x : i32
    %1 = xevm.local_id.y : i32
    %2 = xevm.local_id.z : i32
    %3 = xevm.local_size.x : i32
    %4 = xevm.local_size.y : i32
    %5 = xevm.local_size.z : i32
    %6 = xevm.group_id.x : i32
    %7 = xevm.group_id.y : i32
    %8 = xevm.group_id.z : i32
    %9 = xevm.group_count.x : i32
    %10 = xevm.group_count.y : i32
    %11 = xevm.group_count.z : i32
    %12 = xevm.lane_id : i32
    %13 = xevm.subgroup_size : i32
    %14 = xevm.subgroup_id : i32
    llvm.return %0 : i32
  }
}

