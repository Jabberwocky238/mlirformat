module {
  func.func @ldmatrix(%arg0: memref<?x?xf16, 3>, %arg1: index, %arg2: index) {
    %0 = nvgpu.ldmatrix %arg0[%arg1, %arg2] {numTiles = 4 : i32, transpose = false} : memref<?x?xf16, 3> -> vector<4x2xf16>
    return
  }
  func.func @mma_sync(%arg0: vector<4x2xf16>, %arg1: vector<2x2xf16>, %arg2: vector<2x2xf16>) -> vector<2x2xf16> {
    %0 = nvgpu.mma.sync(%arg0, %arg1, %arg2) {mmaShape = [16, 8, 16]} : (vector<4x2xf16>, vector<2x2xf16>, vector<2x2xf16>) -> vector<2x2xf16>
    return %0 : vector<2x2xf16>
  }
  func.func @mma_sp_sync_f16_16832(%arg0: vector<4x2xf16>, %arg1: vector<4x2xf16>, %arg2: vector<2x2xf16>, %arg3: vector<2xi16>) -> vector<2x2xf16> {
    %0 = nvgpu.mma.sp.sync(%arg0, %arg1, %arg2) metadata(%arg3) {mmaShape = [16, 8, 32]} : (vector<4x2xf16>, vector<4x2xf16>, vector<2x2xf16>) -> vector<2x2xf16>
    return %0 : vector<2x2xf16>
  }
  func.func @mma_sp_sync_f16_16816(%arg0: vector<2x2xf16>, %arg1: vector<2x2xf16>, %arg2: vector<2x2xf16>, %arg3: vector<2xi16>) -> vector<2x2xf16> {
    %0 = nvgpu.mma.sp.sync(%arg0, %arg1, %arg2) metadata(%arg3) {mmaShape = [16, 8, 16]} : (vector<2x2xf16>, vector<2x2xf16>, vector<2x2xf16>) -> vector<2x2xf16>
    return %0 : vector<2x2xf16>
  }
  func.func @mma_sp_sync_i8_16864(%arg0: vector<4x4xi8>, %arg1: vector<4x4xi8>, %arg2: vector<2x2xi32>, %arg3: vector<2xi16>) -> vector<2x2xi32> {
    %0 = nvgpu.mma.sp.sync(%arg0, %arg1, %arg2) metadata(%arg3) {mmaShape = [16, 8, 64]} : (vector<4x4xi8>, vector<4x4xi8>, vector<2x2xi32>) -> vector<2x2xi32>
    return %0 : vector<2x2xi32>
  }
  func.func @async_cp(%arg0: memref<2x7x5xf32, 3>, %arg1: memref<4x5xf32>) {
    %c0 = arith.constant 0 : index
    %0 = nvgpu.device_async_copy %arg1[%c0, %c0], %arg0[%c0, %c0, %c0], 4 : memref<4x5xf32> to memref<2x7x5xf32, 3>
    %1 = nvgpu.device_async_create_group %0
    nvgpu.device_async_wait %1 {numGroups = 1 : i32}
    return
  }
}

