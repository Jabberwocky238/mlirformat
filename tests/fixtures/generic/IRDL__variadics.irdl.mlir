"builtin.module"() ({
  "irdl.dialect"() <{sym_name = "testvar"}> ({
    "irdl.operation"() <{sym_name = "single_operand"}> ({
      %19 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      "irdl.operands"(%19) <{names = ["foo"], variadicity = #irdl<variadicity_array[ single]>}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "var_operand"}> ({
      %16 = "irdl.is"() <{expected = i16}> : () -> !irdl.attribute
      %17 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      %18 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute
      "irdl.operands"(%16, %17, %18) <{names = ["foo", "bar", "baz"], variadicity = #irdl<variadicity_array[ single,  variadic,  single]>}> : (!irdl.attribute, !irdl.attribute, !irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "opt_operand"}> ({
      %13 = "irdl.is"() <{expected = i16}> : () -> !irdl.attribute
      %14 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      %15 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute
      "irdl.operands"(%13, %14, %15) <{names = ["foo", "bar", "baz"], variadicity = #irdl<variadicity_array[ single,  optional,  single]>}> : (!irdl.attribute, !irdl.attribute, !irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "var_and_opt_operand"}> ({
      %10 = "irdl.is"() <{expected = i16}> : () -> !irdl.attribute
      %11 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      %12 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute
      "irdl.operands"(%10, %11, %12) <{names = ["foo", "bar", "baz"], variadicity = #irdl<variadicity_array[ variadic,  optional,  single]>}> : (!irdl.attribute, !irdl.attribute, !irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "single_result"}> ({
      %9 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      "irdl.results"(%9) <{names = ["foo"], variadicity = #irdl<variadicity_array[ single]>}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "var_result"}> ({
      %6 = "irdl.is"() <{expected = i16}> : () -> !irdl.attribute
      %7 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      %8 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute
      "irdl.results"(%6, %7, %8) <{names = ["foo", "bar", "baz"], variadicity = #irdl<variadicity_array[ single,  variadic,  single]>}> : (!irdl.attribute, !irdl.attribute, !irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "opt_result"}> ({
      %3 = "irdl.is"() <{expected = i16}> : () -> !irdl.attribute
      %4 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      %5 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute
      "irdl.results"(%3, %4, %5) <{names = ["foo", "bar", "baz"], variadicity = #irdl<variadicity_array[ single,  optional,  single]>}> : (!irdl.attribute, !irdl.attribute, !irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "var_and_opt_result"}> ({
      %0 = "irdl.is"() <{expected = i16}> : () -> !irdl.attribute
      %1 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      %2 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute
      "irdl.results"(%0, %1, %2) <{names = ["foo", "bar", "baz"], variadicity = #irdl<variadicity_array[ variadic,  optional,  single]>}> : (!irdl.attribute, !irdl.attribute, !irdl.attribute) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

