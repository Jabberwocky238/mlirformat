module {
  func.func @main() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %alloc = memref.alloc(%c1) : memref<?xindex>
    %alloc_2 = memref.alloc(%c1) : memref<?xf32>
    memref.store %c0, %alloc[%c0] : memref<?xindex>
    %outBuffer, %newSize = sparse_tensor.push_back %c0, %alloc_2, %cst_1 : index, memref<?xf32>, f32
    %outBuffer_3, %newSize_4 = sparse_tensor.push_back %newSize, %outBuffer, %cst_0, %c10 : index, memref<?xf32>, f32, index
    %dim = memref.dim %outBuffer_3, %c0 : memref<?xf32>
    vector.print %dim : index
    vector.print %newSize_4 : index
    %0 = vector.transfer_read %outBuffer_3[%c0], %cst : memref<?xf32>, vector<11xf32>
    vector.print %0 : vector<11xf32>
    memref.dealloc %alloc : memref<?xindex>
    memref.dealloc %outBuffer_3 : memref<?xf32>
    return
  }
}

