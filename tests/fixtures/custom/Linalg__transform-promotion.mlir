module {
  func.func @promote_subview_matmul(%arg0: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg1: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg2: memref<?x?xf32, strided<[?, 1], offset: ?>>) {
    %c2000 = arith.constant 2000 : index
    %c3000 = arith.constant 3000 : index
    %c4000 = arith.constant 4000 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32, strided<[?, 1], offset: ?>>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32, strided<[?, 1], offset: ?>>
    %dim_1 = memref.dim %arg1, %c1 : memref<?x?xf32, strided<[?, 1], offset: ?>>
    scf.for %arg3 = %c0 to %dim step %c2000 {
      scf.for %arg4 = %c0 to %dim_1 step %c3000 {
        scf.for %arg5 = %c0 to %dim_0 step %c4000 {
          %subview = memref.subview %arg0[%arg3, %arg5] [%c2000, %c4000] [%c1, %c1] : memref<?x?xf32, strided<[?, 1], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
          %subview_2 = memref.subview %arg1[%arg5, %arg4] [%c4000, %c3000] [%c1, %c1] : memref<?x?xf32, strided<[?, 1], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
          %subview_3 = memref.subview %arg2[%arg3, %arg4] [%c2000, %c3000] [%c1, %c1] : memref<?x?xf32, strided<[?, 1], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
          linalg.matmul ins(%subview, %subview_2 : memref<?x?xf32, strided<[?, ?], offset: ?>>, memref<?x?xf32, strided<[?, ?], offset: ?>>) outs(%subview_3 : memref<?x?xf32, strided<[?, ?], offset: ?>>)
        }
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.promote %0 {operands_to_promote = [0, 1, 2], use_full_tiles_by_default} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @promote_first_subview_matmul(%arg0: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg1: memref<?x?xf32, strided<[?, 1], offset: ?>>, %arg2: memref<?x?xf32, strided<[?, 1], offset: ?>>) {
    %c2000 = arith.constant 2000 : index
    %c3000 = arith.constant 3000 : index
    %c4000 = arith.constant 4000 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32, strided<[?, 1], offset: ?>>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32, strided<[?, 1], offset: ?>>
    %dim_1 = memref.dim %arg1, %c1 : memref<?x?xf32, strided<[?, 1], offset: ?>>
    scf.for %arg3 = %c0 to %dim step %c2000 {
      scf.for %arg4 = %c0 to %dim_1 step %c3000 {
        scf.for %arg5 = %c0 to %dim_0 step %c4000 {
          %subview = memref.subview %arg0[%arg3, %arg5] [%c2000, %c4000] [%c1, %c1] : memref<?x?xf32, strided<[?, 1], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
          %subview_2 = memref.subview %arg1[%arg5, %arg4] [%c4000, %c3000] [%c1, %c1] : memref<?x?xf32, strided<[?, 1], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
          %subview_3 = memref.subview %arg2[%arg3, %arg4] [%c2000, %c3000] [%c1, %c1] : memref<?x?xf32, strided<[?, 1], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
          linalg.matmul {__internal_linalg_transform__ = "_promote_first_view_"} ins(%subview, %subview_2 : memref<?x?xf32, strided<[?, ?], offset: ?>>, memref<?x?xf32, strided<[?, ?], offset: ?>>) outs(%subview_3 : memref<?x?xf32, strided<[?, ?], offset: ?>>)
        }
      }
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.promote %0 {operands_to_promote = [0], use_full_tiles_by_default} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @aligned_promote_fill(%arg0: memref<?x?xf32, strided<[?, 1], offset: ?>>) {
    %c2000 = arith.constant 2000 : index
    %c4000 = arith.constant 4000 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f32
    %subview = memref.subview %arg0[%c0, %c0] [%c2000, %c4000] [%c1, %c1] : memref<?x?xf32, strided<[?, 1], offset: ?>> to memref<?x?xf32, strided<[?, ?], offset: ?>>
    linalg.fill ins(%cst : f32) outs(%subview : memref<?x?xf32, strided<[?, ?], offset: ?>>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.promote %0 {alignment = 32 : i64, operands_to_promote = [1], use_full_tile_buffers = [false, true]} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func @aligned_promote_fill_complex(%arg0: memref<?x?xcomplex<f32>, strided<[?, 1], offset: ?>>) {
    %c2000 = arith.constant 2000 : index
    %c4000 = arith.constant 4000 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f32
    %0 = complex.create %cst, %cst : complex<f32>
    %subview = memref.subview %arg0[%c0, %c0] [%c2000, %c4000] [%c1, %c1] : memref<?x?xcomplex<f32>, strided<[?, 1], offset: ?>> to memref<?x?xcomplex<f32>, strided<[?, ?], offset: ?>>
    linalg.fill ins(%0 : complex<f32>) outs(%subview : memref<?x?xcomplex<f32>, strided<[?, ?], offset: ?>>)
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["linalg.fill"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.promote %0 {alignment = 32 : i64, operands_to_promote = [1], use_full_tile_buffers = [false, true]} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

