module {
  func.func @hoist_basic_vector_xfer_pair(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg4 = %arg1 to %arg2 step %arg3 {
      %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<?x?xf32>, vector<1xf32>
      %1 = "val_use"(%0) : (vector<1xf32>) -> vector<1xf32>
      vector.transfer_write %1, %arg0[%c0, %c0] : vector<1xf32>, memref<?x?xf32>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @negative_hoist_basic_vector_xfer_pair_extra_write(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: vector<1xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg5 = %arg1 to %arg2 step %arg3 {
      vector.transfer_write %arg4, %arg0[%c0, %c0] : vector<1xf32>, memref<?x?xf32>
      %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<?x?xf32>, vector<1xf32>
      %1 = "val_use"(%0) : (vector<1xf32>) -> vector<1xf32>
      vector.transfer_write %1, %arg0[%c0, %c0] : vector<1xf32>, memref<?x?xf32>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @negative_hoist_basic_vector_xfer_pair_extra_write_into_alias(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: vector<1xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %subview = memref.subview %arg0[0, 0] [1, 1] [1, 1] : memref<?x?xf32> to memref<1x1xf32, strided<[?, 1]>>
    scf.for %arg5 = %arg1 to %arg2 step %arg3 {
      vector.transfer_write %arg4, %subview[%c0, %c0] : vector<1xf32>, memref<1x1xf32, strided<[?, 1]>>
      %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<?x?xf32>, vector<1xf32>
      %1 = "val_use"(%0) : (vector<1xf32>) -> vector<1xf32>
      vector.transfer_write %1, %arg0[%c0, %c0] : vector<1xf32>, memref<?x?xf32>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @hoist_basic_vector_xfer_pair_with_assume_align(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: vector<1xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %assume_align = memref.assume_alignment %arg0, 4 : memref<?x?xf32>
    scf.for %arg5 = %arg1 to %arg2 step %arg3 {
      %0 = vector.transfer_read %assume_align[%c0, %c0], %cst : memref<?x?xf32>, vector<1xf32>
      %1 = "val_use"(%0) : (vector<1xf32>) -> vector<1xf32>
      vector.transfer_write %1, %assume_align[%c0, %c0] : vector<1xf32>, memref<?x?xf32>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @negative_hoist_basic_vector_xfer_pair_with_assume_align(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: vector<1xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    %assume_align = memref.assume_alignment %arg0, 4 : memref<?x?xf32>
    scf.for %arg5 = %arg1 to %arg2 step %arg3 {
      %0 = vector.transfer_read %assume_align[%c0, %c0], %cst : memref<?x?xf32>, vector<1xf32>
      "mem_use"(%arg0) : (memref<?x?xf32>) -> ()
      vector.transfer_write %0, %assume_align[%c0, %c0] : vector<1xf32>, memref<?x?xf32>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @mem_use_outside(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg4 = %arg1 to %arg2 step %arg3 {
      scf.for %arg5 = %arg1 to %arg2 step %arg3 {
        %0 = vector.transfer_read %arg0[%arg4, %arg4], %cst : memref<?x?xf32>, vector<1xf32>
        %1 = "val_use"(%0) : (vector<1xf32>) -> vector<1xf32>
        vector.transfer_write %1, %arg0[%arg4, %arg4] : vector<1xf32>, memref<?x?xf32>
      }
    }
    "mem_use"(%arg0) : (memref<?x?xf32>) -> ()
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @mem_use_inside_outer_loop(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg4 = %arg1 to %arg2 step %arg3 {
      scf.for %arg5 = %arg1 to %arg2 step %arg3 {
        %0 = vector.transfer_read %arg0[%arg4, %arg4], %cst : memref<?x?xf32>, vector<1xf32>
        %1 = "val_use"(%0) : (vector<1xf32>) -> vector<1xf32>
        vector.transfer_write %1, %arg0[%arg4, %arg4] : vector<1xf32>, memref<?x?xf32>
      }
      "mem_use"(%arg0) : (memref<?x?xf32>) -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @negative_mem_use_inside_inner_loop_before_write(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg4 = %arg1 to %arg2 step %arg3 {
      scf.for %arg5 = %arg1 to %arg2 step %arg3 {
        %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<?x?xf32>, vector<1xf32>
        %1 = "val_use"(%0) : (vector<1xf32>) -> vector<1xf32>
        "mem_use"(%arg0) : (memref<?x?xf32>) -> ()
        vector.transfer_write %1, %arg0[%c0, %c0] : vector<1xf32>, memref<?x?xf32>
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @negative_mem_use_inside_inner_loop_after_write(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg4 = %arg1 to %arg2 step %arg3 {
      scf.for %arg5 = %arg1 to %arg2 step %arg3 {
        %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<?x?xf32>, vector<1xf32>
        %1 = "val_use"(%0) : (vector<1xf32>) -> vector<1xf32>
        vector.transfer_write %1, %arg0[%c0, %c0] : vector<1xf32>, memref<?x?xf32>
        "mem_use"(%arg0) : (memref<?x?xf32>) -> ()
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @negative_mem_use_inside_inner_loop_before_read(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg4 = %arg1 to %arg2 step %arg3 {
      scf.for %arg5 = %arg1 to %arg2 step %arg3 {
        "mem_use"(%arg0) : (memref<?x?xf32>) -> ()
        %0 = vector.transfer_read %arg0[%c0, %c0], %cst : memref<?x?xf32>, vector<1xf32>
        %1 = "val_use"(%0) : (vector<1xf32>) -> vector<1xf32>
        vector.transfer_write %1, %arg0[%c0, %c0] : vector<1xf32>, memref<?x?xf32>
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @hoist_vector_transfer_pairs_disjoint(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>, %arg3: memref<?x?xf32>, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: i1) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg10 = %arg5 to %arg6 step %arg7 {
      scf.for %arg11 = %arg5 to %arg6 step %arg7 {
        %0 = vector.transfer_read %arg1[%c0, %c0], %cst : memref<?x?xf32>, vector<2xf32>
        %1 = vector.transfer_read %arg1[%c0, %c1], %cst : memref<?x?xf32>, vector<2xf32>
        %2 = vector.transfer_read %arg2[%c0, %c0], %cst : memref<?x?xf32>, vector<3xf32>
        %3 = vector.transfer_read %arg2[%c0, %c3], %cst : memref<?x?xf32>, vector<3xf32>
        %4 = vector.transfer_read %arg3[%c0, %arg8], %cst : memref<?x?xf32>, vector<4xf32>
        %5 = vector.transfer_read %arg3[%c1, %arg8], %cst : memref<?x?xf32>, vector<4xf32>
        %6 = vector.transfer_read %arg0[%arg10, %arg10], %cst : memref<?x?xf32>, vector<2xf32>
        %7 = vector.transfer_read %arg0[%arg8, %arg8], %cst : memref<?x?xf32>, vector<2xf32>
        %8 = "some_use"(%0) : (vector<2xf32>) -> vector<2xf32>
        %9 = "some_use"(%1) : (vector<2xf32>) -> vector<2xf32>
        %10 = "some_use"(%2) : (vector<3xf32>) -> vector<3xf32>
        %11 = "some_use"(%3) : (vector<3xf32>) -> vector<3xf32>
        %12 = "some_use"(%4) : (vector<4xf32>) -> vector<4xf32>
        %13 = "some_use"(%5) : (vector<4xf32>) -> vector<4xf32>
        %14 = "some_use"(%6) : (vector<2xf32>) -> vector<2xf32>
        %15 = "some_use"(%7) : (vector<2xf32>) -> vector<2xf32>
        vector.transfer_write %8, %arg1[%c0, %c0] : vector<2xf32>, memref<?x?xf32>
        vector.transfer_write %9, %arg1[%c0, %c1] : vector<2xf32>, memref<?x?xf32>
        vector.transfer_write %10, %arg2[%c0, %c0] : vector<3xf32>, memref<?x?xf32>
        vector.transfer_write %11, %arg2[%c0, %c3] : vector<3xf32>, memref<?x?xf32>
        vector.transfer_write %12, %arg3[%c0, %arg8] : vector<4xf32>, memref<?x?xf32>
        vector.transfer_write %13, %arg3[%c1, %arg8] : vector<4xf32>, memref<?x?xf32>
        vector.transfer_write %14, %arg0[%arg10, %arg10] : vector<2xf32>, memref<?x?xf32>
        vector.transfer_write %15, %arg0[%arg8, %arg8] : vector<2xf32>, memref<?x?xf32>
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (0)>
module {
  func.func @hoist_vector_transfer_pairs_in_affine_loops(%arg0: memref<64x64xi32>, %arg1: memref<64x64xi32>, %arg2: memref<64x64xi32>) {
    %c0_i32 = arith.constant 0 : i32
    affine.for %arg3 = 0 to 64 {
      affine.for %arg4 = 0 to 64 step 16 {
        affine.for %arg5 = 0 to 64 {
          %0 = vector.transfer_read %arg0[%arg3, %arg5], %c0_i32 {permutation_map = #map} : memref<64x64xi32>, vector<16xi32>
          %1 = vector.transfer_read %arg1[%arg5, %arg4], %c0_i32 : memref<64x64xi32>, vector<16xi32>
          %2 = vector.transfer_read %arg2[%arg3, %arg4], %c0_i32 : memref<64x64xi32>, vector<16xi32>
          %3 = arith.muli %0, %1 : vector<16xi32>
          %4 = arith.addi %2, %3 : vector<16xi32>
          vector.transfer_write %4, %arg2[%arg3, %arg4] : vector<16xi32>, memref<64x64xi32>
        }
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @hoist_vector_transfer_read() {
    %c0 = arith.constant 0 : index
    %c128 = arith.constant 128 : index
    %c1024 = arith.constant 1024 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<32x64xf32>
    %alloc_0 = memref.alloc() : memref<32x128xf32>
    %subview = memref.subview %alloc_0[%c0, %c0] [32, 128] [1, 1] : memref<32x128xf32> to memref<32x128xf32, strided<[128, 1], offset: ?>>
    scf.for %arg0 = %c0 to %c1024 step %c128 {
      %0 = vector.transfer_read %alloc_0[%c0, %c0], %cst {in_bounds = [true, true]} : memref<32x128xf32>, vector<32x128xf32>
      %1 = vector.transfer_read %alloc[%c0, %c0], %cst {in_bounds = [true, true]} : memref<32x64xf32>, vector<32x64xf32>
      "some_use"(%1, %0, %subview) : (vector<32x64xf32>, vector<32x128xf32>, memref<32x128xf32, strided<[128, 1], offset: ?>>) -> ()
    }
    memref.dealloc %alloc : memref<32x64xf32>
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
module {
  func.func @non_matching_transfers(%arg0: memref<6x1x7x32xf32>) {
    %c0 = arith.constant 0 : index
    %c1024 = arith.constant 1024 : index
    %c128 = arith.constant 128 : index
    %cst = arith.constant dense<5.500000e+00> : vector<6x7x32xf32>
    %cst_0 = arith.constant 0.000000e+00 : f32
    scf.for %arg1 = %c0 to %c1024 step %c128 {
      %0 = vector.transfer_read %arg0[%c0, %c0, %c0, %c0], %cst_0 {in_bounds = [true, true, true], permutation_map = #map} : memref<6x1x7x32xf32>, vector<6x7x32xf32>
      %1 = arith.addf %0, %cst : vector<6x7x32xf32>
      %2 = vector.broadcast %1 : vector<6x7x32xf32> to vector<1x6x7x32xf32>
      %3 = vector.transpose %2, [1, 0, 2, 3] : vector<1x6x7x32xf32> to vector<6x1x7x32xf32>
      vector.transfer_write %3, %arg0[%c0, %c0, %c0, %c0] {in_bounds = [true, true, true, true]} : vector<6x1x7x32xf32>, memref<6x1x7x32xf32>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @no_hoisting_unknown_bound_loop(%arg0: memref<20xi32>, %arg1: index, %arg2: index) {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.for %arg3 = %arg1 to %arg2 step %c1 {
      %0 = vector.transfer_read %arg0[%c0], %c0_i32 {in_bounds = [true]} : memref<20xi32>, vector<4xi32>
      "test.some_use"(%0) : (vector<4xi32>) -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 {verify_non_zero_trip} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0, 8)>
#map1 = affine_map<(d0) -> (d0, 4)>
module {
  func.func @no_hoisting_possibly_zero_trip_loop(%arg0: memref<20xi32>, %arg1: index, %arg2: index) {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = affine.min #map(%arg1)
    %1 = affine.max #map1(%arg2)
    scf.for %arg3 = %0 to %1 step %c1 {
      %2 = vector.transfer_read %arg0[%c0], %c0_i32 {in_bounds = [true]} : memref<20xi32>, vector<4xi32>
      "test.some_use"(%2) : (vector<4xi32>) -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 {verify_non_zero_trip} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0, 8)>
module {
  func.func @no_hoisting_possibly_zero_trip_loop_eq_lb_and_ub(%arg0: memref<20xi32>, %arg1: index, %arg2: index) {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = affine.min #map(%arg1)
    %1 = affine.max #map(%arg2)
    scf.for %arg3 = %0 to %1 step %c1 {
      %2 = vector.transfer_read %arg0[%c0], %c0_i32 {in_bounds = [true]} : memref<20xi32>, vector<4xi32>
      "test.some_use"(%2) : (vector<4xi32>) -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 {verify_non_zero_trip} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0, 4)>
#map1 = affine_map<(d0) -> (d0, 8)>
module {
  func.func @hoisting_non_zero_trip_loop(%arg0: memref<20xi32>, %arg1: index, %arg2: index) {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = affine.min #map(%arg1)
    %1 = affine.max #map1(%arg2)
    scf.for %arg3 = %0 to %1 step %c1 {
      %2 = vector.transfer_read %arg0[%c0], %c0_i32 {in_bounds = [true]} : memref<20xi32>, vector<4xi32>
      "test.some_use"(%2) : (vector<4xi32>) -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 {verify_non_zero_trip} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @no_hoisting_collapse_shape(%arg0: memref<1x20x1xi32>, %arg1: memref<9x1xi32>, %arg2: vector<4xi32>) {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c20 = arith.constant 20 : index
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<1x4x1xi32>
    scf.for %arg3 = %c0 to %c20 step %c4 {
      %subview = memref.subview %arg0[0, %arg3, 0] [1, 4, 1] [1, 1, 1] : memref<1x20x1xi32> to memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>
      %collapse_shape = memref.collapse_shape %alloca [[0, 1, 2]] : memref<1x4x1xi32> into memref<4xi32>
      vector.transfer_write %arg2, %collapse_shape[%c0] {in_bounds = [true]} : vector<4xi32>, memref<4xi32>
      %0 = vector.transfer_read %alloca[%c0, %c0, %c0], %c0_i32 {in_bounds = [true, true, true]} : memref<1x4x1xi32>, vector<1x4x1xi32>
      vector.transfer_write %0, %subview[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<1x4x1xi32>, memref<1x4x1xi32, strided<[20, 1, 1], offset: ?>>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @no_hoisting_collapse_shape_2(%arg0: vector<1x12x1xi32>) {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c20 = arith.constant 20 : index
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<1x12x1xi32>
    scf.for %arg1 = %c0 to %c20 step %c4 {
      %collapse_shape = memref.collapse_shape %alloca [[0, 1, 2]] : memref<1x12x1xi32> into memref<12xi32>
      vector.transfer_write %arg0, %alloca[%c0, %c0, %c0] {in_bounds = [true, true, true]} : vector<1x12x1xi32>, memref<1x12x1xi32>
      %0 = vector.transfer_read %collapse_shape[%c0], %c0_i32 {in_bounds = [true]} : memref<12xi32>, vector<12xi32>
      "test.some_use"(%0) : (vector<12xi32>) -> ()
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @no_hoisting_write_to_buffer(%arg0: i32, %arg1: vector<1xi32>) {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c20 = arith.constant 20 : index
    %alloca = memref.alloca() {alignment = 64 : i64} : memref<1x1x2xi32>
    %cast = memref.cast %alloca : memref<1x1x2xi32> to memref<1x1x2xi32>
    %collapse_shape = memref.collapse_shape %alloca [[0, 1, 2]] : memref<1x1x2xi32> into memref<2xi32>
    scf.for %arg2 = %c0 to %c20 step %c4 {
      %collapse_shape_0 = memref.collapse_shape %alloca [[0, 1, 2]] : memref<1x1x2xi32> into memref<2xi32>
      %0 = vector.transfer_read %collapse_shape[%c0], %c0_i32 {in_bounds = [true]} : memref<2xi32>, vector<1xi32>
      %1 = vector.transfer_read %collapse_shape_0[%c0], %c0_i32 {in_bounds = [true]} : memref<2xi32>, vector<1xi32>
      %2 = vector.outerproduct %0, %arg0, %1 {kind = #vector.kind<add>} : vector<1xi32>, i32
      vector.transfer_write %2, %collapse_shape[%c0] {in_bounds = [true]} : vector<1xi32>, memref<2xi32>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0 + 4)>
module {
  func.func @hoist_vector_transfer_pairs_disjoint_dynamic(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.apply #map(%arg4)
    %1 = affine.apply #map1(%arg4)
    scf.for %arg5 = %arg1 to %arg2 step %arg3 {
      scf.for %arg6 = %arg1 to %arg2 step %arg3 {
        %2 = vector.transfer_read %arg0[%arg4, %arg4], %cst : memref<?x?xf32>, vector<4xf32>
        %3 = vector.transfer_read %arg0[%0, %arg4], %cst : memref<?x?xf32>, vector<4xf32>
        %4 = vector.transfer_read %arg0[%0, %1], %cst : memref<?x?xf32>, vector<4xf32>
        %5 = "some_use"(%2) : (vector<4xf32>) -> vector<4xf32>
        %6 = "some_use"(%3) : (vector<4xf32>) -> vector<4xf32>
        %7 = "some_use"(%4) : (vector<4xf32>) -> vector<4xf32>
        vector.transfer_write %5, %arg0[%arg4, %arg4] : vector<4xf32>, memref<?x?xf32>
        vector.transfer_write %6, %arg0[%0, %arg4] : vector<4xf32>, memref<?x?xf32>
        vector.transfer_write %7, %arg0[%0, %1] : vector<4xf32>, memref<?x?xf32>
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> (d0 + 3)>
module {
  func.func @hoist_vector_transfer_pairs_overlapping_dynamic(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.apply #map(%arg4)
    scf.for %arg5 = %arg1 to %arg2 step %arg3 {
      scf.for %arg6 = %arg1 to %arg2 step %arg3 {
        %1 = vector.transfer_read %arg0[%arg4, %arg4], %cst : memref<?x?xf32>, vector<4xf32>
        %2 = vector.transfer_read %arg0[%arg4, %0], %cst : memref<?x?xf32>, vector<4xf32>
        %3 = "some_use"(%1) : (vector<4xf32>) -> vector<4xf32>
        %4 = "some_use"(%2) : (vector<4xf32>) -> vector<4xf32>
        vector.transfer_write %3, %arg0[%arg4, %arg4] : vector<4xf32>, memref<?x?xf32>
        vector.transfer_write %4, %arg0[%arg4, %0] : vector<4xf32>, memref<?x?xf32>
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0) -> ((d0 floordiv 32) * 16)>
#map1 = affine_map<(d0) -> ((d0 floordiv 32) * 16 + 8)>
#map2 = affine_map<(d0) -> ((d0 floordiv 32) * 16 + 16)>
module {
  func.func @hoist_vector_transfer_pairs_disjoint_dynamic(%arg0: memref<?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.apply #map(%arg5)
    %1 = affine.apply #map1(%arg5)
    %2 = affine.apply #map2(%arg5)
    scf.for %arg6 = %arg1 to %arg2 step %arg3 {
      scf.for %arg7 = %arg1 to %arg2 step %arg3 {
        %3 = vector.transfer_read %arg0[%arg4, %0], %cst : memref<?x?xf32>, vector<16x8xf32>
        %4 = vector.transfer_read %arg0[%arg4, %1], %cst : memref<?x?xf32>, vector<16x8xf32>
        %5 = vector.transfer_read %arg0[%arg4, %2], %cst : memref<?x?xf32>, vector<16x8xf32>
        %6 = "some_use"(%3) : (vector<16x8xf32>) -> vector<16x8xf32>
        %7 = "some_use"(%4) : (vector<16x8xf32>) -> vector<16x8xf32>
        %8 = "some_use"(%5) : (vector<16x8xf32>) -> vector<16x8xf32>
        vector.transfer_write %8, %arg0[%arg4, %2] : vector<16x8xf32>, memref<?x?xf32>
        vector.transfer_write %7, %arg0[%arg4, %1] : vector<16x8xf32>, memref<?x?xf32>
        vector.transfer_write %6, %arg0[%arg4, %0] : vector<16x8xf32>, memref<?x?xf32>
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_transfers %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @hoist_vector_broadcasts(%arg0: index, %arg1: index, %arg2: index, %arg3: vector<3x4xf32>) -> vector<3x4xf32> {
    %0 = scf.for %arg4 = %arg0 to %arg1 step %arg2 iter_args(%arg5 = %arg3) -> (vector<3x4xf32>) {
      %1 = vector.extract %arg5[0] : vector<4xf32> from vector<3x4xf32>
      %2 = "some_use"(%1) : (vector<4xf32>) -> vector<4xf32>
      %3 = vector.broadcast %2 : vector<4xf32> to vector<3x4xf32>
      scf.yield %3 : vector<3x4xf32>
    }
    return %0 : vector<3x4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_broadcasts %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @hoist_vector_broadcasts_dynamic(%arg0: index, %arg1: index, %arg2: index, %arg3: vector<3x4xf32>, %arg4: index) -> vector<3x4xf32> {
    %0 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3) -> (vector<3x4xf32>) {
      %1 = vector.extract %arg6[%arg4] : vector<4xf32> from vector<3x4xf32>
      %2 = "some_use"(%1) : (vector<4xf32>) -> vector<4xf32>
      %3 = vector.broadcast %2 : vector<4xf32> to vector<3x4xf32>
      scf.yield %3 : vector<3x4xf32>
    }
    return %0 : vector<3x4xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_broadcasts %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @hoist_vector_broadcasts_multiple(%arg0: index, %arg1: index, %arg2: index, %arg3: vector<3x4xf32>, %arg4: vector<3x5xf32>) -> (vector<3x4xf32>, vector<3x5xf32>) {
    %0:2 = scf.for %arg5 = %arg0 to %arg1 step %arg2 iter_args(%arg6 = %arg3, %arg7 = %arg4) -> (vector<3x4xf32>, vector<3x5xf32>) {
      %1 = vector.extract %arg6[0] : vector<4xf32> from vector<3x4xf32>
      %2 = vector.extract %arg7[1] : vector<5xf32> from vector<3x5xf32>
      %3 = "some_use1"(%1) : (vector<4xf32>) -> vector<4xf32>
      %4 = "some_use2"(%2) : (vector<5xf32>) -> vector<5xf32>
      %5 = vector.broadcast %3 : vector<4xf32> to vector<3x4xf32>
      %6 = vector.broadcast %4 : vector<5xf32> to vector<3x5xf32>
      scf.yield %5, %6 : vector<3x4xf32>, vector<3x5xf32>
    }
    return %0#0, %0#1 : vector<3x4xf32>, vector<3x5xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.hoist_redundant_vector_broadcasts %0 : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

