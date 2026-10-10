module {
  func.func @fold_unit_dim_add_basic(%arg0: vector<1x8xi32>) -> vector<1x8xi32> {
    %0 = arith.addi %arg0, %arg0 : vector<1x8xi32>
    return %0 : vector<1x8xi32>
  }
}

// -----
module {
  func.func @fold_unit_dim_add_leading_and_trailing(%arg0: vector<1x8x1xi32>) -> vector<1x8x1xi32> {
    %0 = arith.addi %arg0, %arg0 : vector<1x8x1xi32>
    return %0 : vector<1x8x1xi32>
  }
}

// -----
module {
  func.func @fold_unit_dim_add(%arg0: vector<8x1xi32>, %arg1: vector<1x8xi32>) -> vector<8xi32> {
    %0 = vector.shape_cast %arg0 : vector<8x1xi32> to vector<1x8xi32>
    %1 = arith.addi %0, %arg1 : vector<1x8xi32>
    %2 = vector.shape_cast %1 : vector<1x8xi32> to vector<8xi32>
    return %2 : vector<8xi32>
  }
}

// -----
module {
  func.func @fold_unit_dim_mulf(%arg0: vector<8x[2]x1xf32>, %arg1: vector<1x8x[2]xf32>) -> vector<8x[2]xf32> {
    %0 = vector.shape_cast %arg0 : vector<8x[2]x1xf32> to vector<1x8x[2]xf32>
    %1 = arith.mulf %0, %arg1 : vector<1x8x[2]xf32>
    %2 = vector.shape_cast %1 : vector<1x8x[2]xf32> to vector<8x[2]xf32>
    return %2 : vector<8x[2]xf32>
  }
}

// -----
module {
  func.func @fold_unit_dim_sitofp(%arg0: vector<8x[2]x1xi8>) -> vector<8x[2]xf32> {
    %0 = vector.shape_cast %arg0 : vector<8x[2]x1xi8> to vector<1x8x[2]xi8>
    %1 = arith.sitofp %0 : vector<1x8x[2]xi8> to vector<1x8x[2]xf32>
    %2 = vector.shape_cast %1 : vector<1x8x[2]xf32> to vector<8x[2]xf32>
    return %2 : vector<8x[2]xf32>
  }
}

// -----
module {
  func.func @fold_unit_dims_entirely(%arg0: vector<8xi32>, %arg1: vector<8xi32>, %arg2: vector<8xi32>) -> vector<8xi32> {
    %0 = vector.shape_cast %arg0 : vector<8xi32> to vector<1x8xi32>
    %1 = vector.shape_cast %arg1 : vector<8xi32> to vector<1x8xi32>
    %2 = vector.shape_cast %arg2 : vector<8xi32> to vector<1x8xi32>
    %3 = arith.muli %0, %1 : vector<1x8xi32>
    %4 = arith.addi %3, %2 : vector<1x8xi32>
    %5 = vector.shape_cast %4 : vector<1x8xi32> to vector<8xi32>
    return %5 : vector<8xi32>
  }
}

// -----
module {
  func.func @fold_inner_unit_dim(%arg0: vector<8x1x3xf128>, %arg1: vector<1x8x3xf128>) -> vector<8x3xf128> {
    %0 = vector.shape_cast %arg1 : vector<1x8x3xf128> to vector<8x1x3xf128>
    %1 = arith.mulf %arg0, %0 : vector<8x1x3xf128>
    %2 = vector.shape_cast %1 : vector<8x1x3xf128> to vector<8x3xf128>
    return %2 : vector<8x3xf128>
  }
}

// -----
module {
  func.func @fold_inner_unit_dim_scalable(%arg0: vector<8x1x[1]x3xf128>, %arg1: vector<1x8x[1]x3xf128>) -> vector<8x[1]x3xf128> {
    %0 = vector.shape_cast %arg1 : vector<1x8x[1]x3xf128> to vector<8x1x[1]x3xf128>
    %1 = arith.mulf %arg0, %0 : vector<8x1x[1]x3xf128>
    %2 = vector.shape_cast %1 : vector<8x1x[1]x3xf128> to vector<8x[1]x3xf128>
    return %2 : vector<8x[1]x3xf128>
  }
}

// -----
module {
  func.func @fold_all_unit_dims(%arg0: vector<1x1xf32>) -> vector<1xf32> {
    %0 = arith.mulf %arg0, %arg0 : vector<1x1xf32>
    %1 = vector.shape_cast %0 : vector<1x1xf32> to vector<1xf32>
    return %1 : vector<1xf32>
  }
  func.func @transpose_with_internal_unit_dims(%arg0: vector<1x1x4x[4]xf32>) -> vector<[4]x1x1x4xf32> {
    %0 = vector.transpose %arg0, [3, 0, 1, 2] : vector<1x1x4x[4]xf32> to vector<[4]x1x1x4xf32>
    return %0 : vector<[4]x1x1x4xf32>
  }
}

// -----
module {
  func.func @transpose_with_scalable_unit_dims(%arg0: vector<[1]x1x2x4x1xf32>) -> vector<1x1x4x2x[1]xf32> {
    %0 = vector.transpose %arg0, [4, 1, 3, 2, 0] : vector<[1]x1x2x4x1xf32> to vector<1x1x4x2x[1]xf32>
    return %0 : vector<1x1x4x2x[1]xf32>
  }
}

// -----
module {
  func.func @transpose_with_all_unit_dims(%arg0: vector<1x1x1xf32>) -> vector<1x1x1xf32> {
    %0 = vector.transpose %arg0, [0, 2, 1] : vector<1x1x1xf32> to vector<1x1x1xf32>
    return %0 : vector<1x1x1xf32>
  }
}

// -----
module {
  func.func @negative_transpose_with_no_unit_dims(%arg0: vector<4x2x3xf32>) -> vector<4x3x2xf32> {
    %0 = vector.transpose %arg0, [0, 2, 1] : vector<4x2x3xf32> to vector<4x3x2xf32>
    return %0 : vector<4x3x2xf32>
  }
}

// -----
module {
  func.func @scf_for_with_internal_unit_dims(%arg0: vector<4x1x1x[4]xf32>) -> vector<4x1x1x[4]xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = scf.for %arg1 = %c0 to %c4 step %c1 iter_args(%arg2 = %arg0) -> (vector<4x1x1x[4]xf32>) {
      %1 = math.sqrt %arg2 : vector<4x1x1x[4]xf32>
      scf.yield %1 : vector<4x1x1x[4]xf32>
    }
    return %0 : vector<4x1x1x[4]xf32>
  }
}

// -----
module {
  func.func @scf_for_with_all_unit_dims(%arg0: vector<1x1xf32>) -> vector<1x1xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = scf.for %arg1 = %c0 to %c4 step %c1 iter_args(%arg2 = %arg0) -> (vector<1x1xf32>) {
      %1 = math.sqrt %arg2 : vector<1x1xf32>
      scf.yield %1 : vector<1x1xf32>
    }
    return %0 : vector<1x1xf32>
  }
}

// -----
module {
  func.func @scf_for_with_multiple_operands(%arg0: index, %arg1: vector<1x4xf32>, %arg2: vector<1x4xf32>) -> vector<1x4xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0:3 = scf.for %arg3 = %c0 to %c4 step %c1 iter_args(%arg4 = %arg0, %arg5 = %arg1, %arg6 = %arg2) -> (index, vector<1x4xf32>, vector<1x4xf32>) {
      %1 = arith.addf %arg5, %arg6 : vector<1x4xf32>
      scf.yield %arg4, %1, %1 : index, vector<1x4xf32>, vector<1x4xf32>
    }
    return %0#1 : vector<1x4xf32>
  }
}

// -----
module {
  func.func @scf_for_with_scalable_unit_dims(%arg0: vector<1x[1]xf32>) -> vector<1x[1]xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = scf.for %arg1 = %c0 to %c4 step %c1 iter_args(%arg2 = %arg0) -> (vector<1x[1]xf32>) {
      %1 = math.sqrt %arg2 : vector<1x[1]xf32>
      scf.yield %1 : vector<1x[1]xf32>
    }
    return %0 : vector<1x[1]xf32>
  }
}

