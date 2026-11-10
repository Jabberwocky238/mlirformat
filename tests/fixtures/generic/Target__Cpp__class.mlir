"builtin.module"() ({
  "emitc.class"() <{class_type = 0 : i32, sym_name = "modelClass"}> ({
    "emitc.field"() <{sym_name = "fieldName0", type = !emitc.array<1xf32>}> : () -> ()
    "emitc.field"() <{sym_name = "fieldName1", type = !emitc.array<1xf32>}> : () -> ()
    "emitc.func"() <{function_type = () -> (), sym_name = "execute"}> ({
      %9 = "emitc.constant"() <{value = 0 : index}> : () -> !emitc.size_t
      %10 = "emitc.get_field"() <{field_name = @fieldName0}> : () -> !emitc.array<1xf32>
      %11 = "emitc.get_field"() <{field_name = @fieldName1}> : () -> !emitc.array<1xf32>
      %12 = "emitc.subscript"(%10, %9) : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
      "emitc.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "emitc.class"() <{class_type = 0 : i32, final_specifier, sym_name = "finalClass"}> ({
    "emitc.field"() <{sym_name = "fieldName0", type = !emitc.array<1xf32>}> : () -> ()
    "emitc.field"() <{sym_name = "fieldName1", type = !emitc.array<1xf32>}> : () -> ()
    "emitc.func"() <{function_type = () -> (), sym_name = "execute"}> ({
      %5 = "emitc.constant"() <{value = 0 : index}> : () -> !emitc.size_t
      %6 = "emitc.get_field"() <{field_name = @fieldName0}> : () -> !emitc.array<1xf32>
      %7 = "emitc.get_field"() <{field_name = @fieldName1}> : () -> !emitc.array<1xf32>
      %8 = "emitc.subscript"(%6, %5) : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
      "emitc.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "emitc.class"() <{class_type = 0 : i32, sym_name = "mainClass"}> ({
    "emitc.field"() <{initial_value = dense<0.000000e+00> : tensor<2xf32>, sym_name = "fieldName0", type = !emitc.array<2xf32>}> {attrs = {emitc.name_hint = "another_feature"}} : () -> ()
    "emitc.func"() <{function_type = () -> (), sym_name = "get_fieldName0"}> ({
      %4 = "emitc.get_field"() <{field_name = @fieldName0}> : () -> !emitc.array<2xf32>
      "emitc.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "emitc.class"() <{class_type = 0 : i32, sym_name = "reflectionClass"}> ({
    "emitc.field"() <{initial_value = #emitc.opaque<"{ { \22another_feature\22, \22fieldName0\22 } }">, sym_name = "reflectionMap", type = !emitc.opaque<"const std::map<std::string, std::string>">}> : () -> ()
    "emitc.func"() <{function_type = () -> (), sym_name = "get_reflectionMap"}> ({
      %3 = "emitc.get_field"() <{field_name = @reflectionMap}> : () -> !emitc.opaque<"const std::map<std::string, std::string>">
      "emitc.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "emitc.class"() <{class_type = 1 : i32, sym_name = "structClass"}> ({
    "emitc.field"() <{sym_name = "x", type = i32}> : () -> ()
    "emitc.field"() <{sym_name = "y", type = i32}> : () -> ()
  }) : () -> ()
  "emitc.class"() <{class_type = 2 : i32, sym_name = "unionClass"}> ({
    "emitc.field"() <{sym_name = "asInt", type = i32}> : () -> ()
    "emitc.field"() <{sym_name = "asFloat", type = f32}> : () -> ()
  }) : () -> ()
  "emitc.class"() <{class_type = 0 : i32, sym_name = "expressionClass"}> ({
    "emitc.field"() <{sym_name = "x", type = i32}> : () -> ()
    "emitc.func"() <{function_type = () -> i32, sym_name = "test_precedence"}> ({
      %0 = "emitc.get_field"() <{field_name = @x}> : () -> i32
      %1 = "emitc.expression"(%0) ({
      ^bb0(%arg0: i32):
        %2 = "emitc.add"(%arg0, %arg0) : (i32, i32) -> i32
        "emitc.yield"(%2) : (i32) -> ()
      }) : (i32) -> i32
      "emitc.return"(%1) : (i32) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

