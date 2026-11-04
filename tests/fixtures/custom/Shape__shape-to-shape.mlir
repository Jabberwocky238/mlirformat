module {
  func.func @num_elements_to_reduce(%arg0: !shape.shape) -> !shape.size {
    %0 = shape.num_elements %arg0 : !shape.shape -> !shape.size
    return %0 : !shape.size
  }
}

// -----
module {
  func.func @num_elements_to_reduce_on_index(%arg0: tensor<?xindex>) -> index {
    %0 = shape.num_elements %arg0 : tensor<?xindex> -> index
    return %0 : index
  }
}

