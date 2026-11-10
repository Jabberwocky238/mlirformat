module {
  func.func @parallel_gang_loop(%arg0: memref<1xi32>) {
    %c0 = arith.constant 0 : index
    %c1_i32 = arith.constant 1 : i32
    %c10_i32 = arith.constant 10 : i32
    %c100_i32 = arith.constant 100 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<1xi32>) -> memref<1xi32>
    acc.parallel dataOperands(%0 : memref<1xi32>) num_gangs({%c10_i32 : i32}) {
      acc.loop gang control(%arg1 : i32) = (%c1_i32 : i32) to (%c100_i32 : i32)  step (%c1_i32 : i32) {
        memref.store %arg1, %0[%c0] : memref<1xi32>
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
  func.func @parallel_seq_loop(%arg0: memref<4xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c10_i32 = arith.constant 10 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<4xi32>) -> memref<4xi32>
    acc.parallel dataOperands(%0 : memref<4xi32>) num_gangs({%c10_i32 : i32}) {
      acc.loop control(%arg1 : index) = (%c0 : index) to (%c4 : index)  step (%c1 : index) {
        %1 = arith.index_cast %arg1 : index to i32
        memref.store %1, %0[%arg1] : memref<4xi32>
        acc.yield
      } attributes {seq = [#acc.device_type<none>]}
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<4xi32>) to varPtr(%arg0 : memref<4xi32>)
    return
  }
}

// -----
module {
  func.func @serial_loop(%arg0: memref<4xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = acc.copyin varPtr(%arg0 : memref<4xi32>) -> memref<4xi32>
    acc.serial dataOperands(%0 : memref<4xi32>) {
      acc.loop control(%arg1 : index) = (%c0 : index) to (%c4 : index)  step (%c1 : index) {
        %1 = arith.index_cast %arg1 : index to i32
        memref.store %1, %0[%arg1] : memref<4xi32>
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
  func.func @kernels_loop(%arg0: memref<8xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %0 = acc.copyin varPtr(%arg0 : memref<8xi32>) -> memref<8xi32>
    acc.kernels dataOperands(%0 : memref<8xi32>) {
      acc.loop control(%arg1 : index) = (%c0 : index) to (%c8 : index)  step (%c1 : index) {
        %1 = arith.index_cast %arg1 : index to i32
        memref.store %1, %0[%arg1] : memref<8xi32>
        acc.yield
      } attributes {independent = [#acc.device_type<none>]}
      acc.terminator
    }
    acc.copyout accPtr(%0 : memref<8xi32>) to varPtr(%arg0 : memref<8xi32>)
    return
  }
}

// -----
module {
  func.func @constant_livein_materialized_into_compute_region(%arg0: memref<1xi32>) {
    %c0 = arith.constant 0 : index
    %c42_i32 = arith.constant 42 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<1xi32>) -> memref<1xi32>
    acc.serial dataOperands(%0 : memref<1xi32>) {
      memref.store %c42_i32, %0[%c0] : memref<1xi32>
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<1xi32>) to varPtr(%arg0 : memref<1xi32>)
    return
  }
}

// -----
module {
  func.func @parallel_unit_launch_serial_loops(%arg0: memref<4xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c1_i32 = arith.constant 1 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<4xi32>) -> memref<4xi32>
    acc.parallel dataOperands(%0 : memref<4xi32>) num_gangs({%c1_i32 : i32}) num_workers(%c1_i32 : i32) vector_length(%c1_i32 : i32) {
      acc.loop control(%arg1 : index) = (%c0 : index) to (%c4 : index)  step (%c1 : index) {
        %1 = arith.index_cast %arg1 : index to i32
        memref.store %1, %0[%arg1] : memref<4xi32>
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
  func.func @kernels_unit_launch_serial_loops(%arg0: memref<4xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c1_i32 = arith.constant 1 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<4xi32>) -> memref<4xi32>
    acc.kernels dataOperands(%0 : memref<4xi32>) num_gangs({%c1_i32 : i32}) num_workers(%c1_i32 : i32) vector_length(%c1_i32 : i32) {
      acc.loop control(%arg1 : index) = (%c0 : index) to (%c4 : index)  step (%c1 : index) {
        %1 = arith.index_cast %arg1 : index to i32
        memref.store %1, %0[%arg1] : memref<4xi32>
        acc.yield
      } attributes {independent = [#acc.device_type<none>]}
      acc.terminator
    }
    acc.copyout accPtr(%0 : memref<4xi32>) to varPtr(%arg0 : memref<4xi32>)
    return
  }
}

// -----
module {
  func.func @parallel_vector_length32_independent(%arg0: memref<4xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c1_i32 = arith.constant 1 : i32
    %c32_i32 = arith.constant 32 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<4xi32>) -> memref<4xi32>
    acc.parallel dataOperands(%0 : memref<4xi32>) num_gangs({%c1_i32 : i32}) num_workers(%c1_i32 : i32) vector_length(%c32_i32 : i32) {
      acc.loop vector control(%arg1 : index) = (%c0 : index) to (%c4 : index)  step (%c1 : index) {
        %1 = arith.index_cast %arg1 : index to i32
        memref.store %1, %0[%arg1] : memref<4xi32>
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
  func.func @kernels_num_gangs4_independent(%arg0: memref<4xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c1_i32 = arith.constant 1 : i32
    %c4_i32 = arith.constant 4 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<4xi32>) -> memref<4xi32>
    acc.kernels dataOperands(%0 : memref<4xi32>) num_gangs({%c4_i32 : i32}) num_workers(%c1_i32 : i32) vector_length(%c1_i32 : i32) {
      acc.loop vector control(%arg1 : index) = (%c0 : index) to (%c4 : index)  step (%c1 : index) {
        %1 = arith.index_cast %arg1 : index to i32
        memref.store %1, %0[%arg1] : memref<4xi32>
        acc.yield
      } attributes {independent = [#acc.device_type<none>]}
      acc.terminator
    }
    acc.copyout accPtr(%0 : memref<4xi32>) to varPtr(%arg0 : memref<4xi32>)
    return
  }
}

// -----
module {
  func.func @parallel_num_gangs_1_2_independent(%arg0: memref<4xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<4xi32>) -> memref<4xi32>
    acc.parallel dataOperands(%0 : memref<4xi32>) num_gangs({%c1_i32 : i32, %c2_i32 : i32}) num_workers(%c1_i32 : i32) vector_length(%c1_i32 : i32) {
      acc.loop vector control(%arg1 : index) = (%c0 : index) to (%c4 : index)  step (%c1 : index) {
        %1 = arith.index_cast %arg1 : index to i32
        memref.store %1, %0[%arg1] : memref<4xi32>
        acc.yield
      } attributes {independent = [#acc.device_type<none>]}
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<4xi32>) to varPtr(%arg0 : memref<4xi32>)
    return
  }
}

