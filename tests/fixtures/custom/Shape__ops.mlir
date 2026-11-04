module {
  func.func @shape_num_elements(%arg0: !shape.shape) -> !shape.size {
    %c1 = shape.const_size 1
    %0 = shape.reduce(%arg0, %c1) : !shape.shape -> !shape.size {
    ^bb0(%arg1: index, %arg2: !shape.size, %arg3: !shape.size):
      %1 = shape.mul %arg3, %arg2 : !shape.size, !shape.size -> !shape.size
      shape.yield %1 : !shape.size
    }
    return %0 : !shape.size
  }
  func.func @extent_tensor_num_elements(%arg0: tensor<?xindex>) -> index {
    %c1 = arith.constant 1 : index
    %0 = shape.reduce(%arg0, %c1) : tensor<?xindex> -> index {
    ^bb0(%arg1: index, %arg2: index, %arg3: index):
      %1 = shape.mul %arg3, %arg2 : index, index -> index
      shape.yield %1 : index
    }
    return %0 : index
  }
  func.func @test_shape_num_elements_unknown() {
    %0 = "shape.unknown_shape"() : () -> !shape.shape
    %1 = call @shape_num_elements(%0) : (!shape.shape) -> !shape.size
    %2 = "shape.print"(%1) : (!shape.size) -> !shape.size
    return
  }
  func.func @const_shape() {
    %0 = shape.const_shape [1, 2, 3] : !shape.shape
    %1 = shape.const_shape [4, 5, 6] : tensor<3xindex>
    return
  }
  func.func @test_shape_num_elements_fixed() {
    %0 = shape.const_shape [1, 57, 92] : !shape.shape
    %1 = call @shape_num_elements(%0) : (!shape.shape) -> !shape.size
    %2 = "shape.print"(%1) : (!shape.size) -> !shape.size
    return
  }
  func.func @test_broadcast_fixed() {
    %0 = shape.const_shape [10, 1, 57, 92] : !shape.shape
    %1 = shape.const_shape [4, 57, 92] : !shape.shape
    %2 = shape.broadcast %0, %1 : !shape.shape, !shape.shape -> !shape.shape
    %3 = "shape.print"(%2) : (!shape.shape) -> !shape.shape
    return
  }
  func.func @test_broadcast_extents() -> tensor<4xindex> {
    %0 = shape.const_shape [10, 1, 57, 92] : tensor<4xindex>
    %1 = shape.const_shape [4, 57, 92] : tensor<3xindex>
    %2 = shape.broadcast %0, %1 : tensor<4xindex>, tensor<3xindex> -> tensor<4xindex>
    return %2 : tensor<4xindex>
  }
  func.func @test_shape_any_fixed() {
    %0 = shape.const_shape [4, 57, 92] : !shape.shape
    %1 = shape.const_shape [4, 57, 92] : !shape.shape
    %2 = shape.meet %0, %1 : !shape.shape, !shape.shape -> !shape.shape
    %3 = "shape.print"(%2) : (!shape.shape) -> !shape.shape
    return
  }
  func.func @test_shape_any_unknown() {
    %0 = shape.const_shape [4, -1, 92] : !shape.shape
    %1 = shape.const_shape [-1, 57, 92] : !shape.shape
    %2 = shape.meet %0, %1 : !shape.shape, !shape.shape -> !shape.shape
    %3 = "shape.print"(%2) : (!shape.shape) -> !shape.shape
    return
  }
  func.func @test_shape_any_fixed_mismatch() {
    %0 = shape.const_shape [4, 57, 92] : !shape.shape
    %1 = shape.const_shape [2, 57, 92] : !shape.shape
    %2 = shape.meet %0, %1 : !shape.shape, !shape.shape -> !shape.shape
    %3 = "shape.print"(%2) : (!shape.shape) -> !shape.shape
    return
  }
  func.func @test_parse_const_shape() {
    %0 = shape.const_shape [] : !shape.shape
    %1 = shape.const_shape [1, 2, 3] : !shape.shape
    %2 = shape.const_shape [1, 2, 3] : tensor<3xindex>
    return
  }
  func.func @test_shape_of(%arg0: tensor<?xf32>) -> tensor<?xindex> {
    %0 = shape.shape_of %arg0 : tensor<?xf32> -> tensor<?xindex>
    return %0 : tensor<?xindex>
  }
  func.func @test_value_of(%arg0: !shape.value_shape) -> tensor<?xf32> {
    %0 = shape.value_of %arg0 : tensor<?xf32>
    return %0 : tensor<?xf32>
  }
  func.func @test_constraints() {
    %0 = shape.const_shape [] : !shape.shape
    %1 = shape.const_shape [1, 2, 3] : !shape.shape
    %true = arith.constant true
    %2 = shape.cstr_broadcastable %0, %1 : !shape.shape, !shape.shape
    %3 = shape.cstr_eq %0, %1 : !shape.shape, !shape.shape
    %4 = shape.const_witness true
    %5 = shape.const_witness false
    %6 = shape.cstr_require %true, "msg"
    %7 = shape.assuming_all %2, %3, %4, %5, %6
    %8 = shape.assuming %7 -> (!shape.shape) {
      %9 = shape.any %0, %1 : !shape.shape, !shape.shape -> !shape.shape
      shape.assuming_yield %9 : !shape.shape
    }
    return
  }
  func.func @eq_on_extent_tensors(%arg0: tensor<?xindex>, %arg1: tensor<?xindex>) {
    %0 = shape.cstr_eq %arg0, %arg1 : tensor<?xindex>, tensor<?xindex>
    return
  }
  func.func @broadcastable_on_extent_tensors(%arg0: tensor<?xindex>, %arg1: tensor<?xindex>) {
    %0 = shape.cstr_broadcastable %arg0, %arg1 : tensor<?xindex>, tensor<?xindex>
    return
  }
  func.func @mul(%arg0: !shape.size, %arg1: index) {
    %0 = shape.mul %arg0, %arg0 : !shape.size, !shape.size -> !shape.size
    %1 = shape.mul %arg1, %arg1 : index, index -> index
    %2 = shape.mul %arg0, %arg1 : !shape.size, index -> !shape.size
    return
  }
  func.func @div(%arg0: !shape.size, %arg1: index) {
    %0 = shape.div %arg0, %arg0 : !shape.size, !shape.size -> !shape.size
    %1 = shape.div %arg1, %arg1 : index, index -> index
    %2 = shape.div %arg0, %arg1 : !shape.size, index -> !shape.size
    return
  }
  func.func @add(%arg0: !shape.size, %arg1: index) {
    %0 = shape.add %arg0, %arg0 : !shape.size, !shape.size -> !shape.size
    %1 = shape.add %arg1, %arg1 : index, index -> index
    %2 = shape.add %arg0, %arg1 : !shape.size, index -> !shape.size
    return
  }
  func.func @const_size() {
    %c1 = shape.const_size 1
    %c2 = shape.const_size 2
    %c2_0 = shape.const_size 2
    return
  }
  func.func @test_to_extent_tensor(%arg0: !shape.shape) -> tensor<3xindex> {
    %0 = shape.to_extent_tensor %arg0 : !shape.shape -> tensor<3xindex>
    return %0 : tensor<3xindex>
  }
  func.func @test_identity_to_extent_tensor(%arg0: tensor<3xindex>) -> tensor<3xindex> {
    %0 = shape.to_extent_tensor %arg0 : tensor<3xindex> -> tensor<3xindex>
    return %0 : tensor<3xindex>
  }
  func.func @test_from_extent_tensor(%arg0: tensor<?xindex>) -> !shape.shape {
    %0 = shape.from_extent_tensor %arg0 : tensor<?xindex>
    return %0 : !shape.shape
  }
  func.func @rank(%arg0: !shape.shape) -> !shape.size {
    %0 = shape.rank %arg0 : !shape.shape -> !shape.size
    return %0 : !shape.size
  }
  func.func @rank_on_extent_tensor(%arg0: tensor<?xindex>) -> index {
    %0 = shape.rank %arg0 : tensor<?xindex> -> index
    return %0 : index
  }
  func.func @shape_eq_on_shapes(%arg0: !shape.shape, %arg1: !shape.shape) -> i1 {
    %0 = shape.shape_eq %arg0, %arg1 : !shape.shape, !shape.shape
    return %0 : i1
  }
  func.func @shape_eq_on_tensors(%arg0: tensor<?xindex>, %arg1: tensor<?xindex>) -> i1 {
    %0 = shape.shape_eq %arg0, %arg1 : tensor<?xindex>, tensor<?xindex>
    return %0 : i1
  }
  func.func @shape_eq_on_mixed(%arg0: tensor<?xindex>, %arg1: !shape.shape) -> i1 {
    %0 = shape.shape_eq %arg0, %arg1 : tensor<?xindex>, !shape.shape
    return %0 : i1
  }
  func.func @get_extent_on_shape(%arg0: !shape.shape) -> !shape.size {
    %c0 = shape.const_size 0
    %0 = shape.get_extent %arg0, %c0 : !shape.shape, !shape.size -> !shape.size
    return %0 : !shape.size
  }
  func.func @get_extent_on_extent_tensor(%arg0: tensor<?xindex>) -> index {
    %c0 = arith.constant 0 : index
    %0 = shape.get_extent %arg0, %c0 : tensor<?xindex>, index -> index
    return %0 : index
  }
  func.func @get_dim(%arg0: memref<?x?xindex>) -> index {
    %c0 = arith.constant 0 : index
    %0 = shape.dim %arg0, %c0 : memref<?x?xindex>, index -> index
    return %0 : index
  }
  func.func @get_extent_on_mixed_operands(%arg0: tensor<?xindex>) -> !shape.size {
    %c0 = shape.const_size 0
    %0 = shape.get_extent %arg0, %c0 : tensor<?xindex>, !shape.size -> !shape.size
    return %0 : !shape.size
  }
  func.func @any() {
    %0 = shape.const_shape [1, 2, 3] : !shape.shape
    %1 = shape.const_shape [4, 5, 6] : !shape.shape
    %2 = shape.any %0, %1 : !shape.shape, !shape.shape -> !shape.shape
    %3 = shape.const_shape [1, 2, 3] : tensor<3xindex>
    %4 = shape.const_shape [4, 5, 6] : tensor<3xindex>
    %5 = shape.any %3, %4 : tensor<3xindex>, tensor<3xindex> -> tensor<3xindex>
    return
  }
  func.func @num_elements_extent_tensor(%arg0: tensor<?xindex>) -> index {
    %0 = shape.num_elements %arg0 : tensor<?xindex> -> index
    return %0 : index
  }
  func.func @num_elements_shape(%arg0: !shape.shape) -> !shape.size {
    %0 = shape.num_elements %arg0 : !shape.shape -> !shape.size
    return %0 : !shape.size
  }
  func.func @shape_equal_shapes(%arg0: !shape.value_shape, %arg1: !shape.value_shape) -> !shape.shape {
    %0 = shape.shape_of %arg0 : !shape.value_shape -> !shape.shape
    %1 = shape.shape_of %arg1 : !shape.value_shape -> !shape.shape
    %2 = shape.meet %0, %1 : !shape.shape, !shape.shape -> !shape.shape
    return %2 : !shape.shape
  }
  func.func @shape_with_shape(%arg0: !shape.value_shape, %arg1: !shape.value_shape) -> !shape.shape {
    %0 = shape.shape_of %arg0 : !shape.value_shape -> !shape.shape
    %1 = shape.with_shape %arg1, %0 : !shape.value_shape, !shape.shape
    %2 = call @shape_equal_shapes(%arg0, %1) : (!shape.value_shape, !shape.value_shape) -> !shape.shape
    return %2 : !shape.shape
  }
  func.func @shape_with_shape_extent_tensor_type(%arg0: tensor<?x?x?xf32>, %arg1: !shape.value_shape) -> !shape.value_shape {
    %0 = shape.shape_of %arg0 : tensor<?x?x?xf32> -> tensor<3xindex>
    %1 = shape.with_shape %arg1, %0 : !shape.value_shape, tensor<3xindex>
    return %1 : !shape.value_shape
  }
  func.func @any_on_shape(%arg0: !shape.shape, %arg1: !shape.shape, %arg2: !shape.shape) -> !shape.shape {
    %0 = shape.any %arg0, %arg1, %arg2 : !shape.shape, !shape.shape, !shape.shape -> !shape.shape
    return %0 : !shape.shape
  }
  func.func @any_on_mixed(%arg0: tensor<?xindex>, %arg1: tensor<?xindex>, %arg2: !shape.shape) -> !shape.shape {
    %0 = shape.any %arg0, %arg1, %arg2 : tensor<?xindex>, tensor<?xindex>, !shape.shape -> !shape.shape
    return %0 : !shape.shape
  }
  func.func @any_on_extent_tensors(%arg0: tensor<?xindex>, %arg1: tensor<?xindex>, %arg2: tensor<?xindex>) -> tensor<?xindex> {
    %0 = shape.any %arg0, %arg1, %arg2 : tensor<?xindex>, tensor<?xindex>, tensor<?xindex> -> tensor<?xindex>
    return %0 : tensor<?xindex>
  }
  func.func @is_broadcastable_on_extent_tensors(%arg0: tensor<?xindex>, %arg1: tensor<?xindex>) -> i1 {
    %0 = shape.is_broadcastable %arg0, %arg1 : tensor<?xindex>, tensor<?xindex>
    return %0 : i1
  }
  func.func @is_broadcastable_on_shapes(%arg0: !shape.shape, %arg1: !shape.shape) -> i1 {
    %0 = shape.is_broadcastable %arg0, %arg1 : !shape.shape, !shape.shape
    return %0 : i1
  }
  func.func @shape_upper_bounded_by_constant(%arg0: !shape.shape) -> !shape.shape {
    %0 = shape.const_shape [4, 57, 92] : !shape.shape
    %1 = shape.max %arg0, %0 : !shape.shape, !shape.shape -> !shape.shape
    %2 = shape.meet %0, %1, error = "exceeded element-wise upper bound" : !shape.shape, !shape.shape -> !shape.shape
    return %2 : !shape.shape
  }
  func.func @shape_lower_bounded_by_constant(%arg0: !shape.shape) -> !shape.shape {
    %0 = shape.const_shape [4, 57, 92] : !shape.shape
    %1 = shape.min %arg0, %0 : !shape.shape, !shape.shape -> !shape.shape
    %2 = shape.meet %0, %1, error = "lower bound element-wise exceeded" : !shape.shape, !shape.shape -> !shape.shape
    return %2 : !shape.shape
  }
  func.func @size_upper_bounded_by_constant(%arg0: !shape.size) -> !shape.size {
    %c5 = shape.const_size 5
    %0 = shape.max %arg0, %c5 : !shape.size, !shape.size -> !shape.size
    %1 = shape.meet %c5, %0, error = "exceeded element-wise upper bound" : !shape.size, !shape.size -> !shape.size
    return %1 : !shape.size
  }
  func.func @size_lower_bounded_by_constant(%arg0: !shape.size) -> !shape.size {
    %c9 = shape.const_size 9
    %0 = shape.min %arg0, %c9 : !shape.size, !shape.size -> !shape.size
    %1 = shape.meet %c9, %0, error = "lower bound element-wise exceeded" : !shape.size, !shape.size -> !shape.size
    return %1 : !shape.size
  }
  func.func @meet_index(%arg0: index, %arg1: index) -> index {
    %0 = shape.meet %arg0, %arg1 : index, index -> index
    return %0 : index
  }
}

