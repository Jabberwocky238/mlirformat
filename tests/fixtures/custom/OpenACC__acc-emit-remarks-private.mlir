module {
  acc.firstprivate.recipe @firstprivatization_memref_i32 : memref<i32> init {
  ^bb0(%arg0: memref<i32>):
    %alloca = memref.alloca() : memref<i32>
    acc.yield %alloca : memref<i32>
  } copy {
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = memref.load %arg0[] : memref<i32>
    memref.store %0, %arg1[] : memref<i32>
    acc.terminator
  } destroy {
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    memref.dealloc %arg1 : memref<i32>
    acc.terminator
  }
  acc.private.recipe @privatization_memref_i64 : memref<i64> init {
  ^bb0(%arg0: memref<i64>):
    %alloca = memref.alloca() : memref<i64>
    acc.yield %alloca : memref<i64>
  } destroy {
  ^bb0(%arg0: memref<i64>, %arg1: memref<i64>):
    memref.dealloc %arg1 : memref<i64>
    acc.terminator
  }
  func.func @firstpriv_implicit() {
    %c1336_i32 = arith.constant 1336 : i32
    %alloca = memref.alloca() : memref<i32>
    memref.store %c1336_i32, %alloca[] : memref<i32>
    %0 = acc.firstprivate varPtr(%alloca : memref<i32>) recipe(@firstprivatization_memref_i32) -> memref<i32> {implicit = true, name = "t"}
    acc.parallel firstprivate(%0 : memref<i32>) {
      %c1_i32 = arith.constant 1 : i32
      %1 = memref.load %0[] : memref<i32>
      %2 = arith.addi %1, %c1_i32 : i32
      memref.store %2, %0[] : memref<i32>
      acc.yield
    }
    return
  }
  func.func @firstpriv_explicit() {
    %c1336_i32 = arith.constant 1336 : i32
    %alloca = memref.alloca() : memref<i32>
    memref.store %c1336_i32, %alloca[] : memref<i32>
    %0 = acc.firstprivate varPtr(%alloca : memref<i32>) recipe(@firstprivatization_memref_i32) -> memref<i32> {name = "t"}
    acc.parallel firstprivate(%0 : memref<i32>) {
      %c1_i32 = arith.constant 1 : i32
      %1 = memref.load %0[] : memref<i32>
      %2 = arith.addi %1, %c1_i32 : i32
      memref.store %2, %0[] : memref<i32>
      acc.yield
    }
    return
  }
  func.func @private_loop_implicit(%arg0: memref<i64>) {
    %c16 = arith.constant 16 : index
    %c1 = arith.constant 1 : index
    %0 = acc.private varPtr(%arg0 : memref<i64>) recipe(@privatization_memref_i64) -> memref<i64> {implicit = true, name = "x"}
    acc.loop private(%0 : memref<i64>) control(%arg1 : index) = (%c1 : index) to (%c16 : index)  step (%c1 : index) {
      %1 = arith.index_cast %arg1 : index to i64
      memref.store %1, %0[] : memref<i64>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
  func.func @private_loop_unknown(%arg0: memref<i64>) {
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
  func.func @private_explicit(%arg0: memref<i64>) {
    %c16 = arith.constant 16 : index
    %c1 = arith.constant 1 : index
    %0 = acc.private varPtr(%arg0 : memref<i64>) recipe(@privatization_memref_i64) -> memref<i64> {name = "x"}
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
  func.func @multi_private_implicit(%arg0: memref<i64>, %arg1: memref<i64>) {
    %0 = acc.private varPtr(%arg0 : memref<i64>) recipe(@privatization_memref_i64) -> memref<i64> {implicit = true, name = "a"}
    %1 = acc.private varPtr(%arg1 : memref<i64>) recipe(@privatization_memref_i64) -> memref<i64> {implicit = true, name = "b"}
    acc.parallel private(%0, %1 : memref<i64>, memref<i64>) {
      acc.yield
    }
    return
  }
}

