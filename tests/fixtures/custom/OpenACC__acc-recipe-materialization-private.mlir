module {
  acc.private.recipe @privatization_memref_i64 : memref<i64> init {
  ^bb0(%arg0: memref<i64>):
    %alloca = memref.alloca() : memref<i64>
    acc.yield %alloca : memref<i64>
  } destroy {
  ^bb0(%arg0: memref<i64>, %arg1: memref<i64>):
    memref.dealloc %arg1 : memref<i64>
    acc.terminator
  }
  func.func @private_i64(%arg0: memref<i64>) {
    %c16 = arith.constant 16 : index
    %c1 = arith.constant 1 : index
    %0 = acc.private varPtr(%arg0 : memref<i64>) recipe(@privatization_memref_i64) -> memref<i64> {implicit = true, name = ""}
    acc.loop private(%0 : memref<i64>) control(%arg1 : index) = (%c1 : index) to (%c16 : index)  step (%c1 : index) {
      %1 = arith.index_cast %arg1 : index to i64
      memref.store %1, %0[] : memref<i64>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
  func.func @par_private_i64(%arg0: memref<i64>) {
    %c16 = arith.constant 16 : index
    %c1 = arith.constant 1 : index
    %0 = acc.private varPtr(%arg0 : memref<i64>) recipe(@privatization_memref_i64) -> memref<i64> {implicit = true, name = ""}
    acc.parallel private(%0 : memref<i64>) {
      acc.loop control(%arg1 : index) = (%c1 : index) to (%c16 : index)  step (%c1 : index) {
        %1 = arith.index_cast %arg1 : index to i64
        memref.store %1, %0[] : memref<i64>
        acc.yield
      } attributes {independent = [#acc.device_type<none>]}
      acc.yield
    }
    return
  }
}

