module {
  func.func @test_parallel_if(%arg0: memref<10xi32>, %arg1: i1) {
    %c0_i32 = arith.constant 0 : i32
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = acc.copyin varPtr(%arg0 : memref<10xi32>) -> memref<10xi32>
    %1 = acc.create varPtr(%arg0 : memref<10xi32>) -> memref<10xi32> {dataClause = #acc<data_clause acc_copyout>}
    acc.parallel dataOperands(%0, %1 : memref<10xi32>, memref<10xi32>) if(%arg1) {
      scf.for %arg2 = %c1 to %c10 step %c1 {
        memref.store %c0_i32, %arg0[%arg2] : memref<10xi32>
      }
      acc.yield
    }
    acc.delete accPtr(%1 : memref<10xi32>)
    acc.copyout accPtr(%0 : memref<10xi32>) to varPtr(%arg0 : memref<10xi32>)
    return
  }
}

// -----
module {
  func.func @test_parallel_if_multiblock(%arg0: i1, %arg1: i32) {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %alloca = memref.alloca() : memref<i32>
    memref.store %arg1, %alloca[] : memref<i32>
    acc.parallel if(%arg0) {
      cf.br ^bb1
    ^bb1:  // 2 preds: ^bb0, ^bb2
      %0 = memref.load %alloca[] : memref<i32>
      %1 = arith.cmpi sgt, %0, %c0_i32 : i32
      cf.cond_br %1, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      %2 = arith.subi %0, %c1_i32 : i32
      memref.store %2, %alloca[] : memref<i32>
      cf.br ^bb1
    ^bb3:  // pred: ^bb1
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test_kernels_if(%arg0: memref<5xi32>, %arg1: i1) {
    %c1_i32 = arith.constant 1 : i32
    %c1 = arith.constant 1 : index
    %c5 = arith.constant 5 : index
    %0 = acc.copyin varPtr(%arg0 : memref<5xi32>) -> memref<5xi32>
    %1 = acc.create varPtr(%arg0 : memref<5xi32>) -> memref<5xi32> {dataClause = #acc<data_clause acc_copyout>}
    acc.kernels dataOperands(%0, %1 : memref<5xi32>, memref<5xi32>) if(%arg1) {
      scf.for %arg2 = %c1 to %c5 step %c1 {
        memref.store %c1_i32, %arg0[%arg2] : memref<5xi32>
      }
      acc.terminator
    }
    acc.delete accPtr(%1 : memref<5xi32>)
    acc.copyout accPtr(%0 : memref<5xi32>) to varPtr(%arg0 : memref<5xi32>)
    return
  }
}

// -----
module {
  func.func @test_serial_if(%arg0: memref<8xi32>, %arg1: i1) {
    %c2_i32 = arith.constant 2 : i32
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %0 = acc.copyin varPtr(%arg0 : memref<8xi32>) -> memref<8xi32>
    %1 = acc.create varPtr(%arg0 : memref<8xi32>) -> memref<8xi32> {dataClause = #acc<data_clause acc_copyout>}
    acc.serial dataOperands(%0, %1 : memref<8xi32>, memref<8xi32>) if(%arg1) {
      scf.for %arg2 = %c1 to %c8 step %c1 {
        memref.store %c2_i32, %arg0[%arg2] : memref<8xi32>
      }
      acc.yield
    }
    acc.delete accPtr(%1 : memref<8xi32>)
    acc.copyout accPtr(%0 : memref<8xi32>) to varPtr(%arg0 : memref<8xi32>)
    return
  }
}

// -----
module {
  func.func @test_parallel_no_if(%arg0: memref<10xi32>) {
    %c0_i32 = arith.constant 0 : i32
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = acc.copyin varPtr(%arg0 : memref<10xi32>) -> memref<10xi32>
    acc.parallel dataOperands(%0 : memref<10xi32>) {
      scf.for %arg1 = %c1 to %c10 step %c1 {
        memref.store %c0_i32, %arg0[%arg1] : memref<10xi32>
      }
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<10xi32>) to varPtr(%arg0 : memref<10xi32>)
    return
  }
}

// -----
module {
  acc.private.recipe @privatization_memref_i32 : memref<i32> init {
  ^bb0(%arg0: memref<i32>):
    %alloca = memref.alloca() : memref<i32>
    acc.yield %alloca : memref<i32>
  }
  acc.reduction.recipe @reduction_add_memref_f32 : memref<f32> reduction_operator <add> init {
  ^bb0(%arg0: memref<f32>):
    %cst = arith.constant 0.000000e+00 : f32
    %alloca = memref.alloca() : memref<f32>
    memref.store %cst, %alloca[] : memref<f32>
    acc.yield %alloca : memref<f32>
  } combiner {
  ^bb0(%arg0: memref<f32>, %arg1: memref<f32>):
    %0 = memref.load %arg0[] : memref<f32>
    %1 = memref.load %arg1[] : memref<f32>
    %2 = arith.addf %0, %1 : f32
    memref.store %2, %arg0[] : memref<f32>
    acc.yield %arg0 : memref<f32>
  }
  func.func @test_reduction_if(%arg0: memref<f32>, %arg1: memref<8xf32>, %arg2: i1) {
    %c8_i32 = arith.constant 8 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<f32>) -> memref<f32> {dataClause = #acc<data_clause acc_reduction>, implicit = true}
    acc.parallel combined(loop) dataOperands(%0 : memref<f32>) if(%arg2) {
      %1 = acc.reduction varPtr(%arg0 : memref<f32>) recipe(@reduction_add_memref_f32) -> memref<f32>
      %alloca = memref.alloca() : memref<i32>
      %2 = acc.private varPtr(%alloca : memref<i32>) recipe(@privatization_memref_i32) -> memref<i32>
      acc.loop combined(parallel) vector private(%2 : memref<i32>) reduction(%1 : memref<f32>) control(%arg3 : i32) = (%c1_i32 : i32) to (%c8_i32 : i32)  step (%c1_i32 : i32) {
        memref.store %arg3, %2[] : memref<i32>
        %3 = memref.load %2[] : memref<i32>
        %4 = arith.index_cast %3 : i32 to index
        %5 = memref.load %arg1[%4] : memref<8xf32>
        %6 = memref.load %arg0[] : memref<f32>
        %7 = arith.addf %6, %5 : f32
        memref.store %7, %arg0[] : memref<f32>
        acc.yield
      } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<f32>) to varPtr(%arg0 : memref<f32>) {dataClause = #acc<data_clause acc_reduction>, implicit = true}
    return
  }
}

// -----
module {
  func.func @test_acc_var_replacement(%arg0: memref<10xi32>, %arg1: i1) {
    %c0_i32 = arith.constant 0 : i32
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = acc.copyin varPtr(%arg0 : memref<10xi32>) -> memref<10xi32>
    acc.parallel dataOperands(%0 : memref<10xi32>) if(%arg1) {
      scf.for %arg2 = %c1 to %c10 step %c1 {
        memref.store %c0_i32, %0[%arg2] : memref<10xi32>
      }
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<10xi32>) to varPtr(%arg0 : memref<10xi32>)
    return
  }
}

// -----
module {
  acc.firstprivate.recipe @memref_i32 : memref<i32> init {
  ^bb0(%arg0: memref<i32>):
    %alloca = memref.alloca() : memref<i32>
    acc.yield %alloca : memref<i32>
  } copy {
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = memref.load %arg0[] : memref<i32>
    memref.store %0, %arg1[] : memref<i32>
    acc.terminator
  }
  func.func @test_acc_firstprivate(%arg0: memref<10xi32>, %arg1: memref<i32>, %arg2: i1) {
    %c0_i32 = arith.constant 0 : i32
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = acc.copyin varPtr(%arg0 : memref<10xi32>) -> memref<10xi32>
    %1 = acc.firstprivate varPtr(%arg1 : memref<i32>) recipe(@memref_i32) -> memref<i32>
    acc.parallel dataOperands(%0 : memref<10xi32>) firstprivate(%1 : memref<i32>) if(%arg2) {
      %2 = memref.load %1[] : memref<i32>
      %3 = arith.index_cast %2 : i32 to index
      scf.for %arg3 = %c1 to %3 step %c1 {
        memref.store %c0_i32, %0[%arg3] : memref<10xi32>
      }
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<10xi32>) to varPtr(%arg0 : memref<10xi32>)
    return
  }
}

// -----
module {
  acc.reduction.recipe @reduction_add_memref_i32 : memref<i32> reduction_operator <add> init {
  ^bb0(%arg0: memref<i32>):
    %c0_i32 = arith.constant 0 : i32
    %alloca = memref.alloca() : memref<i32>
    memref.store %c0_i32, %alloca[] : memref<i32>
    acc.yield %alloca : memref<i32>
  } combiner {
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = memref.load %arg1[] : memref<i32>
    %1 = memref.load %arg0[] : memref<i32>
    %2 = arith.addi %1, %0 : i32
    memref.store %2, %arg0[] : memref<i32>
    acc.yield %arg0 : memref<i32>
  }
  func.func @test_acc_reduction(%arg0: memref<i32>, %arg1: i1) {
    %c0_i32 = arith.constant 0 : i32
    %0 = acc.reduction varPtr(%arg0 : memref<i32>) recipe(@reduction_add_memref_i32) -> memref<i32>
    acc.parallel if(%arg1) reduction(%0 : memref<i32>) {
      %1 = memref.load %0[] : memref<i32>
      %2 = arith.addi %1, %c0_i32 : i32
      memref.store %2, %0[] : memref<i32>
      acc.yield
    }
    return
  }
  acc.private.recipe @privatization_memref_i32 : memref<i32> init {
  ^bb0(%arg0: memref<i32>):
    %alloca = memref.alloca() : memref<i32>
    acc.yield %alloca : memref<i32>
  }
  func.func @test_acc_private(%arg0: memref<i32>, %arg1: i1) {
    %c0_i32 = arith.constant 0 : i32
    %0 = acc.private varPtr(%arg0 : memref<i32>) recipe(@privatization_memref_i32) -> memref<i32>
    acc.parallel private(%0 : memref<i32>) if(%arg1) {
      memref.store %c0_i32, %0[] : memref<i32>
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test_parallel_if_atomic_capture(%arg0: memref<i32>, %arg1: memref<i32>, %arg2: i1) {
    %c1_i32 = arith.constant 1 : i32
    acc.parallel if(%arg2) {
      acc.atomic.capture {
        acc.atomic.update %arg0 : memref<i32> {
        ^bb0(%arg3: i32):
          %0 = arith.addi %arg3, %c1_i32 : i32
          acc.yield %0 : i32
        }
        acc.atomic.read %arg1 = %arg0 : memref<i32>, memref<i32>, i32
      }
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test_kernels_if_shared_present(%arg0: memref<10xi32>, %arg1: i1) {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = acc.present varPtr(%arg0 : memref<10xi32>) -> memref<10xi32>
    acc.data dataOperands(%0 : memref<10xi32>) {
      acc.kernels dataOperands(%0 : memref<10xi32>) if(%arg1) {
        scf.for %arg2 = %c0 to %c10 step %c1 {
          memref.store %c0_i32, %0[%arg2] : memref<10xi32>
        }
        acc.terminator
      }
      acc.terminator
    }
    return
  }
}

// -----
module {
  func.func @test_sibling_compute_shared_data(%arg0: memref<10xi32>, %arg1: i1, %arg2: i1) {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %0 = acc.copyin varPtr(%arg0 : memref<10xi32>) -> memref<10xi32>
    acc.parallel dataOperands(%0 : memref<10xi32>) if(%arg1) {
      memref.store %c0_i32, %0[%c0] : memref<10xi32>
      acc.yield
    }
    acc.serial dataOperands(%0 : memref<10xi32>) if(%arg2) {
      memref.store %c0_i32, %0[%c0] : memref<10xi32>
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<10xi32>) to varPtr(%arg0 : memref<10xi32>)
    return
  }
}

// -----
module {
  func.func @test_duplicate_data_operand(%arg0: memref<10xi32>, %arg1: i1) {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %0 = acc.copyin varPtr(%arg0 : memref<10xi32>) -> memref<10xi32>
    acc.parallel dataOperands(%0, %0 : memref<10xi32>, memref<10xi32>) if(%arg1) {
      memref.store %c0_i32, %0[%c0] : memref<10xi32>
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<10xi32>) to varPtr(%arg0 : memref<10xi32>)
    return
  }
}

