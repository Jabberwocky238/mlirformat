module {
  func.func @test_basic() {
    %alloc = memref.alloc() : memref<i32>
    %0 = memref.load %alloc[] : memref<i32>
    return
  }
}

// -----
module {
  func.func @test_repeat_namelocs() {
    %alloc = memref.alloc() : memref<i32>
    %0 = memref.load %alloc[] : memref<i32>
    %1 = memref.load %alloc[] : memref<i32>
    return
  }
}

// -----
module {
  func.func @test_bb_args1(%arg0: memref<i32>) {
    %0 = memref.load %arg0[] : memref<i32>
    return
  }
}

// -----
module {
  func.func private @make_two_results() -> (index, index)
  func.func @test_multiple_results(%arg0: i1) {
    %0:2 = call @make_two_results() : () -> (index, index)
    %1:2 = call @make_two_results() : () -> (index, index)
    %2:2 = scf.while (%arg1 = %1#0, %arg2 = %1#0) : (index, index) -> (index, index) {
      %3 = arith.cmpi slt, %arg1, %arg2 : index
      scf.condition(%3) %arg1, %arg2 : index, index
    } do {
    ^bb0(%arg1: index, %arg2: index):
      %3:2 = func.call @make_two_results() : () -> (index, index)
      scf.yield %3#1, %3#1 : index, index
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @test_op_asm_interface(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0:2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xf32>) outs(%arg0, %arg1 : tensor<?xf32>, tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32):
      linalg.yield %in, %in : f32, f32
    } -> (tensor<?xf32>, tensor<?xf32>)
    %1:2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xf32>) outs(%arg0, %arg1 : tensor<?xf32>, tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32):
      linalg.yield %out, %out_0 : f32, f32
    } -> (tensor<?xf32>, tensor<?xf32>)
    return
  }
}

// -----
module {
  func.func @test_pass(%arg0: memref<4xf32>, %arg1: memref<4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    scf.for %arg2 = %c0 to %c4 step %c1 {
      %0 = memref.load %arg0[%arg2] : memref<4xf32>
      memref.store %0, %arg1[%arg2] : memref<4xf32>
    }
    return
  }
}

