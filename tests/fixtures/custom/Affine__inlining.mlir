#map = affine_map<(d0, d1)[s0] -> (d0 + d1 + s0)>
#set = affine_set<(d0)[s0] : (d0 - 2 >= 0, -d0 + 4 >= 0)>
module {
  func.func @func_with_affine_ops(%arg0: index) {
    %c200 = arith.constant 200 : index
    affine.for %arg1 = 1 to 10 {
      affine.if #set(%arg1)[%c200] {
        %0 = affine.apply #map(%arg1, %arg1)[%arg0]
      }
    }
    return
  }
  func.func @inline_with_affine_ops() {
    %c1 = arith.constant 1 : index
    call @func_with_affine_ops(%c1) : (index) -> ()
    return
  }
  func.func @not_inline_in_affine_op() {
    %c1 = arith.constant 1 : index
    affine.for %arg0 = 1 to 10 {
      func.call @func_with_affine_ops(%c1) : (index) -> ()
    }
    return
  }
}

// -----
module {
  func.func @func_with_invalid_nested_op() {
    affine.for %arg0 = 1 to 10 {
      "foo.opaque"() : () -> ()
    }
    return
  }
  func.func @not_inline_invalid_nest_op() {
    call @func_with_invalid_nested_op() : () -> ()
    return
  }
}

// -----
module {
  func.func @func_noop() {
    return
  }
  func.func @inline_into_affine_ops() {
    affine.for %arg0 = 1 to 10 {
      func.call @func_noop() : () -> ()
    }
    return
  }
}

// -----
module {
  func.func @func_dim(%arg0: index, %arg1: memref<?xf32>) {
    %0 = affine.load %arg1[%arg0] : memref<?xf32>
    return
  }
  func.func @inline_dimension(%arg0: memref<?xf32>) {
    affine.for %arg1 = 1 to 42 {
      func.call @func_dim(%arg1, %arg0) : (index, memref<?xf32>) -> ()
    }
    return
  }
}

// -----
module {
  func.func @func_vector_dim(%arg0: index, %arg1: memref<32xf32>) {
    %0 = affine.vector_load %arg1[%arg0] : memref<32xf32>, vector<4xf32>
    return
  }
  func.func @inline_dimension_vector(%arg0: memref<32xf32>) {
    affine.for %arg1 = 1 to 42 {
      func.call @func_vector_dim(%arg1, %arg0) : (index, memref<32xf32>) -> ()
    }
    return
  }
}

// -----
module {
  func.func private @get_index() -> index
  func.func @func_top_level(%arg0: memref<?xf32>) {
    %0 = call @get_index() : () -> index
    %1 = affine.load %arg0[%0] : memref<?xf32>
    return
  }
  func.func @no_inline_not_top_level(%arg0: memref<?xf32>) {
    affine.for %arg1 = 1 to 42 {
      func.call @func_top_level(%arg0) : (memref<?xf32>) -> ()
    }
    return
  }
}

