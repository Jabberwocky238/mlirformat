module {
  func.func @tensor_pad_constant(%arg0: tensor<?x10xindex>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?x?xindex> {
    %padded = tensor.pad %arg0 low[5, %arg1] high[%arg2, %arg3] {
    ^bb0(%arg4: index, %arg5: index):
      %c50 = arith.constant 50 : index
      tensor.yield %c50 : index
    } : tensor<?x10xindex> to tensor<?x?xindex>
    return %padded : tensor<?x?xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %allocated_buffer, %new_ops = transform.structured.bufferize_to_allocation %0 {emit_dealloc} : !transform.any_op
      %1 = transform.select "linalg.fill" in %new_ops : (!transform.any_op) -> !transform.any_op
      %2 = transform.num_associations %1 : (!transform.any_op) -> !transform.param<i64>
      transform.debug.emit_param_as_remark %2 : !transform.param<i64>
      %3 = transform.select "bufferization.materialize_in_destination" in %new_ops : (!transform.any_op) -> !transform.any_op
      %4 = transform.num_associations %3 : (!transform.any_op) -> !transform.param<i64>
      transform.debug.emit_param_as_remark %4 : !transform.param<i64>
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_pad_constant_with_custom_copy(%arg0: tensor<?x10xindex>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?x?xindex> {
    %padded = tensor.pad %arg0 low[5, %arg1] high[%arg2, %arg3] {
    ^bb0(%arg4: index, %arg5: index):
      %c50 = arith.constant 50 : index
      tensor.yield %c50 : index
    } : tensor<?x10xindex> to tensor<?x?xindex>
    return %padded : tensor<?x?xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %allocated_buffer, %new_ops = transform.structured.bufferize_to_allocation %0 {alloc_op = "memref.alloca", emit_dealloc, memcpy_op = "linalg.copy", memory_space = 3 : i64} : !transform.any_op
      %1 = transform.select "linalg.fill" in %new_ops : (!transform.any_op) -> !transform.any_op
      %2 = transform.num_associations %1 : (!transform.any_op) -> !transform.param<i64>
      transform.debug.emit_param_as_remark %2 : !transform.param<i64>
      %3 = transform.select "linalg.copy" in %new_ops : (!transform.any_op) -> !transform.any_op
      %4 = transform.num_associations %3 : (!transform.any_op) -> !transform.param<i64>
      transform.debug.emit_param_as_remark %4 : !transform.param<i64>
      %5 = transform.select "memref.alloca" in %new_ops : (!transform.any_op) -> !transform.any_op
      %6 = transform.num_associations %5 : (!transform.any_op) -> !transform.param<i64>
      transform.debug.emit_param_as_remark %6 : !transform.param<i64>
      %7 = transform.bufferization.one_shot_bufferize %arg0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_pad_constant(%arg0: tensor<?x10xindex>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?x?xindex> {
    %padded = tensor.pad %arg0 low[5, %arg1] high[%arg2, %arg3] {
    ^bb0(%arg4: index, %arg5: index):
      %c50 = arith.constant 50 : index
      tensor.yield %c50 : index
    } : tensor<?x10xindex> to tensor<?x?xindex>
    return %padded : tensor<?x?xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %allocated_buffer, %new_ops = transform.structured.bufferize_to_allocation %0 {emit_dealloc} : !transform.any_op
      %1 = transform.bufferization.one_shot_bufferize %arg0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_insert(%arg0: tensor<?x10xindex>, %arg1: index, %arg2: index) -> tensor<?x10xindex> {
    %inserted = tensor.insert %arg2 into %arg0[%arg1, %arg1] : tensor<?x10xindex>
    return %inserted : tensor<?x10xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.structured.match ops{["tensor.insert"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %allocated_buffer, %new_ops = transform.structured.bufferize_to_allocation %0 {emit_dealloc, memory_space = 4 : i64} : !transform.any_op
      %1 = transform.bufferization.one_shot_bufferize %arg0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_insert_into_empty(%arg0: index, %arg1: index) -> tensor<10xindex> {
    %0 = tensor.empty() : tensor<10xindex>
    %inserted = tensor.insert %arg1 into %0[%arg0] : tensor<10xindex>
    return %inserted : tensor<10xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.consumed}) {
      %0 = transform.structured.match ops{["tensor.insert"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %allocated_buffer, %new_ops = transform.structured.bufferize_to_allocation %0 {emit_dealloc, memory_space = 4 : i64} : !transform.any_op
      %1 = transform.bufferization.one_shot_bufferize %arg0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_extract(%arg0: tensor<?x10xindex>, %arg1: index) -> index {
    %extracted = tensor.extract %arg0[%arg1, %arg1] : tensor<?x10xindex>
    return %extracted : index
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.extract"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %allocated_buffer, %new_ops = transform.structured.bufferize_to_allocation %0 {emit_dealloc, memory_space = 4 : i64} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @vector_mask(%arg0: tensor<?xf32>, %arg1: vector<16xf32>, %arg2: index, %arg3: vector<16xi1>) -> tensor<?xf32> {
    %0 = vector.mask %arg3 { vector.transfer_write %arg1, %arg0[%arg2] : vector<16xf32>, tensor<?xf32> } : vector<16xi1> -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["vector.mask"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %allocated_buffer, %new_ops = transform.structured.bufferize_to_allocation %0 {emit_dealloc, memory_space = 4 : i64} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_insert_destination(%arg0: tensor<?x10xindex>, %arg1: index, %arg2: index) -> tensor<?x10xindex> {
    %inserted = tensor.insert %arg2 into %arg0[%arg1, %arg1] : tensor<?x10xindex>
    return %inserted : tensor<?x10xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.insert"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %allocated_buffer, %new_ops = transform.structured.bufferize_to_allocation %0 {bufferize_destination_only, emit_dealloc, memory_space = 4 : i64} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @scf_for_destination(%arg0: tensor<?x10xindex>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?x10xindex> {
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %arg0) -> (tensor<?x10xindex>) {
      %1 = "test.foo"(%arg5) : (tensor<?x10xindex>) -> tensor<?x10xindex>
      scf.yield %1 : tensor<?x10xindex>
    }
    return %0 : tensor<?x10xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["scf.for"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %allocated_buffer, %new_ops = transform.structured.bufferize_to_allocation %0 {bufferize_destination_only, emit_dealloc, memory_space = 4 : i64} : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @tensor_insert_destination_no_dealloc(%arg0: tensor<?x10xindex>, %arg1: index, %arg2: index) -> tensor<?x10xindex> {
    %inserted = tensor.insert %arg2 into %arg0[%arg1, %arg1] : tensor<?x10xindex>
    return %inserted : tensor<?x10xindex>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.insert"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %allocated_buffer, %new_ops = transform.structured.bufferize_to_allocation %0 {bufferize_destination_only, memory_space = 4 : i64} : !transform.any_op
      transform.yield 
    }
  }
}

