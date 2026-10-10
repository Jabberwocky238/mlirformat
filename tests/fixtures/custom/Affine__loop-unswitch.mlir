#set = affine_set<(d0) : (d0 - 2 >= 0)>
module {
  func.func @if_else_imperfect(%arg0: memref<100xi32>, %arg1: memref<100xi32>, %arg2: i32) {
    affine.for %arg3 = 0 to 100 {
      affine.store %arg2, %arg0[%arg3] : memref<100xi32>
      affine.for %arg4 = 0 to 100 {
        affine.store %arg2, %arg0[%arg4] : memref<100xi32>
        affine.if #set(%arg3) {
          affine.store %arg2, %arg1[%arg4] : memref<100xi32>
        }
        func.call @external() : () -> ()
      }
      affine.store %arg2, %arg0[%arg3] : memref<100xi32>
    }
    return
  }
  func.func private @external()
}

// -----
#set = affine_set<(d0) : (d0 - 2 >= 0)>
#set1 = affine_set<(d0, d1) : (d0 - 2 >= 0, -d1 + 80 >= 0)>
#set2 = affine_set<(d0, d1) : (d0 - 1 >= 0, -d0 + 99 >= 0)>
#set3 = affine_set<(d0) : (d0 - 1 >= 0, -d0 + 99 >= 0)>
module {
  func.func private @foo()
  func.func private @bar()
  func.func private @abc()
  func.func private @xyz()
  func.func @if_then_perfect(%arg0: memref<100xi32>, %arg1: i32) {
    affine.for %arg2 = 0 to 100 {
      affine.for %arg3 = 0 to 100 {
        affine.for %arg4 = 0 to 100 {
          affine.if #set(%arg2) {
            affine.store %arg1, %arg0[%arg2] : memref<100xi32>
          }
        }
      }
    }
    return
  }
  func.func @if_else_perfect(%arg0: memref<100xi32>, %arg1: i32) {
    affine.for %arg2 = 0 to 99 {
      affine.for %arg3 = 0 to 100 {
        affine.for %arg4 = 0 to 100 {
          func.call @foo() : () -> ()
          affine.if #set1(%arg2, %arg3) {
            affine.store %arg1, %arg0[%arg2] : memref<100xi32>
            func.call @abc() : () -> ()
          } else {
            affine.store %arg1, %arg0[%arg2 + 1] : memref<100xi32>
            func.call @xyz() : () -> ()
          }
          func.call @bar() : () -> ()
        }
      }
    }
    return
  }
  func.func @if_then_imperfect(%arg0: memref<100xi32>, %arg1: index, %arg2: i32) {
    affine.for %arg3 = 0 to 100 {
      affine.store %arg2, %arg0[0] : memref<100xi32>
      affine.if #set(%arg1) {
        affine.store %arg2, %arg0[%arg3] : memref<100xi32>
      }
    }
    return
  }
  func.func @hoist_after_canonicalize() {
    affine.for %arg0 = 0 to 100 {
      affine.for %arg1 = 0 to 100 {
        affine.if #set(%arg1) {
          affine.if #set2(%arg0, %arg1) {
            func.call @foo() : () -> ()
          }
        }
      }
    }
    return
  }
  func.func @handle_dead_if(%arg0: index) {
    affine.for %arg1 = 0 to 100 {
      affine.if #set3(%arg0) {
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 110)>
#map1 = affine_map<(d0)[s0] -> (d0 * 110 + 110, s0 floordiv 3)>
#map2 = affine_map<(d0) -> (d0 * 480)>
#map3 = affine_map<(d0)[s0] -> (s0, d0 * 480 + 480)>
#map4 = affine_map<(d0) -> (d0 * 16)>
#map5 = affine_map<(d0) -> (d0 * 16 + 16)>
#map6 = affine_map<(d0) -> (d0 * 3)>
#map7 = affine_map<(d0) -> (d0 * 3 + 3)>
#map8 = affine_map<(d0)[s0] -> (s0, d0 * 16 + 16)>
#map9 = affine_map<(d0)[s0] -> (s0, d0 * 3 + 3)>
#set = affine_set<(d0, d1)[s0, s1] : (d0 * -16 + s0 - 16 >= 0, d1 * -3 + s1 - 3 >= 0)>
#set1 = affine_set<() : (0 == 0)>
#set2 = affine_set<()[s0] : (s0 >= 0)>
#set3 = affine_set<(d0) : (-d0 + 3 >= 0)>
module {
  func.func @perfect_if_else(%arg0: memref<?x?xf64>, %arg1: memref<?x?xf64>, %arg2: f64, %arg3: index, %arg4: index, %arg5: index, %arg6: index) {
    affine.for %arg7 = #map(%arg4) to min #map1(%arg4)[%arg6] {
      affine.parallel (%arg8, %arg9) = (0, 0) to (symbol(%arg6), 100) step (10, 10) {
        affine.for %arg10 = #map2(%arg3) to min #map3(%arg3)[%arg6] {
          affine.if #set(%arg5, %arg7)[%arg6, %arg6] {
            affine.for %arg11 = #map4(%arg5) to #map5(%arg5) {
              affine.for %arg12 = #map6(%arg7) to #map7(%arg7) {
                affine.store %arg2, %arg0[0, 0] : memref<?x?xf64>
              }
            }
          } else {
            affine.for %arg11 = #map(%arg5) to min #map8(%arg5)[%arg6] {
              affine.for %arg12 = #map2(%arg7) to min #map9(%arg7)[%arg6] {
                affine.store %arg2, %arg0[0, 0] : memref<?x?xf64>
              }
            }
          }
        }
      }
    }
    return
  }
  func.func @multiple_if(%arg0: index) {
    affine.if #set1() {
      func.call @external() : () -> ()
    }
    affine.for %arg1 = 0 to 100 {
      affine.if #set2()[%arg0] {
        func.call @external() : () -> ()
      }
    }
    return
  }
  func.func private @external()
  func.func @affine_parallel(%arg0: memref<35xf32>) -> memref<35xf32> {
    %0 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    %alloc = memref.alloc() {alignment = 64 : i64} : memref<35xf32>
    affine.parallel (%arg1) = (0) to (35) step (32) {
      affine.if #set3(%arg1) {
        affine.parallel (%arg2) = (%arg1) to (%arg1 + 32) {
          %1 = affine.load %arg0[%arg2] : memref<35xf32>
          %2 = llvm.fdiv %0, %1 : f32
          affine.store %2, %alloc[%arg2] : memref<35xf32>
        }
      } else {
        affine.parallel (%arg2) = (%arg1) to (min(%arg1 + 32, 35)) {
          %1 = affine.load %arg0[%arg2] : memref<35xf32>
          %2 = llvm.fdiv %0, %1 : f32
          affine.store %2, %alloc[%arg2] : memref<35xf32>
        }
      }
    }
    return %alloc : memref<35xf32>
  }
}

