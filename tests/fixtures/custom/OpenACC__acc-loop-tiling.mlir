module {
  func.func @single_loop_tile(%arg0: memref<10xf32>) {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    acc.loop tile({%c2 : index}) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      %0 = arith.index_castui %arg1 : index to i32
      %1 = arith.sitofp %0 : i32 to f32
      memref.store %1, %arg0[%arg1] : memref<10xf32>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
  func.func @nested_loop_tile(%arg0: memref<100x50xf32>) {
    %c0 = arith.constant 0 : index
    %c100 = arith.constant 100 : index
    %c50 = arith.constant 50 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    acc.loop gang vector tile({%c4 : index, %c8 : index}) control(%arg1 : index, %arg2 : index) = (%c0, %c0 : index, index) to (%c100, %c50 : index, index)  step (%c1, %c1 : index, index) {
      %0 = arith.addi %arg1, %arg2 : index
      %1 = arith.index_castui %0 : index to i32
      %2 = arith.sitofp %1 : i32 to f32
      memref.store %2, %arg0[%arg1, %arg2] : memref<100x50xf32>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
  func.func @gang_static_with_multi_dim_tile(%arg0: memref<100x50xf32>) {
    %c0 = arith.constant 0 : index
    %c100 = arith.constant 100 : index
    %c50 = arith.constant 50 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c1_i32 = arith.constant 1 : i32
    acc.loop gang({static=%c1_i32 : i32}) tile({%c4 : index, %c8 : index}) control(%arg1 : index, %arg2 : index) = (%c0, %c0 : index, index) to (%c100, %c50 : index, index)  step (%c1, %c1 : index, index) {
      %0 = arith.addi %arg1, %arg2 : index
      %1 = arith.index_castui %0 : index to i32
      %2 = arith.sitofp %1 : i32 to f32
      memref.store %2, %arg0[%arg1, %arg2] : memref<100x50xf32>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
  func.func @worker_num_with_multi_dim_tile(%arg0: memref<100x50xf32>) {
    %c0 = arith.constant 0 : index
    %c100 = arith.constant 100 : index
    %c50 = arith.constant 50 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %c4_i32 = arith.constant 4 : i32
    acc.loop worker(%c4_i32 : i32) vector tile({%c4 : index, %c8 : index}) control(%arg1 : index, %arg2 : index) = (%c0, %c0 : index, index) to (%c100, %c50 : index, index)  step (%c1, %c1 : index, index) {
      %0 = arith.addi %arg1, %arg2 : index
      %1 = arith.index_castui %0 : index to i32
      %2 = arith.sitofp %1 : i32 to f32
      memref.store %2, %arg0[%arg1, %arg2] : memref<100x50xf32>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
  func.func @unknown_tile_size(%arg0: memref<1000xf32>) {
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
  func.func @no_tile_values() {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    acc.loop control(%arg0 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
  func.func @body_with_nested_region(%arg0: memref<10xi32>) {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    acc.loop tile({%c2 : index}) control(%arg1 : index) = (%c0 : index) to (%c10 : index)  step (%c1 : index) {
      %c5 = arith.constant 5 : index
      %0 = arith.cmpi ult, %arg1, %c5 : index
      %1 = scf.if %0 -> (i32) {
        %2 = arith.index_castui %arg1 : index to i32
        scf.yield %2 : i32
      } else {
        %c99_i32 = arith.constant 99 : i32
        scf.yield %c99_i32 : i32
      }
      memref.store %1, %arg0[%arg1] : memref<10xi32>
      acc.yield
    } attributes {independent = [#acc.device_type<none>]}
    return
  }
}

