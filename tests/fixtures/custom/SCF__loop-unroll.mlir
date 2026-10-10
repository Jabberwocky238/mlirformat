module {
  func.func @dynamic_loop_unroll(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<?xf32>) {
    %cst = arith.constant 7.000000e+00 : f32
    scf.for %arg4 = %arg0 to %arg1 step %arg2 {
      memref.store %cst, %arg3[%arg4] : memref<?xf32>
    }
    return
  }
  func.func @dynamic_loop_unroll_outer_by_2(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: memref<?xf32>) {
    %cst = arith.constant 7.000000e+00 : f32
    scf.for %arg7 = %arg0 to %arg1 step %arg2 {
      scf.for %arg8 = %arg3 to %arg4 step %arg5 {
        memref.store %cst, %arg6[%arg8] : memref<?xf32>
      }
    }
    return
  }
  func.func @dynamic_loop_unroll_inner_by_2(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: memref<?xf32>) {
    %cst = arith.constant 7.000000e+00 : f32
    scf.for %arg7 = %arg0 to %arg1 step %arg2 {
      scf.for %arg8 = %arg3 to %arg4 step %arg5 {
        memref.store %cst, %arg6[%arg8] : memref<?xf32>
      }
    }
    return
  }
  func.func @static_loop_unroll_by_2(%arg0: memref<?xf32>) {
    %cst = arith.constant 7.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c20 = arith.constant 20 : index
    %c1 = arith.constant 1 : index
    scf.for %arg1 = %c0 to %c20 step %c1 {
      memref.store %cst, %arg0[%arg1] : memref<?xf32>
    }
    return
  }
  func.func @static_loop_step_2_unroll_by_2(%arg0: memref<?xf32>) {
    %cst = arith.constant 7.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c19 = arith.constant 19 : index
    %c2 = arith.constant 2 : index
    scf.for %arg1 = %c0 to %c19 step %c2 {
      memref.store %cst, %arg0[%arg1] : memref<?xf32>
    }
    return
  }
  func.func @static_loop_unroll_by_3(%arg0: memref<?xf32>) {
    %cst = arith.constant 7.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c20 = arith.constant 20 : index
    %c1 = arith.constant 1 : index
    scf.for %arg1 = %c0 to %c20 step %c1 {
      memref.store %cst, %arg0[%arg1] : memref<?xf32>
    }
    return
  }
  func.func @static_loop_unroll_by_3_promote_epilogue(%arg0: memref<?xf32>) {
    %cst = arith.constant 7.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    scf.for %arg1 = %c0 to %c10 step %c1 {
      memref.store %cst, %arg0[%arg1] : memref<?xf32>
    }
    return
  }
  func.func @static_loop_unroll_up_to_factor(%arg0: memref<?xf32>) {
    %cst = arith.constant 7.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    affine.for %arg1 = %c0 to %c2 {
      affine.store %cst, %arg0[%arg1] : memref<?xf32>
    }
    return
  }
  func.func @static_loop_unroll_by_3_rename_epilogue_arguments() -> (f32, f32) {
    %cst = arith.constant 7.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c20 = arith.constant 20 : index
    %c1 = arith.constant 1 : index
    %0:2 = scf.for %arg0 = %c0 to %c20 step %c1 iter_args(%arg1 = %cst, %arg2 = %cst) -> (f32, f32) {
      %1 = arith.addf %arg1, %arg2 : f32
      %2 = arith.mulf %arg1, %arg2 : f32
      scf.yield %1, %2 : f32, f32
    }
    return %0#0, %0#1 : f32, f32
  }
  func.func @static_loop_unroll_by_5_with_cleanup(%arg0: memref<?xf32>) {
    %cst = arith.constant 7.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c3 = arith.constant 3 : index
    affine.for %arg1 = %c0 to %c3 {
      memref.store %cst, %arg0[%arg1] : memref<?xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (-d0 + 64, (d0 floordiv 8) ceildiv 64, -d0 - 16, d0 * -64)>
module {
  func.func @loop_unroll_static_yield_value_test1() {
    %true = arith.constant true
    %c1 = arith.constant 1 : index
    %0 = affine.for %arg0 = 0 to 40 iter_args(%arg1 = %true) -> (i1) {
      %1 = affine.max #map(%c1)
      affine.yield %true : i1
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (-d0 + 64, (d0 floordiv 8) ceildiv 64, -d0 - 16, d0 * -64)>
module {
  func.func @loop_unroll_yield_loop_iv() {
    %c1 = arith.constant 1 : index
    %0 = affine.for %arg0 = 0 to 40 step 2 iter_args(%arg1 = %c1) -> (index) {
      %1 = affine.max #map(%arg0)
      affine.yield %arg0 : index
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (-d0 + 64, (d0 floordiv 8) ceildiv 64, -d0 - 16, d0 * -64)>
module {
  func.func @loop_unroll_yield_iter_arg() {
    %c1 = arith.constant 1 : index
    %0 = affine.for %arg0 = 0 to 40 step 2 iter_args(%arg1 = %c1) -> (index) {
      %1 = affine.max #map(%arg1)
      affine.yield %arg1 : index
    }
    return
  }
}

// -----
module {
  func.func @static_loop_unroll_with_integer_iv() -> (f32, f32) {
    %cst = arith.constant 7.000000e+00 : f32
    %c0_i32 = arith.constant 0 : i32
    %c20_i32 = arith.constant 20 : i32
    %c1_i32 = arith.constant 1 : i32
    %0:2 = scf.for %arg0 = %c0_i32 to %c20_i32 step %c1_i32 iter_args(%arg1 = %cst, %arg2 = %cst) -> (f32, f32)  : i32 {
      %1 = arith.addf %arg1, %arg2 : f32
      %2 = arith.mulf %arg1, %arg2 : f32
      scf.yield %1, %2 : f32, f32
    }
    return %0#0, %0#1 : f32, f32
  }
}

// -----
module {
  func.func @loop_unroll_static_yield_value_defined_above(%arg0: i32) {
    %c42_i32 = arith.constant 42 : i32
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0:2 = scf.for %arg1 = %c0 to %c4 step %c1 iter_args(%arg2 = %c42_i32, %arg3 = %arg0) -> (i32, i32) {
      %1 = arith.andi %arg3, %arg2 : i32
      scf.yield %1, %arg0 : i32, i32
    }
    return
  }
}

