module {
  llvm.func @parallel_op_1_private(%arg0: !llvm.ptr) {
    omp.parallel private(@x.privatizer %arg0 -> %arg1 : !llvm.ptr) {
      %0 = llvm.load %arg1 : !llvm.ptr -> f32
      omp.terminator
    }
    llvm.return
  }
  llvm.func @parallel_op_2_privates(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    omp.parallel private(@x.privatizer %arg0 -> %arg2, @y.privatizer %arg1 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      %0 = llvm.load %arg2 : !llvm.ptr -> f32
      %1 = llvm.load %arg3 : !llvm.ptr -> i32
      omp.terminator
    }
    llvm.return
  }
  omp.private {type = private} @x.privatizer : f32 init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.load %arg0 : !llvm.ptr -> f32
    llvm.store %1, %arg1 : f32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  }
  omp.private {type = private} @y.privatizer : i32 init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.load %arg0 : !llvm.ptr -> i32
    llvm.store %1, %arg1 : i32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  }
}

// -----
module {
  llvm.func @parallel_op_private_multi_block(%arg0: !llvm.ptr) {
    omp.parallel private(@multi_block.privatizer %arg0 -> %arg1 : !llvm.ptr) {
      %0 = llvm.load %arg1 : !llvm.ptr -> f32
      omp.terminator
    }
    llvm.return
  }
  omp.private {type = private} @multi_block.privatizer : f32 init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    llvm.br ^bb1(%arg0, %arg1 : !llvm.ptr, !llvm.ptr)
  ^bb1(%0: !llvm.ptr, %1: !llvm.ptr):  // pred: ^bb0
    %2 = llvm.load %0 : !llvm.ptr -> f32
    llvm.store %2, %1 : f32, !llvm.ptr
    omp.yield(%1 : !llvm.ptr)
  }
  llvm.func @lower_region_with_addressof() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x f64 {bindc_name = "u1"} : (i64) -> !llvm.ptr
    omp.parallel private(@_QFlower_region_with_addressof_privatizer %1 -> %arg0 : !llvm.ptr) {
      %2 = llvm.mlir.constant(111 : i64) : i64
      %3 = llvm.getelementptr %arg0[%2] : (!llvm.ptr, i64) -> !llvm.ptr, f64
      llvm.call @bar(%3) : (!llvm.ptr) -> ()
      %4 = llvm.mlir.constant(222 : i64) : i64
      %5 = llvm.mlir.addressof @_QQfoo : !llvm.ptr
      %6 = llvm.getelementptr %5[%4] : (!llvm.ptr, i64) -> !llvm.ptr, f64
      llvm.call @bar(%6) : (!llvm.ptr) -> ()
      omp.terminator
    }
    llvm.return
  }
  omp.private {type = private} @_QFlower_region_with_addressof_privatizer : !llvm.ptr init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.addressof @_QQfoo : !llvm.ptr
    omp.yield(%0 : !llvm.ptr)
  }
  llvm.mlir.global linkonce constant @_QQfoo() {addr_space = 0 : i32} : !llvm.array<3 x i8> {
    %0 = llvm.mlir.constant("foo") : !llvm.array<3 x i8>
    llvm.return %0 : !llvm.array<3 x i8>
  }
  llvm.func @bar(!llvm.ptr)
  llvm.func @private_and_reduction_() attributes {fir.internal_name = "_QPprivate_and_reduction", frame_pointer = #llvm.framePointerKind<all>, target_cpu = "x86-64"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x f32 {bindc_name = "to_priv"} : (i64) -> !llvm.ptr
    omp.parallel private(@privatizer.part %2 -> %arg0 : !llvm.ptr) reduction(byref @reducer.part %1 -> %arg1 : !llvm.ptr) {
      %3 = llvm.load %arg1 : !llvm.ptr -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
      %4 = llvm.mlir.constant(8.000000e+00 : f32) : f32
      llvm.store %4, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  omp.private {type = private} @privatizer.part : f32
  omp.declare_reduction @reducer.part : !llvm.ptr alloc {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> : (i64) -> !llvm.ptr
    omp.yield(%1 : !llvm.ptr)
  } init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg1 : !llvm.ptr)
  } combiner {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg0 : !llvm.ptr)
  } cleanup {
  ^bb0(%arg0: !llvm.ptr):
    omp.yield
  }
}

// -----
module {
  llvm.func @_QPequivalence() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.array<4 x i8> : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(0 : index) : i64
    %3 = llvm.getelementptr %1[0, %2] : (!llvm.ptr, i64) -> !llvm.ptr, !llvm.array<4 x i8>
    omp.parallel private(@_QFequivalenceEx_firstprivate_ptr_f32 %3 -> %arg0 : !llvm.ptr) {
      %4 = llvm.mlir.constant(3.140000e+00 : f32) : f32
      llvm.store %4, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  omp.private {type = firstprivate} @_QFequivalenceEx_firstprivate_ptr_f32 : f32 copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> f32
    llvm.store %0, %arg1 : f32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  }
}

// -----
module {
  omp.private {type = private} @_QFEi_private_i32 : i32
  llvm.func @_QPprivate_alloc_with_switch() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(30 : i32) : i32
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "n"} : (i64) -> !llvm.ptr
    %4 = llvm.alloca %2 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    llvm.store %0, %3 : i32, !llvm.ptr
    %5 = llvm.load %3 : !llvm.ptr -> i32
    llvm.switch %5 : i32, ^bb1 [
      1: ^bb1,
      2: ^bb2
    ]
  ^bb1:  // 2 preds: ^bb0, ^bb0
    omp.simd private(@_QFEi_private_i32 %4 -> %arg0 : !llvm.ptr) {
      omp.loop_nest (%arg1) : i32 = (%0) to (%1) inclusive step (%0) {
        llvm.store %arg1, %arg0 : i32, !llvm.ptr
        omp.yield
      }
    }
    llvm.br ^bb2
  ^bb2:  // 2 preds: ^bb0, ^bb1
    llvm.return
  }
}

