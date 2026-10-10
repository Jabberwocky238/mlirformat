module {
  func.func @make_alloca_loop_independent(%arg0: index, %arg1: index, %arg2: index) {
    %cst = arith.constant 5.500000e+00 : f32
    %c0 = arith.constant 0 : index
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      %alloca = memref.alloca(%arg3) : memref<?xf32>
      %subview = memref.subview %alloca[1] [5] [1] : memref<?xf32> to memref<5xf32, strided<[1], offset: 1>>
      "test.some_use"(%subview) : (memref<5xf32, strided<[1], offset: 1>>) -> ()
      %0 = "test.another_use"(%alloca) : (memref<?xf32>) -> memref<?xf32>
      memref.store %cst, %alloca[%c0] : memref<?xf32>
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["memref.alloca"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.memref.make_loop_independent %0 {num_loops = 1 : i64} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
#map = affine_map<(d0)[s0] -> (-d0 + s0)>
module {
  func.func @make_alloca_loop_independent_static(%arg0: index) {
    %cst = arith.constant 5.500000e+00 : f32
    %c0 = arith.constant 0 : index
    %c128 = arith.constant 128 : index
    scf.for %arg1 = %c0 to %c128 step %arg0 {
      %0 = affine.apply #map(%arg1)[%c128]
      %alloca = memref.alloca(%0) : memref<?xf32>
      memref.store %cst, %alloca[%c0] : memref<?xf32>
      %dim = memref.dim %alloca, %c0 : memref<?xf32>
      vector.print %dim : index
    }
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["memref.alloca"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.memref.make_loop_independent %0 {num_loops = 1 : i64} : (!transform.any_op) -> !transform.any_op
      transform.yield 
    }
  }
}

