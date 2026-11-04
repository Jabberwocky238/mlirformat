"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  %0 = "arith.constant"() <{value = true}> : () -> i1
  "func.func"() <{function_type = (!pdl.attribute, !pdl.value, !pdl.type) -> (), sym_name = "operations"}> ({
  ^bb0(%arg0: !pdl.attribute, %arg1: !pdl.value, %arg2: !pdl.type):
    %1 = "pdl_interp.create_operation"(%arg1, %arg0, %arg2) <{inputAttributeNames = ["attr"], name = "foo.op", operandSegmentSizes = array<i32: 1, 1, 1>}> : (!pdl.value, !pdl.attribute, !pdl.type) -> !pdl.operation
    %2 = "pdl_interp.create_operation"(%arg0, %arg2) <{inputAttributeNames = ["attr"], name = "foo.op", operandSegmentSizes = array<i32: 0, 1, 1>}> : (!pdl.attribute, !pdl.type) -> !pdl.operation
    %3 = "pdl_interp.create_operation"(%arg0, %arg0) <{inputAttributeNames = ["attr", "attr1"], name = "foo.op", operandSegmentSizes = array<i32: 0, 2, 0>}> : (!pdl.attribute, !pdl.attribute) -> !pdl.operation
    %4 = "pdl_interp.create_operation"(%arg1, %arg2) <{inputAttributeNames = [], name = "foo.op", operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.value, !pdl.type) -> !pdl.operation
    %5 = "pdl_interp.create_operation"() <{inferredResultTypes, inputAttributeNames = [], name = "arith.constant", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
    "pdl_interp.finalize"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!pdl.range<attribute>, !pdl.range<operation>, !pdl.range<type>, !pdl.range<value>) -> (), sym_name = "extract"}> ({
  ^bb0(%arg0: !pdl.range<attribute>, %arg1: !pdl.range<operation>, %arg2: !pdl.range<type>, %arg3: !pdl.range<value>):
    %0 = "pdl_interp.extract"(%arg0) <{index = 0 : i32}> : (!pdl.range<attribute>) -> !pdl.attribute
    %1 = "pdl_interp.extract"(%arg1) <{index = 1 : i32}> : (!pdl.range<operation>) -> !pdl.operation
    %2 = "pdl_interp.extract"(%arg2) <{index = 2 : i32}> : (!pdl.range<type>) -> !pdl.type
    %3 = "pdl_interp.extract"(%arg3) <{index = 3 : i32}> : (!pdl.range<value>) -> !pdl.value
    "pdl_interp.finalize"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!pdl.range<operation>) -> (), sym_name = "foreach"}> ({
  ^bb0(%arg0: !pdl.range<operation>):
    "pdl_interp.foreach"(%arg0)[^bb1] ({
    ^bb0(%arg1: !pdl.operation):
      %0 = "pdl_interp.get_result"(%arg1) <{index = 0 : i32}> : (!pdl.operation) -> !pdl.value
      "pdl_interp.continue"() : () -> ()
    }) : (!pdl.range<operation>) -> ()
  ^bb1:  // pred: ^bb0
    "pdl_interp.finalize"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (!pdl.value, !pdl.range<value>) -> (), sym_name = "users"}> ({
  ^bb0(%arg0: !pdl.value, %arg1: !pdl.range<value>):
    %0 = "pdl_interp.get_users"(%arg0) : (!pdl.value) -> !pdl.range<operation>
    %1 = "pdl_interp.get_users"(%arg1) : (!pdl.range<value>) -> !pdl.range<operation>
    "pdl_interp.finalize"() : () -> ()
  }) : () -> ()
}) : () -> ()

