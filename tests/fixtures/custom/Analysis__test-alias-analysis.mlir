module {
  func.func @simple(%arg0: memref<2xf32>, %arg1: memref<2xf32>) attributes {test.ptr = "func"} {
    %alloca = memref.alloca() {test.ptr = "alloca_1"} : memref<8x64xf32>
    %alloca_0 = memref.alloca() {test.ptr = "alloca_2"} : memref<8x64xf32>
    %alloc = memref.alloc() {test.ptr = "alloc_1"} : memref<8x64xf32>
    %alloc_1 = memref.alloc() {test.ptr = "alloc_2"} : memref<8x64xf32>
    return
  }
}

// -----
module {
  func.func @control_flow(%arg0: memref<2xf32>, %arg1: i1) attributes {test.ptr = "func"} {
    %alloca = memref.alloca() {test.ptr = "alloca_1"} : memref<8x64xf32>
    %alloca_0 = memref.alloca() {test.ptr = "alloca_2"} : memref<8x64xf32>
    %alloc = memref.alloc() {test.ptr = "alloc_1"} : memref<8x64xf32>
    cf.cond_br %arg1, ^bb1(%alloca : memref<8x64xf32>), ^bb2(%alloca : memref<8x64xf32>)
  ^bb1(%0: memref<8x64xf32>):  // pred: ^bb0
    cf.br ^bb2(%0 : memref<8x64xf32>)
  ^bb2(%1: memref<8x64xf32>):  // 2 preds: ^bb0, ^bb1
    return
  }
}

// -----
module {
  func.func @control_flow_merge(%arg0: memref<2xf32>, %arg1: i1) attributes {test.ptr = "func"} {
    %alloca = memref.alloca() {test.ptr = "alloca_1"} : memref<8x64xf32>
    %alloca_0 = memref.alloca() {test.ptr = "alloca_2"} : memref<8x64xf32>
    %alloc = memref.alloc() {test.ptr = "alloc_1"} : memref<8x64xf32>
    cf.cond_br %arg1, ^bb1(%alloca : memref<8x64xf32>), ^bb2(%alloc : memref<8x64xf32>)
  ^bb1(%0: memref<8x64xf32>):  // pred: ^bb0
    cf.br ^bb2(%0 : memref<8x64xf32>)
  ^bb2(%1: memref<8x64xf32>):  // 2 preds: ^bb0, ^bb1
    return
  }
}

// -----
module {
  func.func @region_control_flow(%arg0: memref<2xf32>, %arg1: i1) attributes {test.ptr = "func"} {
    %alloca = memref.alloca() {test.ptr = "alloca_1"} : memref<8x64xf32>
    %alloca_0 = memref.alloca() {test.ptr = "alloca_2"} : memref<8x64xf32>
    %alloc = memref.alloc() {test.ptr = "alloc_1"} : memref<8x64xf32>
    %0 = scf.if %arg1 -> (memref<8x64xf32>) {
      scf.yield %alloca : memref<8x64xf32>
    } else {
      scf.yield %alloca : memref<8x64xf32>
    } {test.ptr = "if_alloca"}
    %1 = scf.if %arg1 -> (memref<8x64xf32>) {
      scf.yield %alloca : memref<8x64xf32>
    } else {
      scf.yield %alloca_0 : memref<8x64xf32>
    } {test.ptr = "if_alloca_merge"}
    %2 = scf.if %arg1 -> (memref<8x64xf32>) {
      scf.yield %alloc : memref<8x64xf32>
    } else {
      scf.yield %alloc : memref<8x64xf32>
    } {test.ptr = "if_alloc"}
    return
  }
}

// -----
module {
  func.func @region_loop_control_flow(%arg0: memref<2xf32>, %arg1: index, %arg2: index, %arg3: index) attributes {test.ptr = "func"} {
    %alloca = memref.alloca() {test.ptr = "alloca_1"} : memref<8x64xf32>
    %alloca_0 = memref.alloca() {test.ptr = "alloca_2"} : memref<8x64xf32>
    %alloc = memref.alloc() {test.ptr = "alloc_1"} : memref<8x64xf32>
    %0 = scf.for %arg4 = %arg1 to %arg2 step %arg3 iter_args(%arg5 = %alloca) -> (memref<8x64xf32>) {
      scf.yield %arg5 : memref<8x64xf32>
    } {test.ptr = "for_alloca"}
    return
  }
}

// -----
module {
  func.func @region_loop_zero_trip_count() attributes {test.ptr = "func"} {
    %alloca = memref.alloca() {test.ptr = "alloca_1"} : memref<i32>
    %alloca_0 = memref.alloca() {test.ptr = "alloca_2"} : memref<i32>
    %0 = affine.for %arg0 = 0 to 0 iter_args(%arg1 = %alloca) -> (memref<i32>) {
      affine.yield %arg1 : memref<i32>
    } {test.ptr = "for_alloca"}
    return
  }
}

// -----
module {
  func.func @view_like(%arg0: memref<2xf32>, %arg1: index) attributes {test.ptr = "func"} {
    %alloc = memref.alloc() {test.ptr = "alloc_1"} : memref<8x64xf32>
    %c0 = arith.constant 0 : index
    %alloca = memref.alloca(%arg1) {test.ptr = "alloca_1"} : memref<?xi8>
    %view = memref.view %alloca[%c0][] {test.ptr = "view"} : memref<?xi8> to memref<8x64xf32>
    return
  }
}

// -----
module {
  func.func @constants(%arg0: memref<2xf32>) attributes {test.ptr = "func"} {
    %alloc = memref.alloc() {test.ptr = "alloc_1"} : memref<8x64xf32>
    %c0 = arith.constant {test.ptr = "constant_1"} 0 : index
    %c0_0 = arith.constant {test.ptr = "constant_2"} 0 : index
    %c1 = arith.constant {test.ptr = "constant_3"} 1 : index
    return
  }
}

// -----
module {
  func.func @distinct_objects(%arg0: memref<?xf32>, %arg1: memref<?xf32>) attributes {test.ptr = "func"} {
    %0:2 = memref.distinct_objects %arg0, %arg1 {test.ptr = "distinct"} : memref<?xf32>, memref<?xf32>
    return
  }
}

