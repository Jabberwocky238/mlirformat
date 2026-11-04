module {
  memref.global "private" @bufferLhsGlobal : memref<64x32xf32, #gpu.address_space<workgroup>>
  memref.global "private" @bufferRhsGlobal : memref<8x32xf32, #gpu.address_space<workgroup>>
  func.func @main() {
    %c1 = arith.constant 1 : index
    %c128 = arith.constant 128 : index
    %0 = gpu.wait async
    %memref, %asyncToken = gpu.alloc async [%0] () : memref<64x32xf32>
    %memref_0, %asyncToken_1 = gpu.alloc async [%0] () : memref<8x32xf32>
    gpu.launch blocks(%arg0, %arg1, %arg2) in (%arg6 = %c1, %arg7 = %c1, %arg8 = %c1) threads(%arg3, %arg4, %arg5) in (%arg9 = %c128, %arg10 = %c1, %arg11 = %c1) {
      %1 = memref.get_global @bufferLhsGlobal : memref<64x32xf32, #gpu.address_space<workgroup>>
      %2 = memref.get_global @bufferRhsGlobal : memref<8x32xf32, #gpu.address_space<workgroup>>
      linalg.copy ins(%memref : memref<64x32xf32>) outs(%1 : memref<64x32xf32, #gpu.address_space<workgroup>>)
      linalg.copy ins(%memref_0 : memref<8x32xf32>) outs(%2 : memref<8x32xf32, #gpu.address_space<workgroup>>)
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

