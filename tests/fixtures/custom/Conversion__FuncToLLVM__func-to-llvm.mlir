module {
  func.func @empty() {
    return
  }
  func.func private @body(index)
  func.func @simple_loop() {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c1 = arith.constant 1 : index
    %c42 = arith.constant 42 : index
    cf.br ^bb2(%c1 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb3
    %1 = arith.cmpi slt, %0, %c42 : index
    cf.cond_br %1, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    call @body(%0) : (index) -> ()
    %c1_0 = arith.constant 1 : index
    %2 = arith.addi %0, %c1_0 : index
    cf.br ^bb2(%2 : index)
  ^bb4:  // pred: ^bb2
    return
  }
  func.func @simple_caller() {
    call @simple_loop() : () -> ()
    return
  }
  func.func @call_with_attributes() {
    call @simple_loop() {baz = [1, 2, 3, 4], foo = "bar"} : () -> ()
    return
  }
  func.func @ml_caller() {
    call @simple_loop() : () -> ()
    call @more_imperfectly_nested_loops() : () -> ()
    return
  }
  func.func private @body_args(index) -> index
  func.func private @other(index, i32) -> i32
  func.func @func_args(%arg0: i32, %arg1: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0 = arith.constant 0 : index
    %c42 = arith.constant 42 : index
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb3
    %1 = arith.cmpi slt, %0, %c42 : index
    cf.cond_br %1, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    %2 = call @body_args(%0) : (index) -> index
    %3 = call @other(%2, %arg0) : (index, i32) -> i32
    %4 = call @other(%2, %3) : (index, i32) -> i32
    %5 = call @other(%2, %arg1) : (index, i32) -> i32
    %c1 = arith.constant 1 : index
    %6 = arith.addi %0, %c1 : index
    cf.br ^bb2(%6 : index)
  ^bb4:  // pred: ^bb2
    %c0_0 = arith.constant 0 : index
    %7 = call @other(%c0_0, %c0_i32) : (index, i32) -> i32
    return %7 : i32
  }
  func.func private @pre(index)
  func.func private @body2(index, index)
  func.func private @post(index)
  func.func @imperfectly_nested_loops() {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0 = arith.constant 0 : index
    %c42 = arith.constant 42 : index
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb7
    %1 = arith.cmpi slt, %0, %c42 : index
    cf.cond_br %1, ^bb3, ^bb8
  ^bb3:  // pred: ^bb2
    call @pre(%0) : (index) -> ()
    cf.br ^bb4
  ^bb4:  // pred: ^bb3
    %c7 = arith.constant 7 : index
    %c56 = arith.constant 56 : index
    cf.br ^bb5(%c7 : index)
  ^bb5(%2: index):  // 2 preds: ^bb4, ^bb6
    %3 = arith.cmpi slt, %2, %c56 : index
    cf.cond_br %3, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    call @body2(%0, %2) : (index, index) -> ()
    %c2 = arith.constant 2 : index
    %4 = arith.addi %2, %c2 : index
    cf.br ^bb5(%4 : index)
  ^bb7:  // pred: ^bb5
    call @post(%0) : (index) -> ()
    %c1 = arith.constant 1 : index
    %5 = arith.addi %0, %c1 : index
    cf.br ^bb2(%5 : index)
  ^bb8:  // pred: ^bb2
    return
  }
  func.func private @mid(index)
  func.func private @body3(index, index)
  func.func @more_imperfectly_nested_loops() {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %c0 = arith.constant 0 : index
    %c42 = arith.constant 42 : index
    cf.br ^bb2(%c0 : index)
  ^bb2(%0: index):  // 2 preds: ^bb1, ^bb11
    %1 = arith.cmpi slt, %0, %c42 : index
    cf.cond_br %1, ^bb3, ^bb12
  ^bb3:  // pred: ^bb2
    call @pre(%0) : (index) -> ()
    cf.br ^bb4
  ^bb4:  // pred: ^bb3
    %c7 = arith.constant 7 : index
    %c56 = arith.constant 56 : index
    cf.br ^bb5(%c7 : index)
  ^bb5(%2: index):  // 2 preds: ^bb4, ^bb6
    %3 = arith.cmpi slt, %2, %c56 : index
    cf.cond_br %3, ^bb6, ^bb7
  ^bb6:  // pred: ^bb5
    call @body2(%0, %2) : (index, index) -> ()
    %c2 = arith.constant 2 : index
    %4 = arith.addi %2, %c2 : index
    cf.br ^bb5(%4 : index)
  ^bb7:  // pred: ^bb5
    call @mid(%0) : (index) -> ()
    cf.br ^bb8
  ^bb8:  // pred: ^bb7
    %c18 = arith.constant 18 : index
    %c37 = arith.constant 37 : index
    cf.br ^bb9(%c18 : index)
  ^bb9(%5: index):  // 2 preds: ^bb8, ^bb10
    %6 = arith.cmpi slt, %5, %c37 : index
    cf.cond_br %6, ^bb10, ^bb11
  ^bb10:  // pred: ^bb9
    call @body3(%0, %5) : (index, index) -> ()
    %c3 = arith.constant 3 : index
    %7 = arith.addi %5, %c3 : index
    cf.br ^bb9(%7 : index)
  ^bb11:  // pred: ^bb9
    call @post(%0) : (index) -> ()
    %c1 = arith.constant 1 : index
    %8 = arith.addi %0, %c1 : index
    cf.br ^bb2(%8 : index)
  ^bb12:  // pred: ^bb2
    return
  }
  func.func private @get_i64() -> i64
  func.func private @get_f32() -> f32
  func.func private @get_c16() -> complex<f16>
  func.func private @get_c32() -> complex<f32>
  func.func private @get_c64() -> complex<f64>
  func.func private @get_memref() -> memref<42x?x10x?xf32>
  func.func @multireturn() -> (i64, f32, memref<42x?x10x?xf32>) {
    %0 = call @get_i64() : () -> i64
    %1 = call @get_f32() : () -> f32
    %2 = call @get_memref() : () -> memref<42x?x10x?xf32>
    return %0, %1, %2 : i64, f32, memref<42x?x10x?xf32>
  }
  func.func @multireturn_caller() {
    %0:3 = call @multireturn() : () -> (i64, f32, memref<42x?x10x?xf32>)
    %c42_i64 = arith.constant 42 : i64
    %1 = arith.addi %0#0, %c42_i64 : i64
    %cst = arith.constant 4.200000e+01 : f32
    %2 = arith.addf %0#1, %cst : f32
    %c0 = arith.constant 0 : index
    return
  }
  func.func @dfs_block_order(%arg0: i32) -> i32 {
    %c42_i32 = arith.constant 42 : i32
    cf.br ^bb2
  ^bb1:  // pred: ^bb2
    %0 = arith.addi %arg0, %c42_i32 : i32
    return %0 : i32
  ^bb2:  // pred: ^bb0
    cf.br ^bb1
  }
  func.func @ceilf(%arg0: f32) {
    %0 = math.ceil %arg0 : f32
    return
  }
  func.func @floorf(%arg0: f32) {
    %0 = math.floor %arg0 : f32
    return
  }
  module {
    func.func @assert_test_function(%arg0: i1) {
      cf.assert %arg0, "Computer says no"
      return
    }
  }
  func.func @call_zero_result_func() {
    call @zero_result_func() : () -> ()
    return
  }
  func.func private @zero_result_func()
  func.func @fmaf(%arg0: f32, %arg1: vector<4xf32>) {
    %0 = math.fma %arg0, %arg0, %arg0 : f32
    %1 = math.fma %arg1, %arg1, %arg1 : vector<4xf32>
    return
  }
  func.func @switchi8(%arg0: i8) -> i32 {
    cf.switch %arg0 : i8, [
      default: ^bb1,
      42: ^bb1,
      43: ^bb2
    ]
  ^bb1:  // 2 preds: ^bb0, ^bb0
    %c1_i32 = arith.constant 1 : i32
    return %c1_i32 : i32
  ^bb2:  // pred: ^bb0
    %c42_i32 = arith.constant 42 : i32
    return %c42_i32 : i32
  }
  func.func @index_arg(%arg0: index) -> index {
    cf.br ^bb1(%arg0 : index)
  ^bb1(%0: index):  // pred: ^bb0
    return %0 : index
  }
  func.func @non_convertible_arg_type(%arg0: vector<1xtf32>) {
    return
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["func.func"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      transform.apply_conversion_patterns to %0 {
        transform.apply_conversion_patterns.dialect_to_llvm "math"
        transform.apply_conversion_patterns.dialect_to_llvm "arith"
        transform.apply_conversion_patterns.dialect_to_llvm "cf"
        transform.apply_conversion_patterns.func.func_to_llvm
      } with type_converter {
        transform.apply_conversion_patterns.memref.memref_to_llvm_type_converter {index_bitwidth = 32 : i64, use_opaque_pointers = true}
      } {legal_dialects = ["llvm"], partial_conversion} : !transform.any_op
      transform.yield 
    }
  }
}

