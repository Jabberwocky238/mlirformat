"builtin.module"() ({
  "emitc.class"() <{class_type = 0 : i32, sym_name = "modelClass"}> ({
    "emitc.field"() <{sym_name = "fieldName0", type = !emitc.array<1xf32>}> : () -> () loc("<stdin>":3:5)
    "emitc.field"() <{sym_name = "fieldName1", type = !emitc.array<1xf32>}> : () -> () loc("<stdin>":4:5)
    "emitc.func"() <{function_type = () -> (), sym_name = "execute"}> ({
      %9 = "emitc.constant"() <{value = 0 : index}> : () -> !emitc.size_t loc("<stdin>":6:12)
      %10 = "emitc.get_field"() <{field_name = @fieldName0}> : () -> !emitc.array<1xf32> loc("<stdin>":7:13)
      %11 = "emitc.get_field"() <{field_name = @fieldName1}> : () -> !emitc.array<1xf32> loc("<stdin>":8:13)
      %12 = "emitc.subscript"(%10, %9) : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32> loc("<stdin>":9:13)
      "emitc.return"() : () -> () loc("<stdin>":10:7)
    }) : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "emitc.class"() <{class_type = 0 : i32, final_specifier, sym_name = "finalClass"}> ({
    "emitc.field"() <{sym_name = "fieldName0", type = !emitc.array<1xf32>}> : () -> () loc("<stdin>":14:5)
    "emitc.field"() <{sym_name = "fieldName1", type = !emitc.array<1xf32>}> : () -> () loc("<stdin>":15:5)
    "emitc.func"() <{function_type = () -> (), sym_name = "execute"}> ({
      %5 = "emitc.constant"() <{value = 0 : index}> : () -> !emitc.size_t loc("<stdin>":17:12)
      %6 = "emitc.get_field"() <{field_name = @fieldName0}> : () -> !emitc.array<1xf32> loc("<stdin>":18:12)
      %7 = "emitc.get_field"() <{field_name = @fieldName1}> : () -> !emitc.array<1xf32> loc("<stdin>":19:12)
      %8 = "emitc.subscript"(%6, %5) : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32> loc("<stdin>":20:12)
      "emitc.return"() : () -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":13:3)
  "emitc.class"() <{class_type = 0 : i32, sym_name = "mainClass"}> ({
    "emitc.field"() <{initial_value = dense<0.000000e+00> : tensor<2xf32>, sym_name = "fieldName0", type = !emitc.array<2xf32>}> {attrs = {emitc.name_hint = "another_feature"}} : () -> () loc("<stdin>":25:5)
    "emitc.func"() <{function_type = () -> (), sym_name = "get_fieldName0"}> ({
      %4 = "emitc.get_field"() <{field_name = @fieldName0}> : () -> !emitc.array<2xf32> loc("<stdin>":27:12)
      "emitc.return"() : () -> () loc("<stdin>":28:7)
    }) : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":24:3)
  "emitc.class"() <{class_type = 0 : i32, sym_name = "reflectionClass"}> ({
    "emitc.field"() <{initial_value = #emitc.opaque<"{ { \22another_feature\22, \22fieldName0\22 } }">, sym_name = "reflectionMap", type = !emitc.opaque<"const std::map<std::string, std::string>">}> : () -> () loc("<stdin>":32:5)
    "emitc.func"() <{function_type = () -> (), sym_name = "get_reflectionMap"}> ({
      %3 = "emitc.get_field"() <{field_name = @reflectionMap}> : () -> !emitc.opaque<"const std::map<std::string, std::string>"> loc("<stdin>":34:12)
      "emitc.return"() : () -> () loc("<stdin>":35:7)
    }) : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":31:3)
  "emitc.class"() <{class_type = 1 : i32, sym_name = "structClass"}> ({
    "emitc.field"() <{sym_name = "x", type = i32}> : () -> () loc("<stdin>":39:5)
    "emitc.field"() <{sym_name = "y", type = i32}> : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":38:3)
  "emitc.class"() <{class_type = 2 : i32, sym_name = "unionClass"}> ({
    "emitc.field"() <{sym_name = "asInt", type = i32}> : () -> () loc("<stdin>":43:5)
    "emitc.field"() <{sym_name = "asFloat", type = f32}> : () -> () loc("<stdin>":44:5)
  }) : () -> () loc("<stdin>":42:3)
  "emitc.class"() <{class_type = 0 : i32, sym_name = "expressionClass"}> ({
    "emitc.field"() <{sym_name = "x", type = i32}> : () -> () loc("<stdin>":47:5)
    "emitc.func"() <{function_type = () -> i32, sym_name = "test_precedence"}> ({
      %0 = "emitc.get_field"() <{field_name = @x}> : () -> i32 loc("<stdin>":49:12)
      %1 = "emitc.expression"(%0) ({
      ^bb0(%arg0: i32 loc("<stdin>":51:12)):
        %2 = "emitc.add"(%arg0, %arg0) : (i32, i32) -> i32 loc("<stdin>":52:14)
        "emitc.yield"(%2) : (i32) -> () loc("<stdin>":53:9)
      }) : (i32) -> i32 loc("<stdin>":50:12)
      "emitc.return"(%1) : (i32) -> () loc("<stdin>":55:7)
    }) : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":46:3)
}) : () -> () loc("<stdin>":1:1)
