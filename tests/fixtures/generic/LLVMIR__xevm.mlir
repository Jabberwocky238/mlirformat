"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi16>, sym_name = "blockload2d"}> ({
  ^bb0(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32):
    %0 = "xevm.blockload2d"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>, elem_size_in_bits = 16 : i32, pack_register = false, tile_height = 8 : i32, tile_width = 16 : i32, transpose = false, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> vector<8xi16>
    "func.return"(%0) : (vector<8xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xi32>) -> (), sym_name = "blockstore2d"}> ({
  ^bb0(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: vector<8xi32>):
    "xevm.blockstore2d"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6) <{elem_size_in_bits = 32 : i32, tile_height = 8 : i32, tile_width = 16 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32, vector<8xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> (), sym_name = "blockprefetch2d"}> ({
  ^bb0(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32):
    "xevm.blockprefetch2d"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>, elem_size_in_bits = 8 : i32, tile_height = 8 : i32, tile_width = 32 : i32, v_blocks = 1 : i32}> : (!llvm.ptr<1>, i32, i32, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr<1>) -> vector<4xi16>, sym_name = "blockload"}> ({
  ^bb0(%arg0: !llvm.ptr<1>):
    %0 = "xevm.blockload"(%arg0) <{cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>}> : (!llvm.ptr<1>) -> vector<4xi16>
    "func.return"(%0) : (vector<4xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr<1>, vector<4xi32>) -> (), sym_name = "blockstore"}> ({
  ^bb0(%arg0: !llvm.ptr<1>, %arg1: vector<4xi32>):
    "xevm.blockstore"(%arg0, %arg1) : (!llvm.ptr<1>, vector<4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf32>, vector<8xi16>, vector<8xi32>) -> vector<8xf32>, sym_name = "mma"}> ({
  ^bb0(%arg0: vector<8xf32>, %arg1: vector<8xi16>, %arg2: vector<8xi32>):
    %0 = "xevm.mma"(%arg1, %arg2, %arg0) <{shape = #xevm.mma_shape<m = 8, n = 16, k = 16>, types = #xevm.mma_types<d = f32, a = f16, b = f16, c = f32>}> : (vector<8xi16>, vector<8xi32>, vector<8xf32>) -> vector<8xf32>
    "func.return"(%0) : (vector<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "memfence"}> ({
    "xevm.memfence"() <{addrspace = #xevm.addr_space<global>, scope = #xevm.mem_scope<workgroup>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!llvm.ptr<1>) -> (), sym_name = "prefetch"}> ({
  ^bb0(%arg0: !llvm.ptr<1>):
    "xevm.prefetch"(%arg0) <{cache_control = #xevm.load_cache_control<L1uc_L2uc_L3uc>}> : (!llvm.ptr<1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "xevm_module", targets = [#xevm.target<O = 3, chip = "pvc">]}> ({
  ^bb0:
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 ()>, linkage = #llvm.linkage<external>, sym_name = "xevm_special_ids", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "xevm.local_id.x"() : () -> i32
    %1 = "xevm.local_id.y"() : () -> i32
    %2 = "xevm.local_id.z"() : () -> i32
    %3 = "xevm.local_size.x"() : () -> i32
    %4 = "xevm.local_size.y"() : () -> i32
    %5 = "xevm.local_size.z"() : () -> i32
    %6 = "xevm.group_id.x"() : () -> i32
    %7 = "xevm.group_id.y"() : () -> i32
    %8 = "xevm.group_id.z"() : () -> i32
    %9 = "xevm.group_count.x"() : () -> i32
    %10 = "xevm.group_count.y"() : () -> i32
    %11 = "xevm.group_count.z"() : () -> i32
    %12 = "xevm.lane_id"() : () -> i32
    %13 = "xevm.subgroup_size"() : () -> i32
    %14 = "xevm.subgroup_id"() : () -> i32
    "llvm.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

