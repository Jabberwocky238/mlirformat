module {
  func.func @set_anchor_layout(%arg0: memref<4096x4096xf16>) {
    %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x32xf16>
    %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<256x32xf16> -> vector<256x32xf16>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["xegpu.load_nd"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.xegpu.set_anchor_layout %0 sg_layout = [8, 4] sg_data = [32, 32] inst_data = [8, 16] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @set_anchor_layout_multiple(%arg0: memref<4096x4096xf16>) {
    %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x32xf16>
    xegpu.prefetch_nd %0[0, 0]  : !xegpu.tensor_desc<256x32xf16>
    xegpu.prefetch_nd %0[16, 0]  : !xegpu.tensor_desc<256x32xf16>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["xegpu.prefetch_nd"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.xegpu.set_anchor_layout %0 sg_layout = [8, 4] sg_data = [32, 32] inst_data = [8, 16] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @set_anchor_layout_param(%arg0: memref<4096x4096xf16>) {
    %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x32xf16>
    %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<256x32xf16> -> vector<256x32xf16>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["xegpu.load_nd"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.param.constant 8 : i64 -> !transform.param<i64>
      transform.xegpu.set_anchor_layout %0 sg_layout = [%1, 4] sg_data = [32, 32] inst_data = [8, 16] : !transform.any_op, !transform.param<i64>
      transform.yield 
    }
  }
}

// -----
module {
  func.func @set_anchor_layout_param2(%arg0: memref<4096x4096xf16>) {
    %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x32xf16>
    %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<256x32xf16> -> vector<256x32xf16>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["xegpu.load_nd"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.param.constant 8 : i64 -> !transform.param<i64>
      %2 = transform.param.constant 4 : i64 -> !transform.param<i64>
      transform.xegpu.set_anchor_layout %0 sg_layout = [%1, %2] sg_data = [32, 32] inst_data = [8, 16] : !transform.any_op, !transform.param<i64>, !transform.param<i64>
      transform.yield 
    }
  }
}

// -----
module {
  func.func @set_anchor_layout_slice(%arg0: memref<4096xf32>) {
    %cst = arith.constant dense<true> : vector<256xi1>
    %0 = vector.step : vector<256xindex>
    %intptr = memref.extract_aligned_pointer_as_index %arg0 : memref<4096xf32> -> index
    %1 = arith.index_cast %intptr : index to i64
    %2 = xegpu.load %1[%0], %cst  : i64, vector<256xindex>, vector<256xi1> -> vector<256xf32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["xegpu.load"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.xegpu.set_anchor_layout %0 sg_layout = [8, 8] sg_data = [32, 32] inst_data = [8, 16] slice_dims = [0] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @set_anchor_layout_order(%arg0: memref<4096x4096xf16>) {
    %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x32xf16>
    %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<256x32xf16> -> vector<256x32xf16>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["xegpu.load_nd"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.xegpu.set_anchor_layout %0 sg_layout = [8, 4] sg_data = [32, 32] inst_data = [8, 16] order = [1, 0] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @set_anchor_layout_dpas_a(%arg0: memref<4096x4096xf16>, %arg1: memref<4096x4096xf16>, %arg2: memref<4096x4096xf16>) {
    %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x32xf16>
    %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<256x32xf16> -> vector<256x32xf16>
    %2 = xegpu.create_nd_tdesc %arg1 : memref<4096x4096xf16> -> !xegpu.tensor_desc<32x256xf16>
    %3 = xegpu.load_nd %2[0, 0]  : !xegpu.tensor_desc<32x256xf16> -> vector<32x256xf16>
    %4 = xegpu.create_nd_tdesc %arg2 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x256xf16>
    %5 = xegpu.load_nd %4[0, 0]  : !xegpu.tensor_desc<256x256xf16> -> vector<256x256xf16>
    %6 = xegpu.dpas %1, %3, %5 : vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf16> -> vector<256x256xf16>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["xegpu.dpas"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.xegpu.set_anchor_layout %0 sg_layout = [8, 8] sg_data = [32, 32] inst_data = [8, 16] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @set_anchor_layout_dpas_b(%arg0: memref<4096x4096xf16>, %arg1: memref<4096x4096xf16>, %arg2: memref<4096x4096xf16>) {
    %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x32xf16>
    %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<256x32xf16> -> vector<256x32xf16>
    %2 = xegpu.create_nd_tdesc %arg1 : memref<4096x4096xf16> -> !xegpu.tensor_desc<32x256xf16>
    %3 = xegpu.load_nd %2[0, 0]  : !xegpu.tensor_desc<32x256xf16> -> vector<32x256xf16>
    %4 = xegpu.create_nd_tdesc %arg2 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x256xf16>
    %5 = xegpu.load_nd %4[0, 0]  : !xegpu.tensor_desc<256x256xf16> -> vector<256x256xf16>
    %6 = xegpu.dpas %1, %3, %5 : vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf16> -> vector<256x256xf16>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["xegpu.dpas"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.xegpu.set_anchor_layout %0 index = 1 sg_layout = [8, 8] sg_data = [32, 32] inst_data = [16, 16] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @set_anchor_layout_dpas_c(%arg0: memref<4096x4096xf16>, %arg1: memref<4096x4096xf16>, %arg2: memref<4096x4096xf16>) {
    %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x32xf16>
    %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<256x32xf16> -> vector<256x32xf16>
    %2 = xegpu.create_nd_tdesc %arg1 : memref<4096x4096xf16> -> !xegpu.tensor_desc<32x256xf16>
    %3 = xegpu.load_nd %2[0, 0]  : !xegpu.tensor_desc<32x256xf16> -> vector<32x256xf16>
    %4 = xegpu.create_nd_tdesc %arg2 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x256xf16>
    %5 = xegpu.load_nd %4[0, 0]  : !xegpu.tensor_desc<256x256xf16> -> vector<256x256xf16>
    %6 = xegpu.dpas %1, %3, %5 : vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf16> -> vector<256x256xf16>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["xegpu.dpas"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.xegpu.set_anchor_layout %0 index = 2 sg_layout = [8, 8] sg_data = [32, 32] inst_data = [8, 16] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @set_gpu_launch_threads(%arg0: memref<4096x4096xf16>) {
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %c16, %arg8 = %c16, %arg9 = %c1) threads(%arg4, %arg5, %arg6) in (%arg10 = %c1, %arg11 = %c1, %arg12 = %c1) {
      gpu.terminator
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["gpu.launch"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.xegpu.set_gpu_launch_threads %0 threads = [8, 4, 1] : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @set_gpu_launch_threads_param(%arg0: memref<4096x4096xf16>) {
    %c1 = arith.constant 1 : index
    %c16 = arith.constant 16 : index
    gpu.launch blocks(%arg1, %arg2, %arg3) in (%arg7 = %c16, %arg8 = %c16, %arg9 = %c1) threads(%arg4, %arg5, %arg6) in (%arg10 = %c1, %arg11 = %c1, %arg12 = %c1) {
      gpu.terminator
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["gpu.launch"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.param.constant 4 : i64 -> !transform.param<i64>
      transform.xegpu.set_gpu_launch_threads %0 threads = [8, %1, 1] : !transform.any_op, !transform.param<i64>
      transform.yield 
    }
  }
}

// -----
module {
  func.func @insert_prefetch_dpas_a(%arg0: memref<4096x4096xf16>, %arg1: memref<4096x4096xf16>, %arg2: memref<4096x4096xf16>) {
    %c32 = arith.constant 32 : index
    %c4096 = arith.constant 4096 : index
    %c0 = arith.constant 0 : index
    %0 = xegpu.create_nd_tdesc %arg2 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x256xf16>
    %1 = xegpu.load_nd %0[%c0, %c0]  : !xegpu.tensor_desc<256x256xf16> -> vector<256x256xf16>
    %2 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x32xf16>
    %3 = xegpu.create_nd_tdesc %arg1 : memref<4096x4096xf16> -> !xegpu.tensor_desc<32x256xf16>
    %4 = scf.for %arg3 = %c0 to %c4096 step %c32 iter_args(%arg4 = %1) -> (vector<256x256xf16>) {
      %5 = xegpu.load_nd %2[%c0, %arg3]  : !xegpu.tensor_desc<256x32xf16> -> vector<256x32xf16>
      %6 = xegpu.load_nd %3[%arg3, %c0]  : !xegpu.tensor_desc<32x256xf16> -> vector<32x256xf16>
      %7 = xegpu.dpas %5, %6, %arg4 : vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf16> -> vector<256x256xf16>
      scf.yield %7 : vector<256x256xf16>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["xegpu.dpas"]} in %0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.get_operand %1[0] : (!transform.any_op) -> !transform.any_value
      %3 = transform.xegpu.get_load_op %2 : (!transform.any_value) -> !transform.any_op
      %4 = transform.xegpu.insert_prefetch %3 nb_prefetch = 1 : (!transform.any_op) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.canonicalization
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @insert_prefetch_dpas_a_nb_param2(%arg0: memref<4096x4096xf16>, %arg1: memref<4096x4096xf16>, %arg2: memref<4096x4096xf16>) {
    %c32 = arith.constant 32 : index
    %c4096 = arith.constant 4096 : index
    %c0 = arith.constant 0 : index
    %0 = xegpu.create_nd_tdesc %arg2 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x256xf16>
    %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<256x256xf16> -> vector<256x256xf16>
    %2 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x32xf16>
    %3 = xegpu.create_nd_tdesc %arg1 : memref<4096x4096xf16> -> !xegpu.tensor_desc<32x256xf16>
    %4 = scf.for %arg3 = %c0 to %c4096 step %c32 iter_args(%arg4 = %1) -> (vector<256x256xf16>) {
      %5 = xegpu.load_nd %2[0, %arg3]  : !xegpu.tensor_desc<256x32xf16> -> vector<256x32xf16>
      %6 = xegpu.load_nd %3[%arg3, 0]  : !xegpu.tensor_desc<32x256xf16> -> vector<32x256xf16>
      %7 = xegpu.dpas %5, %6, %arg4 : vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf16> -> vector<256x256xf16>
      scf.yield %7 : vector<256x256xf16>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["xegpu.dpas"]} in %0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.get_operand %1[0] : (!transform.any_op) -> !transform.any_value
      %3 = transform.xegpu.get_load_op %2 : (!transform.any_value) -> !transform.any_op
      %4 = transform.param.constant 2 : i64 -> !transform.param<i64>
      %5 = transform.xegpu.insert_prefetch %3 nb_prefetch = %4 : (!transform.any_op, !transform.param<i64>) -> !transform.any_op
      transform.apply_patterns to %0 {
        transform.apply_patterns.canonicalization
      } : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @convert_layout_a(%arg0: memref<4096x4096xf16>, %arg1: memref<4096x4096xf16>, %arg2: memref<4096x4096xf16>) {
    %c0 = arith.constant 0 : index
    %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [32, 16], order = [1, 0]>>
    %1 = xegpu.load_nd %0[%c0, %c0]  : !xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [32, 16], order = [1, 0]>> -> vector<256x32xf16>
    %2 = xegpu.create_nd_tdesc %arg1 : memref<4096x4096xf16> -> !xegpu.tensor_desc<32x256xf16>
    %3 = xegpu.load_nd %2[%c0, %c0]  : !xegpu.tensor_desc<32x256xf16> -> vector<32x256xf16>
    %4 = xegpu.create_nd_tdesc %arg2 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x256xf16>
    %5 = xegpu.load_nd %4[%c0, %c0]  : !xegpu.tensor_desc<256x256xf16> -> vector<256x256xf16>
    %6 = xegpu.dpas %1, %3, %5 : vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf16> -> vector<256x256xf16>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["xegpu.dpas"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_operand %0[0] : (!transform.any_op) -> !transform.any_value
      %2 = transform.xegpu.convert_layout %1 input_sg_layout = [8, 4] input_sg_data = [32, 32] input_inst_data = [32, 16] input_order = [1, 0] target_sg_layout = [8, 4] target_sg_data = [32, 32] target_inst_data = [8, 16] target_order = [1, 0] : (!transform.any_value) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @convert_layout_a_sg_param(%arg0: memref<4096x4096xf16>, %arg1: memref<4096x4096xf16>, %arg2: memref<4096x4096xf16>) {
    %c0 = arith.constant 0 : index
    %0 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [32, 16]>>
    %1 = xegpu.load_nd %0[%c0, %c0]  : !xegpu.tensor_desc<256x32xf16, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [32, 16]>> -> vector<256x32xf16>
    %2 = xegpu.create_nd_tdesc %arg1 : memref<4096x4096xf16> -> !xegpu.tensor_desc<32x256xf16>
    %3 = xegpu.load_nd %2[%c0, %c0]  : !xegpu.tensor_desc<32x256xf16> -> vector<32x256xf16>
    %4 = xegpu.create_nd_tdesc %arg2 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x256xf16>
    %5 = xegpu.load_nd %4[%c0, %c0]  : !xegpu.tensor_desc<256x256xf16> -> vector<256x256xf16>
    %6 = xegpu.dpas %1, %3, %5 : vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf16> -> vector<256x256xf16>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["xegpu.dpas"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.get_operand %0[0] : (!transform.any_op) -> !transform.any_value
      %2 = transform.param.constant 8 : i64 -> !transform.param<i64>
      %3 = transform.xegpu.convert_layout %1 input_sg_layout = [%2, 4] input_sg_data = [32, 32] input_inst_data = [32, 16] target_sg_layout = [%2, 4] target_sg_data = [32, 32] target_inst_data = [8, 16] : (!transform.any_value, !transform.param<i64>, !transform.param<i64>) -> !transform.any_op
      transform.yield 
    }
  }
}

