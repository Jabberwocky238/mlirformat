module {
  func.func @test_valid_arg_materialization(%arg0: i64) {
    "foo.return"(%arg0) : (i64) -> ()
  }
}

// -----
module {
  func.func @test_transitive_use_materialization() {
    %0 = "test.another_type_producer"() : () -> f32
    "foo.return"(%0) : (f32) -> ()
  }
}

// -----
module {
  func.func @test_valid_result_legalization() {
    %0 = "test.type_producer"() : () -> f32
    "foo.return"(%0) : (f32) -> ()
  }
}

// -----
module {
  func.func @test_signature_conversion_undo() {
    "test.signature_conversion_undo"() ({
    ^bb0(%arg0: f32):
      "test.type_consumer"(%arg0) : (f32) -> ()
      "test.return"(%arg0) : (f32) -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @test_block_argument_not_converted() {
    "test.unsupported_block_arg_type"() ({
    ^bb0(%arg0: index):
      "test.return"(%arg0) : (index) -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @recursive_type_conversion() {
    %0 = "test.type_producer"() : () -> !test.test_rec<something, test_rec<something>>
    return
  }
}

// -----
module {
  llvm.func @unsupported_func_op_interface() {
    llvm.return
  }
}

// -----
module {
  func.func @test_signature_conversion_no_converter() {
    "test.signature_conversion_no_converter"() ({
    ^bb0(%arg0: f32):
      "test.replace_with_legal_op"(%arg0) : (f32) -> ()
      "test.return"() : () -> ()
    }) : () -> ()
    return
  }
}

// -----
module {
  func.func @test_unstructured_cf_conversion(%arg0: f32, %arg1: i1) {
    "test.foo"(%arg0) : (f32) -> ()
    cf.br ^bb1(%arg0 : f32)
  ^bb1(%0: f32):  // 2 preds: ^bb0, ^bb1
    cf.cond_br %arg1, ^bb1(%0 : f32), ^bb2(%0 : f32)
  ^bb2(%1: f32):  // pred: ^bb1
    "test.bar"(%1) : (f32) -> ()
    return
  }
}

// -----
module {
  gpu.module @cuda_events {
    gpu.func @func_with_workgroup_args(%arg0: memref<?xi32>, %arg1: i32) workgroup(%arg2 : memref<512xi32>) kernel {
      %c0 = arith.constant 0 : index
      %0 = memref.load %arg0[%c0] : memref<?xi32>
      memref.store %0, %arg0[%c0] : memref<?xi32>
      gpu.return
    }
  }
}

