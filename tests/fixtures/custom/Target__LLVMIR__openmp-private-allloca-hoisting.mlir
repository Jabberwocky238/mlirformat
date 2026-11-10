module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui64, "dlti.global_memory_space" = 1 : ui64>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} {
  llvm.func @foo1()
  llvm.func @foo2()
  llvm.func @foo3()
  llvm.func @foo4()
  omp.private {type = private} @multi_block.privatizer : f32 init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<(i64)> {alignment = 8 : i64} : (i32) -> !llvm.ptr<5>
    %2 = llvm.load %arg0 : !llvm.ptr -> f32
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(2 : i32) : i32
    %5 = llvm.icmp "eq" %3, %4 : i32
    llvm.cond_br %5, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.call @foo1() : () -> ()
    llvm.br ^bb3
  ^bb2:  // pred: ^bb0
    llvm.call @foo2() : () -> ()
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    llvm.store %2, %arg1 : f32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  }
  omp.private {type = private} @multi_block.privatizer2 : f32 init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x !llvm.struct<(ptr)> {alignment = 8 : i64} : (i32) -> !llvm.ptr<5>
    %2 = llvm.load %arg0 : !llvm.ptr -> f32
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(2 : i32) : i32
    %5 = llvm.icmp "eq" %3, %4 : i32
    llvm.cond_br %5, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.call @foo3() : () -> ()
    llvm.br ^bb3
  ^bb2:  // pred: ^bb0
    llvm.call @foo4() : () -> ()
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    llvm.store %2, %arg1 : f32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  }
  llvm.func @parallel_op_private_multi_block(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.ptr) map_clauses(is_device_ptr) capture(ByRef) -> !llvm.ptr {name = ""}
    %1 = omp.map.info var_ptr(%arg1 : !llvm.ptr, !llvm.ptr) map_clauses(is_device_ptr) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target kernel_type(generic) map_entries(%0 -> %arg2, %1 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      omp.parallel private(@multi_block.privatizer %arg2 -> %arg4, @multi_block.privatizer2 %arg3 -> %arg5 : !llvm.ptr, !llvm.ptr) {
        %2 = llvm.load %arg4 : !llvm.ptr -> f32
        %3 = llvm.load %arg5 : !llvm.ptr -> f32
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

