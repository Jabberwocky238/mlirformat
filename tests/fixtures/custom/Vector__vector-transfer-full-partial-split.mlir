module {
  func.func @split_vector_transfer_read_2d(%arg0: memref<?x8xf32>, %arg1: index, %arg2: index) -> vector<4x8xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst : memref<?x8xf32>, vector<4x8xf32>
    return %0 : vector<4x8xf32>
  }
  func.func @split_vector_transfer_read_strided_2d(%arg0: memref<7x8xf32, strided<[?, 1], offset: ?>>, %arg1: index, %arg2: index) -> vector<4x8xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst : memref<7x8xf32, strided<[?, 1], offset: ?>>, vector<4x8xf32>
    return %0 : vector<4x8xf32>
  }
  func.func @split_vector_transfer_read_mem_space(%arg0: memref<?x8xf32, 3>, %arg1: index, %arg2: index) -> vector<4x8xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst : memref<?x8xf32, 3>, vector<4x8xf32>
    return %0 : vector<4x8xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.split_transfer_full_partial split_transfer_strategy = "vector-transfer"
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @split_vector_transfer_write_2d(%arg0: vector<4x8xf32>, %arg1: memref<?x8xf32>, %arg2: index, %arg3: index) {
    vector.transfer_write %arg0, %arg1[%arg2, %arg3] : vector<4x8xf32>, memref<?x8xf32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.split_transfer_full_partial split_transfer_strategy = "vector-transfer"
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @split_vector_transfer_write_strided_2d(%arg0: vector<4x8xf32>, %arg1: memref<7x8xf32, strided<[?, 1], offset: ?>>, %arg2: index, %arg3: index) {
    vector.transfer_write %arg0, %arg1[%arg2, %arg3] : vector<4x8xf32>, memref<7x8xf32, strided<[?, 1], offset: ?>>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.split_transfer_full_partial split_transfer_strategy = "vector-transfer"
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
module {
  func.func @split_vector_transfer_write_mem_space(%arg0: vector<4x8xf32>, %arg1: memref<?x8xf32, 3>, %arg2: index, %arg3: index) {
    vector.transfer_write %arg0, %arg1[%arg2, %arg3] : vector<4x8xf32>, memref<?x8xf32, 3>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.split_transfer_full_partial split_transfer_strategy = "vector-transfer"
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @fake_side_effecting_fun(vector<2x2xf32>)
  func.func @transfer_read_within_async_execute(%arg0: memref<?x?xf32>) -> !async.token {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %token = async.execute {
      %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<?x?xf32>, vector<2x2xf32>
      func.call @fake_side_effecting_fun(%0) : (vector<2x2xf32>) -> ()
      async.yield
    }
    return %token : !async.token
  }
  func.func @transfer_read_within_scf_for(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg4 = %arg1 to %arg2 step %arg3 {
      %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<?x?xf32>, vector<2x2xf32>
      func.call @fake_side_effecting_fun(%0) : (vector<2x2xf32>) -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.op<"func.func">
      transform.apply_patterns to %0 {
        transform.apply_patterns.vector.split_transfer_full_partial split_transfer_strategy = "vector-transfer"
      } : !transform.op<"func.func">
      transform.yield 
    }
  }
}

