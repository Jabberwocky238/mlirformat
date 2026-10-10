#map = affine_map<()[s0] -> (s0 + 9)>
#map1 = affine_map<()[s0, s1] -> (s0, s1, 1024)>
#map2 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @unroll_jam_imperfect_nest() {
    affine.for %arg0 = 0 to 101 {
      %0 = "addi32"(%arg0, %arg0) : (index, index) -> i32
      affine.for %arg1 = 0 to 17 {
        %2 = "addi32"(%arg0, %arg0) : (index, index) -> i32
        %3 = "addi32"(%2, %2) : (i32, i32) -> i32
      }
      %1 = "foo"(%arg0, %0) : (index, i32) -> i32
    }
    return
  }
  gpu.module @unroll_jam {
    gpu.func @unroll_jam_imperfect_nest() {
      affine.for %arg0 = 0 to 101 {
        %0 = "addi32"(%arg0, %arg0) : (index, index) -> i32
        affine.for %arg1 = 0 to 17 {
          %2 = "addi32"(%arg0, %arg0) : (index, index) -> i32
          %3 = "addi32"(%2, %2) : (i32, i32) -> i32
        }
        %1 = "foo"(%arg0, %0) : (index, i32) -> i32
      }
      gpu.return
    }
  }
  func.func @loop_nest_unknown_count_1(%arg0: index) {
    affine.for %arg1 = 1 to %arg0 {
      affine.for %arg2 = 1 to 100 {
        %0 = "foo"() : () -> i32
      }
    }
    return
  }
  func.func @loop_nest_unknown_count_2(%arg0: index) {
    affine.for %arg1 = %arg0 to #map()[%arg0] {
      affine.for %arg2 = 1 to 100 {
        "foo"(%arg1) : (index) -> ()
      }
    }
    return
  }
  func.func @loop_nest_symbolic_and_min_upper_bound(%arg0: index, %arg1: index, %arg2: index) {
    affine.for %arg3 = 0 to min #map1()[%arg0, %arg1] {
      affine.for %arg4 = 0 to %arg2 {
        "test.foo"(%arg3, %arg4) : (index, index) -> ()
      }
    }
    return
  }
  func.func @no_unroll_jam_dependent_ubound(%arg0: memref<?xf32, 1>) {
    affine.for %arg1 = 0 to 100 {
      affine.for %arg2 = 0 to #map2(%arg1) {
        %0 = "addi32"(%arg2, %arg2) : (index, index) -> i32
      }
    }
    return
  }
  func.func @unroll_jam_one_iter_arg() {
    affine.for %arg0 = 0 to 101 {
      %c1_i32 = arith.constant 1 : i32
      %0 = "addi32"(%arg0, %arg0) : (index, index) -> i32
      %1 = affine.for %arg1 = 0 to 17 iter_args(%arg2 = %c1_i32) -> (i32) {
        %3 = "bar"(%arg0, %arg1, %arg2) : (index, index, i32) -> i32
        affine.yield %3 : i32
      }
      %2 = "foo"(%arg0, %0, %1) : (index, i32, i32) -> i32
    }
    return
  }
  func.func @unroll_jam_iter_args() {
    affine.for %arg0 = 0 to 101 {
      %c0_i32 = arith.constant 0 : i32
      %c1_i32 = arith.constant 1 : i32
      %0 = "addi32"(%arg0, %arg0) : (index, index) -> i32
      %1:2 = affine.for %arg1 = 0 to 17 iter_args(%arg2 = %c0_i32, %arg3 = %c1_i32) -> (i32, i32) {
        %3 = "bar"(%arg0, %arg1, %arg2) : (index, index, i32) -> i32
        %4 = "bar1"(%arg0, %arg1, %arg3) : (index, index, i32) -> i32
        affine.yield %3, %4 : i32, i32
      }
      %2 = "foo"(%arg0, %0, %1#0, %1#1) : (index, i32, i32, i32) -> i32
    }
    return
  }
  func.func @unroll_jam_iter_args_func_arg(%arg0: i32) {
    affine.for %arg1 = 0 to 101 {
      %0 = "addi32"(%arg1, %arg1) : (index, index) -> i32
      %1 = affine.for %arg2 = 0 to 17 iter_args(%arg3 = %arg0) -> (i32) {
        %3 = "bar"(%arg1, %arg2, %arg3) : (index, index, i32) -> i32
        affine.yield %3 : i32
      }
      %2 = "foo"(%arg1, %0, %1) : (index, i32, i32) -> i32
    }
    return
  }
  func.func @unroll_jam_iter_args_nested() {
    affine.for %arg0 = 0 to 101 {
      %c1_i32 = arith.constant 1 : i32
      %0 = "addi32"(%arg0, %arg0) : (index, index) -> i32
      %1 = affine.for %arg1 = 0 to 17 iter_args(%arg2 = %c1_i32) -> (i32) {
        %3 = affine.for %arg3 = 0 to 35 iter_args(%arg4 = %arg2) -> (i32) {
          %4 = "bar"(%arg0, %arg1, %arg3, %arg4) : (index, index, index, i32) -> i32
          affine.yield %4 : i32
        }
        affine.yield %3 : i32
      }
      %2 = "foo"(%arg0, %0, %1) : (index, i32, i32) -> i32
    }
    return
  }
  func.func @unroll_jam_iter_args_nested_affine_for_result() {
    affine.for %arg0 = 0 to 101 {
      %c1_i32 = arith.constant 1 : i32
      %0 = "addi32"(%arg0, %arg0) : (index, index) -> i32
      %1 = affine.for %arg1 = 0 to 17 iter_args(%arg2 = %c1_i32) -> (i32) {
        %3 = affine.for %arg3 = 0 to 35 iter_args(%arg4 = %arg2) -> (i32) {
          %5 = "bar"(%arg0, %arg1, %arg3, %arg4) : (index, index, index, i32) -> i32
          affine.yield %arg2 : i32
        }
        %4 = affine.for %arg3 = 0 to 36 iter_args(%arg4 = %3) -> (i32) {
          %5 = "bar"(%arg0, %arg1, %arg3, %arg4) : (index, index, index, i32) -> i32
          affine.yield %5 : i32
        }
        affine.yield %4 : i32
      }
      %2 = "foo"(%arg0, %0, %1) : (index, i32, i32) -> i32
    }
    return
  }
  func.func @unroll_jam_iter_args_nested_yield() {
    affine.for %arg0 = 0 to 101 {
      %c1_i32 = arith.constant 1 : i32
      %0 = "addi32"(%arg0, %arg0) : (index, index) -> i32
      %1:3 = affine.for %arg1 = 0 to 17 iter_args(%arg2 = %c1_i32, %arg3 = %c1_i32, %arg4 = %c1_i32) -> (i32, i32, i32) {
        %3 = affine.for %arg5 = 0 to 35 iter_args(%arg6 = %arg2) -> (i32) {
          %5 = "bar"(%arg0, %arg1, %arg5, %arg6) : (index, index, index, i32) -> i32
          affine.yield %5 : i32
        }
        %4:2 = affine.for %arg5 = 0 to 36 iter_args(%arg6 = %arg3, %arg7 = %arg4) -> (i32, i32) {
          %5 = "bar1"(%arg0, %arg1, %arg5, %arg6, %arg7) : (index, index, index, i32, i32) -> i32
          affine.yield %5, %5 : i32, i32
        }
        affine.yield %3, %3, %4#1 : i32, i32, i32
      }
      %2 = "foo"(%arg0, %0, %1#0, %1#2) : (index, i32, i32, i32) -> i32
    }
    return
  }
  func.func @unroll_jam_nested_iter_args_mulf(%arg0: memref<21x30xf32, 1>, %arg1: f32, %arg2: f32) {
    %0 = affine.for %arg3 = 0 to 21 iter_args(%arg4 = %arg1) -> (f32) {
      %1 = affine.for %arg5 = 0 to 30 iter_args(%arg6 = %arg2) -> (f32) {
        %3 = affine.load %arg0[%arg3, %arg5] : memref<21x30xf32, 1>
        %4 = arith.addf %arg6, %3 : f32
        affine.yield %4 : f32
      }
      %2 = arith.mulf %arg4, %1 : f32
      affine.yield %2 : f32
    }
    return
  }
  func.func @unroll_jam_iter_args_addi(%arg0: memref<21xi32, 1>, %arg1: i32) {
    %0 = affine.for %arg2 = 0 to 21 iter_args(%arg3 = %arg1) -> (i32) {
      %1 = affine.load %arg0[%arg2] : memref<21xi32, 1>
      %2 = arith.addi %arg3, %1 : i32
      affine.yield %2 : i32
    }
    return
  }
}

