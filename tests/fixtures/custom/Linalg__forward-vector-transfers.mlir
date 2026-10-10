module {
  func.func @testAllocRead(%arg0: memref<?xf32>) -> vector<32xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<32xf32>
    %subview = memref.subview %alloc[0] [16] [1] : memref<32xf32> to memref<16xf32>
    memref.copy %arg0, %subview : memref<?xf32> to memref<16xf32>
    %0 = vector.transfer_read %alloc[%c0], %cst {in_bounds = [true]} : memref<32xf32>, vector<32xf32>
    memref.dealloc %alloc : memref<32xf32>
    return %0 : vector<32xf32>
  }
  func.func @testAllocFillRead(%arg0: memref<?xf32>) -> vector<32xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<32xf32>
    linalg.fill ins(%cst : f32) outs(%alloc : memref<32xf32>)
    %subview = memref.subview %alloc[0] [16] [1] : memref<32xf32> to memref<16xf32>
    memref.copy %arg0, %subview : memref<?xf32> to memref<16xf32>
    %0 = vector.transfer_read %alloc[%c0], %cst {in_bounds = [true]} : memref<32xf32>, vector<32xf32>
    memref.dealloc %alloc : memref<32xf32>
    return %0 : vector<32xf32>
  }
  func.func @testViewRead(%arg0: memref<?xf32>) -> vector<32xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<128xi8>
    %view = memref.view %alloc[%c0][] : memref<128xi8> to memref<32xf32>
    %subview = memref.subview %view[0] [16] [1] : memref<32xf32> to memref<16xf32>
    memref.copy %arg0, %subview : memref<?xf32> to memref<16xf32>
    %0 = vector.transfer_read %view[%c0], %cst {in_bounds = [true]} : memref<32xf32>, vector<32xf32>
    memref.dealloc %alloc : memref<128xi8>
    return %0 : vector<32xf32>
  }
  func.func @testViewFillRead(%arg0: memref<?xf32>) -> vector<32xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<128xi8>
    %view = memref.view %alloc[%c0][] : memref<128xi8> to memref<32xf32>
    %subview = memref.subview %view[0] [16] [1] : memref<32xf32> to memref<16xf32>
    linalg.fill ins(%cst : f32) outs(%view : memref<32xf32>)
    memref.copy %arg0, %subview : memref<?xf32> to memref<16xf32>
    %0 = vector.transfer_read %view[%c0], %cst {in_bounds = [true]} : memref<32xf32>, vector<32xf32>
    memref.dealloc %alloc : memref<128xi8>
    return %0 : vector<32xf32>
  }
  func.func @testAllocWrite(%arg0: vector<32xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<32xf32>
    %subview = memref.subview %alloc[0] [16] [1] : memref<32xf32> to memref<16xf32>
    vector.transfer_write %arg0, %alloc[%c0] {in_bounds = [true]} : vector<32xf32>, memref<32xf32>
    memref.copy %subview, %arg1 : memref<16xf32> to memref<?xf32>
    memref.dealloc %alloc : memref<32xf32>
    return
  }
  func.func @testViewWrite(%arg0: vector<32xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<128xi8>
    %view = memref.view %alloc[%c0][] : memref<128xi8> to memref<32xf32>
    %subview = memref.subview %view[0] [16] [1] : memref<32xf32> to memref<16xf32>
    vector.transfer_write %arg0, %view[%c0] {in_bounds = [true]} : vector<32xf32>, memref<32xf32>
    memref.copy %subview, %arg1 : memref<16xf32> to memref<?xf32>
    memref.dealloc %alloc : memref<128xi8>
    return
  }
  func.func @failAllocFillRead(%arg0: memref<?xf32>) -> vector<32xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %alloc = memref.alloc() : memref<32xf32>
    linalg.fill ins(%cst : f32) outs(%alloc : memref<32xf32>)
    %subview = memref.subview %alloc[0] [16] [1] : memref<32xf32> to memref<16xf32>
    memref.copy %arg0, %subview : memref<?xf32> to memref<16xf32>
    "some_interleaved_use"(%subview) : (memref<16xf32>) -> ()
    %0 = vector.transfer_read %alloc[%c0], %cst_0 : memref<32xf32>, vector<32xf32>
    memref.dealloc %alloc : memref<32xf32>
    return %0 : vector<32xf32>
  }
  func.func @failAllocWrite(%arg0: vector<32xf32>, %arg1: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<32xf32>
    %subview = memref.subview %alloc[0] [16] [1] : memref<32xf32> to memref<16xf32>
    vector.transfer_write %arg0, %alloc[%c0] : vector<32xf32>, memref<32xf32>
    "some_interleaved_use"(%subview) : (memref<16xf32>) -> ()
    memref.copy %subview, %arg1 : memref<16xf32> to memref<?xf32>
    memref.dealloc %alloc : memref<32xf32>
    return
  }
}

