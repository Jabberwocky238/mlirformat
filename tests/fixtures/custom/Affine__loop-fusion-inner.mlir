module {
  func.func @fusion_inner_simple(%arg0: memref<10xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg1 = 0 to 100 {
      %alloc = memref.alloc() : memref<10xf32>
      %alloc_0 = memref.alloc() : memref<10xf32>
      affine.for %arg2 = 0 to 10 {
        %0 = affine.load %arg0[%arg2] : memref<10xf32>
        affine.store %0, %alloc[%arg2] : memref<10xf32>
      }
      affine.for %arg2 = 0 to 10 {
        %0 = affine.load %alloc[%arg2] : memref<10xf32>
        affine.store %0, %alloc_0[%arg2] : memref<10xf32>
      }
    }
    return
  }
  func.func @fusion_inner_simple_scf(%arg0: memref<10xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c100 = arith.constant 100 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.for %arg1 = %c0 to %c100 step %c1 {
      %alloc = memref.alloc() : memref<10xf32>
      %alloc_0 = memref.alloc() : memref<10xf32>
      affine.for %arg2 = 0 to 10 {
        %0 = affine.load %arg0[%arg2] : memref<10xf32>
        affine.store %0, %alloc[%arg2] : memref<10xf32>
      }
      affine.for %arg2 = 0 to 10 {
        %0 = affine.load %alloc[%arg2] : memref<10xf32>
        affine.store %0, %alloc_0[%arg2] : memref<10xf32>
      }
    }
    return
  }
  func.func @fusion_inner_multiple_nests() {
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<4x4xi8>
    %alloc_0 = memref.alloc() : memref<8x4xi32>
    affine.for %arg0 = 0 to 4 {
      %alloc_1 = memref.alloc() : memref<4xi8>
      %alloc_2 = memref.alloc() : memref<8x4xi8>
      affine.for %arg1 = 0 to 4 {
        %0 = affine.load %alloc[%arg1, %arg0] : memref<4x4xi8>
        affine.store %0, %alloc_1[%arg1] : memref<4xi8>
      }
      %alloc_3 = memref.alloc() : memref<4xi8>
      affine.for %arg1 = 0 to 4 {
        %0 = affine.load %alloc_1[%arg1] : memref<4xi8>
        affine.store %0, %alloc_3[%arg1] : memref<4xi8>
      }
      affine.for %arg1 = 0 to 2 {
        %0 = affine.load %alloc_2[%arg1 * 4, 0] : memref<8x4xi8>
        %1 = affine.load %alloc_3[0] : memref<4xi8>
        %2 = affine.load %alloc_0[%arg1 * 4, %arg0] : memref<8x4xi32>
        %3 = arith.muli %0, %1 : i8
        %4 = arith.extsi %3 : i8 to i32
        %5 = arith.addi %4, %2 : i32
        affine.store %5, %alloc_0[%arg1 * 4 + 3, %arg0] : memref<8x4xi32>
      }
      memref.dealloc %alloc_3 : memref<4xi8>
    }
    return
  }
  func.func @fusion_inside_scf_while(%arg0: memref<10xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c100 = arith.constant 100 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.while (%arg1 = %cst) : (f32) -> f32 {
      %1 = arith.cmpf ult, %arg1, %cst : f32
      scf.condition(%1) %arg1 : f32
    } do {
    ^bb0(%arg1: f32):
      %alloc = memref.alloc() : memref<10xf32>
      %alloc_0 = memref.alloc() : memref<10xf32>
      affine.for %arg2 = 0 to 10 {
        %2 = affine.load %arg0[%arg2] : memref<10xf32>
        affine.store %2, %alloc[%arg2] : memref<10xf32>
      }
      affine.for %arg2 = 0 to 10 {
        %2 = affine.load %alloc[%arg2] : memref<10xf32>
        affine.store %2, %alloc_0[%arg2] : memref<10xf32>
      }
      %1 = arith.mulf %arg1, %cst : f32
      scf.yield %1 : f32
    }
    return
  }
  memref.global "private" constant @__constant_10x2xf32 : memref<10x2xf32> = dense<0.000000e+00>
  func.func @fusion_inner_long(%arg0: memref<10x2xf32>, %arg1: memref<10x10xf32>, %arg2: memref<10x2xf32>, %arg3: index) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant 1.000000e-03 : f32
    %c9 = arith.constant 9 : index
    %c10_i32 = arith.constant 10 : i32
    %c1_i32 = arith.constant 1 : i32
    %c100_i32 = arith.constant 100 : i32
    %c0_i32 = arith.constant 0 : i32
    %0 = memref.get_global @__constant_10x2xf32 : memref<10x2xf32>
    %1 = scf.for %arg4 = %c0_i32 to %c100_i32 step %c1_i32 iter_args(%arg5 = %arg0) -> (memref<10x2xf32>)  : i32 {
      %alloc = memref.alloc() {alignment = 64 : i64} : memref<10xi32>
      affine.for %arg6 = 0 to 10 {
        %3 = arith.index_cast %arg6 : index to i32
        affine.store %3, %alloc[%arg6] : memref<10xi32>
      }
      %2 = scf.for %arg6 = %c0_i32 to %c10_i32 step %c1_i32 iter_args(%arg7 = %0) -> (memref<10x2xf32>)  : i32 {
        %alloc_2 = memref.alloc() : memref<2xf32>
        affine.for %arg8 = 0 to 2 {
          %3 = affine.load %arg5[%arg3, %arg8] : memref<10x2xf32>
          affine.store %3, %alloc_2[%arg8] : memref<2xf32>
        }
        %alloc_3 = memref.alloc() {alignment = 64 : i64} : memref<1x2xf32>
        affine.for %arg8 = 0 to 2 {
          %3 = affine.load %alloc_2[%arg8] : memref<2xf32>
          affine.store %3, %alloc_3[0, %arg8] : memref<1x2xf32>
        }
        %alloc_4 = memref.alloc() {alignment = 64 : i64} : memref<10x2xf32>
        affine.for %arg8 = 0 to 10 {
          affine.for %arg9 = 0 to 2 {
            %3 = affine.load %alloc_3[0, %arg9] : memref<1x2xf32>
            affine.store %3, %alloc_4[%arg8, %arg9] : memref<10x2xf32>
          }
        }
        %alloc_5 = memref.alloc() {alignment = 64 : i64} : memref<10x2xf32>
        affine.for %arg8 = 0 to 10 {
          affine.for %arg9 = 0 to 2 {
            %3 = affine.load %alloc_4[%arg8, %arg9] : memref<10x2xf32>
            %4 = affine.load %arg5[%arg8, %arg9] : memref<10x2xf32>
            %5 = arith.subf %3, %4 : f32
            affine.store %5, %alloc_5[%arg8, %arg9] : memref<10x2xf32>
          }
        }
        scf.yield %alloc_5 : memref<10x2xf32>
      }
      %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<10x2xf32>
      affine.for %arg6 = 0 to 10 {
        affine.for %arg7 = 0 to 2 {
          affine.store %cst, %alloc_0[%arg6, %arg7] : memref<10x2xf32>
        }
      }
      %alloc_1 = memref.alloc() {alignment = 64 : i64} : memref<10x2xf32>
      affine.for %arg6 = 0 to 10 {
        affine.for %arg7 = 0 to 2 {
          %3 = affine.load %alloc_0[%arg6, %arg7] : memref<10x2xf32>
          %4 = affine.load %2[%arg6, %arg7] : memref<10x2xf32>
          %5 = arith.mulf %3, %4 : f32
          affine.store %5, %alloc_1[%arg6, %arg7] : memref<10x2xf32>
        }
      }
      scf.yield %alloc_1 : memref<10x2xf32>
    }
    affine.for %arg4 = 0 to 10 {
      affine.for %arg5 = 0 to 2 {
        %2 = affine.load %1[%arg4, %arg5] : memref<10x2xf32>
        affine.store %2, %arg2[%arg4, %arg5] : memref<10x2xf32>
      }
    }
    return
  }
}

