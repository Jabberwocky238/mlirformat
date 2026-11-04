module {
  func.func @arm_sme_load_tile_slice_hor_i8(%arg0: memref<?x?xi8>, %arg1: vector<[16]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[16]x[16]xi8>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 : memref<?x?xi8>, vector<[16]xi1>, vector<[16]x[16]xi8>
    "test.some_use"(%1) : (vector<[16]x[16]xi8>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_hor_i16(%arg0: memref<?x?xi16>, %arg1: vector<[8]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xi16>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 : memref<?x?xi16>, vector<[8]xi1>, vector<[8]x[8]xi16>
    "test.some_use"(%1) : (vector<[8]x[8]xi16>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_hor_i32(%arg0: memref<?x?xi32>, %arg1: vector<[4]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 : memref<?x?xi32>, vector<[4]xi1>, vector<[4]x[4]xi32>
    "test.some_use"(%1) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_hor_i64(%arg0: memref<?x?xi64>, %arg1: vector<[2]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 : memref<?x?xi64>, vector<[2]xi1>, vector<[2]x[2]xi64>
    "test.some_use"(%1) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_hor_i128(%arg0: memref<?x?xi128>, %arg1: vector<[1]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 : memref<?x?xi128>, vector<[1]xi1>, vector<[1]x[1]xi128>
    "test.some_use"(%1) : (vector<[1]x[1]xi128>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_hor_f16(%arg0: memref<?x?xf16>, %arg1: vector<[8]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xf16>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 : memref<?x?xf16>, vector<[8]xi1>, vector<[8]x[8]xf16>
    "test.some_use"(%1) : (vector<[8]x[8]xf16>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_hor_bf16(%arg0: memref<?x?xbf16>, %arg1: vector<[8]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xbf16>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 : memref<?x?xbf16>, vector<[8]xi1>, vector<[8]x[8]xbf16>
    "test.some_use"(%1) : (vector<[8]x[8]xbf16>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_hor_f32(%arg0: memref<?x?xf32>, %arg1: vector<[4]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 : memref<?x?xf32>, vector<[4]xi1>, vector<[4]x[4]xf32>
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_hor_f64(%arg0: memref<?x?xf64>, %arg1: vector<[2]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[2]x[2]xf64>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 : memref<?x?xf64>, vector<[2]xi1>, vector<[2]x[2]xf64>
    "test.some_use"(%1) : (vector<[2]x[2]xf64>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_ver_i8(%arg0: memref<?x?xi8>, %arg1: vector<[16]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[16]x[16]xi8>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 layout<vertical> : memref<?x?xi8>, vector<[16]xi1>, vector<[16]x[16]xi8>
    "test.some_use"(%1) : (vector<[16]x[16]xi8>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_ver_i16(%arg0: memref<?x?xi16>, %arg1: vector<[8]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xi16>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 layout<vertical> : memref<?x?xi16>, vector<[8]xi1>, vector<[8]x[8]xi16>
    "test.some_use"(%1) : (vector<[8]x[8]xi16>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_ver_i32(%arg0: memref<?x?xi32>, %arg1: vector<[4]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 layout<vertical> : memref<?x?xi32>, vector<[4]xi1>, vector<[4]x[4]xi32>
    "test.some_use"(%1) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_ver_i64(%arg0: memref<?x?xi64>, %arg1: vector<[2]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 layout<vertical> : memref<?x?xi64>, vector<[2]xi1>, vector<[2]x[2]xi64>
    "test.some_use"(%1) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_ver_i128(%arg0: memref<?x?xi128>, %arg1: vector<[1]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 layout<vertical> : memref<?x?xi128>, vector<[1]xi1>, vector<[1]x[1]xi128>
    "test.some_use"(%1) : (vector<[1]x[1]xi128>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_ver_f16(%arg0: memref<?x?xf16>, %arg1: vector<[8]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xf16>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 layout<vertical> : memref<?x?xf16>, vector<[8]xi1>, vector<[8]x[8]xf16>
    "test.some_use"(%1) : (vector<[8]x[8]xf16>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_ver_bf16(%arg0: memref<?x?xbf16>, %arg1: vector<[8]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xbf16>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 layout<vertical> : memref<?x?xbf16>, vector<[8]xi1>, vector<[8]x[8]xbf16>
    "test.some_use"(%1) : (vector<[8]x[8]xbf16>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_ver_f32(%arg0: memref<?x?xf32>, %arg1: vector<[4]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 layout<vertical> : memref<?x?xf32>, vector<[4]xi1>, vector<[4]x[4]xf32>
    "test.some_use"(%1) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_load_tile_slice_ver_f64(%arg0: memref<?x?xf64>, %arg1: vector<[2]xi1>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[2]x[2]xf64>
    %1 = arm_sme.load_tile_slice %arg0[%c0], %arg1, %0, %arg2 layout<vertical> : memref<?x?xf64>, vector<[2]xi1>, vector<[2]x[2]xf64>
    "test.some_use"(%1) : (vector<[2]x[2]xf64>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_hor_i8(%arg0: index, %arg1: vector<[16]xi1>, %arg2: memref<?x?xi8>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[16]x[16]xi8>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] : memref<?x?xi8>, vector<[16]xi1>, vector<[16]x[16]xi8>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_hor_i16(%arg0: index, %arg1: vector<[8]xi1>, %arg2: memref<?x?xi16>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xi16>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] : memref<?x?xi16>, vector<[8]xi1>, vector<[8]x[8]xi16>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_hor_i32(%arg0: index, %arg1: vector<[4]xi1>, %arg2: memref<?x?xi32>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[4]x[4]xi32>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] : memref<?x?xi32>, vector<[4]xi1>, vector<[4]x[4]xi32>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_hor_i64(%arg0: index, %arg1: vector<[2]xi1>, %arg2: memref<?x?xi64>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[2]x[2]xi64>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] : memref<?x?xi64>, vector<[2]xi1>, vector<[2]x[2]xi64>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_hor_i128(%arg0: index, %arg1: vector<[1]xi1>, %arg2: memref<?x?xi128>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[1]x[1]xi128>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] : memref<?x?xi128>, vector<[1]xi1>, vector<[1]x[1]xi128>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_hor_f16(%arg0: index, %arg1: vector<[8]xi1>, %arg2: memref<?x?xf16>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xf16>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] : memref<?x?xf16>, vector<[8]xi1>, vector<[8]x[8]xf16>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_hor_bf16(%arg0: index, %arg1: vector<[8]xi1>, %arg2: memref<?x?xbf16>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xbf16>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] : memref<?x?xbf16>, vector<[8]xi1>, vector<[8]x[8]xbf16>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_hor_f32(%arg0: index, %arg1: vector<[4]xi1>, %arg2: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] : memref<?x?xf32>, vector<[4]xi1>, vector<[4]x[4]xf32>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_hor_f64(%arg0: index, %arg1: vector<[2]xi1>, %arg2: memref<?x?xf64>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[2]x[2]xf64>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] : memref<?x?xf64>, vector<[2]xi1>, vector<[2]x[2]xf64>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_ver_i8(%arg0: index, %arg1: vector<[16]xi1>, %arg2: memref<?x?xi8>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[16]x[16]xi8>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] layout<vertical> : memref<?x?xi8>, vector<[16]xi1>, vector<[16]x[16]xi8>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_ver_i16(%arg0: index, %arg1: vector<[8]xi1>, %arg2: memref<?x?xi16>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xi16>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] layout<vertical> : memref<?x?xi16>, vector<[8]xi1>, vector<[8]x[8]xi16>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_ver_i32(%arg0: index, %arg1: vector<[4]xi1>, %arg2: memref<?x?xi32>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[4]x[4]xi32>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] layout<vertical> : memref<?x?xi32>, vector<[4]xi1>, vector<[4]x[4]xi32>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_ver_i64(%arg0: index, %arg1: vector<[2]xi1>, %arg2: memref<?x?xi64>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[2]x[2]xi64>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] layout<vertical> : memref<?x?xi64>, vector<[2]xi1>, vector<[2]x[2]xi64>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_ver_i128(%arg0: index, %arg1: vector<[1]xi1>, %arg2: memref<?x?xi128>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[1]x[1]xi128>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] layout<vertical> : memref<?x?xi128>, vector<[1]xi1>, vector<[1]x[1]xi128>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_ver_f16(%arg0: index, %arg1: vector<[8]xi1>, %arg2: memref<?x?xf16>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xf16>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] layout<vertical> : memref<?x?xf16>, vector<[8]xi1>, vector<[8]x[8]xf16>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_ver_bf16(%arg0: index, %arg1: vector<[8]xi1>, %arg2: memref<?x?xbf16>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xbf16>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] layout<vertical> : memref<?x?xbf16>, vector<[8]xi1>, vector<[8]x[8]xbf16>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_ver_f32(%arg0: index, %arg1: vector<[4]xi1>, %arg2: memref<?x?xf32>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] layout<vertical> : memref<?x?xf32>, vector<[4]xi1>, vector<[4]x[4]xf32>
    return
  }
}

// -----
module {
  func.func @arm_sme_store_tile_slice_ver_f64(%arg0: index, %arg1: vector<[2]xi1>, %arg2: memref<?x?xf64>) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[2]x[2]xf64>
    arm_sme.store_tile_slice %0, %arg0, %arg1, %arg2[%c0] layout<vertical> : memref<?x?xf64>, vector<[2]xi1>, vector<[2]x[2]xf64>
    return
  }
}

// -----
module {
  func.func @arm_sme_insert_tile_slice_hor_i32(%arg0: vector<[4]xi32>, %arg1: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %1 = arm_sme.insert_tile_slice %arg0, %0[%arg1] : vector<[4]xi32> into vector<[4]x[4]xi32>
    "test.some_use"(%1) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_insert_tile_slice_ver_bf16(%arg0: vector<[8]xbf16>, %arg1: index) {
    %c0 = arith.constant 0 : index
    %0 = arm_sme.get_tile : vector<[8]x[8]xbf16>
    %1 = arm_sme.insert_tile_slice %arg0, %0[%arg1] layout<vertical> : vector<[8]xbf16> into vector<[8]x[8]xbf16>
    "test.some_use"(%1) : (vector<[8]x[8]xbf16>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_extract_tile_slice_i8(%arg0: index) -> vector<[16]xi8> {
    %0 = arm_sme.get_tile : vector<[16]x[16]xi8>
    %1 = arm_sme.extract_tile_slice %0[%arg0] : vector<[16]xi8> from vector<[16]x[16]xi8>
    return %1 : vector<[16]xi8>
  }
}

// -----
module {
  func.func @arm_sme_extract_tile_slice_i16(%arg0: index) -> vector<[8]xi16> {
    %0 = arm_sme.get_tile : vector<[8]x[8]xi16>
    %1 = arm_sme.extract_tile_slice %0[%arg0] : vector<[8]xi16> from vector<[8]x[8]xi16>
    return %1 : vector<[8]xi16>
  }
}

// -----
module {
  func.func @arm_sme_extract_tile_slice_i32(%arg0: index) -> vector<[4]xi32> {
    %0 = arm_sme.get_tile : vector<[4]x[4]xi32>
    %1 = arm_sme.extract_tile_slice %0[%arg0] : vector<[4]xi32> from vector<[4]x[4]xi32>
    return %1 : vector<[4]xi32>
  }
}

// -----
module {
  func.func @arm_sme_extract_tile_slice_i64(%arg0: index) -> vector<[2]xi64> {
    %0 = arm_sme.get_tile : vector<[2]x[2]xi64>
    %1 = arm_sme.extract_tile_slice %0[%arg0] : vector<[2]xi64> from vector<[2]x[2]xi64>
    return %1 : vector<[2]xi64>
  }
}

// -----
module {
  func.func @arm_sme_extract_tile_slice_i128(%arg0: index) -> vector<[1]xi128> {
    %0 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %1 = arm_sme.extract_tile_slice %0[%arg0] : vector<[1]xi128> from vector<[1]x[1]xi128>
    return %1 : vector<[1]xi128>
  }
}

// -----
module {
  func.func @arm_sme_extract_tile_slice_f16(%arg0: index) -> vector<[8]xf16> {
    %0 = arm_sme.get_tile : vector<[8]x[8]xf16>
    %1 = arm_sme.extract_tile_slice %0[%arg0] : vector<[8]xf16> from vector<[8]x[8]xf16>
    return %1 : vector<[8]xf16>
  }
}

// -----
module {
  func.func @arm_sme_extract_tile_slice_bf16(%arg0: index) -> vector<[8]xbf16> {
    %0 = arm_sme.get_tile : vector<[8]x[8]xbf16>
    %1 = arm_sme.extract_tile_slice %0[%arg0] : vector<[8]xbf16> from vector<[8]x[8]xbf16>
    return %1 : vector<[8]xbf16>
  }
}

// -----
module {
  func.func @arm_sme_extract_tile_slice_f32(%arg0: index) -> vector<[4]xf32> {
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %1 = arm_sme.extract_tile_slice %0[%arg0] : vector<[4]xf32> from vector<[4]x[4]xf32>
    return %1 : vector<[4]xf32>
  }
}

// -----
module {
  func.func @arm_sme_extract_tile_slice_f64(%arg0: index) -> vector<[2]xf64> {
    %0 = arm_sme.get_tile : vector<[2]x[2]xf64>
    %1 = arm_sme.extract_tile_slice %0[%arg0] : vector<[2]xf64> from vector<[2]x[2]xf64>
    return %1 : vector<[2]xf64>
  }
}

// -----
module {
  func.func @arm_sme_extract_tile_slice_ver_i128(%arg0: index) -> vector<[1]xi128> {
    %0 = arm_sme.get_tile : vector<[1]x[1]xi128>
    %1 = arm_sme.extract_tile_slice %0[%arg0] layout<vertical> : vector<[1]xi128> from vector<[1]x[1]xi128>
    return %1 : vector<[1]xi128>
  }
}

// -----
module {
  func.func @arm_sme_streaming_vl_bytes() -> index {
    %0 = arm_sme.streaming_vl <byte>
    return %0 : index
  }
}

// -----
module {
  func.func @arm_sme_streaming_vl_half_words() -> index {
    %0 = arm_sme.streaming_vl <half>
    return %0 : index
  }
}

// -----
module {
  func.func @arm_sme_streaming_vl_words() -> index {
    %0 = arm_sme.streaming_vl <word>
    return %0 : index
  }
}

// -----
module {
  func.func @arm_sme_streaming_vl_double_words() -> index {
    %0 = arm_sme.streaming_vl <double>
    return %0 : index
  }
}

// -----
module {
  func.func @arm_sme_fmopa_2way_f16f16_to_f32(%arg0: vector<[8]xf16>, %arg1: vector<[8]xf16>) {
    %0 = arm_sme.fmopa_2way %arg0, %arg1 : vector<[8]xf16>, vector<[8]xf16> into vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
  }
}

// -----
module {
  func.func @arm_sme_fmopa_2way_bf16bf16_to_f32(%arg0: vector<[8]xbf16>, %arg1: vector<[8]xbf16>) {
    %0 = arm_sme.fmopa_2way %arg0, %arg1 : vector<[8]xbf16>, vector<[8]xbf16> into vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
  }
}

// -----
module {
  func.func @arm_sme_fmops_2way_f16f16_to_f32(%arg0: vector<[8]xf16>, %arg1: vector<[8]xf16>) {
    %0 = arm_sme.fmops_2way %arg0, %arg1 : vector<[8]xf16>, vector<[8]xf16> into vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
  }
}

// -----
module {
  func.func @arm_sme_fmops_2way_bf16bf16_to_f32(%arg0: vector<[8]xbf16>, %arg1: vector<[8]xbf16>) {
    %0 = arm_sme.fmops_2way %arg0, %arg1 : vector<[8]xbf16>, vector<[8]xbf16> into vector<[4]x[4]xf32>
    "test.some_use"(%0) : (vector<[4]x[4]xf32>) -> ()
  }
}

// -----
module {
  func.func @arm_sme_smopa_2way_i16i16_to_i32(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>) {
    %0 = arm_sme.smopa_2way %arg0, %arg1 : vector<[8]xi16>, vector<[8]xi16> into vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
  }
}

// -----
module {
  func.func @arm_sme_smops_2way_i16i16_to_i32(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>) {
    %0 = arm_sme.smops_2way %arg0, %arg1 : vector<[8]xi16>, vector<[8]xi16> into vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
  }
}

// -----
module {
  func.func @arm_sme_umopa_2way_i16i16_to_i32(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>) {
    %0 = arm_sme.umopa_2way %arg0, %arg1 : vector<[8]xi16>, vector<[8]xi16> into vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_umops_2way_i16i16_to_i32(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>) {
    %0 = arm_sme.umops_2way %arg0, %arg1 : vector<[8]xi16>, vector<[8]xi16> into vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_smopa_4way_i8i8_to_i32(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>) {
    %0 = arm_sme.smopa_4way %arg0, %arg1 : vector<[16]xi8>, vector<[16]xi8> into vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_smopa_4way_i16i16_to_i64(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>) {
    %0 = arm_sme.smopa_4way %arg0, %arg1 : vector<[8]xi16>, vector<[8]xi16> into vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_smops_4way_i8i8_to_i32(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>) {
    %0 = arm_sme.smops_4way %arg0, %arg1 : vector<[16]xi8>, vector<[16]xi8> into vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_smops_4way_i16i16_to_i64(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>) {
    %0 = arm_sme.smops_4way %arg0, %arg1 : vector<[8]xi16>, vector<[8]xi16> into vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_umopa_4way_i8i8_to_i32(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>) {
    %0 = arm_sme.umopa_4way %arg0, %arg1 : vector<[16]xi8>, vector<[16]xi8> into vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_umopa_4way_i16i16_to_i64(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>) {
    %0 = arm_sme.umopa_4way %arg0, %arg1 : vector<[8]xi16>, vector<[8]xi16> into vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_umops_4way_i8i8_to_i32(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>) {
    %0 = arm_sme.umops_4way %arg0, %arg1 : vector<[16]xi8>, vector<[16]xi8> into vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_umops_4way_i16i16_to_i64(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>) {
    %0 = arm_sme.umops_4way %arg0, %arg1 : vector<[8]xi16>, vector<[8]xi16> into vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_sumopa_4way_i8i8_to_i32(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>) {
    %0 = arm_sme.sumopa_4way %arg0, %arg1 : vector<[16]xi8>, vector<[16]xi8> into vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_sumopa_4way_i16i16_to_i64(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>) {
    %0 = arm_sme.sumopa_4way %arg0, %arg1 : vector<[8]xi16>, vector<[8]xi16> into vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_sumops_4way_i8i8_to_i32(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>) {
    %0 = arm_sme.sumops_4way %arg0, %arg1 : vector<[16]xi8>, vector<[16]xi8> into vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_sumops_4way_i16i16_to_i64(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>) {
    %0 = arm_sme.sumops_4way %arg0, %arg1 : vector<[8]xi16>, vector<[8]xi16> into vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_usmopa_4way_i8i8_to_i32(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>) {
    %0 = arm_sme.usmopa_4way %arg0, %arg1 : vector<[16]xi8>, vector<[16]xi8> into vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_usmopa_4way_i16i16_to_i64(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>) {
    %0 = arm_sme.usmopa_4way %arg0, %arg1 : vector<[8]xi16>, vector<[8]xi16> into vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_usmops_4way_i8i8_to_i32(%arg0: vector<[16]xi8>, %arg1: vector<[16]xi8>) {
    %0 = arm_sme.usmops_4way %arg0, %arg1 : vector<[16]xi8>, vector<[16]xi8> into vector<[4]x[4]xi32>
    "test.some_use"(%0) : (vector<[4]x[4]xi32>) -> ()
    return
  }
}

// -----
module {
  func.func @arm_sme_usmops_4way_i16i16_to_i64(%arg0: vector<[8]xi16>, %arg1: vector<[8]xi16>) {
    %0 = arm_sme.usmops_4way %arg0, %arg1 : vector<[8]xi16>, vector<[8]xi16> into vector<[2]x[2]xi64>
    "test.some_use"(%0) : (vector<[2]x[2]xi64>) -> ()
    return
  }
}

// -----
module {
  func.func @ops_on_tiles_legal_post_conversion(%arg0: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = arm_sme.get_tile : vector<[4]x[4]xf32>
    %1 = arm_sme.copy_tile %0 : vector<[4]x[4]xf32>
    cf.br ^bb1(%1 : vector<[4]x[4]xf32>)
  ^bb1(%2: vector<[4]x[4]xf32>):  // pred: ^bb0
    "test.some_use"(%2) : (vector<[4]x[4]xf32>) -> ()
    return
  }
}

