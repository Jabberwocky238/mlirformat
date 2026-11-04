module {
  func.func @transfer_read_scalable_non_trailing(%arg0: memref<?x8xi8>) attributes {no_inline} {
    %c0 = arith.constant 0 : index
    %c0_i8 = arith.constant 0 : i8
    %0 = vector.transfer_read %arg0[%c0, %c0], %c0_i8 {in_bounds = [true, true]} : memref<?x8xi8>, vector<[4]x8xi8>
    %1 = vector.shape_cast %0 : vector<[4]x8xi8> to vector<[32]xi8>
    call @printVec(%1) : (vector<[32]xi8>) -> ()
    return
  }
  func.func @main() {
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<[[11, 12, 13, 14, 15, 16, 17, 18], [21, 22, 23, 24, 25, 26, 27, 28], [31, 32, 33, 34, 35, 36, 37, 38], [41, 42, 43, 44, 45, 46, 47, 48], [51, 52, 53, 54, 55, 56, 57, 58], [61, 62, 63, 64, 65, 66, 67, 68], [71, 72, 73, 74, 75, 76, 77, 78], [81, 82, 83, 84, 85, 86, 87, 88]]> : vector<8x8xi8>
    %alloca = memref.alloca() : memref<8x8xi8>
    vector.transfer_write %cst, %alloca[%c0, %c0] : vector<8x8xi8>, memref<8x8xi8>
    %cast = memref.cast %alloca : memref<8x8xi8> to memref<?x8xi8>
    vector.print str "Result(VL128):\0A"
    %c128_i32 = arith.constant 128 : i32
    call @setArmVLBits(%c128_i32) : (i32) -> ()
    call @transfer_read_scalable_non_trailing(%cast) : (memref<?x8xi8>) -> ()
    vector.print str "Result(VL256):\0A"
    %c256_i32 = arith.constant 256 : i32
    call @setArmVLBits(%c256_i32) : (i32) -> ()
    call @transfer_read_scalable_non_trailing(%cast) : (memref<?x8xi8>) -> ()
    return
  }
  func.func private @printVec(%arg0: vector<[32]xi8>) {
    %0 = vector.scalable.extract %arg0[0] : vector<[16]xi8> from vector<[32]xi8>
    %1 = vector.scalable.extract %arg0[16] : vector<[16]xi8> from vector<[32]xi8>
    vector.print %0 : vector<[16]xi8>
    vector.print %1 : vector<[16]xi8>
    return
  }
  func.func private @setArmVLBits(i32)
}

