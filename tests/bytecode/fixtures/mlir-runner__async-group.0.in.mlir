"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":3:10)
    %1 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":4:10)
    %2 = "async.create_group"(%1) : (index) -> !async.group loc("<stdin>":5:10)
    %3 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> () loc("<stdin>":7:7)
    }) : () -> !async.token loc("<stdin>":6:10)
    %4 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> () loc("<stdin>":10:7)
    }) : () -> !async.token loc("<stdin>":9:10)
    %5 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> () loc("<stdin>":13:7)
    }) : () -> !async.token loc("<stdin>":12:10)
    %6 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> () loc("<stdin>":16:7)
    }) : () -> !async.token loc("<stdin>":15:10)
    %7 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.yield"() : () -> () loc("<stdin>":19:7)
    }) : () -> !async.token loc("<stdin>":18:10)
    %8 = "async.add_to_group"(%3, %2) : (!async.token, !async.group) -> index loc("<stdin>":21:10)
    %9 = "async.add_to_group"(%4, %2) : (!async.token, !async.group) -> index loc("<stdin>":22:10)
    %10 = "async.add_to_group"(%5, %2) : (!async.token, !async.group) -> index loc("<stdin>":23:11)
    %11 = "async.add_to_group"(%6, %2) : (!async.token, !async.group) -> index loc("<stdin>":24:11)
    %12 = "async.add_to_group"(%7, %2) : (!async.token, !async.group) -> index loc("<stdin>":25:11)
    %13 = "async.execute"() <{operandSegmentSizes = array<i32: 0, 0>}> ({
      "async.await_all"(%2) : (!async.group) -> () loc("<stdin>":27:7)
      "async.yield"() : () -> () loc("<stdin>":28:7)
    }) : () -> !async.token loc("<stdin>":26:11)
    %14 = "async.create_group"(%0) : (index) -> !async.group loc("<stdin>":30:11)
    %15 = "async.add_to_group"(%13, %14) : (!async.token, !async.group) -> index loc("<stdin>":31:11)
    "async.await_all"(%14) : (!async.group) -> () loc("<stdin>":32:5)
    "func.call"() <{callee = @mlirAsyncRuntimePrintCurrentThreadId}> : () -> () loc("<stdin>":33:5)
    "func.return"() : () -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> (), sym_name = "mlirAsyncRuntimePrintCurrentThreadId", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":36:3)
}) : () -> () loc("<stdin>":1:1)
