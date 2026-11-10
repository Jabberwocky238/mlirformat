module {
  acc.private.recipe @privatization_memref_index : memref<index> init {
  ^bb0(%arg0: memref<index>):
    %alloca = memref.alloca() : memref<index>
    acc.yield %alloca : memref<index>
  } destroy {
  ^bb0(%arg0: memref<index>, %arg1: memref<index>):
    memref.dealloc %arg1 : memref<index>
    acc.terminator
  }
  acc.firstprivate.recipe @firstprivatization_memref_index : memref<index> init {
  ^bb0(%arg0: memref<index>):
    %alloca = memref.alloca() : memref<index>
    acc.yield %alloca : memref<index>
  } copy {
  ^bb0(%arg0: memref<index>, %arg1: memref<index>):
    %0 = memref.load %arg0[] : memref<index>
    memref.store %0, %arg1[] : memref<index>
    acc.terminator
  } destroy {
  ^bb0(%arg0: memref<index>, %arg1: memref<index>):
    memref.dealloc %arg1 : memref<index>
    acc.terminator
  }
  acc.reduction.recipe @reduction_add_memref_index : memref<index> reduction_operator <add> init {
  ^bb0(%arg0: memref<index>):
    %c0 = arith.constant 0 : index
    %alloca = memref.alloca() : memref<index>
    memref.store %c0, %alloca[] : memref<index>
    acc.yield %alloca : memref<index>
  } combiner {
  ^bb0(%arg0: memref<index>, %arg1: memref<index>):
    %0 = memref.load %arg0[] : memref<index>
    %1 = memref.load %arg1[] : memref<index>
    %2 = arith.addi %0, %1 : index
    memref.store %2, %arg0[] : memref<index>
    acc.yield %arg0 : memref<index>
  } destroy {
  ^bb0(%arg0: memref<index>, %arg1: memref<index>):
    memref.dealloc %arg1 : memref<index>
    acc.terminator
  }
  func.func @private_loc(%arg0: memref<index>) {
    %c1 = arith.constant 1 : index
    %0 = acc.private varPtr(%arg0 : memref<index>) recipe(@privatization_memref_index) -> memref<index> {implicit = true, name = "priv0"}
    acc.parallel private(%0 : memref<index>) {
      memref.store %c1, %0[] : memref<index>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    %1 = acc.private varPtr(%arg0 : memref<index>) recipe(@privatization_memref_index) -> memref<index> {implicit = true, name = "priv1"}
    acc.parallel private(%1 : memref<index>) {
      memref.store %c1, %1[] : memref<index>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
  func.func @firstprivate_loc() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %alloca = memref.alloca() : memref<index>
    memref.store %c0, %alloca[] : memref<index>
    %0 = acc.firstprivate varPtr(%alloca : memref<index>) recipe(@firstprivatization_memref_index) -> memref<index> {implicit = true, name = "firstpriv0"}
    acc.parallel firstprivate(%0 : memref<index>) {
      memref.store %c1, %0[] : memref<index>
      acc.yield
    }
    %1 = acc.firstprivate varPtr(%alloca : memref<index>) recipe(@firstprivatization_memref_index) -> memref<index> {implicit = true, name = "firstpriv1"}
    acc.parallel firstprivate(%1 : memref<index>) {
      memref.store %c1, %1[] : memref<index>
      acc.yield
    }
    return
  }
  func.func @reduction_loc(%arg0: memref<index>) {
    %c1 = arith.constant 1 : index
    %0 = acc.reduction varPtr(%arg0 : memref<index>) recipe(@reduction_add_memref_index) -> memref<index> {name = "r0"}
    acc.parallel reduction(%0 : memref<index>) {
      memref.store %c1, %0[] : memref<index>
      acc.yield
    }
    %1 = acc.reduction varPtr(%arg0 : memref<index>) recipe(@reduction_add_memref_index) -> memref<index> {name = "r1"}
    acc.parallel reduction(%1 : memref<index>) {
      memref.store %c1, %1[] : memref<index>
      acc.yield
    }
    return
  }
}

