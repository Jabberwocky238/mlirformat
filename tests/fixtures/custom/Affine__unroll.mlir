#map = affine_map<(d0) -> (d0 + 1)>
#map1 = affine_map<(d0, d1) -> (d0 + 1)>
#map2 = affine_map<(d0, d1) -> (d0 + 3)>
#map3 = affine_map<(d0)[s0] -> (d0 + s0 + 1)>
#map4 = affine_map<(d0, d1) -> (d0 * 16 + d1)>
#map5 = affine_map<(d0) -> (d0 - d0 mod 4)>
#map6 = affine_map<(d0) -> (d0)>
#map7 = affine_map<(d0) -> (d0 * 5 + 4)>
#map8 = affine_map<(d0)[s0] -> ((d0 * 16) floordiv (s0 * 4))>
#map9 = affine_map<(d0)[s0] -> ((d0 * 16) mod (s0 * 4))>
#map10 = affine_map<(d0) -> (d0 + 9)>
#map11 = affine_map<()[s0, s1] -> (s0, s1, 1024)>
#map12 = affine_map<(d0) -> (d0 * 4 + 1)>
#map13 = affine_map<(d0) -> (d0 - 1)>
#map14 = affine_map<(d0, d1) -> (d0 * 4, d1, 1024)>
#map15 = affine_map<()[s0] -> (s0 * 8, s0 * 12)>
#map16 = affine_map<(d0) -> (d0 * 4)>
#map17 = affine_map<()[s0, s1] -> (s0 * 4, s1, 1024)>
#map18 = affine_map<(d0) -> (d0 * 32 + 64)>
#map19 = affine_map<(d0) -> (d0 * 4 + 8)>
module {
  func.func @loop_nest_simplest() {
    affine.for %arg0 = 0 to 100 step 2 {
      affine.for %arg1 = 0 to 4 {
        %c1_i32 = arith.constant 1 : i32
      }
    }
    return
  }
  func.func @loop_nest_simple_iv_use() {
    affine.for %arg0 = 0 to 100 step 2 {
      affine.for %arg1 = 0 to 4 {
        %0 = "addi32"(%arg1, %arg1) : (index, index) -> i32
      }
    }
    return
  }
  func.func @loop_nest_body_def_use() {
    affine.for %arg0 = 0 to 100 step 2 {
      %c0 = arith.constant 0 : index
      affine.for %arg1 = 0 to 4 {
        %0 = affine.apply #map(%arg1)
        %1 = "addi32"(%0, %c0) : (index, index) -> index
      }
    }
    return
  }
  func.func @loop_nest_strided() {
    affine.for %arg0 = 0 to 100 {
      affine.for %arg1 = 2 to 6 step 2 {
        %0 = affine.apply #map(%arg1)
        %1 = "addi32"(%0, %0) : (index, index) -> index
      }
      affine.for %arg1 = 2 to 7 step 2 {
        %0 = affine.apply #map(%arg1)
        %1 = "addi32"(%0, %0) : (index, index) -> index
      }
    }
    return
  }
  func.func @loop_nest_multiple_results() {
    affine.for %arg0 = 0 to 100 {
      affine.for %arg1 = 0 to 2 {
        %0 = affine.apply #map1(%arg0, %arg1)
        %1 = "addi32"(%0, %0) : (index, index) -> index
        %2 = affine.apply #map2(%arg0, %arg1)
        %3:2 = "fma"(%2, %0, %0) : (index, index, index) -> (index, index)
      }
    }
    return
  }
  func.func @loop_nest_seq_imperfect(%arg0: memref<128x128xf32>) {
    %c128 = arith.constant 128 : index
    affine.for %arg1 = 0 to 100 {
      %0 = "vld"(%arg1) : (index) -> i32
      affine.for %arg2 = 0 to 4 {
        %2 = affine.apply #map(%arg2)
        %3 = "vmulf"(%arg2, %2) : (index, index) -> index
        %4 = "vaddf"(%3, %3) : (index, index) -> index
      }
      %1 = "scale"(%c128, %arg1) : (index, index) -> index
      "vst"(%1, %arg1) : (index, index) -> ()
    }
    return
  }
  func.func @loop_nest_seq_multiple() {
    affine.for %arg0 = 0 to 4 {
      %0 = affine.apply #map(%arg0)
      "mul"(%0, %0) : (index, index) -> ()
    }
    %c99 = arith.constant 99 : index
    affine.for %arg0 = 0 to 100 step 2 {
      affine.for %arg1 = 0 to 4 {
        %0 = affine.apply #map(%arg1)
        %1 = affine.apply #map3(%arg1)[%c99]
      }
    }
    return
  }
  func.func @loop_nest_unroll_full() {
    affine.for %arg0 = 0 to 1 {
      %0 = "foo"() : () -> i32
      %1 = "bar"() : () -> i32
    }
    return
  }
  gpu.module @unroll_full {
    gpu.func @gpu_loop_nest_simplest() {
      affine.for %arg0 = 0 to 100 step 2 {
        affine.for %arg1 = 0 to 4 {
          %c1_i32 = arith.constant 1 : i32
        }
      }
      gpu.return
    }
  }
  func.func @loop_nest_outer_unroll() {
    affine.for %arg0 = 0 to 2 {
      affine.for %arg1 = 0 to 4 {
        %0 = affine.apply #map(%arg1)
        %1 = "addi32"(%0, %0) : (index, index) -> index
      }
    }
    return
  }
  func.func @loop_nest_seq_long() -> i32 {
    %alloc = memref.alloc() : memref<512x512xi32, 2>
    %alloc_0 = memref.alloc() : memref<512x512xi32, 2>
    %alloc_1 = memref.alloc() : memref<512x512xi32, 2>
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c0 = arith.constant 0 : index
    affine.for %arg0 = 0 to 512 {
      affine.for %arg1 = 0 to 8 {
        memref.store %c1_i32, %alloc[%arg0, %arg1] : memref<512x512xi32, 2>
        memref.store %c2_i32, %alloc_0[%arg0, %arg1] : memref<512x512xi32, 2>
        memref.store %c0_i32, %alloc_1[%arg0, %arg1] : memref<512x512xi32, 2>
      }
    }
    affine.for %arg0 = 0 to 2 {
      affine.for %arg1 = 0 to 2 {
        affine.for %arg2 = 0 to 8 {
          %1 = affine.apply #map4(%arg1, %arg2)
          %2 = memref.load %alloc_0[%arg0, %1] : memref<512x512xi32, 2>
          "op1"(%2) : (i32) -> ()
        }
        affine.for %arg2 = 0 to 8 {
          affine.for %arg3 = 0 to 8 {
            %1 = affine.apply #map4(%arg1, %arg3)
            %2 = memref.load %alloc[%arg2, %1] : memref<512x512xi32, 2>
            "op2"(%2) : (i32) -> ()
          }
          affine.for %arg3 = 0 to 8 {
            %1 = "op3"() : () -> i32
            %2 = affine.apply #map4(%arg0, %arg3)
            %3 = memref.load %alloc_1[%arg2, %2] : memref<512x512xi32, 2>
            %4 = "addi32"(%1, %3) : (i32, i32) -> i32
            memref.store %4, %alloc_1[%arg2, %2] : memref<512x512xi32, 2>
          }
        }
        "op4"() : () -> ()
      }
    }
    %0 = memref.load %alloc_1[%c0, %c0] : memref<512x512xi32, 2>
    return %0 : i32
  }
  func.func @unroll_unit_stride_no_cleanup() {
    affine.for %arg0 = 0 to 100 {
      affine.for %arg1 = 0 to 8 {
        %0 = "addi32"(%arg1, %arg1) : (index, index) -> i32
        %1 = "addi32"(%0, %0) : (i32, i32) -> i32
      }
      affine.for %arg1 = 0 to 8 {
      }
    }
    return
  }
  func.func @unroll_unit_stride_cleanup() {
    affine.for %arg0 = 0 to 100 {
      affine.for %arg1 = 0 to 10 {
        %0 = "addi32"(%arg1, %arg1) : (index, index) -> i32
        %1 = "addi32"(%0, %0) : (i32, i32) -> i32
      }
    }
    return
  }
  func.func @unroll_non_unit_stride_cleanup() {
    affine.for %arg0 = 0 to 100 {
      affine.for %arg1 = 2 to 48 step 5 {
        %0 = "addi32"(%arg1, %arg1) : (index, index) -> i32
        %1 = "addi32"(%0, %0) : (i32, i32) -> i32
      }
    }
    return
  }
  func.func @loop_nest_single_iteration_after_unroll(%arg0: index) {
    affine.for %arg1 = 0 to %arg0 {
      affine.for %arg2 = 0 to 5 {
        %0 = "addi32"(%arg2, %arg2) : (index, index) -> i32
      }
    }
    return
  }
  func.func @loop_nest_operand1() {
    affine.for %arg0 = 0 to 100 step 2 {
      affine.for %arg1 = 0 to #map5(%arg0) {
        %0 = "foo"() : () -> i32
      }
    }
    return
  }
  func.func @loop_nest_operand2() {
    affine.for %arg0 = 0 to 100 step 2 {
      affine.for %arg1 = #map6(%arg0) to #map7(%arg0) {
        %0 = "foo"() : () -> i32
      }
    }
    return
  }
  func.func @floordiv_mod_ub(%arg0: index, %arg1: index) {
    affine.for %arg2 = 0 to %arg1 step 4 {
      affine.for %arg3 = 0 to #map8(%arg2)[%arg1] {
        "test.foo"() : () -> ()
      }
    }
    affine.for %arg2 = 0 to %arg1 step 4 {
      affine.for %arg3 = 0 to #map9(%arg2)[%arg1] {
        "test.foo"() : () -> ()
      }
    }
    return
  }
  func.func @loop_nest_operand3() {
    affine.for %arg0 = 0 to 100 step 2 {
      affine.for %arg1 = #map6(%arg0) to #map10(%arg0) {
        %0 = "foo"() : () -> i32
      }
    }
    return
  }
  func.func @loop_nest_symbolic_bound(%arg0: index) {
    affine.for %arg1 = 0 to 100 {
      affine.for %arg2 = 0 to %arg0 {
        %0 = "foo"() : () -> i32
      }
    }
    return
  }
  func.func @loop_nest_symbolic_bound_with_step(%arg0: index) {
    affine.for %arg1 = 0 to 100 {
      affine.for %arg2 = 0 to %arg0 step 3 {
        %0 = "foo"() : () -> i32
      }
    }
    return
  }
  func.func @loop_nest_symbolic_and_min_upper_bound(%arg0: index, %arg1: index, %arg2: index) {
    affine.for %arg3 = %arg0 to min #map11()[%arg1, %arg2] {
      "test.foo"() : () -> ()
    }
    return
  }
  func.func @loop_nest_non_trivial_multiple_upper_bound(%arg0: index, %arg1: index) {
    %0 = affine.apply #map12(%arg0)
    %1 = affine.apply #map13(%0)
    affine.for %arg2 = 0 to min #map14(%arg1, %1) {
      "foo"() : () -> ()
    }
    return
  }
  func.func @multi_upper_bound(%arg0: index) {
    affine.for %arg1 = 0 to min #map15()[%arg0] {
      "test.foo"() : () -> ()
    }
    return
  }
  func.func @multi_lower_bound(%arg0: index) {
    affine.for %arg1 = max #map15()[%arg0] to 100 {
      "test.foo"() : () -> ()
    }
    return
  }
  func.func @loop_nest_non_trivial_multiple_upper_bound_alt(%arg0: index, %arg1: index) {
    %0 = affine.apply #map16(%arg0)
    affine.for %arg2 = 0 to min #map17()[%arg1, %0] {
      "foo"() : () -> ()
    }
    return
  }
  func.func @unroll_by_one_should_promote_single_iteration_loop() {
    affine.for %arg0 = 0 to 1 {
      %0 = "foo"(%arg0) : (index) -> i32
    }
    return
  }
  func.func @loop_unroll_with_iter_args_and_cleanup(%arg0: f32, %arg1: f32, %arg2: index) -> (f32, f32) {
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %0:2 = affine.for %arg3 = 0 to 10 iter_args(%arg4 = %arg0, %arg5 = %arg1) -> (f32, f32) {
      %1 = arith.addf %arg4, %cst : f32
      %2 = arith.addf %arg5, %cst_0 : f32
      affine.yield %1, %2 : f32, f32
    }
    return %0#0, %0#1 : f32, f32
  }
  func.func @unroll_with_iter_args_and_promotion(%arg0: f32, %arg1: f32) -> f32 {
    %c0 = arith.constant 0 : index
    %c10 = arith.constant 10 : index
    %c1 = arith.constant 1 : index
    %0 = affine.for %arg2 = 0 to 9 iter_args(%arg3 = %arg0) -> (f32) {
      %1 = arith.addf %arg3, %arg1 : f32
      affine.yield %1 : f32
    }
    return %0 : f32
  }
  func.func @unroll_zero_trip_count_case() {
    affine.for %arg0 = 0 to 0 {
    }
    return
  }
  func.func @unroll_cleanup_loop_with_larger_unroll_factor() {
    affine.for %arg0 = 0 to 3 {
      %0 = "foo"(%arg0) : (index) -> i32
    }
    return
  }
  func.func @unroll_cleanup_loop_with_smaller_unroll_factor() {
    affine.for %arg0 = 0 to 7 {
      %0 = "foo"(%arg0) : (index) -> i32
    }
    return
  }
  func.func @unroll_cleanup_loop_with_identical_unroll_factor() {
    affine.for %arg0 = 0 to 5 {
      %0 = "foo"(%arg0) : (index) -> i32
    }
    return
  }
  func.func @known_multiple_ceildiv(%arg0: index, %arg1: index) {
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc(%arg1) : memref<?xf32>
    affine.for %arg2 = 0 to #map18(%arg0) step 8 {
      affine.store %cst, %alloc[%arg2] : memref<?xf32>
    }
    affine.for %arg2 = 0 to #map19(%arg0) {
      affine.store %cst, %alloc[%arg2] : memref<?xf32>
    }
    return
  }
}

