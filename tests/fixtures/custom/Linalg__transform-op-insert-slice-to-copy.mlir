module {
  func.func @insert_slice_to_copy(%arg0: tensor<2x3xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index) -> tensor<?x?xf32> {
    %inserted_slice = tensor.insert_slice %arg0 into %arg1[%arg2, %arg3] [2, 3] [%arg6, %arg7] : tensor<2x3xf32> into tensor<?x?xf32>
    return %inserted_slice : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.insert_slice"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.insert_slice_to_copy %0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.cast %1 : !transform.any_op to !transform.op<"linalg.copy">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @insert_slice_to_copy(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index) -> tensor<?x?xf32> {
    %inserted_slice = tensor.insert_slice %arg0 into %arg1[%arg2, %arg3] [%arg4, %arg5] [1, 1] : tensor<?x?xf32> into tensor<?x?xf32>
    return %inserted_slice : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.insert_slice"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.insert_slice_to_copy %0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.cast %1 : !transform.any_op to !transform.op<"linalg.copy">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @insert_slice_to_copy(%arg0: tensor<2x3xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index) -> tensor<?x?xf32> {
    %extracted_slice = tensor.extract_slice %arg1[%arg2, %arg3] [2, 3] [%arg6, %arg7] : tensor<?x?xf32> to tensor<2x3xf32>
    %0 = linalg.copy ins(%arg0 : tensor<2x3xf32>) outs(%extracted_slice : tensor<2x3xf32>) -> tensor<2x3xf32>
    %inserted_slice = tensor.insert_slice %0 into %arg1[%arg2, %arg3] [2, 3] [%arg6, %arg7] : tensor<2x3xf32> into tensor<?x?xf32>
    return %inserted_slice : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.insert_slice"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.insert_slice_to_copy %0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.cast %1 : !transform.any_op to !transform.op<"linalg.copy">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @parallel_insert_slice_to_copy(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) {
    %0 = scf.forall (%arg3, %arg4) in (27, 8) shared_outs(%arg5 = %arg0) -> (tensor<?x?xf32>) {
      %1 = "make_me_a_tensor"() : () -> tensor<?x?xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %1 into %arg5[0, 0] [%arg1, %arg2] [1, 1] : tensor<?x?xf32> into tensor<?x?xf32>
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.parallel_insert_slice"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.insert_slice_to_copy %0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.cast %1 : !transform.any_op to !transform.op<"linalg.copy">
      transform.yield 
    }
  }
}

