module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui64, "dlti.global_memory_space" = 1 : ui64>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} {
  llvm.func @bar()
  llvm.func @baz()
  omp.declare_reduction @add_reduction_byref_box_5xf32 : !llvm.ptr attributes {byref_element_type = !llvm.array<5 x f32>} alloc {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> : (i64) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    omp.yield(%2 : !llvm.ptr)
  } init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg1 : !llvm.ptr)
  } combiner {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    llvm.call @bar() : () -> ()
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.call @baz() : () -> ()
    omp.yield(%arg0 : !llvm.ptr)
  } data_ptr_ptr {
  ^bb0(%arg0: !llvm.ptr):
    %0 = llvm.getelementptr %arg0[0, 0] : (!llvm.ptr) -> !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>
    omp.yield(%0 : !llvm.ptr)
  }
  llvm.func @foo_() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.array<5 x f32> {bindc_name = "x"} : (i64) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    %3 = omp.map.info var_ptr(%2 : !llvm.ptr, !llvm.array<5 x f32>) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = "x"}
    omp.target map_entries(%3 -> %arg0 : !llvm.ptr) {
      %4 = llvm.mlir.constant(1 : i32) : i32
      %5 = llvm.mlir.constant(10 : i32) : i32
      omp.teams reduction(byref @add_reduction_byref_box_5xf32 %arg0 -> %arg1 : !llvm.ptr) {
        omp.parallel {
          omp.distribute {
            omp.wsloop {
              omp.loop_nest (%arg2) : i32 = (%4) to (%5) inclusive step (%4) {
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

