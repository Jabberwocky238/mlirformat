module {
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.gpu.gpu_shuffle_to_amdgpu chipset = "gfx950"
      } : !transform.any_op
      transform.yield 
    }
  }
  func.func @gpu_shuffle_swizzle(%arg0: i32) -> (i32, i1) {
    %c64_i32 = arith.constant 64 : i32
    %c23_i32 = arith.constant 23 : i32
    %shuffleResult, %valid = gpu.shuffle  xor %arg0, %c23_i32, %c64_i32 : i32
    return %shuffleResult, %valid : i32, i1
  }
  func.func @gpu_shuffle_permlane_swap(%arg0: i32) -> (i32, i1) {
    %c64_i32 = arith.constant 64 : i32
    %c32_i32 = arith.constant 32 : i32
    %shuffleResult, %valid = gpu.shuffle  xor %arg0, %c32_i32, %c64_i32 : i32
    return %shuffleResult, %valid : i32, i1
  }
}

