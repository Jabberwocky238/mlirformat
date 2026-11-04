"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "_QQmain", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    %1 = "llvm.alloca"(%0) <{elem_type = !llvm.struct<(ptr)>}> : (i64) -> !llvm.ptr
    %2 = "omp.map.info"(%1) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|from>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = !llvm.struct<(ptr)>}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%2) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr):
      %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      %4 = "llvm.alloca"(%3) <{alignment = 8 : i64, elem_type = !llvm.struct<(ptr)>}> : (i32) -> !llvm.ptr<5>
      %5 = "llvm.addrspacecast"(%4) : (!llvm.ptr<5>) -> !llvm.ptr
      %6 = "llvm.mlir.constant"() <{value = 50 : i32}> : () -> i32
      %7 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
      %8 = "llvm.alloca"(%7) <{elem_type = i32}> : (i64) -> !llvm.ptr<5>
      %9 = "llvm.addrspacecast"(%8) : (!llvm.ptr<5>) -> !llvm.ptr
      "llvm.store"(%6, %9) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      %10 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr)>
      %11 = "llvm.insertvalue"(%10, %9) <{position = array<i64: 0>}> : (!llvm.struct<(ptr)>, !llvm.ptr) -> !llvm.struct<(ptr)>
      "llvm.store"(%11, %5) <{ordering = 0 : i64}> : (!llvm.struct<(ptr)>, !llvm.ptr) -> ()
      %12 = "llvm.call"(%arg0, %5) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_ExternalCall, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> : (!llvm.ptr, !llvm.ptr) -> !llvm.struct<()>
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<()> (ptr, ptr)>, linkage = #llvm.linkage<external>, sym_name = "_ExternalCall", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} : () -> ()

