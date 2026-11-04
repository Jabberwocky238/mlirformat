"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "remap_input_1_to_1"}> ({
  ^bb0(%arg0: i32):
    %2 = "test.one_variadic_out_one_variadic_in1"(%arg0) : (i32) -> i32
    %3 = "test.one_variadic_out_one_variadic_in1"(%2) : (i32) -> i32
    "test.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "remap_unconverted"}> ({
    %0 = "test.remapped_value_region"() ({
      %1 = "test.type_producer"() : () -> f32
      "test.return"(%1) : (f32) -> ()
    }) : () -> f32
    "test.type_consumer"(%0) : (f32) -> ()
    "test.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

