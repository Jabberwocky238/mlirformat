module {
  func.func @selecting_between_different_tiles_is_unsupported(%arg0: memref<?x?xi32>, %arg1: vector<[4]x[4]xi32>, %arg2: vector<[4]x[4]xi32>, %arg3: i1) {
    %c0 = arith.constant 0 : index
    %0 = scf.if %arg3 -> (vector<[4]x[4]xi32>) {
      scf.yield %arg1 : vector<[4]x[4]xi32>
    } else {
      scf.yield %arg2 : vector<[4]x[4]xi32>
    }
    arm_sme.tile_store %0, %arg0[%c0, %c0] : memref<?x?xi32>, vector<[4]x[4]xi32>
    return
  }
}

