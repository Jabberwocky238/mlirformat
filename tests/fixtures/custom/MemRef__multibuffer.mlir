#map = affine_map<(d0, d1)[s0] -> (d0 * 1024 + s0 + d1)>
module {
  func.func @multi_buffer(%arg0: memref<1024x1024xf32>) {
    %alloc = memref.alloc() {someAttribute} : memref<4x128xf32>
    %c1024 = arith.constant 1024 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    scf.for %arg1 = %c1 to %c1024 step %c3 {
      %subview = memref.subview %arg0[%arg1, 0] [4, 128] [1, 1] : memref<1024x1024xf32> to memref<4x128xf32, #map>
      memref.copy %subview, %alloc : memref<4x128xf32, #map> to memref<4x128xf32>
      "some_use"(%alloc) : (memref<4x128xf32>) -> ()
      "some_use"(%alloc) : (memref<4x128xf32>) -> ()
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1)[s0] -> (d0 * 1024 + s0 + d1)>
module {
  func.func @multi_buffer_affine(%arg0: memref<1024x1024xf32>) {
    %alloc = memref.alloc() : memref<4x128xf32>
    %c1024 = arith.constant 1024 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    affine.for %arg1 = 1 to 1024 step 3 {
      %subview = memref.subview %arg0[%arg1, 0] [4, 128] [1, 1] : memref<1024x1024xf32> to memref<4x128xf32, #map>
      memref.copy %subview, %alloc : memref<4x128xf32, #map> to memref<4x128xf32>
      "some_use"(%alloc) : (memref<4x128xf32>) -> ()
      "some_use"(%alloc) : (memref<4x128xf32>) -> ()
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1)[s0] -> (d0 * 1024 + s0 + d1)>
#map1 = affine_map<(d0, d1) -> (d0 * 128 + d1 + 1)>
module {
  func.func @multi_buffer_subview_use(%arg0: memref<1024x1024xf32>) {
    %alloc = memref.alloc() : memref<4x128xf32>
    %c1024 = arith.constant 1024 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    scf.for %arg1 = %c1 to %c1024 step %c3 {
      %subview = memref.subview %arg0[%arg1, 0] [4, 128] [1, 1] : memref<1024x1024xf32> to memref<4x128xf32, #map>
      memref.copy %subview, %alloc : memref<4x128xf32, #map> to memref<4x128xf32>
      %subview_0 = memref.subview %alloc[0, 1] [4, 127] [1, 1] : memref<4x128xf32> to memref<4x127xf32, #map1>
      "some_use"(%subview_0) : (memref<4x127xf32, #map1>) -> ()
      "some_use"(%alloc) : (memref<4x128xf32>) -> ()
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1)[s0] -> (d0 * 1024 + s0 + d1)>
module {
  func.func @multi_buffer_negative(%arg0: memref<1024x1024xf32>) {
    %alloc = memref.alloc() : memref<4x128xf32>
    %c1024 = arith.constant 1024 : index
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    scf.for %arg1 = %c0 to %c1024 step %c3 {
      "blocking_use"(%alloc) : (memref<4x128xf32>) -> ()
      %subview = memref.subview %arg0[%arg1, 0] [4, 128] [1, 1] : memref<1024x1024xf32> to memref<4x128xf32, #map>
      memref.copy %subview, %alloc : memref<4x128xf32, #map> to memref<4x128xf32>
      "some_use"(%alloc) : (memref<4x128xf32>) -> ()
    }
    return
  }
}

