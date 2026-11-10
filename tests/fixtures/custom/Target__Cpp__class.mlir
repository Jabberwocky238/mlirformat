module {
  emitc.class @modelClass {
    emitc.field @fieldName0 : !emitc.array<1xf32>
    emitc.field @fieldName1 : !emitc.array<1xf32>
    emitc.func @execute() {
      %0 = "emitc.constant"() <{value = 0 : index}> : () -> !emitc.size_t
      %1 = get_field @fieldName0 : !emitc.array<1xf32>
      %2 = get_field @fieldName1 : !emitc.array<1xf32>
      %3 = subscript %1[%0] : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
      return
    }
  }
  emitc.class final @finalClass {
    emitc.field @fieldName0 : !emitc.array<1xf32>
    emitc.field @fieldName1 : !emitc.array<1xf32>
    emitc.func @execute() {
      %0 = "emitc.constant"() <{value = 0 : index}> : () -> !emitc.size_t
      %1 = get_field @fieldName0 : !emitc.array<1xf32>
      %2 = get_field @fieldName1 : !emitc.array<1xf32>
      %3 = subscript %1[%0] : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
      return
    }
  }
  emitc.class @mainClass {
    emitc.field @fieldName0 : !emitc.array<2xf32> = dense<0.000000e+00> {attrs = {emitc.name_hint = "another_feature"}}
    emitc.func @get_fieldName0() {
      %0 = get_field @fieldName0 : !emitc.array<2xf32>
      return
    }
  }
  emitc.class @reflectionClass {
    emitc.field @reflectionMap : !emitc.opaque<"const std::map<std::string, std::string>"> = #emitc.opaque<"{ { \22another_feature\22, \22fieldName0\22 } }">
    emitc.func @get_reflectionMap() {
      %0 = get_field @reflectionMap : !emitc.opaque<"const std::map<std::string, std::string>">
      return
    }
  }
  emitc.class struct @structClass {
    emitc.field @x : i32
    emitc.field @y : i32
  }
  emitc.class union @unionClass {
    emitc.field @asInt : i32
    emitc.field @asFloat : f32
  }
  emitc.class @expressionClass {
    emitc.field @x : i32
    emitc.func @test_precedence() -> i32 {
      %0 = get_field @x : i32
      %1 = expression %0 : (i32) -> i32 {
        %2 = add %0, %0 : (i32, i32) -> i32
        yield %2 : i32
      }
      return %1 : i32
    }
  }
}

