"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", target_cpu = "generic-hsa", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = i32}> {bindc_name = "threads"} : (i64) -> !llvm.ptr<5>
    %2 = "llvm.addrspacecast"(%1) : (!llvm.ptr<5>) -> !llvm.ptr
    %3 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %4 = "llvm.alloca"(%3) <{elem_type = i32}> {bindc_name = "a"} : (i64) -> !llvm.ptr<5>
    %5 = "llvm.addrspacecast"(%4) : (!llvm.ptr<5>) -> !llvm.ptr
    %6 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %7 = "llvm.mlir.constant"() <{value = 128 : i32}> : () -> i32
    %8 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %9 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    "llvm.store"(%7, %2) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    "llvm.store"(%6, %5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
    %10 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "threads", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    %11 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByCopy)>, map_type = #omp<clause_map_flags implicit>, name = "a", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = i32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%10, %11) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
      %12 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      %13 = "llvm.load"(%arg0) <{ordering = 0 : i64}> : (!llvm.ptr) -> i32
      "omp.parallel"(%13) <{operandSegmentSizes = array<i32: 0, 0, 0, 1, 0, 0>}> ({
        "omp.atomic.update"(%arg1) <{atomic_control = #omp.atomic_control<ignore_denormal_mode = true>}> ({
        ^bb0(%arg2: i32):
          %14 = "llvm.add"(%arg2, %12) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
          "omp.yield"(%14) : (i32) -> ()
        }) : (!llvm.ptr) -> ()
        "omp.terminator"() : () -> ()
      }) : (i32) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {fir.bindc_name = "TEST", omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<!llvm.ptr = dense<64> : vector<4xi64>, !llvm.ptr<1> = dense<64> : vector<4xi64>, !llvm.ptr<2> = dense<32> : vector<4xi64>, !llvm.ptr<3> = dense<32> : vector<4xi64>, !llvm.ptr<4> = dense<64> : vector<4xi64>, !llvm.ptr<5> = dense<32> : vector<4xi64>, !llvm.ptr<6> = dense<32> : vector<4xi64>, !llvm.ptr<7> = dense<[160, 256, 256, 32]> : vector<4xi64>, !llvm.ptr<8> = dense<[128, 128, 128, 48]> : vector<4xi64>, !llvm.ptr<9> = dense<[192, 256, 256, 32]> : vector<4xi64>, i64 = dense<64> : vector<2xi64>, i1 = dense<8> : vector<2xi64>, i8 = dense<8> : vector<2xi64>, i16 = dense<16> : vector<2xi64>, i32 = dense<32> : vector<2xi64>, f16 = dense<16> : vector<2xi64>, f64 = dense<64> : vector<2xi64>, f128 = dense<128> : vector<2xi64>, "dlti.endianness" = "little", "dlti.legal_int_widths" = array<i32: 32, 64>, "dlti.stack_alignment" = 32 : i64, "dlti.alloca_memory_space" = 5 : ui64, "dlti.global_memory_space" = 1 : ui64>, fir.atomic_ignore_denormal_mode, fir.defaultkind = "a1c4d8i4l4r4", fir.kindmap = "", fir.target_cpu = "generic-hsa", llvm.data_layout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-p7:160:256:256:32-p8:128:128:128:48-p9:192:256:256:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7:8:9", llvm.target_triple = "amdgcn-amd-amdhsa", omp.flags = #omp.flags<openmp_device_version = 31>, omp.is_gpu = true, omp.is_target_device = true, omp.requires = #omp<clause_requires none>, omp.target_triples = [], omp.version = #omp.version<version = 31>} : () -> ()

