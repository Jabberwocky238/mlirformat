module {
  func.func @f(%arg0: tensor<2x3x4xf32>) -> tensor<3xindex> {
    %0 = shape.shape_of %arg0 : tensor<2x3x4xf32> -> tensor<3xindex>
    return %0 : tensor<3xindex>
  }
}

// -----
module {
  func.func @f() -> (!shape.shape, !shape.shape) {
    %c2 = arith.constant 2 : index
    %0 = shape.const_shape [2, 3, 4, 5] : !shape.shape
    %head, %tail = "shape.split_at"(%0, %c2) : (!shape.shape, index) -> (!shape.shape, !shape.shape)
    return %head, %tail : !shape.shape, !shape.shape
  }
}

// -----
module {
  func.func @f() -> (!shape.shape, !shape.shape) {
    %c-1 = arith.constant -1 : index
    %0 = shape.const_shape [2, 3, 4, 5] : !shape.shape
    %head, %tail = "shape.split_at"(%0, %c-1) : (!shape.shape, index) -> (!shape.shape, !shape.shape)
    return %head, %tail : !shape.shape, !shape.shape
  }
}

// -----
module {
  func.func @f() -> (!shape.shape, !shape.shape) {
    %c5 = arith.constant 5 : index
    %0 = shape.const_shape [2, 3, 4, 5] : !shape.shape
    %head, %tail = "shape.split_at"(%0, %c5) : (!shape.shape, index) -> (!shape.shape, !shape.shape)
    return %head, %tail : !shape.shape, !shape.shape
  }
}

// -----
module {
  func.func @f() -> !shape.shape {
    %0 = shape.const_shape [1, 2] : !shape.shape
    %1 = shape.const_shape [7, 1] : !shape.shape
    %2 = shape.broadcast %0, %1 : !shape.shape, !shape.shape -> !shape.shape
    return %2 : !shape.shape
  }
}

// -----
module {
  func.func @broadcast() -> tensor<2xindex> {
    %0 = shape.const_shape [1, 2] : tensor<2xindex>
    %1 = shape.const_shape [7, 1] : tensor<2xindex>
    %2 = shape.broadcast %0, %1 : tensor<2xindex>, tensor<2xindex> -> tensor<2xindex>
    return %2 : tensor<2xindex>
  }
}

// -----
module {
  func.func @broadcast() -> !shape.shape {
    %0 = shape.const_shape [1, 2] : tensor<2xindex>
    %1 = shape.const_shape [7, 1] : tensor<2xindex>
    %2 = shape.broadcast %0, %1 : tensor<2xindex>, tensor<2xindex> -> !shape.shape
    return %2 : !shape.shape
  }
}

// -----
module {
  func.func @broadcast_variadic() -> !shape.shape {
    %0 = shape.const_shape [2, 1] : tensor<2xindex>
    %1 = shape.const_shape [7, 2, 1] : tensor<3xindex>
    %2 = shape.const_shape [1, 10] : tensor<2xindex>
    %3 = shape.broadcast %0, %1, %2 : tensor<2xindex>, tensor<3xindex>, tensor<2xindex> -> !shape.shape
    return %3 : !shape.shape
  }
}

// -----
module {
  func.func @f(%arg0: !shape.shape) -> !shape.shape {
    %0 = shape.const_shape [] : !shape.shape
    %1 = shape.broadcast %arg0, %0 : !shape.shape, !shape.shape -> !shape.shape
    return %1 : !shape.shape
  }
}

// -----
module {
  func.func @f(%arg0: !shape.shape) -> !shape.shape {
    %0 = shape.const_shape [] : !shape.shape
    %1 = shape.broadcast %0, %arg0 : !shape.shape, !shape.shape -> !shape.shape
    return %1 : !shape.shape
  }
}

// -----
module {
  func.func @f() -> !shape.shape {
    %0 = shape.const_shape [] : !shape.shape
    %1 = shape.const_shape [1, 2, 3] : !shape.shape
    %2 = shape.broadcast %0, %1 : !shape.shape, !shape.shape -> !shape.shape
    return %2 : !shape.shape
  }
}

// -----
module {
  func.func @all_but_one_empty(%arg0: !shape.shape) -> !shape.shape {
    %0 = shape.const_shape [] : !shape.shape
    %1 = shape.const_shape [] : tensor<0xindex>
    %2 = shape.broadcast %0, %arg0, %1, %0 : !shape.shape, !shape.shape, tensor<0xindex>, !shape.shape -> !shape.shape
    return %2 : !shape.shape
  }
}

// -----
module {
  func.func @all_empty(%arg0: tensor<f32>, %arg1: tensor<i1>) -> tensor<0xindex> {
    %0 = shape.shape_of %arg0 : tensor<f32> -> tensor<0xindex>
    %1 = shape.shape_of %arg1 : tensor<i1> -> tensor<0xindex>
    %2 = shape.const_shape [] : tensor<0xindex>
    %3 = shape.broadcast %0, %1, %2 : tensor<0xindex>, tensor<0xindex>, tensor<0xindex> -> tensor<0xindex>
    return %3 : tensor<0xindex>
  }
}

// -----
module {
  func.func @partial_folding(%arg0: !shape.shape) -> !shape.shape {
    %0 = shape.const_shape [2, 1] : !shape.shape
    %1 = shape.const_shape [1, 2, 3] : tensor<3xindex>
    %2 = shape.broadcast %0, %arg0, %1, %0 : !shape.shape, !shape.shape, tensor<3xindex>, !shape.shape -> !shape.shape
    return %2 : !shape.shape
  }
}

// -----
module {
  func.func @f() -> !shape.shape {
    %0 = shape.const_shape [2] : !shape.shape
    %1 = shape.const_shape [7] : !shape.shape
    %2 = shape.broadcast %0, %1 : !shape.shape, !shape.shape -> !shape.shape
    return %2 : !shape.shape
  }
}

// -----
module {
  func.func @broadcast(%arg0: !shape.shape, %arg1: !shape.shape) {
    %0 = shape.broadcast %arg0, %arg1 : !shape.shape, !shape.shape -> !shape.shape
    return
  }
}

// -----
module {
  func.func @f() -> !shape.shape {
    %0 = shape.const_shape [0, 1] : !shape.shape
    %1 = shape.const_shape [2, 3] : !shape.shape
    %2 = shape.concat %0, %1 : !shape.shape, !shape.shape -> !shape.shape
    return %2 : !shape.shape
  }
}

// -----
module {
  func.func @f() -> tensor<4xindex> {
    %0 = shape.const_shape [0, 1] : tensor<2xindex>
    %1 = shape.const_shape [2, 3] : tensor<2xindex>
    %2 = shape.concat %0, %1 : tensor<2xindex>, tensor<2xindex> -> tensor<4xindex>
    return %2 : tensor<4xindex>
  }
}

// -----
module {
  func.func @f() -> tensor<2xindex> {
    %0 = shape.const_shape [0, 1] : !shape.shape
    %1 = shape.to_extent_tensor %0 : !shape.shape -> tensor<2xindex>
    return %1 : tensor<2xindex>
  }
}

// -----
module {
  func.func @f() -> !shape.shape {
    %c3 = arith.constant 3 : index
    %c5 = arith.constant 5 : index
    %c11 = arith.constant 11 : index
    %0 = shape.from_extents %c3, %c5, %c11 : index, index, index
    return %0 : !shape.shape
  }
}

// -----
module {
  func.func @fold_const_size() -> !shape.shape {
    %c3 = shape.const_size 3
    %c5 = shape.const_size 5
    %0 = shape.from_extents %c3, %c5 : !shape.size, !shape.size
    return %0 : !shape.shape
  }
}

// -----
module {
  func.func @no_fold(%arg0: index) -> !shape.shape {
    %c3 = arith.constant 3 : index
    %0 = shape.from_extents %c3, %arg0 : index, index
    return %0 : !shape.shape
  }
}

// -----
module {
  func.func @from_extents_poison() -> !shape.shape {
    %0 = ub.poison : index
    %1 = shape.from_extents %0 : index
    return %1 : !shape.shape
  }
}

// -----
module {
  func.func @const_size_to_index() -> index {
    %c123 = shape.const_size 123
    %0 = shape.size_to_index %c123 : !shape.size
    return %0 : index
  }
}

// -----
module {
  func.func @const_index_to_size() -> !shape.size {
    %c123 = arith.constant 123 : index
    %0 = shape.index_to_size %c123
    return %0 : !shape.size
  }
}

// -----
module {
  func.func @const_index_to_size_to_index() -> index {
    %c123 = arith.constant 123 : index
    %0 = shape.index_to_size %c123
    %1 = shape.size_to_index %0 : !shape.size
    return %1 : index
  }
}

// -----
module {
  func.func @nonfoldable_size_to_index(%arg0: !shape.size) -> index {
    %0 = shape.size_to_index %arg0 : !shape.size
    return %0 : index
  }
}

// -----
module {
  func.func @nonfoldable_index_to_size(%arg0: index) -> !shape.size {
    %0 = shape.index_to_size %arg0
    return %0 : !shape.size
  }
}

// -----
module {
  func.func @num_elements() -> !shape.size {
    %0 = shape.const_shape [4, 5, 6] : !shape.shape
    %1 = shape.num_elements %0 : !shape.shape -> !shape.size
    return %1 : !shape.size
  }
}

// -----
module {
  func.func @nonfoldable_num_elements(%arg0: !shape.shape) -> !shape.size {
    %0 = shape.num_elements %arg0 : !shape.shape -> !shape.size
    return %0 : !shape.size
  }
}

// -----
module {
  func.func @basic() -> index {
    %0 = shape.const_shape [0, 1, 2] : tensor<3xindex>
    %c2 = arith.constant 2 : index
    %1 = shape.get_extent %0, %c2 : tensor<3xindex>, index -> index
    return %1 : index
  }
}

// -----
module {
  func.func @out_of_bounds() -> index {
    %0 = shape.const_shape [0, 1, 2] : tensor<3xindex>
    %c3 = arith.constant 3 : index
    %1 = shape.get_extent %0, %c3 : tensor<3xindex>, index -> index
    return %1 : index
  }
}

// -----
module {
  func.func @not_const(%arg0: tensor<?xindex>) -> index {
    %c3 = arith.constant 3 : index
    %0 = shape.get_extent %arg0, %c3 : tensor<?xindex>, index -> index
    return %0 : index
  }
}

// -----
module {
  func.func @basic() -> !shape.size {
    %0 = shape.const_shape [0, 1, 2] : !shape.shape
    %c2 = shape.const_size 2
    %1 = shape.get_extent %0, %c2 : !shape.shape, !shape.size -> !shape.size
    return %1 : !shape.size
  }
}

// -----
module {
  func.func @out_of_bounds() -> !shape.size {
    %0 = shape.const_shape [0, 1, 2] : !shape.shape
    %c3 = shape.const_size 3
    %1 = shape.get_extent %0, %c3 : !shape.shape, !shape.size -> !shape.size
    return %1 : !shape.size
  }
}

// -----
module {
  func.func @not_const(%arg0: !shape.shape) -> !shape.size {
    %c3 = shape.const_size 3
    %0 = shape.get_extent %arg0, %c3 : !shape.shape, !shape.size -> !shape.size
    return %0 : !shape.size
  }
}

// -----
module {
  func.func @f(%arg0: !shape.shape) {
    %0 = shape.cstr_eq %arg0, %arg0, %arg0 : !shape.shape, !shape.shape, !shape.shape
    "consume.witness"(%0) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f() {
    %0 = shape.const_shape [0, 1] : !shape.shape
    %1 = shape.const_shape [0, 1] : !shape.shape
    %2 = shape.const_shape [0, 1] : !shape.shape
    %3 = shape.cstr_eq %0, %1, %2 : !shape.shape, !shape.shape, !shape.shape
    "consume.witness"(%3) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f() {
    %0 = shape.const_shape [0, 1] : !shape.shape
    %1 = shape.const_shape [3, 1] : !shape.shape
    %2 = shape.cstr_eq %0, %1 : !shape.shape, !shape.shape
    "consume.witness"(%2) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f(%arg0: !shape.shape, %arg1: !shape.shape) {
    %0 = shape.cstr_eq %arg0, %arg1 : !shape.shape, !shape.shape
    "consume.witness"(%0) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @cstr_require_fold() {
    %true = arith.constant true
    %0 = shape.cstr_require %true, "msg"
    "consume.witness"(%0) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @cstr_require_no_fold(%arg0: i1) {
    %0 = shape.cstr_require %arg0, "msg"
    "consume.witness"(%0) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f() {
    %0 = "test.source"() : () -> !shape.witness
    %1 = "test.source"() : () -> !shape.witness
    %2 = "test.source"() : () -> !shape.witness
    %3 = shape.assuming_all %0, %1
    %4 = shape.assuming_all %3, %2
    "consume.witness"(%4) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @assuming_all_to_cstr_eq(%arg0: !shape.shape, %arg1: tensor<?xindex>, %arg2: tensor<3xindex>) -> !shape.witness {
    %0 = shape.cstr_eq %arg0, %arg1 : !shape.shape, tensor<?xindex>
    %1 = shape.cstr_eq %arg1, %arg2 : tensor<?xindex>, tensor<3xindex>
    %2 = shape.assuming_all %0, %1
    return %2 : !shape.witness
  }
}

// -----
module {
  func.func @assuming_all_duplicate_operands(%arg0: tensor<?xindex>, %arg1: tensor<?xindex>) -> !shape.witness {
    %0 = shape.cstr_broadcastable %arg0, %arg1 : tensor<?xindex>, tensor<?xindex>
    %1 = shape.assuming_all %0, %0, %0
    return %1 : !shape.witness
  }
}

// -----
module {
  func.func @assuming_all_to_cstr_eq(%arg0: !shape.shape, %arg1: tensor<?xindex>, %arg2: tensor<3xindex>, %arg3: tensor<3xindex>) -> !shape.witness {
    %0 = shape.cstr_eq %arg0, %arg1 : !shape.shape, tensor<?xindex>
    %1 = shape.cstr_eq %arg2, %arg3 : tensor<3xindex>, tensor<3xindex>
    %2 = shape.assuming_all %0, %1
    return %2 : !shape.witness
  }
}

// -----
module {
  func.func @f() {
    %0 = shape.const_witness true
    %1 = shape.const_witness true
    %2 = shape.const_witness true
    %3 = shape.assuming_all %0, %1, %2
    "consume.witness"(%3) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f() {
    %0 = shape.const_witness true
    %1 = "test.source"() : () -> !shape.witness
    %2 = "test.source"() : () -> !shape.witness
    %3 = shape.assuming_all %0, %1, %2
    "consume.witness"(%3) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f(%arg0: !shape.shape, %arg1: !shape.shape, %arg2: !shape.shape) {
    %0 = shape.cstr_broadcastable %arg0, %arg1 : !shape.shape, !shape.shape
    %1 = shape.cstr_broadcastable %arg0, %arg1, %arg2 : !shape.shape, !shape.shape, !shape.shape
    %2 = shape.assuming_all %0, %1
    "consume.witness"(%2) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f(%arg0: !shape.shape, %arg1: !shape.shape, %arg2: !shape.shape) {
    %0 = shape.cstr_broadcastable %arg0, %arg1 : !shape.shape, !shape.shape
    %1 = shape.cstr_broadcastable %arg1, %arg2 : !shape.shape, !shape.shape
    %2 = shape.assuming_all %0, %1
    "consume.witness"(%2) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f(%arg0: !shape.shape) -> !shape.shape {
    %0 = shape.const_shape [2, 3, 4] : !shape.shape
    %1 = shape.any %0, %arg0 : !shape.shape, !shape.shape -> !shape.shape
    return %1 : !shape.shape
  }
}

// -----
module {
  func.func @f(%arg0: tensor<?xindex>) -> tensor<3xindex> {
    %0 = shape.const_shape [2, 3, 4] : tensor<3xindex>
    %1 = shape.any %0, %arg0 : tensor<3xindex>, tensor<?xindex> -> tensor<3xindex>
    return %1 : tensor<3xindex>
  }
}

// -----
module {
  func.func @f(%arg0: !shape.shape, %arg1: !shape.shape) -> !shape.shape {
    %0 = shape.any %arg0, %arg1 : !shape.shape, !shape.shape -> !shape.shape
    return %0 : !shape.shape
  }
}

// -----
module {
  func.func @f() {
    %0 = shape.const_witness true
    %1 = shape.assuming %0 -> (index) {
      %2 = "test.source"() : () -> index
      shape.assuming_yield %2 : index
    }
    "test.sink"(%1) : (index) -> ()
    return
  }
}

// -----
module {
  func.func @f() {
    %0 = "test.source"() : () -> !shape.witness
    %1 = shape.assuming %0 -> (index) {
      %2 = "test.source"() : () -> index
      shape.assuming_yield %2 : index
    }
    "test.sink"(%1) : (index) -> ()
    return
  }
}

// -----
module {
  func.func @unused_assuming_results() {
    %0 = "test.source"() : () -> !shape.witness
    %1:2 = shape.assuming %0 -> (f32, f32) {
      %2 = "produce.redundant"() : () -> f32
      %3 = "produce.meaningful"() : () -> f32
      shape.assuming_yield %2, %3 : f32, f32
    }
    "use"(%1#1) : (f32) -> ()
    return
  }
}

// -----
module {
  func.func @f() {
    %0 = shape.const_shape [3, 1] : !shape.shape
    %1 = shape.const_shape [1, 5] : !shape.shape
    %2 = shape.cstr_broadcastable %0, %1 : !shape.shape, !shape.shape
    "consume.witness"(%2) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f(%arg0: tensor<?xindex>, %arg1: tensor<?xindex>, %arg2: tensor<0xindex>) {
    %0 = shape.const_shape [] : !shape.shape
    %1 = shape.cstr_broadcastable %arg0, %arg1, %0, %arg2 : tensor<?xindex>, tensor<?xindex>, !shape.shape, tensor<0xindex>
    "consume.witness"(%1) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @static_non_broadcastable() {
    %0 = shape.const_shape [1, 3] : !shape.shape
    %1 = shape.const_shape [1, 5] : !shape.shape
    %2 = shape.cstr_broadcastable %0, %1 : !shape.shape, !shape.shape
    "consume.witness"(%2) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f(%arg0: !shape.shape) {
    %0 = shape.const_shape [1, 3] : !shape.shape
    %1 = shape.cstr_broadcastable %arg0, %0 : !shape.shape, !shape.shape
    "consume.witness"(%1) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f(%arg0: !shape.shape) {
    %0 = shape.cstr_broadcastable %arg0, %arg0 : !shape.shape, !shape.shape
    "consume.witness"(%0) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @broadcastable_on_extent_tensors(%arg0: tensor<?xindex>) {
    %0 = shape.cstr_broadcastable %arg0, %arg0 : tensor<?xindex>, tensor<?xindex>
    "consume.witness"(%0) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f() {
    %0 = shape.const_shape [8, 1] : !shape.shape
    %1 = shape.const_shape [1, 8] : !shape.shape
    %2 = shape.const_shape [1, 1] : !shape.shape
    %3 = shape.cstr_broadcastable %0, %1, %2 : !shape.shape, !shape.shape, !shape.shape
    "consume.witness"(%3) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f() {
    %0 = shape.const_shape [8, 1] : !shape.shape
    %1 = shape.const_shape [1, -9223372036854775808] : !shape.shape
    %2 = shape.cstr_broadcastable %0, %0, %1 : !shape.shape, !shape.shape, !shape.shape
    "consume.witness"(%2) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f() {
    %0 = shape.const_shape [8, 1] : !shape.shape
    %1 = shape.const_shape [1, 8] : !shape.shape
    %2 = shape.const_shape [1, -9223372036854775808] : !shape.shape
    %3 = shape.cstr_broadcastable %0, %1, %2 : !shape.shape, !shape.shape, !shape.shape
    "consume.witness"(%3) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f() {
    %0 = shape.const_shape [8, 1] : !shape.shape
    %1 = shape.const_shape [1, -9223372036854775808] : !shape.shape
    %2 = shape.const_shape [8, -9223372036854775808] : !shape.shape
    %3 = shape.cstr_broadcastable %0, %1, %2 : !shape.shape, !shape.shape, !shape.shape
    "consume.witness"(%3) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f(%arg0: !shape.shape) {
    %0 = shape.const_shape [] : !shape.shape
    %1 = shape.cstr_broadcastable %0, %0, %arg0 : !shape.shape, !shape.shape, !shape.shape
    "consume.witness"(%1) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @f(%arg0: !shape.shape) {
    %0 = shape.const_shape [] : !shape.shape
    %1 = shape.const_shape [2] : !shape.shape
    %2 = shape.cstr_broadcastable %0, %1, %arg0 : !shape.shape, !shape.shape, !shape.shape
    "consume.witness"(%2) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @fold_rank() -> !shape.size {
    %0 = shape.const_shape [3, 4, 5, 6, 7] : !shape.shape
    %1 = shape.rank %0 : !shape.shape -> !shape.size
    return %1 : !shape.size
  }
}

// -----
module {
  func.func @dont_fold_rank(%arg0: !shape.shape) -> !shape.size {
    %0 = shape.rank %arg0 : !shape.shape -> !shape.size
    return %0 : !shape.size
  }
}

// -----
module {
  func.func @fold_rank() -> index {
    %0 = shape.const_shape [3, 4, 5, 6, 7] : tensor<5xindex>
    %1 = shape.rank %0 : tensor<5xindex> -> index
    return %1 : index
  }
}

// -----
module {
  func.func @dont_fold_rank(%arg0: tensor<?xindex>) -> index {
    %0 = shape.rank %arg0 : tensor<?xindex> -> index
    return %0 : index
  }
}

// -----
module {
  func.func @canonicalize_rank(%arg0: tensor<1x2x?xf32>) -> index {
    %0 = shape.shape_of %arg0 : tensor<1x2x?xf32> -> tensor<?xindex>
    %1 = shape.rank %0 : tensor<?xindex> -> index
    return %1 : index
  }
}

// -----
module {
  func.func @canonicalize_rank_size(%arg0: tensor<1x2x?xf32>) -> !shape.size {
    %0 = shape.shape_of %arg0 : tensor<1x2x?xf32> -> !shape.shape
    %1 = shape.rank %0 : !shape.shape -> !shape.size
    return %1 : !shape.size
  }
}

// -----
module {
  func.func @dont_canonicalize_rank(%arg0: tensor<*xf32>) -> index {
    %0 = shape.shape_of %arg0 : tensor<*xf32> -> tensor<?xindex>
    %1 = shape.rank %0 : tensor<?xindex> -> index
    return %1 : index
  }
}

// -----
module {
  func.func @index_to_size_to_index(%arg0: index) -> index {
    %0 = shape.index_to_size %arg0
    %1 = shape.size_to_index %0 : !shape.size
    return %1 : index
  }
}

// -----
module {
  func.func @size_to_index_to_size(%arg0: !shape.size) -> !shape.size {
    %0 = shape.size_to_index %arg0 : !shape.size
    %1 = shape.index_to_size %0
    return %1 : !shape.size
  }
}

// -----
module {
  func.func @cstr_broadcastable_scalar(%arg0: tensor<?xf32>) {
    %0 = shape.const_shape [] : !shape.shape
    %1 = shape.shape_of %arg0 : tensor<?xf32> -> tensor<?xindex>
    %2 = shape.cstr_broadcastable %0, %1 : !shape.shape, tensor<?xindex>
    "consume.witness"(%2) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @cstr_broadcastable_unknown(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>) {
    %0 = shape.shape_of %arg0 : tensor<?xf32> -> tensor<?xindex>
    %1 = shape.shape_of %arg1 : tensor<?xf32> -> tensor<?xindex>
    %2 = shape.cstr_broadcastable %0, %1 : tensor<?xindex>, tensor<?xindex>
    "consume.witness"(%2) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @cstr_broadcastable_scalar_unranked(%arg0: tensor<*xf32>, %arg1: tensor<index>) {
    %0 = shape.shape_of %arg1 : tensor<index> -> tensor<?xindex>
    %1 = shape.shape_of %arg0 : tensor<*xf32> -> tensor<?xindex>
    %2 = shape.cstr_broadcastable %0, %1 : tensor<?xindex>, tensor<?xindex>
    "consume.witness"(%2) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @shape_eq_fold_1() -> i1 {
    %0 = shape.const_shape [1, 2, 3] : !shape.shape
    %1 = shape.const_shape [1, 2, 3] : tensor<3xindex>
    %2 = shape.const_shape [1, 2, 3] : tensor<3xindex>
    %3 = shape.shape_eq %0, %1, %2 : !shape.shape, tensor<3xindex>, tensor<3xindex>
    return %3 : i1
  }
}

// -----
module {
  func.func @shape_eq_fold_0() -> i1 {
    %0 = shape.const_shape [1, 2, 3] : tensor<3xindex>
    %1 = shape.const_shape [4, 5, 6] : tensor<3xindex>
    %2 = shape.const_shape [4, 5, 6] : tensor<3xindex>
    %3 = shape.shape_eq %0, %1, %2 : tensor<3xindex>, tensor<3xindex>, tensor<3xindex>
    return %3 : i1
  }
}

// -----
module {
  func.func @shape_eq_fold_0() -> i1 {
    %0 = shape.const_shape [1, 2, 3, 4, 5, 6] : !shape.shape
    %1 = shape.const_shape [1, 2, 3] : !shape.shape
    %2 = shape.shape_eq %0, %1 : !shape.shape, !shape.shape
    return %2 : i1
  }
}

// -----
module {
  func.func @shape_eq_do_not_fold(%arg0: !shape.shape) -> i1 {
    %0 = shape.const_shape [4, 5, 6] : !shape.shape
    %1 = shape.shape_eq %arg0, %0 : !shape.shape, !shape.shape
    return %1 : i1
  }
}

// -----
module {
  func.func @fold_add_size() -> !shape.size {
    %c2 = shape.const_size 2
    %c3 = shape.const_size 3
    %0 = shape.add %c2, %c3 : !shape.size, !shape.size -> !shape.size
    return %0 : !shape.size
  }
}

// -----
module {
  func.func @fold_mul_size() -> !shape.size {
    %c2 = shape.const_size 2
    %c3 = shape.const_size 3
    %0 = shape.mul %c2, %c3 : !shape.size, !shape.size -> !shape.size
    return %0 : !shape.size
  }
}

// -----
module {
  func.func @fold_mul_index() -> index {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %0 = shape.mul %c2, %c3 : index, index -> index
    return %0 : index
  }
}

// -----
module {
  func.func @fold_mul_mixed() -> !shape.size {
    %c2 = shape.const_size 2
    %c3 = arith.constant 3 : index
    %0 = shape.mul %c2, %c3 : !shape.size, index -> !shape.size
    return %0 : !shape.size
  }
}

// -----
module {
  func.func @fold_div_size() -> !shape.size {
    %c10 = shape.const_size 10
    %c3 = shape.const_size 3
    %0 = shape.div %c10, %c3 : !shape.size, !shape.size -> !shape.size
    return %0 : !shape.size
  }
}

// -----
module {
  func.func @fold_div_index() -> index {
    %c10 = arith.constant 10 : index
    %c4 = arith.constant 4 : index
    %0 = shape.div %c10, %c4 : index, index -> index
    return %0 : index
  }
}

// -----
module {
  func.func @fold_div_index_neg_lhs() -> index {
    %c-10 = arith.constant -10 : index
    %c4 = arith.constant 4 : index
    %0 = shape.div %c-10, %c4 : index, index -> index
    return %0 : index
  }
}

// -----
module {
  func.func @fold_div_index_neg_rhs() -> index {
    %c10 = arith.constant 10 : index
    %c-4 = arith.constant -4 : index
    %0 = shape.div %c10, %c-4 : index, index -> index
    return %0 : index
  }
}

// -----
module {
  func.func @fold_div_mixed() -> !shape.size {
    %c12 = shape.const_size 12
    %c3 = arith.constant 3 : index
    %0 = shape.div %c12, %c3 : !shape.size, index -> !shape.size
    return %0 : !shape.size
  }
}

// -----
module {
  func.func @fold_index_cast_on_index(%arg0: index) -> index {
    %0 = shape.size_to_index %arg0 : index
    return %0 : index
  }
}

// -----
module {
  func.func @fold_to_extent_tensor_on_tensor(%arg0: tensor<?xindex>) -> tensor<?xindex> {
    %0 = shape.to_extent_tensor %arg0 : tensor<?xindex> -> tensor<?xindex>
    return %0 : tensor<?xindex>
  }
}

// -----
module {
  func.func @fold_assuming_all_single_element(%arg0: tensor<?xindex>) {
    %0 = "test.source"() : () -> !shape.witness
    %1 = shape.assuming_all %0
    "consume.witness"(%1) : (!shape.witness) -> ()
    return
  }
}

// -----
module {
  func.func @fold_tensor.cast_of_const_shape_returned(%arg0: i1) -> tensor<1xindex> {
    %0 = shape.const_shape [2] : tensor<1xindex>
    %cast = tensor.cast %0 : tensor<1xindex> to tensor<1xindex>
    return %cast : tensor<1xindex>
  }
}

// -----
module {
  func.func @dont_fold_tensor.cast_of_const_shape_returned_dynamic(%arg0: i1) -> tensor<?xindex> {
    %0 = shape.const_shape [2] : tensor<1xindex>
    %cast = tensor.cast %0 : tensor<1xindex> to tensor<?xindex>
    return %cast : tensor<?xindex>
  }
}

// -----
module {
  func.func @is_broadcastable_on_same_shape(%arg0: !shape.shape) -> i1 {
    %0 = shape.is_broadcastable %arg0, %arg0, %arg0 : !shape.shape, !shape.shape, !shape.shape
    return %0 : i1
  }
}

// -----
module {
  func.func @is_broadcastable_on_duplicate_shapes(%arg0: !shape.shape, %arg1: !shape.shape) -> i1 {
    %0 = shape.is_broadcastable %arg0, %arg1, %arg0, %arg0, %arg0, %arg1 : !shape.shape, !shape.shape, !shape.shape, !shape.shape, !shape.shape, !shape.shape
    return %0 : i1
  }
}

// -----
module {
  func.func @cstr_broadcastable_on_duplicate_shapes(%arg0: !shape.shape, %arg1: !shape.shape) -> !shape.witness {
    %0 = shape.cstr_broadcastable %arg0, %arg1, %arg0, %arg0, %arg0, %arg1 : !shape.shape, !shape.shape, !shape.shape, !shape.shape, !shape.shape, !shape.shape
    return %0 : !shape.witness
  }
}

// -----
module {
  func.func @broadcast_on_same_shape(%arg0: !shape.shape) -> !shape.shape {
    %0 = shape.broadcast %arg0, %arg0, %arg0 : !shape.shape, !shape.shape, !shape.shape -> !shape.shape
    return %0 : !shape.shape
  }
}

// -----
module {
  func.func @broadcast_on_duplicate_shapes(%arg0: !shape.shape, %arg1: !shape.shape) -> !shape.shape {
    %0 = shape.broadcast %arg0, %arg1, %arg0, %arg0, %arg0, %arg1 : !shape.shape, !shape.shape, !shape.shape, !shape.shape, !shape.shape, !shape.shape -> !shape.shape
    return %0 : !shape.shape
  }
}

// -----
module {
  func.func @broadcast_on_single_operand(%arg0: tensor<?xindex>) {
    %0 = shape.broadcast %arg0 : tensor<?xindex> -> tensor<?xindex>
    "use"(%0) : (tensor<?xindex>) -> ()
    return
  }
}

// -----
module {
  func.func @broadcast_as_tensor_cast(%arg0: tensor<3xindex>) -> tensor<?xindex> {
    %0 = shape.broadcast %arg0 : tensor<3xindex> -> tensor<?xindex>
    return %0 : tensor<?xindex>
  }
}

// -----
module {
  func.func @broadcast_as_from_extent_tensor(%arg0: tensor<?xindex>) -> !shape.shape {
    %0 = shape.broadcast %arg0 : tensor<?xindex> -> !shape.shape
    return %0 : !shape.shape
  }
}

// -----
module {
  func.func @shape_of_from_reshape(%arg0: tensor<*xf32>, %arg1: tensor<?xindex>) -> tensor<?xindex> {
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
    %0 = shape.shape_of %reshape : tensor<*xf32> -> tensor<?xindex>
    return %0 : tensor<?xindex>
  }
}

// -----
module {
  func.func @shape_of_from_reshape_int_to_index(%arg0: tensor<?x1xf32>, %arg1: tensor<3xi32>) -> tensor<3xindex> {
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<?x1xf32>, tensor<3xi32>) -> tensor<?x1x1xf32>
    %0 = shape.shape_of %reshape : tensor<?x1x1xf32> -> tensor<3xindex>
    return %0 : tensor<3xindex>
  }
}

// -----
module {
  func.func @shape_of_from_reshape_static_to_dynamic(%arg0: tensor<*xf32>, %arg1: tensor<5xindex>) -> tensor<?xindex> {
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<5xindex>) -> tensor<*xf32>
    %0 = shape.shape_of %reshape : tensor<*xf32> -> tensor<?xindex>
    return %0 : tensor<?xindex>
  }
}

// -----
module {
  func.func @shape_of_from_reshape_dynamic_to_static(%arg0: tensor<*xf32>, %arg1: tensor<?xindex>) -> tensor<5xindex> {
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
    %0 = shape.shape_of %reshape : tensor<*xf32> -> tensor<5xindex>
    return %0 : tensor<5xindex>
  }
}

// -----
module {
  func.func @shape_of_from_reshape_identical_types(%arg0: tensor<*xf32>, %arg1: tensor<5xindex>) -> tensor<5xindex> {
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<5xindex>) -> tensor<*xf32>
    %0 = shape.shape_of %reshape : tensor<*xf32> -> tensor<5xindex>
    return %0 : tensor<5xindex>
  }
}

// -----
module {
  func.func @shape_of_from_reshape_nofold(%arg0: tensor<*xf32>, %arg1: tensor<?xindex>) -> !shape.shape {
    %reshape = tensor.reshape %arg0(%arg1) : (tensor<*xf32>, tensor<?xindex>) -> tensor<*xf32>
    %0 = shape.shape_of %reshape : tensor<*xf32> -> !shape.shape
    return %0 : !shape.shape
  }
}

// -----
module {
  func.func @cast_extent_tensor(%arg0: tensor<?x?x?xf32>) -> tensor<?xindex> {
    %0 = shape.shape_of %arg0 : tensor<?x?x?xf32> -> tensor<3xindex>
    %cast = tensor.cast %0 : tensor<3xindex> to tensor<?xindex>
    return %cast : tensor<?xindex>
  }
}

// -----
module {
  func.func @cast_extent_tensor(%arg0: tensor<?x?x?xf32>) -> tensor<3xindex> {
    %0 = shape.shape_of %arg0 : tensor<?x?x?xf32> -> tensor<?xindex>
    %cast = tensor.cast %0 : tensor<?xindex> to tensor<3xindex>
    return %cast : tensor<3xindex>
  }
}

// -----
module {
  func.func @cast_extent_tensor(%arg0: tensor<?x?x?x?xf32>) -> tensor<3xindex> {
    %0 = shape.shape_of %arg0 : tensor<?x?x?x?xf32> -> tensor<?xindex>
    %cast = tensor.cast %0 : tensor<?xindex> to tensor<3xindex>
    return %cast : tensor<3xindex>
  }
}

// -----
module {
  func.func @cast_extent_tensor(%arg0: tensor<*xf32>) -> tensor<3xindex> {
    %0 = shape.shape_of %arg0 : tensor<*xf32> -> tensor<?xindex>
    %cast = tensor.cast %0 : tensor<?xindex> to tensor<3xindex>
    return %cast : tensor<3xindex>
  }
}

// -----
module {
  func.func @max_same_arg(%arg0: !shape.shape) -> !shape.shape {
    %0 = shape.max %arg0, %arg0 : !shape.shape, !shape.shape -> !shape.shape
    return %0 : !shape.shape
  }
}

// -----
module {
  func.func @min_same_arg(%arg0: !shape.shape) -> !shape.shape {
    %0 = shape.min %arg0, %arg0 : !shape.shape, !shape.shape -> !shape.shape
    return %0 : !shape.shape
  }
}

// -----
module {
  func.func @cstr_broadcastable_folding(%arg0: tensor<?x4xf32>) {
    %0 = shape.shape_of %arg0 : tensor<?x4xf32> -> tensor<2xindex>
    %1 = shape.const_shape [4] : tensor<1xindex>
    %2 = shape.cstr_broadcastable %0, %1 : tensor<2xindex>, tensor<1xindex>
    "use"(%2) : (!shape.witness) -> ()
  }
}

// -----
module {
  func.func @cast_extent_tensor_operands(%arg0: tensor<?xindex>, %arg1: tensor<3xindex>) -> (!shape.witness, tensor<?xindex>) {
    %cast = tensor.cast %arg0 : tensor<?xindex> to tensor<3xindex>
    %cast_0 = tensor.cast %arg1 : tensor<3xindex> to tensor<?xindex>
    %0 = shape.cstr_broadcastable %cast, %cast_0 : tensor<3xindex>, tensor<?xindex>
    %1 = shape.broadcast %cast, %cast_0 : tensor<3xindex>, tensor<?xindex> -> tensor<?xindex>
    return %0, %1 : !shape.witness, tensor<?xindex>
  }
}

// -----
module {
  func.func @concretize_broadcast_result_type(%arg0: tensor<2xindex>, %arg1: tensor<3xindex>) -> tensor<?xindex> {
    %0 = shape.broadcast %arg0, %arg1 : tensor<2xindex>, tensor<3xindex> -> tensor<?xindex>
    return %0 : tensor<?xindex>
  }
}

// -----
module {
  func.func @extract_shapeof(%arg0: tensor<?x?xf64>) -> index {
    %c1 = arith.constant 1 : index
    %0 = shape.shape_of %arg0 : tensor<?x?xf64> -> tensor<2xindex>
    %extracted = tensor.extract %0[%c1] : tensor<2xindex>
    return %extracted : index
  }
}

// -----
module {
  func.func @add_poison() -> !shape.size {
    %c2 = shape.const_size 2
    %0 = ub.poison : !shape.size
    %1 = shape.add %c2, %0 : !shape.size, !shape.size -> !shape.size
    return %1 : !shape.size
  }
}

// -----
module {
  func.func @shape_of_0d(%arg0: tensor<f32>) -> tensor<?xindex> {
    %0 = shape.shape_of %arg0 : tensor<f32> -> tensor<?xindex>
    return %0 : tensor<?xindex>
  }
}

// -----
module {
  func.func @shape_of_static_with_shape_result(%arg0: tensor<3xf32>) -> !shape.shape {
    %0 = shape.shape_of %arg0 : tensor<3xf32> -> !shape.shape
    return %0 : !shape.shape
  }
}

// -----
module {
  func.func @broadcast_no_crash_on_poison() {
    %0 = shape.const_shape [1, 2, 3] : tensor<3xindex>
    %1 = ub.poison : tensor<3xindex>
    %2 = shape.broadcast %0, %1 : tensor<3xindex>, tensor<3xindex> -> tensor<3xindex>
    %rank = tensor.rank %2 : tensor<3xindex>
    return
  }
}

// -----
module {
  func.func @extract_from_shape_of_tensor(%arg0: tensor<?xf32>) -> index {
    %c0 = arith.constant 0 : index
    %0 = shape.shape_of %arg0 : tensor<?xf32> -> tensor<1xindex>
    %extracted = tensor.extract %0[%c0] : tensor<1xindex>
    return %extracted : index
  }
}

// -----
module {
  func.func @extract_from_shape_of_memref_no_fold(%arg0: memref<?xf32>) -> index {
    %c0 = arith.constant 0 : index
    %0 = shape.shape_of %arg0 : memref<?xf32> -> tensor<1xindex>
    %extracted = tensor.extract %0[%c0] : tensor<1xindex>
    return %extracted : index
  }
}

