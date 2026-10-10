module {
  func.func @coalesce_inner() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    scf.for %arg0 = %c0 to %c10 step %c1 {
      scf.for %arg1 = %c0 to %c10 step %c1 {
        scf.for %arg2 = %arg0 to %arg1 step %c1 {
          scf.for %arg3 = %arg0 to %arg1 step %c1 {
            "use"(%arg0, %arg1) : (index, index) -> ()
          }
        } {coalesce}
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} attributes {coalesce} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.cast %0 : !transform.any_op to !transform.op<"scf.for">
      %2 = transform.loop.coalesce %1 : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @coalesce_outer(%arg0: memref<64x64xf32, 1>, %arg1: memref<64x64xf32, 1>, %arg2: memref<64x64xf32, 1>) {
    affine.for %arg3 = 0 to 64 {
      affine.for %arg4 = 0 to 64 {
        %0 = affine.load %arg0[%arg3, %arg4] : memref<64x64xf32, 1>
        %1 = affine.load %arg1[%arg3, %arg4] : memref<64x64xf32, 1>
        %2 = arith.addf %0, %1 : f32
        affine.store %2, %arg2[%arg3, %arg4] : memref<64x64xf32, 1>
      }
    } {coalesce}
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["affine.for"]} attributes {coalesce} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.cast %0 : !transform.any_op to !transform.op<"affine.for">
      %2 = transform.loop.coalesce %1 : (!transform.op<"affine.for">) -> !transform.op<"affine.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @coalesce_and_unroll(%arg0: memref<64x64xf32, 1>, %arg1: memref<64x64xf32, 1>, %arg2: memref<64x64xf32, 1>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c64 = arith.constant 64 : index
    scf.for %arg3 = %c0 to %c64 step %c1 {
      scf.for %arg4 = %c0 to %c64 step %c1 {
        %0 = memref.load %arg0[%arg3, %arg4] : memref<64x64xf32, 1>
        %1 = memref.load %arg1[%arg3, %arg4] : memref<64x64xf32, 1>
        %2 = arith.addf %0, %1 : f32
        memref.store %2, %arg2[%arg3, %arg4] : memref<64x64xf32, 1>
      }
    } {coalesce}
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} attributes {coalesce} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.cast %0 : !transform.any_op to !transform.op<"scf.for">
      %2 = transform.loop.coalesce %1 : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      transform.loop.unroll %2 {factor = 3 : i64} : !transform.op<"scf.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_loops(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index) -> tensor<?x?xf32> {
    %0 = scf.for %arg10 = %arg1 to %arg2 step %arg3 iter_args(%arg11 = %arg0) -> (tensor<?x?xf32>) {
      %1 = scf.for %arg12 = %arg4 to %arg5 step %arg6 iter_args(%arg13 = %arg11) -> (tensor<?x?xf32>) {
        %2 = scf.for %arg14 = %arg7 to %arg8 step %arg9 iter_args(%arg15 = %arg13) -> (tensor<?x?xf32>) {
          %3 = "use"(%arg15, %arg10, %arg12, %arg14) : (tensor<?x?xf32>, index, index, index) -> tensor<?x?xf32>
          scf.yield %3 : tensor<?x?xf32>
        }
        scf.yield %2 : tensor<?x?xf32>
      }
      scf.yield %1 : tensor<?x?xf32>
    } {coalesce}
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} attributes {coalesce} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.cast %0 : !transform.any_op to !transform.op<"scf.for">
      %2 = transform.loop.coalesce %1 : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_loops_first_two(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
    %0:2 = scf.for %arg11 = %arg2 to %arg3 step %arg4 iter_args(%arg12 = %arg0, %arg13 = %arg1) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
      %1:2 = scf.for %arg14 = %arg5 to %arg6 step %arg7 iter_args(%arg15 = %arg12, %arg16 = %arg13) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
        %2:2 = scf.for %arg17 = %arg8 to %arg9 step %arg10 iter_args(%arg18 = %arg16, %arg19 = %arg15) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
          %3:2 = "use"(%arg13, %arg11, %arg14, %arg17) : (tensor<?x?xf32>, index, index, index) -> (tensor<?x?xf32>, tensor<?x?xf32>)
          scf.yield %3#0, %3#1 : tensor<?x?xf32>, tensor<?x?xf32>
        }
        scf.yield %2#0, %2#1 : tensor<?x?xf32>, tensor<?x?xf32>
      }
      scf.yield %1#0, %1#1 : tensor<?x?xf32>, tensor<?x?xf32>
    } {coalesce}
    return %0#0, %0#1 : tensor<?x?xf32>, tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} attributes {coalesce} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.cast %0 : !transform.any_op to !transform.op<"scf.for">
      %2 = transform.loop.coalesce %1 : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_loops_first_two_2(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
    %0:2 = scf.for %arg11 = %arg2 to %arg3 step %arg4 iter_args(%arg12 = %arg0, %arg13 = %arg1) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
      %1:2 = scf.for %arg14 = %arg5 to %arg6 step %arg7 iter_args(%arg15 = %arg12, %arg16 = %arg13) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
        %2:2 = scf.for %arg17 = %arg8 to %arg9 step %arg10 iter_args(%arg18 = %arg15, %arg19 = %arg16) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
          %3:2 = "use"(%arg13, %arg11, %arg14, %arg17) : (tensor<?x?xf32>, index, index, index) -> (tensor<?x?xf32>, tensor<?x?xf32>)
          scf.yield %3#0, %3#1 : tensor<?x?xf32>, tensor<?x?xf32>
        }
        scf.yield %2#1, %2#0 : tensor<?x?xf32>, tensor<?x?xf32>
      }
      scf.yield %1#0, %1#1 : tensor<?x?xf32>, tensor<?x?xf32>
    } {coalesce}
    return %0#0, %0#1 : tensor<?x?xf32>, tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} attributes {coalesce} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.cast %0 : !transform.any_op to !transform.op<"scf.for">
      %2 = transform.loop.coalesce %1 : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_loops_last_two(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
    %0:2 = scf.for %arg11 = %arg2 to %arg3 step %arg4 iter_args(%arg12 = %arg0, %arg13 = %arg1) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
      %1:2 = scf.for %arg14 = %arg5 to %arg6 step %arg7 iter_args(%arg15 = %arg12, %arg16 = %arg13) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
        %2:2 = scf.for %arg17 = %arg8 to %arg9 step %arg10 iter_args(%arg18 = %arg15, %arg19 = %arg16) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
          %3:2 = "use"(%arg13, %arg11, %arg14, %arg17) : (tensor<?x?xf32>, index, index, index) -> (tensor<?x?xf32>, tensor<?x?xf32>)
          scf.yield %3#0, %3#1 : tensor<?x?xf32>, tensor<?x?xf32>
        }
        scf.yield %2#0, %2#1 : tensor<?x?xf32>, tensor<?x?xf32>
      }
      scf.yield %1#1, %1#0 : tensor<?x?xf32>, tensor<?x?xf32>
    } {coalesce}
    return %0#0, %0#1 : tensor<?x?xf32>, tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} attributes {coalesce} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.cast %0 : !transform.any_op to !transform.op<"scf.for">
      %2 = transform.loop.coalesce %1 : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @trip_one_loops(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = scf.for %arg3 = %c0 to %c1 step %c1 iter_args(%arg4 = %arg0) -> (tensor<?x?xf32>) {
      %1 = scf.for %arg5 = %c0 to %c1 step %c1 iter_args(%arg6 = %arg4) -> (tensor<?x?xf32>) {
        %2 = scf.for %arg7 = %c0 to %arg1 step %c1 iter_args(%arg8 = %arg6) -> (tensor<?x?xf32>) {
          %3 = scf.for %arg9 = %c0 to %c1 step %c1 iter_args(%arg10 = %arg8) -> (tensor<?x?xf32>) {
            %4 = scf.for %arg11 = %c0 to %arg2 step %c1 iter_args(%arg12 = %arg10) -> (tensor<?x?xf32>) {
              %5 = "some_use"(%arg12, %arg3, %arg5, %arg7, %arg9, %arg11) : (tensor<?x?xf32>, index, index, index, index, index) -> tensor<?x?xf32>
              scf.yield %5 : tensor<?x?xf32>
            }
            scf.yield %4 : tensor<?x?xf32>
          }
          scf.yield %3 : tensor<?x?xf32>
        }
        scf.yield %2 : tensor<?x?xf32>
      }
      scf.yield %1 : tensor<?x?xf32>
    } {coalesce}
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} attributes {coalesce} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.cast %0 : !transform.any_op to !transform.op<"scf.for">
      %2 = transform.loop.coalesce %1 : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      transform.apply_patterns to %2 {
        transform.apply_patterns.canonicalization
      } : !transform.op<"scf.for">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @all_outer_trip_one(%arg0: tensor<?x?xf32>, %arg1: index) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = scf.for %arg2 = %c0 to %c1 step %c1 iter_args(%arg3 = %arg0) -> (tensor<?x?xf32>) {
      %1 = scf.for %arg4 = %c0 to %c1 step %c1 iter_args(%arg5 = %arg3) -> (tensor<?x?xf32>) {
        %2 = scf.for %arg6 = %c0 to %arg1 step %c1 iter_args(%arg7 = %arg5) -> (tensor<?x?xf32>) {
          %3 = "some_use"(%arg7, %arg2, %arg4, %arg6) : (tensor<?x?xf32>, index, index, index) -> tensor<?x?xf32>
          scf.yield %3 : tensor<?x?xf32>
        }
        scf.yield %2 : tensor<?x?xf32>
      }
      scf.yield %1 : tensor<?x?xf32>
    } {coalesce}
    return %0 : tensor<?x?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} attributes {coalesce} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.cast %0 : !transform.any_op to !transform.op<"scf.for">
      %2 = transform.loop.coalesce %1 : (!transform.op<"scf.for">) -> !transform.op<"scf.for">
      transform.apply_patterns to %2 {
        transform.apply_patterns.canonicalization
      } : !transform.op<"scf.for">
      transform.yield 
    }
  }
}

