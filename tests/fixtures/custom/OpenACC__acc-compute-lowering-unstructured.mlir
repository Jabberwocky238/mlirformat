module {
  func.func @parallel_unstructured_loop(%arg0: memref<10xi32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %c1_i32 = arith.constant 1 : i32
    %0 = acc.copyin varPtr(%arg0 : memref<10xi32>) -> memref<10xi32>
    acc.parallel dataOperands(%0 : memref<10xi32>) {
      acc.loop {
        cf.br ^bb1(%c0 : index)
      ^bb1(%1: index):  // 2 preds: ^bb0, ^bb2
        %2 = arith.cmpi ult, %1, %c10 : index
        cf.cond_br %2, ^bb2, ^bb3
      ^bb2:  // pred: ^bb1
        memref.store %c1_i32, %0[%1] : memref<10xi32>
        %3 = arith.addi %1, %c1 : index
        cf.br ^bb1(%3 : index)
      ^bb3:  // pred: ^bb1
        acc.yield
      } attributes {independent = [#acc.device_type<none>], unstructured}
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<10xi32>) to varPtr(%arg0 : memref<10xi32>)
    return
  }
}

