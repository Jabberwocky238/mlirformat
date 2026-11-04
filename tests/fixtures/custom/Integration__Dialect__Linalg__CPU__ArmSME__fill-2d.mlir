module {
  func.func @entry() {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.230000e+02 : f32
    %0 = arm_sme.streaming_vl <word>
    %1 = bufferization.alloc_tensor(%0, %0) : tensor<?x?xf32>
    %2 = scf.for %arg0 = %c0 to %0 step %c1 iter_args(%arg1 = %1) -> (tensor<?x?xf32>) {
      %4 = scf.for %arg2 = %c0 to %0 step %c1 iter_args(%arg3 = %arg1) -> (tensor<?x?xf32>) {
        %inserted = tensor.insert %cst into %arg3[%arg0, %arg2] : tensor<?x?xf32>
        scf.yield %inserted : tensor<?x?xf32>
      }
      scf.yield %4 : tensor<?x?xf32>
    }
    scf.for %arg0 = %c0 to %0 step %c1 {
      vector.print punctuation <open>
      scf.for %arg1 = %c0 to %0 step %c1 {
        %extracted = tensor.extract %2[%arg0, %arg1] : tensor<?x?xf32>
        vector.print %extracted : f32 punctuation <no_punctuation>
        %c1_1 = arith.constant 1 : index
        %4 = arith.subi %0, %c1_1 : index
        %5 = arith.cmpi ult, %arg1, %4 : index
        scf.if %5 {
          vector.print punctuation <comma>
        }
      }
      vector.print punctuation <close>
      vector.print
    }
    %cst_0 = arith.constant 3.140000e+00 : f32
    %3 = linalg.fill ins(%cst_0 : f32) outs(%2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    scf.for %arg0 = %c0 to %0 step %c1 {
      vector.print punctuation <open>
      scf.for %arg1 = %c0 to %0 step %c1 {
        %extracted = tensor.extract %3[%arg0, %arg1] : tensor<?x?xf32>
        vector.print %extracted : f32 punctuation <no_punctuation>
        %c1_1 = arith.constant 1 : index
        %4 = arith.subi %0, %c1_1 : index
        %5 = arith.cmpi ult, %arg1, %4 : index
        scf.if %5 {
          vector.print punctuation <comma>
        }
      }
      vector.print punctuation <close>
      vector.print
    }
    vector.print str "SME: END OF TEST OUTPUT\0A"
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.structured.vectorize %0 vector_sizes [[4], [4]] : !transform.any_op
      transform.yield 
    }
  }
}

