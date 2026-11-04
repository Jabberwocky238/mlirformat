"builtin.module"() ({
  "emitc.class"() <{sym_name = "modelClass"}> ({
    "emitc.field"() <{sym_name = "fieldName0", type = !emitc.array<1xf32>}> : () -> ()
    "emitc.field"() <{sym_name = "fieldName1", type = !emitc.array<1xf32>}> : () -> ()
    "emitc.func"() <{function_type = () -> (), sym_name = "execute"}> ({
      %6 = "emitc.constant"() <{value = 0 : index}> : () -> !emitc.size_t
      %7 = "emitc.get_field"() <{field_name = @fieldName0}> : () -> !emitc.array<1xf32>
      %8 = "emitc.get_field"() <{field_name = @fieldName1}> : () -> !emitc.array<1xf32>
      %9 = "emitc.subscript"(%7, %6) : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
      "emitc.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "emitc.class"() <{final_specifier, sym_name = "finalClass"}> ({
    "emitc.field"() <{sym_name = "fieldName0", type = !emitc.array<1xf32>}> : () -> ()
    "emitc.field"() <{sym_name = "fieldName1", type = !emitc.array<1xf32>}> : () -> ()
    "emitc.func"() <{function_type = () -> (), sym_name = "execute"}> ({
      %2 = "emitc.constant"() <{value = 0 : index}> : () -> !emitc.size_t
      %3 = "emitc.get_field"() <{field_name = @fieldName0}> : () -> !emitc.array<1xf32>
      %4 = "emitc.get_field"() <{field_name = @fieldName1}> : () -> !emitc.array<1xf32>
      %5 = "emitc.subscript"(%3, %2) : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
      "emitc.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "emitc.class"() <{sym_name = "mainClass"}> ({
    "emitc.field"() <{initial_value = dense<0.000000e+00> : tensor<2xf32>, sym_name = "fieldName0", type = !emitc.array<2xf32>}> {attrs = {emitc.name_hint = "another_feature"}} : () -> ()
    "emitc.func"() <{function_type = () -> (), sym_name = "get_fieldName0"}> ({
      %1 = "emitc.get_field"() <{field_name = @fieldName0}> : () -> !emitc.array<2xf32>
      "emitc.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "emitc.class"() <{sym_name = "reflectionClass"}> ({
    "emitc.field"() <{initial_value = #emitc.opaque<"{ { \22another_feature\22, \22fieldName0\22 } }">, sym_name = "reflectionMap", type = !emitc.opaque<"const std::map<std::string, std::string>">}> : () -> ()
    "emitc.func"() <{function_type = () -> (), sym_name = "get_reflectionMap"}> ({
      %0 = "emitc.get_field"() <{field_name = @reflectionMap}> : () -> !emitc.opaque<"const std::map<std::string, std::string>">
      "emitc.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

