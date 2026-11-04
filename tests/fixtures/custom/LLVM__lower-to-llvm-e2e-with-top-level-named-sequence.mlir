module {
  func.func @subview(%arg0: memref<64x4xf32, strided<[4, 1]>>, %arg1: index, %arg2: index, %arg3: index) -> memref<?x?xf32, strided<[?, ?], offset: ?>> {
    %subview = memref.subview %arg0[%arg1, %arg2] [%arg1, %arg2] [%arg1, %arg2] : memref<64x4xf32, strided<[4, 1]>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    return %subview : memref<?x?xf32, strided<[?, ?], offset: ?>>
  }
  module @named_inclusion_in_named attributes {transform.with_named_sequence} {
    transform.named_sequence private @lower_to_llvm(!transform.any_op {transform.readonly}) -> !transform.any_op
    transform.named_sequence @entry_point(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.include @lower_to_llvm failures(suppress) (%arg0) : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

