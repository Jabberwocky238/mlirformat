module {
  func.func @ipowi32_fold(%arg0: memref<?xi32>) {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %0 = math.ipowi %c0_i32, %c0_i32_0 : i32
    %c0 = arith.constant 0 : index
    memref.store %0, %arg0[%c0] : memref<?xi32>
    %c10_i32 = arith.constant 10 : i32
    %c0_i32_1 = arith.constant 0 : i32
    %1 = math.ipowi %c10_i32, %c0_i32_1 : i32
    %c1 = arith.constant 1 : index
    memref.store %1, %arg0[%c1] : memref<?xi32>
    %c-10_i32 = arith.constant -10 : i32
    %c0_i32_2 = arith.constant 0 : i32
    %2 = math.ipowi %c-10_i32, %c0_i32_2 : i32
    %c2 = arith.constant 2 : index
    memref.store %2, %arg0[%c2] : memref<?xi32>
    %c0_i32_3 = arith.constant 0 : i32
    %c-1_i32 = arith.constant -1 : i32
    %3 = math.ipowi %c0_i32_3, %c-1_i32 : i32
    %c3 = arith.constant 3 : index
    memref.store %3, %arg0[%c3] : memref<?xi32>
    %c1_i32 = arith.constant 1 : i32
    %c-10_i32_4 = arith.constant -10 : i32
    %4 = math.ipowi %c1_i32, %c-10_i32_4 : i32
    %c4 = arith.constant 4 : index
    memref.store %4, %arg0[%c4] : memref<?xi32>
    %c2_i32 = arith.constant 2 : i32
    %c-1_i32_5 = arith.constant -1 : i32
    %5 = math.ipowi %c2_i32, %c-1_i32_5 : i32
    %c5 = arith.constant 5 : index
    memref.store %5, %arg0[%c5] : memref<?xi32>
    %c-2_i32 = arith.constant -2 : i32
    %c-1_i32_6 = arith.constant -1 : i32
    %6 = math.ipowi %c-2_i32, %c-1_i32_6 : i32
    %c6 = arith.constant 6 : index
    memref.store %6, %arg0[%c6] : memref<?xi32>
    %c-1_i32_7 = arith.constant -1 : i32
    %c-10_i32_8 = arith.constant -10 : i32
    %7 = math.ipowi %c-1_i32_7, %c-10_i32_8 : i32
    %c7 = arith.constant 7 : index
    memref.store %7, %arg0[%c7] : memref<?xi32>
    %c-1_i32_9 = arith.constant -1 : i32
    %c-11_i32 = arith.constant -11 : i32
    %8 = math.ipowi %c-1_i32_9, %c-11_i32 : i32
    %c8 = arith.constant 8 : index
    memref.store %8, %arg0[%c8] : memref<?xi32>
    %c-3_i32 = arith.constant -3 : i32
    %c3_i32 = arith.constant 3 : i32
    %9 = math.ipowi %c-3_i32, %c3_i32 : i32
    %c9 = arith.constant 9 : index
    memref.store %9, %arg0[%c9] : memref<?xi32>
    %c2_i32_10 = arith.constant 2 : i32
    %c30_i32 = arith.constant 30 : i32
    %10 = math.ipowi %c2_i32_10, %c30_i32 : i32
    %c10 = arith.constant 10 : index
    memref.store %10, %arg0[%c10] : memref<?xi32>
    %c2_i32_11 = arith.constant 2 : i32
    %11 = vector.broadcast %c2_i32_11 : i32 to vector<2x2xi32>
    %c30_i32_12 = arith.constant 30 : i32
    %12 = vector.broadcast %c30_i32_12 : i32 to vector<2x2xi32>
    %13 = math.ipowi %11, %12 : vector<2x2xi32>
    %c11 = arith.constant 11 : index
    %14 = vector.extract %13[1, 1] : i32 from vector<2x2xi32>
    memref.store %14, %arg0[%c11] : memref<?xi32>
    return
  }
  func.func @ipowi64_fold(%arg0: memref<?xi64>) {
    %c0_i64 = arith.constant 0 : i64
    %c0_i64_0 = arith.constant 0 : i64
    %0 = math.ipowi %c0_i64, %c0_i64_0 : i64
    %c0 = arith.constant 0 : index
    memref.store %0, %arg0[%c0] : memref<?xi64>
    %c10_i64 = arith.constant 10 : i64
    %c0_i64_1 = arith.constant 0 : i64
    %1 = math.ipowi %c10_i64, %c0_i64_1 : i64
    %c1 = arith.constant 1 : index
    memref.store %1, %arg0[%c1] : memref<?xi64>
    %c-10_i64 = arith.constant -10 : i64
    %c0_i64_2 = arith.constant 0 : i64
    %2 = math.ipowi %c-10_i64, %c0_i64_2 : i64
    %c2 = arith.constant 2 : index
    memref.store %2, %arg0[%c2] : memref<?xi64>
    %c0_i64_3 = arith.constant 0 : i64
    %c-1_i64 = arith.constant -1 : i64
    %3 = math.ipowi %c0_i64_3, %c-1_i64 : i64
    %c3 = arith.constant 3 : index
    memref.store %3, %arg0[%c3] : memref<?xi64>
    %c1_i64 = arith.constant 1 : i64
    %c-10_i64_4 = arith.constant -10 : i64
    %4 = math.ipowi %c1_i64, %c-10_i64_4 : i64
    %c4 = arith.constant 4 : index
    memref.store %4, %arg0[%c4] : memref<?xi64>
    %c2_i64 = arith.constant 2 : i64
    %c-1_i64_5 = arith.constant -1 : i64
    %5 = math.ipowi %c2_i64, %c-1_i64_5 : i64
    %c5 = arith.constant 5 : index
    memref.store %5, %arg0[%c5] : memref<?xi64>
    %c-2_i64 = arith.constant -2 : i64
    %c-1_i64_6 = arith.constant -1 : i64
    %6 = math.ipowi %c-2_i64, %c-1_i64_6 : i64
    %c6 = arith.constant 6 : index
    memref.store %6, %arg0[%c6] : memref<?xi64>
    %c-1_i64_7 = arith.constant -1 : i64
    %c-10_i64_8 = arith.constant -10 : i64
    %7 = math.ipowi %c-1_i64_7, %c-10_i64_8 : i64
    %c7 = arith.constant 7 : index
    memref.store %7, %arg0[%c7] : memref<?xi64>
    %c-1_i64_9 = arith.constant -1 : i64
    %c-11_i64 = arith.constant -11 : i64
    %8 = math.ipowi %c-1_i64_9, %c-11_i64 : i64
    %c8 = arith.constant 8 : index
    memref.store %8, %arg0[%c8] : memref<?xi64>
    %c-3_i64 = arith.constant -3 : i64
    %c3_i64 = arith.constant 3 : i64
    %9 = math.ipowi %c-3_i64, %c3_i64 : i64
    %c9 = arith.constant 9 : index
    memref.store %9, %arg0[%c9] : memref<?xi64>
    %c2_i64_10 = arith.constant 2 : i64
    %c30_i64 = arith.constant 30 : i64
    %10 = math.ipowi %c2_i64_10, %c30_i64 : i64
    %c10 = arith.constant 10 : index
    memref.store %10, %arg0[%c10] : memref<?xi64>
    %c2_i64_11 = arith.constant 2 : i64
    %c48_i64 = arith.constant 48 : i64
    %11 = math.ipowi %c2_i64_11, %c48_i64 : i64
    %c11 = arith.constant 11 : index
    memref.store %11, %arg0[%c11] : memref<?xi64>
    return
  }
  func.func @ipowi16_fold(%arg0: memref<?xi16>) {
    %c0_i16 = arith.constant 0 : i16
    %c0_i16_0 = arith.constant 0 : i16
    %0 = math.ipowi %c0_i16, %c0_i16_0 : i16
    %c0 = arith.constant 0 : index
    memref.store %0, %arg0[%c0] : memref<?xi16>
    %c10_i16 = arith.constant 10 : i16
    %c0_i16_1 = arith.constant 0 : i16
    %1 = math.ipowi %c10_i16, %c0_i16_1 : i16
    %c1 = arith.constant 1 : index
    memref.store %1, %arg0[%c1] : memref<?xi16>
    %c-10_i16 = arith.constant -10 : i16
    %c0_i16_2 = arith.constant 0 : i16
    %2 = math.ipowi %c-10_i16, %c0_i16_2 : i16
    %c2 = arith.constant 2 : index
    memref.store %2, %arg0[%c2] : memref<?xi16>
    %c0_i16_3 = arith.constant 0 : i16
    %c-1_i16 = arith.constant -1 : i16
    %3 = math.ipowi %c0_i16_3, %c-1_i16 : i16
    %c3 = arith.constant 3 : index
    memref.store %3, %arg0[%c3] : memref<?xi16>
    %c1_i16 = arith.constant 1 : i16
    %c-10_i16_4 = arith.constant -10 : i16
    %4 = math.ipowi %c1_i16, %c-10_i16_4 : i16
    %c4 = arith.constant 4 : index
    memref.store %4, %arg0[%c4] : memref<?xi16>
    %c2_i16 = arith.constant 2 : i16
    %c-1_i16_5 = arith.constant -1 : i16
    %5 = math.ipowi %c2_i16, %c-1_i16_5 : i16
    %c5 = arith.constant 5 : index
    memref.store %5, %arg0[%c5] : memref<?xi16>
    %c-2_i16 = arith.constant -2 : i16
    %c-1_i16_6 = arith.constant -1 : i16
    %6 = math.ipowi %c-2_i16, %c-1_i16_6 : i16
    %c6 = arith.constant 6 : index
    memref.store %6, %arg0[%c6] : memref<?xi16>
    %c-1_i16_7 = arith.constant -1 : i16
    %c-10_i16_8 = arith.constant -10 : i16
    %7 = math.ipowi %c-1_i16_7, %c-10_i16_8 : i16
    %c7 = arith.constant 7 : index
    memref.store %7, %arg0[%c7] : memref<?xi16>
    %c-1_i16_9 = arith.constant -1 : i16
    %c-11_i16 = arith.constant -11 : i16
    %8 = math.ipowi %c-1_i16_9, %c-11_i16 : i16
    %c8 = arith.constant 8 : index
    memref.store %8, %arg0[%c8] : memref<?xi16>
    %c-3_i16 = arith.constant -3 : i16
    %c3_i16 = arith.constant 3 : i16
    %9 = math.ipowi %c-3_i16, %c3_i16 : i16
    %c9 = arith.constant 9 : index
    memref.store %9, %arg0[%c9] : memref<?xi16>
    %c2_i16_10 = arith.constant 2 : i16
    %c14_i16 = arith.constant 14 : i16
    %10 = math.ipowi %c2_i16_10, %c14_i16 : i16
    %c10 = arith.constant 10 : index
    memref.store %10, %arg0[%c10] : memref<?xi16>
    return
  }
  func.func @ipowi8_fold(%arg0: memref<?xi8>) {
    %c0_i8 = arith.constant 0 : i8
    %c0_i8_0 = arith.constant 0 : i8
    %0 = math.ipowi %c0_i8, %c0_i8_0 : i8
    %c0 = arith.constant 0 : index
    memref.store %0, %arg0[%c0] : memref<?xi8>
    %c10_i8 = arith.constant 10 : i8
    %c0_i8_1 = arith.constant 0 : i8
    %1 = math.ipowi %c10_i8, %c0_i8_1 : i8
    %c1 = arith.constant 1 : index
    memref.store %1, %arg0[%c1] : memref<?xi8>
    %c-10_i8 = arith.constant -10 : i8
    %c0_i8_2 = arith.constant 0 : i8
    %2 = math.ipowi %c-10_i8, %c0_i8_2 : i8
    %c2 = arith.constant 2 : index
    memref.store %2, %arg0[%c2] : memref<?xi8>
    %c0_i8_3 = arith.constant 0 : i8
    %c-1_i8 = arith.constant -1 : i8
    %3 = math.ipowi %c0_i8_3, %c-1_i8 : i8
    %c3 = arith.constant 3 : index
    memref.store %3, %arg0[%c3] : memref<?xi8>
    %c1_i8 = arith.constant 1 : i8
    %c-10_i8_4 = arith.constant -10 : i8
    %4 = math.ipowi %c1_i8, %c-10_i8_4 : i8
    %c4 = arith.constant 4 : index
    memref.store %4, %arg0[%c4] : memref<?xi8>
    %c2_i8 = arith.constant 2 : i8
    %c-1_i8_5 = arith.constant -1 : i8
    %5 = math.ipowi %c2_i8, %c-1_i8_5 : i8
    %c5 = arith.constant 5 : index
    memref.store %5, %arg0[%c5] : memref<?xi8>
    %c-2_i8 = arith.constant -2 : i8
    %c-1_i8_6 = arith.constant -1 : i8
    %6 = math.ipowi %c-2_i8, %c-1_i8_6 : i8
    %c6 = arith.constant 6 : index
    memref.store %6, %arg0[%c6] : memref<?xi8>
    %c-1_i8_7 = arith.constant -1 : i8
    %c-10_i8_8 = arith.constant -10 : i8
    %7 = math.ipowi %c-1_i8_7, %c-10_i8_8 : i8
    %c7 = arith.constant 7 : index
    memref.store %7, %arg0[%c7] : memref<?xi8>
    %c-1_i8_9 = arith.constant -1 : i8
    %c-11_i8 = arith.constant -11 : i8
    %8 = math.ipowi %c-1_i8_9, %c-11_i8 : i8
    %c8 = arith.constant 8 : index
    memref.store %8, %arg0[%c8] : memref<?xi8>
    %c-3_i8 = arith.constant -3 : i8
    %c3_i8 = arith.constant 3 : i8
    %9 = math.ipowi %c-3_i8, %c3_i8 : i8
    %c9 = arith.constant 9 : index
    memref.store %9, %arg0[%c9] : memref<?xi8>
    %c2_i8_10 = arith.constant 2 : i8
    %c6_i8 = arith.constant 6 : i8
    %10 = math.ipowi %c2_i8_10, %c6_i8 : i8
    %c10 = arith.constant 10 : index
    memref.store %10, %arg0[%c10] : memref<?xi8>
    return
  }
}

