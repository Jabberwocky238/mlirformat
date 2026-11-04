module {
  func.func @m16n8k16_fp16(%arg0: vector<4x2xf16>, %arg1: vector<2x2xf16>, %arg2: vector<2x2xf16>) -> vector<2x2xf16> {
    %0 = nvgpu.mma.sync(%arg0, %arg1, %arg2) {mmaShape = [16, 8, 16]} : (vector<4x2xf16>, vector<2x2xf16>, vector<2x2xf16>) -> vector<2x2xf16>
    return %0 : vector<2x2xf16>
  }
  func.func @m16n8k16_fp16_fp32(%arg0: vector<4x2xf16>, %arg1: vector<2x2xf16>, %arg2: vector<2x2xf32>) -> vector<2x2xf32> {
    %0 = nvgpu.mma.sync(%arg0, %arg1, %arg2) {mmaShape = [16, 8, 16]} : (vector<4x2xf16>, vector<2x2xf16>, vector<2x2xf32>) -> vector<2x2xf32>
    return %0 : vector<2x2xf32>
  }
  func.func @m16n8k8_fp16(%arg0: vector<2x2xf16>, %arg1: vector<1x2xf16>, %arg2: vector<2x2xf16>) -> vector<2x2xf16> {
    %0 = nvgpu.mma.sync(%arg0, %arg1, %arg2) {mmaShape = [16, 8, 8]} : (vector<2x2xf16>, vector<1x2xf16>, vector<2x2xf16>) -> vector<2x2xf16>
    return %0 : vector<2x2xf16>
  }
  func.func @m16n8k32_int8(%arg0: vector<4x4xi8>, %arg1: vector<2x4xi8>, %arg2: vector<2x2xi32>) -> vector<2x2xi32> {
    %0 = nvgpu.mma.sync(%arg0, %arg1, %arg2) {mmaShape = [16, 8, 32]} : (vector<4x4xi8>, vector<2x4xi8>, vector<2x2xi32>) -> vector<2x2xi32>
    return %0 : vector<2x2xi32>
  }
  func.func @m16n8k32_i4(%arg0: vector<2x8xi4>, %arg1: vector<1x8xi4>, %arg2: vector<2x2xi32>) -> vector<2x2xi32> {
    %0 = nvgpu.mma.sync(%arg0, %arg1, %arg2) {mmaShape = [16, 8, 32]} : (vector<2x8xi4>, vector<1x8xi4>, vector<2x2xi32>) -> vector<2x2xi32>
    return %0 : vector<2x2xi32>
  }
  func.func @m16n8k64_i4(%arg0: vector<4x8xi4>, %arg1: vector<2x8xi4>, %arg2: vector<2x2xi32>) -> vector<2x2xi32> {
    %0 = nvgpu.mma.sync(%arg0, %arg1, %arg2) {mmaShape = [16, 8, 64]} : (vector<4x8xi4>, vector<2x8xi4>, vector<2x2xi32>) -> vector<2x2xi32>
    return %0 : vector<2x2xi32>
  }
  func.func @m8n8k4_f64(%arg0: vector<1x1xf64>, %arg1: vector<1x1xf64>, %arg2: vector<1x2xf64>) -> vector<1x2xf64> {
    %0 = nvgpu.mma.sync(%arg0, %arg1, %arg2) {mmaShape = [8, 8, 4]} : (vector<1x1xf64>, vector<1x1xf64>, vector<1x2xf64>) -> vector<1x2xf64>
    return %0 : vector<1x2xf64>
  }
  func.func @ldmatrix_x4(%arg0: memref<128x128xf16, 3>) -> vector<4x2xf16> {
    %c0 = arith.constant 0 : index
    %0 = nvgpu.ldmatrix %arg0[%c0, %c0] {numTiles = 4 : i32, transpose = false} : memref<128x128xf16, 3> -> vector<4x2xf16>
    return %0 : vector<4x2xf16>
  }
  func.func @ldmatrix_x1(%arg0: memref<128x128xf16, 3>) -> vector<1x2xf16> {
    %c0 = arith.constant 0 : index
    %0 = nvgpu.ldmatrix %arg0[%c0, %c0] {numTiles = 1 : i32, transpose = false} : memref<128x128xf16, 3> -> vector<1x2xf16>
    return %0 : vector<1x2xf16>
  }
  func.func @m16n8k4_tf32(%arg0: vector<2x1xf32>, %arg1: vector<1x1xf32>, %arg2: vector<2x2xf32>) -> vector<2x2xf32> {
    %0 = nvgpu.mma.sync(%arg0, %arg1, %arg2) {mmaShape = [16, 8, 4], tf32Enabled} : (vector<2x1xf32>, vector<1x1xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    return %0 : vector<2x2xf32>
  }
  func.func @async_cp(%arg0: memref<128x128xf32>, %arg1: memref<3x16x128xf32, 3>, %arg2: index) {
    %0 = nvgpu.device_async_copy %arg0[%arg2, %arg2], %arg1[%arg2, %arg2, %arg2], 4 : memref<128x128xf32> to memref<3x16x128xf32, 3>
    %1 = nvgpu.device_async_create_group %0
    nvgpu.device_async_wait %1 {numGroups = 1 : i32}
    %2 = nvgpu.device_async_copy %arg0[%arg2, %arg2], %arg1[%arg2, %arg2, %arg2], 4 {bypassL1} : memref<128x128xf32> to memref<3x16x128xf32, 3>
    return
  }
  func.func @async_cp_i4(%arg0: memref<128x64xi4>, %arg1: memref<128x128xi4, 3>, %arg2: index) -> !nvgpu.device.async.token {
    %0 = nvgpu.device_async_copy %arg0[%arg2, %arg2], %arg1[%arg2, %arg2], 32 : memref<128x64xi4> to memref<128x128xi4, 3>
    return %0 : !nvgpu.device.async.token
  }
  func.func @async_cp_zfill_f32_align4(%arg0: memref<128x128xf32>, %arg1: memref<3x16x128xf32, 3>, %arg2: index, %arg3: index) {
    %0 = nvgpu.device_async_copy %arg0[%arg2, %arg2], %arg1[%arg2, %arg2, %arg2], 4, %arg3 {bypassL1} : memref<128x128xf32> to memref<3x16x128xf32, 3>
    %1 = nvgpu.device_async_create_group %0
    nvgpu.device_async_wait %1 {numGroups = 1 : i32}
    return
  }
  func.func @async_cp_zfill_f32_align1(%arg0: memref<128x128xf32>, %arg1: memref<3x16x128xf32, 3>, %arg2: index, %arg3: index) {
    %0 = nvgpu.device_async_copy %arg0[%arg2, %arg2], %arg1[%arg2, %arg2, %arg2], 1, %arg3 : memref<128x128xf32> to memref<3x16x128xf32, 3>
    %1 = nvgpu.device_async_create_group %0
    nvgpu.device_async_wait %1 {numGroups = 1 : i32}
    return
  }
  func.func @mma_sp_sync_f16_16832(%arg0: vector<4x2xf16>, %arg1: vector<4x2xf16>, %arg2: vector<2x2xf16>, %arg3: vector<2xi16>) -> vector<2x2xf16> {
    %0 = nvgpu.mma.sp.sync(%arg0, %arg1, %arg2) metadata(%arg3) {mmaShape = [16, 8, 32]} : (vector<4x2xf16>, vector<4x2xf16>, vector<2x2xf16>) -> vector<2x2xf16>
    return %0 : vector<2x2xf16>
  }
  func.func @mma_sp_sync_f16_16816(%arg0: vector<2x2xf16>, %arg1: vector<2x2xf16>, %arg2: vector<2x2xf16>, %arg3: vector<2xi16>) -> vector<2x2xf16> {
    %0 = nvgpu.mma.sp.sync(%arg0, %arg1, %arg2) metadata(%arg3) {mmaShape = [16, 8, 16]} : (vector<2x2xf16>, vector<2x2xf16>, vector<2x2xf16>) -> vector<2x2xf16>
    return %0 : vector<2x2xf16>
  }
  func.func @mma_sp_sync_f16_16816_01(%arg0: vector<2x2xf16>, %arg1: vector<2x2xf16>, %arg2: vector<2x2xf16>, %arg3: vector<2xi16>) -> vector<2x2xf16> {
    %0 = nvgpu.mma.sp.sync(%arg0, %arg1, %arg2) metadata(%arg3) {mmaShape = [16, 8, 16], sparsitySelector = 1 : i32} : (vector<2x2xf16>, vector<2x2xf16>, vector<2x2xf16>) -> vector<2x2xf16>
    return %0 : vector<2x2xf16>
  }
  func.func @mma_sp_sync_i8_16864(%arg0: vector<4x4xi8>, %arg1: vector<4x4xi8>, %arg2: vector<2x2xi32>, %arg3: vector<2xi16>) -> vector<2x2xi32> {
    %0 = nvgpu.mma.sp.sync(%arg0, %arg1, %arg2) metadata(%arg3) {mmaShape = [16, 8, 64]} : (vector<4x4xi8>, vector<4x4xi8>, vector<2x2xi32>) -> vector<2x2xi32>
    return %0 : vector<2x2xi32>
  }
  func.func @mbarrier() {
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %0 = nvgpu.mbarrier.create -> <memorySpace = #gpu.address_space<workgroup>>
    nvgpu.mbarrier.init %0[%c0], %c128 : <memorySpace = #gpu.address_space<workgroup>>
    %1 = nvgpu.mbarrier.arrive %0[%c0] : <memorySpace = #gpu.address_space<workgroup>> -> !nvgpu.mbarrier.token
    %2 = nvgpu.mbarrier.test.wait %0[%c0], %1 : <memorySpace = #gpu.address_space<workgroup>>, !nvgpu.mbarrier.token
    return
  }
  func.func @mbarrier_nocomplete() {
    %c128 = arith.constant 128 : index
    %c12 = arith.constant 12 : index
    %c0 = arith.constant 0 : index
    %0 = nvgpu.mbarrier.create -> <memorySpace = #gpu.address_space<workgroup>>
    nvgpu.mbarrier.init %0[%c0], %c128 : <memorySpace = #gpu.address_space<workgroup>>
    %1 = nvgpu.mbarrier.arrive.nocomplete %0[%c0], %c12 : <memorySpace = #gpu.address_space<workgroup>> -> !nvgpu.mbarrier.token
    %2 = nvgpu.mbarrier.test.wait %0[%c0], %1 : <memorySpace = #gpu.address_space<workgroup>>, !nvgpu.mbarrier.token
    return
  }
  func.func @mbarrier_get(%arg0: !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>, num_barriers = 5>) {
    %c2 = arith.constant 2 : index
    %0 = nvgpu.mbarrier.get %arg0[%c2] : <memorySpace = #gpu.address_space<workgroup>, num_barriers = 5> -> i32
    %c4 = arith.constant 4 : index
    %1 = nvgpu.mbarrier.get %arg0[%c4] : <memorySpace = #gpu.address_space<workgroup>, num_barriers = 5> -> i64
    return
  }
  func.func @mbarrier_wait(%arg0: !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>, num_barriers = 5>, %arg1: !nvgpu.mbarrier.token) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c100 = arith.constant 100 : index
    %c5 = arith.constant 5 : index
    scf.for %arg2 = %c0 to %c100 step %c1 {
      %0 = arith.remui %arg2, %c5 : index
      %1 = nvgpu.mbarrier.test.wait %arg0[%0], %arg1 : <memorySpace = #gpu.address_space<workgroup>, num_barriers = 5>, !nvgpu.mbarrier.token
    }
    return
  }
  func.func @mbarrier_txcount() {
    %c128 = arith.constant 128 : index
    %c0 = arith.constant 0 : index
    %0 = nvgpu.mbarrier.create -> <memorySpace = #gpu.address_space<workgroup>>
    nvgpu.mbarrier.init %0[%c0], %c128 : <memorySpace = #gpu.address_space<workgroup>>
    %1 = nvvm.read.ptx.sreg.tid.x : i32
    %2 = arith.index_cast %1 : i32 to index
    %3 = arith.cmpi eq, %2, %c0 : index
    scf.if %3 {
      %c256 = arith.constant 256 : index
      nvgpu.mbarrier.arrive.expect_tx %0[%c0], %c256 : <memorySpace = #gpu.address_space<workgroup>>
    } else {
      %c0_0 = arith.constant 0 : index
      nvgpu.mbarrier.arrive.expect_tx %0[%c0], %c0_0 : <memorySpace = #gpu.address_space<workgroup>>
    }
    %false = arith.constant false
    %c10000000 = arith.constant 10000000 : index
    nvgpu.mbarrier.try_wait.parity %0[%c0], %false, %c10000000 : <memorySpace = #gpu.address_space<workgroup>>
    return
  }
  func.func @mbarrier_txcount_pred() {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %thread_id_x = gpu.thread_id  x
    %0 = arith.cmpi eq, %thread_id_x, %c0 : index
    %1 = nvgpu.mbarrier.create -> <memorySpace = #gpu.address_space<workgroup>>
    nvgpu.mbarrier.init %1[%c0], %c1, predicate = %0 : <memorySpace = #gpu.address_space<workgroup>>
    %c256 = arith.constant 256 : index
    nvgpu.mbarrier.arrive.expect_tx %1[%c0], %c256, predicate = %0 : <memorySpace = #gpu.address_space<workgroup>>
    %false = arith.constant false
    %c10000000 = arith.constant 10000000 : index
    nvgpu.mbarrier.try_wait.parity %1[%c0], %false, %c10000000 : <memorySpace = #gpu.address_space<workgroup>>
    return
  }
  func.func @async_tma_load(%arg0: !nvgpu.tensormap.descriptor<tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>, %arg1: !nvgpu.tensormap.descriptor<tensor = memref<32x8xf32, 3>, swizzle = swizzle_32b, l2promo = none, oob = zero, interleave = none>, %arg2: !nvgpu.tensormap.descriptor<tensor = memref<2x32x16xf32, 3>, swizzle = swizzle_64b, l2promo = l2promo_64b, oob = zero, interleave = none>, %arg3: !nvgpu.tensormap.descriptor<tensor = memref<2x2x32x32xf32, 3>, swizzle = swizzle_128b, l2promo = l2promo_128b, oob = zero, interleave = none>, %arg4: !nvgpu.tensormap.descriptor<tensor = memref<2x2x2x32x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, %arg5: memref<128xf32, 3>, %arg6: memref<32x8xf32, 3>, %arg7: memref<2x32x16xf32, 3>, %arg8: memref<2x2x32x32xf32, 3>, %arg9: memref<2x2x2x32x32xf32, 3>, %arg10: !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>) {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %c0_1 = arith.constant 0 : index
    nvgpu.tma.async.load %arg0[%c0_0], %arg10[%c0] to %arg5 : <tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<128xf32, 3>
    nvgpu.tma.async.load %arg1[%c0_0, %c0_1], %arg10[%c0] to %arg6 : <tensor = memref<32x8xf32, 3>, swizzle = swizzle_32b, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<32x8xf32, 3>
    nvgpu.tma.async.load %arg2[%c0_0, %c0_1, %c0_0], %arg10[%c0] to %arg7 : <tensor = memref<2x32x16xf32, 3>, swizzle = swizzle_64b, l2promo = l2promo_64b, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<2x32x16xf32, 3>
    nvgpu.tma.async.load %arg3[%c0_0, %c0_1, %c0_1, %c0_0], %arg10[%c0] to %arg8 : <tensor = memref<2x2x32x32xf32, 3>, swizzle = swizzle_128b, l2promo = l2promo_128b, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<2x2x32x32xf32, 3>
    nvgpu.tma.async.load %arg4[%c0_0, %c0_1, %c0_1, %c0_0, %c0_0], %arg10[%c0] to %arg9 : <tensor = memref<2x2x2x32x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<2x2x2x32x32xf32, 3>
    return
  }
  func.func @async_tma_load_gpu_address_space(%arg0: !nvgpu.tensormap.descriptor<tensor = memref<128xf32, #gpu.address_space<workgroup>>, swizzle = none, l2promo = none, oob = nan, interleave = none>, %arg1: memref<128xf32, #gpu.address_space<workgroup>>, %arg2: !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>) {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %c0_1 = arith.constant 0 : index
    nvgpu.tma.async.load %arg0[%c0_0], %arg2[%c0] to %arg1 : <tensor = memref<128xf32, #gpu.address_space<workgroup>>, swizzle = none, l2promo = none, oob = nan, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<128xf32, #gpu.address_space<workgroup>>
    return
  }
  func.func @async_tma_load_pred(%arg0: !nvgpu.tensormap.descriptor<tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>, %arg1: !nvgpu.tensormap.descriptor<tensor = memref<32x8xf32, 3>, swizzle = swizzle_32b, l2promo = none, oob = zero, interleave = none>, %arg2: !nvgpu.tensormap.descriptor<tensor = memref<2x32x16xf32, 3>, swizzle = swizzle_64b, l2promo = l2promo_64b, oob = zero, interleave = none>, %arg3: !nvgpu.tensormap.descriptor<tensor = memref<2x2x32x32xf32, 3>, swizzle = swizzle_128b, l2promo = l2promo_128b, oob = zero, interleave = none>, %arg4: !nvgpu.tensormap.descriptor<tensor = memref<2x2x2x32x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, %arg5: memref<128xf32, 3>, %arg6: memref<32x8xf32, 3>, %arg7: memref<2x32x16xf32, 3>, %arg8: memref<2x2x32x32xf32, 3>, %arg9: memref<2x2x2x32x32xf32, 3>, %arg10: !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, %arg11: i1) {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %c0_1 = arith.constant 0 : index
    nvgpu.tma.async.load %arg0[%c0_0], %arg10[%c0] to %arg5, predicate = %arg11 : <tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<128xf32, 3>
    nvgpu.tma.async.load %arg1[%c0_0, %c0_1], %arg10[%c0] to %arg6, predicate = %arg11 : <tensor = memref<32x8xf32, 3>, swizzle = swizzle_32b, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<32x8xf32, 3>
    nvgpu.tma.async.load %arg2[%c0_0, %c0_1, %c0_0], %arg10[%c0] to %arg7, predicate = %arg11 : <tensor = memref<2x32x16xf32, 3>, swizzle = swizzle_64b, l2promo = l2promo_64b, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<2x32x16xf32, 3>
    nvgpu.tma.async.load %arg3[%c0_0, %c0_1, %c0_1, %c0_0], %arg10[%c0] to %arg8, predicate = %arg11 : <tensor = memref<2x2x32x32xf32, 3>, swizzle = swizzle_128b, l2promo = l2promo_128b, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<2x2x32x32xf32, 3>
    nvgpu.tma.async.load %arg4[%c0_0, %c0_1, %c0_1, %c0_0, %c0_0], %arg10[%c0] to %arg9, predicate = %arg11 : <tensor = memref<2x2x2x32x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<2x2x2x32x32xf32, 3>
    return
  }
  func.func @async_tma_load_multicast(%arg0: !nvgpu.tensormap.descriptor<tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>, %arg1: !nvgpu.tensormap.descriptor<tensor = memref<32x8xf32, 3>, swizzle = swizzle_32b, l2promo = none, oob = zero, interleave = none>, %arg2: !nvgpu.tensormap.descriptor<tensor = memref<2x32x16xf32, 3>, swizzle = swizzle_64b, l2promo = l2promo_64b, oob = zero, interleave = none>, %arg3: !nvgpu.tensormap.descriptor<tensor = memref<2x2x32x32xf32, 3>, swizzle = swizzle_128b, l2promo = l2promo_128b, oob = zero, interleave = none>, %arg4: !nvgpu.tensormap.descriptor<tensor = memref<2x2x2x32x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, %arg5: memref<128xf32, 3>, %arg6: memref<32x8xf32, 3>, %arg7: memref<2x32x16xf32, 3>, %arg8: memref<2x2x32x32xf32, 3>, %arg9: memref<2x2x2x32x32xf32, 3>, %arg10: !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>, %arg11: i16) {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %c0_1 = arith.constant 0 : index
    nvgpu.tma.async.load %arg0[%c0_0], %arg10[%c0] to %arg5 multicast_mask = %arg11 : <tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<128xf32, 3>
    nvgpu.tma.async.load %arg1[%c0_0, %c0_1], %arg10[%c0] to %arg6 multicast_mask = %arg11 : <tensor = memref<32x8xf32, 3>, swizzle = swizzle_32b, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<32x8xf32, 3>
    nvgpu.tma.async.load %arg2[%c0_0, %c0_1, %c0_0], %arg10[%c0] to %arg7 multicast_mask = %arg11 : <tensor = memref<2x32x16xf32, 3>, swizzle = swizzle_64b, l2promo = l2promo_64b, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<2x32x16xf32, 3>
    nvgpu.tma.async.load %arg3[%c0_0, %c0_1, %c0_1, %c0_0], %arg10[%c0] to %arg8 multicast_mask = %arg11 : <tensor = memref<2x2x32x32xf32, 3>, swizzle = swizzle_128b, l2promo = l2promo_128b, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<2x2x32x32xf32, 3>
    nvgpu.tma.async.load %arg4[%c0_0, %c0_1, %c0_1, %c0_0, %c0_0], %arg10[%c0] to %arg9 multicast_mask = %arg11 : <tensor = memref<2x2x2x32x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<2x2x2x32x32xf32, 3>
    return
  }
  func.func @async_tma_store(%arg0: !nvgpu.tensormap.descriptor<tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>, %arg1: !nvgpu.tensormap.descriptor<tensor = memref<32x8xf32, 3>, swizzle = swizzle_32b, l2promo = none, oob = zero, interleave = none>, %arg2: !nvgpu.tensormap.descriptor<tensor = memref<2x32x16xf32, 3>, swizzle = swizzle_64b, l2promo = l2promo_64b, oob = zero, interleave = none>, %arg3: !nvgpu.tensormap.descriptor<tensor = memref<2x2x32x32xf32, 3>, swizzle = swizzle_128b, l2promo = l2promo_128b, oob = zero, interleave = none>, %arg4: !nvgpu.tensormap.descriptor<tensor = memref<2x2x2x32x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, %arg5: memref<128xf32, 3>, %arg6: memref<32x8xf32, 3>, %arg7: memref<2x32x16xf32, 3>, %arg8: memref<2x2x32x32xf32, 3>, %arg9: memref<2x2x2x32x32xf32, 3>) {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %c0_1 = arith.constant 0 : index
    nvgpu.tma.async.store %arg5 to %arg0[%c0_0] : memref<128xf32, 3> -> <tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>
    nvgpu.tma.async.store %arg6 to %arg1[%c0_0, %c0_1] : memref<32x8xf32, 3> -> <tensor = memref<32x8xf32, 3>, swizzle = swizzle_32b, l2promo = none, oob = zero, interleave = none>
    nvgpu.tma.async.store %arg7 to %arg2[%c0_0, %c0_1, %c0_0] : memref<2x32x16xf32, 3> -> <tensor = memref<2x32x16xf32, 3>, swizzle = swizzle_64b, l2promo = l2promo_64b, oob = zero, interleave = none>
    nvgpu.tma.async.store %arg8 to %arg3[%c0_0, %c0_1, %c0_1, %c0_0] : memref<2x2x32x32xf32, 3> -> <tensor = memref<2x2x32x32xf32, 3>, swizzle = swizzle_128b, l2promo = l2promo_128b, oob = zero, interleave = none>
    nvgpu.tma.async.store %arg9 to %arg4[%c0_0, %c0_1, %c0_1, %c0_0, %c0_0] : memref<2x2x2x32x32xf32, 3> -> <tensor = memref<2x2x2x32x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>
    return
  }
  func.func @async_tma_store_predicate(%arg0: !nvgpu.tensormap.descriptor<tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>, %arg1: !nvgpu.tensormap.descriptor<tensor = memref<32x8xf32, 3>, swizzle = swizzle_32b, l2promo = none, oob = zero, interleave = none>, %arg2: !nvgpu.tensormap.descriptor<tensor = memref<2x32x16xf32, 3>, swizzle = swizzle_64b, l2promo = l2promo_64b, oob = zero, interleave = none>, %arg3: !nvgpu.tensormap.descriptor<tensor = memref<2x2x32x32xf32, 3>, swizzle = swizzle_128b, l2promo = l2promo_128b, oob = zero, interleave = none>, %arg4: !nvgpu.tensormap.descriptor<tensor = memref<2x2x2x32x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>, %arg5: memref<128xf32, 3>, %arg6: memref<32x8xf32, 3>, %arg7: memref<2x32x16xf32, 3>, %arg8: memref<2x2x32x32xf32, 3>, %arg9: memref<2x2x2x32x32xf32, 3>, %arg10: i1) {
    %c0 = arith.constant 0 : index
    %c0_0 = arith.constant 0 : index
    %c0_1 = arith.constant 0 : index
    nvgpu.tma.async.store %arg5 to %arg0[%c0_0], predicate = %arg10 : memref<128xf32, 3> -> <tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>
    nvgpu.tma.async.store %arg6 to %arg1[%c0_0, %c0_1], predicate = %arg10 : memref<32x8xf32, 3> -> <tensor = memref<32x8xf32, 3>, swizzle = swizzle_32b, l2promo = none, oob = zero, interleave = none>
    nvgpu.tma.async.store %arg7 to %arg2[%c0_0, %c0_1, %c0_0], predicate = %arg10 : memref<2x32x16xf32, 3> -> <tensor = memref<2x32x16xf32, 3>, swizzle = swizzle_64b, l2promo = l2promo_64b, oob = zero, interleave = none>
    nvgpu.tma.async.store %arg8 to %arg3[%c0_0, %c0_1, %c0_1, %c0_0], predicate = %arg10 : memref<2x2x32x32xf32, 3> -> <tensor = memref<2x2x32x32xf32, 3>, swizzle = swizzle_128b, l2promo = l2promo_128b, oob = zero, interleave = none>
    nvgpu.tma.async.store %arg9 to %arg4[%c0_0, %c0_1, %c0_1, %c0_0, %c0_0], predicate = %arg10 : memref<2x2x2x32x32xf32, 3> -> <tensor = memref<2x2x2x32x32xf32, 3>, swizzle = none, l2promo = none, oob = zero, interleave = none>
    return
  }
  func.func @create_tensor_map(%arg0: memref<64x128xf32>, %arg1: memref<128xf32>) {
    %c64 = arith.constant 64 : index
    %c128 = arith.constant 128 : index
    %cast = memref.cast %arg0 : memref<64x128xf32> to memref<*xf32>
    %0 = nvgpu.tma.create.descriptor %cast box[%c64, %c128] : memref<*xf32> -> <tensor = memref<32x8xf32, 3>, swizzle = swizzle_32b, l2promo = none, oob = zero, interleave = none>
    %cast_0 = memref.cast %arg1 : memref<128xf32> to memref<*xf32>
    %1 = nvgpu.tma.create.descriptor %cast_0 box[%c128] : memref<*xf32> -> <tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>
    return
  }
  func.func @tma_prefetch(%arg0: !nvgpu.tensormap.descriptor<tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>, %arg1: i1) {
    nvgpu.tma.prefetch.descriptor %arg0 : <tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>
    nvgpu.tma.prefetch.descriptor %arg0, predicate = %arg1 : <tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>
    return
  }
  func.func @tma_fence(%arg0: !nvgpu.tensormap.descriptor<tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>) {
    nvgpu.tma.fence.descriptor %arg0 : <tensor = memref<128xf32, 3>, swizzle = none, l2promo = none, oob = nan, interleave = none>
    return
  }
  module @mymodule {
    memref.global "private" @dynamicShmem : memref<0xf16, 3>
    func.func @async_tma_load(%arg0: !nvgpu.tensormap.descriptor<tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, %arg1: !nvgpu.tensormap.descriptor<tensor = memref<64x64xf16, strided<[64, 1], offset: 8192>, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, %arg2: !nvgpu.mbarrier.group<memorySpace = #gpu.address_space<workgroup>>) {
      %c0 = arith.constant 0 : index
      %0 = memref.get_global @dynamicShmem : memref<0xf16, 3>
      %reinterpret_cast = memref.reinterpret_cast %0 to offset: [0], sizes: [128, 64], strides: [64, 1] : memref<0xf16, 3> to memref<128x64xf16, 3>
      %reinterpret_cast_0 = memref.reinterpret_cast %0 to offset: [0], sizes: [4, 64, 64], strides: [4096, 64, 1] : memref<0xf16, 3> to memref<4x64x64xf16, 3>
      %subview = memref.subview %reinterpret_cast_0[2, 0, 0] [1, 64, 64] [1, 1, 1] : memref<4x64x64xf16, 3> to memref<1x64x64xf16, strided<[4096, 64, 1], offset: 8192>, 3>
      %subview_1 = memref.subview %subview[0, 0, 0] [1, 64, 64] [1, 1, 1] : memref<1x64x64xf16, strided<[4096, 64, 1], offset: 8192>, 3> to memref<64x64xf16, strided<[64, 1], offset: 8192>, 3>
      nvgpu.tma.async.load %arg0[%c0, %c0], %arg2[%c0] to %reinterpret_cast : <tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<128x64xf16, 3>
      nvgpu.tma.async.load %arg1[%c0, %c0], %arg2[%c0] to %subview_1 : <tensor = memref<64x64xf16, strided<[64, 1], offset: 8192>, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>, <memorySpace = #gpu.address_space<workgroup>> -> memref<64x64xf16, strided<[64, 1], offset: 8192>, 3>
      return
    }
  }
  memref.global "private" @dynamicShmem : memref<0xf16, 3>
  func.func @create_wgmma_descriptor(%arg0: !nvgpu.tensormap.descriptor<tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none>) -> !nvgpu.warpgroup.descriptor<tensor = memref<128x64xf16, 3>> {
    %0 = memref.get_global @dynamicShmem : memref<0xf16, 3>
    %reinterpret_cast = memref.reinterpret_cast %0 to offset: [0], sizes: [128, 64], strides: [64, 1] : memref<0xf16, 3> to memref<128x64xf16, 3>
    %1 = nvgpu.warpgroup.generate.descriptor %reinterpret_cast, %arg0 : memref<128x64xf16, 3>, <tensor = memref<128x64xf16, 3>, swizzle = swizzle_128b, l2promo = none, oob = zero, interleave = none> -> <tensor = memref<128x64xf16, 3>>
    return %1 : !nvgpu.warpgroup.descriptor<tensor = memref<128x64xf16, 3>>
  }
  func.func @warpgroup_mma_128_128_64(%arg0: !nvgpu.warpgroup.descriptor<tensor = memref<128x64xf16, 3>>, %arg1: !nvgpu.warpgroup.descriptor<tensor = memref<64x128xf16, 3>>, %arg2: !nvgpu.warpgroup.accumulator<fragmented = vector<128x128xf32>>) {
    %0 = nvgpu.warpgroup.mma %arg0, %arg1, %arg2 {transposeB} : <tensor = memref<128x64xf16, 3>>, <tensor = memref<64x128xf16, 3>>, <fragmented = vector<128x128xf32>> -> <fragmented = vector<128x128xf32>>
    return
  }
  func.func @warpgroup_mma_store(%arg0: !nvgpu.warpgroup.accumulator<fragmented = vector<128x128xf32>>, %arg1: memref<128x128xf32, 3>) {
    nvgpu.warpgroup.mma.store %arg0, %arg1 : <fragmented = vector<128x128xf32>> to memref<128x128xf32, 3>
    return
  }
  func.func @warpgroup_mma_store_multiple(%arg0: memref<64x8xf32>, %arg1: memref<64x16xf32>, %arg2: memref<64x24xf32>, %arg3: memref<64x32xf32>, %arg4: memref<64x40xf32>, %arg5: memref<64x48xf32>, %arg6: memref<64x56xf32>, %arg7: memref<64x64xf32>, %arg8: memref<64x72xf32>, %arg9: memref<64x80xf32>, %arg10: memref<64x88xf32>, %arg11: memref<64x96xf32>, %arg12: memref<64x104xf32>, %arg13: memref<64x112xf32>, %arg14: memref<64x120xf32>, %arg15: memref<64x128xf32>, %arg16: memref<64x136xf32>, %arg17: memref<64x144xf32>, %arg18: memref<64x152xf32>, %arg19: memref<64x160xf32>, %arg20: memref<64x168xf32>, %arg21: memref<64x176xf32>, %arg22: memref<64x184xf32>, %arg23: memref<64x192xf32>, %arg24: memref<64x200xf32>, %arg25: memref<64x208xf32>, %arg26: memref<64x216xf32>, %arg27: memref<64x224xf32>, %arg28: memref<64x232xf32>, %arg29: memref<64x240xf32>, %arg30: memref<64x248xf32>, %arg31: memref<64x256xf32>, %arg32: !nvgpu.warpgroup.accumulator<fragmented = vector<64x16xf32>>, %arg33: !nvgpu.warpgroup.accumulator<fragmented = vector<64x24xf32>>, %arg34: !nvgpu.warpgroup.accumulator<fragmented = vector<64x32xf32>>, %arg35: !nvgpu.warpgroup.accumulator<fragmented = vector<64x40xf32>>, %arg36: !nvgpu.warpgroup.accumulator<fragmented = vector<64x48xf32>>, %arg37: !nvgpu.warpgroup.accumulator<fragmented = vector<64x56xf32>>, %arg38: !nvgpu.warpgroup.accumulator<fragmented = vector<64x64xf32>>, %arg39: !nvgpu.warpgroup.accumulator<fragmented = vector<64x72xf32>>, %arg40: !nvgpu.warpgroup.accumulator<fragmented = vector<64x80xf32>>, %arg41: !nvgpu.warpgroup.accumulator<fragmented = vector<64x88xf32>>, %arg42: !nvgpu.warpgroup.accumulator<fragmented = vector<64x96xf32>>, %arg43: !nvgpu.warpgroup.accumulator<fragmented = vector<64x104xf32>>, %arg44: !nvgpu.warpgroup.accumulator<fragmented = vector<64x112xf32>>, %arg45: !nvgpu.warpgroup.accumulator<fragmented = vector<64x120xf32>>, %arg46: !nvgpu.warpgroup.accumulator<fragmented = vector<64x128xf32>>, %arg47: !nvgpu.warpgroup.accumulator<fragmented = vector<64x136xf32>>, %arg48: !nvgpu.warpgroup.accumulator<fragmented = vector<64x144xf32>>, %arg49: !nvgpu.warpgroup.accumulator<fragmented = vector<64x152xf32>>, %arg50: !nvgpu.warpgroup.accumulator<fragmented = vector<64x160xf32>>, %arg51: !nvgpu.warpgroup.accumulator<fragmented = vector<64x168xf32>>, %arg52: !nvgpu.warpgroup.accumulator<fragmented = vector<64x176xf32>>, %arg53: !nvgpu.warpgroup.accumulator<fragmented = vector<64x184xf32>>, %arg54: !nvgpu.warpgroup.accumulator<fragmented = vector<64x192xf32>>, %arg55: !nvgpu.warpgroup.accumulator<fragmented = vector<64x200xf32>>, %arg56: !nvgpu.warpgroup.accumulator<fragmented = vector<64x208xf32>>, %arg57: !nvgpu.warpgroup.accumulator<fragmented = vector<64x216xf32>>, %arg58: !nvgpu.warpgroup.accumulator<fragmented = vector<64x224xf32>>, %arg59: !nvgpu.warpgroup.accumulator<fragmented = vector<64x232xf32>>, %arg60: !nvgpu.warpgroup.accumulator<fragmented = vector<64x240xf32>>, %arg61: !nvgpu.warpgroup.accumulator<fragmented = vector<64x248xf32>>, %arg62: !nvgpu.warpgroup.accumulator<fragmented = vector<64x256xf32>>) {
    nvgpu.warpgroup.mma.store %arg32, %arg1 : <fragmented = vector<64x16xf32>> to memref<64x16xf32>
    nvgpu.warpgroup.mma.store %arg33, %arg2 : <fragmented = vector<64x24xf32>> to memref<64x24xf32>
    nvgpu.warpgroup.mma.store %arg34, %arg3 : <fragmented = vector<64x32xf32>> to memref<64x32xf32>
    nvgpu.warpgroup.mma.store %arg35, %arg4 : <fragmented = vector<64x40xf32>> to memref<64x40xf32>
    nvgpu.warpgroup.mma.store %arg36, %arg5 : <fragmented = vector<64x48xf32>> to memref<64x48xf32>
    nvgpu.warpgroup.mma.store %arg37, %arg6 : <fragmented = vector<64x56xf32>> to memref<64x56xf32>
    nvgpu.warpgroup.mma.store %arg38, %arg7 : <fragmented = vector<64x64xf32>> to memref<64x64xf32>
    nvgpu.warpgroup.mma.store %arg39, %arg8 : <fragmented = vector<64x72xf32>> to memref<64x72xf32>
    nvgpu.warpgroup.mma.store %arg40, %arg9 : <fragmented = vector<64x80xf32>> to memref<64x80xf32>
    nvgpu.warpgroup.mma.store %arg41, %arg10 : <fragmented = vector<64x88xf32>> to memref<64x88xf32>
    nvgpu.warpgroup.mma.store %arg42, %arg11 : <fragmented = vector<64x96xf32>> to memref<64x96xf32>
    nvgpu.warpgroup.mma.store %arg43, %arg12 : <fragmented = vector<64x104xf32>> to memref<64x104xf32>
    nvgpu.warpgroup.mma.store %arg44, %arg13 : <fragmented = vector<64x112xf32>> to memref<64x112xf32>
    nvgpu.warpgroup.mma.store %arg45, %arg14 : <fragmented = vector<64x120xf32>> to memref<64x120xf32>
    nvgpu.warpgroup.mma.store %arg46, %arg15 : <fragmented = vector<64x128xf32>> to memref<64x128xf32>
    nvgpu.warpgroup.mma.store %arg47, %arg16 : <fragmented = vector<64x136xf32>> to memref<64x136xf32>
    nvgpu.warpgroup.mma.store %arg48, %arg17 : <fragmented = vector<64x144xf32>> to memref<64x144xf32>
    nvgpu.warpgroup.mma.store %arg49, %arg18 : <fragmented = vector<64x152xf32>> to memref<64x152xf32>
    nvgpu.warpgroup.mma.store %arg50, %arg19 : <fragmented = vector<64x160xf32>> to memref<64x160xf32>
    nvgpu.warpgroup.mma.store %arg51, %arg20 : <fragmented = vector<64x168xf32>> to memref<64x168xf32>
    nvgpu.warpgroup.mma.store %arg52, %arg21 : <fragmented = vector<64x176xf32>> to memref<64x176xf32>
    nvgpu.warpgroup.mma.store %arg53, %arg22 : <fragmented = vector<64x184xf32>> to memref<64x184xf32>
    nvgpu.warpgroup.mma.store %arg54, %arg23 : <fragmented = vector<64x192xf32>> to memref<64x192xf32>
    nvgpu.warpgroup.mma.store %arg55, %arg24 : <fragmented = vector<64x200xf32>> to memref<64x200xf32>
    nvgpu.warpgroup.mma.store %arg56, %arg25 : <fragmented = vector<64x208xf32>> to memref<64x208xf32>
    nvgpu.warpgroup.mma.store %arg57, %arg26 : <fragmented = vector<64x216xf32>> to memref<64x216xf32>
    nvgpu.warpgroup.mma.store %arg58, %arg27 : <fragmented = vector<64x224xf32>> to memref<64x224xf32>
    nvgpu.warpgroup.mma.store %arg59, %arg28 : <fragmented = vector<64x232xf32>> to memref<64x232xf32>
    nvgpu.warpgroup.mma.store %arg60, %arg29 : <fragmented = vector<64x240xf32>> to memref<64x240xf32>
    nvgpu.warpgroup.mma.store %arg61, %arg30 : <fragmented = vector<64x248xf32>> to memref<64x248xf32>
    nvgpu.warpgroup.mma.store %arg62, %arg31 : <fragmented = vector<64x256xf32>> to memref<64x256xf32>
    return
  }
  func.func @warpgroup_mma_init() {
    %0 = nvgpu.warpgroup.mma.init.accumulator -> <fragmented = vector<128x128xf32>>
    return
  }
  func.func @warpgroup_matrix_multiply_m128n128k64(%arg0: !nvgpu.warpgroup.descriptor<tensor = memref<128x64xf16, 3>>, %arg1: !nvgpu.warpgroup.descriptor<tensor = memref<64x128xf16, 3>>, %arg2: memref<128x128xf32, 3>) {
    %0 = nvgpu.warpgroup.mma.init.accumulator -> <fragmented = vector<128x128xf32>>
    %1 = nvgpu.warpgroup.mma %arg0, %arg1, %0 {transposeB} : <tensor = memref<128x64xf16, 3>>, <tensor = memref<64x128xf16, 3>>, <fragmented = vector<128x128xf32>> -> <fragmented = vector<128x128xf32>>
    nvgpu.warpgroup.mma.store %1, %arg2 : <fragmented = vector<128x128xf32>> to memref<128x128xf32, 3>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_conversion_patterns to %0 {
        transform.apply_conversion_patterns.nvgpu.nvgpu_to_nvvm
      } with type_converter {
        transform.apply_conversion_patterns.memref.memref_to_llvm_type_converter {use_opaque_pointers = true}
      } {legal_dialects = ["arith", "func", "llvm", "memref", "nvvm", "vector", "scf"], partial_conversion} : !transform.any_op
      transform.yield 
    }
  }
  func.func @rcp_approx_ftz_f32(%arg0: vector<32x16xf32>) {
    %0 = nvgpu.rcp %arg0{rounding =  approx, ftz} : vector<32x16xf32>
    return
  }
}

