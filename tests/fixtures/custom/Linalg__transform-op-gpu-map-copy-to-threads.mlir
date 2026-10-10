module {
  func.func @copy_1d_8xf16(%arg0: tensor<8xf16>, %arg1: tensor<8xf16>) -> tensor<8xf16> {
    %0 = linalg.copy ins(%arg0 : tensor<8xf16>) outs(%arg1 : tensor<8xf16>) -> tensor<8xf16>
    return %0 : tensor<8xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 128 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @pad_1d_8xf16(%arg0: tensor<?xf16>, %arg1: index) -> tensor<8xf16> {
    %cst = arith.constant 0.000000e+00 : f16
    %padded = tensor.pad %arg0 low[0] high[%arg1] {
    ^bb0(%arg2: index):
      tensor.yield %cst : f16
    } : tensor<?xf16> to tensor<8xf16>
    return %padded : tensor<8xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["tensor.pad"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 128 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"tensor.pad">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_1d_16xf16(%arg0: tensor<16xf16>, %arg1: tensor<16xf16>) -> tensor<16xf16> {
    %0 = linalg.copy ins(%arg0 : tensor<16xf16>) outs(%arg1 : tensor<16xf16>) -> tensor<16xf16>
    return %0 : tensor<16xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 128 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_1d_20xf16(%arg0: tensor<20xf16>, %arg1: tensor<20xf16>) -> tensor<20xf16> {
    %0 = linalg.copy ins(%arg0 : tensor<20xf16>) outs(%arg1 : tensor<20xf16>) -> tensor<20xf16>
    return %0 : tensor<20xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 128 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_1d_20xf16(%arg0: tensor<20xf16>, %arg1: tensor<20xf16>) -> tensor<20xf16> {
    %0 = linalg.copy ins(%arg0 : tensor<20xf16>) outs(%arg1 : tensor<20xf16>) -> tensor<20xf16>
    return %0 : tensor<20xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 128 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_1d_128xf16(%arg0: tensor<128xf16>, %arg1: tensor<128xf16>) -> tensor<128xf16> {
    %0 = linalg.copy ins(%arg0 : tensor<128xf16>) outs(%arg1 : tensor<128xf16>) -> tensor<128xf16>
    return %0 : tensor<128xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 128 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_1d_256xf16(%arg0: tensor<256xf16>, %arg1: tensor<256xf16>) -> tensor<256xf16> {
    %0 = linalg.copy ins(%arg0 : tensor<256xf16>) outs(%arg1 : tensor<256xf16>) -> tensor<256xf16>
    return %0 : tensor<256xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 128 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_3d_16x32x64xi8(%arg0: tensor<16x32x64xi8>, %arg1: tensor<16x32x64xi8>) -> tensor<16x32x64xi8> {
    %0 = linalg.copy ins(%arg0 : tensor<16x32x64xi8>) outs(%arg1 : tensor<16x32x64xi8>) -> tensor<16x32x64xi8>
    return %0 : tensor<16x32x64xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 128 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_3d_16x32x64xi8(%arg0: tensor<16x32x64xi8>, %arg1: tensor<16x32x64xi8>) -> tensor<16x32x64xi8> {
    %0 = linalg.copy ins(%arg0 : tensor<16x32x64xi8>) outs(%arg1 : tensor<16x32x64xi8>) -> tensor<16x32x64xi8>
    return %0 : tensor<16x32x64xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 64 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_3d_4x8x16xi8(%arg0: tensor<4x8x16xi8>, %arg1: tensor<4x8x16xi8>) -> tensor<4x8x16xi8> {
    %0 = linalg.copy ins(%arg0 : tensor<4x8x16xi8>) outs(%arg1 : tensor<4x8x16xi8>) -> tensor<4x8x16xi8>
    return %0 : tensor<4x8x16xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 128 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_3d_4x8x16xi8(%arg0: tensor<4x8x16xi8>, %arg1: tensor<4x8x16xi8>) -> tensor<4x8x16xi8> {
    %0 = linalg.copy ins(%arg0 : tensor<4x8x16xi8>) outs(%arg1 : tensor<4x8x16xi8>) -> tensor<4x8x16xi8>
    return %0 : tensor<4x8x16xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 8 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_3d_3x5x7xi8(%arg0: tensor<3x5x7xi8>, %arg1: tensor<3x5x7xi8>) -> tensor<3x5x7xi8> {
    %0 = linalg.copy ins(%arg0 : tensor<3x5x7xi8>) outs(%arg1 : tensor<3x5x7xi8>) -> tensor<3x5x7xi8>
    return %0 : tensor<3x5x7xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 8 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_3d_16x15x5xi8(%arg0: tensor<16x15x5xi8>, %arg1: tensor<16x15x5xi8>) -> tensor<16x15x5xi8> {
    %0 = linalg.copy ins(%arg0 : tensor<16x15x5xi8>) outs(%arg1 : tensor<16x15x5xi8>) -> tensor<16x15x5xi8>
    return %0 : tensor<16x15x5xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 128 desired_bit_alignment = 8 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_3d_16x15x40xi8(%arg0: tensor<16x15x40xi8>, %arg1: tensor<16x15x40xi8>) -> tensor<16x15x40xi8> {
    %0 = linalg.copy ins(%arg0 : tensor<16x15x40xi8>) outs(%arg1 : tensor<16x15x40xi8>) -> tensor<16x15x40xi8>
    return %0 : tensor<16x15x40xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 128 desired_bit_alignment = 64 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_1d_1024xf16(%arg0: tensor<1024xf16>, %arg1: tensor<1024xf16>) -> tensor<1024xf16> {
    %0 = linalg.copy ins(%arg0 : tensor<1024xf16>) outs(%arg1 : tensor<1024xf16>) -> tensor<1024xf16>
    return %0 : tensor<1024xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 128 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_1d_257xf16(%arg0: tensor<257xf16>, %arg1: tensor<257xf16>) -> tensor<257xf16> {
    %0 = linalg.copy ins(%arg0 : tensor<257xf16>) outs(%arg1 : tensor<257xf16>) -> tensor<257xf16>
    return %0 : tensor<257xf16>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 128 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_1d_512xi8(%arg0: tensor<512xi8>, %arg1: tensor<512xi8>) -> tensor<512xi8> {
    %0 = linalg.copy ins(%arg0 : tensor<512xi8>) outs(%arg1 : tensor<512xi8>) -> tensor<512xi8>
    return %0 : tensor<512xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 8 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @copy_3d_16x32x64xi8(%arg0: tensor<16x32x64xi8>, %arg1: tensor<16x32x64xi8>) -> tensor<16x32x64xi8> {
    %0 = linalg.copy ins(%arg0 : tensor<16x32x64xi8>) outs(%arg1 : tensor<16x32x64xi8>) -> tensor<16x32x64xi8>
    return %0 : tensor<16x32x64xi8>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.copy"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %forall_op, %tiled_op = transform.structured.gpu.map_copy_to_threads %0 total_num_threads = 32 desired_bit_alignment = 8 : (!transform.any_op) -> (!transform.op<"scf.forall">, !transform.op<"linalg.copy">)
      transform.yield 
    }
  }
}

