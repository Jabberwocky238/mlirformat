module {
  acc.firstprivate.recipe @firstprivatization_two_allocs : memref<i32> init {
  ^bb0(%arg0: memref<i32>):
    %c42_i32 = arith.constant 42 : i32
    %alloca = memref.alloca() {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">} : memref<i32>
    memref.store %c42_i32, %alloca[] : memref<i32>
    %alloca_0 = memref.alloca() {acc.var_name = #acc.var_name<"<acc.varname.placeholder>">} : memref<i32>
    %0 = memref.load %alloca[] : memref<i32>
    memref.store %0, %alloca_0[] : memref<i32>
    acc.yield %alloca_0 : memref<i32>
  } copy {
  ^bb0(%arg0: memref<i32>, %arg1: memref<i32>):
    %0 = memref.load %arg0[] : memref<i32>
    memref.store %0, %arg1[] : memref<i32>
    acc.terminator
  }
  func.func @firstpriv_two_allocs() {
    %alloca = memref.alloca() : memref<i32>
    %0 = acc.firstprivate varPtr(%alloca : memref<i32>) recipe(@firstprivatization_two_allocs) -> memref<i32> {name = "t"}
    acc.parallel firstprivate(%0 : memref<i32>) {
      acc.yield
    }
    return
  }
  func.func @firstpriv_two_allocs_no_name() {
    %alloca = memref.alloca() : memref<i32>
    %0 = acc.firstprivate varPtr(%alloca : memref<i32>) recipe(@firstprivatization_two_allocs) -> memref<i32> {name = ""}
    acc.parallel firstprivate(%0 : memref<i32>) {
      acc.yield
    }
    return
  }
}

