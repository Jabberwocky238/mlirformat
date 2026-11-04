module {
  llvm.func @parallel_op_firstprivate(%arg0: !llvm.ptr) {
    omp.parallel private(@x.privatizer %arg0 -> %arg1 : !llvm.ptr) {
      %0 = llvm.load %arg1 : !llvm.ptr -> f32
      omp.terminator
    }
    llvm.return
  }
  omp.private {type = firstprivate} @x.privatizer : f32 copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> f32
    llvm.store %0, %arg1 : f32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  }
}

// -----
module {
  llvm.func @parallel_op_firstprivate_multi_block(%arg0: !llvm.ptr) {
    omp.parallel private(@multi_block.privatizer %arg0 -> %arg1 : !llvm.ptr) {
      %0 = llvm.load %arg1 : !llvm.ptr -> f32
      omp.terminator
    }
    llvm.return
  }
  omp.private {type = firstprivate} @multi_block.privatizer : f32 init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    omp.yield(%arg1 : !llvm.ptr)
  } copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> f32
    llvm.br ^bb1(%0, %arg1 : f32, !llvm.ptr)
  ^bb1(%1: f32, %2: !llvm.ptr):  // pred: ^bb0
    llvm.store %1, %2 : f32, !llvm.ptr
    omp.yield(%2 : !llvm.ptr)
  }
}

// -----
module {
  llvm.func @non_const_len_char_test(%arg0: !llvm.ptr {fir.bindc_name = "n"}) {
    %0 = llvm.load %arg0 : !llvm.ptr -> i64
    %1 = llvm.alloca %0 x i8 {bindc_name = "str"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.undef : !llvm.struct<(ptr, i64)>
    %3 = llvm.insertvalue %1, %2[0] : !llvm.struct<(ptr, i64)> 
    omp.parallel private(@non_const_len_char %3 -> %arg1 : !llvm.struct<(ptr, i64)>) {
      %4 = llvm.extractvalue %arg1[0] : !llvm.struct<(ptr, i64)> 
      omp.terminator
    }
    llvm.return
  }
  omp.private {type = firstprivate} @non_const_len_char : !llvm.struct<(ptr, i64)> init {
  ^bb0(%arg0: !llvm.struct<(ptr, i64)>, %arg1: !llvm.struct<(ptr, i64)>):
    %0 = llvm.extractvalue %arg0[1] : !llvm.struct<(ptr, i64)> 
    %1 = llvm.alloca %0 x i8 {bindc_name = "str", pinned} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.undef : !llvm.struct<(ptr, i64)>
    %3 = llvm.insertvalue %1, %2[0] : !llvm.struct<(ptr, i64)> 
    omp.yield(%3 : !llvm.struct<(ptr, i64)>)
  } copy {
  ^bb0(%arg0: !llvm.struct<(ptr, i64)>, %arg1: !llvm.struct<(ptr, i64)>):
    llvm.call @foo() : () -> ()
    omp.yield(%arg1 : !llvm.struct<(ptr, i64)>)
  }
  llvm.func @foo()
}

// -----
module {
  omp.private {type = firstprivate} @global_privatizer : f32 copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> f32
    llvm.store %0, %arg1 : f32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  }
  llvm.func @global_accessor() {
    %0 = llvm.mlir.addressof @global : !llvm.ptr
    omp.parallel private(@global_privatizer %0 -> %arg0 : !llvm.ptr) {
      %1 = llvm.mlir.constant(3.140000e+00 : f32) : f32
      llvm.store %1, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  llvm.mlir.global internal @global() {addr_space = 0 : i32} : f32 {
    %0 = llvm.mlir.zero : f32
    llvm.return %0 : f32
  }
}

