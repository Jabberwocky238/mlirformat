module {
  func.func @simple_scalar(%arg0: i32) -> i32 {
    return %arg0 : i32
  }
}

// -----
module {
  func.func @simple_vector_4(%arg0: vector<4xi32>) -> vector<4xi32> {
    return %arg0 : vector<4xi32>
  }
}

// -----
module {
  func.func @simple_vector_5(%arg0: vector<5xi32>) -> vector<5xi32> {
    return %arg0 : vector<5xi32>
  }
}

// -----
module {
  func.func @simple_vector_6(%arg0: vector<6xi32>) -> vector<6xi32> {
    return %arg0 : vector<6xi32>
  }
}

// -----
module {
  func.func @simple_vector_8(%arg0: vector<8xi32>) -> vector<8xi32> {
    return %arg0 : vector<8xi32>
  }
}

// -----
module {
  func.func @simple_vector_2d(%arg0: vector<4x4xi32>) -> vector<4x4xi32> {
    return %arg0 : vector<4x4xi32>
  }
}

// -----
module {
  func.func @vector_6and8(%arg0: vector<6xi32>, %arg1: vector<8xi32>) -> (vector<6xi32>, vector<8xi32>) {
    return %arg0, %arg1 : vector<6xi32>, vector<8xi32>
  }
}

// -----
module {
  func.func @vector_3and8(%arg0: vector<3xi32>, %arg1: vector<8xi32>) -> (vector<3xi32>, vector<8xi32>) {
    return %arg0, %arg1 : vector<3xi32>, vector<8xi32>
  }
}

// -----
module {
  func.func @scalar_vector(%arg0: vector<8xi32>, %arg1: vector<3xi32>, %arg2: i32) -> (vector<8xi32>, vector<3xi32>, i32) {
    return %arg0, %arg1, %arg2 : vector<8xi32>, vector<3xi32>, i32
  }
}

// -----
module {
  func.func @vector_2dand1d(%arg0: vector<2x6xi32>, %arg1: vector<4xi32>) -> (vector<2x6xi32>, vector<4xi32>) {
    return %arg0, %arg1 : vector<2x6xi32>, vector<4xi32>
  }
}

// -----
module {
  func.func @reduction(%arg0: vector<8xi32>, %arg1: vector<8xi32>, %arg2: i32) -> i32 {
    %0 = arith.addi %arg0, %arg1 : vector<8xi32>
    %1 = vector.reduction <add>, %0 : vector<8xi32> into i32
    %2 = arith.addi %1, %arg2 : i32
    return %2 : i32
  }
}

// -----
module {
  func.func private @unsupported_decl(vector<8xi32>)
}

// -----
module {
  func.func @unsupported_scalable(%arg0: vector<[8]xi32>) -> vector<[8]xi32> {
    return %arg0 : vector<[8]xi32>
  }
}

// -----
module {
  func.func @legal_params_multiple_blocks_simple(%arg0: i32, %arg1: i32) -> i32 {
    cf.br ^bb1(%arg0 : i32)
  ^bb1(%0: i32):  // pred: ^bb0
    %1 = arith.addi %0, %arg1 : i32
    cf.br ^bb2(%1 : i32)
  ^bb2(%2: i32):  // pred: ^bb1
    %3 = arith.addi %2, %arg1 : i32
    cf.br ^bb3(%3 : i32)
  ^bb3(%4: i32):  // pred: ^bb2
    return %4 : i32
  }
}

// -----
module {
  func.func @legal_params_with_vec_insert_multiple_blocks(%arg0: i32, %arg1: i32, %arg2: vector<4xi32>) -> vector<4xi32> {
    cf.br ^bb1(%arg0 : i32)
  ^bb1(%0: i32):  // pred: ^bb0
    %1 = arith.addi %0, %arg1 : i32
    cf.br ^bb2(%1 : i32)
  ^bb2(%2: i32):  // pred: ^bb1
    %3 = arith.addi %2, %arg1 : i32
    cf.br ^bb3(%3 : i32)
  ^bb3(%4: i32):  // pred: ^bb2
    %5 = vector.broadcast %4 : i32 to vector<1xi32>
    %6 = vector.insert_strided_slice %5, %arg2 {offsets = [1], strides = [1]} : vector<1xi32> into vector<4xi32>
    %7 = vector.insert_strided_slice %5, %6 {offsets = [2], strides = [1]} : vector<1xi32> into vector<4xi32>
    %8 = vector.insert_strided_slice %5, %7 {offsets = [3], strides = [1]} : vector<1xi32> into vector<4xi32>
    return %8 : vector<4xi32>
  }
}

// -----
module {
  func.func @legal_params_for_loop(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = arith.index_cast %arg2 : i32 to index
    %1 = scf.for %arg3 = %c0 to %0 step %c1 iter_args(%arg4 = %arg0) -> (i32) {
      %2 = arith.addi %arg4, %arg1 : i32
      scf.yield %2 : i32
    }
    return %1 : i32
  }
}

