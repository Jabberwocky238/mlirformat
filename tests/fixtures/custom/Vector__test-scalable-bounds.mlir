#map = affine_map<(d0)[s0] -> (-d0 + 32400, s0)>
#map1 = affine_map<(d0)[s0] -> (-d0 + 16, s0)>
module {
  func.func @fixed_size_loop_nest() {
    %c16 = arith.constant 16 : index
    %c32400 = arith.constant 32400 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %vscale = vector.vscale
    %c4_vscale = arith.muli %vscale, %c4 : index
    scf.for %arg0 = %c0 to %c32400 step %c4_vscale {
      %0 = affine.min #map(%arg0)[%c4_vscale]
      scf.for %arg1 = %c0 to %c16 step %c4_vscale {
        %1 = affine.min #map1(%arg1)[%c4_vscale]
        %2 = "test.reify_bound"(%0) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
        %3 = "test.reify_bound"(%1) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
        "test.some_use"(%2, %3) : (index, index) -> ()
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0, s1] -> (-d0 + s1, s0)>
module {
  func.func @dynamic_size_loop_nest(%arg0: index, %arg1: index) {
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    %vscale = vector.vscale
    %c4_vscale = arith.muli %vscale, %c4 : index
    scf.for %arg2 = %c0 to %arg0 step %c4_vscale {
      %0 = affine.min #map(%arg2)[%c4_vscale, %arg0]
      scf.for %arg3 = %c0 to %arg1 step %c4_vscale {
        %1 = affine.min #map(%arg3)[%c4_vscale, %arg1]
        %2 = "test.reify_bound"(%0) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
        %3 = "test.reify_bound"(%1) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
        "test.some_use"(%2, %3) : (index, index) -> ()
      }
    }
    return
  }
}

// -----
module {
  func.func @add_to_vscale() {
    %vscale = vector.vscale
    %c8 = arith.constant 8 : index
    %0 = arith.addi %vscale, %c8 : index
    %1 = "test.reify_bound"(%0) <{scalable, type = "EQ", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
    "test.some_use"(%1) : (index) -> ()
    return
  }
}

// -----
module {
  func.func @vscale_fixed_size() {
    %vscale = vector.vscale
    %0 = "test.reify_bound"(%vscale) <{scalable, type = "EQ", vscale_max = 2 : i64, vscale_min = 2 : i64}> : (index) -> index
    "test.some_use"(%0) : (index) -> ()
    return
  }
}

// -----
module {
  func.func @unknown_bound(%arg0: index) {
    %vscale = vector.vscale
    %0 = arith.muli %vscale, %arg0 : index
    %1 = "test.reify_bound"(%0) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
    "test.some_use"(%1) : (index) -> ()
    return
  }
}

// -----
module {
  func.func @duplicate_vscale_values() {
    %c4 = arith.constant 4 : index
    %vscale = vector.vscale
    %c2 = arith.constant 2 : index
    %vscale_0 = vector.vscale
    %c4_vscale = arith.muli %vscale, %c4 : index
    %c2_vscale = arith.muli %vscale_0, %c2 : index
    %0 = arith.addi %c2_vscale, %c4_vscale : index
    %1 = "test.reify_bound"(%0) <{scalable, type = "EQ", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
    "test.some_use"(%1) : (index) -> ()
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (-d0 + 1024, s0)>
module {
  func.func @non_scalable_code() {
    %c1024 = arith.constant 1024 : index
    %c4 = arith.constant 4 : index
    %c0 = arith.constant 0 : index
    scf.for %arg0 = %c0 to %c1024 step %c4 {
      %0 = affine.min #map(%arg0)[%c4]
      %1 = "test.reify_bound"(%0) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
      "test.some_use"(%1) : (index) -> ()
    }
    return
  }
}

// -----
#map = affine_map<()[s0] -> (-(1000 mod s0) + 1000)>
#map1 = affine_map<(d0) -> (-d0 + 1000)>
module {
  func.func @test_scalable_remainder_loop() {
    %c8 = arith.constant 8 : index
    %c1000 = arith.constant 1000 : index
    %vscale = vector.vscale
    %c8_vscale = arith.muli %vscale, %c8 : index
    %0 = affine.apply #map()[%c8_vscale]
    scf.for %arg0 = %0 to %c1000 step %c8_vscale {
      %1 = affine.apply #map1(%arg0)
      %2 = "test.reify_bound"(%1) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
      "test.some_use"(%2) : (index) -> ()
    }
    return
  }
}

// -----
#map = affine_map<()[s0] -> (s0 * s0)>
module {
  func.func @unsupported_semi_affine() {
    %vscale = vector.vscale
    %0 = affine.apply #map()[%vscale]
    %1 = "test.reify_bound"(%0) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
    "test.some_use"(%1) : (index) -> ()
    return
  }
}

// -----
#map = affine_map<()[s0] -> (1000 mod s0)>
module {
  func.func @unsupported_negative_mod() {
    %c-1 = arith.constant -1 : index
    %vscale = vector.vscale
    %c-1_vscale = arith.muli %vscale, %c-1 : index
    %0 = affine.apply #map()[%c-1_vscale]
    %1 = "test.reify_bound"(%0) <{scalable, type = "UB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
    "test.some_use"(%1) : (index) -> ()
    return
  }
}

// -----
module {
  func.func @extract_slice_loop(%arg0: tensor<1x1x3x?xf32>) {
    %vscale = vector.vscale
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %c4_vscale = arith.muli %c4, %vscale : index
    %extracted_slice = tensor.extract_slice %arg0[0, 0, 0, 0] [1, 1, 3, %c4_vscale] [1, 1, 1, 1] : tensor<1x1x3x?xf32> to tensor<1x3x?xf32>
    %0 = scf.for %arg1 = %c0 to %c3 step %c1 iter_args(%arg2 = %extracted_slice) -> (tensor<1x3x?xf32>) {
      %dim = tensor.dim %arg2, %c2 : tensor<1x3x?xf32>
      %1 = "test.reify_bound"(%dim) <{scalable, type = "LB", vscale_max = 16 : i64, vscale_min = 1 : i64}> : (index) -> index
      "test.some_use"(%1) : (index) -> ()
      scf.yield %arg2 : tensor<1x3x?xf32>
    }
    return
  }
}

