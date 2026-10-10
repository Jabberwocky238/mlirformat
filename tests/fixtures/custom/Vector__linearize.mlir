module {
  func.func @test_linearize(%arg0: vector<2x2xf32>) -> vector<2x2xf32> {
    %cst = arith.constant dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> : vector<2x2xf32>
    %0 = math.sin %arg0 : vector<2x2xf32>
    %1 = arith.addf %arg0, %cst : vector<2x2xf32>
    return %cst : vector<2x2xf32>
  }
}

// -----
module {
  func.func @test_linearize_poison() -> vector<2x2xf32> {
    %0 = ub.poison : vector<2x2xf32>
    return %0 : vector<2x2xf32>
  }
}

// -----
module {
  func.func @test_partial_linearize(%arg0: vector<2x2xf32>, %arg1: vector<4x4xf32>) -> vector<2x2xf32> {
    %cst = arith.constant dense<[[1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00]]> : vector<2x2xf32>
    %cst_0 = arith.constant dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [1.000000e+00, 2.000000e+00, 5.000000e+00, 6.000000e+00]]> : vector<4x4xf32>
    %0 = math.sin %arg0 : vector<2x2xf32>
    %1 = math.sin %arg1 : vector<4x4xf32>
    %2 = arith.addf %arg0, %cst : vector<2x2xf32>
    %3 = arith.addf %arg1, %cst_0 : vector<4x4xf32>
    return %cst : vector<2x2xf32>
  }
}

// -----
module {
  func.func @test_tensor_no_linearize(%arg0: tensor<2x2xf32>, %arg1: tensor<2x2xf32>) -> (tensor<2x2xf32>, tensor<2x2xf32>) {
    %0 = arith.mulf %arg0, %arg1 : tensor<2x2xf32>
    return %0, %arg0 : tensor<2x2xf32>, tensor<2x2xf32>
  }
}

// -----
module {
  func.func @test_scalable_linearize(%arg0: vector<2x[2]xf32>) -> vector<2x[2]xf32> {
    %cst = arith.constant dense<3.000000e+00> : vector<2x[2]xf32>
    %0 = math.sin %arg0 : vector<2x[2]xf32>
    %1 = arith.addf %cst, %0 : vector<2x[2]xf32>
    return %1 : vector<2x[2]xf32>
  }
}

// -----
module {
  func.func @test_scalable_no_linearize(%arg0: vector<[2]x[2]xf32>) -> vector<[2]x[2]xf32> {
    %cst = arith.constant dense<2.000000e+00> : vector<[2]x[2]xf32>
    %0 = math.sin %arg0 : vector<[2]x[2]xf32>
    %1 = arith.addf %cst, %0 : vector<[2]x[2]xf32>
    return %1 : vector<[2]x[2]xf32>
  }
}

// -----
module {
  func.func @test_0d_vector() -> vector<f32> {
    %cst = arith.constant dense<0.000000e+00> : vector<f32>
    return %cst : vector<f32>
  }
}

// -----
module {
  func.func @test_extract_strided_slice_2D(%arg0: vector<4x8xf32>) -> vector<2x2xf32> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [0, 4], sizes = [2, 2], strides = [1, 1]} : vector<4x8xf32> to vector<2x2xf32>
    return %0 : vector<2x2xf32>
  }
}

// -----
module {
  func.func @test_extract_strided_slice_2D_scalable(%arg0: vector<4x[8]xf32>) -> vector<2x[8]xf32> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [1, 0], sizes = [2, 8], strides = [1, 1]} : vector<4x[8]xf32> to vector<2x[8]xf32>
    return %0 : vector<2x[8]xf32>
  }
}

// -----
module {
  func.func @test_extract_strided_slice_3D(%arg0: vector<2x8x2xf32>) -> vector<1x4x2xf32> {
    %0 = vector.extract_strided_slice %arg0 {offsets = [1, 2], sizes = [1, 4], strides = [1, 1]} : vector<2x8x2xf32> to vector<1x4x2xf32>
    return %0 : vector<1x4x2xf32>
  }
}

// -----
module {
  func.func @insert_strided_slice_2D_into_4D(%arg0: vector<2x2xi8>, %arg1: vector<2x1x3x2xi8>) -> vector<2x1x3x2xi8> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [1, 0, 0, 0], strides = [1, 1]} : vector<2x2xi8> into vector<2x1x3x2xi8>
    return %0 : vector<2x1x3x2xi8>
  }
}

// -----
module {
  func.func @insert_strided_slice_3D(%arg0: vector<1x2x1xi8>, %arg1: vector<3x3x2xi8>) -> vector<3x3x2xi8> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [1, 1, 1], sizes = [1, 2, 1], strides = [1, 1, 1]} : vector<1x2x1xi8> into vector<3x3x2xi8>
    return %0 : vector<3x3x2xi8>
  }
}

// -----
module {
  func.func @insert_strided_slice_2D_higher_offsets(%arg0: vector<2x1xi8>, %arg1: vector<2x2xi8>, %arg2: vector<5x2xi8>) -> vector<5x2xi8> {
    %0 = vector.insert_strided_slice %arg1, %arg2 {offsets = [2, 0], sizes = [2, 2], strides = [1, 1]} : vector<2x2xi8> into vector<5x2xi8>
    %1 = vector.insert_strided_slice %arg0, %0 {offsets = [2, 0], sizes = [2, 1], strides = [1, 1]} : vector<2x1xi8> into vector<5x2xi8>
    %2 = vector.insert_strided_slice %arg0, %1 {offsets = [3, 1], sizes = [2, 1], strides = [1, 1]} : vector<2x1xi8> into vector<5x2xi8>
    return %2 : vector<5x2xi8>
  }
}

// -----
module {
  func.func @negative_insert_strided_slice_scalable(%arg0: vector<1x[2]xi8>, %arg1: vector<2x[2]xi8>) -> vector<2x[2]xi8> {
    %0 = vector.insert_strided_slice %arg0, %arg1 {offsets = [0, 0], strides = [1, 1]} : vector<1x[2]xi8> into vector<2x[2]xi8>
    return %0 : vector<2x[2]xi8>
  }
}

// -----
module {
  func.func @test_vector_shuffle(%arg0: vector<4x2xf32>, %arg1: vector<4x2xf32>) -> vector<8x2xf32> {
    %0 = vector.shuffle %arg0, %arg1 [0, 4, 1, 5, 2, 6, 3, 7] : vector<4x2xf32>, vector<4x2xf32>
    return %0 : vector<8x2xf32>
  }
}

// -----
module {
  func.func @test_vector_extract_scalar(%arg0: vector<2x4xi32>) -> i32 {
    %0 = vector.extract %arg0[1, 2] : i32 from vector<2x4xi32>
    return %0 : i32
  }
}

// -----
module {
  func.func @test_vector_extract(%arg0: vector<2x8x2xf32>) -> vector<8x2xf32> {
    %0 = vector.extract %arg0[1] : vector<8x2xf32> from vector<2x8x2xf32>
    return %0 : vector<8x2xf32>
  }
}

// -----
module {
  func.func @test_vector_extract_scalable(%arg0: vector<2x8x[2]xf32>) -> vector<8x[2]xf32> {
    %0 = vector.extract %arg0[1] : vector<8x[2]xf32> from vector<2x8x[2]xf32>
    return %0 : vector<8x[2]xf32>
  }
}

// -----
module {
  func.func @test_vector_insert_scalar(%arg0: vector<2x4xf32>, %arg1: f32) -> vector<2x4xf32> {
    %0 = vector.insert %arg1, %arg0 [1, 2] : f32 into vector<2x4xf32>
    return %0 : vector<2x4xf32>
  }
}

// -----
module {
  func.func @test_vector_insert(%arg0: vector<2x8x4xf32>, %arg1: vector<8x4xf32>) -> vector<2x8x4xf32> {
    %0 = vector.insert %arg1, %arg0 [0] : vector<8x4xf32> into vector<2x8x4xf32>
    return %0 : vector<2x8x4xf32>
  }
}

// -----
module {
  func.func @test_vector_insert_scalable(%arg0: vector<2x8x[4]xf32>, %arg1: vector<8x[4]xf32>) -> vector<2x8x[4]xf32> {
    %0 = vector.insert %arg1, %arg0 [0] : vector<8x[4]xf32> into vector<2x8x[4]xf32>
    return %0 : vector<2x8x[4]xf32>
  }
}

// -----
module {
  func.func @test_vector_bitcast(%arg0: vector<4x4xf32>) -> vector<4x8xf16> {
    %0 = vector.bitcast %arg0 : vector<4x4xf32> to vector<4x8xf16>
    return %0 : vector<4x8xf16>
  }
}

// -----
module {
  func.func @test_vector_bitcast(%arg0: vector<4x2xf32>) -> vector<4x4xf16> {
    %0 = vector.bitcast %arg0 : vector<4x2xf32> to vector<4x4xf16>
    return %0 : vector<4x4xf16>
  }
}

// -----
module {
  func.func @test_vector_bitcast(%arg0: vector<4x[2]xf32>) -> vector<4x[4]xf16> {
    %0 = vector.bitcast %arg0 : vector<4x[2]xf32> to vector<4x[4]xf16>
    return %0 : vector<4x[4]xf16>
  }
}

// -----
module {
  func.func @test_vector_bitcast(%arg0: vector<[4]x2xf32>) -> vector<[4]x4xf16> {
    %0 = vector.bitcast %arg0 : vector<[4]x2xf32> to vector<[4]x4xf16>
    return %0 : vector<[4]x4xf16>
  }
}

// -----
module {
  func.func @test_linearize_across_for(%arg0: vector<4xi8>) -> vector<4xi8> {
    %0 = vector.shape_cast %arg0 : vector<4xi8> to vector<2x2xi8>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %1 = scf.for %arg1 = %c0 to %c4 step %c1 iter_args(%arg2 = %0) -> (vector<2x2xi8>) {
      %3 = arith.addi %arg2, %0 : vector<2x2xi8>
      scf.yield %3 : vector<2x2xi8>
    }
    %2 = vector.shape_cast %1 : vector<2x2xi8> to vector<4xi8>
    return %2 : vector<4xi8>
  }
}

// -----
module {
  func.func @linearize_vector_broadcast_scalar_source(%arg0: i32) -> vector<4x2xi32> {
    %0 = vector.broadcast %arg0 : i32 to vector<4x2xi32>
    return %0 : vector<4x2xi32>
  }
}

// -----
module {
  func.func @linearize_vector_broadcast_rank_two_source(%arg0: vector<1x1xi32>) -> vector<4x2xi32> {
    %0 = vector.broadcast %arg0 : vector<1x1xi32> to vector<4x2xi32>
    return %0 : vector<4x2xi32>
  }
}

// -----
module {
  func.func @linearize_scalable_vector_broadcast(%arg0: i32) -> vector<4x[2]xi32> {
    %0 = vector.broadcast %arg0 : i32 to vector<4x[2]xi32>
    return %0 : vector<4x[2]xi32>
  }
}

// -----
module {
  func.func @linearize_create_mask(%arg0: index, %arg1: index) -> vector<1x16xi1> {
    %0 = vector.create_mask %arg0, %arg1 : vector<1x16xi1>
    return %0 : vector<1x16xi1>
  }
}

// -----
module {
  func.func @linearize_scalable_create_mask(%arg0: index, %arg1: index) -> vector<1x[16]xi1> {
    %0 = vector.create_mask %arg0, %arg1 : vector<1x[16]xi1>
    return %0 : vector<1x[16]xi1>
  }
  func.func @linearize_vector_load(%arg0: memref<2x8xf32>) -> vector<1x4xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0] : memref<2x8xf32>, vector<1x4xf32>
    return %0 : vector<1x4xf32>
  }
  func.func @linearize_vector_store(%arg0: memref<2x8xf32>, %arg1: vector<1x4xf32>) {
    %c0 = arith.constant 0 : index
    vector.store %arg1, %arg0[%c0, %c0] : memref<2x8xf32>, vector<1x4xf32>
    return
  }
  func.func @linearize_vector_load_scalable(%arg0: memref<2x8xf32>) -> vector<1x[4]xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.load %arg0[%c0, %c0] : memref<2x8xf32>, vector<1x[4]xf32>
    return %0 : vector<1x[4]xf32>
  }
  func.func @linearize_vector_store_scalable(%arg0: memref<2x8xf32>, %arg1: vector<1x[4]xf32>) {
    %c0 = arith.constant 0 : index
    vector.store %arg1, %arg0[%c0, %c0] : memref<2x8xf32>, vector<1x[4]xf32>
    return
  }
}

// -----
module {
  func.func @test_vector_from_elements(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: f32) -> vector<2x2xf32> {
    %0 = vector.from_elements %arg0, %arg1, %arg2, %arg3 : vector<2x2xf32>
    return %0 : vector<2x2xf32>
  }
}

// -----
module {
  func.func @to_elements_1d(%arg0: vector<2xf32>) -> (f32, f32) {
    %0:2 = vector.to_elements %arg0 : vector<2xf32>
    return %0#0, %0#1 : f32, f32
  }
}

// -----
module {
  func.func @to_elements_2d(%arg0: vector<2x2xf32>) -> (f32, f32, f32, f32) {
    %0:4 = vector.to_elements %arg0 : vector<2x2xf32>
    return %0#0, %0#1, %0#2, %0#3 : f32, f32, f32, f32
  }
}

