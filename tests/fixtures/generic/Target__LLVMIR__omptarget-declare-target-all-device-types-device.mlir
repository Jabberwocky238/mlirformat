"builtin.module"() ({
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f32, linkage = #llvm.linkage<internal>, sym_name = "ial", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %59 = "llvm.mlir.zero"() : () -> f32
    "llvm.return"(%59) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, dso_local, global_type = f32, linkage = #llvm.linkage<external>, sym_name = "eal", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %58 = "llvm.mlir.zero"() : () -> f32
    "llvm.return"(%58) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f32, linkage = #llvm.linkage<internal>, sym_name = "ihl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %57 = "llvm.mlir.zero"() : () -> f32
    "llvm.return"(%57) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (link)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, dso_local, global_type = f32, linkage = #llvm.linkage<external>, sym_name = "ehl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %56 = "llvm.mlir.zero"() : () -> f32
    "llvm.return"(%56) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (link)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f32, linkage = #llvm.linkage<internal>, sym_name = "inl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %55 = "llvm.mlir.zero"() : () -> f32
    "llvm.return"(%55) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (link)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, dso_local, global_type = f32, linkage = #llvm.linkage<external>, sym_name = "enl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %54 = "llvm.mlir.zero"() : () -> f32
    "llvm.return"(%54) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (link)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f32, linkage = #llvm.linkage<internal>, sym_name = "iae", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %53 = "llvm.mlir.zero"() : () -> f32
    "llvm.return"(%53) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, dso_local, global_type = f32, linkage = #llvm.linkage<external>, sym_name = "eae", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %52 = "llvm.mlir.zero"() : () -> f32
    "llvm.return"(%52) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f32, linkage = #llvm.linkage<internal>, sym_name = "ihe", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %51 = "llvm.mlir.zero"() : () -> f32
    "llvm.return"(%51) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (enter)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, dso_local, global_type = f32, linkage = #llvm.linkage<external>, sym_name = "ehe", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %50 = "llvm.mlir.zero"() : () -> f32
    "llvm.return"(%50) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (enter)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = f32, linkage = #llvm.linkage<internal>, sym_name = "ine", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %49 = "llvm.mlir.zero"() : () -> f32
    "llvm.return"(%49) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (enter)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, dso_local, global_type = f32, linkage = #llvm.linkage<external>, sym_name = "ene", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %48 = "llvm.mlir.zero"() : () -> f32
    "llvm.return"(%48) : (f32) -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (nohost), capture_clause = (enter)>} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.addressof"() <{global_name = @ial}> : () -> !llvm.ptr
    %1 = "llvm.addrspacecast"(%0) : (!llvm.ptr) -> !llvm.ptr
    %2 = "llvm.mlir.addressof"() <{global_name = @ihl}> : () -> !llvm.ptr
    %3 = "llvm.addrspacecast"(%2) : (!llvm.ptr) -> !llvm.ptr
    %4 = "llvm.mlir.addressof"() <{global_name = @inl}> : () -> !llvm.ptr
    %5 = "llvm.addrspacecast"(%4) : (!llvm.ptr) -> !llvm.ptr
    %6 = "llvm.mlir.addressof"() <{global_name = @iae}> : () -> !llvm.ptr
    %7 = "llvm.addrspacecast"(%6) : (!llvm.ptr) -> !llvm.ptr
    %8 = "llvm.mlir.addressof"() <{global_name = @ihe}> : () -> !llvm.ptr
    %9 = "llvm.addrspacecast"(%8) : (!llvm.ptr) -> !llvm.ptr
    %10 = "llvm.mlir.addressof"() <{global_name = @ine}> : () -> !llvm.ptr
    %11 = "llvm.addrspacecast"(%10) : (!llvm.ptr) -> !llvm.ptr
    %12 = "llvm.mlir.addressof"() <{global_name = @eal}> : () -> !llvm.ptr
    %13 = "llvm.addrspacecast"(%12) : (!llvm.ptr) -> !llvm.ptr
    %14 = "llvm.mlir.addressof"() <{global_name = @ehl}> : () -> !llvm.ptr
    %15 = "llvm.addrspacecast"(%14) : (!llvm.ptr) -> !llvm.ptr
    %16 = "llvm.mlir.addressof"() <{global_name = @enl}> : () -> !llvm.ptr
    %17 = "llvm.addrspacecast"(%16) : (!llvm.ptr) -> !llvm.ptr
    %18 = "llvm.mlir.addressof"() <{global_name = @eae}> : () -> !llvm.ptr
    %19 = "llvm.addrspacecast"(%18) : (!llvm.ptr) -> !llvm.ptr
    %20 = "llvm.mlir.addressof"() <{global_name = @ehe}> : () -> !llvm.ptr
    %21 = "llvm.addrspacecast"(%20) : (!llvm.ptr) -> !llvm.ptr
    %22 = "llvm.mlir.addressof"() <{global_name = @ene}> : () -> !llvm.ptr
    %23 = "llvm.addrspacecast"(%22) : (!llvm.ptr) -> !llvm.ptr
    %24 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from|always>, name = "ial", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%24) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg11: !llvm.ptr):
      %47 = "llvm.mlir.constant"() <{value = 1.100000e+00 : f32}> : () -> f32
      "llvm.store"(%47, %arg11) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    %25 = "omp.map.info"(%13) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from|always>, name = "eal", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%25) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg10: !llvm.ptr):
      %46 = "llvm.mlir.constant"() <{value = 1.200000e+00 : f32}> : () -> f32
      "llvm.store"(%46, %arg10) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    %26 = "omp.map.info"(%3) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from|always>, name = "ihl", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%26) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg9: !llvm.ptr):
      %45 = "llvm.mlir.constant"() <{value = 2.100000e+00 : f32}> : () -> f32
      "llvm.store"(%45, %arg9) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    %27 = "omp.map.info"(%15) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from|always>, name = "ehl", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%27) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg8: !llvm.ptr):
      %44 = "llvm.mlir.constant"() <{value = 2.200000e+00 : f32}> : () -> f32
      "llvm.store"(%44, %arg8) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    %28 = "omp.map.info"(%5) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from|always>, name = "inl", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%28) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg7: !llvm.ptr):
      %43 = "llvm.mlir.constant"() <{value = 3.100000e+00 : f32}> : () -> f32
      "llvm.store"(%43, %arg7) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    %29 = "omp.map.info"(%17) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from|always>, name = "enl", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%29) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg6: !llvm.ptr):
      %42 = "llvm.mlir.constant"() <{value = 3.200000e+00 : f32}> : () -> f32
      "llvm.store"(%42, %arg6) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    %30 = "omp.map.info"(%7) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from|always>, name = "iae", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%30) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg5: !llvm.ptr):
      %41 = "llvm.mlir.constant"() <{value = 4.100000e+00 : f32}> : () -> f32
      "llvm.store"(%41, %arg5) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    %31 = "omp.map.info"(%19) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from|always>, name = "eae", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%31) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg4: !llvm.ptr):
      %40 = "llvm.mlir.constant"() <{value = 4.200000e+00 : f32}> : () -> f32
      "llvm.store"(%40, %arg4) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    %32 = "omp.map.info"(%9) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from|always>, name = "ihe", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%32) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg3: !llvm.ptr):
      %39 = "llvm.mlir.constant"() <{value = 5.100000e+00 : f32}> : () -> f32
      "llvm.store"(%39, %arg3) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    %33 = "omp.map.info"(%21) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from|always>, name = "ehe", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%33) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg2: !llvm.ptr):
      %38 = "llvm.mlir.constant"() <{value = 5.200000e+00 : f32}> : () -> f32
      "llvm.store"(%38, %arg2) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    %34 = "omp.map.info"(%11) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from|always>, name = "ine", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%34) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg1: !llvm.ptr):
      %37 = "llvm.mlir.constant"() <{value = 6.100000e+00 : f32}> : () -> f32
      "llvm.store"(%37, %arg1) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    %35 = "omp.map.info"(%23) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from|always>, name = "ene", operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_ptr_type = f32}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%35) <{kernel_type = #omp<kernel_type(generic)>, operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr):
      %36 = "llvm.mlir.constant"() <{value = 6.210000e+00 : f32}> : () -> f32
      "llvm.store"(%36, %arg0) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) {llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} : () -> ()

