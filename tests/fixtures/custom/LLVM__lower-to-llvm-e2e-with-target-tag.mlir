module {
  module attributes {transform.target_tag = "payload"} {
    func.func @subview(%arg0: memref<64x4xf32, strided<[4, 1]>>, %arg1: index, %arg2: index, %arg3: index) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
      %subview = memref.subview %arg0[%arg1, %arg2] [%arg1, %arg2] [%arg1, %arg2] : memref<64x4xf32, strided<[4, 1]>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
      return %subview : memref<?x?xf32, strided<[?, ?], offset: ?>>
    }
  }
  module @named_inclusion_in_named attributes {transform.with_named_sequence} {
    transform.named_sequence private @lower_to_cpu(!transform.any_op {transform.consumed}) -> !transform.any_op
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.include @lower_to_cpu failures(suppress) (%arg0) : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

