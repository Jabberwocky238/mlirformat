module {
  func.func @vector_transfer_ops_0d(%arg0: memref<f32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[], %cst : memref<f32>, vector<f32>
    vector.transfer_write %0, %arg0[] : vector<f32>, memref<f32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#map2 = affine_map<(d0) -> (d0 + 2)>
#map3 = affine_map<(d0) -> (d0 + 3)>
module {
  func.func @materialize_read_1d() {
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<7x42xf32>
    affine.for %arg0 = 0 to 7 step 4 {
      affine.for %arg1 = 0 to 42 step 4 {
        %0 = vector.transfer_read %alloc[%arg0, %arg1], %cst {permutation_map = #map} : memref<7x42xf32>, vector<4xf32>
        %1 = affine.apply #map1(%arg1)
        %2 = vector.transfer_read %alloc[%arg0, %1], %cst {permutation_map = #map} : memref<7x42xf32>, vector<4xf32>
        %3 = affine.apply #map2(%arg1)
        %4 = vector.transfer_read %alloc[%arg0, %3], %cst {permutation_map = #map} : memref<7x42xf32>, vector<4xf32>
        %5 = affine.apply #map3(%arg1)
        %6 = vector.transfer_read %alloc[%arg0, %5], %cst {permutation_map = #map} : memref<7x42xf32>, vector<4xf32>
        "dummy_use"(%0, %2, %4, %6) : (vector<4xf32>, vector<4xf32>, vector<4xf32>, vector<4xf32>) -> ()
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d3)>
#map1 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @materialize_read_1d_partially_specialized(%arg0: index, %arg1: index, %arg2: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc(%arg0, %arg1, %arg2) : memref<7x?x?x42x?xf32>
    affine.for %arg3 = 0 to 7 {
      affine.for %arg4 = 0 to %arg0 {
        affine.for %arg5 = 0 to %arg1 {
          affine.for %arg6 = 0 to 42 step 2 {
            affine.for %arg7 = 0 to %arg2 {
              %0 = vector.transfer_read %alloc[%arg3, %arg4, %arg5, %arg6, %arg7], %cst {permutation_map = #map} : memref<7x?x?x42x?xf32>, vector<4xf32>
              %1 = affine.apply #map1(%arg6)
              %2 = vector.transfer_read %alloc[%arg3, %arg4, %arg5, %1, %arg7], %cst {permutation_map = #map} : memref<7x?x?x42x?xf32>, vector<4xf32>
              "dummy_use"(%0, %2) : (vector<4xf32>, vector<4xf32>) -> ()
            }
          }
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d3, 0, d0)>
module {
  func.func @materialize_read(%arg0: index, %arg1: index, %arg2: index, %arg3: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc(%arg0, %arg1, %arg2, %arg3) : memref<?x?x?x?xf32>
    affine.for %arg4 = 0 to %arg0 step 3 {
      affine.for %arg5 = 0 to %arg1 {
        affine.for %arg6 = 0 to %arg2 {
          affine.for %arg7 = 0 to %arg3 step 5 {
            %0 = vector.transfer_read %alloc[%arg4, %arg5, %arg6, %arg7], %cst {permutation_map = #map} : memref<?x?x?x?xf32>, vector<5x4x3xf32>
            "dummy_use"(%0) : (vector<5x4x3xf32>) -> ()
          }
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d3, d1, d0)>
module {
  func.func @materialize_write(%arg0: index, %arg1: index, %arg2: index, %arg3: index) {
    %alloc = memref.alloc(%arg0, %arg1, %arg2, %arg3) : memref<?x?x?x?xf32>
    %cst = arith.constant dense<1.000000e+00> : vector<5x4x3xf32>
    affine.for %arg4 = 0 to %arg0 step 3 {
      affine.for %arg5 = 0 to %arg1 step 4 {
        affine.for %arg6 = 0 to %arg2 {
          affine.for %arg7 = 0 to %arg3 step 5 {
            vector.transfer_write %cst, %alloc[%arg4, %arg5, %arg6, %arg7] {permutation_map = #map} : vector<5x4x3xf32>, memref<?x?x?x?xf32>
          }
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @transfer_read_progressive(%arg0: memref<?x?xf32>, %arg1: index) -> vector<3x15xf32> {
    %cst = arith.constant 7.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst : memref<?x?xf32>, vector<3x15xf32>
    return %0 : vector<3x15xf32>
  }
}

// -----
module {
  func.func @transfer_write_progressive(%arg0: memref<?x?xf32>, %arg1: index, %arg2: vector<3x15xf32>) {
    vector.transfer_write %arg2, %arg0[%arg1, %arg1] : vector<3x15xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @transfer_write_progressive_inbounds(%arg0: memref<?x?xf32>, %arg1: index, %arg2: vector<3x15xf32>) {
    vector.transfer_write %arg2, %arg0[%arg1, %arg1] {in_bounds = [true, true]} : vector<3x15xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @transfer_read_simple(%arg0: memref<2x2xf32>) -> vector<2x2xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<2x2xf32>, vector<2x2xf32>
    return %0 : vector<2x2xf32>
  }
  func.func @transfer_read_minor_identity(%arg0: memref<?x?x?x?xf32>) -> vector<3x3xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %cst : memref<?x?x?x?xf32>, vector<3x3xf32>
    return %0 : vector<3x3xf32>
  }
  func.func @transfer_write_minor_identity(%arg0: vector<3x3xf32>, %arg1: memref<?x?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    vector.transfer_write %arg0, %arg1[%c0, %c0, %c0, %c0] : vector<3x3xf32>, memref<?x?x?x?xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 + d1 * 8)>
module {
  func.func @transfer_read_strided(%arg0: memref<8x4xf32, #map>) -> vector<4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<8x4xf32, #map>, vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @transfer_write_strided(%arg0: vector<4xf32>, %arg1: memref<8x4xf32, #map>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0] : vector<4xf32>, memref<8x4xf32, #map>
    return
  }
}

// -----
module {
  func.func private @fake_side_effecting_fun(vector<2x2xf32>)
  func.func @transfer_read_within_async_execute(%arg0: memref<2x2xf32>) -> !async.token {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %token = async.execute {
      %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<2x2xf32>, vector<2x2xf32>
      func.call @fake_side_effecting_fun(%0) : (vector<2x2xf32>) -> ()
      async.yield
    }
    return %token : !async.token
  }
}

// -----
#map = affine_map<() -> (0)>
module {
  func.func @transfer_read_with_tensor(%arg0: tensor<f32>) -> vector<1xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_read %arg0[], %cst {permutation_map = #map} : tensor<f32>, vector<1xf32>
    return %0 : vector<1xf32>
  }
}

// -----
module {
  func.func @transfer_write_scalable(%arg0: memref<?xf32, strided<[?], offset: ?>>, %arg1: f32) {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?xf32, strided<[?], offset: ?>>
    %1 = llvm.intr.stepvector : vector<[16]xi32>
    %2 = arith.index_cast %dim : index to i32
    %3 = llvm.mlir.undef : vector<[16]xi32>
    %4 = llvm.insertelement %2, %3[%0 : i32] : vector<[16]xi32>
    %5 = llvm.shufflevector %4, %3 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] : vector<[16]xi32> 
    %6 = arith.cmpi slt, %1, %5 : vector<[16]xi32>
    %7 = llvm.mlir.undef : vector<[16]xf32>
    %8 = llvm.insertelement %arg1, %7[%0 : i32] : vector<[16]xf32>
    %9 = llvm.shufflevector %8, %7 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] : vector<[16]xf32> 
    vector.transfer_write %9, %arg0[%c0], %6 {in_bounds = [true]} : vector<[16]xf32>, memref<?xf32, strided<[?], offset: ?>>
    return
  }
}

// -----
module {
  func.func @vector_print_vector_0d(%arg0: vector<f32>) {
    vector.print %arg0 : vector<f32>
    return
  }
}

// -----
module {
  func.func @vector_print_vector(%arg0: vector<2x2xf32>) {
    vector.print %arg0 : vector<2x2xf32>
    return
  }
}

// -----
module {
  func.func @vector_print_scalable_vector(%arg0: vector<[4]xi32>) {
    vector.print %arg0 : vector<[4]xi32>
    return
  }
}

// -----
module {
  func.func @transfer_read_array_of_scalable(%arg0: memref<3x?xf32>) -> vector<3x[4]xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg0, %c1 : memref<3x?xf32>
    %0 = vector.create_mask %c1, %dim : vector<3x[4]xi1>
    %1 = vector.transfer_read %arg0[%c0, %c0], %cst, %0 {in_bounds = [true, true]} : memref<3x?xf32>, vector<3x[4]xf32>
    return %1 : vector<3x[4]xf32>
  }
}

// -----
module {
  func.func @transfer_write_array_of_scalable(%arg0: vector<3x[4]xf32>, %arg1: memref<3x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg1, %c1 : memref<3x?xf32>
    %0 = vector.create_mask %c1, %dim : vector<3x[4]xi1>
    vector.transfer_write %arg0, %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : vector<3x[4]xf32>, memref<3x?xf32>
    return
  }
}

// -----
module {
  func.func @cannot_lower_transfer_write_with_leading_scalable(%arg0: vector<[4]x4xf32>, %arg1: memref<?x4xf32>) {
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg1, %c0 : memref<?x4xf32>
    %0 = vector.create_mask %dim, %c4 : vector<[4]x4xi1>
    vector.transfer_write %arg0, %arg1[%c0, %c0], %0 {in_bounds = [true, true]} : vector<[4]x4xf32>, memref<?x4xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, 0, 0, d3)>
module {
  func.func @cannot_lower_transfer_read_with_leading_scalable(%arg0: memref<?x4xf32>) -> vector<[4]x4xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg0, %c0 : memref<?x4xf32>
    %0 = vector.create_mask %dim, %c4 : vector<[4]x4xi1>
    %1 = vector.transfer_read %arg0[%c0, %c0], %cst, %0 {in_bounds = [true, true]} : memref<?x4xf32>, vector<[4]x4xf32>
    return %1 : vector<[4]x4xf32>
  }
  func.func @does_not_crash_on_unpack_one_dim(%arg0: memref<1x1x1x1xi32>, %arg1: vector<1x1xi1>) -> vector<1x1x1x1xi32> {
    %c0 = arith.constant 0 : index
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %c0_i32, %arg1 {permutation_map = #map} : memref<1x1x1x1xi32>, vector<1x1x1x1xi32>
    return %0 : vector<1x1x1x1xi32>
  }
  func.func @add_arrays_of_scalable_vectors(%arg0: memref<1x2x?xf32>, %arg1: memref<1x2x?xf32>) -> vector<1x2x[4]xf32> {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c2_0 = arith.constant 2 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = memref.dim %arg0, %c2 : memref<1x2x?xf32>
    %0 = vector.create_mask %c2, %c2_0, %dim : vector<1x2x[4]xi1>
    %1 = vector.transfer_read %arg0[%c0, %c0, %c0], %cst, %0 {in_bounds = [true, true, true]} : memref<1x2x?xf32>, vector<1x2x[4]xf32>
    return %1 : vector<1x2x[4]xf32>
  }
  func.func @cannot_fully_unroll_transfer_write_of_nd_scalable_vector(%arg0: vector<[4]x[4]xf32>, %arg1: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %arg1[%c0, %c0] {in_bounds = [true, true]} : vector<[4]x[4]xf32>, memref<?x?xf32>
    return
  }
  func.func @unroll_transfer_write_target_rank_zero(%arg0: vector<2xi32>) {
    %alloc = memref.alloc() : memref<4xi32>
    %c0 = arith.constant 0 : index
    vector.transfer_write %arg0, %alloc[%c0] : vector<2xi32>, memref<4xi32>
    return
  }
}

// -----
module {
  func.func @scalable_transpose_store_unmasked(%arg0: vector<4x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index) {
    %0 = vector.transpose %arg0, [1, 0] : vector<4x[4]xf32> to vector<[4]x4xf32>
    vector.transfer_write %0, %arg1[%arg2, %arg3] {in_bounds = [true, true]} : vector<[4]x4xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @scalable_transpose_store_dynamic_mask(%arg0: vector<4x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    %0 = vector.transpose %arg0, [1, 0] : vector<4x[4]xf32> to vector<[4]x4xf32>
    %1 = vector.create_mask %arg4, %arg5 : vector<[4]x4xi1>
    vector.transfer_write %0, %arg1[%arg2, %arg3], %1 {in_bounds = [true, true]} : vector<[4]x4xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @scalable_transpose_store_constant_mask(%arg0: vector<4x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index) {
    %0 = vector.transpose %arg0, [1, 0] : vector<4x[4]xf32> to vector<[4]x4xf32>
    %1 = vector.constant_mask [4, 3] : vector<[4]x4xi1>
    vector.transfer_write %0, %arg1[%arg2, %arg3], %1 {in_bounds = [true, true]} : vector<[4]x4xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @negative_scalable_transpose_store_0(%arg0: vector<[4]x4xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index) {
    %0 = vector.transpose %arg0, [1, 0] : vector<[4]x4xf32> to vector<4x[4]xf32>
    vector.transfer_write %0, %arg1[%arg2, %arg3] {in_bounds = [true, true]} : vector<4x[4]xf32>, memref<?x?xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  func.func @negative_scalable_transpose_store_1(%arg0: vector<4x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index) {
    %0 = vector.transpose %arg0, [1, 0] : vector<4x[4]xf32> to vector<[4]x4xf32>
    vector.transfer_write %0, %arg1[%arg2, %arg3] {in_bounds = [true, true], permutation_map = #map} : vector<[4]x4xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @negative_scalable_transpose_store_2(%arg0: vector<4x[4]xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index) {
    %0 = vector.transpose %arg0, [1, 0] : vector<4x[4]xf32> to vector<[4]x4xf32>
    vector.transfer_write %0, %arg1[%arg2, %arg3] {in_bounds = [false, true]} : vector<[4]x4xf32>, memref<?x?xf32>
    return
  }
}

// -----
module {
  func.func @negative_scalable_transpose_store_3(%arg0: vector<[4]x4xf32>, %arg1: memref<?x?xf32>, %arg2: index, %arg3: index) {
    vector.transfer_write %arg0, %arg1[%arg2, %arg3] {in_bounds = [true, true]} : vector<[4]x4xf32>, memref<?x?xf32>
    return
  }
}

