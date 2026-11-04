"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.addressof"() <{global_name = @_QFEpointer2}> : () -> !llvm.ptr
    %2 = "omp.threadprivate"(%1) : (!llvm.ptr) -> !llvm.ptr
    %3 = "omp.map.info"(%2) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags to|implicit>, operandSegmentSizes = array<i32: 1, 0, 0, 0>, partial_map = false, var_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>}> : (!llvm.ptr) -> !llvm.ptr
    "omp.target"(%3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr):
      %4 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
      %5 = "llvm.getelementptr"(%arg0) <{elem_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, noWrapFlags = 0 : i32, rawConstantIndices = array<i32: 0, 0>}> : (!llvm.ptr) -> !llvm.ptr
      "llvm.store"(%4, %5) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) {omp.declare_target = #omp.declaretarget<device_type = (host), capture_clause = (to)>} : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>, linkage = #llvm.linkage<internal>, sym_name = "_QFEpointer2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.undef"() : () -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    "llvm.return"(%0) : (!llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>) -> ()
  }) : () -> ()
}) {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} : () -> ()

