module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} {
  omp.private {type = private} @i32_privatizer : i32
  llvm.func @test_nested_target_in_parallel(%arg0: !llvm.ptr) {
    omp.parallel {
      %0 = llvm.mlir.constant(4 : index) : i64
      %1 = llvm.mlir.constant(1 : index) : i64
      %2 = omp.map.bounds lower_bound(%1 : i64) upper_bound(%0 : i64) stride(%1 : i64) start_idx(%1 : i64)
      %3 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.array<10 x i32>) map_clauses(tofrom) capture(ByRef) bounds(%2) -> !llvm.ptr {name = ""}
      omp.target map_entries(%3 -> %arg1 : !llvm.ptr) {
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.func @test_nested_target_in_wsloop(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    %3 = llvm.mlir.constant(10 : i32) : i32
    %4 = llvm.mlir.constant(1 : i32) : i32
    omp.wsloop private(@i32_privatizer %2 -> %arg1 : !llvm.ptr) {
      omp.loop_nest (%arg2) : i32 = (%4) to (%3) inclusive step (%4) {
        llvm.store %arg2, %arg1 : i32, !llvm.ptr
        %5 = llvm.mlir.constant(4 : index) : i64
        %6 = llvm.mlir.constant(1 : index) : i64
        %7 = omp.map.bounds lower_bound(%6 : i64) upper_bound(%5 : i64) stride(%6 : i64) start_idx(%6 : i64)
        %8 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.array<10 x i32>) map_clauses(tofrom) capture(ByRef) bounds(%7) -> !llvm.ptr {name = ""}
        omp.target map_entries(%8 -> %arg3 : !llvm.ptr) {
          omp.terminator
        }
        omp.yield
      }
    }
    llvm.return
  }
  llvm.func @test_nested_target_in_parallel_with_private(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    omp.parallel private(@i32_privatizer %2 -> %arg1 : !llvm.ptr) {
      %3 = llvm.mlir.constant(1 : index) : i64
      %4 = llvm.load %arg1 : !llvm.ptr -> i64
      %5 = omp.map.bounds lower_bound(%3 : i64) upper_bound(%4 : i64) stride(%3 : i64) start_idx(%3 : i64)
      %6 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.array<10 x i32>) map_clauses(tofrom) capture(ByRef) bounds(%5) -> !llvm.ptr {name = ""}
      omp.target map_entries(%6 -> %arg2 : !llvm.ptr) {
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.func @test_nested_target_in_task_with_private(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    omp.task private(@i32_privatizer %2 -> %arg1 : !llvm.ptr) {
      %3 = llvm.mlir.constant(1 : index) : i64
      %4 = llvm.load %arg1 : !llvm.ptr -> i64
      %5 = omp.map.bounds lower_bound(%3 : i64) upper_bound(%4 : i64) stride(%3 : i64) start_idx(%3 : i64)
      %6 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.array<10 x i32>) map_clauses(tofrom) capture(ByRef) bounds(%5) -> !llvm.ptr {name = ""}
      omp.target map_entries(%6 -> %arg2 : !llvm.ptr) {
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
  llvm.func @test_target_and_atomic_update(%arg0: !llvm.ptr, %arg1: i32) {
    omp.target {
      omp.terminator
    }
    omp.atomic.update %arg0 : !llvm.ptr {
    ^bb0(%arg2: i32):
      %0 = llvm.add %arg2, %arg1 : i32
      omp.yield(%0 : i32)
    }
    llvm.return
  }
}

