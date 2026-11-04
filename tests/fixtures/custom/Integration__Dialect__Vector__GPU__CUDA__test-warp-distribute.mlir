module {
  func.func @gpu_func(%arg0: memref<32xf32>, %arg1: memref<32xf32>) {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %cst = arith.constant 0.000000e+00 : f32
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %c1, %arg9 = %c1, %arg10 = %c1) threads(%arg5, %arg6, %arg7) in (%arg11 = %c32, %arg12 = %c1, %arg13 = %c1) {
      gpu.warp_execute_on_lane_0(%arg5)[32] {
        %0 = vector.transfer_read %arg0[%c0], %cst {in_bounds = [true]} : memref<32xf32>, vector<32xf32>
        %1 = vector.transfer_read %arg1[%c0], %cst {in_bound = [true]} : memref<32xf32>, vector<32xf32>
        %2 = arith.addf %0, %1 : vector<32xf32>
        vector.transfer_write %2, %arg0[%c0] {in_bounds = [true]} : vector<32xf32>, memref<32xf32>
      }
      gpu.terminator
    }
    return
  }
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<32xf32>
    %alloc_0 = memref.alloc() : memref<32xf32>
    %cst_1 = arith.constant dense<[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01, 1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01, 2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01, 2.500000e+01, 2.600000e+01, 2.700000e+01, 2.800000e+01, 2.900000e+01, 3.000000e+01, 3.100000e+01]> : vector<32xf32>
    %cst_2 = arith.constant dense<2.000000e+00> : vector<32xf32>
    vector.transfer_write %cst_1, %alloc[%c0] {in_bounds = [true]} : vector<32xf32>, memref<32xf32>
    vector.transfer_write %cst_2, %alloc_0[%c0] {in_bounds = [true]} : vector<32xf32>, memref<32xf32>
    %cast = memref.cast %alloc : memref<32xf32> to memref<*xf32>
    gpu.host_register %cast : memref<*xf32>
    %cast_3 = memref.cast %alloc_0 : memref<32xf32> to memref<*xf32>
    gpu.host_register %cast_3 : memref<*xf32>
    call @gpu_func(%alloc, %alloc_0) : (memref<32xf32>, memref<32xf32>) -> ()
    %0 = vector.transfer_read %alloc[%c0], %cst : memref<32xf32>, vector<32xf32>
    vector.print %0 : vector<32xf32>
    return
  }
}

