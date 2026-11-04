"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> i32, sym_name = "testSingleInvolution"}> ({
  ^bb0(%arg8: i32):
    %16 = "test.op_involution_trait_no_operation_fold"(%arg8) : (i32) -> i32
    "func.return"(%16) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "testDoubleInvolution"}> ({
  ^bb0(%arg7: i32):
    %14 = "test.op_involution_trait_no_operation_fold"(%arg7) : (i32) -> i32
    %15 = "test.op_involution_trait_no_operation_fold"(%14) : (i32) -> i32
    "func.return"(%15) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "testTripleInvolution"}> ({
  ^bb0(%arg6: i32):
    %11 = "test.op_involution_trait_no_operation_fold"(%arg6) : (i32) -> i32
    %12 = "test.op_involution_trait_no_operation_fold"(%11) : (i32) -> i32
    %13 = "test.op_involution_trait_no_operation_fold"(%12) : (i32) -> i32
    "func.return"(%13) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "testFailingOperationFolder"}> ({
  ^bb0(%arg5: i32):
    %9 = "test.op_involution_trait_failing_operation_fold"(%arg5) : (i32) -> i32
    %10 = "test.op_involution_trait_failing_operation_fold"(%9) : (i32) -> i32
    "func.return"(%10) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "testInhibitInvolution"}> ({
  ^bb0(%arg4: i32):
    %7 = "test.op_involution_trait_succesful_operation_fold"(%arg4) : (i32) -> i32
    %8 = "test.op_involution_trait_succesful_operation_fold"(%7) : (i32) -> i32
    "func.return"(%8) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "testSingleIdempotent"}> ({
  ^bb0(%arg3: i32):
    %6 = "test.op_idempotent_trait"(%arg3) : (i32) -> i32
    "func.return"(%6) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "testDoubleIdempotent"}> ({
  ^bb0(%arg2: i32):
    %4 = "test.op_idempotent_trait"(%arg2) : (i32) -> i32
    %5 = "test.op_idempotent_trait"(%4) : (i32) -> i32
    "func.return"(%5) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "testTripleIdempotent"}> ({
  ^bb0(%arg1: i32):
    %1 = "test.op_idempotent_trait"(%arg1) : (i32) -> i32
    %2 = "test.op_idempotent_trait"(%1) : (i32) -> i32
    %3 = "test.op_idempotent_trait"(%2) : (i32) -> i32
    "func.return"(%3) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> i32, sym_name = "testBinaryIdempotent"}> ({
  ^bb0(%arg0: i32):
    %0 = "test.op_idempotent_trait_binary"(%arg0, %arg0) : (i32, i32) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

