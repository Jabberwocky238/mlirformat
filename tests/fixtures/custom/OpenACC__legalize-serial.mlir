module {
  acc.private.recipe @privatization_memref_10_f32 : memref<10xf32> init {
  ^bb0(%arg0: memref<10xf32>):
    %alloc = memref.alloc() : memref<10xf32>
    acc.yield %alloc : memref<10xf32>
  } destroy {
  ^bb0(%arg0: memref<10xf32>):
    memref.dealloc %arg0 : memref<10xf32>
    acc.terminator
  }
  acc.private.recipe @privatization_memref_10_10_f32 : memref<10x10xf32> init {
  ^bb0(%arg0: memref<10x10xf32>):
    %alloc = memref.alloc() : memref<10x10xf32>
    acc.yield %alloc : memref<10x10xf32>
  } destroy {
  ^bb0(%arg0: memref<10x10xf32>):
    memref.dealloc %arg0 : memref<10x10xf32>
    acc.terminator
  }
  acc.firstprivate.recipe @firstprivatization_memref_10xf32 : memref<10xf32> init {
  ^bb0(%arg0: memref<10xf32>):
    %alloc = memref.alloc() : memref<10xf32>
    acc.yield %alloc : memref<10xf32>
  } copy {
  ^bb0(%arg0: memref<10xf32>, %arg1: memref<10xf32>):
    acc.terminator
  } destroy {
  ^bb0(%arg0: memref<10xf32>):
    memref.dealloc %arg0 : memref<10xf32>
    acc.terminator
  }
  acc.reduction.recipe @reduction_add_i64 : i64 reduction_operator <add> init {
  ^bb0(%arg0: i64):
    %c0_i64 = arith.constant 0 : i64
    acc.yield %c0_i64 : i64
  } combiner {
  ^bb0(%arg0: i64, %arg1: i64):
    %0 = arith.addi %arg0, %arg1 : i64
    acc.yield %0 : i64
  }
  acc.reduction.recipe @reduction_add_memref_i64 : memref<i64> reduction_operator <add> init {
  ^bb0(%arg0: memref<i64>):
    %alloca = memref.alloca() : memref<i64>
    %c0_i64 = arith.constant 0 : i64
    memref.store %c0_i64, %alloca[] : memref<i64>
    acc.yield %alloca : memref<i64>
  } combiner {
  ^bb0(%arg0: memref<i64>, %arg1: memref<i64>):
    %0 = memref.load %arg0[] : memref<i64>
    %1 = memref.load %arg1[] : memref<i64>
    %2 = arith.addi %0, %1 : i64
    memref.store %2, %arg0[] : memref<i64>
    acc.terminator
  }
  func.func @testserialop(%arg0: memref<10xf32>, %arg1: memref<10xf32>, %arg2: memref<10x10xf32>) {
    %c1_i64 = arith.constant 1 : i64
    %c1_i32 = arith.constant 1 : i32
    %c1 = arith.constant 1 : index
    acc.serial async(%c1_i64 : i64) {
    }
    acc.serial async(%c1_i32 : i32) {
    }
    acc.serial async(%c1 : index) {
    }
    acc.serial wait({%c1_i64 : i64}) {
    }
    acc.serial wait({%c1_i32 : i32}) {
    }
    acc.serial wait({%c1 : index}) {
    }
    acc.serial wait({%c1_i64 : i64, %c1_i32 : i32, %c1 : index}) {
    }
    %0 = acc.firstprivate varPtr(%arg1 : memref<10xf32>) recipe(@firstprivatization_memref_10xf32) -> memref<10xf32>
    %1 = acc.private varPtr(%arg2 : memref<10x10xf32>) recipe(@privatization_memref_10_10_f32) -> memref<10x10xf32>
    acc.serial firstprivate(%0 : memref<10xf32>) private(%1 : memref<10x10xf32>) {
    }
    %2 = acc.copyin varPtr(%arg0 : memref<10xf32>) -> memref<10xf32> {dataClause = #acc<data_clause acc_copy>}
    acc.serial dataOperands(%2 : memref<10xf32>) {
    }
    %alloca = memref.alloca() : memref<i64>
    memref.store %c1_i64, %alloca[] : memref<i64>
    %3 = acc.reduction varPtr(%alloca : memref<i64>) recipe(@reduction_add_memref_i64) -> memref<i64>
    acc.serial reduction(%3 : memref<i64>) {
    }
    acc.serial combined(loop) {
      acc.loop combined(serial) control(%arg3 : index) = (%c1 : index) to (%c1 : index)  step (%c1 : index) {
        acc.yield
      } attributes {seq = [#acc.device_type<none>]}
      acc.terminator
    }
    acc.serial {
    } attributes {defaultAttr = #acc<defaultvalue none>}
    acc.serial {
    } attributes {defaultAttr = #acc<defaultvalue present>}
    acc.serial {
    } attributes {asyncAttr}
    acc.serial {
    } attributes {waitAttr}
    acc.serial {
    } attributes {selfAttr}
    acc.serial {
      acc.yield
    } attributes {selfAttr}
    return
  }
}

