"builtin.module"() ({
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 20>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 100, assume_teams_oversubscription = true>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 200, assume_teams_oversubscription = true, assume_threads_oversubscription = true>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 300, assume_teams_oversubscription = true, assume_threads_oversubscription = true, assume_no_thread_state = true>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 400, assume_teams_oversubscription = true, assume_threads_oversubscription = true, assume_no_thread_state = true, assume_no_nested_parallelism = true>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true, assume_no_thread_state = true>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true, assume_no_thread_state = true>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 20, openmp_device_version = 51>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 100, assume_teams_oversubscription = true, openmp_device_version = 51>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 200, assume_teams_oversubscription = true, assume_threads_oversubscription = true, openmp_device_version = 51>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 300, assume_teams_oversubscription = true, assume_threads_oversubscription = true, assume_no_thread_state = true, openmp_device_version = 51>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<debug_kind = 400, assume_teams_oversubscription = true, assume_threads_oversubscription = true, assume_no_thread_state = true, assume_no_nested_parallelism = true, openmp_device_version = 51>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true, openmp_device_version = 51>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true, assume_no_thread_state = true, openmp_device_version = 51>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true, assume_no_thread_state = true, openmp_device_version = 51>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true, assume_no_thread_state = true, no_gpu_lib = true, openmp_device_version = 51>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.flags = #omp.flags<assume_teams_oversubscription = true, openmp_device_version = 51>} : () -> ()
  "builtin.module"() ({
  ^bb0:
  }) {omp.version = #omp.version<version = 51>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_host_to"}> ({
    "func.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_host_link"}> ({
    "func.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (link)>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_host_enter"}> ({
    "func.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (enter)>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_nohost_to"}> ({
    "func.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_nohost_link"}> ({
    "func.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (link)>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_nohost_enter"}> ({
    "func.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (enter)>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_any_to"}> ({
    "func.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_any_link"}> ({
    "func.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "omp_decl_tar_any_enter"}> ({
    "func.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_host_to", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %8 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "llvm.return"(%8) : (i32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_host_link", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %7 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "llvm.return"(%7) : (i32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (link)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_host_enter", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %6 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "llvm.return"(%6) : (i32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (enter)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_nohost_to", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %5 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "llvm.return"(%5) : (i32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (to)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_nohost_link", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "llvm.return"(%4) : (i32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (link)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_nohost_enter", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "llvm.return"(%3) : (i32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (enter)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_any_to", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "llvm.return"(%2) : (i32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_any_link", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "llvm.return"(%1) : (i32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = i32, linkage = #llvm.linkage<external>, sym_name = "omp_decl_tar_data_any_enter", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    "llvm.return"(%0) : (i32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter)>} : () -> ()
}) : () -> ()

