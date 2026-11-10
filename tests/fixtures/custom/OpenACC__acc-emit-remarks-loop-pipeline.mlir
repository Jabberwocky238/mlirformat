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

