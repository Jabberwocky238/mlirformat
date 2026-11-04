module {
  func.func @testSingleInvolution(%arg0: i32) -> i32 {
    %0 = "test.op_involution_trait_no_operation_fold"(%arg0) : (i32) -> i32
    return %0 : i32
  }
  func.func @testDoubleInvolution(%arg0: i32) -> i32 {
    %0 = "test.op_involution_trait_no_operation_fold"(%arg0) : (i32) -> i32
    %1 = "test.op_involution_trait_no_operation_fold"(%0) : (i32) -> i32
    return %1 : i32
  }
  func.func @testTripleInvolution(%arg0: i32) -> i32 {
    %0 = "test.op_involution_trait_no_operation_fold"(%arg0) : (i32) -> i32
    %1 = "test.op_involution_trait_no_operation_fold"(%0) : (i32) -> i32
    %2 = "test.op_involution_trait_no_operation_fold"(%1) : (i32) -> i32
    return %2 : i32
  }
  func.func @testFailingOperationFolder(%arg0: i32) -> i32 {
    %0 = "test.op_involution_trait_failing_operation_fold"(%arg0) : (i32) -> i32
    %1 = "test.op_involution_trait_failing_operation_fold"(%0) : (i32) -> i32
    return %1 : i32
  }
  func.func @testInhibitInvolution(%arg0: i32) -> i32 {
    %0 = "test.op_involution_trait_succesful_operation_fold"(%arg0) : (i32) -> i32
    %1 = "test.op_involution_trait_succesful_operation_fold"(%0) : (i32) -> i32
    return %1 : i32
  }
  func.func @testSingleIdempotent(%arg0: i32) -> i32 {
    %0 = "test.op_idempotent_trait"(%arg0) : (i32) -> i32
    return %0 : i32
  }
  func.func @testDoubleIdempotent(%arg0: i32) -> i32 {
    %0 = "test.op_idempotent_trait"(%arg0) : (i32) -> i32
    %1 = "test.op_idempotent_trait"(%0) : (i32) -> i32
    return %1 : i32
  }
  func.func @testTripleIdempotent(%arg0: i32) -> i32 {
    %0 = "test.op_idempotent_trait"(%arg0) : (i32) -> i32
    %1 = "test.op_idempotent_trait"(%0) : (i32) -> i32
    %2 = "test.op_idempotent_trait"(%1) : (i32) -> i32
    return %2 : i32
  }
  func.func @testBinaryIdempotent(%arg0: i32) -> i32 {
    %0 = "test.op_idempotent_trait_binary"(%arg0, %arg0) : (i32, i32) -> i32
    return %0 : i32
  }
}

