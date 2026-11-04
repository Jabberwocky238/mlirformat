"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "omp_target_depend_", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "llvm.mlir.constant"() <{value = 39 : index}> : () -> i64
    %2 = "llvm.mlir.constant"() <{value = 1 : index}> : () -> i64
    %3 = "llvm.mlir.constant"() <{value = 40 : index}> : () -> i64
    %4 = "omp.map.bounds"(%2, %1, %3, %2, %2) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>, stride_in_bytes = false}> : (i64, i64, i64, i64, i64) -> !omp.map_bounds_ty
    %5 = "llvm.mlir.addressof"() <{global_name = @_QFEa}> : () -> !llvm.ptr
    %6 = "omp.map.info"(%5, %4) <{map_capture_type = #omp<variable_capture_kind(ByRef)>, map_type = #omp<clause_map_flags from>, name = "a", operandSegmentSizes = array<i32: 1, 0, 0, 1>, partial_map = false, var_type = !llvm.array<40 x i32>}> : (!llvm.ptr, !omp.map_bounds_ty) -> !llvm.ptr
    "omp.target"(%5, %6) <{depend_kinds = [#omp<clause_task_depend(taskdependin)>], operandSegmentSizes = array<i32: 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0>}> ({
    ^bb0(%arg0: !llvm.ptr):
      %7 = "llvm.mlir.constant"() <{value = 100 : index}> : () -> i32
      "llvm.store"(%7, %arg0) <{ordering = 0 : i64}> : (i32, !llvm.ptr) -> ()
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr, !llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.mlir.global"() <{addr_space = 0 : i32, global_type = !llvm.array<40 x i32>, linkage = #llvm.linkage<internal>, sym_name = "_QFEa", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "llvm.mlir.zero"() : () -> !llvm.array<40 x i32>
    "llvm.return"(%0) : (!llvm.array<40 x i32>) -> ()
  }) : () -> ()
}) {omp.is_target_device = false} : () -> ()

