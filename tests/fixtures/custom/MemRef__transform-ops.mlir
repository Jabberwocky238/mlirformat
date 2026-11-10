module {
  func.func @func(%arg0: index, %arg1: index) {
    scf.forall (%arg2, %arg3) in (%arg0, %arg1) {
      %cst = arith.constant 0.000000e+00 : f32
      %alloca = memref.alloca() : memref<2x32xf32>
      %alloca_0 = memref.alloca() : memref<2x32xf32>
      memref.store %cst, %alloca[%arg2, %arg3] : memref<2x32xf32>
      memref.store %cst, %alloca_0[%arg2, %arg3] : memref<2x32xf32>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["memref.alloca"]} in %arg0 : (!transform.any_op) -> !transform.op<"memref.alloca">
      %getGlobal, %global = transform.memref.alloca_to_global %0 : (!transform.op<"memref.alloca">) -> (!transform.any_op, !transform.any_op)
      transform.yield 
    }
  }
}

// -----
module {
  func.func @dead_alloc_escaped() -> memref<8x64xf32, 3> {
    %alloc = memref.alloc() : memref<8x64xf32, 3>
    return %alloc : memref<8x64xf32, 3>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.memref.erase_dead_alloc_and_stores %0 : (!transform.any_op) -> ()
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 * 64 + d1)>
module {
  func.func @dead_alloc() {
    %alloc = memref.alloc() : memref<8x64xf32, 3>
    %subview = memref.subview %alloc[0, 0] [8, 4] [1, 1] : memref<8x64xf32, 3> to memref<8x4xf32, #map, 3>
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<0.000000e+00> : vector<1x4xf32>
    vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<8x4xf32, #map, 3>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.memref.erase_dead_alloc_and_stores %0 : (!transform.any_op) -> ()
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 * 64 + d1)>
module {
  func.func @dead_alloca() {
    %alloca = memref.alloca() : memref<8x64xf32, 3>
    %subview = memref.subview %alloca[0, 0] [8, 4] [1, 1] : memref<8x64xf32, 3> to memref<8x4xf32, #map, 3>
    %c0 = arith.constant 0 : index
    %cst = arith.constant dense<0.000000e+00> : vector<1x4xf32>
    vector.transfer_write %cst, %subview[%c0, %c0] {in_bounds = [true, true]} : vector<1x4xf32>, memref<8x4xf32, #map, 3>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.memref.erase_dead_alloc_and_stores %0 : (!transform.any_op) -> ()
      transform.yield 
    }
  }
}

// -----
module {
  func.func @store_to_load(%arg0: vector<4xf32>) -> vector<4xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64xf32>
    vector.transfer_write %arg0, %alloc[%c0] {in_bounds = [true]} : vector<4xf32>, memref<64xf32>
    %0 = vector.transfer_read %alloc[%c0], %cst {in_bounds = [true]} : memref<64xf32>, vector<4xf32>
    return %0 : vector<4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.memref.erase_dead_alloc_and_stores %0 : (!transform.any_op) -> ()
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0)>
module {
  func.func @dead_store_through_subview(%arg0: vector<4xf32>) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64xf32>
    %subview = memref.subview %alloc[%c0] [4] [1] : memref<64xf32> to memref<4xf32, #map>
    vector.transfer_write %arg0, %subview[%c0] {in_bounds = [true]} : vector<4xf32>, memref<4xf32, #map>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.memref.erase_dead_alloc_and_stores %0 : (!transform.any_op) -> ()
      transform.yield 
    }
  }
}

// -----
module {
  func.func @dead_store_through_expand(%arg0: vector<4xf32>) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<64xf32>
    %expand_shape = memref.expand_shape %alloc [[0, 1]] output_shape [16, 4] : memref<64xf32> into memref<16x4xf32>
    vector.transfer_write %arg0, %expand_shape[%c0, %c0] {in_bounds = [true]} : vector<4xf32>, memref<16x4xf32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.memref.erase_dead_alloc_and_stores %0 : (!transform.any_op) -> ()
      transform.yield 
    }
  }
}

// -----
module {
  func.func @dead_store_through_collapse(%arg0: vector<4xf32>) {
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<16x4xf32>
    %collapse_shape = memref.collapse_shape %alloc [[0, 1]] : memref<16x4xf32> into memref<64xf32>
    vector.transfer_write %arg0, %collapse_shape[%c0] {in_bounds = [true]} : vector<4xf32>, memref<64xf32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.memref.erase_dead_alloc_and_stores %0 : (!transform.any_op) -> ()
      transform.yield 
    }
  }
}

// -----
module {
  func.func @lower_to_llvm() {
    %alloc = memref.alloc() : memref<2048xi8>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_conversion_patterns to %0 {
        transform.apply_conversion_patterns.dialect_to_llvm "memref"
      } with type_converter {
        transform.apply_conversion_patterns.memref.memref_to_llvm_type_converter
      } {legal_dialects = ["func", "llvm"]} : !transform.any_op
      transform.yield 
    }
  }
}

