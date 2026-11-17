"builtin.module"() ({
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<>} : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 20>} : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 100, assume_teams_oversubscription = true>} : () -> () loc("<stdin>":8:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 200, assume_teams_oversubscription = true, assume_threads_oversubscription = true>} : () -> () loc("<stdin>":11:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 300, assume_teams_oversubscription = true, assume_threads_oversubscription = true, assume_no_thread_state = true>} : () -> () loc("<stdin>":14:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 400, assume_teams_oversubscription = true, assume_threads_oversubscription = true, assume_no_thread_state = true, assume_no_nested_parallelism = true>} : () -> () loc("<stdin>":17:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<>} : () -> () loc("<stdin>":20:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true>} : () -> () loc("<stdin>":23:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true, assume_no_thread_state = true>} : () -> () loc("<stdin>":26:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true, assume_no_thread_state = true>} : () -> () loc("<stdin>":29:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 20, openmp_device_version = 51>} : () -> () loc("<stdin>":32:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 100, assume_teams_oversubscription = true, openmp_device_version = 51>} : () -> () loc("<stdin>":35:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 200, assume_teams_oversubscription = true, assume_threads_oversubscription = true, openmp_device_version = 51>} : () -> () loc("<stdin>":38:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 300, assume_teams_oversubscription = true, assume_threads_oversubscription = true, assume_no_thread_state = true, openmp_device_version = 51>} : () -> () loc("<stdin>":41:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 400, assume_teams_oversubscription = true, assume_threads_oversubscription = true, assume_no_thread_state = true, assume_no_nested_parallelism = true, openmp_device_version = 51>} : () -> () loc("<stdin>":44:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true, openmp_device_version = 51>} : () -> () loc("<stdin>":47:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true, assume_no_thread_state = true, openmp_device_version = 51>} : () -> () loc("<stdin>":50:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true, assume_no_thread_state = true, openmp_device_version = 51>} : () -> () loc("<stdin>":53:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true, assume_no_thread_state = true, no_gpu_lib = true, openmp_device_version = 51>} : () -> () loc("<stdin>":56:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true, openmp_device_version = 51>} : () -> () loc("<stdin>":59:3)
  "builtin.module"() ({
  ^bb0:
  }) {omp.version = #omp.version<version = 51>} : () -> () loc("<stdin>":62:3)
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_host_to"}> ({
    "func.return"() : () -> () loc("<stdin>":66:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> () loc("<stdin>":65:3)
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_host_link"}> ({
    "func.return"() : () -> () loc("<stdin>":69:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (link)>} : () -> () loc("<stdin>":68:3)
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_host_enter"}> ({
    "func.return"() : () -> () loc("<stdin>":72:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (enter)>} : () -> () loc("<stdin>":71:3)
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_nohost_to"}> ({
    "func.return"() : () -> () loc("<stdin>":75:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>} : () -> () loc("<stdin>":74:3)
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_nohost_link"}> ({
    "func.return"() : () -> () loc("<stdin>":78:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (link)>} : () -> () loc("<stdin>":77:3)
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_nohost_enter"}> ({
    "func.return"() : () -> () loc("<stdin>":81:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (enter)>} : () -> () loc("<stdin>":80:3)
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_any_to"}> ({
    "func.return"() : () -> () loc("<stdin>":84:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : () -> () loc("<stdin>":83:3)
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_any_link"}> ({
    "func.return"() : () -> () loc("<stdin>":87:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : () -> () loc("<stdin>":86:3)
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_any_enter"}> ({
    "func.return"() : () -> () loc("<stdin>":90:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter)>} : () -> () loc("<stdin>":89:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_host_to", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %8 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":93:10)
    "llvm.return"(%8) : (i32) -> () loc("<stdin>":94:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> () loc("<stdin>":92:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_host_link", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %7 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":97:10)
    "llvm.return"(%7) : (i32) -> () loc("<stdin>":98:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (link)>} : () -> () loc("<stdin>":96:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_host_enter", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %6 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":101:10)
    "llvm.return"(%6) : (i32) -> () loc("<stdin>":102:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (enter)>} : () -> () loc("<stdin>":100:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_nohost_to", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %5 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":105:10)
    "llvm.return"(%5) : (i32) -> () loc("<stdin>":106:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>} : () -> () loc("<stdin>":104:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_nohost_link", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":109:10)
    "llvm.return"(%4) : (i32) -> () loc("<stdin>":110:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (link)>} : () -> () loc("<stdin>":108:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_nohost_enter", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":113:10)
    "llvm.return"(%3) : (i32) -> () loc("<stdin>":114:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (enter)>} : () -> () loc("<stdin>":112:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_any_to", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":117:10)
    "llvm.return"(%2) : (i32) -> () loc("<stdin>":118:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : () -> () loc("<stdin>":116:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_any_link", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":121:10)
    "llvm.return"(%1) : (i32) -> () loc("<stdin>":122:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : () -> () loc("<stdin>":120:3)
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_any_enter", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":125:10)
    "llvm.return"(%0) : (i32) -> () loc("<stdin>":126:5)
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter)>} : () -> () loc("<stdin>":124:3)
}) : () -> () loc("<stdin>":1:1)
