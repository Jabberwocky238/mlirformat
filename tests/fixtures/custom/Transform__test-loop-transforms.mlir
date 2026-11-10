module {
  func.func @hoist_outer_loop_only(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %0 = "test.foo"() : () -> index
    %1 = "test.foo"() : () -> index
    %2 = "test.foo"() : () -> index
    %3 = scf.for %arg1 = %0 to %1 step %2 iter_args(%arg2 = %arg0) -> (tensor<?xf32>) {
      %extracted_slice = tensor.extract_slice %arg2[0] [5] [1] : tensor<?xf32> to tensor<5xf32>
      %4 = "test.foo"(%extracted_slice) : (tensor<5xf32>) -> tensor<5xf32>
      %inserted_slice = tensor.insert_slice %4 into %arg2[0] [5] [1] : tensor<5xf32> into tensor<?xf32>
      %5 = scf.for %arg3 = %0 to %1 step %2 iter_args(%arg4 = %inserted_slice) -> (tensor<?xf32>) {
        %extracted_slice_0 = tensor.extract_slice %arg4[5] [5] [1] : tensor<?xf32> to tensor<5xf32>
        %6 = "test.foo"(%extracted_slice_0) : (tensor<5xf32>) -> tensor<5xf32>
        %inserted_slice_1 = tensor.insert_slice %6 into %arg4[5] [5] [1] : tensor<5xf32> into tensor<?xf32>
        scf.yield %inserted_slice_1 : tensor<?xf32>
      }
      scf.yield %5 : tensor<?xf32>
    }
    return %3 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1:2 = transform.split_handle %0 : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      transform.loop.hoist_loop_invariant_subsets %1#1 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_mixed_loop_extension_scf_transform(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %0 = "test.foo"() : () -> index
    %1 = "test.foo"() : () -> index
    %2 = "test.foo"() : () -> index
    %3 = scf.for %arg1 = %0 to %1 step %2 iter_args(%arg2 = %arg0) -> (tensor<?xf32>) {
      %4 = "test.foo"(%arg2) : (tensor<?xf32>) -> tensor<?xf32>
      scf.yield %4 : tensor<?xf32>
    }
    return %3 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.loop.hoist_loop_invariant_subsets %0 : !transform.any_op
      transform.loop.unroll %0 {factor = 4 : i64} : !transform.any_op
      transform.yield 
    }
  }
}

