module {
  func.func @single_loop_remark(%arg0: memref<100xf32>) {
    %c0 = arith.constant 0 : index
    %c100 = arith.constant 100 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    acc.loop tile({%c4 : index}) control(%arg1 : index) = (%c0 : index) to (%c100 : index)  step (%c1 : index) {
      %0 = arith.index_castui %arg1 : index to i32
      %1 = arith.sitofp %0 : i32 to f32
      memref.store %1, %arg0[%arg1] : memref<100xf32>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
  func.func @nested_loop_remark(%arg0: memref<100x50xf32>) {
    %c0 = arith.constant 0 : index
    %c100 = arith.constant 100 : index
    %c50 = arith.constant 50 : index
    %c1 = arith.constant 1 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    acc.loop tile({%c8 : index, %c16 : index}) control(%arg1 : index, %arg2 : index) = (%c0, %c0 : index, index) to (%c100, %c50 : index, index)  step (%c1, %c1 : index, index) {
      %0 = arith.addi %arg1, %arg2 : index
      %1 = arith.index_castui %0 : index to i32
      %2 = arith.sitofp %1 : i32 to f32
      memref.store %2, %arg0[%arg1, %arg2] : memref<100x50xf32>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
  func.func @unknown_tile_remark(%arg0: memref<1000xf32>) {
    %c0 = arith.constant 0 : index
    %c1000 = arith.constant 1000 : index
    %c1 = arith.constant 1 : index
    %c-1_i32 = arith.constant -1 : i32
    acc.loop tile({%c-1_i32 : i32}) control(%arg1 : index) = (%c0 : index) to (%c1000 : index)  step (%c1 : index) {
      %0 = arith.index_castui %arg1 : index to i32
      %1 = arith.sitofp %0 : i32 to f32
      memref.store %1, %arg0[%arg1] : memref<1000xf32>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
  func.func @multiple_unknown_tiles_remark(%arg0: memref<100x100xf32>) {
    %c0 = arith.constant 0 : index
    %c100 = arith.constant 100 : index
    %c1 = arith.constant 1 : index
    %c-1_i32 = arith.constant -1 : i32
    acc.loop tile({%c-1_i32 : i32, %c-1_i32 : i32}) control(%arg1 : index, %arg2 : index) = (%c0, %c0 : index, index) to (%c100, %c100 : index, index)  step (%c1, %c1 : index, index) {
      %0 = arith.addi %arg1, %arg2 : index
      %1 = arith.index_castui %0 : index to i32
      %2 = arith.sitofp %1 : i32 to f32
      memref.store %2, %arg0[%arg1, %arg2] : memref<100x100xf32>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
}

