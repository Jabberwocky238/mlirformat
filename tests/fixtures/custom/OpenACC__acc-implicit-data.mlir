module {
}

// -----
module {
  func.func @test_scalar_in_serial() {
    %alloca = memref.alloca() : memref<i64>
    acc.serial {
      %0 = memref.load %alloca[] : memref<i64>
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test_scalar_in_parallel() {
    %alloca = memref.alloca() : memref<f32>
    acc.parallel {
      %0 = memref.load %alloca[] : memref<f32>
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test_scalar_in_kernels() {
    %alloca = memref.alloca() : memref<f64>
    acc.kernels {
      %0 = memref.load %alloca[] : memref<f64>
      acc.terminator
    }
    return
  }
}

// -----
module {
  func.func @test_scalar_parallel_defaultnone() {
    %alloca = memref.alloca() : memref<f32>
    acc.parallel {
      %0 = memref.load %alloca[] : memref<f32>
      acc.yield
    } attributes {defaultAttr = #acc<defaultvalue none>}
    return
  }
}

// -----
module {
  func.func @test_array_in_parallel() {
    %alloca = memref.alloca() : memref<10xf32>
    acc.parallel {
      %c0 = arith.constant 0 : index
      %0 = memref.load %alloca[%c0] : memref<10xf32>
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test_array_in_kernels() {
    %alloca = memref.alloca() : memref<20xi32>
    acc.kernels {
      %c0 = arith.constant 0 : index
      %0 = memref.load %alloca[%c0] : memref<20xi32>
      acc.terminator
    }
    return
  }
}

// -----
module {
  func.func @test_array_parallel_defaultpresent() {
    %alloca = memref.alloca() : memref<10xf32>
    acc.parallel {
      %c0 = arith.constant 0 : index
      %0 = memref.load %alloca[%c0] : memref<10xf32>
      acc.yield
    } attributes {defaultAttr = #acc<defaultvalue present>}
    return
  }
}

// -----
module {
  func.func @test_scalar_parallel_defaultpresent() {
    %alloca = memref.alloca() : memref<f32>
    acc.parallel {
      %0 = memref.load %alloca[] : memref<f32>
      acc.yield
    } attributes {defaultAttr = #acc<defaultvalue present>}
    return
  }
}

// -----
module {
  func.func @test_multidim_array_in_parallel() {
    %alloca = memref.alloca() : memref<8x16xf32>
    acc.parallel {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %0 = memref.load %alloca[%c0, %c1] : memref<8x16xf32>
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test_dynamic_array(%arg0: index) {
    %alloca = memref.alloca(%arg0) : memref<?xf64>
    acc.parallel {
      %c0 = arith.constant 0 : index
      %0 = memref.load %alloca[%c0] : memref<?xf64>
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test_with_explicit_copyin() {
    %alloca = memref.alloca() : memref<100xf32>
    %0 = acc.copyin varPtr(%alloca : memref<100xf32>) -> memref<100xf32> {name = "explicit"}
    acc.parallel dataOperands(%0 : memref<100xf32>) {
      %c0 = arith.constant 0 : index
      %1 = memref.load %alloca[%c0] : memref<100xf32>
      acc.yield
    }
    acc.copyout accPtr(%0 : memref<100xf32>) to varPtr(%alloca : memref<100xf32>) {name = "explicit"}
    return
  }
}

// -----
module {
  func.func @test_multiple_variables() {
    %alloca = memref.alloca() : memref<f32>
    %alloca_0 = memref.alloca() : memref<10xi32>
    acc.parallel {
      %0 = memref.load %alloca[] : memref<f32>
      %c0 = arith.constant 0 : index
      %1 = memref.load %alloca_0[%c0] : memref<10xi32>
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test_memref_view(%arg0: index) {
    %c0 = arith.constant 0 : index
    %alloca = memref.alloca(%arg0) : memref<?xi8>
    %0 = acc.copyin varPtr(%alloca : memref<?xi8>) -> memref<?xi8> {name = "buffer"}
    %view = memref.view %alloca[%c0][] : memref<?xi8> to memref<8x64xf32>
    acc.kernels dataOperands(%0 : memref<?xi8>) {
      %c0_0 = arith.constant 0 : index
      %c0_1 = arith.constant 0 : index
      %1 = memref.load %view[%c0_0, %c0_1] : memref<8x64xf32>
      acc.terminator
    }
    acc.copyout accPtr(%0 : memref<?xi8>) to varPtr(%alloca : memref<?xi8>) {name = "buffer"}
    return
  }
}

