module {
  func.func @test_load(%arg0: memref<2x16x16xf32>, %arg1: index) -> f32 {
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %0 = memref.load %arg0[%arg1, %c0, %c8] : memref<2x16x16xf32>
    return %0 : f32
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.memref.extract_address_computations
      } : !transform.any_op
      transform.debug.emit_remark_at %0, "transformed" : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_load_nontemporal(%arg0: memref<2x16x16xf32>, %arg1: index) -> f32 {
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %0 = memref.load %arg0[%arg1, %c0, %c8] {nontemporal = true} : memref<2x16x16xf32>
    return %0 : f32
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.memref.extract_address_computations
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_store(%arg0: memref<2x16x16xf32>, %arg1: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    memref.store %cst, %arg0[%arg1, %c0, %c8] : memref<2x16x16xf32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.memref.extract_address_computations
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_store_nontemporal(%arg0: memref<2x16x16xf32>, %arg1: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    memref.store %cst, %arg0[%arg1, %c0, %c8] {nontemporal = true} : memref<2x16x16xf32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.memref.extract_address_computations
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @testWithLoop(%arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>) -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %dim_1 = memref.dim %arg0, %c2 : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %0 = scf.for %arg1 = %c0 to %dim_1 step %c1 iter_args(%arg2 = %cst) -> (f32) {
      %1 = scf.for %arg3 = %c0 to %dim_0 step %c1 iter_args(%arg4 = %arg2) -> (f32) {
        %2 = scf.for %arg5 = %c0 to %dim step %c1 iter_args(%arg6 = %arg4) -> (f32) {
          %3 = memref.load %arg0[%arg5, %arg3, %arg1] : memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
          %4 = arith.addf %3, %arg2 : f32
          scf.yield %4 : f32
        }
        scf.yield %2 : f32
      }
      scf.yield %1 : f32
    }
    return %0 : f32
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.memref.extract_address_computations
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_ldmatrix(%arg0: memref<4x32x32xf16, 3>, %arg1: index, %arg2: index, %arg3: index) -> vector<4x2xf16> {
    %0 = nvgpu.ldmatrix %arg0[%arg1, %arg2, %arg3] {numTiles = 4 : i32, transpose = false} : memref<4x32x32xf16, 3> -> vector<4x2xf16>
    return %0 : vector<4x2xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.memref.extract_address_computations
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @test_ldmatrix(%arg0: memref<?x?x?xf16, 3>, %arg1: index, %arg2: index, %arg3: index) -> vector<4x2xf16> {
    %0 = nvgpu.ldmatrix %arg0[%arg1, %arg2, %arg3] {numTiles = 4 : i32, transpose = false} : memref<?x?x?xf16, 3> -> vector<4x2xf16>
    return %0 : vector<4x2xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.memref.extract_address_computations
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
module {
  func.func @test_transfer_read_op(%arg0: memref<?x?x?xf16>, %arg1: index, %arg2: index, %arg3: index) -> vector<4x2xf16> {
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%arg1, %arg2, %arg3], %cst {permutation_map = #map} : memref<?x?x?xf16>, vector<4x2xf16>
    return %0 : vector<4x2xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.memref.extract_address_computations
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
module {
  func.func @test_transfer_read_op_with_tensor(%arg0: tensor<?x?x?xf16>, %arg1: index, %arg2: index, %arg3: index) -> vector<4x2xf16> {
    %cst = arith.constant 0.000000e+00 : f16
    %0 = vector.transfer_read %arg0[%arg1, %arg2, %arg3], %cst {permutation_map = #map} : tensor<?x?x?xf16>, vector<4x2xf16>
    return %0 : vector<4x2xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.memref.extract_address_computations
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
module {
  func.func @test_transfer_write_op(%arg0: memref<?x?x?xf16>, %arg1: index, %arg2: index, %arg3: index) {
    %cst = arith.constant dense<0.000000e+00> : vector<4x2xf16>
    vector.transfer_write %cst, %arg0[%arg1, %arg2, %arg3] {permutation_map = #map} : vector<4x2xf16>, memref<?x?x?xf16>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.memref.extract_address_computations
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
module {
  func.func @test_transfer_write_op_with_strides(%arg0: memref<?x?x?xf16, strided<[329, 26, 12], offset: ?>>, %arg1: index, %arg2: index, %arg3: index) {
    %cst = arith.constant dense<0.000000e+00> : vector<4x2xf16>
    vector.transfer_write %cst, %arg0[%arg1, %arg2, %arg3] {permutation_map = #map} : vector<4x2xf16>, memref<?x?x?xf16, strided<[329, 26, 12], offset: ?>>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.memref.extract_address_computations
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
module {
  func.func @test_transfer_write_op_with_tensor(%arg0: tensor<?x?x?xf16>, %arg1: index, %arg2: index, %arg3: index) -> tensor<?x?x?xf16> {
    %cst = arith.constant dense<0.000000e+00> : vector<4x2xf16>
    %0 = vector.transfer_write %cst, %arg0[%arg1, %arg2, %arg3] {permutation_map = #map} : vector<4x2xf16>, tensor<?x?x?xf16>
    return %0 : tensor<?x?x?xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.memref.extract_address_computations
      } : !transform.any_op
      transform.yield 
    }
  }
}

