module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.bufferization.one_shot_bufferize %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
  func.func @test_function(%arg0: tensor<?xf32>, %arg1: vector<4xf32>) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg0[%c0] : vector<4xf32>, tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.bufferization.one_shot_bufferize %0 {memcpy_op = "linalg.copy"} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
  func.func @test_function(%arg0: tensor<?xf32>, %arg1: vector<4xf32>) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg0[%c0] : vector<4xf32>, tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.bufferization.one_shot_bufferize %0 {test_analysis_only = true} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
  func.func @test_function_analysis(%arg0: tensor<?xf32>, %arg1: vector<4xf32>) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg0[%c0] : vector<4xf32>, tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.bufferization.one_shot_bufferize %arg0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
  func.func @test_function(%arg0: tensor<?xf32>, %arg1: vector<4xf32>) -> tensor<?xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.transfer_write %arg1, %arg0[%c0] : vector<4xf32>, tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.bufferization.one_shot_bufferize layout{IdentityLayoutMap} %arg0 {bufferize_function_boundaries = true} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
  func.func @matmul(%arg0: tensor<12x9xf32>, %arg1: tensor<9x6xf32>, %arg2: tensor<12x6xf32>) -> tensor<12x6xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<12x9xf32>, tensor<9x6xf32>) outs(%arg2 : tensor<12x6xf32>) -> tensor<12x6xf32>
    return %0 : tensor<12x6xf32>
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.empty"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.cast %0 : !transform.any_op to !transform.op<"tensor.empty">
      %2 = transform.bufferization.empty_tensor_to_alloc_tensor %1 : (!transform.op<"tensor.empty">) -> !transform.op<"bufferization.alloc_tensor">
      transform.yield 
    }
  }
  func.func @empty_to_tensor_alloc() -> tensor<2x2xf32> {
    %0 = tensor.empty() : tensor<2x2xf32>
    return %0 : tensor<2x2xf32>
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.bufferization.eliminate_empty_tensors %0 : !transform.any_op
      transform.yield 
    }
  }
  func.func @empty_tensor_elimination(%arg0: tensor<10xf32>, %arg1: f32) -> tensor<10xf32> {
    %0 = tensor.empty() : tensor<5xf32>
    %1 = linalg.fill ins(%arg1 : f32) outs(%0 : tensor<5xf32>) -> tensor<5xf32>
    %inserted_slice = tensor.insert_slice %1 into %arg0[1] [5] [1] : tensor<5xf32> into tensor<10xf32>
    return %inserted_slice : tensor<10xf32>
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.bufferization.buffer_loop_hoisting %0 : !transform.any_op
      transform.yield 
    }
  }
  func.func @buffer_loop_hoisting(%arg0: index, %arg1: index, %arg2: index, %arg3: f32, %arg4: index) {
    scf.for %arg5 = %arg0 to %arg1 step %arg2 {
      %alloca = memref.alloca() : memref<5xf32>
      memref.store %arg3, %alloca[%arg4] : memref<5xf32>
    }
    return
  }
}

// -----
module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["bufferization.alloc_tensor"]} in %arg0 : (!transform.any_op) -> !transform.op<"bufferization.alloc_tensor">
      %allocated_buffer, %new_ops = transform.structured.bufferize_to_allocation %0 {alloc_op = "memref.alloca"} : !transform.op<"bufferization.alloc_tensor">
      transform.yield 
    }
  }
  func.func @empty_to_tensor_alloc() -> tensor<2x2xf32> {
    %0 = bufferization.alloc_tensor() : tensor<2x2xf32>
    return %0 : tensor<2x2xf32>
  }
}

