#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 floordiv 32, d3 floordiv 64, d2 mod 32, d3 mod 64)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 floordiv 32, d3 floordiv 32, d2 mod 32, d3 mod 32)>
module {
  func.func @test_norm(%arg0: memref<1x16x14x14xf32, #map>) {
    %alloc = memref.alloc() : memref<1x16x14x14xf32, #map>
    "test.op_norm"(%arg0, %alloc) : (memref<1x16x14x14xf32, #map>, memref<1x16x14x14xf32, #map>) -> ()
    memref.dealloc %alloc : memref<1x16x14x14xf32, #map>
    return
  }
  func.func @test_nonnorm(%arg0: memref<1x16x14x14xf32, #map>) {
    %alloc = memref.alloc() : memref<1x16x14x14xf32, #map>
    "test.op_nonnorm"(%arg0, %alloc) : (memref<1x16x14x14xf32, #map>, memref<1x16x14x14xf32, #map>) -> ()
    memref.dealloc %alloc : memref<1x16x14x14xf32, #map>
    return
  }
  func.func @test_nonnorm_identity_layout(%arg0: memref<1x16x14x14xf32, #map>) {
    %alloc = memref.alloc() : memref<1x16x14x14xf32>
    "test.op_nonnorm"(%alloc, %alloc) : (memref<1x16x14x14xf32>, memref<1x16x14x14xf32>) -> ()
    "test.op_norm"(%arg0, %alloc) : (memref<1x16x14x14xf32, #map>, memref<1x16x14x14xf32>) -> ()
    memref.dealloc %alloc : memref<1x16x14x14xf32>
    return
  }
  func.func @test_norm_mix(%arg0: memref<1x16x1x1x32x64xf32>) {
    %alloc = memref.alloc() : memref<1x16x14x14xf32, #map>
    "test.op_norm"(%arg0, %alloc) : (memref<1x16x1x1x32x64xf32>, memref<1x16x14x14xf32, #map>) -> ()
    memref.dealloc %alloc : memref<1x16x14x14xf32, #map>
    return
  }
  func.func @test_load_store(%arg0: memref<1x16x14x14xf32>) {
    %alloc = memref.alloc() : memref<1x16x14x14xf32, #map1>
    %alloc_0 = memref.alloc() : memref<1x16x14x14xf32>
    "test.op_norm"(%alloc, %alloc_0) : (memref<1x16x14x14xf32, #map1>, memref<1x16x14x14xf32>) -> ()
    %cst = arith.constant 3.000000e+00 : f32
    affine.for %arg1 = 0 to 1 {
      affine.for %arg2 = 0 to 16 {
        affine.for %arg3 = 0 to 14 {
          affine.for %arg4 = 0 to 14 {
            %0 = memref.load %alloc_0[%arg1, %arg2, %arg3, %arg4] : memref<1x16x14x14xf32>
            %1 = arith.addf %0, %cst : f32
            memref.store %1, %arg0[%arg1, %arg2, %arg3, %arg4] : memref<1x16x14x14xf32>
          }
        }
      }
    }
    memref.dealloc %alloc : memref<1x16x14x14xf32, #map1>
    memref.dealloc %alloc_0 : memref<1x16x14x14xf32>
    return
  }
  func.func @test_norm_ret(%arg0: memref<1x16x14x14xf32, #map1>) -> (memref<1x16x14x14xf32, #map1>, memref<1x16x14x14xf32>) {
    %alloc = memref.alloc() : memref<1x16x14x14xf32, #map1>
    %Y, %Z = "test.op_norm_ret"(%arg0) : (memref<1x16x14x14xf32, #map1>) -> (memref<1x16x14x14xf32, #map1>, memref<1x16x14x14xf32>)
    "test.op_norm"(%Y, %alloc) : (memref<1x16x14x14xf32, #map1>, memref<1x16x14x14xf32, #map1>) -> ()
    memref.dealloc %alloc : memref<1x16x14x14xf32, #map1>
    return %Y, %Z : memref<1x16x14x14xf32, #map1>, memref<1x16x14x14xf32>
  }
  "test.op_funcref"() {func = @test_norm_mix} : () -> ()
}

// -----
#map = affine_map<(d0) -> (d0 floordiv 32, d0 mod 32)>
module {
  func.func @test_norm_reinterpret_cast(%arg0: memref<3xf32, #map>) -> memref<3x1x1xf32> {
    %alloc = memref.alloc() : memref<3xf32>
    "test.op_norm"(%arg0, %alloc) : (memref<3xf32, #map>, memref<3xf32>) -> ()
    %reinterpret_cast = memref.reinterpret_cast %alloc to offset: [0], sizes: [3, 1, 1], strides: [1, 1, 1] : memref<3xf32> to memref<3x1x1xf32>
    return %reinterpret_cast : memref<3x1x1xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0 floordiv 32, d0 mod 32)>
#map1 = affine_map<(d0, d1) -> (d0 * 7 + d1)>
module {
  func.func @prefetch_normalize(%arg0: memref<512xf32, #map>) {
    affine.for %arg1 = 0 to 8 {
      affine.prefetch %arg0[%arg1], read, locality<3>, data : memref<512xf32, #map>
    }
    return
  }
  func.func @test_reinterpret_cast(%arg0: memref<5x7xf32>, %arg1: memref<5x7xf32>, %arg2: memref<5x7xf32>) {
    %reinterpret_cast = memref.reinterpret_cast %arg0 to offset: [0], sizes: [5, 7], strides: [7, 1] : memref<5x7xf32> to memref<5x7xf32, #map1>
    affine.for %arg3 = 0 to 5 {
      affine.for %arg4 = 0 to 7 {
        %0 = affine.load %reinterpret_cast[%arg3, %arg4] : memref<5x7xf32, #map1>
        %1 = affine.load %arg1[%arg3, %arg4] : memref<5x7xf32>
        %2 = arith.subf %0, %1 : f32
        affine.store %2, %arg2[%arg3, %arg4] : memref<5x7xf32>
      }
    }
    return
  }
  func.func @reinterpret_cast_non_zero_offset(%arg0: index, %arg1: memref<1x10x17xi32, strided<[?, ?, ?], offset: ?>>, %arg2: memref<1x10x17xi32, strided<[?, ?, ?], offset: ?>>, %arg3: memref<1x10x17xi32, strided<[?, ?, ?], offset: ?>>) -> (memref<1x5xf32, strided<[17, 1], offset: 27>>, memref<1x5xf32, strided<[17, 1], offset: 27>>, memref<2x17xf32>, memref<1x10x17xi32>, memref<1x10x17xf32>) {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<1x10x17xi32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<2x17xf32>
    %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<1x10x17xf32>
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %reinterpret_cast = memref.reinterpret_cast %alloc_0 to offset: [27], sizes: [1, 5], strides: [17, 1] : memref<2x17xf32> to memref<1x5xf32, strided<[17, 1], offset: 27>>
    return %reinterpret_cast, %reinterpret_cast, %alloc_0, %alloc, %alloc_1 : memref<1x5xf32, strided<[17, 1], offset: 27>>, memref<1x5xf32, strided<[17, 1], offset: 27>>, memref<2x17xf32>, memref<1x10x17xi32>, memref<1x10x17xf32>
  }
}

