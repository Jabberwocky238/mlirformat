"builtin.module"() ({
  "irdl.dialect"() <{sym_name = "testvar"}> ({
    "irdl.operation"() <{sym_name = "single_operand"}> ({
      %19 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":4:13)
      "irdl.operands"(%19) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":5:7)
    }) : () -> () loc("<stdin>":3:5)
    "irdl.operation"() <{sym_name = "var_operand"}> ({
      %16 = "irdl.is"() <{expected = i16}> : () -> !irdl.attribute loc("<stdin>":8:13)
      %17 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":9:13)
      %18 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute loc("<stdin>":10:13)
      "irdl.operands"(%16, %17, %18) <{names = ["foo", "bar", "baz"], variadicity = #irdl<variadicity_array[single, variadic, single]>}> : (!irdl.attribute, !irdl.attribute, !irdl.attribute) -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":7:5)
    "irdl.operation"() <{sym_name = "opt_operand"}> ({
      %13 = "irdl.is"() <{expected = i16}> : () -> !irdl.attribute loc("<stdin>":14:13)
      %14 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":15:13)
      %15 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute loc("<stdin>":16:13)
      "irdl.operands"(%13, %14, %15) <{names = ["foo", "bar", "baz"], variadicity = #irdl<variadicity_array[single, optional, single]>}> : (!irdl.attribute, !irdl.attribute, !irdl.attribute) -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":13:5)
    "irdl.operation"() <{sym_name = "var_and_opt_operand"}> ({
      %10 = "irdl.is"() <{expected = i16}> : () -> !irdl.attribute loc("<stdin>":20:13)
      %11 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":21:13)
      %12 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute loc("<stdin>":22:13)
      "irdl.operands"(%10, %11, %12) <{names = ["foo", "bar", "baz"], variadicity = #irdl<variadicity_array[variadic, optional, single]>}> : (!irdl.attribute, !irdl.attribute, !irdl.attribute) -> () loc("<stdin>":23:7)
    }) : () -> () loc("<stdin>":19:5)
    "irdl.operation"() <{sym_name = "single_result"}> ({
      %9 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":26:12)
      "irdl.results"(%9) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":27:7)
    }) : () -> () loc("<stdin>":25:5)
    "irdl.operation"() <{sym_name = "var_result"}> ({
      %6 = "irdl.is"() <{expected = i16}> : () -> !irdl.attribute loc("<stdin>":30:12)
      %7 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":31:12)
      %8 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute loc("<stdin>":32:12)
      "irdl.results"(%6, %7, %8) <{names = ["foo", "bar", "baz"], variadicity = #irdl<variadicity_array[single, variadic, single]>}> : (!irdl.attribute, !irdl.attribute, !irdl.attribute) -> () loc("<stdin>":33:7)
    }) : () -> () loc("<stdin>":29:5)
    "irdl.operation"() <{sym_name = "opt_result"}> ({
      %3 = "irdl.is"() <{expected = i16}> : () -> !irdl.attribute loc("<stdin>":36:12)
      %4 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":37:12)
      %5 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute loc("<stdin>":38:12)
      "irdl.results"(%3, %4, %5) <{names = ["foo", "bar", "baz"], variadicity = #irdl<variadicity_array[single, optional, single]>}> : (!irdl.attribute, !irdl.attribute, !irdl.attribute) -> () loc("<stdin>":39:7)
    }) : () -> () loc("<stdin>":35:5)
    "irdl.operation"() <{sym_name = "var_and_opt_result"}> ({
      %0 = "irdl.is"() <{expected = i16}> : () -> !irdl.attribute loc("<stdin>":42:12)
      %1 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":43:12)
      %2 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute loc("<stdin>":44:12)
      "irdl.results"(%0, %1, %2) <{names = ["foo", "bar", "baz"], variadicity = #irdl<variadicity_array[variadic, optional, single]>}> : (!irdl.attribute, !irdl.attribute, !irdl.attribute) -> () loc("<stdin>":45:7)
    }) : () -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
