module {
  func.func @warp_extract(%arg0: index, %arg1: memref<1024x1024xf32>, %arg2: vector<1xf32>) {
    %c0 = arith.constant 0 : index
    gpu.warp_execute_on_lane_0(%arg0)[32] {
      vector.transfer_write %arg2, %arg1[%c0, %c0] {in_bounds = [true]} : vector<1xf32>, memref<1024x1024xf32>
    }
    return
  }
}

