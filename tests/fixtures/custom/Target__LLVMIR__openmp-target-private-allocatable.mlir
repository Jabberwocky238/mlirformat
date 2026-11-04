module {
  llvm.func @alloc_foo_1(!llvm.ptr)
  llvm.func @dealloc_foo_1(!llvm.ptr)
  omp.private {type = private} @box.heap_privatizer : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    llvm.call @alloc_foo_1(%arg0) : (!llvm.ptr) -> ()
    omp.yield(%arg1 : !llvm.ptr)
  } dealloc {
  ^bb0(%arg0: !llvm.ptr):
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.call @dealloc_foo_1(%arg0) : (!llvm.ptr) -> ()
    omp.yield
  }
  llvm.func @target_allocatable_(%arg0: !llvm.ptr {fir.bindc_name = "lb"}, %arg1: !llvm.ptr {fir.bindc_name = "ub"}, %arg2: !llvm.ptr {fir.bindc_name = "l"}) attributes {fir.internal_name = "_QPtarget_allocatable"} {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %2 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.alloca %3 x f32 {bindc_name = "real_var"} : (i64) -> !llvm.ptr
    %5 = llvm.alloca %3 x i32 {bindc_name = "mapped_var"} : (i64) -> !llvm.ptr
    %6 = llvm.alloca %3 x !llvm.struct<(f32, f32)> {bindc_name = "comp_var"} : (i64) -> !llvm.ptr
    %7 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
    %8 = llvm.alloca %3 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> {bindc_name = "alloc_var"} : (i64) -> !llvm.ptr
    %9 = llvm.load %arg2 : !llvm.ptr -> i64
    %10 = llvm.alloca %9 x f32 {bindc_name = "real_arr"} : (i64) -> !llvm.ptr
    %11 = omp.map.info var_ptr(%5 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "mapped_var"}
    %12 = omp.map.info var_ptr(%8 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(to) capture(ByRef) -> !llvm.ptr
    omp.target map_entries(%11 -> %arg3, %12 -> %arg4 : !llvm.ptr, !llvm.ptr) private(@box.heap_privatizer %8 -> %arg5 [map_idx=1] : !llvm.ptr) {
      llvm.call @use_private_var(%arg5) : (!llvm.ptr) -> ()
      omp.terminator
    }
    llvm.return
  }
  llvm.func @use_private_var(!llvm.ptr)
  llvm.func @_FortranAAssign(!llvm.ptr, !llvm.ptr, !llvm.ptr, i32) -> !llvm.struct<()> attributes {fir.runtime, sym_visibility = "private"}
}

