module {
  func.func @test_direct_var_name() {
    %alloca = memref.alloca() {acc.var_name = #acc.var_name<"my_variable">} : memref<10xi32>
    %cast = memref.cast %alloca {test.var_name} : memref<10xi32> to memref<10xi32>
    return
  }
}

// -----
module {
  func.func @test_through_cast() {
    %alloca = memref.alloca() {acc.var_name = #acc.var_name<"casted_variable">} : memref<5x2xi32>
    %cast = memref.cast %alloca : memref<5x2xi32> to memref<?x?xi32>
    %cast_0 = memref.cast %cast {test.var_name} : memref<?x?xi32> to memref<5x2xi32>
    return
  }
}

// -----
module {
  func.func @test_no_var_name() {
    %alloca = memref.alloca() : memref<10xi32>
    %cast = memref.cast %alloca {test.var_name} : memref<10xi32> to memref<10xi32>
    return
  }
}

// -----
module {
  func.func @test_multiple_casts() {
    %alloca = memref.alloca() {acc.var_name = #acc.var_name<"multi_cast">} : memref<10xi32>
    %cast = memref.cast %alloca : memref<10xi32> to memref<?xi32>
    %cast_0 = memref.cast %cast : memref<?xi32> to memref<10xi32>
    %cast_1 = memref.cast %cast_0 {test.var_name} : memref<10xi32> to memref<10xi32>
    return
  }
}

// -----
module {
  func.func @test_copyin_name() {
    %alloca = memref.alloca() : memref<10xf32>
    %0 = acc.copyin varPtr(%alloca : memref<10xf32>) -> memref<10xf32> {name = "input_data"}
    %cast = memref.cast %0 {test.var_name} : memref<10xf32> to memref<?xf32>
    return
  }
}

