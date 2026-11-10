module {
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

