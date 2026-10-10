#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 floordiv 32, d3 floordiv 64, d2 mod 32, d3 mod 64)>
module {
  func.func @test_norm_dynamic12(%arg0: memref<1x?x?x14xf32, #map>) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c1 : memref<1x?x?x14xf32, #map>
    %dim_0 = memref.dim %arg0, %c2 : memref<1x?x?x14xf32, #map>
    %alloc = memref.alloc(%dim, %dim_0) : memref<1x?x?x14xf32, #map>
    "test.op_norm"(%arg0, %alloc) : (memref<1x?x?x14xf32, #map>, memref<1x?x?x14xf32, #map>) -> ()
    memref.dealloc %alloc : memref<1x?x?x14xf32, #map>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, (d2 floordiv 4) floordiv 32, (d3 mod 8) floordiv 64, (d2 floordiv 4) mod 32, (d3 mod 8) mod 64)>
module {
  func.func @test_norm_dynamic1234(%arg0: memref<?x?x?x?xf32, #map>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?x?x?xf32, #map>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?x?x?xf32, #map>
    %dim_1 = memref.dim %arg0, %c2 : memref<?x?x?x?xf32, #map>
    %dim_2 = memref.dim %arg0, %c3 : memref<?x?x?x?xf32, #map>
    %alloc = memref.alloc(%dim, %dim_0, %dim_1, %dim_2) : memref<?x?x?x?xf32, #map>
    "test.op_norm"(%arg0, %alloc) : (memref<?x?x?x?xf32, #map>, memref<?x?x?x?xf32, #map>) -> ()
    memref.dealloc %alloc : memref<?x?x?x?xf32, #map>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 - d1, d3 - d2)>
module {
  func.func @test_norm_dynamic_not_tiled0(%arg0: memref<1x?x?x14xf32, #map>) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c1 : memref<1x?x?x14xf32, #map>
    %dim_0 = memref.dim %arg0, %c2 : memref<1x?x?x14xf32, #map>
    %alloc = memref.alloc(%dim, %dim_0) : memref<1x?x?x14xf32, #map>
    "test.op_norm"(%arg0, %alloc) : (memref<1x?x?x14xf32, #map>, memref<1x?x?x14xf32, #map>) -> ()
    memref.dealloc %alloc : memref<1x?x?x14xf32, #map>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 - d1, d3 - d2, d2 mod 32, d3 mod 64)>
module {
  func.func @test_norm_dynamic_not_tiled1(%arg0: memref<1x?x?x14xf32, #map>) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c1 : memref<1x?x?x14xf32, #map>
    %dim_0 = memref.dim %arg0, %c2 : memref<1x?x?x14xf32, #map>
    %alloc = memref.alloc(%dim, %dim_0) : memref<1x?x?x14xf32, #map>
    "test.op_norm"(%arg0, %alloc) : (memref<1x?x?x14xf32, #map>, memref<1x?x?x14xf32, #map>) -> ()
    memref.dealloc %alloc : memref<1x?x?x14xf32, #map>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 - d1, d3 floordiv 64, d2 mod 32, d3 mod 32)>
module {
  func.func @test_norm_dynamic_not_tiled2(%arg0: memref<1x?x?x14xf32, #map>) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c1 : memref<1x?x?x14xf32, #map>
    %dim_0 = memref.dim %arg0, %c2 : memref<1x?x?x14xf32, #map>
    %alloc = memref.alloc(%dim, %dim_0) : memref<1x?x?x14xf32, #map>
    "test.op_norm"(%arg0, %alloc) : (memref<1x?x?x14xf32, #map>, memref<1x?x?x14xf32, #map>) -> ()
    memref.dealloc %alloc : memref<1x?x?x14xf32, #map>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 floordiv 32, d2, d3, d1 mod 32, d1 mod 32)>
module {
  func.func @test_norm_dynamic_not_tiled3(%arg0: memref<1x?x?x14xf32, #map>) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c1 : memref<1x?x?x14xf32, #map>
    %dim_0 = memref.dim %arg0, %c2 : memref<1x?x?x14xf32, #map>
    %alloc = memref.alloc(%dim, %dim_0) : memref<1x?x?x14xf32, #map>
    "test.op_norm"(%arg0, %alloc) : (memref<1x?x?x14xf32, #map>, memref<1x?x?x14xf32, #map>) -> ()
    memref.dealloc %alloc : memref<1x?x?x14xf32, #map>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0 floordiv 32, d1 floordiv 32, d0, d3, d0 mod 32, d1 mod 32)>
module {
  func.func @test_norm_dynamic_not_tiled4(%arg0: memref<1x?x?x14xf32, #map>) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c1 : memref<1x?x?x14xf32, #map>
    %dim_0 = memref.dim %arg0, %c2 : memref<1x?x?x14xf32, #map>
    %alloc = memref.alloc(%dim, %dim_0) : memref<1x?x?x14xf32, #map>
    "test.op_norm"(%arg0, %alloc) : (memref<1x?x?x14xf32, #map>, memref<1x?x?x14xf32, #map>) -> ()
    memref.dealloc %alloc : memref<1x?x?x14xf32, #map>
    return
  }
}

