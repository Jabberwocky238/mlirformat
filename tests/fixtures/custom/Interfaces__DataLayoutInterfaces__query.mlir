module {
  func.func @no_layout_builtin() {
    %0 = "test.data_layout_query"() : () -> i32
    %1 = "test.data_layout_query"() : () -> f64
    %2 = "test.data_layout_query"() : () -> complex<f32>
    %3 = "test.data_layout_query"() : () -> complex<i6>
    %4 = "test.data_layout_query"() : () -> index
    %5 = "test.data_layout_query"() : () -> vector<4xi32>
    %6 = "test.data_layout_query"() : () -> vector<[4]xi32>
    %7 = "test.data_layout_query"() : () -> vector<[16]xi1>
    return
  }
  func.func @no_layout_custom() {
    %0 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
    return
  }
  func.func @layout_op_no_layout() {
    "test.op_with_data_layout"() ({
      %0 = "test.data_layout_query"() : () -> !test.test_type_with_layout<1000>
      "test.maybe_terminator"() : () -> ()
    }) : () -> ()
    return
  }
  func.func @layout_op() {
    "test.op_with_data_layout"() ({
      %0 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 10], !test.test_type_with_layout<20> = ["alignment", 20], !test.test_type_with_layout<30> = ["index", 30]>} : () -> ()
    return
  }
  func.func @nested_inner_only() {
    "test.op_with_data_layout"() ({
      "test.op_with_data_layout"() ({
        %0 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
        "test.maybe_terminator"() : () -> ()
      }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 10], !test.test_type_with_layout<20> = ["alignment", 20], !test.test_type_with_layout<30> = ["index", 30]>} : () -> ()
      "test.maybe_terminator"() : () -> ()
    }) : () -> ()
    return
  }
  func.func @nested_outer_only() {
    "test.op_with_data_layout"() ({
      "test.op_with_data_layout"() ({
        %0 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
        "test.maybe_terminator"() : () -> ()
      }) : () -> ()
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 10], !test.test_type_with_layout<20> = ["alignment", 20], !test.test_type_with_layout<30> = ["index", 30]>} : () -> ()
    return
  }
  func.func @nested_middle_only() {
    "test.op_with_data_layout"() ({
      "test.op_with_data_layout"() ({
        "test.op_with_data_layout"() ({
          %0 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
          "test.maybe_terminator"() : () -> ()
        }) : () -> ()
        "test.maybe_terminator"() : () -> ()
      }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 10], !test.test_type_with_layout<20> = ["alignment", 20], !test.test_type_with_layout<30> = ["index", 30]>} : () -> ()
      "test.maybe_terminator"() : () -> ()
    }) : () -> ()
    return
  }
  func.func @nested_combine_with_missing() {
    "test.op_with_data_layout"() ({
      "test.op_with_data_layout"() ({
        "test.op_with_data_layout"() ({
          %1 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
          "test.maybe_terminator"() : () -> ()
        }) : () -> ()
        "test.maybe_terminator"() : () -> ()
      }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 10], !test.test_type_with_layout<20> = ["alignment", 20]>} : () -> ()
      %0 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 42], !test.test_type_with_layout<30> = ["preferred", 30], !test.test_type_with_layout<40> = ["index", 21]>} : () -> ()
    return
  }
  func.func @nested_combine_all() {
    "test.op_with_data_layout"() ({
      "test.op_with_data_layout"() ({
        "test.op_with_data_layout"() ({
          %2 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
          "test.maybe_terminator"() : () -> ()
        }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 3], !test.test_type_with_layout<30> = ["preferred", 30]>} : () -> ()
        %1 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
        "test.maybe_terminator"() : () -> ()
      }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 10], !test.test_type_with_layout<20> = ["alignment", 20], !test.test_type_with_layout<40> = ["index", 40]>} : () -> ()
      %0 = "test.data_layout_query"() : () -> !test.test_type_with_layout<10>
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<!test.test_type_with_layout<10> = ["size", 42], !test.test_type_with_layout<30> = ["preferred", 30]>} : () -> ()
    return
  }
  func.func @integers() {
    "test.op_with_data_layout"() ({
      %0 = "test.data_layout_query"() : () -> i32
      %1 = "test.data_layout_query"() : () -> i56
      %2 = "test.data_layout_query"() : () -> i64
      %3 = "test.data_layout_query"() : () -> i128
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<i32 = dense<64> : vector<1xi64>, i64 = dense<128> : vector<1xi64>>} : () -> ()
    "test.op_with_data_layout"() ({
      %0 = "test.data_layout_query"() : () -> i32
      %1 = "test.data_layout_query"() : () -> i56
      %2 = "test.data_layout_query"() : () -> i64
      %3 = "test.data_layout_query"() : () -> i128
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<i32 = dense<[64, 128]> : vector<2xi64>, i64 = dense<[128, 256]> : vector<2xi64>>} : () -> ()
    return
  }
  func.func @floats() {
    "test.op_with_data_layout"() ({
      %0 = "test.data_layout_query"() : () -> f32
      %1 = "test.data_layout_query"() : () -> f80
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<f32 = dense<64> : vector<1xi64>, f80 = dense<128> : vector<1xi64>>} : () -> ()
    "test.op_with_data_layout"() ({
      %0 = "test.data_layout_query"() : () -> f32
      %1 = "test.data_layout_query"() : () -> f80
      "test.maybe_terminator"() : () -> ()
    }) {dlti.dl_spec = #dlti.dl_spec<f32 = dense<[64, 128]> : vector<2xi64>, f80 = dense<[128, 256]> : vector<2xi64>>} : () -> ()
    return
  }
}

