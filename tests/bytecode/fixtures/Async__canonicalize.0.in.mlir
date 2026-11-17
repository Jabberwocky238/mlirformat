"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "empty_execute"}> ({
    %0 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> () loc("<stdin>":4:7)
    }) : () -> !async.token loc("<stdin>":3:10)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
