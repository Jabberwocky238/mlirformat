#map = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
module {
  func.func @storeValuesTo(%arg0: memref<?xi32>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    memref.store %arg1, %arg0[%c0] : memref<?xi32>
    memref.store %arg2, %arg0[%c1] : memref<?xi32>
    memref.store %arg3, %arg0[%c2] : memref<?xi32>
    memref.store %arg4, %arg0[%c3] : memref<?xi32>
    memref.store %arg5, %arg0[%c4] : memref<?xi32>
    return
  }
  func.func @storeValuesToStrided(%arg0: memref<?xi32, strided<[4], offset: ?>>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    memref.store %arg1, %arg0[%c0] : memref<?xi32, strided<[4], offset: ?>>
    memref.store %arg2, %arg0[%c1] : memref<?xi32, strided<[4], offset: ?>>
    memref.store %arg3, %arg0[%c2] : memref<?xi32, strided<[4], offset: ?>>
    memref.store %arg4, %arg0[%c3] : memref<?xi32, strided<[4], offset: ?>>
    memref.store %arg5, %arg0[%c4] : memref<?xi32, strided<[4], offset: ?>>
    return
  }
  func.func @main() {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c3_i32 = arith.constant 3 : i32
    %c4_i32 = arith.constant 4 : i32
    %c5_i32 = arith.constant 5 : i32
    %c6_i32 = arith.constant 6 : i32
    %c7_i32 = arith.constant 7 : i32
    %c8_i32 = arith.constant 8 : i32
    %c9_i32 = arith.constant 9 : i32
    %c10_i32 = arith.constant 10 : i32
    %c100_i32 = arith.constant 100 : i32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %alloc = memref.alloc() : memref<20xi32>
    %cast = memref.cast %alloc : memref<20xi32> to memref<?xi32>
    %subview = memref.subview %cast[%c0] [%c5] [4] : memref<?xi32> to memref<?xi32, strided<[4], offset: ?>>
    %subview_0 = memref.subview %cast[%c1] [%c5] [4] : memref<?xi32> to memref<?xi32, strided<[4], offset: ?>>
    %subview_1 = memref.subview %cast[%c2] [%c5] [4] : memref<?xi32> to memref<?xi32, strided<[4], offset: ?>>
    %subview_2 = memref.subview %cast[%c3] [%c5] [4] : memref<?xi32> to memref<?xi32, strided<[4], offset: ?>>
    %alloc_3 = memref.alloc() : memref<7xi32>
    %cast_4 = memref.cast %alloc_3 : memref<7xi32> to memref<?xi32>
    call @storeValuesToStrided(%subview, %c1_i32, %c1_i32, %c3_i32, %c10_i32, %c3_i32) : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    call @storeValuesToStrided(%subview_0, %c10_i32, %c2_i32, %c1_i32, %c5_i32, %c1_i32) : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    call @storeValuesToStrided(%subview_1, %c2_i32, %c4_i32, %c9_i32, %c7_i32, %c9_i32) : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    call @storeValuesToStrided(%subview_2, %c6_i32, %c10_i32, %c8_i32, %c9_i32, %c7_i32) : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    call @storeValuesTo(%cast_4, %c5_i32, %c7_i32, %c4_i32, %c9_i32, %c7_i32) : (memref<?xi32>, i32, i32, i32, i32, i32) -> ()
    sparse_tensor.sort quick_sort %c5, %cast jointly %cast_4 {ny = 1 : index, perm_map = #map} : memref<?xi32> jointly memref<?xi32>
    %0 = vector.transfer_read %subview_0[%c0], %c100_i32 : memref<?xi32, strided<[4], offset: ?>>, vector<5xi32>
    vector.print %0 : vector<5xi32>
    %1 = vector.transfer_read %subview_1[%c0], %c100_i32 : memref<?xi32, strided<[4], offset: ?>>, vector<5xi32>
    vector.print %1 : vector<5xi32>
    %2 = vector.transfer_read %subview[%c0], %c100_i32 : memref<?xi32, strided<[4], offset: ?>>, vector<5xi32>
    vector.print %2 : vector<5xi32>
    %3 = vector.transfer_read %subview_2[%c0], %c100_i32 : memref<?xi32, strided<[4], offset: ?>>, vector<5xi32>
    vector.print %3 : vector<5xi32>
    %4 = vector.transfer_read %cast_4[%c0], %c100_i32 : memref<?xi32>, vector<5xi32>
    vector.print %4 : vector<5xi32>
    call @storeValuesToStrided(%subview, %c1_i32, %c1_i32, %c3_i32, %c10_i32, %c3_i32) : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    call @storeValuesToStrided(%subview_0, %c10_i32, %c2_i32, %c1_i32, %c5_i32, %c1_i32) : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    call @storeValuesToStrided(%subview_1, %c2_i32, %c4_i32, %c9_i32, %c7_i32, %c9_i32) : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    call @storeValuesToStrided(%subview_2, %c6_i32, %c10_i32, %c8_i32, %c9_i32, %c7_i32) : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    call @storeValuesTo(%cast_4, %c5_i32, %c7_i32, %c4_i32, %c9_i32, %c7_i32) : (memref<?xi32>, i32, i32, i32, i32, i32) -> ()
    sparse_tensor.sort insertion_sort_stable %c5, %cast jointly %cast_4 {ny = 1 : index, perm_map = #map} : memref<?xi32> jointly memref<?xi32>
    %5 = vector.transfer_read %subview_0[%c0], %c100_i32 : memref<?xi32, strided<[4], offset: ?>>, vector<5xi32>
    vector.print %5 : vector<5xi32>
    %6 = vector.transfer_read %subview_1[%c0], %c100_i32 : memref<?xi32, strided<[4], offset: ?>>, vector<5xi32>
    vector.print %6 : vector<5xi32>
    %7 = vector.transfer_read %subview[%c0], %c100_i32 : memref<?xi32, strided<[4], offset: ?>>, vector<5xi32>
    vector.print %7 : vector<5xi32>
    %8 = vector.transfer_read %subview_2[%c0], %c100_i32 : memref<?xi32, strided<[4], offset: ?>>, vector<5xi32>
    vector.print %8 : vector<5xi32>
    %9 = vector.transfer_read %cast_4[%c0], %c100_i32 : memref<?xi32>, vector<5xi32>
    vector.print %9 : vector<5xi32>
    call @storeValuesToStrided(%subview, %c1_i32, %c1_i32, %c3_i32, %c10_i32, %c3_i32) : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    call @storeValuesToStrided(%subview_0, %c10_i32, %c2_i32, %c1_i32, %c5_i32, %c1_i32) : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    call @storeValuesToStrided(%subview_1, %c2_i32, %c4_i32, %c9_i32, %c7_i32, %c9_i32) : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    call @storeValuesToStrided(%subview_2, %c6_i32, %c10_i32, %c8_i32, %c9_i32, %c7_i32) : (memref<?xi32, strided<[4], offset: ?>>, i32, i32, i32, i32, i32) -> ()
    call @storeValuesTo(%cast_4, %c5_i32, %c7_i32, %c4_i32, %c9_i32, %c7_i32) : (memref<?xi32>, i32, i32, i32, i32, i32) -> ()
    sparse_tensor.sort heap_sort %c5, %cast jointly %cast_4 {ny = 1 : index, perm_map = #map} : memref<?xi32> jointly memref<?xi32>
    %10 = vector.transfer_read %subview_0[%c0], %c100_i32 : memref<?xi32, strided<[4], offset: ?>>, vector<5xi32>
    vector.print %10 : vector<5xi32>
    %11 = vector.transfer_read %subview_1[%c0], %c100_i32 : memref<?xi32, strided<[4], offset: ?>>, vector<5xi32>
    vector.print %11 : vector<5xi32>
    %12 = vector.transfer_read %subview[%c0], %c100_i32 : memref<?xi32, strided<[4], offset: ?>>, vector<5xi32>
    vector.print %12 : vector<5xi32>
    %13 = vector.transfer_read %subview_2[%c0], %c100_i32 : memref<?xi32, strided<[4], offset: ?>>, vector<5xi32>
    vector.print %13 : vector<5xi32>
    %14 = vector.transfer_read %cast_4[%c0], %c100_i32 : memref<?xi32>, vector<5xi32>
    vector.print %14 : vector<5xi32>
    memref.dealloc %cast : memref<?xi32>
    memref.dealloc %cast_4 : memref<?xi32>
    return
  }
}

