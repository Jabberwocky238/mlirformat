"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "roundtripOperandSizeAttr"}> ({
  ^bb0(%arg0: i32):
    "test.attr_sized_operands"(%arg0, %arg0, %arg0, %arg0) <{operandSegmentSizes = array<i32: 0, 2, 1, 1>}> : (i32, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

