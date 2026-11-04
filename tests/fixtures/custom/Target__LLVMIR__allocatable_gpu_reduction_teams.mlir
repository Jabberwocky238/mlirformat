module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui64, "dlti.global_memory_space" = 1 : ui64>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} {
  omp.private {type = private} @_QFfooEi_private_i32 : i32
  omp.declare_reduction @add_reduction_byref_box_heap_f32 : !llvm.ptr attributes {byref_element_type = f32} alloc {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> : (i64) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    omp.yield(%2 : !llvm.ptr)
  } init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg1 : !llvm.ptr)
  } combiner {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> {alignment = 8 : i64} : (i32) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.alloca %3 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)> {alignment = 8 : i64} : (i32) -> !llvm.ptr<5>
    %5 = llvm.addrspacecast %4 : !llvm.ptr<5> to !llvm.ptr
    %6 = llvm.mlir.constant(24 : i32) : i32
    "llvm.intr.memcpy"(%5, %arg0, %6) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %7 = llvm.mlir.constant(24 : i32) : i32
    "llvm.intr.memcpy"(%2, %arg1, %7) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    %8 = llvm.getelementptr %5[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>
    %9 = llvm.load %8 : !llvm.ptr -> !llvm.ptr
    %10 = llvm.getelementptr %2[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>
    %11 = llvm.load %10 : !llvm.ptr -> !llvm.ptr
    %12 = llvm.load %9 : !llvm.ptr -> f32
    %13 = llvm.load %11 : !llvm.ptr -> f32
    %14 = llvm.fadd %12, %13 {fastmathFlags = #llvm.fastmath<contract>} : f32
    llvm.store %14, %9 : f32, !llvm.ptr
    omp.yield(%arg0 : !llvm.ptr)
  } data_ptr_ptr {
  ^bb0(%arg0: !llvm.ptr):
    %0 = llvm.getelementptr %arg0[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>
    omp.yield(%0 : !llvm.ptr)
  }
  llvm.func @foo_() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i1 : (i64) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    %3 = llvm.getelementptr %2[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>
    %4 = omp.map.info var_ptr(%2 : !llvm.ptr, f32) map_clauses(tofrom) capture(ByRef) var_ptr_ptr(%3 : !llvm.ptr) -> !llvm.ptr {name = ""}
    %5 = omp.map.info var_ptr(%2 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(always, to, attach) capture(ByRef) members(%4 : [0] : !llvm.ptr) -> !llvm.ptr {name = "scalar_alloc"}
    omp.target map_entries(%5 -> %arg0 : !llvm.ptr) {
      %6 = llvm.mlir.constant(1000000 : i32) : i32
      %7 = llvm.mlir.constant(1 : i32) : i32
      omp.teams reduction(byref @add_reduction_byref_box_heap_f32 %arg0 -> %arg1 : !llvm.ptr) {
        omp.parallel {
          omp.distribute {
            omp.wsloop reduction(byref @add_reduction_byref_box_heap_f32 %arg1 -> %arg2 : !llvm.ptr) {
              omp.loop_nest (%arg3) : i32 = (%7) to (%6) inclusive step (%7) {
                omp.yield
              }
            } {omp.composite}
          } {omp.composite}
          omp.terminator
        } {omp.composite}
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

