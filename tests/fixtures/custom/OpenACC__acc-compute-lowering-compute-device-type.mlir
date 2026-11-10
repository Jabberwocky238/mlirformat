module {
  func.func @parallel_default_gangs_nvidia_vector_length(%arg0: memref<4xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c4_i32 = arith.constant 4 : i32
    %c32_i32 = arith.constant 32 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<4xi32>) -> memref<4xi32>
    acc.parallel dataOperands(%0 : memref<4xi32>) num_gangs({%c4_i32 : i32}) vector_length(%c32_i32 : i32 [#acc.device_type<nvidia>]) {
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

