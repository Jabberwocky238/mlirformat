module {
  func.func @remap_input_1_to_1(%arg0: i32) {
    %0 = "test.one_variadic_out_one_variadic_in1"(%arg0) : (i32) -> i32
    %1 = "test.one_variadic_out_one_variadic_in1"(%0) : (i32) -> i32
    "test.return"() : () -> ()
  }
  func.func @remap_unconverted() {
    %0 = "test.remapped_value_region"() ({
      %1 = "test.type_producer"() : () -> f32
      "test.return"(%1) : (f32) -> ()
    }) : () -> f32
    "test.type_consumer"(%0) : (f32) -> ()
    "test.return"() : () -> ()
  }
}

