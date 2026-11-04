module {
  func.func @entry() {
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.230000e+02 : f32
    %vscale = vector.vscale
    %c4_vscale = arith.muli %c4, %vscale : index
    %0 = bufferization.alloc_tensor(%c4_vscale) : tensor<?xf32>
    %1 = scf.for %arg0 = %c0 to %c4_vscale step %c1 iter_args(%arg1 = %0) -> (tensor<?xf32>) {
      %inserted = tensor.insert %cst into %arg1[%arg0] : tensor<?xf32>
      scf.yield %inserted : tensor<?xf32>
    }
    %cst_0 = arith.constant 3.140000e+00 : f32
    %2 = linalg.fill ins(%cst_0 : f32) outs(%1 : tensor<?xf32>) -> tensor<?xf32>
    scf.for %arg0 = %c0 to %c4_vscale step %c1 {
      %extracted = tensor.extract %2[%arg0] : tensor<?xf32>
      vector.print %extracted : f32
    }
    vector.print str "SVE: END OF TEST OUTPUT"
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [[4]] : !transform.any_op
      transform.yield 
    }
  }
}

