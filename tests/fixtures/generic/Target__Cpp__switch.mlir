"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_ptrdiff_t"}> ({
    %55 = "emitc.constant"() <{value = 1 : index}> : () -> !emitc.ptrdiff_t
    "emitc.switch"(%55) <{cases = array<i64: 2, 5>}> ({
      %58 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%58) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %57 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %56 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (!emitc.ptrdiff_t) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_ssize_t"}> ({
    %51 = "emitc.constant"() <{value = 1 : index}> : () -> !emitc.ssize_t
    "emitc.switch"(%51) <{cases = array<i64: 2, 5>}> ({
      %54 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%54) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %53 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %52 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (!emitc.ssize_t) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_size_t"}> ({
    %47 = "emitc.constant"() <{value = 1 : index}> : () -> !emitc.size_t
    "emitc.switch"(%47) <{cases = array<i64: 2, 5>}> ({
      %50 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%50) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %49 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %48 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (!emitc.size_t) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_index"}> ({
    %43 = "emitc.constant"() <{value = 1 : index}> : () -> index
    "emitc.switch"(%43) <{cases = array<i64: 2, 5>}> ({
      %46 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%46) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %45 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %44 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_opaque"}> ({
    %39 = "emitc.constant"() <{value = #emitc.opaque<"1">}> : () -> !emitc.opaque<"size_t">
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
    }) : (!emitc.opaque<"size_t">) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_i1"}> ({
    %35 = "emitc.constant"() <{value = true}> : () -> i1
    "emitc.switch"(%35) <{cases = array<i64: 2, 5>}> ({
      %38 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%38) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %37 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %36 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_i8"}> ({
    %31 = "emitc.constant"() <{value = 1 : i8}> : () -> i8
    "emitc.switch"(%31) <{cases = array<i64: 2, 5>}> ({
      %34 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%34) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %33 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %32 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (i8) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_ui8"}> ({
    %27 = "emitc.constant"() <{value = 1 : ui8}> : () -> ui8
    "emitc.switch"(%27) <{cases = array<i64: 2, 5>}> ({
      %30 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%30) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %29 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %28 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (ui8) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_i16"}> ({
    %23 = "emitc.constant"() <{value = 1 : i16}> : () -> i16
    "emitc.switch"(%23) <{cases = array<i64: 2, 5>}> ({
      %26 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%26) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %25 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %24 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (i16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_ui16"}> ({
    %19 = "emitc.constant"() <{value = 1 : ui16}> : () -> ui16
    "emitc.switch"(%19) <{cases = array<i64: 2, 5>}> ({
      %22 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%22) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %21 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %20 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (ui16) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_i32"}> ({
    %15 = "emitc.constant"() <{value = 1 : i32}> : () -> i32
    "emitc.switch"(%15) <{cases = array<i64: 2, 5>}> ({
      %18 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%18) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %17 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %16 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_ui32"}> ({
    %11 = "emitc.constant"() <{value = 1 : ui32}> : () -> ui32
    "emitc.switch"(%11) <{cases = array<i64: 2, 5>}> ({
      %14 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%14) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %13 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %12 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (ui32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_i64"}> ({
    %7 = "emitc.constant"() <{value = 1 : i64}> : () -> i64
    "emitc.switch"(%7) <{cases = array<i64: 2, 5>}> ({
      %10 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%10) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %9 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %8 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_ui64"}> ({
    %3 = "emitc.constant"() <{value = 1 : ui64}> : () -> ui64
    "emitc.switch"(%3) <{cases = array<i64: 2, 5>}> ({
      %6 = "emitc.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
      "emitc.call_opaque"(%6) <{callee = "func2"}> : (f32) -> ()
      "emitc.yield"() : () -> ()
    }, {
      %5 = "emitc.call_opaque"() <{callee = "func_b"}> : () -> i32
      "emitc.yield"() : () -> ()
    }, {
      %4 = "emitc.call_opaque"() <{callee = "func_a"}> : () -> i32
      "emitc.yield"() : () -> ()
    }) : (ui64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "emitc_switch_expression"}> ({
    %0 = "emitc.constant"() <{value = 42 : i64}> : () -> i64
    %1 = "emitc.expression"(%0) ({
    ^bb0(%arg0: i64):
      %2 = "emitc.unary_minus"(%arg0) : (i64) -> i64
      "emitc.yield"(%2) : (i64) -> ()
    }) : (i64) -> i64
    "emitc.switch"(%1) <{cases = array<i64>}> ({
      "emitc.yield"() : () -> ()
    }) : (i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

