"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> i1, sym_name = "single_expression"}> ({
  ^bb0(%arg124: i32, %arg125: i32, %arg126: i32):
    %130 = "emitc.expression"(%arg124, %arg125, %arg126) ({
    ^bb0(%arg127: i32, %arg128: i32, %arg129: i32):
      %131 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
      %132 = "emitc.mul"(%arg127, %131) : (i32, i32) -> i32
      %133 = "emitc.sub"(%132, %arg128) : (i32, i32) -> i32
      %134 = "emitc.cmp"(%133, %arg129) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%134) : (i1) -> ()
    }) : (i32, i32, i32) -> i1
    "func.return"(%130) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> i32, sym_name = "single_use"}> ({
  ^bb0(%arg115: i32, %arg116: i32, %arg117: i32, %arg118: i32):
    %122 = "emitc.literal"() <{value = "M_PI"}> : () -> i32
    %123 = "emitc.expression"(%arg115, %arg116, %arg117, %arg118, %122) ({
    ^bb0(%arg119: i32, %arg120: i32, %arg121: i32, %arg122: i32, %arg123: i32):
      %126 = "emitc.mul"(%arg119, %arg123) : (i32, i32) -> i32
      %127 = "emitc.call_opaque"(%126, %arg121) <{callee = "bar"}> : (i32, i32) -> i32
      %128 = "emitc.sub"(%127, %arg122) : (i32, i32) -> i32
      %129 = "emitc.cmp"(%128, %arg120) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%129) : (i1) -> ()
    }) : (i32, i32, i32, i32, i32) -> i1
    %124 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.if"(%123) ({
      "emitc.assign"(%124, %arg115) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      "emitc.assign"(%124, %arg115) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }) : (i1) -> ()
    %125 = "emitc.load"(%124) : (!emitc.lvalue<i32>) -> i32
    "func.return"(%125) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "do_not_inline"}> ({
  ^bb0(%arg109: i32, %arg110: i32, %arg111: i32):
    %119 = "emitc.expression"(%arg109, %arg110, %arg111) <{do_not_inline}> ({
    ^bb0(%arg112: i32, %arg113: i32, %arg114: i32):
      %120 = "emitc.add"(%arg112, %arg113) : (i32, i32) -> i32
      %121 = "emitc.mul"(%120, %arg114) : (i32, i32) -> i32
      "emitc.yield"(%121) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    "func.return"(%119) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> f32, sym_name = "parentheses_for_low_precedence"}> ({
  ^bb0(%arg103: i32, %arg104: i32, %arg105: i32):
    %115 = "emitc.expression"(%arg103, %arg104, %arg105) ({
    ^bb0(%arg106: i32, %arg107: i32, %arg108: i32):
      %116 = "emitc.add"(%arg106, %arg107) : (i32, i32) -> i32
      %117 = "emitc.mul"(%116, %arg108) : (i32, i32) -> i32
      %118 = "emitc.cast"(%117) : (i32) -> f32
      "emitc.yield"(%118) : (f32) -> ()
    }) : (i32, i32, i32) -> f32
    "func.return"(%115) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "parentheses_for_same_precedence"}> ({
  ^bb0(%arg97: i32, %arg98: i32, %arg99: i32):
    %112 = "emitc.expression"(%arg97, %arg98, %arg99) ({
    ^bb0(%arg100: i32, %arg101: i32, %arg102: i32):
      %113 = "emitc.mul"(%arg100, %arg101) : (i32, i32) -> i32
      %114 = "emitc.div"(%arg102, %113) : (i32, i32) -> i32
      "emitc.yield"(%114) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    "func.return"(%112) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "user_with_expression_trait"}> ({
  ^bb0(%arg76: i32, %arg77: i32, %arg78: i32):
    %88 = "emitc.constant"() <{value = 0 : i32}> : () -> i32
    %89 = "emitc.expression"(%arg76, %arg77, %arg78) ({
    ^bb0(%arg94: i32, %arg95: i32, %arg96: i32):
      %110 = "emitc.mul"(%arg94, %arg95) : (i32, i32) -> i32
      %111 = "emitc.div"(%arg96, %110) : (i32, i32) -> i32
      "emitc.yield"(%111) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    %90 = "emitc.expression"(%arg76, %arg77, %arg78) ({
    ^bb0(%arg91: i32, %arg92: i32, %arg93: i32):
      %108 = "emitc.mul"(%arg91, %arg92) : (i32, i32) -> i32
      %109 = "emitc.div"(%arg93, %108) : (i32, i32) -> i32
      "emitc.yield"(%109) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    %91 = "emitc.expression"(%arg76, %arg77, %arg78) ({
    ^bb0(%arg88: i32, %arg89: i32, %arg90: i32):
      %106 = "emitc.mul"(%arg88, %arg89) : (i32, i32) -> i32
      %107 = "emitc.div"(%arg90, %106) : (i32, i32) -> i32
      "emitc.yield"(%107) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    %92 = "emitc.expression"(%arg76, %arg77, %arg78) ({
    ^bb0(%arg85: i32, %arg86: i32, %arg87: i32):
      %104 = "emitc.mul"(%arg85, %arg86) : (i32, i32) -> i32
      %105 = "emitc.div"(%arg87, %104) : (i32, i32) -> i32
      "emitc.yield"(%105) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    %93 = "emitc.expression"(%arg76, %arg77, %arg78) ({
    ^bb0(%arg82: i32, %arg83: i32, %arg84: i32):
      %102 = "emitc.mul"(%arg82, %arg83) : (i32, i32) -> i32
      %103 = "emitc.div"(%arg84, %102) : (i32, i32) -> i32
      "emitc.yield"(%103) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    %94 = "emitc.expression"(%arg76, %arg77, %arg78) ({
    ^bb0(%arg79: i32, %arg80: i32, %arg81: i32):
      %100 = "emitc.mul"(%arg79, %arg80) : (i32, i32) -> i32
      %101 = "emitc.div"(%arg81, %100) : (i32, i32) -> i32
      "emitc.yield"(%101) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    %95 = "emitc.cast"(%89) : (i32) -> i1
    %96 = "emitc.add"(%90, %88) : (i32, i32) -> i32
    %97 = "emitc.call_opaque"(%91, %88) <{callee = "bar"}> : (i32, i32) -> i32
    %98 = "emitc.conditional"(%95, %92, %88) : (i1, i32, i32) -> i32
    %99 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.assign"(%99, %93) : (!emitc.lvalue<i32>, i32) -> ()
    "func.return"(%94) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> i32, sym_name = "multiple_uses"}> ({
  ^bb0(%arg68: i32, %arg69: i32, %arg70: i32, %arg71: i32):
    %80 = "emitc.expression"(%arg68, %arg69, %arg70, %arg71) ({
    ^bb0(%arg72: i32, %arg73: i32, %arg74: i32, %arg75: i32):
      %84 = "emitc.mul"(%arg72, %arg73) : (i32, i32) -> i32
      %85 = "emitc.call_opaque"(%84, %arg74) <{callee = "bar"}> : (i32, i32) -> i32
      %86 = "emitc.sub"(%85, %84) : (i32, i32) -> i32
      %87 = "emitc.cmp"(%86, %arg75) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%87) : (i1) -> ()
    }) : (i32, i32, i32, i32) -> i1
    %81 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.if"(%80) ({
      "emitc.assign"(%81, %arg68) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      "emitc.assign"(%81, %arg68) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }) : (i1) -> ()
    %82 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i1>
    "emitc.assign"(%82, %80) : (!emitc.lvalue<i1>, i1) -> ()
    %83 = "emitc.load"(%81) : (!emitc.lvalue<i32>) -> i32
    "func.return"(%83) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> i32, sym_name = "different_expressions"}> ({
  ^bb0(%arg56: i32, %arg57: i32, %arg58: i32, %arg59: i32):
    %70 = "emitc.expression"(%arg58, %arg59) ({
    ^bb0(%arg66: i32, %arg67: i32):
      %79 = "emitc.rem"(%arg66, %arg67) : (i32, i32) -> i32
      "emitc.yield"(%79) : (i32) -> ()
    }) : (i32, i32) -> i32
    %71 = "emitc.expression"(%arg56, %arg57, %70) ({
    ^bb0(%arg63: i32, %arg64: i32, %arg65: i32):
      %77 = "emitc.mul"(%arg63, %arg64) : (i32, i32) -> i32
      %78 = "emitc.call_opaque"(%arg65, %77) <{callee = "bar"}> : (i32, i32) -> i32
      "emitc.yield"(%78) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    %72 = "emitc.expression"(%arg57, %71, %arg59) ({
    ^bb0(%arg60: i32, %arg61: i32, %arg62: i32):
      %75 = "emitc.sub"(%arg61, %arg62) : (i32, i32) -> i32
      %76 = "emitc.cmp"(%75, %arg60) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%76) : (i1) -> ()
    }) : (i32, i32, i32) -> i1
    %73 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.if"(%72) ({
      "emitc.assign"(%73, %arg56) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      "emitc.assign"(%73, %arg56) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }) : (i1) -> ()
    %74 = "emitc.load"(%73) : (!emitc.lvalue<i32>) -> i32
    "func.return"(%74) : (i32) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32, !emitc.ptr<i32>) -> i32, sym_name = "expression_with_dereference_apply"}> ({
  ^bb0(%arg52: i32, %arg53: !emitc.ptr<i32>):
    %67 = "emitc.expression"(%arg52, %arg53) ({
    ^bb0(%arg54: i32, %arg55: !emitc.ptr<i32>):
      %68 = "emitc.sub"(%arg55, %arg54) : (!emitc.ptr<i32>, i32) -> !emitc.ptr<i32>
      %69 = "emitc.apply"(%68) <{applicableOperator = "*"}> : (!emitc.ptr<i32>) -> i32
      "emitc.yield"(%69) : (i32) -> ()
    }) : (i32, !emitc.ptr<i32>) -> i32
    "emitc.return"(%67) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, !emitc.ptr<i32>) -> i1, sym_name = "expression_with_address_taken_apply"}> ({
  ^bb0(%arg46: i32, %arg47: i32, %arg48: !emitc.ptr<i32>):
    %62 = "emitc.variable"() <{value = 42 : i32}> : () -> !emitc.lvalue<i32>
    %63 = "emitc.expression"(%arg47, %arg48, %62) ({
    ^bb0(%arg49: i32, %arg50: !emitc.ptr<i32>, %arg51: !emitc.lvalue<i32>):
      %64 = "emitc.apply"(%arg51) <{applicableOperator = "&"}> : (!emitc.lvalue<i32>) -> !emitc.ptr<i32>
      %65 = "emitc.sub"(%64, %arg49) : (!emitc.ptr<i32>, i32) -> !emitc.ptr<i32>
      %66 = "emitc.cmp"(%65, %arg50) <{predicate = 2 : i64}> : (!emitc.ptr<i32>, !emitc.ptr<i32>) -> i1
      "emitc.yield"(%66) : (i1) -> ()
    }) : (i32, !emitc.ptr<i32>, !emitc.lvalue<i32>) -> i1
    "func.return"(%63) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, !emitc.ptr<i32>) -> i1, sym_name = "expression_with_address_taken"}> ({
  ^bb0(%arg40: i32, %arg41: i32, %arg42: !emitc.ptr<i32>):
    %57 = "emitc.variable"() <{value = 42 : i32}> : () -> !emitc.lvalue<i32>
    %58 = "emitc.expression"(%arg41, %arg42, %57) ({
    ^bb0(%arg43: i32, %arg44: !emitc.ptr<i32>, %arg45: !emitc.lvalue<i32>):
      %59 = "emitc.address_of"(%arg45) : (!emitc.lvalue<i32>) -> !emitc.ptr<i32>
      %60 = "emitc.sub"(%59, %arg43) : (!emitc.ptr<i32>, i32) -> !emitc.ptr<i32>
      %61 = "emitc.cmp"(%60, %arg44) <{predicate = 2 : i64}> : (!emitc.ptr<i32>, !emitc.ptr<i32>) -> i1
      "emitc.yield"(%61) : (i1) -> ()
    }) : (i32, !emitc.ptr<i32>, !emitc.lvalue<i32>) -> i1
    "func.return"(%58) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.ptr<!emitc.opaque<"void">>) -> i32, sym_name = "expression_with_subscript_user"}> ({
  ^bb0(%arg38: !emitc.ptr<!emitc.opaque<"void">>):
    %52 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %53 = "emitc.expression"(%arg38) ({
    ^bb0(%arg39: !emitc.ptr<!emitc.opaque<"void">>):
      %56 = "emitc.cast"(%arg39) : (!emitc.ptr<!emitc.opaque<"void">>) -> !emitc.ptr<i32>
      "emitc.yield"(%56) : (!emitc.ptr<i32>) -> ()
    }) : (!emitc.ptr<!emitc.opaque<"void">>) -> !emitc.ptr<i32>
    %54 = "emitc.subscript"(%53, %52) : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %55 = "emitc.load"(%54) : (!emitc.lvalue<i32>) -> i32
    "func.return"(%55) : (i32) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32, i32, !emitc.ptr<i32>) -> i1, sym_name = "expression_with_load"}> ({
  ^bb0(%arg31: i32, %arg32: i32, %arg33: !emitc.ptr<i32>):
    %43 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %44 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32>
    %45 = "emitc.subscript"(%arg33, %43) : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %46 = "emitc.expression"(%arg31, %arg32, %44, %45) ({
    ^bb0(%arg34: i32, %arg35: i32, %arg36: !emitc.lvalue<i32>, %arg37: !emitc.lvalue<i32>):
      %47 = "emitc.load"(%arg36) : (!emitc.lvalue<i32>) -> i32
      %48 = "emitc.add"(%47, %arg35) : (i32, i32) -> i32
      %49 = "emitc.load"(%arg37) : (!emitc.lvalue<i32>) -> i32
      %50 = "emitc.add"(%49, %arg34) : (i32, i32) -> i32
      %51 = "emitc.cmp"(%48, %50) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%51) : (i1) -> ()
    }) : (i32, i32, !emitc.lvalue<i32>, !emitc.lvalue<i32>) -> i1
    "emitc.return"(%46) : (i1) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (!emitc.ptr<i32>) -> i1, sym_name = "expression_with_load_and_call"}> ({
  ^bb0(%arg29: !emitc.ptr<i32>):
    %34 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %35 = "emitc.subscript"(%arg29, %34) : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %36 = "emitc.expression"(%35) ({
    ^bb0(%arg30: !emitc.lvalue<i32>):
      %37 = "emitc.load"(%arg30) : (!emitc.lvalue<i32>) -> i32
      %38 = "emitc.load"(%arg30) : (!emitc.lvalue<i32>) -> i32
      %39 = "emitc.load"(%arg30) : (!emitc.lvalue<i32>) -> i32
      %40 = "emitc.call_opaque"(%37) <{callee = "bar"}> : (i32) -> i32
      %41 = "emitc.add"(%39, %40) : (i32, i32) -> i32
      %42 = "emitc.cmp"(%41, %38) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%42) : (i1) -> ()
    }) : (!emitc.lvalue<i32>) -> i1
    "emitc.return"(%36) : (i1) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32, i32) -> (), sym_name = "expression_with_call_opaque_with_args_array"}> ({
  ^bb0(%arg25: i32, %arg26: i32):
    %31 = "emitc.expression"(%arg25, %arg26) ({
    ^bb0(%arg27: i32, %arg28: i32):
      %32 = "emitc.cmp"(%arg27, %arg28) <{predicate = 2 : i64}> : (i32, i32) -> i1
      %33 = "emitc.call_opaque"(%32) <{args = [0 : index], callee = "f"}> : (i1) -> i1
      "emitc.yield"(%33) : (i1) -> ()
    }) : (i32, i32) -> i1
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32, !emitc.ptr<i32>) -> (), sym_name = "inline_side_effects_into_assign"}> ({
  ^bb0(%arg20: i32, %arg21: !emitc.ptr<i32>):
    %23 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %24 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32>
    %25 = "emitc.subscript"(%arg21, %23) : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %26 = "emitc.expression"(%arg20, %24, %25) ({
    ^bb0(%arg22: i32, %arg23: !emitc.lvalue<i32>, %arg24: !emitc.lvalue<i32>):
      %27 = "emitc.load"(%arg23) : (!emitc.lvalue<i32>) -> i32
      %28 = "emitc.mul"(%27, %arg22) : (i32, i32) -> i32
      %29 = "emitc.load"(%arg24) : (!emitc.lvalue<i32>) -> i32
      %30 = "emitc.add"(%28, %29) : (i32, i32) -> i32
      "emitc.yield"(%30) : (i32) -> ()
    }) : (i32, !emitc.lvalue<i32>, !emitc.lvalue<i32>) -> i32
    "emitc.assign"(%24, %26) : (!emitc.lvalue<i32>, i32) -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32, !emitc.ptr<i32>) -> (), sym_name = "do_not_inline_side_effects_into_assign"}> ({
  ^bb0(%arg16: i32, %arg17: !emitc.ptr<i32>):
    %17 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %18 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32>
    %19 = "emitc.subscript"(%arg17, %17) : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %20 = "emitc.expression"(%arg16, %18) ({
    ^bb0(%arg18: i32, %arg19: !emitc.lvalue<i32>):
      %21 = "emitc.load"(%arg19) : (!emitc.lvalue<i32>) -> i32
      %22 = "emitc.mul"(%21, %arg18) : (i32, i32) -> i32
      "emitc.yield"(%22) : (i32) -> ()
    }) : (i32, !emitc.lvalue<i32>) -> i32
    "emitc.assign"(%19, %20) : (!emitc.lvalue<i32>, i32) -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32, !emitc.ptr<i32>) -> i32, sym_name = "do_not_inline_non_preceding_side_effects"}> ({
  ^bb0(%arg12: i32, %arg13: !emitc.ptr<i32>):
    %11 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %12 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32>
    %13 = "emitc.subscript"(%arg13, %11) : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %14 = "emitc.expression"(%arg12, %12) ({
    ^bb0(%arg14: i32, %arg15: !emitc.lvalue<i32>):
      %15 = "emitc.load"(%arg15) : (!emitc.lvalue<i32>) -> i32
      %16 = "emitc.mul"(%15, %arg14) : (i32, i32) -> i32
      "emitc.yield"(%16) : (i32) -> ()
    }) : (i32, !emitc.lvalue<i32>) -> i32
    "emitc.assign"(%13, %arg12) : (!emitc.lvalue<i32>, i32) -> ()
    "emitc.return"(%14) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "inline_side_effects_into_if"}> ({
  ^bb0(%arg6: i32, %arg7: i32, %arg8: i32):
    %6 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %7 = "emitc.expression"(%arg6, %arg7, %arg8) ({
    ^bb0(%arg9: i32, %arg10: i32, %arg11: i32):
      %9 = "emitc.call_opaque"(%arg9, %arg10) <{callee = "bar"}> : (i32, i32) -> i32
      %10 = "emitc.cmp"(%9, %arg11) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%10) : (i1) -> ()
    }) : (i32, i32, i32) -> i1
    "emitc.if"(%7) ({
      "emitc.assign"(%6, %arg6) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      "emitc.assign"(%6, %arg7) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }) : (i1) -> ()
    %8 = "emitc.load"(%6) : (!emitc.lvalue<i32>) -> i32
    "func.return"(%8) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "inline_side_effects_into_switch"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "emitc.expression"(%arg0, %arg1, %arg2) ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %4 = "emitc.call_opaque"(%arg3, %arg4) <{callee = "bar"}> : (i32, i32) -> i32
      %5 = "emitc.add"(%4, %arg5) : (i32, i32) -> i32
      "emitc.yield"(%5) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    "emitc.switch"(%0) <{cases = array<i64: 2, 5>}> ({
      %3 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%3) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %2 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %1 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

