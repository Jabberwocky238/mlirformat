"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "no_layout_builtin"}> ({
    %23 = "test.data_layout_query"() : () -> i32
    %24 = "test.data_layout_query"() : () -> f64
    %25 = "test.data_layout_query"() : () -> complex<f32>
    %26 = "test.data_layout_query"() : () -> complex<i6>
    %27 = "test.data_layout_query"() : () -> index
    %28 = "test.data_layout_query"() : () -> vector<4xi32>
    %29 = "test.data_layout_query"() : () -> vector<[4]xi32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "no_layout_custom"}> ({
    %22 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "layout_op_no_layout"}> ({
    "test.op_with_data_layout"() ({
      %21 = "test.data_layout_query"() : () -> !test.test_type_with_layout<1000>
      "test.maybe_terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "layout_op"}> ({
    "test.op_with_data_layout"() ({
      %20 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 10], !test.test_type_with_layout<20> = ["alignment", 20], !test.test_type_with_layout<30> = ["index", 30]>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "nested_inner_only"}> ({
    "test.op_with_data_layout"() ({
      "test.op_with_data_layout"() ({
        %19 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
        "test.maybe_terminator"() : () -> ()
      }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 10], !test.test_type_with_layout<20> = ["alignment", 20], !test.test_type_with_layout<30> = ["index", 30]>} : () -> ()
      "test.maybe_terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "nested_outer_only"}> ({
    "test.op_with_data_layout"() ({
      "test.op_with_data_layout"() ({
        %18 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
        "test.maybe_terminator"() : () -> ()
      }) : () -> ()
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 10], !test.test_type_with_layout<20> = ["alignment", 20], !test.test_type_with_layout<30> = ["index", 30]>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "nested_middle_only"}> ({
    "test.op_with_data_layout"() ({
      "test.op_with_data_layout"() ({
        "test.op_with_data_layout"() ({
          %17 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
          "test.maybe_terminator"() : () -> ()
        }) : () -> ()
        "test.maybe_terminator"() : () -> ()
      }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 10], !test.test_type_with_layout<20> = ["alignment", 20], !test.test_type_with_layout<30> = ["index", 30]>} : () -> ()
      "test.maybe_terminator"() : () -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "nested_combine_with_missing"}> ({
    "test.op_with_data_layout"() ({
      "test.op_with_data_layout"() ({
        "test.op_with_data_layout"() ({
          %16 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
          "test.maybe_terminator"() : () -> ()
        }) : () -> ()
        "test.maybe_terminator"() : () -> ()
      }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 10], !test.test_type_with_layout<20> = ["alignment", 20]>} : () -> ()
      %15 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 42], !test.test_type_with_layout<30> = ["preferred", 30], !test.test_type_with_layout<40> = ["index", 21]>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "nested_combine_all"}> ({
    "test.op_with_data_layout"() ({
      "test.op_with_data_layout"() ({
        "test.op_with_data_layout"() ({
          %14 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
          "test.maybe_terminator"() : () -> ()
        }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 3], !test.test_type_with_layout<30> = ["preferred", 30]>} : () -> ()
        %13 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
        "test.maybe_terminator"() : () -> ()
      }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 10], !test.test_type_with_layout<20> = ["alignment", 20], !test.test_type_with_layout<40> = ["index", 40]>} : () -> ()
      %12 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 42], !test.test_type_with_layout<30> = ["preferred", 30]>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "integers"}> ({
    "test.op_with_data_layout"() ({
      %8 = "test.data_layout_query"() : () -> i32
      %9 = "test.data_layout_query"() : () -> i56
      %10 = "test.data_layout_query"() : () -> i64
      %11 = "test.data_layout_query"() : () -> i128
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<i32 = dense<64> : vector<1xi64>, i64 = dense<128> : vector<1xi64>>} : () -> ()
    "test.op_with_data_layout"() ({
      %4 = "test.data_layout_query"() : () -> i32
      %5 = "test.data_layout_query"() : () -> i56
      %6 = "test.data_layout_query"() : () -> i64
      %7 = "test.data_layout_query"() : () -> i128
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<i32 = dense<[64, 128]> : vector<2xi64>, i64 = dense<[128, 256]> : vector<2xi64>>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "floats"}> ({
    "test.op_with_data_layout"() ({
      %2 = "test.data_layout_query"() : () -> f32
      %3 = "test.data_layout_query"() : () -> f80
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<f32 = dense<64> : vector<1xi64>, f80 = dense<128> : vector<1xi64>>} : () -> ()
    "test.op_with_data_layout"() ({
      %0 = "test.data_layout_query"() : () -> f32
      %1 = "test.data_layout_query"() : () -> f80
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<f32 = dense<[64, 128]> : vector<2xi64>, f80 = dense<[128, 256]> : vector<2xi64>>} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

