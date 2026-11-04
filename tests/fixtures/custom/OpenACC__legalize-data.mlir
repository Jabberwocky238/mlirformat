module {
  func.func @test(%arg0: memref<10xf32>, %arg1: index) {
    %0 = acc.create varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32>
    acc.parallel dataOperands(%0 : memref<10xf32>) {
      %1 = memref.load %arg0[%arg1] : memref<10xf32>
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test(%arg0: memref<10xf32>, %arg1: index) {
    %0 = acc.create varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32>
    acc.serial dataOperands(%0 : memref<10xf32>) {
      %1 = memref.load %arg0[%arg1] : memref<10xf32>
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test(%arg0: memref<10xf32>, %arg1: index) {
    %0 = acc.create varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32>
    acc.kernels dataOperands(%0 : memref<10xf32>) {
      %1 = memref.load %arg0[%arg1] : memref<10xf32>
      acc.terminator
    }
    return
  }
}

// -----
module {
  func.func @test(%arg0: memref<10xf32>, %arg1: index) {
    %0 = acc.create varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32>
    acc.data dataOperands(%0 : memref<10xf32>) {
      %cst = arith.constant 0.000000e+00 : f32
      memref.store %cst, %arg0[%arg1] : memref<10xf32>
      acc.serial {
        %1 = memref.load %arg0[%arg1] : memref<10xf32>
        acc.yield
      }
      acc.terminator
    }
    return
  }
}

// -----
module {
  func.func @test(%arg0: memref<10xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = acc.create varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32>
    acc.parallel dataOperands(%0 : memref<10xf32>) {
      acc.loop control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
        %1 = memref.load %arg0[%arg1] : memref<10xf32>
        acc.yield
      } attributes {independent = [#acc.device_type<none>]}
      acc.yield
    }
    return
  }
}

// -----
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
  func.func @test(%arg0: memref<10xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = acc.private varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) recipe(@privatization_memref_10_f32) -> memref<10xf32>
    acc.parallel private(%0 : memref<10xf32>) {
      acc.loop control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
        %1 = memref.load %arg0[%arg1] : memref<10xf32>
        acc.yield
      } attributes {independent = [#acc.device_type<none>]}
      acc.yield
    }
    return
  }
}

// -----
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
  func.func @test(%arg0: memref<10xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = acc.private varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) recipe(@privatization_memref_10_f32) -> memref<10xf32>
    acc.parallel {
      acc.loop private(%0 : memref<10xf32>) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
        %1 = memref.load %arg0[%arg1] : memref<10xf32>
        acc.yield
      } attributes {independent = [#acc.device_type<none>]}
      acc.yield
    }
    return
  }
}

// -----
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
  func.func @test(%arg0: memref<10xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %0 = acc.private varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) recipe(@privatization_memref_10_f32) -> memref<10xf32>
    acc.serial private(%0 : memref<10xf32>) {
      acc.loop control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
        %1 = memref.load %arg0[%arg1] : memref<10xf32>
        acc.yield
      } attributes {seq = [#acc.device_type<none>]}
      acc.yield
    }
    return
  }
}

// -----
module {
  func.func @test(%arg0: memref<10xf32>) {
    %0 = acc.use_device varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32>
    acc.host_data dataOperands(%0 : memref<10xf32>) {
      func.call @foo(%arg0) : (memref<10xf32>) -> ()
      acc.terminator
    }
    return
  }
  func.func private @foo(memref<10xf32>)
}

// -----
module {
  func.func @test(%arg0: memref<10xf32>) {
    %0 = acc.create varPtr(%arg0 : memref<10xf32>) varType(tensor<10xf32>) -> memref<10xf32> {name = "arr"}
    %1 = acc.declare_enter dataOperands(%0 : memref<10xf32>)
    acc.kernels dataOperands(%0 : memref<10xf32>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant 1.000000e+00 : f32
      memref.store %cst, %arg0[%c0] : memref<10xf32>
      acc.terminator
    }
    acc.declare_exit token(%1) dataOperands(%0 : memref<10xf32>)
    return
  }
}

