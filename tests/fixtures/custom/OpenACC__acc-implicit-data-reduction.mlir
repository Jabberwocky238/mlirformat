module {
  acc.reduction.recipe @reduction_add_memref_i32 : memref<i32> reduction_operator <add> init {
  ^bb0(%arg0: memref<i32>):
    %c0_i32 = arith.constant 0 : i32
    %alloca = memref.alloca() : memref<i32>
    memref.store %c0_i32, %alloca[] : memref<i32>
    acc.yield %alloca : memref<i32>
  } combiner {
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = memref.load %arg0[] : memref<i32>
    %1 = memref.load %arg1[] : memref<i32>
    %2 = arith.addi %0, %1 : i32
    memref.store %2, %arg0[] : memref<i32>
    acc.yield %arg0 : memref<i32>
  }
  func.func @test_reduction_implicit_copy() {
    %c1_i32 = arith.constant 1 : i32
    %c100_i32 = arith.constant 100 : i32
    %c0_i32 = arith.constant 0 : i32
    %alloca = memref.alloca() : memref<i32>
    memref.store %c0_i32, %alloca[] : memref<i32>
    acc.parallel {
      %0 = acc.reduction varPtr(%alloca : memref<i32>) recipe(@reduction_add_memref_i32) -> memref<i32> {name = "r"}
      acc.loop reduction(%0 : memref<i32>) control(%arg0 : i32) = (%c1_i32 : i32) to (%c100_i32 : i32)  step (%c1_i32 : i32) {
        %1 = memref.load %0[] : memref<i32>
        %2 = arith.addi %1, %c1_i32 : i32
        memref.store %2, %0[] : memref<i32>
        acc.yield
      } attributes {independent = [#acc.device_type<none>]}
      acc.yield
    }
    return
  }
}

// -----
module {
  acc.reduction.recipe @reduction_add_memref_i32_2 : memref<i32> reduction_operator <add> init {
  ^bb0(%arg0: memref<i32>):
    %c0_i32 = arith.constant 0 : i32
    %alloca = memref.alloca() : memref<i32>
    memref.store %c0_i32, %alloca[] : memref<i32>
    acc.yield %alloca : memref<i32>
  } combiner {
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = memref.load %arg0[] : memref<i32>
    %1 = memref.load %arg1[] : memref<i32>
    %2 = arith.addi %0, %1 : i32
    memref.store %2, %arg0[] : memref<i32>
    acc.yield %arg0 : memref<i32>
  }
  func.func @test_reduction_with_usage_outside_loop() {
    %c1_i32 = arith.constant 1 : i32
    %c100_i32 = arith.constant 100 : i32
    %c0_i32 = arith.constant 0 : i32
    %alloca = memref.alloca() : memref<i32>
    %alloca_0 = memref.alloca() : memref<i32>
    memref.store %c0_i32, %alloca[] : memref<i32>
    %0 = acc.create varPtr(%alloca_0 : memref<i32>) -> memref<i32> {dataClause = #acc<data_clause acc_copyout>, name = "out"}
    acc.parallel dataOperands(%0 : memref<i32>) {
      %1 = acc.reduction varPtr(%alloca : memref<i32>) recipe(@reduction_add_memref_i32_2) -> memref<i32> {name = "r"}
      acc.loop reduction(%1 : memref<i32>) control(%arg0 : i32) = (%c1_i32 : i32) to (%c100_i32 : i32)  step (%c1_i32 : i32) {
        %3 = memref.load %1[] : memref<i32>
        %4 = arith.addi %3, %c1_i32 : i32
        memref.store %4, %1[] : memref<i32>
        acc.yield
      } attributes {independent = [#acc.device_type<none>]}
      %2 = memref.load %alloca[] : memref<i32>
      memref.store %2, %0[] : memref<i32>
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<i32>) to varPtr(%alloca_0 : memref<i32>) {name = "out"}
    return
  }
}

