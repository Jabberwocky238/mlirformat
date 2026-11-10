module {
  llvm.func @dealloc_foo_0(!llvm.ptr)
  omp.private {type = private} @box.heap_privatizer0 : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> dealloc {
  ^bb0(%arg0: !llvm.ptr):
    llvm.call @dealloc_foo_0(%arg0) : (!llvm.ptr) -> ()
    omp.yield
  }
  llvm.func @alloc_foo_1(!llvm.ptr)
  llvm.func @dealloc_foo_1(!llvm.ptr)
  omp.private {type = private} @box.heap_privatizer1 : !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    llvm.call @alloc_foo_1(%arg0) : (!llvm.ptr) -> ()
    omp.yield(%arg1 : !llvm.ptr)
  } dealloc {
  ^bb0(%arg0: !llvm.ptr):
    llvm.call @dealloc_foo_1(%arg0) : (!llvm.ptr) -> ()
    omp.yield
  }
  llvm.func @target_allocatable_(%arg0: !llvm.ptr {fir.bindc_name = "lb"}, %arg1: !llvm.ptr {fir.bindc_name = "ub"}, %arg2: !llvm.ptr {fir.bindc_name = "l"}) attributes {fir.internal_name = "_QPtarget_allocatable"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "mapped_var"} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> {bindc_name = "alloc_var0"} : (i64) -> !llvm.ptr
    %3 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> {bindc_name = "alloc_var1"} : (i64) -> !llvm.ptr
    %4 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr {name = "mapped_var"}
    %5 = omp.map.info var_ptr(%2 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(to) capture(ByRef) -> !llvm.ptr
    %6 = omp.map.info var_ptr(%3 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(to) capture(ByRef) -> !llvm.ptr
    omp.target kernel_type(generic) map_entries(%4 -> %arg3, %5 -> %arg4, %6 -> %arg5 : !llvm.ptr, !llvm.ptr, !llvm.ptr) private(@box.heap_privatizer0 %2 -> %arg6 [map_idx=1], @box.heap_privatizer1 %3 -> %arg7 [map_idx=2] : !llvm.ptr, !llvm.ptr) {
      llvm.call @use_private_var0(%arg6) : (!llvm.ptr) -> ()
      llvm.call @use_private_var1(%arg7) : (!llvm.ptr) -> ()
      omp.terminator
    }
    llvm.return
  }
  llvm.func @use_private_var0(!llvm.ptr)
  llvm.func @use_private_var1(!llvm.ptr)
}

