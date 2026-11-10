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
  acc.private.recipe @privatization_memref_i32 : memref<i32> init {
  ^bb0(%arg0: memref<i32>):
    %alloca = memref.alloca() : memref<i32>
    acc.yield %alloca : memref<i32>
  }
  func.func @firstpriv() {
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
}

