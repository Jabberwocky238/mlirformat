module {
  func.func @binary_ops(%arg0: index, %arg1: index) {
    %0 = shape.add %arg0, %arg1 : index, index -> index
    %1 = shape.mul %arg0, %arg1 : index, index -> index
    return
  }
}

// -----
module {
  func.func @binary_ops_on_size(%arg0: !shape.size, %arg1: !shape.size) {
    %0 = shape.add %arg0, %arg1 : !shape.size, !shape.size -> !shape.size
    %1 = shape.mul %arg0, %arg1 : !shape.size, !shape.size -> !shape.size
    return
  }
}

// -----
module {
  func.func @rank(%arg0: tensor<?xindex>) -> index {
    %0 = shape.rank %arg0 : tensor<?xindex> -> index
    return %0 : index
  }
}

// -----
module {
  func.func @get_extent(%arg0: tensor<?xindex>, %arg1: !shape.size) -> !shape.size {
    %0 = shape.get_extent %arg0, %arg1 : tensor<?xindex>, !shape.size -> !shape.size
    return %0 : !shape.size
  }
}

// -----
module {
  func.func @rank(%arg0: !shape.shape) {
    %0 = shape.rank %arg0 : !shape.shape -> !shape.size
    return
  }
}

// -----
module {
  func.func @dim(%arg0: tensor<2x3xf32>, %arg1: index) -> index {
    %0 = shape.dim %arg0, %arg1 : tensor<2x3xf32>, index -> index
    return %0 : index
  }
}

// -----
module {
  func.func @get_extent_shape_of(%arg0: tensor<2x3xf32>, %arg1: index) -> index {
    %0 = shape.shape_of %arg0 : tensor<2x3xf32> -> tensor<?xindex>
    %1 = shape.get_extent %0, %arg1 : tensor<?xindex>, index -> index
    return %1 : index
  }
}

// -----
module {
  func.func @get_extent_from_extent_tensor(%arg0: tensor<?xindex>, %arg1: index) -> index {
    %0 = shape.get_extent %arg0, %arg1 : tensor<?xindex>, index -> index
    return %0 : index
  }
}

// -----
module {
  func.func @const_shape() -> tensor<3xindex> {
    %0 = shape.const_shape [1, 2, 3] : tensor<3xindex>
    return %0 : tensor<3xindex>
  }
}

// -----
module {
  func.func @const_shape_zero_elements() -> tensor<0xindex> {
    %0 = shape.const_shape [] : tensor<0xindex>
    return %0 : tensor<0xindex>
  }
}

// -----
module {
  func.func @any_of_three(%arg0: tensor<?xindex>, %arg1: tensor<?xindex>, %arg2: tensor<?xindex>) -> tensor<?xindex> {
    %0 = shape.any %arg0, %arg1, %arg2 : tensor<?xindex>, tensor<?xindex>, tensor<?xindex> -> tensor<?xindex>
    return %0 : tensor<?xindex>
  }
}

// -----
module {
  func.func @any_of_one(%arg0: tensor<?xindex>) -> tensor<?xindex> {
    %0 = shape.any %arg0 : tensor<?xindex> -> tensor<?xindex>
    return %0 : tensor<?xindex>
  }
}

// -----
module {
  func.func @const_size() -> index {
    %c42 = shape.const_size 42
    %0 = shape.size_to_index %c42 : !shape.size
    return %0 : index
  }
}

// -----
module {
  func.func @to_extent_tensor(%arg0: tensor<?xindex>) -> tensor<3xindex> {
    %0 = shape.to_extent_tensor %arg0 : tensor<?xindex> -> tensor<3xindex>
    return %0 : tensor<3xindex>
  }
  func.func @shape_reduce(%arg0: tensor<?xindex>) -> index {
    %c1 = arith.constant 1 : index
    %0 = shape.reduce(%arg0, %c1) : tensor<?xindex> -> index {
    ^bb0(%arg1: index, %arg2: index, %arg3: index):
      %1 = arith.muli %arg3, %arg2 : index
      shape.yield %1 : index
    }
    return %0 : index
  }
}

// -----
module {
  func.func @shape_of(%arg0: tensor<*xf32>) {
    %0 = shape.shape_of %arg0 : tensor<*xf32> -> !shape.shape
    return
  }
}

// -----
module {
  func.func @shape_of_unranked(%arg0: tensor<*xf32>) {
    %0 = shape.shape_of %arg0 : tensor<*xf32> -> tensor<?xindex>
    return
  }
}

// -----
module {
  func.func @shape_of_stat(%arg0: tensor<1x2x3xf32>) {
    %0 = shape.shape_of %arg0 : tensor<1x2x3xf32> -> !shape.shape
    return
  }
}

// -----
module {
  func.func @shape_of_stat(%arg0: tensor<1x2x3xf32>) {
    %0 = shape.shape_of %arg0 : tensor<1x2x3xf32> -> tensor<?xindex>
    return
  }
}

// -----
module {
  func.func @shape_of_zero_d(%arg0: tensor<f32>) {
    %0 = shape.shape_of %arg0 : tensor<f32> -> tensor<?xindex>
    return
  }
}

// -----
module {
  func.func @shape_of_dyn(%arg0: tensor<1x5x?xf32>) {
    %0 = shape.shape_of %arg0 : tensor<1x5x?xf32> -> tensor<?xindex>
    return
  }
}

// -----
module {
  func.func @shape_eq(%arg0: tensor<?xindex>, %arg1: tensor<?xindex>) -> i1 {
    %0 = shape.shape_eq %arg0, %arg1 : tensor<?xindex>, tensor<?xindex>
    return %0 : i1
  }
}

// -----
module {
  func.func @shape_eq(%arg0: tensor<?xindex>, %arg1: tensor<?xindex>, %arg2: tensor<?xindex>) -> i1 {
    %0 = shape.shape_eq %arg0, %arg1, %arg2 : tensor<?xindex>, tensor<?xindex>, tensor<?xindex>
    return %0 : i1
  }
}

// -----
module {
  func.func @broadcast(%arg0: tensor<?xindex>, %arg1: !shape.shape) -> !shape.shape {
    %0 = shape.broadcast %arg0, %arg1 : tensor<?xindex>, !shape.shape -> !shape.shape
    return %0 : !shape.shape
  }
}

// -----
module {
  func.func @try_is_broadcastable(%arg0: tensor<2xindex>, %arg1: tensor<3xindex>, %arg2: tensor<2xindex>) -> i1 {
    %0 = shape.is_broadcastable %arg0, %arg1, %arg2 : tensor<2xindex>, tensor<3xindex>, tensor<2xindex>
    return %0 : i1
  }
}

// -----
module {
  func.func @broadcast(%arg0: tensor<2xindex>, %arg1: tensor<3xindex>, %arg2: tensor<2xindex>) -> !shape.witness {
    %0 = shape.cstr_broadcastable %arg0, %arg1, %arg2 : tensor<2xindex>, tensor<3xindex>, tensor<2xindex>
    return %0 : !shape.witness
  }
}

// -----
module {
  func.func @broadcast_3_shapes_different_extents(%arg0: tensor<2xindex>, %arg1: tensor<3xindex>, %arg2: tensor<2xindex>) {
    %0 = shape.broadcast %arg0, %arg1, %arg2 : tensor<2xindex>, tensor<3xindex>, tensor<2xindex> -> tensor<?xindex>
    return
  }
}

// -----
module {
  func.func @broadcast_to_known_rank(%arg0: tensor<1xindex>, %arg1: tensor<3xindex>) -> tensor<3xindex> {
    %0 = shape.broadcast %arg0, %arg1 : tensor<1xindex>, tensor<3xindex> -> tensor<3xindex>
    return %0 : tensor<3xindex>
  }
}

// -----
module {
  func.func @split_at(%arg0: tensor<?xindex>, %arg1: index) -> (tensor<?xindex>, tensor<?xindex>) {
    %head, %tail = "shape.split_at"(%arg0, %arg1) : (tensor<?xindex>, index) -> (tensor<?xindex>, tensor<?xindex>)
    return %head, %tail : tensor<?xindex>, tensor<?xindex>
  }
}

