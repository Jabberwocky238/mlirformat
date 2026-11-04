module {
  func.func @gpu_func(%arg0: memref<1024xf32>, %arg1: memref<1xf32>) {
    %c1 = arith.constant 1 : index
    %cst = arith.constant dense<1.000000e+02> : vector<1xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c1024 = arith.constant 1024 : index
    %c32 = arith.constant 32 : index
    gpu.launch blocks(%arg2, %arg3, %arg4) in (%arg8 = %c1, %arg9 = %c1, %arg10 = %c1) threads(%arg5, %arg6, %arg7) in (%arg11 = %c32, %arg12 = %c1, %arg13 = %c1) {
      gpu.warp_execute_on_lane_0(%arg5)[32] {
        %0 = vector.transfer_read %arg1[%c0], %cst_0 {in_bounds = [true]} : memref<1xf32>, vector<1xf32>
        %1 = scf.for %arg14 = %c0 to %c1024 step %c32 iter_args(%arg15 = %0) -> (vector<1xf32>) {
          %3 = vector.transfer_read %arg0[%arg14], %cst_0 {in_bounds = [true]} : memref<1024xf32>, vector<32xf32>
          %4 = vector.reduction <add>, %3 : vector<32xf32> into f32
          %5 = vector.broadcast %4 : f32 to vector<1xf32>
          %6 = arith.addf %5, %arg15 : vector<1xf32>
          scf.yield %6 : vector<1xf32>
        }
        %2 = arith.divf %1, %cst : vector<1xf32>
        vector.transfer_write %2, %arg1[%c0] {in_bounds = [true]} : vector<1xf32>, memref<1xf32>
      }
      gpu.terminator
    }
    return
  }
  func.func @main() {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c32 = arith.constant 32 : index
    %c1024 = arith.constant 1024 : index
    %alloc = memref.alloc() : memref<1024xf32>
    %alloc_0 = memref.alloc() : memref<1xf32>
    %cst_1 = arith.constant dense<[0.000000e+00, 1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00, 9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01, 1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01, 1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01, 2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01, 2.500000e+01, 2.600000e+01, 2.700000e+01, 2.800000e+01, 2.900000e+01, 3.000000e+01, 3.100000e+01]> : vector<32xf32>
    %cst_2 = arith.constant dense<2.000000e+00> : vector<1xf32>
    scf.for %arg0 = %c0 to %c1024 step %c32 {
      vector.transfer_write %cst_1, %alloc[%arg0] {in_bounds = [true]} : vector<32xf32>, memref<1024xf32>
    }
    vector.transfer_write %cst_2, %alloc_0[%c0] {in_bounds = [true]} : vector<1xf32>, memref<1xf32>
    %cast = memref.cast %alloc : memref<1024xf32> to memref<*xf32>
    gpu.host_register %cast : memref<*xf32>
    %cast_3 = memref.cast %alloc_0 : memref<1xf32> to memref<*xf32>
    gpu.host_register %cast_3 : memref<*xf32>
    call @gpu_func(%alloc, %alloc_0) : (memref<1024xf32>, memref<1xf32>) -> ()
    %0 = vector.transfer_read %alloc_0[%c0], %cst : memref<1xf32>, vector<1xf32>
    vector.print %0 : vector<1xf32>
    return
  }
}

