#map = affine_map<()[s0] -> (s0 floordiv 4)>
#map1 = affine_map<()[s0] -> (s0 mod 2)>
#map2 = affine_map<()[s0] -> (s0 + 8)>
#map3 = affine_map<()[s0] -> (s0 * 2)>
#map4 = affine_map<(d0) -> (d0 + 8)>
#map5 = affine_map<()[s0] -> (s0 + 16)>
#map6 = affine_map<()[s0] -> (s0 + 24)>
module attributes {gpu.container_module} {
  gpu.module @kernels {
    gpu.func @mma_sp_sync_f16_16832(%arg0: memref<16x16xf16>, %arg1: memref<16x2xi16>, %arg2: memref<8x32xf16>, %arg3: memref<16x8xf16>) kernel {
      %cst = arith.constant 0.000000e+00 : f16
      %c4 = arith.constant 4 : index
      %c8 = arith.constant 8 : index
      %thread_id_x = gpu.thread_id  x
      %0 = affine.apply #map()[%thread_id_x]
      %1 = affine.apply #map1()[%thread_id_x]
      %2 = affine.apply #map2()[%0]
      %3 = memref.load %arg1[%0, %1] : memref<16x2xi16>
      %4 = memref.load %arg1[%2, %1] : memref<16x2xi16>
      %5 = arith.extui %3 : i16 to i32
      %6 = arith.extui %4 : i16 to i32
      %cst_0 = arith.constant dense<0> : vector<2xi16>
      %7 = vector.insert %3, %cst_0 [0] : i16 into vector<2xi16>
      %8 = vector.insert %4, %7 [1] : i16 into vector<2xi16>
      %9:2 = affine.delinearize_index %thread_id_x into (%c8, %c4) : index, index
      %10 = affine.apply #map3()[%9#1]
      %11 = vector.transfer_read %arg0[%9#0, %10], %cst {in_bounds = [true]} : memref<16x16xf16>, vector<2xf16>
      %12 = affine.apply #map4(%9#0)
      %13 = vector.transfer_read %arg0[%12, %10], %cst {in_bounds = [true]} : memref<16x16xf16>, vector<2xf16>
      %14 = affine.apply #map4(%10)
      %15 = vector.transfer_read %arg0[%9#0, %14], %cst {in_bounds = [true]} : memref<16x16xf16>, vector<2xf16>
      %16 = vector.transfer_read %arg0[%12, %14], %cst {in_bounds = [true]} : memref<16x16xf16>, vector<2xf16>
      %cst_1 = arith.constant dense<0.000000e+00> : vector<4x2xf16>
      %17 = vector.insert %11, %cst_1 [0] : vector<2xf16> into vector<4x2xf16>
      %18 = vector.insert %13, %17 [1] : vector<2xf16> into vector<4x2xf16>
      %19 = vector.insert %15, %18 [2] : vector<2xf16> into vector<4x2xf16>
      %20 = vector.insert %16, %19 [3] : vector<2xf16> into vector<4x2xf16>
      %21 = vector.transfer_read %arg2[%9#0, %10], %cst {in_bounds = [true]} : memref<8x32xf16>, vector<2xf16>
      %22 = vector.transfer_read %arg2[%9#0, %14], %cst {in_bounds = [true]} : memref<8x32xf16>, vector<2xf16>
      %23 = affine.apply #map5()[%10]
      %24 = vector.transfer_read %arg2[%9#0, %23], %cst {in_bounds = [true]} : memref<8x32xf16>, vector<2xf16>
      %25 = affine.apply #map6()[%10]
      %26 = vector.transfer_read %arg2[%9#0, %25], %cst {in_bounds = [true]} : memref<8x32xf16>, vector<2xf16>
      %cst_2 = arith.constant dense<0.000000e+00> : vector<4x2xf16>
      %27 = vector.insert %21, %cst_2 [0] : vector<2xf16> into vector<4x2xf16>
      %28 = vector.insert %22, %27 [1] : vector<2xf16> into vector<4x2xf16>
      %29 = vector.insert %24, %28 [2] : vector<2xf16> into vector<4x2xf16>
      %30 = vector.insert %26, %29 [3] : vector<2xf16> into vector<4x2xf16>
      %cst_3 = arith.constant dense<0.000000e+00> : vector<2x2xf16>
      gpu.barrier
      %31 = nvgpu.mma.sp.sync(%20, %30, %cst_3) metadata(%8) {mmaShape = [16, 8, 32]} : (vector<4x2xf16>, vector<4x2xf16>, vector<2x2xf16>) -> vector<2x2xf16>
      %32 = vector.extract %31[0] : vector<2xf16> from vector<2x2xf16>
      %33 = vector.extract %31[1] : vector<2xf16> from vector<2x2xf16>
      vector.transfer_write %32, %arg3[%9#0, %10] {in_bounds = [true]} : vector<2xf16>, memref<16x8xf16>
      vector.transfer_write %33, %arg3[%12, %10] {in_bounds = [true]} : vector<2xf16>, memref<16x8xf16>
      gpu.return
    }
  }
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f16
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c8 = arith.constant 8 : index
    %c16 = arith.constant 16 : index
    %c32 = arith.constant 32 : index
    %c64 = arith.constant 64 : index
    %alloc = memref.alloc() : memref<16x16xf16>
    %alloc_0 = memref.alloc() : memref<8x32xf16>
    %alloc_1 = memref.alloc() : memref<16x8xf16>
    %alloc_2 = memref.alloc() : memref<16x2xi16>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      scf.for %arg1 = %c0 to %c16 step %c1 {
        %0 = arith.addi %arg0, %arg1 : index
        %1 = arith.addi %0, %c1 : index
        %2 = arith.index_cast %1 : index to i32
        %3 = arith.sitofp %2 : i32 to f16
        memref.store %3, %alloc[%arg0, %arg1] : memref<16x16xf16>
      }
    }
    %c-30584_i16 = arith.constant -30584 : i16
    scf.for %arg0 = %c0 to %c16 step %c1 {
      memref.store %c-30584_i16, %alloc_2[%arg0, %c0] : memref<16x2xi16>
      memref.store %c-30584_i16, %alloc_2[%arg0, %c1] : memref<16x2xi16>
    }
    scf.for %arg0 = %c0 to %c8 step %c1 {
      scf.for %arg1 = %c0 to %c32 step %c1 {
        %0 = arith.subi %arg0, %arg1 : index
        %1 = arith.index_cast %0 : index to i32
        %2 = arith.sitofp %1 : i32 to f16
        memref.store %2, %alloc_0[%arg0, %arg1] : memref<8x32xf16>
      }
    }
    scf.for %arg0 = %c0 to %c16 step %c1 {
      scf.for %arg1 = %c0 to %c8 step %c1 {
        memref.store %cst, %alloc_1[%arg0, %arg1] : memref<16x8xf16>
      }
    }
    scf.for %arg0 = %c0 to %c16 step %c1 {
      %0 = vector.transfer_read %alloc[%arg0, %c0], %cst : memref<16x16xf16>, vector<16xf16>
      vector.print %0 : vector<16xf16>
    }
    scf.for %arg0 = %c0 to %c8 step %c1 {
      %0 = vector.transfer_read %alloc_0[%arg0, %c0], %cst : memref<8x32xf16>, vector<32xf16>
      vector.print %0 : vector<32xf16>
    }
    %cast = memref.cast %alloc : memref<16x16xf16> to memref<*xf16>
    gpu.host_register %cast : memref<*xf16>
    %cast_3 = memref.cast %alloc_2 : memref<16x2xi16> to memref<*xi16>
    gpu.host_register %cast_3 : memref<*xi16>
    %cast_4 = memref.cast %alloc_0 : memref<8x32xf16> to memref<*xf16>
    gpu.host_register %cast_4 : memref<*xf16>
    %cast_5 = memref.cast %alloc_1 : memref<16x8xf16> to memref<*xf16>
    gpu.host_register %cast_5 : memref<*xf16>
    %c1_6 = arith.constant 1 : index
    %c32_7 = arith.constant 32 : index
    gpu.launch_func  @kernels::@mma_sp_sync_f16_16832 blocks in (%c1_6, %c1_6, %c1_6) threads in (%c32_7, %c1_6, %c1_6)  args(%alloc : memref<16x16xf16>, %alloc_2 : memref<16x2xi16>, %alloc_0 : memref<8x32xf16>, %alloc_1 : memref<16x8xf16>)
    gpu.host_unregister %cast : memref<*xf16>
    gpu.host_unregister %cast_3 : memref<*xi16>
    gpu.host_unregister %cast_4 : memref<*xf16>
    gpu.host_unregister %cast_5 : memref<*xf16>
    scf.for %arg0 = %c0 to %c16 step %c1 {
      %0 = vector.transfer_read %alloc_1[%arg0, %c0], %cst : memref<16x8xf16>, vector<8xf16>
      vector.print %0 : vector<8xf16>
    }
    return
  }
}

