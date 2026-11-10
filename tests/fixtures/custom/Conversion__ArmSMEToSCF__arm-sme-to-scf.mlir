module {
  func.func @arm_sme_tile_load_hor(%arg0: memref<?x?xi32>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.tile_load %arg0[%c0, %c0] : memref<?x?xi32>, vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_tile_load_ver(%arg0: memref<?x?xi32>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.tile_load %arg0[%c0, %c0] layout<vertical> : memref<?x?xi32>, vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_tile_load_hor_with_mask_and_pad_zero(%arg0: memref<?x?xi32>) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c0_i32 = arith.constant 0 : i32
    %0 = vector.create_mask %c3, %c2 : vector<[4]x[4]xi1>
    %1 = arm_sme.tile_load %arg0[%c0, %c0], %c0_i32, %0 : memref<?x?xi32>, vector<[4]x[4]xi32>
    "test.some_use"(%1) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_tile_load_hor_with_mask_and_nonzero_pad(%arg0: memref<?x?xi32>, %arg1: i32) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %0 = vector.create_mask %c3, %c2 : vector<[4]x[4]xi1>
    %1 = arm_sme.tile_load %arg0[%c0, %c0], %arg1, %0 : memref<?x?xi32>, vector<[4]x[4]xi32>
    "test.some_use"(%1) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_tile_store_hor(%arg0: vector<[4]x[4]xi32>, %arg1: memref<?x?xi32>) {
    %c0 = arith.constant 0 : index
    arm_sme.tile_store %arg0, %arg1[%c0, %c0] : memref<?x?xi32>, vector<[4]x[4]xi32>
    return
  }
}

// -----
module {
  func.func @arm_sme_tile_store_ver(%arg0: vector<[4]x[4]xi32>, %arg1: memref<?x?xi32>) {
    %c0 = arith.constant 0 : index
    arm_sme.tile_store %arg0, %arg1[%c0, %c0] layout<vertical> : memref<?x?xi32>, vector<[4]x[4]xi32>
    return
  }
}

// -----
module {
  func.func @arm_sme_tile_store_hor_with_mask(%arg0: vector<[4]x[4]xi32>, %arg1: memref<?x?xi32>) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %0 = vector.create_mask %c3, %c2 : vector<[4]x[4]xi1>
    arm_sme.tile_store %arg0, %arg1[%c0, %c0], %0 : memref<?x?xi32>, vector<[4]x[4]xi32>
    return
  }
}

