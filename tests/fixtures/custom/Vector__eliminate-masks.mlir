#map = affine_map<()[s0] -> (-(1080 mod s0) + 1080)>
module {
  func.func @eliminate_redundant_masks_through_insert_and_extracts(%arg0: tensor<1x1000xf32>, %arg1: f32) {
    %c4 = arith.constant 4 : index
    %vscale = vector.vscale
    %c4_vscale = arith.muli %vscale, %c4 : index
    %0 = affine.apply #map()[%c4_vscale]
    %c0 = arith.constant 0 : index
    %c1000 = arith.constant 1000 : index
    %cst = arith.constant 0.000000e+00 : f32
    %extracted_slice = tensor.extract_slice %arg0[0, 0] [1, %c4_vscale] [1, 1] : tensor<1x1000xf32> to tensor<1x?xf32>
    %1 = scf.for %arg2 = %c0 to %0 step %c4_vscale iter_args(%arg3 = %extracted_slice) -> (tensor<1x?xf32>) {
      %extracted_slice_0 = tensor.extract_slice %arg3[0, %arg2] [1, %c4_vscale] [1, 1] : tensor<1x?xf32> to tensor<?xf32>
      %dim = tensor.dim %extracted_slice_0, %c0 : tensor<?xf32>
      %2 = vector.create_mask %dim : vector<[4]xi1>
      %3 = vector.transfer_read %extracted_slice_0[%c0], %cst, %2 {in_bounds = [true]} : tensor<?xf32>, vector<[4]xf32>
      %4 = vector.mask %2 { vector.outerproduct %3, %arg1 : vector<[4]xf32>, f32 } : vector<[4]xi1> -> vector<[4]xf32>
      %5 = vector.transfer_write %4, %extracted_slice_0[%c0], %2 {in_bounds = [true]} : vector<[4]xf32>, tensor<?xf32>
      %inserted_slice = tensor.insert_slice %5 into %arg3[0, %arg2] [1, %c4_vscale] [1, 1] : tensor<?xf32> into tensor<1x?xf32>
      scf.yield %inserted_slice : tensor<1x?xf32>
    }
    "test.some_use"(%1) : (tensor<1x?xf32>) -> ()
    return
  }
}

// -----
module {
  func.func private @negative_no_func_body()
}

// -----
#map = affine_map<(d0)[s0] -> (-d0 + 1000, s0)>
module {
  func.func @negative_extract_slice_size_shrink(%arg0: tensor<1000xf32>) {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c1000 = arith.constant 1000 : index
    %vscale = vector.vscale
    %c4_vscale = arith.muli %vscale, %c4 : index
    %extracted_slice = tensor.extract_slice %arg0[0] [%c4_vscale] [1] : tensor<1000xf32> to tensor<?xf32>
    %0 = scf.for %arg1 = %c0 to %c1000 step %c4_vscale iter_args(%arg2 = %extracted_slice) -> (tensor<?xf32>) {
      %dim = tensor.dim %arg2, %c0 : tensor<?xf32>
      %1 = vector.create_mask %dim : vector<[4]xi1>
      "test.some_use"(%1) : (vector<[4]xi1>) -> ()
      %2 = affine.min #map(%arg1)[%c4_vscale]
      %extracted_slice_0 = tensor.extract_slice %arg0[%c4_vscale] [%2] [1] : tensor<1000xf32> to tensor<?xf32>
      scf.yield %extracted_slice_0 : tensor<?xf32>
    }
    "test.some_use"(%0) : (tensor<?xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @trivially_all_true_case(%arg0: tensor<2x?xf32>) {
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %vscale = vector.vscale
    %c4_vscale = arith.muli %vscale, %c4 : index
    %0 = vector.create_mask %c2, %c4_vscale : vector<2x[4]xi1>
    "test.some_use"(%0) : (vector<2x[4]xi1>) -> ()
    return
  }
}

// -----
module {
  func.func @negative_constant_dim_not_all_true() {
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %vscale = vector.vscale
    %c4_vscale = arith.muli %vscale, %c4 : index
    %0 = vector.create_mask %c1, %c4_vscale : vector<2x[4]xi1>
    "test.some_use"(%0) : (vector<2x[4]xi1>) -> ()
    return
  }
}

// -----
module {
  func.func @negative_constant_vscale_multiple_not_all_true() {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %vscale = vector.vscale
    %c3_vscale = arith.muli %vscale, %c3 : index
    %0 = vector.create_mask %c2, %c3_vscale : vector<2x[4]xi1>
    "test.some_use"(%0) : (vector<2x[4]xi1>) -> ()
    return
  }
}

// -----
module {
  func.func @negative_value_bounds_fixed_dim_not_all_true(%arg0: tensor<2x?xf32>) {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %vscale = vector.vscale
    %c4_vscale = arith.muli %vscale, %c4 : index
    %dim = tensor.dim %arg0, %c0 : tensor<2x?xf32>
    %0 = vector.create_mask %dim, %c4_vscale : vector<3x[4]xi1>
    "test.some_use"(%0) : (vector<3x[4]xi1>) -> ()
    return
  }
}

// -----
module {
  func.func @negative_value_bounds_scalable_dim_not_all_true(%arg0: tensor<2x100xf32>) {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %vscale = vector.vscale
    %c3_vscale = arith.muli %vscale, %c3 : index
    %extracted_slice = tensor.extract_slice %arg0[0, 0] [2, %c3_vscale] [1, 1] : tensor<2x100xf32> to tensor<2x?xf32>
    %dim = tensor.dim %extracted_slice, %c1 : tensor<2x?xf32>
    %0 = vector.create_mask %c3, %dim : vector<3x[4]xi1>
    "test.some_use"(%0) : (vector<3x[4]xi1>) -> ()
    return
  }
}

