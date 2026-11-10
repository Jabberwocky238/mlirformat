"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32) -> i1, sym_name = "single_expression"}> ({
  ^bb0(%arg153: i32, %arg154: i32, %arg155: i32):
    %170 = "emitc.expression"(%arg153, %arg154, %arg155) ({
    ^bb0(%arg156: i32, %arg157: i32, %arg158: i32):
      %171 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
      %172 = "emitc.mul"(%arg156, %171) : (i32, i32) -> i32
      %173 = "emitc.sub"(%172, %arg157) : (i32, i32) -> i32
      %174 = "emitc.cmp"(%173, %arg158) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%174) : (i1) -> ()
    }) : (i32, i32, i32) -> i1
    "func.return"(%170) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> i32, sym_name = "single_use"}> ({
  ^bb0(%arg144: i32, %arg145: i32, %arg146: i32, %arg147: i32):
    %162 = "emitc.literal"() <{value = "M_PI"}> : () -> i32
    %163 = "emitc.expression"(%arg144, %arg145, %arg146, %arg147, %162) ({
    ^bb0(%arg148: i32, %arg149: i32, %arg150: i32, %arg151: i32, %arg152: i32):
      %166 = "emitc.mul"(%arg148, %arg152) : (i32, i32) -> i32
      %167 = "emitc.call_opaque"(%166, %arg150) <{callee = "bar"}> : (i32, i32) -> i32
      %168 = "emitc.sub"(%167, %arg151) : (i32, i32) -> i32
      %169 = "emitc.cmp"(%168, %arg149) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%169) : (i1) -> ()
    }) : (i32, i32, i32, i32, i32) -> i1
    %164 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.if"(%163) ({
      "emitc.assign"(%164, %arg144) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      "emitc.assign"(%164, %arg144) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }) : (i1) -> ()
    %165 = "emitc.load"(%164) : (!emitc.lvalue<i32>) -> i32
    "func.return"(%165) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "do_not_inline"}> ({
  ^bb0(%arg138: i32, %arg139: i32, %arg140: i32):
    %159 = "emitc.expression"(%arg138, %arg139, %arg140) <{do_not_inline}> ({
    ^bb0(%arg141: i32, %arg142: i32, %arg143: i32):
      %160 = "emitc.add"(%arg141, %arg142) : (i32, i32) -> i32
      %161 = "emitc.mul"(%160, %arg143) : (i32, i32) -> i32
      "emitc.yield"(%161) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    "func.return"(%159) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> f32, sym_name = "parentheses_for_low_precedence"}> ({
  ^bb0(%arg132: i32, %arg133: i32, %arg134: i32):
    %155 = "emitc.expression"(%arg132, %arg133, %arg134) ({
    ^bb0(%arg135: i32, %arg136: i32, %arg137: i32):
      %156 = "emitc.add"(%arg135, %arg136) : (i32, i32) -> i32
      %157 = "emitc.mul"(%156, %arg137) : (i32, i32) -> i32
      %158 = "emitc.cast"(%157) : (i32) -> f32
      "emitc.yield"(%158) : (f32) -> ()
    }) : (i32, i32, i32) -> f32
    "func.return"(%155) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> f32, sym_name = "inline_cast_pure"}> ({
  ^bb0(%arg130: i32):
    %153 = "emitc.expression"(%arg130) ({
    ^bb0(%arg131: i32):
      %154 = "emitc.cast"(%arg131) <{pure}> : (i32) -> f32
      "emitc.yield"(%154) : (f32) -> ()
    }) : (i32) -> f32
    "func.return"(%153) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> f32, sym_name = "do_not_inline_cast_without_pure"}> ({
  ^bb0(%arg128: i32):
    %151 = "emitc.expression"(%arg128) ({
    ^bb0(%arg129: i32):
      %152 = "emitc.cast"(%arg129) : (i32) -> f32
      "emitc.yield"(%152) : (f32) -> ()
    }) : (i32) -> f32
    "func.return"(%151) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "parentheses_for_same_precedence"}> ({
  ^bb0(%arg122: i32, %arg123: i32, %arg124: i32):
    %148 = "emitc.expression"(%arg122, %arg123, %arg124) ({
    ^bb0(%arg125: i32, %arg126: i32, %arg127: i32):
      %149 = "emitc.mul"(%arg125, %arg126) : (i32, i32) -> i32
      %150 = "emitc.div"(%arg127, %149) : (i32, i32) -> i32
      "emitc.yield"(%150) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    "func.return"(%148) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "user_with_expression_trait"}> ({
  ^bb0(%arg101: i32, %arg102: i32, %arg103: i32):
    %124 = "emitc.constant"() <{value = 0 : i32}> : () -> i32
    %125 = "emitc.expression"(%arg101, %arg102, %arg103) ({
    ^bb0(%arg119: i32, %arg120: i32, %arg121: i32):
      %146 = "emitc.mul"(%arg119, %arg120) : (i32, i32) -> i32
      %147 = "emitc.div"(%arg121, %146) : (i32, i32) -> i32
      "emitc.yield"(%147) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    %126 = "emitc.expression"(%arg101, %arg102, %arg103) ({
    ^bb0(%arg116: i32, %arg117: i32, %arg118: i32):
      %144 = "emitc.mul"(%arg116, %arg117) : (i32, i32) -> i32
      %145 = "emitc.div"(%arg118, %144) : (i32, i32) -> i32
      "emitc.yield"(%145) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    %127 = "emitc.expression"(%arg101, %arg102, %arg103) ({
    ^bb0(%arg113: i32, %arg114: i32, %arg115: i32):
      %142 = "emitc.mul"(%arg113, %arg114) : (i32, i32) -> i32
      %143 = "emitc.div"(%arg115, %142) : (i32, i32) -> i32
      "emitc.yield"(%143) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    %128 = "emitc.expression"(%arg101, %arg102, %arg103) ({
    ^bb0(%arg110: i32, %arg111: i32, %arg112: i32):
      %140 = "emitc.mul"(%arg110, %arg111) : (i32, i32) -> i32
      %141 = "emitc.div"(%arg112, %140) : (i32, i32) -> i32
      "emitc.yield"(%141) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    %129 = "emitc.expression"(%arg101, %arg102, %arg103) ({
    ^bb0(%arg107: i32, %arg108: i32, %arg109: i32):
      %138 = "emitc.mul"(%arg107, %arg108) : (i32, i32) -> i32
      %139 = "emitc.div"(%arg109, %138) : (i32, i32) -> i32
      "emitc.yield"(%139) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    %130 = "emitc.expression"(%arg101, %arg102, %arg103) ({
    ^bb0(%arg104: i32, %arg105: i32, %arg106: i32):
      %136 = "emitc.mul"(%arg104, %arg105) : (i32, i32) -> i32
      %137 = "emitc.div"(%arg106, %136) : (i32, i32) -> i32
      "emitc.yield"(%137) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    %131 = "emitc.cast"(%125) : (i32) -> i1
    %132 = "emitc.add"(%126, %124) : (i32, i32) -> i32
    %133 = "emitc.call_opaque"(%127, %124) <{callee = "bar"}> : (i32, i32) -> i32
    %134 = "emitc.conditional"(%131, %128, %124) : (i1, i32, i32) -> i32
    %135 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.assign"(%135, %129) : (!emitc.lvalue<i32>, i32) -> ()
    "func.return"(%130) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> i32, sym_name = "multiple_uses"}> ({
  ^bb0(%arg93: i32, %arg94: i32, %arg95: i32, %arg96: i32):
    %116 = "emitc.expression"(%arg93, %arg94, %arg95, %arg96) ({
    ^bb0(%arg97: i32, %arg98: i32, %arg99: i32, %arg100: i32):
      %120 = "emitc.mul"(%arg97, %arg98) : (i32, i32) -> i32
      %121 = "emitc.call_opaque"(%120, %arg99) <{callee = "bar"}> : (i32, i32) -> i32
      %122 = "emitc.sub"(%121, %120) : (i32, i32) -> i32
      %123 = "emitc.cmp"(%122, %arg100) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%123) : (i1) -> ()
    }) : (i32, i32, i32, i32) -> i1
    %117 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.if"(%116) ({
      "emitc.assign"(%117, %arg93) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      "emitc.assign"(%117, %arg93) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }) : (i1) -> ()
    %118 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i1>
    "emitc.assign"(%118, %116) : (!emitc.lvalue<i1>, i1) -> ()
    %119 = "emitc.load"(%117) : (!emitc.lvalue<i32>) -> i32
    "func.return"(%119) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32) -> i32, sym_name = "different_expressions"}> ({
  ^bb0(%arg81: i32, %arg82: i32, %arg83: i32, %arg84: i32):
    %106 = "emitc.expression"(%arg83, %arg84) ({
    ^bb0(%arg91: i32, %arg92: i32):
      %115 = "emitc.rem"(%arg91, %arg92) : (i32, i32) -> i32
      "emitc.yield"(%115) : (i32) -> ()
    }) : (i32, i32) -> i32
    %107 = "emitc.expression"(%arg81, %arg82, %106) ({
    ^bb0(%arg88: i32, %arg89: i32, %arg90: i32):
      %113 = "emitc.mul"(%arg88, %arg89) : (i32, i32) -> i32
      %114 = "emitc.call_opaque"(%arg90, %113) <{callee = "bar"}> : (i32, i32) -> i32
      "emitc.yield"(%114) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    %108 = "emitc.expression"(%arg82, %107, %arg84) ({
    ^bb0(%arg85: i32, %arg86: i32, %arg87: i32):
      %111 = "emitc.sub"(%arg86, %arg87) : (i32, i32) -> i32
      %112 = "emitc.cmp"(%111, %arg85) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%112) : (i1) -> ()
    }) : (i32, i32, i32) -> i1
    %109 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.if"(%108) ({
      "emitc.assign"(%109, %arg81) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      "emitc.assign"(%109, %arg81) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }) : (i1) -> ()
    %110 = "emitc.load"(%109) : (!emitc.lvalue<i32>) -> i32
    "func.return"(%110) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, !emitc.ptr<i32>) -> i1, sym_name = "expression_with_address_taken"}> ({
  ^bb0(%arg75: i32, %arg76: i32, %arg77: !emitc.ptr<i32>):
    %101 = "emitc.variable"() <{value = 42 : i32}> : () -> !emitc.lvalue<i32>
    %102 = "emitc.expression"(%arg76, %arg77, %101) ({
    ^bb0(%arg78: i32, %arg79: !emitc.ptr<i32>, %arg80: !emitc.lvalue<i32>):
      %103 = "emitc.address_of"(%arg80) : (!emitc.lvalue<i32>) -> !emitc.ptr<i32>
      %104 = "emitc.sub"(%103, %arg78) : (!emitc.ptr<i32>, i32) -> !emitc.ptr<i32>
      %105 = "emitc.cmp"(%104, %arg79) <{predicate = 2 : i64}> : (!emitc.ptr<i32>, !emitc.ptr<i32>) -> i1
      "emitc.yield"(%105) : (i1) -> ()
    }) : (i32, !emitc.ptr<i32>, !emitc.lvalue<i32>) -> i1
    "func.return"(%102) : (i1) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.array<4x8xi32>, i32, i32) -> i32, sym_name = "expression_with_subscript"}> ({
  ^bb0(%arg69: !emitc.array<4x8xi32>, %arg70: i32, %arg71: i32):
    %96 = "emitc.expression"(%arg69, %arg70, %arg71) ({
    ^bb0(%arg72: !emitc.array<4x8xi32>, %arg73: i32, %arg74: i32):
      %97 = "emitc.add"(%arg73, %arg74) : (i32, i32) -> i32
      %98 = "emitc.mul"(%97, %arg74) : (i32, i32) -> i32
      %99 = "emitc.subscript"(%arg72, %97, %98) : (!emitc.array<4x8xi32>, i32, i32) -> !emitc.lvalue<i32>
      %100 = "emitc.load"(%99) : (!emitc.lvalue<i32>) -> i32
      "emitc.yield"(%100) : (i32) -> ()
    }) : (!emitc.array<4x8xi32>, i32, i32) -> i32
    "func.return"(%96) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.ptr<!emitc.opaque<"void">>) -> i32, sym_name = "expression_with_subscript_user"}> ({
  ^bb0(%arg67: !emitc.ptr<!emitc.opaque<"void">>):
    %91 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %92 = "emitc.expression"(%arg67) ({
    ^bb0(%arg68: !emitc.ptr<!emitc.opaque<"void">>):
      %95 = "emitc.cast"(%arg68) : (!emitc.ptr<!emitc.opaque<"void">>) -> !emitc.ptr<i32>
      "emitc.yield"(%95) : (!emitc.ptr<i32>) -> ()
    }) : (!emitc.ptr<!emitc.opaque<"void">>) -> !emitc.ptr<i32>
    %93 = "emitc.subscript"(%92, %91) : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %94 = "emitc.load"(%93) : (!emitc.lvalue<i32>) -> i32
    "func.return"(%94) : (i32) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32, i32, !emitc.ptr<i32>) -> i1, sym_name = "expression_with_load"}> ({
  ^bb0(%arg60: i32, %arg61: i32, %arg62: !emitc.ptr<i32>):
    %82 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %83 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32>
    %84 = "emitc.subscript"(%arg62, %82) : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %85 = "emitc.expression"(%arg60, %arg61, %83, %84) ({
    ^bb0(%arg63: i32, %arg64: i32, %arg65: !emitc.lvalue<i32>, %arg66: !emitc.lvalue<i32>):
      %86 = "emitc.load"(%arg65) : (!emitc.lvalue<i32>) -> i32
      %87 = "emitc.add"(%86, %arg64) : (i32, i32) -> i32
      %88 = "emitc.load"(%arg66) : (!emitc.lvalue<i32>) -> i32
      %89 = "emitc.add"(%88, %arg63) : (i32, i32) -> i32
      %90 = "emitc.cmp"(%87, %89) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%90) : (i1) -> ()
    }) : (i32, i32, !emitc.lvalue<i32>, !emitc.lvalue<i32>) -> i1
    "emitc.return"(%85) : (i1) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (!emitc.ptr<i32>) -> i1, sym_name = "expression_with_load_and_call"}> ({
  ^bb0(%arg58: !emitc.ptr<i32>):
    %73 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %74 = "emitc.subscript"(%arg58, %73) : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %75 = "emitc.expression"(%74) ({
    ^bb0(%arg59: !emitc.lvalue<i32>):
      %76 = "emitc.load"(%arg59) : (!emitc.lvalue<i32>) -> i32
      %77 = "emitc.load"(%arg59) : (!emitc.lvalue<i32>) -> i32
      %78 = "emitc.load"(%arg59) : (!emitc.lvalue<i32>) -> i32
      %79 = "emitc.call_opaque"(%76) <{callee = "bar"}> : (i32) -> i32
      %80 = "emitc.add"(%78, %79) : (i32, i32) -> i32
      %81 = "emitc.cmp"(%80, %77) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%81) : (i1) -> ()
    }) : (!emitc.lvalue<i32>) -> i1
    "emitc.return"(%75) : (i1) -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32, i32) -> (), sym_name = "expression_with_call_opaque_with_args_array"}> ({
  ^bb0(%arg54: i32, %arg55: i32):
    %70 = "emitc.expression"(%arg54, %arg55) ({
    ^bb0(%arg56: i32, %arg57: i32):
      %71 = "emitc.cmp"(%arg56, %arg57) <{predicate = 2 : i64}> : (i32, i32) -> i1
      %72 = "emitc.call_opaque"(%71) <{args = [0 : index], callee = "f"}> : (i1) -> i1
      "emitc.yield"(%72) : (i1) -> ()
    }) : (i32, i32) -> i1
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32, !emitc.ptr<i32>) -> (), sym_name = "inline_side_effects_into_assign"}> ({
  ^bb0(%arg49: i32, %arg50: !emitc.ptr<i32>):
    %62 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %63 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32>
    %64 = "emitc.subscript"(%arg50, %62) : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %65 = "emitc.expression"(%arg49, %63, %64) ({
    ^bb0(%arg51: i32, %arg52: !emitc.lvalue<i32>, %arg53: !emitc.lvalue<i32>):
      %66 = "emitc.load"(%arg52) : (!emitc.lvalue<i32>) -> i32
      %67 = "emitc.mul"(%66, %arg51) : (i32, i32) -> i32
      %68 = "emitc.load"(%arg53) : (!emitc.lvalue<i32>) -> i32
      %69 = "emitc.add"(%67, %68) : (i32, i32) -> i32
      "emitc.yield"(%69) : (i32) -> ()
    }) : (i32, !emitc.lvalue<i32>, !emitc.lvalue<i32>) -> i32
    "emitc.assign"(%63, %65) : (!emitc.lvalue<i32>, i32) -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32, !emitc.ptr<i32>) -> (), sym_name = "do_not_inline_side_effects_into_assign"}> ({
  ^bb0(%arg45: i32, %arg46: !emitc.ptr<i32>):
    %56 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %57 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32>
    %58 = "emitc.subscript"(%arg46, %56) : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %59 = "emitc.expression"(%arg45, %57) ({
    ^bb0(%arg47: i32, %arg48: !emitc.lvalue<i32>):
      %60 = "emitc.load"(%arg48) : (!emitc.lvalue<i32>) -> i32
      %61 = "emitc.mul"(%60, %arg47) : (i32, i32) -> i32
      "emitc.yield"(%61) : (i32) -> ()
    }) : (i32, !emitc.lvalue<i32>) -> i32
    "emitc.assign"(%58, %59) : (!emitc.lvalue<i32>, i32) -> ()
    "emitc.return"() : () -> ()
  }) : () -> ()
  "emitc.func"() <{function_type = (i32, !emitc.ptr<i32>) -> i32, sym_name = "do_not_inline_non_preceding_side_effects"}> ({
  ^bb0(%arg41: i32, %arg42: !emitc.ptr<i32>):
    %50 = "emitc.constant"() <{value = 0 : i64}> : () -> i64
    %51 = "emitc.variable"() <{value = #emitc.opaque<"42">}> : () -> !emitc.lvalue<i32>
    %52 = "emitc.subscript"(%arg42, %50) : (!emitc.ptr<i32>, i64) -> !emitc.lvalue<i32>
    %53 = "emitc.expression"(%arg41, %51) ({
    ^bb0(%arg43: i32, %arg44: !emitc.lvalue<i32>):
      %54 = "emitc.load"(%arg44) : (!emitc.lvalue<i32>) -> i32
      %55 = "emitc.mul"(%54, %arg43) : (i32, i32) -> i32
      "emitc.yield"(%55) : (i32) -> ()
    }) : (i32, !emitc.lvalue<i32>) -> i32
    "emitc.assign"(%52, %arg41) : (!emitc.lvalue<i32>, i32) -> ()
    "emitc.return"(%53) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> i32, sym_name = "inline_side_effects_into_if"}> ({
  ^bb0(%arg35: i32, %arg36: i32, %arg37: i32):
    %45 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    %46 = "emitc.expression"(%arg35, %arg36, %arg37) ({
    ^bb0(%arg38: i32, %arg39: i32, %arg40: i32):
      %48 = "emitc.call_opaque"(%arg38, %arg39) <{callee = "bar"}> : (i32, i32) -> i32
      %49 = "emitc.cmp"(%48, %arg40) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%49) : (i1) -> ()
    }) : (i32, i32, i32) -> i1
    "emitc.if"(%46) ({
      "emitc.assign"(%45, %arg35) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      "emitc.assign"(%45, %arg36) : (!emitc.lvalue<i32>, i32) -> ()
      "emitc.yield"() : () -> ()
    }) : (i1) -> ()
    %47 = "emitc.load"(%45) : (!emitc.lvalue<i32>) -> i32
    "func.return"(%47) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32) -> (), sym_name = "inline_side_effects_into_switch"}> ({
  ^bb0(%arg29: i32, %arg30: i32, %arg31: i32):
    %39 = "emitc.expression"(%arg29, %arg30, %arg31) ({
    ^bb0(%arg32: i32, %arg33: i32, %arg34: i32):
      %43 = "emitc.call_opaque"(%arg32, %arg33) <{callee = "bar"}> : (i32, i32) -> i32
      %44 = "emitc.add"(%43, %arg34) : (i32, i32) -> i32
      "emitc.yield"(%44) : (i32) -> ()
    }) : (i32, i32, i32) -> i32
    "emitc.switch"(%39) <{cases = array<i64: 2, 5>}> ({
      %42 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%42) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %41 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %40 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.opaque<"mystruct">, i32, index) -> (), sym_name = "member"}> ({
  ^bb0(%arg20: !emitc.opaque<"mystruct">, %arg21: i32, %arg22: index):
    %25 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.opaque<"mystruct">>
    "emitc.assign"(%25, %arg20) : (!emitc.lvalue<!emitc.opaque<"mystruct">>, !emitc.opaque<"mystruct">) -> ()
    %26 = "emitc.expression"(%25) ({
    ^bb0(%arg28: !emitc.lvalue<!emitc.opaque<"mystruct">>):
      %38 = "emitc.member"(%arg28) <{member = "a"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32>
      "emitc.yield"(%38) : (!emitc.lvalue<i32>) -> ()
    }) : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32>
    "emitc.assign"(%26, %arg21) : (!emitc.lvalue<i32>, i32) -> ()
    %27 = "emitc.expression"(%25) ({
    ^bb0(%arg27: !emitc.lvalue<!emitc.opaque<"mystruct">>):
      %36 = "emitc.member"(%arg27) <{member = "b"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32>
      %37 = "emitc.load"(%36) : (!emitc.lvalue<i32>) -> i32
      "emitc.yield"(%37) : (i32) -> ()
    }) : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> i32
    %28 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.assign"(%28, %27) : (!emitc.lvalue<i32>, i32) -> ()
    %29 = "emitc.expression"(%arg22, %25) ({
    ^bb0(%arg25: index, %arg26: !emitc.lvalue<!emitc.opaque<"mystruct">>):
      %33 = "emitc.member"(%arg26) <{member = "c"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.array<2xi32>
      %34 = "emitc.subscript"(%33, %arg25) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
      %35 = "emitc.load"(%34) : (!emitc.lvalue<i32>) -> i32
      "emitc.yield"(%35) : (i32) -> ()
    }) : (index, !emitc.lvalue<!emitc.opaque<"mystruct">>) -> i32
    "emitc.assign"(%28, %29) : (!emitc.lvalue<i32>, i32) -> ()
    %30 = "emitc.expression"(%arg22, %25) ({
    ^bb0(%arg23: index, %arg24: !emitc.lvalue<!emitc.opaque<"mystruct">>):
      %31 = "emitc.member"(%arg24) <{member = "d"}> : (!emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.array<2xi32>
      %32 = "emitc.subscript"(%31, %arg23) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
      "emitc.yield"(%32) : (!emitc.lvalue<i32>) -> ()
    }) : (index, !emitc.lvalue<!emitc.opaque<"mystruct">>) -> !emitc.lvalue<i32>
    "emitc.assign"(%30, %arg21) : (!emitc.lvalue<i32>, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.ptr<!emitc.opaque<"mystruct">>, i32, index) -> (), sym_name = "member_of_pointer"}> ({
  ^bb0(%arg11: !emitc.ptr<!emitc.opaque<"mystruct">>, %arg12: i32, %arg13: index):
    %11 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>
    "emitc.assign"(%11, %arg11) : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>, !emitc.ptr<!emitc.opaque<"mystruct">>) -> ()
    %12 = "emitc.expression"(%11) ({
    ^bb0(%arg19: !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>):
      %24 = "emitc.member_of_ptr"(%arg19) <{member = "a"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32>
      "emitc.yield"(%24) : (!emitc.lvalue<i32>) -> ()
    }) : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32>
    "emitc.assign"(%12, %arg12) : (!emitc.lvalue<i32>, i32) -> ()
    %13 = "emitc.expression"(%11) ({
    ^bb0(%arg18: !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>):
      %22 = "emitc.member_of_ptr"(%arg18) <{member = "b"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32>
      %23 = "emitc.load"(%22) : (!emitc.lvalue<i32>) -> i32
      "emitc.yield"(%23) : (i32) -> ()
    }) : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> i32
    %14 = "emitc.variable"() <{value = #emitc.opaque<"">}> : () -> !emitc.lvalue<i32>
    "emitc.assign"(%14, %13) : (!emitc.lvalue<i32>, i32) -> ()
    %15 = "emitc.expression"(%arg13, %11) ({
    ^bb0(%arg16: index, %arg17: !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>):
      %19 = "emitc.member_of_ptr"(%arg17) <{member = "c"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.array<2xi32>
      %20 = "emitc.subscript"(%19, %arg16) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
      %21 = "emitc.load"(%20) : (!emitc.lvalue<i32>) -> i32
      "emitc.yield"(%21) : (i32) -> ()
    }) : (index, !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> i32
    "emitc.assign"(%14, %15) : (!emitc.lvalue<i32>, i32) -> ()
    %16 = "emitc.expression"(%arg13, %11) ({
    ^bb0(%arg14: index, %arg15: !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>):
      %17 = "emitc.member_of_ptr"(%arg15) <{member = "d"}> : (!emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.array<2xi32>
      %18 = "emitc.subscript"(%17, %arg14) : (!emitc.array<2xi32>, index) -> !emitc.lvalue<i32>
      "emitc.yield"(%18) : (!emitc.lvalue<i32>) -> ()
    }) : (index, !emitc.lvalue<!emitc.ptr<!emitc.opaque<"mystruct">>>) -> !emitc.lvalue<i32>
    "emitc.assign"(%16, %arg12) : (!emitc.lvalue<i32>, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "expression_with_literal"}> ({
  ^bb0(%arg9: f32):
    %8 = "emitc.expression"(%arg9) ({
    ^bb0(%arg10: f32):
      %9 = "emitc.literal"() <{value = "M_PI"}> : () -> f32
      %10 = "emitc.add"(%arg10, %9) : (f32, f32) -> f32
      "emitc.yield"(%10) : (f32) -> ()
    }) : (f32) -> f32
    "func.return"(%8) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!emitc.array<2000xi32>, i32, i32, index) -> i1, sym_name = "expression_tree"}> ({
  ^bb0(%arg0: !emitc.array<2000xi32>, %arg1: i32, %arg2: i32, %arg3: index):
    %0 = "emitc.expression"(%arg0, %arg3) ({
    ^bb0(%arg7: !emitc.array<2000xi32>, %arg8: index):
      %5 = "emitc.constant"() <{value = 42 : index}> : () -> index
      %6 = "emitc.mul"(%arg8, %5) : (index, index) -> index
      %7 = "emitc.subscript"(%arg7, %6) : (!emitc.array<2000xi32>, index) -> !emitc.lvalue<i32>
      "emitc.yield"(%7) : (!emitc.lvalue<i32>) -> ()
    }) : (!emitc.array<2000xi32>, index) -> !emitc.lvalue<i32>
    %1 = "emitc.expression"(%0, %arg1, %arg2) ({
    ^bb0(%arg4: !emitc.lvalue<i32>, %arg5: i32, %arg6: i32):
      %2 = "emitc.load"(%arg4) : (!emitc.lvalue<i32>) -> i32
      %3 = "emitc.sub"(%2, %arg5) : (i32, i32) -> i32
      %4 = "emitc.cmp"(%3, %arg6) <{predicate = 2 : i64}> : (i32, i32) -> i1
      "emitc.yield"(%4) : (i1) -> ()
    }) : (!emitc.lvalue<i32>, i32, i32) -> i1
    "func.return"(%1) : (i1) -> ()
  }) : () -> ()
}) : () -> ()

