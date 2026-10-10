module {
  func.func @scf_for_yield_only(%arg0: tensor<?xf32> {bufferization.writable = false}, %arg1: tensor<?xf32> {bufferization.writable = true}, %arg2: index, %arg3: index, %arg4: index) -> (tensor<?xf32>, tensor<?xf32>) {
    %0 = scf.for %arg5 = %arg2 to %arg3 step %arg4 iter_args(%arg6 = %arg0) -> (tensor<?xf32>) {
      scf.yield %arg6 : tensor<?xf32>
    }
    %1 = scf.for %arg5 = %arg2 to %arg3 step %arg4 iter_args(%arg6 = %arg1) -> (tensor<?xf32>) {
      scf.yield %arg6 : tensor<?xf32>
    }
    return %0, %1 : tensor<?xf32>, tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_for_with_tensor.insert_slice(%arg0: tensor<?xf32> {bufferization.writable = false}, %arg1: tensor<?xf32> {bufferization.writable = true}, %arg2: tensor<4xf32> {bufferization.writable = false}, %arg3: index, %arg4: index, %arg5: index) -> (tensor<?xf32>, tensor<?xf32>) {
    %0:2 = scf.for %arg6 = %arg3 to %arg4 step %arg5 iter_args(%arg7 = %arg0, %arg8 = %arg1) -> (tensor<?xf32>, tensor<?xf32>) {
      %inserted_slice = tensor.insert_slice %arg2 into %arg7[0] [4] [1] : tensor<4xf32> into tensor<?xf32>
      %inserted_slice_0 = tensor.insert_slice %arg2 into %arg8[0] [4] [1] : tensor<4xf32> into tensor<?xf32>
      scf.yield %inserted_slice, %inserted_slice_0 : tensor<?xf32>, tensor<?xf32>
    }
    return %0#0, %0#1 : tensor<?xf32>, tensor<?xf32>
  }
}

// -----
module {
  func.func private @some_use(tensor<?xf32>)
  func.func @scf_for_deps(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: tensor<?xf32> {bufferization.writable = true}, %arg2: index, %arg3: index, %arg4: index) -> tensor<?xf32> {
    %0 = scf.for %arg5 = %arg2 to %arg3 step %arg4 iter_args(%arg6 = %arg0) -> (tensor<?xf32>) {
      func.call @some_use(%arg6) : (tensor<?xf32>) -> ()
      scf.yield %arg6 : tensor<?xf32>
    }
    %1 = scf.for %arg5 = %arg2 to %arg3 step %arg4 iter_args(%arg6 = %arg0) -> (tensor<?xf32>) {
      func.call @some_use(%arg6) : (tensor<?xf32>) -> ()
      scf.yield %arg6 : tensor<?xf32>
    }
    return %1 : tensor<?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @reading_scf_for(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: index, %arg2: vector<5xf32>) -> (tensor<?xf32>, vector<5xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_write %arg2, %arg0[%arg1] : vector<5xf32>, tensor<?xf32>
    %1:2 = scf.for %arg3 = %c0 to %arg1 step %c1 iter_args(%arg4 = %arg0, %arg5 = %arg2) -> (tensor<?xf32>, vector<5xf32>) {
      %extracted_slice = tensor.extract_slice %arg4[%arg1] [%arg1] [1] : tensor<?xf32> to tensor<?xf32>
      %3 = vector.transfer_read %extracted_slice[%arg1], %cst : tensor<?xf32>, vector<5xf32>
      scf.yield %arg4, %3 : tensor<?xf32>, vector<5xf32>
    }
    %2 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} outs(%0 : tensor<?xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst : f32
    } -> tensor<?xf32>
    return %2, %1#1 : tensor<?xf32>, vector<5xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @non_reading_scf_for(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: index, %arg2: vector<5xf32>) -> (tensor<?xf32>, vector<5xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c10 = arith.constant 10 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.transfer_write %arg2, %arg0[%arg1] : vector<5xf32>, tensor<?xf32>
    %1:2 = scf.for %arg3 = %c0 to %c10 step %c1 iter_args(%arg4 = %arg0, %arg5 = %arg2) -> (tensor<?xf32>, vector<5xf32>) {
      %3 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} outs(%arg4 : tensor<?xf32>) {
      ^bb0(%out: f32):
        linalg.yield %cst : f32
      } -> tensor<?xf32>
      %4 = vector.transfer_read %3[%arg1], %cst : tensor<?xf32>, vector<5xf32>
      scf.yield %3, %4 : tensor<?xf32>, vector<5xf32>
    }
    %2 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} outs(%0 : tensor<?xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst : f32
    } -> tensor<?xf32>
    return %2, %1#1 : tensor<?xf32>, vector<5xf32>
  }
}

// -----
module {
  func.func @scf_if_inplace1(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: tensor<?xf32> {bufferization.writable = true}, %arg2: i1) -> tensor<?xf32> {
    %0 = scf.if %arg2 -> (tensor<?xf32>) {
      scf.yield %arg0 : tensor<?xf32>
    } else {
      scf.yield %arg1 : tensor<?xf32>
    }
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_if_inplace2(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: vector<5xf32>, %arg2: index, %arg3: i1) -> tensor<?xf32> {
    %0 = scf.if %arg3 -> (tensor<?xf32>) {
      scf.yield %arg0 : tensor<?xf32>
    } else {
      %1 = vector.transfer_write %arg1, %arg0[%arg2] : vector<5xf32>, tensor<?xf32>
      scf.yield %1 : tensor<?xf32>
    }
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_if_inplace3(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: vector<5xf32>, %arg2: vector<5xf32>, %arg3: index, %arg4: i1) -> tensor<?xf32> {
    %extracted_slice = tensor.extract_slice %arg0[%arg3] [%arg3] [1] : tensor<?xf32> to tensor<?xf32>
    %0 = scf.if %arg4 -> (tensor<?xf32>) {
      %1 = vector.transfer_write %arg1, %extracted_slice[%arg3] : vector<5xf32>, tensor<?xf32>
      scf.yield %1 : tensor<?xf32>
    } else {
      %1 = vector.transfer_write %arg2, %arg0[%arg3] : vector<5xf32>, tensor<?xf32>
      scf.yield %1 : tensor<?xf32>
    }
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_if_in_place4(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: vector<5xf32>, %arg2: index, %arg3: i1, %arg4: i1) -> (tensor<?xf32>, vector<10xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.if %arg3 -> (tensor<?xf32>) {
      scf.yield %arg0 : tensor<?xf32>
    } else {
      %3 = vector.transfer_write %arg1, %arg0[%arg2] : vector<5xf32>, tensor<?xf32>
      scf.yield %3 : tensor<?xf32>
    }
    %1 = scf.if %arg4 -> (tensor<?xf32>) {
      scf.yield %0 : tensor<?xf32>
    } else {
      scf.yield %0 : tensor<?xf32>
    }
    %2 = vector.transfer_read %1[%arg2], %cst : tensor<?xf32>, vector<10xf32>
    return %1, %2 : tensor<?xf32>, vector<10xf32>
  }
}

// -----
module {
  func.func @scf_if_inplace5(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: index, %arg2: i1) -> tensor<?xf32> {
    %0 = scf.if %arg2 -> (tensor<?xf32>) {
      %extracted_slice = tensor.extract_slice %arg0[%arg1] [%arg1] [1] : tensor<?xf32> to tensor<?xf32>
      scf.yield %extracted_slice : tensor<?xf32>
    } else {
      %extracted_slice = tensor.extract_slice %arg0[%arg1] [%arg1] [1] : tensor<?xf32> to tensor<?xf32>
      scf.yield %extracted_slice : tensor<?xf32>
    }
    %inserted_slice = tensor.insert_slice %0 into %arg0[%arg1] [%arg1] [1] : tensor<?xf32> into tensor<?xf32>
    return %inserted_slice : tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_if_inplace6(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: vector<5xf32>, %arg2: vector<5xf32>, %arg3: vector<5xf32>, %arg4: index, %arg5: i1, %arg6: i1) -> tensor<?xf32> {
    %0 = scf.if %arg5 -> (tensor<?xf32>) {
      %1 = scf.if %arg6 -> (tensor<?xf32>) {
        %2 = vector.transfer_write %arg1, %arg0[%arg4] : vector<5xf32>, tensor<?xf32>
        scf.yield %2 : tensor<?xf32>
      } else {
        %2 = vector.transfer_write %arg3, %arg0[%arg4] : vector<5xf32>, tensor<?xf32>
        scf.yield %2 : tensor<?xf32>
      }
      scf.yield %1 : tensor<?xf32>
    } else {
      %1 = vector.transfer_write %arg2, %arg0[%arg4] : vector<5xf32>, tensor<?xf32>
      scf.yield %1 : tensor<?xf32>
    }
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_if_inplace7(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: vector<5xf32>, %arg2: vector<5xf32>, %arg3: index, %arg4: index, %arg5: i1) -> (tensor<?xf32>, vector<5xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0:2 = scf.if %arg5 -> (tensor<?xf32>, vector<5xf32>) {
      %1 = vector.transfer_write %arg1, %arg0[%arg3] : vector<5xf32>, tensor<?xf32>
      scf.yield %1, %arg1 : tensor<?xf32>, vector<5xf32>
    } else {
      %1 = vector.transfer_write %arg2, %arg0[%arg3] : vector<5xf32>, tensor<?xf32>
      %2 = vector.transfer_read %arg0[%arg4], %cst : tensor<?xf32>, vector<5xf32>
      scf.yield %1, %2 : tensor<?xf32>, vector<5xf32>
    }
    return %0#0, %0#1 : tensor<?xf32>, vector<5xf32>
  }
}

// -----
module {
  func.func @scf_if_out_of_place1a(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: index, %arg2: index, %arg3: i1) -> tensor<?xf32> {
    %0 = scf.if %arg3 -> (tensor<?xf32>) {
      %extracted_slice = tensor.extract_slice %arg0[%arg1] [%arg1] [1] : tensor<?xf32> to tensor<?xf32>
      scf.yield %extracted_slice : tensor<?xf32>
    } else {
      scf.yield %arg0 : tensor<?xf32>
    }
    %inserted_slice = tensor.insert_slice %0 into %arg0[%arg2] [%arg2] [1] : tensor<?xf32> into tensor<?xf32>
    return %inserted_slice : tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_if_out_of_place1b(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: index, %arg2: index, %arg3: index, %arg4: i1) -> tensor<?xf32> {
    %0 = scf.if %arg4 -> (tensor<?xf32>) {
      %extracted_slice = tensor.extract_slice %arg0[%arg1] [%arg1] [1] : tensor<?xf32> to tensor<?xf32>
      scf.yield %extracted_slice : tensor<?xf32>
    } else {
      %extracted_slice = tensor.extract_slice %arg0[%arg2] [%arg2] [1] : tensor<?xf32> to tensor<?xf32>
      scf.yield %extracted_slice : tensor<?xf32>
    }
    %inserted_slice = tensor.insert_slice %0 into %arg0[%arg3] [%arg3] [1] : tensor<?xf32> into tensor<?xf32>
    return %inserted_slice : tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_if_out_of_place1c(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: index, %arg2: index, %arg3: i1) -> tensor<?xf32> {
    %0 = scf.if %arg3 -> (tensor<?xf32>) {
      %extracted_slice = tensor.extract_slice %arg0[%arg1] [%arg1] [1] : tensor<?xf32> to tensor<?xf32>
      scf.yield %extracted_slice : tensor<?xf32>
    } else {
      %extracted_slice = tensor.extract_slice %arg0[%arg2] [%arg2] [1] : tensor<?xf32> to tensor<?xf32>
      scf.yield %extracted_slice : tensor<?xf32>
    }
    %inserted_slice = tensor.insert_slice %0 into %arg0[%arg2] [%arg2] [1] : tensor<?xf32> into tensor<?xf32>
    return %inserted_slice : tensor<?xf32>
  }
}

// -----
module {
  func.func @scf_if_out_of_place2(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: vector<5xf32>, %arg2: index, %arg3: i1) -> (tensor<?xf32>, vector<10xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.if %arg3 -> (tensor<?xf32>) {
      scf.yield %arg0 : tensor<?xf32>
    } else {
      %2 = vector.transfer_write %arg1, %arg0[%arg2] : vector<5xf32>, tensor<?xf32>
      scf.yield %2 : tensor<?xf32>
    }
    %1 = vector.transfer_read %arg0[%arg2], %cst : tensor<?xf32>, vector<10xf32>
    return %0, %1 : tensor<?xf32>, vector<10xf32>
  }
}

// -----
module {
  func.func @scf_if_out_of_place3(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: vector<5xf32>, %arg2: index, %arg3: i1, %arg4: i1) -> (tensor<?xf32>, vector<10xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = scf.if %arg3 -> (tensor<?xf32>) {
      scf.yield %arg0 : tensor<?xf32>
    } else {
      %3 = vector.transfer_write %arg1, %arg0[%arg2] : vector<5xf32>, tensor<?xf32>
      scf.yield %3 : tensor<?xf32>
    }
    %1 = scf.if %arg4 -> (tensor<?xf32>) {
      scf.yield %arg0 : tensor<?xf32>
    } else {
      scf.yield %arg0 : tensor<?xf32>
    }
    %2 = vector.transfer_read %1[%arg2], %cst : tensor<?xf32>, vector<10xf32>
    return %0, %2 : tensor<?xf32>, vector<10xf32>
  }
}

// -----
module {
  func.func @write_to_same_tensor_in_loop_in_place(%arg0: tensor<?xf32> {bufferization.writable = true}, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> tensor<?xf32> {
    %0 = scf.for %arg5 = %arg1 to %arg2 step %arg3 iter_args(%arg6 = %arg0) -> (tensor<?xf32>) {
      %1 = bufferization.alloc_tensor(%arg4) : tensor<?xf32>
      %2 = arith.index_cast %arg5 : index to i32
      %3 = arith.sitofp %2 : i32 to f32
      %inserted = tensor.insert %3 into %1[%arg5] : tensor<?xf32>
      %inserted_slice = tensor.insert_slice %inserted into %arg6[%arg5] [%arg4] [1] : tensor<?xf32> into tensor<?xf32>
      scf.yield %inserted_slice : tensor<?xf32>
    }
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @same_enclosing_repetitive_region(%arg0: tensor<320xf32>, %arg1: tensor<320x10240xf32>) -> tensor<320xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant -0.000000e+00 : f32
    %c320 = arith.constant 320 : index
    %0 = scf.forall (%arg2) in (%c320) shared_outs(%arg3 = %arg0) -> (tensor<320xf32>) {
      %extracted_slice = tensor.extract_slice %arg1[%arg2, 0] [1, 10240] [1, 1] : tensor<320x10240xf32> to tensor<1x10240xf32>
      %extracted_slice_0 = tensor.extract_slice %arg3[%arg2] [1] [1] : tensor<320xf32> to tensor<1xf32>
      %1 = linalg.fill ins(%cst : f32) outs(%extracted_slice_0 : tensor<1xf32>) -> tensor<1xf32>
      %2 = linalg.fill ins(%cst : f32) outs(%1 : tensor<1xf32>) -> tensor<1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %2 into %arg3[%arg2] [1] [1] : tensor<1xf32> into tensor<320xf32>
      }
    }
    return %0 : tensor<320xf32>
  }
}

// -----
module {
  func.func @different_repetitive_region_via_alias(%arg0: tensor<4xf32>, %arg1: tensor<4xf32>, %arg2: index, %arg3: index, %arg4: index) -> tensor<4xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %0 = bufferization.alloc_tensor() : tensor<4xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<4xf32>) -> tensor<4xf32>
    %2 = scf.for %arg5 = %arg2 to %arg3 step %arg4 iter_args(%arg6 = %arg1) -> (tensor<4xf32>) {
      %extracted = tensor.extract %1[%arg4] : tensor<4xf32>
      vector.print %extracted : f32
      %3 = linalg.fill ins(%cst_0 : f32) outs(%0 : tensor<4xf32>) -> tensor<4xf32>
      scf.yield %3 : tensor<4xf32>
    }
    return %2 : tensor<4xf32>
  }
}

// -----
module {
  func.func @no_raw_conflict_after_repetitive_use(%arg0: tensor<4xf32>, %arg1: tensor<4xf32>, %arg2: index, %arg3: index, %arg4: index) -> (tensor<4xf32>, tensor<4xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %0 = bufferization.alloc_tensor() : tensor<4xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<4xf32>) -> tensor<4xf32>
    %2 = scf.for %arg5 = %arg2 to %arg3 step %arg4 iter_args(%arg6 = %arg1) -> (tensor<4xf32>) {
      %extracted_2 = tensor.extract %1[%arg4] : tensor<4xf32>
      vector.print %extracted_2 : f32
      %4 = linalg.fill ins(%cst_0 : f32) outs(%1 : tensor<4xf32>) -> tensor<4xf32>
      scf.yield %4 : tensor<4xf32>
    }
    %extracted = tensor.extract %1[%arg4] : tensor<4xf32>
    vector.print %extracted : f32
    %3 = linalg.fill ins(%cst_1 : f32) outs(%1 : tensor<4xf32>) -> tensor<4xf32>
    return %2, %3 : tensor<4xf32>, tensor<4xf32>
  }
}

// -----
module {
  func.func @read_of_bbarg_in_repetitive_region(%arg0: tensor<10xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: f32) {
    scf.for %arg5 = %arg1 to %arg2 step %arg3 {
      %extracted_slice = tensor.extract_slice %arg0[0] [4] [1] : tensor<10xf32> to tensor<4xf32>
      %extracted = tensor.extract %extracted_slice[%arg1] : tensor<4xf32>
      vector.print %extracted : f32
      %inserted = tensor.insert %arg4 into %extracted_slice[%arg1] : tensor<4xf32>
      %extracted_0 = tensor.extract %inserted[%arg1] : tensor<4xf32>
      vector.print %extracted_0 : f32
    }
    return
  }
}

// -----
module {
  func.func @read_definition_in_same_repetitive_region_as_write(%arg0: tensor<10xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: f32) {
    %inserted = tensor.insert %arg4 into %arg0[%arg1] : tensor<10xf32>
    scf.for %arg5 = %arg1 to %arg2 step %arg3 {
      %extracted_slice = tensor.extract_slice %inserted[0] [4] [1] : tensor<10xf32> to tensor<4xf32>
      %extracted = tensor.extract %extracted_slice[%arg1] : tensor<4xf32>
      vector.print %extracted : f32
    }
    return
  }
}

// -----
module {
  func.func @read_definition_in_same_repetitive_region_as_conflicting_write(%arg0: tensor<10xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: f32) {
    %inserted = tensor.insert %arg4 into %arg0[%arg1] : tensor<10xf32>
    scf.for %arg5 = %arg1 to %arg2 step %arg3 {
      %extracted_slice = tensor.extract_slice %arg0[0] [4] [1] : tensor<10xf32> to tensor<4xf32>
      %extracted = tensor.extract %extracted_slice[%arg1] : tensor<4xf32>
      vector.print %extracted : f32
    }
    return
  }
}

// -----
module {
  func.func @write_value_in_repetitive_region(%arg0: tensor<10xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: f32) {
    %extracted = tensor.extract %arg0[%arg1] : tensor<10xf32>
    vector.print %extracted : f32
    scf.for %arg5 = %arg1 to %arg2 step %arg3 {
      %extracted_slice = tensor.extract_slice %arg0[0] [4] [1] : tensor<10xf32> to tensor<4xf32>
      %0 = linalg.fill ins(%arg4 : f32) outs(%extracted_slice : tensor<4xf32>) -> tensor<4xf32>
      %extracted_0 = tensor.extract %0[%arg1] : tensor<4xf32>
      vector.print %extracted_0 : f32
    }
    return
  }
}

// -----
module {
  func.func @nesting_op_repetitive_regions(%arg0: tensor<10xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: f32) {
    %inserted = tensor.insert %arg4 into %arg0[%arg1] : tensor<10xf32>
    scf.for %arg5 = %arg1 to %arg2 step %arg3 {
      scf.for %arg6 = %arg1 to %arg2 step %arg3 {
        scf.for %arg7 = %arg1 to %arg2 step %arg3 {
          %extracted_slice = tensor.extract_slice %arg0[0] [4] [1] : tensor<10xf32> to tensor<4xf32>
          %extracted = tensor.extract %extracted_slice[%arg1] : tensor<4xf32>
          vector.print %extracted : f32
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @parallel_region() -> tensor<320xf32> {
    %0 = bufferization.alloc_tensor() : tensor<320xf32>
    %1 = bufferization.alloc_tensor() : tensor<1xf32>
    %c320 = arith.constant 320 : index
    %2 = scf.forall (%arg0) in (%c320) shared_outs(%arg1 = %0) -> (tensor<320xf32>) {
      %3 = "test.foo"() : () -> f32
      %4 = linalg.fill ins(%3 : f32) outs(%1 : tensor<1xf32>) -> tensor<1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %4 into %arg1[%arg0] [1] [1] : tensor<1xf32> into tensor<320xf32>
      }
    }
    return %2 : tensor<320xf32>
  }
}

// -----
module {
  func.func @parallel_region_mixed_def(%arg0: i1) -> tensor<320xf32> {
    %0 = bufferization.alloc_tensor() : tensor<320xf32>
    %1 = bufferization.alloc_tensor() : tensor<1xf32>
    %c320 = arith.constant 320 : index
    %2 = scf.forall (%arg1) in (%c320) shared_outs(%arg2 = %0) -> (tensor<320xf32>) {
      %3 = bufferization.alloc_tensor() : tensor<1xf32>
      %4 = scf.if %arg0 -> (tensor<1xf32>) {
        scf.yield %1 : tensor<1xf32>
      } else {
        scf.yield %3 : tensor<1xf32>
      }
      %5 = "test.foo"() : () -> f32
      %6 = linalg.fill ins(%5 : f32) outs(%4 : tensor<1xf32>) -> tensor<1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %6 into %arg2[%arg1] [1] [1] : tensor<1xf32> into tensor<320xf32>
      }
    }
    return %2 : tensor<320xf32>
  }
}

// -----
module {
  func.func @parallel_region_two_writes(%arg0: f32) -> tensor<320xf32> {
    %0 = bufferization.alloc_tensor() : tensor<320xf32>
    %1 = bufferization.alloc_tensor() : tensor<1xf32>
    %c320 = arith.constant 320 : index
    %c0 = arith.constant 0 : index
    %2 = scf.forall (%arg1) in (%c320) shared_outs(%arg2 = %0) -> (tensor<320xf32>) {
      %3 = "test.foo"() : () -> f32
      %4 = linalg.fill ins(%3 : f32) outs(%1 : tensor<1xf32>) -> tensor<1xf32>
      %inserted = tensor.insert %arg0 into %4[%c0] : tensor<1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %inserted into %arg2[%arg1] [1] [1] : tensor<1xf32> into tensor<320xf32>
      }
    }
    return %2 : tensor<320xf32>
  }
}

// -----
module {
  func.func @parallel_region_no_read() {
    %0 = bufferization.alloc_tensor() : tensor<320xf32>
    %1 = bufferization.alloc_tensor() : tensor<1xf32>
    %c320 = arith.constant 320 : index
    scf.forall (%arg0) in (%c320) {
      %2 = "test.foo"() : () -> f32
      %3 = linalg.fill ins(%2 : f32) outs(%1 : tensor<1xf32>) -> tensor<1xf32>
    }
    return
  }
}

// -----
module {
  func.func @in_order_multiple_parallel_writes(%arg0: tensor<320xf32> {bufferization.writable = true}, %arg1: tensor<320xf32> {bufferization.writable = true}) -> (tensor<320xf32>, tensor<320xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant -0.000000e+00 : f32
    %c320 = arith.constant 320 : index
    %0:2 = scf.forall (%arg2) in (%c320) shared_outs(%arg3 = %arg0, %arg4 = %arg1) -> (tensor<320xf32>, tensor<320xf32>) {
      %extracted_slice = tensor.extract_slice %arg3[%arg2] [1] [1] : tensor<320xf32> to tensor<1xf32>
      %extracted_slice_0 = tensor.extract_slice %arg4[%arg2] [1] [1] : tensor<320xf32> to tensor<1xf32>
      %1 = linalg.fill ins(%cst : f32) outs(%extracted_slice_0 : tensor<1xf32>) -> tensor<1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %extracted_slice into %arg4[%arg2] [1] [1] : tensor<1xf32> into tensor<320xf32>
        tensor.parallel_insert_slice %1 into %arg3[%arg2] [1] [1] : tensor<1xf32> into tensor<320xf32>
      }
    }
    return %0#0, %0#1 : tensor<320xf32>, tensor<320xf32>
  }
}

// -----
module {
  func.func @out_of_order_parallel_write(%arg0: tensor<320xf32> {bufferization.writable = true}, %arg1: tensor<320xf32> {bufferization.writable = true}) -> (tensor<320xf32>, tensor<320xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant -0.000000e+00 : f32
    %c320 = arith.constant 320 : index
    %0:2 = scf.forall (%arg2) in (%c320) shared_outs(%arg3 = %arg0, %arg4 = %arg1) -> (tensor<320xf32>, tensor<320xf32>) {
      %extracted_slice = tensor.extract_slice %arg3[%arg2] [1] [1] : tensor<320xf32> to tensor<1xf32>
      %1 = linalg.fill ins(%cst : f32) outs(%extracted_slice : tensor<1xf32>) -> tensor<1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %1 into %arg3[%arg2] [1] [1] : tensor<1xf32> into tensor<320xf32>
        tensor.parallel_insert_slice %extracted_slice into %arg4[%arg2] [1] [1] : tensor<1xf32> into tensor<320xf32>
      }
    }
    return %0#0, %0#1 : tensor<320xf32>, tensor<320xf32>
  }
}

// -----
module {
  func.func @out_of_order_parallel_write_multiple_reads(%arg0: tensor<320xf32> {bufferization.writable = true}, %arg1: tensor<320xf32> {bufferization.writable = true}) -> (tensor<320xf32>, tensor<320xf32>) {
    %c0 = arith.constant 0 : index
    %cst = arith.constant -0.000000e+00 : f32
    %c320 = arith.constant 320 : index
    %0:2 = scf.forall (%arg2) in (%c320) shared_outs(%arg3 = %arg0, %arg4 = %arg1) -> (tensor<320xf32>, tensor<320xf32>) {
      %extracted_slice = tensor.extract_slice %arg3[%arg2] [1] [1] : tensor<320xf32> to tensor<1xf32>
      %1 = linalg.fill ins(%cst : f32) outs(%extracted_slice : tensor<1xf32>) -> tensor<1xf32>
      %2 = arith.subi %c320, %arg2 : index
      %extracted_slice_0 = tensor.extract_slice %arg3[%2] [1] [1] : tensor<320xf32> to tensor<1xf32>
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %1 into %arg3[%arg2] [1] [1] : tensor<1xf32> into tensor<320xf32>
        tensor.parallel_insert_slice %extracted_slice_0 into %arg4[%2] [1] [1] : tensor<1xf32> into tensor<320xf32>
      }
    }
    return %0#0, %0#1 : tensor<320xf32>, tensor<320xf32>
  }
}

// -----
module {
  func.func @in_order_multiple_parallel_writes(%arg0: tensor<320xf32> {bufferization.writable = true}) -> tensor<320xf32> {
    %c0 = arith.constant 0 : index
    %cst = arith.constant -0.000000e+00 : f32
    %c320 = arith.constant 320 : index
    %0 = scf.forall (%arg1) in (%c320) shared_outs(%arg2 = %arg0) -> (tensor<320xf32>) {
      %extracted_slice = tensor.extract_slice %arg2[%arg1] [1] [1] : tensor<320xf32> to tensor<1xf32>
      %1 = arith.subi %c320, %arg1 : index
      scf.forall.in_parallel {
        tensor.parallel_insert_slice %extracted_slice into %arg2[%1] [1] [1] : tensor<1xf32> into tensor<320xf32>
      }
    }
    return %0 : tensor<320xf32>
  }
}

