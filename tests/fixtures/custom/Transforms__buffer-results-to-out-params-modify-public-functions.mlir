module {
  func.func @basic() -> memref<f32> {
    %0 = "test.source"() : () -> memref<f32>
    return %0 : memref<f32>
  }
  func.func @presence_of_existing_arguments(%arg0: memref<1xf32>) -> memref<2xf32> {
    %0 = "test.source"() : () -> memref<2xf32>
    return %0 : memref<2xf32>
  }
  func.func @multiple_results() -> (memref<1xf32>, memref<2xf32>) {
    %0:2 = "test.source"() : () -> (memref<1xf32>, memref<2xf32>)
    return %0#0, %0#1 : memref<1xf32>, memref<2xf32>
  }
}

