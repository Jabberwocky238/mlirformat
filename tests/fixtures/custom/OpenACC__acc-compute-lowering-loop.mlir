module {
  func.func @parallel_independent_loop(%arg0: memref<16xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    %0 = acc.copyin varPtr(%arg0 : memref<16xi32>) -> memref<16xi32>
    acc.parallel dataOperands(%0 : memref<16xi32>) {
      acc.loop control(%arg1 : index) = (%c0 : index) to (%c16 : index)  step (%c1 : index) {
        %1 = arith.index_cast %arg1 : index to i32
        memref.store %1, %0[%arg1] : memref<16xi32>
        acc.yield
      } attributes {independent = [#acc.device_type<none>]}
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<16xi32>) to varPtr(%arg0 : memref<16xi32>)
    return
  }
}

// -----
module {
  func.func @parallel_loop_multi_block_body(%arg0: memref<4xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = acc.copyin varPtr(%arg0 : memref<4xi32>) -> memref<4xi32>
    acc.parallel dataOperands(%0 : memref<4xi32>) {
      acc.loop control(%arg1 : index) = (%c0 : index) to (%c4 : index)  step (%c1 : index) {
        %1 = arith.index_cast %arg1 : index to i32
        memref.store %1, %0[%arg1] : memref<4xi32>
        cf.br ^bb1
      ^bb1:  // pred: ^bb0
        acc.yield
      } attributes {independent = [#acc.device_type<none>]}
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<4xi32>) to varPtr(%arg0 : memref<4xi32>)
    return
  }
}

// -----
module {
  func.func @parallel_loop_auto_collapse(%arg0: memref<1xi32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = acc.copyin varPtr(%arg0 : memref<1xi32>) -> memref<1xi32>
    acc.parallel dataOperands(%0 : memref<1xi32>) {
      acc.loop control(%arg5 : index, %arg6 : index) = (%arg1, %arg3 : index, index) to (%arg2, %arg4 : index, index)  step (%c1, %c1 : index, index) {
        %1 = arith.index_cast %arg5 : index to i32
        memref.store %1, %0[%c0] : memref<1xi32>
        acc.yield
      } attributes {auto_ = [#acc.device_type<none>]}
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<1xi32>) to varPtr(%arg0 : memref<1xi32>)
    return
  }
}

// -----
module {
  func.func @serial_loop_normalized(%arg0: memref<1xi32>) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c5 = arith.constant 5 : index
    %c9 = arith.constant 9 : index
    %0 = acc.copyin varPtr(%arg0 : memref<1xi32>) -> memref<1xi32>
    acc.serial dataOperands(%0 : memref<1xi32>) {
      acc.loop control(%arg1 : index) = (%c5 : index) to (%c9 : index)  step (%c2 : index) {
        %1 = arith.index_cast %arg1 : index to i32
        memref.store %1, %0[%c0] : memref<1xi32>
        acc.yield
      } attributes {independent = [#acc.device_type<none>]}
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<1xi32>) to varPtr(%arg0 : memref<1xi32>)
    return
  }
}

// -----
module {
  func.func @orphan_loop(%arg0: memref<8xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c0_i32 = arith.constant 0 : i32
    acc.loop control(%arg1 : index) = (%c0 : index) to (%c8 : index)  step (%c1 : index) {
      memref.store %c0_i32, %arg0[%arg1] : memref<8xi32>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
}

// -----
module {
  acc.routine @routine_with_loop func(@device_routine_with_loop) seq 
  func.func @device_routine_with_loop(%arg0: memref<8xi32>) attributes {acc.specialized_routine = #acc.specialized_routine<@routine_with_loop, <seq>, "host_routine_with_loop">} {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c0_i32 = arith.constant 0 : i32
    acc.loop control(%arg1 : index) = (%c0 : index) to (%c8 : index)  step (%c1 : index) {
      memref.store %c0_i32, %arg0[%arg1] : memref<8xi32>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
}

// -----
module {
  acc.routine @routine_vector_with_loop func(@device_routine_vector_with_loop) vector 
  func.func @device_routine_vector_with_loop(%arg0: memref<8xi32>) attributes {acc.specialized_routine = #acc.specialized_routine<@routine_vector_with_loop, <vector>, "host_routine_vector_with_loop">} {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c0_i32 = arith.constant 0 : i32
    acc.loop vector control(%arg1 : index) = (%c0 : index) to (%c8 : index)  step (%c1 : index) {
      memref.store %c0_i32, %arg0[%arg1] : memref<8xi32>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
}

// -----
module {
  func.func @parallel_loop_auto_gang(%arg0: memref<1xi32>) {
    %c0 = arith.constant 0 : index
    %c1_i32 = arith.constant 1 : i32
    %c10_i32 = arith.constant 10 : i32
    %c100_i32 = arith.constant 100 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<1xi32>) -> memref<1xi32>
    acc.parallel dataOperands(%0 : memref<1xi32>) num_gangs({%c10_i32 : i32}) {
      acc.loop gang control(%arg1 : i32) = (%c1_i32 : i32) to (%c100_i32 : i32)  step (%c1_i32 : i32) {
        memref.store %arg1, %0[%c0] : memref<1xi32>
        acc.yield
      } attributes {auto_ = [#acc.device_type<none>]}
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<1xi32>) to varPtr(%arg0 : memref<1xi32>)
    return
  }
}

