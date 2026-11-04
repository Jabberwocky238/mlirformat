module {
  func.func @known_oob_load(%arg0: memref<4xf32>) -> f32 {
    %c4_i32 = arith.constant 4 : i32
    %0 = amdgpu.raw_buffer_load %arg0[%c4_i32] : memref<4xf32>, i32 -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @known_oob_load_2d(%arg0: memref<4x4xf32>) -> f32 {
    %c0_i32 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %0 = amdgpu.raw_buffer_load %arg0[%c4_i32, %c0_i32] : memref<4x4xf32>, i32, i32 -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @known_oob_load_2d_on_last(%arg0: memref<4x4xf32>) -> f32 {
    %c0_i32 = arith.constant 0 : i32
    %c16_i32 = arith.constant 16 : i32
    %0 = amdgpu.raw_buffer_load %arg0[%c0_i32, %c16_i32] : memref<4x4xf32>, i32, i32 -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @known_oob_load_index(%arg0: memref<4xf32>) -> f32 {
    %c0_i32 = arith.constant 0 : i32
    %0 = amdgpu.raw_buffer_load {indexOffset = 4 : i32} %arg0[%c0_i32] : memref<4xf32>, i32 -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @known_oob_load_sgproffset(%arg0: memref<4xf32>) -> f32 {
    %c2_i32 = arith.constant 2 : i32
    %0 = amdgpu.raw_buffer_load %arg0[%c2_i32] sgprOffset %c2_i32 : memref<4xf32>, i32 -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @unknown_load(%arg0: memref<4xf32>, %arg1: i32) -> f32 {
    %c4_i32 = arith.constant 4 : i32
    %0 = amdgpu.raw_buffer_load %arg0[%arg1] sgprOffset %c4_i32 : memref<4xf32>, i32 -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @unknown_load_sgproffset(%arg0: memref<4xf32>, %arg1: i32) -> f32 {
    %c4_i32 = arith.constant 4 : i32
    %0 = amdgpu.raw_buffer_load %arg0[%c4_i32] sgprOffset %arg1 : memref<4xf32>, i32 -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @unranked(%arg0: memref<?xf32>) -> f32 {
    %c4_i32 = arith.constant 4 : i32
    %0 = amdgpu.raw_buffer_load %arg0[%c4_i32] : memref<?xf32>, i32 -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @no_oob_check(%arg0: memref<4xf32>) -> f32 {
    %c4_i32 = arith.constant 4 : i32
    %0 = amdgpu.raw_buffer_load {boundsCheck = false} %arg0[%c4_i32] : memref<4xf32>, i32 -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @in_bounds_overall(%arg0: memref<4x4xf32>) -> f32 {
    %c0_i32 = arith.constant 0 : i32
    %c15_i32 = arith.constant 15 : i32
    %0 = amdgpu.raw_buffer_load %arg0[%c0_i32, %c15_i32] : memref<4x4xf32>, i32, i32 -> f32
    return %0 : f32
  }
}

// -----
module {
  func.func @dead_store(%arg0: memref<4xf32>, %arg1: f32) {
    %c4_i32 = arith.constant 4 : i32
    amdgpu.raw_buffer_store %arg1 -> %arg0[%c4_i32] : f32 -> memref<4xf32>, i32
    return
  }
}

// -----
module {
  func.func @dead_atomic_add(%arg0: memref<4xf32>, %arg1: f32) {
    %c4_i32 = arith.constant 4 : i32
    amdgpu.raw_buffer_atomic_fadd %arg1 -> %arg0[%c4_i32] : f32 -> memref<4xf32>, i32
    return
  }
}

// -----
module {
  func.func @fold_gather_to_lds_of_cast(%arg0: memref<128x72xf32, 1>, %arg1: memref<64x64xf32, 3>) {
    %c0 = arith.constant 0 : index
    %cast = memref.cast %arg0 : memref<128x72xf32, 1> to memref<?x?xf32, 1>
    amdgpu.gather_to_lds %cast[%c0, %c0], %arg1[%c0, %c0] : f32, memref<?x?xf32, 1>, memref<64x64xf32, 3>
    return
  }
}

// -----
module {
  func.func @fold_gather_to_lds_of_cast_dest(%arg0: memref<128x72xf32, 1>, %arg1: memref<64x64xf32, 3>) {
    %c0 = arith.constant 0 : index
    %cast = memref.cast %arg1 : memref<64x64xf32, 3> to memref<?x?xf32, 3>
    amdgpu.gather_to_lds %arg0[%c0, %c0], %cast[%c0, %c0] : f32, memref<128x72xf32, 1>, memref<?x?xf32, 3>
    return
  }
}

// -----
module {
  func.func @scaled_mfma(%arg0: vector<32xf4E2M1FN>, %arg1: vector<32xf4E2M1FN>, %arg2: vector<2x1x8x1xf8E8M0FNU>, %arg3: vector<2x1x8x1xf8E8M0FNU>) -> (vector<4xf32>, vector<4xf32>) {
    %cst = arith.constant dense<0.000000e+00> : vector<4xf32>
    %cst_0 = arith.constant dense<5.877470e-39> : vector<4xf8E8M0FNU>
    %0 = vector.extract %arg2[0, 0, 3, 0] : f8E8M0FNU from vector<2x1x8x1xf8E8M0FNU>
    %1 = vector.insert %0, %cst_0 [0] : f8E8M0FNU into vector<4xf8E8M0FNU>
    %2 = vector.extract %arg3[0, 0, 6, 0] : f8E8M0FNU from vector<2x1x8x1xf8E8M0FNU>
    %3 = vector.insert %2, %cst_0 [0] : f8E8M0FNU into vector<4xf8E8M0FNU>
    %4 = amdgpu.scaled_mfma 16x16x128 (%1[0] * %arg0) * (%3[0] * %arg1) + %cst : vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, vector<4xf32>
    %5 = vector.extract %arg2[1, 0, 1, 0] : f8E8M0FNU from vector<2x1x8x1xf8E8M0FNU>
    %6 = vector.insert %5, %cst_0 [0] : f8E8M0FNU into vector<4xf8E8M0FNU>
    %7 = vector.extract %arg3[1, 0, 4, 0] : f8E8M0FNU from vector<2x1x8x1xf8E8M0FNU>
    %8 = vector.insert %7, %cst_0 [0] : f8E8M0FNU into vector<4xf8E8M0FNU>
    %9 = amdgpu.scaled_mfma 16x16x128 (%6[0] * %arg0) * (%8[0] * %arg1) + %cst : vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, vector<4xf32>
    return %4, %9 : vector<4xf32>, vector<4xf32>
  }
}

// -----
module {
  func.func @scaled_mfma_less_than_4(%arg0: vector<32xf4E2M1FN>, %arg1: vector<32xf4E2M1FN>, %arg2: vector<2xf8E8M0FNU>, %arg3: vector<2xf8E8M0FNU>) -> vector<4xf32> {
    %cst = arith.constant dense<0.000000e+00> : vector<4xf32>
    %cst_0 = arith.constant dense<5.877470e-39> : vector<4xf8E8M0FNU>
    %0 = vector.extract %arg2[0] : f8E8M0FNU from vector<2xf8E8M0FNU>
    %1 = vector.insert %0, %cst_0 [0] : f8E8M0FNU into vector<4xf8E8M0FNU>
    %2 = vector.extract %arg3[1] : f8E8M0FNU from vector<2xf8E8M0FNU>
    %3 = vector.insert %2, %cst_0 [0] : f8E8M0FNU into vector<4xf8E8M0FNU>
    %4 = amdgpu.scaled_mfma 16x16x128 (%1[0] * %arg0) * (%3[0] * %arg1) + %cst : vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, vector<4xf32>
    return %4 : vector<4xf32>
  }
}

// -----
module {
  func.func @scaled_mfma_ugly_shapes(%arg0: vector<32xf4E2M1FN>, %arg1: vector<32xf4E2M1FN>, %arg2: vector<5x5xf8E8M0FNU>, %arg3: vector<7x23xf8E8M0FNU>) -> (vector<4xf32>, vector<4xf32>, vector<4xf32>, vector<4xf32>) {
    %cst = arith.constant dense<0.000000e+00> : vector<4xf32>
    %cst_0 = arith.constant dense<5.877470e-39> : vector<4xf8E8M0FNU>
    %0 = vector.extract %arg2[4, 0] : f8E8M0FNU from vector<5x5xf8E8M0FNU>
    %1 = vector.extract %arg2[4, 1] : f8E8M0FNU from vector<5x5xf8E8M0FNU>
    %2 = vector.extract %arg2[4, 2] : f8E8M0FNU from vector<5x5xf8E8M0FNU>
    %3 = vector.extract %arg2[4, 3] : f8E8M0FNU from vector<5x5xf8E8M0FNU>
    %4 = vector.extract %arg3[6, 22] : f8E8M0FNU from vector<7x23xf8E8M0FNU>
    %5 = vector.extract %arg3[6, 21] : f8E8M0FNU from vector<7x23xf8E8M0FNU>
    %6 = vector.extract %arg3[6, 20] : f8E8M0FNU from vector<7x23xf8E8M0FNU>
    %7 = vector.extract %arg3[6, 19] : f8E8M0FNU from vector<7x23xf8E8M0FNU>
    %8 = vector.insert %0, %cst_0 [0] : f8E8M0FNU into vector<4xf8E8M0FNU>
    %9 = vector.insert %1, %cst_0 [0] : f8E8M0FNU into vector<4xf8E8M0FNU>
    %10 = vector.insert %2, %cst_0 [0] : f8E8M0FNU into vector<4xf8E8M0FNU>
    %11 = vector.insert %3, %cst_0 [0] : f8E8M0FNU into vector<4xf8E8M0FNU>
    %12 = vector.insert %4, %cst_0 [0] : f8E8M0FNU into vector<4xf8E8M0FNU>
    %13 = vector.insert %5, %cst_0 [0] : f8E8M0FNU into vector<4xf8E8M0FNU>
    %14 = vector.insert %6, %cst_0 [0] : f8E8M0FNU into vector<4xf8E8M0FNU>
    %15 = vector.insert %7, %cst_0 [0] : f8E8M0FNU into vector<4xf8E8M0FNU>
    %16 = amdgpu.scaled_mfma 16x16x128 (%8[0] * %arg0) * (%12[0] * %arg1) + %cst : vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, vector<4xf32>
    %17 = amdgpu.scaled_mfma 16x16x128 (%9[0] * %arg0) * (%13[0] * %arg1) + %cst : vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, vector<4xf32>
    %18 = amdgpu.scaled_mfma 16x16x128 (%10[0] * %arg0) * (%14[0] * %arg1) + %cst : vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, vector<4xf32>
    %19 = amdgpu.scaled_mfma 16x16x128 (%11[0] * %arg0) * (%15[0] * %arg1) + %cst : vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, vector<4xf8E8M0FNU>, vector<32xf4E2M1FN>, vector<4xf32>
    return %16, %17, %18, %19 : vector<4xf32>, vector<4xf32>, vector<4xf32>, vector<4xf32>
  }
}

// -----
module {
  func.func @fuse_memory_counter_wait() {
    amdgpu.memory_counter_wait load(1) store(2) ds(3) exp(4) tensor(5)
    amdgpu.memory_counter_wait load(4) store(3) ds(2) exp(1) tensor(0)
    return
  }
  func.func @fuse_memory_counter_wait_different_counters() {
    amdgpu.memory_counter_wait load(1) store(2)
    amdgpu.memory_counter_wait ds(3) exp(4)
    return
  }
  func.func private @use()
  func.func @fuse_memory_counter_wait_not_adjacent() {
    amdgpu.memory_counter_wait load(1) store(2) ds(3) exp(4)
    call @use() : () -> ()
    amdgpu.memory_counter_wait load(4) store(3) ds(2) exp(1)
    return
  }
}

// -----
module {
  func.func @erase_barriers() {
    amdgpu.lds_barrier
    amdgpu.lds_barrier
    return
  }
}

