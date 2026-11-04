module {
  memref.global "private" @bufferLhsGlobal : memref<64x8xf32, 3>
  memref.global "private" @bufferRhsGlobal : memref<8x128xf32, 3>
  func.func @main() {
    %c10000000 = arith.constant 10000000 : index
    %c6144 = arith.constant 6144 : index
    %c45 = arith.constant 45 : index
    %c7 = arith.constant 7 : index
    %c64 = arith.constant 64 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %c8 = arith.constant 8 : index
    %c128 = arith.constant 128 : index
    %cst = arith.constant 3.000000e+00 : f32
    %alloc = memref.alloc() : memref<64x8xf32>
    %alloc_0 = memref.alloc() : memref<8x128xf32>
    scf.for %arg0 = %c0 to %c8 step %c1 {
      scf.for %arg1 = %c0 to %c128 step %c1 {
        memref.store %cst, %alloc_0[%arg0, %arg1] : memref<8x128xf32>
      }
    }
    scf.for %arg0 = %c0 to %c64 step %c1 {
      scf.for %arg1 = %c0 to %c8 step %c1 {
        %3 = arith.index_cast %arg1 : index to i64
        %4 = arith.uitofp %3 : i64 to f32
        memref.store %4, %alloc[%arg0, %arg1] : memref<64x8xf32>
      }
    }
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] () : memref<64x8xf32>
    %memref_1, %asyncToken_2 = gpu.alloc async [%0] () : memref<8x128xf32>
    %1 = gpu.memcpy async [%0] %memref, %alloc : memref<64x8xf32>, memref<64x8xf32>
    %2 = gpu.memcpy async [%0] %memref_1, %alloc_0 : memref<8x128xf32>, memref<8x128xf32>
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c128, %arg10 = %c1, %arg11 = %c1) {
      %3 = memref.get_global @bufferLhsGlobal : memref<64x8xf32, 3>
      %4 = memref.get_global @bufferRhsGlobal : memref<8x128xf32, 3>
      linalg.copy ins(%memref : memref<64x8xf32>) outs(%3 : memref<64x8xf32, 3>)
      linalg.copy ins(%memref_1 : memref<8x128xf32>) outs(%4 : memref<8x128xf32, 3>)
      %thread_id_x = gpu.thread_id  x
      %5 = arith.cmpi eq, %thread_id_x, %c0 : index
      scf.if %5 {
        %6 = memref.load %3[%c45, %c7] : memref<64x8xf32, 3>
        %7 = memref.load %4[%c7, %c0] : memref<8x128xf32, 3>
        gpu.printf "[GPU] TMA LOADED lhs[45][7] %f\0A", %6 : f32
        gpu.printf "[GPU] TMA LOADED rhs[7][0] %f\0A", %7 : f32
      }
      gpu.terminator
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.nvgpu.rewrite_copy_as_tma %0 : (!transform.any_op) -> ()
      transform.yield 
    }
  }
}

