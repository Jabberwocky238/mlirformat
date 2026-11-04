"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "op_with_passthrough_region_args"}> ({
    %0 = "arith.constant"() <{value = 10 : index}> : () -> index
    "test.one_region_op"() ({
      "test.consumer"(%0) : (index) -> ()
    }) : () -> ()
    "test.isolated_region"(%0) ({
    ^bb0(%arg1: index):
      "test.consumer"(%arg1) : (index) -> ()
    }) : (index) -> ()
    %1:2 = "test.op"() : () -> (index, index)
    "test.isolated_region"(%1#1) ({
    ^bb0(%arg0: index):
      "test.consumer"(%arg0) : (index) -> ()
    }) : (index) -> ()
    "test.isolated_regions"() ({
      "test.unknown_op"() : () -> ()
    }, {
      "test.unknown_op"() : () -> ()
    }) : () -> ()
    "test.one_region_op"() ({
      "test.unknown_op"() : () -> ()
    }) : () -> ()
    "test.two_region_op"() ({
      "test.unknown_op"() : () -> ()
    }, {
      "test.consumer"(%0) : (index) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

