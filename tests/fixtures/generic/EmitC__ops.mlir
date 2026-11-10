"builtin.module"() ({
  "emitc.include"() <{include = "test.h", is_standard_include}> : () -> ()
  "emitc.include"() <{include = "test.h"}> : () -> ()
  "func.func"() <{function_type = (i32, !emitc.opaque<"int32_t">) -> (), sym_name = "f"}> ({
  ^bb0(%arg100: i32, %arg101: !emitc.opaque<"int32_t">):
    %106 = "emitc.call_opaque"() <{callee = "blah"}> : () -> i64
    "emitc.call_opaque"(%106) <{args = [0 : index, dense<[0, 1]> : tensor<2xi32>, 0 : index], callee = "foo"}> : (i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "emitc.declare_func"() <{sym_name = @func}> : () -> ()
  "emitc.func"() <{function_type = (i32) -> (), sym_name = "func"}> ({
  ^bb0(%arg99: i32):
    "emitc.call_opaque"(%arg99) <{callee = "foo"}> : (i32) -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = () -> i32, specifiers = ["static", "inline"], sym_name = "return_i32"}> ({
    %105 = "emitc.call_opaque"() <{callee = "foo"}> : () -> i32
    "emitc.return"(%105) : (i32) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = () -> i32, sym_name = "call"}> ({
    %104 = "emitc.call"() <{callee = @return_i32}> : () -> i32
    "emitc.return"(%104) : (i32) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32) -> (), specifiers = ["extern"], sym_name = "extern"}> ({
  }) {sym_visibility = "private"} : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "cast"}> ({
  ^bb0(%arg98: i32):
    %103 = "emitc.cast"(%arg98) : (i32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.array<3xi32>) -> (), sym_name = "cast_array_to_pointer"}> ({
  ^bb0(%arg97: !emitc.array<3xi32>):
    %102 = "emitc.cast"(%arg97) : (!emitc.array<3xi32>) -> !emitc.ptr<i32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "c"}> ({
    %98 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
    %99 = "emitc.constant"() <{value = 42 : index}> : () -> !emitc.size_t
    %100 = "emitc.constant"() <{value = 42 : index}> : () -> !emitc.ssize_t
    %101 = "emitc.constant"() <{value = 42 : index}> : () -> !emitc.ptrdiff_t
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "add_int"}> ({
  ^bb0(%arg95: i32, %arg96: i32):
    %97 = "emitc.add"(%arg95, %arg96) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.ptr<f32>, i32, !emitc.opaque<"unsigned int">) -> (), sym_name = "add_pointer"}> ({
  ^bb0(%arg92: !emitc.ptr<f32>, %arg93: i32, %arg94: !emitc.opaque<"unsigned int">):
    %95 = "emitc.add"(%arg92, %arg93) : (!emitc.ptr<f32>, i32) -> !emitc.ptr<f32>
    %96 = "emitc.add"(%arg92, %arg94) : (!emitc.ptr<f32>, !emitc.opaque<"unsigned int">) -> !emitc.ptr<f32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "bitwise"}> ({
  ^bb0(%arg90: i32, %arg91: i32):
    %89 = "emitc.bitwise_and"(%arg90, %arg91) : (i32, i32) -> i32
    %90 = "emitc.bitwise_left_shift"(%arg90, %arg91) : (i32, i32) -> i32
    %91 = "emitc.bitwise_not"(%arg90) : (i32) -> i32
    %92 = "emitc.bitwise_or"(%arg90, %arg91) : (i32, i32) -> i32
    %93 = "emitc.bitwise_right_shift"(%arg90, %arg91) : (i32, i32) -> i32
    %94 = "emitc.bitwise_xor"(%arg90, %arg91) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, i32, i32) -> (), sym_name = "cond"}> ({
  ^bb0(%arg87: i1, %arg88: i32, %arg89: i32):
    %88 = "emitc.conditional"(%arg87, %arg88, %arg89) : (i1, i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "div_int"}> ({
  ^bb0(%arg85: i32, %arg86: i32):
    %87 = "emitc.div"(%arg85, %arg86) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "div_float"}> ({
  ^bb0(%arg83: f32, %arg84: f32):
    %86 = "emitc.div"(%arg83, %arg84) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "mul_int"}> ({
  ^bb0(%arg81: i32, %arg82: i32):
    %85 = "emitc.mul"(%arg81, %arg82) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32) -> (), sym_name = "mul_float"}> ({
  ^bb0(%arg79: f32, %arg80: f32):
    %84 = "emitc.mul"(%arg79, %arg80) : (f32, f32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "rem"}> ({
  ^bb0(%arg77: i32, %arg78: i32):
    %83 = "emitc.rem"(%arg77, %arg78) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "sub_int"}> ({
  ^bb0(%arg75: i32, %arg76: i32):
    %82 = "emitc.sub"(%arg75, %arg76) : (i32, i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.ptr<f32>, i32, !emitc.opaque<"unsigned int">, !emitc.ptr<f32>) -> (), sym_name = "sub_pointer"}> ({
  ^bb0(%arg71: !emitc.ptr<f32>, %arg72: i32, %arg73: !emitc.opaque<"unsigned int">, %arg74: !emitc.ptr<f32>):
    %77 = "emitc.sub"(%arg71, %arg72) : (!emitc.ptr<f32>, i32) -> !emitc.ptr<f32>
    %78 = "emitc.sub"(%arg71, %arg73) : (!emitc.ptr<f32>, !emitc.opaque<"unsigned int">) -> !emitc.ptr<f32>
    %79 = "emitc.sub"(%arg71, %arg74) : (!emitc.ptr<f32>, !emitc.ptr<f32>) -> !emitc.opaque<"ptrdiff_t">
    %80 = "emitc.sub"(%arg71, %arg74) : (!emitc.ptr<f32>, !emitc.ptr<f32>) -> i32
    %81 = "emitc.sub"(%arg71, %arg74) : (!emitc.ptr<f32>, !emitc.ptr<f32>) -> !emitc.ptrdiff_t
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, f32, i64, f64, !emitc.opaque<"unsigned">, !emitc.opaque<"std::valarray<int>">, !emitc.opaque<"custom">) -> (), sym_name = "cmp"}> ({
  ^bb0(%arg64: i32, %arg65: f32, %arg66: i64, %arg67: f64, %arg68: !emitc.opaque<"unsigned">, %arg69: !emitc.opaque<"std::valarray<int>">, %arg70: !emitc.opaque<"custom">):
    %63 = "emitc.cmp"(%arg64, %arg64) <{predicate = 0 : i64}> : (i32, i32) -> i1
    %64 = "emitc.cmp"(%arg64, %arg64) <{predicate = 0 : i64}> : (i32, i32) -> i1
    %65 = "emitc.cmp"(%arg65, %arg65) <{predicate = 1 : i64}> : (f32, f32) -> i1
    %66 = "emitc.cmp"(%arg65, %arg65) <{predicate = 1 : i64}> : (f32, f32) -> i1
    %67 = "emitc.cmp"(%arg66, %arg66) <{predicate = 2 : i64}> : (i64, i64) -> i1
    %68 = "emitc.cmp"(%arg66, %arg66) <{predicate = 2 : i64}> : (i64, i64) -> i1
    %69 = "emitc.cmp"(%arg67, %arg67) <{predicate = 3 : i64}> : (f64, f64) -> i1
    %70 = "emitc.cmp"(%arg67, %arg67) <{predicate = 3 : i64}> : (f64, f64) -> i1
    %71 = "emitc.cmp"(%arg68, %arg68) <{predicate = 4 : i64}> : (!emitc.opaque<"unsigned">, !emitc.opaque<"unsigned">) -> i1
    %72 = "emitc.cmp"(%arg68, %arg68) <{predicate = 4 : i64}> : (!emitc.opaque<"unsigned">, !emitc.opaque<"unsigned">) -> i1
    %73 = "emitc.cmp"(%arg69, %arg69) <{predicate = 5 : i64}> : (!emitc.opaque<"std::valarray<int>">, !emitc.opaque<"std::valarray<int>">) -> !emitc.opaque<"std::valarray<bool>">
    %74 = "emitc.cmp"(%arg69, %arg69) <{predicate = 5 : i64}> : (!emitc.opaque<"std::valarray<int>">, !emitc.opaque<"std::valarray<int>">) -> !emitc.opaque<"std::valarray<bool>">
    %75 = "emitc.cmp"(%arg70, %arg70) <{predicate = 6 : i64}> : (!emitc.opaque<"custom">, !emitc.opaque<"custom">) -> !emitc.opaque<"custom">
    %76 = "emitc.cmp"(%arg70, %arg70) <{predicate = 6 : i64}> : (!emitc.opaque<"custom">, !emitc.opaque<"custom">) -> !emitc.opaque<"custom">
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "logical"}> ({
  ^bb0(%arg62: i32, %arg63: i32):
    %60 = "emitc.logical_and"(%arg62, %arg63) : (i32, i32) -> i1
    %61 = "emitc.logical_not"(%arg62) : (i32) -> i1
    %62 = "emitc.logical_or"(%arg62, %arg63) : (i32, i32) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "unary"}> ({
  ^bb0(%arg61: i32):
    %58 = "emitc.unary_minus"(%arg61) : (i32) -> i32
    %59 = "emitc.unary_plus"(%arg61) : (i32) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, f32) -> (), sym_name = "test_if"}> ({
  ^bb0(%arg59: i1, %arg60: f32):
    "emitc.if"(%arg59) ({
      %57 = "emitc.call_opaque"(%arg60) <{callee = "func_const"}> : (f32) -> i32
      "emitc.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, f32) -> (), sym_name = "test_if_explicit_yield"}> ({
  ^bb0(%arg57: i1, %arg58: f32):
    "emitc.if"(%arg57) ({
      %56 = "emitc.call_opaque"(%arg58) <{callee = "func_const"}> : (f32) -> i32
      "emitc.yield"() : () -> ()
    }, {
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1, f32) -> (), sym_name = "test_if_else"}> ({
  ^bb0(%arg55: i1, %arg56: f32):
    "emitc.if"(%arg55) ({
      %55 = "emitc.call_opaque"(%arg56) <{callee = "func_true"}> : (f32) -> i32
      "emitc.yield"() : () -> ()
    }, {
      %54 = "emitc.call_opaque"(%arg56) <{callee = "func_false"}> : (f32) -> i32
      "emitc.yield"() : () -> ()
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "test_assign"}> ({
  ^bb0(%arg54: f32):
    %53 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<f32>
    "emitc.assign"(%53, %arg54) : (!emitc.lvalue<f32>, f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, f32, f32) -> i32, sym_name = "test_expression"}> ({
  ^bb0(%arg41: i32, %arg42: i32, %arg43: i32, %arg44: f32, %arg45: f32):
    %44 = "emitc.constant"() <{value = 7 : i32}> : () -> i32
    %45 = "emitc.expression"(%arg42, %44) ({
    ^bb0(%arg52: i32, %arg53: i32):
      %52 = "emitc.rem"(%arg52, %arg53) : (i32, i32) -> i32
      "emitc.yield"(%52) : (i32) -> ()
    }) : (i32, i32) -> i32
    %46 = "emitc.expression"(%arg41, %arg42, %arg43, %arg44, %arg45, %45) <{do_not_inline}> ({
    ^bb0(%arg46: i32, %arg47: i32, %arg48: i32, %arg49: f32, %arg50: f32, %arg51: i32):
      %47 = "emitc.add"(%arg46, %arg47) : (i32, i32) -> i32
      %48 = "emitc.call_opaque"(%47, %arg48, %arg51) <{callee = "bar"}> : (i32, i32, i32) -> i32
      %49 = "emitc.mul"(%arg49, %arg50) : (f32, f32) -> f32
      %50 = "emitc.cast"(%49) : (f32) -> i32
      %51 = "emitc.sub"(%48, %50) : (i32, i32) -> i32
      "emitc.yield"(%51) : (i32) -> ()
    }) : (i32, i32, i32, f32, f32, i32) -> i32
    "func.return"(%46) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "test_expression_multiple_uses"}> ({
  ^bb0(%arg37: i32, %arg38: i32):
    %40 = "emitc.expression"(%arg37, %arg38) ({
    ^bb0(%arg39: i32, %arg40: i32):
      %41 = "emitc.rem"(%arg39, %arg40) : (i32, i32) -> i32
      %42 = "emitc.add"(%41, %arg39) : (i32, i32) -> i32
      %43 = "emitc.mul"(%42, %41) : (i32, i32) -> i32
      "emitc.yield"(%43) : (i32) -> ()
    }) : (i32, i32) -> i32
    "func.return"(%40) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> i32, sym_name = "test_expression_recurring_operands"}> ({
  ^bb0(%arg32: i32, %arg33: i32):
    %36 = "emitc.expression"(%arg32, %arg33, %arg32) ({
    ^bb0(%arg34: i32, %arg35: i32, %arg36: i32):
      %37 = "emitc.rem"(%arg34, %arg35) : (i32, i32) -> i32
      %38 = "emitc.add"(%37, %arg36) : (i32, i32) -> i32
      %39 = "emitc.mul"(%38, %37) : (i32, i32) -> i32
      "emitc.yield"(%39) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    "func.return"(%36) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "test_for"}> ({
  ^bb0(%arg28: index, %arg29: index, %arg30: index):
    "emitc.for"(%arg28, %arg29, %arg30) ({
    ^bb0(%arg31: index):
      %35 = "emitc.call_opaque"(%arg31) <{callee = "func_const"}> : (index) -> i32
      "emitc.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index) -> (), sym_name = "test_for_explicit_yield"}> ({
  ^bb0(%arg24: index, %arg25: index, %arg26: index):
    "emitc.for"(%arg24, %arg25, %arg26) ({
    ^bb0(%arg27: index):
      %34 = "emitc.call_opaque"(%arg27) <{callee = "func_const"}> : (index) -> i32
      "emitc.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i16, i16, i16) -> (), sym_name = "test_for_not_index_induction"}> ({
  ^bb0(%arg20: i16, %arg21: i16, %arg22: i16):
    "emitc.for"(%arg20, %arg21, %arg22) ({
    ^bb0(%arg23: i16):
      %33 = "emitc.call_opaque"(%arg23) <{callee = "func_const"}> : (i16) -> i32
      "emitc.yield"() : () -> ()
    }) : (i16, i16, i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.array<2x3xf32>, !emitc.ptr<i32>, !emitc.opaque<"std::map<char, int>">, index, i32, !emitc.opaque<"char">) -> (), sym_name = "test_subscript"}> ({
  ^bb0(%arg14: !emitc.array<2x3xf32>, %arg15: !emitc.ptr<i32>, %arg16: !emitc.opaque<"std::map<char, int>">, %arg17: index, %arg18: i32, %arg19: !emitc.opaque<"char">):
    %30 = "emitc.subscript"(%arg14, %arg17, %arg18) : (!emitc.array<2x3xf32>, index, i32) -> !emitc.lvalue<f32>
    %31 = "emitc.subscript"(%arg15, %arg17) : (!emitc.ptr<i32>, index) -> !emitc.lvalue<i32>
    %32 = "emitc.subscript"(%arg16, %arg19) : (!emitc.opaque<"std::map<char, int>">, !emitc.opaque<"char">) -> !emitc.lvalue<!emitc.opaque<"int">>
    "func.return"() : () -> ()
  }) : () -> ()
  "emitc.verbatim"() <{value = "#ifdef __cplusplus"}> : () -> ()
  "emitc.verbatim"() <{value = "extern \22C\22 {"}> : () -> ()
  "emitc.verbatim"() <{value = "#endif  // __cplusplus"}> : () -> ()
  "emitc.verbatim"() <{value = "#ifdef __cplusplus"}> : () -> ()
  "emitc.verbatim"() <{value = "}  // extern \22C\22"}> : () -> ()
  "emitc.verbatim"() <{value = "#endif  // __cplusplus"}> : () -> ()
  "emitc.verbatim"() <{value = "typedef int32_t i32;"}> : () -> ()
  "emitc.verbatim"() <{value = "typedef float f32;"}> : () -> ()
  "emitc.verbatim"() <{value = "{} {  }"}> : () -> ()
  "func.func"() <{function_type = (!emitc.ptr<i32>, i32, !emitc.array<3x!emitc.ptr<i32>>) -> (), sym_name = "test_verbatim"}> ({
  ^bb0(%arg11: !emitc.ptr<i32>, %arg12: i32, %arg13: !emitc.array<3x!emitc.ptr<i32>>):
    %28 = "emitc.variable"() <{value = #emitc.opaque<"1">}> : () -> !emitc.lvalue<i32>
    "emitc.verbatim"(%28) <{value = "++{};"}> : (!emitc.lvalue<i32>) -> ()
    "emitc.verbatim"(%arg13) <{value = "*{}[0] = 1;"}> : (!emitc.array<3x!emitc.ptr<i32>>) -> ()
    "emitc.verbatim"(%arg11, %arg12) <{value = "{} + {};"}> : (!emitc.ptr<i32>, i32) -> ()
    "emitc.verbatim"() <{value = "b"}> : () -> ()
    %29 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "emitc.global"() <{sym_name = "uninit", type = i32}> : () -> ()
  "emitc.global"() <{initial_value = 4 : i32, sym_name = "myglobal_int", type = i32}> : () -> ()
  "emitc.global"() <{extern_specifier, sym_name = "external_linkage", type = i32}> : () -> ()
  "emitc.global"() <{static_specifier, sym_name = "internal_linkage", type = i32}> : () -> ()
  "emitc.global"() <{initial_value = dense<4.000000e+00> : tensor<2xf32>, sym_name = "myglobal", type = !emitc.array<2xf32>}> : () -> ()
  "emitc.global"() <{const_specifier, initial_value = dense<2> : tensor<2xi16>, sym_name = "myconstant", type = !emitc.array<2xi16>}> : () -> ()
  "func.func"() <{function_type = (index) -> f32, sym_name = "use_global"}> ({
  ^bb0(%arg10: index):
    %25 = "emitc.get_global"() <{name = @myglobal}> : () -> !emitc.array<2xf32>
    %26 = "emitc.subscript"(%25, %arg10) : (!emitc.array<2xf32>, index) -> !emitc.lvalue<f32>
    %27 = "emitc.load"(%26) : (!emitc.lvalue<f32>) -> f32
    "func.return"(%27) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "assign_global"}> ({
  ^bb0(%arg9: i32):
    %24 = "emitc.get_global"() <{name = @myglobal_int}> : () -> !emitc.lvalue<i32>
    "emitc.assign"(%24, %arg9) : (!emitc.lvalue<i32>, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.lvalue<!emitc.opaque<"mystruct">>, !emitc.lvalue<!emitc.opaque<"mystruct_ptr">>, !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> (), sym_name = "member_access"}> ({
  ^bb0(%arg6: !emitc.lvalue<!emitc.opaque<"mystruct">>, %arg7: !emitc.lvalue<!emitc.opaque<"mystruct_ptr">>, %arg8: !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>):
    %16 = "emitc.member"(%arg6) <{member = "a"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32>
    %17 = "emitc.member"(%arg6) <{member = "b"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.array<2xi32>
    %18 = "emitc.member_of_ptr"(%arg7) <{member = "a"}> : (!emitc.lvalue<!emitc.opaque<"mystruct_ptr">>) -> !emitc.lvalue<i32>
    %19 = "emitc.member_of_ptr"(%arg7) <{member = "b"}> : (!emitc.lvalue<!emitc.opaque<"mystruct_ptr">>) -> !emitc.array<2xi32>
    %20 = "emitc.member_of_ptr"(%arg8) <{member = "a"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32>
    %21 = "emitc.member_of_ptr"(%arg8) <{member = "b"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.array<2xi32>
    %22 = "emitc.load"(%arg6) : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.opaque<"mystruct">
    %23 = "emitc.member"(%22) <{member = "a"}> : (!emitc.opaque<"mystruct">) -> i32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "switch"}> ({
    %12 = "emitc.constant"() <{value = 1 : index}> : () -> !emitc.ptrdiff_t
    "emitc.switch"(%12) <{cases = array<i64: 1, 2>}> ({
      %15 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%15) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %14 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %13 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (!emitc.ptrdiff_t) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "emitc.class"() <{class_type = 0 : i32, final_specifier, sym_name = "finalClass"}> ({
    "emitc.field"() <{sym_name = "fieldName0", type = !emitc.array<1xf32>}> : () -> ()
    "emitc.field"() <{sym_name = "fieldName1", type = !emitc.array<1xf32>}> : () -> ()
    "emitc.func"() <{function_type = () -> (), sym_name = "execute"}> ({
      %8 = "emitc.constant"() <{value = 0 : index}> : () -> !emitc.size_t
      %9 = "emitc.get_field"() <{field_name = @fieldName0}> : () -> !emitc.array<1xf32>
      %10 = "emitc.get_field"() <{field_name = @fieldName1}> : () -> !emitc.array<1xf32>
      %11 = "emitc.subscript"(%9, %8) : (!emitc.array<1xf32>, !emitc.size_t) -> !emitc.lvalue<f32>
      "emitc.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.ptr<i32>) -> (), sym_name = "do"}> ({
  ^bb0(%arg2: !emitc.ptr<i32>):
    %2 = "emitc.literal"() <{value = "1"}> : () -> i32
    %3 = "emitc.literal"() <{value = "2"}> : () -> i32
    %4 = "emitc.literal"() <{value = "3"}> : () -> i32
    "emitc.do"() ({
      "emitc.verbatim"(%arg2) <{value = "printf(\22%d\22, *{});"}> : (!emitc.ptr<i32>) -> ()
    }, {
      %5 = "emitc.expression"(%2, %3, %4) ({
      ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
        %6 = "emitc.add"(%arg3, %arg4) : (i32, i32) -> i32
        %7 = "emitc.cmp"(%6, %arg5) <{predicate = 0 : i64}> : (i32, i32) -> i1
        "emitc.yield"(%7) : (i1) -> ()
      }) : (i32, i32, i32) -> i1
      "emitc.yield"(%5) : (i1) -> ()
    }) : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.lvalue<i32>) -> (), sym_name = "address_of"}> ({
  ^bb0(%arg1: !emitc.lvalue<i32>):
    %1 = "emitc.address_of"(%arg1) : (!emitc.lvalue<i32>) -> !emitc.ptr<i32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.ptr<i32>) -> (), sym_name = "dereference"}> ({
  ^bb0(%arg0: !emitc.ptr<i32>):
    %0 = "emitc.dereference"(%arg0) : (!emitc.ptr<i32>) -> !emitc.lvalue<i32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

