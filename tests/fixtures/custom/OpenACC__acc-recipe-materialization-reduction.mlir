module {
  acc.reduction.recipe @reduction_add_memref_f64 : memref<f64> reduction_operator <add> init {
  ^bb0(%arg0: memref<f64>):
    %cst = arith.constant 0.000000e+00 : f64
    %alloca = memref.alloca() : memref<f64>
    memref.store %cst, %alloca[] : memref<f64>
    acc.yield %alloca : memref<f64>
  } combiner {
  ^bb0(%arg0: memref<f64>, %arg1: memref<f64>):
    %0 = memref.load %arg0[] : memref<f64>
    %1 = memref.load %arg1[] : memref<f64>
    %2 = arith.addf %0, %1 fastmath<contract> : f64
    memref.store %2, %arg0[] : memref<f64>
    acc.yield %arg0 : memref<f64>
  } destroy {
  ^bb0(%arg0: memref<f64>, %arg1: memref<f64>):
    memref.dealloc %arg1 : memref<f64>
    acc.terminator
  }
  func.func @par_reduction_clause_(%arg0: memref<f64>) {
    %cst = arith.constant 1.000000e+00 : f64
    %0 = acc.reduction varPtr(%arg0 : memref<f64>) recipe(@reduction_add_memref_f64) -> memref<f64> {name = "tmp"}
    acc.parallel reduction(%0 : memref<f64>) {
      %1 = memref.load %0[] : memref<f64>
      %2 = arith.addf %1, %cst fastmath<contract> : f64
      memref.store %2, %0[] : memref<f64>
      acc.yield
    }
    return
  }
  func.func @par_reduction_clause_serial(%arg0: memref<f64>) {
    %c1_i32 = arith.constant 1 : i32
    %cst = arith.constant 1.000000e+00 : f64
    %0 = acc.reduction varPtr(%arg0 : memref<f64>) recipe(@reduction_add_memref_f64) -> memref<f64> {name = "tmp"}
    acc.parallel num_gangs({%c1_i32 : i32}) num_workers(%c1_i32 : i32) vector_length(%c1_i32 : i32) reduction(%0 : memref<f64>) {
      %1 = memref.load %0[] : memref<f64>
      %2 = arith.addf %1, %cst fastmath<contract> : f64
      memref.store %2, %0[] : memref<f64>
      acc.yield
    }
    return
  }
}

