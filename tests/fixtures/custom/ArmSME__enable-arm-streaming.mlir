module {
  func.func @arm_streaming() {
    return
  }
  func.func @not_arm_streaming() attributes {llvm.enable_arm_streaming_ignore} {
    return
  }
  func.func @requires_arm_streaming() {
    %0 = arm_sme.get_tile : vector<[4]x[4]xi32>
    return
  }
  func.func @does_not_require_arm_streaming() {
    return
  }
  func.func @contains_scalable_vectors(%arg0: vector<[4]xf32>) -> vector<[4]xf32> {
    %0 = arith.addf %arg0, %arg0 : vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
  func.func @no_scalable_vectors(%arg0: vector<4xf32>) -> vector<4xf32> {
    %0 = arith.addf %arg0, %arg0 : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @contains_gather(%arg0: memref<?xf32>, %arg1: vector<[4]xindex>, %arg2: vector<[4]xi1>, %arg3: vector<[4]xf32>) -> vector<[4]xf32> {
    %c0 = arith.constant 0 : index
    %0 = vector.gather %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32>, vector<[4]xindex>, vector<[4]xi1>, vector<[4]xf32> into vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
  func.func @contains_scatter(%arg0: memref<?xf32>, %arg1: vector<[4]xindex>, %arg2: vector<[4]xi1>, %arg3: vector<[4]xf32>) {
    %c0 = arith.constant 0 : index
    vector.scatter %arg0[%c0] [%arg1], %arg2, %arg3 : memref<?xf32>, vector<[4]xindex>, vector<[4]xi1>, vector<[4]xf32>
    return
  }
}

