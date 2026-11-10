module {
  acc.private.recipe @privatization_memref_i32 : memref<i32> init {
  ^bb0(%arg0: memref<i32>):
    %alloca = memref.alloca() : memref<i32>
    acc.yield %alloca : memref<i32>
  }
  func.func @kpriv_(%arg0: memref<i32>, %arg1: memref<32xi32>) {
    %c1 = arith.constant 1 : index
    %c32 = arith.constant 32 : index
    %alloca = memref.alloca() : memref<i32>
    %0 = memref.load %arg0[] : memref<i32>
    memref.store %0, %alloca[] : memref<i32>
    %1 = acc.copyin varPtr(%arg1 : memref<32xi32>) -> memref<32xi32> {dataClause = #acc<data_clause acc_copy>, implicit = true, name = "a"}
    %2 = acc.private varPtr(%alloca : memref<i32>) recipe(@privatization_memref_i32) -> memref<i32> {implicit = true, name = "s"}
    acc.kernels dataOperands(%1 : memref<32xi32>) private(%2 : memref<i32>) {
      acc.loop control(%arg2 : index) = (%c1 : index) to (%c32 : index)  step (%c1 : index) {
        %3 = arith.index_cast %arg2 : index to i32
        memref.store %3, %alloca[] : memref<i32>
        %4 = memref.load %2[] : memref<i32>
        memref.store %4, %1[%arg2] : memref<32xi32>
        acc.yield
      } attributes {inclusiveUpperbound = array<i1: true>, independent = [#acc.device_type<none>]}
      acc.terminator
    }
    acc.copyout accPtr(%1 : memref<32xi32>) to varPtr(%arg1 : memref<32xi32>) {dataClause = #acc<data_clause acc_copy>, implicit = true, name = "a"}
    return
  }
}

