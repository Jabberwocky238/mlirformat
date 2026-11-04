"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_sink"}> ({
    %4 = "test.sink_me"() : () -> i32
    "test.sink_target"() ({
      "test.use"(%4) : (i32) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_sink_first_region_only"}> ({
    %2 = "test.sink_me"() {first} : () -> i32
    %3 = "test.sink_me"() {second} : () -> i32
    "test.sink_target"() ({
      "test.use"(%2) : (i32) -> ()
    }, {
      "test.use"(%3) : (i32) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_sink_targeted_op_only"}> ({
    %0 = "test.sink_me"() : () -> i32
    %1 = "test.dont_sink_me"() : () -> i32
    "test.sink_target"() ({
      "test.use"(%0, %1) : (i32, i32) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

