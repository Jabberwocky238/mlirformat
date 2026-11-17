"builtin.module"() ({
  "irdl.dialect"() <{sym_name = "testd"}> ({
    "irdl.type"() <{sym_name = "parametric"}> ({
      %32 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":4:13)
      "irdl.parameters"(%32) <{names = ["foo"]}> : (!irdl.attribute) -> () loc("<stdin>":5:7)
    }) : () -> () loc("<stdin>":3:5)
    "irdl.attribute"() <{sym_name = "parametric_attr"}> ({
      %31 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":8:13)
      "irdl.parameters"(%31) <{names = ["foo"]}> : (!irdl.attribute) -> () loc("<stdin>":9:7)
    }) : () -> () loc("<stdin>":7:5)
    "irdl.type"() <{sym_name = "attr_in_type_out"}> ({
      %30 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":12:13)
      "irdl.parameters"(%30) <{names = ["foo"]}> : (!irdl.attribute) -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":11:5)
    "irdl.operation"() <{sym_name = "eq"}> ({
      %29 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":16:13)
      "irdl.results"(%29) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":15:5)
    "irdl.operation"() <{sym_name = "anyof"}> ({
      %26 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":20:13)
      %27 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute loc("<stdin>":21:13)
      %28 = "irdl.any_of"(%26, %27) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute loc("<stdin>":22:13)
      "irdl.results"(%28) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":23:7)
    }) : () -> () loc("<stdin>":19:5)
    "irdl.operation"() <{sym_name = "all_of"}> ({
      %22 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":26:13)
      %23 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute loc("<stdin>":27:13)
      %24 = "irdl.any_of"(%22, %23) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute loc("<stdin>":28:13)
      %25 = "irdl.all_of"(%24, %23) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute loc("<stdin>":29:13)
      "irdl.results"(%25) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":30:7)
    }) : () -> () loc("<stdin>":25:5)
    "irdl.operation"() <{sym_name = "any"}> ({
      %21 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":33:13)
      "irdl.results"(%21) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":34:7)
    }) : () -> () loc("<stdin>":32:5)
    "irdl.operation"() <{sym_name = "dyn_type_base"}> ({
      %20 = "irdl.base"() <{base_ref = @testd::@parametric}> : () -> !irdl.attribute loc("<stdin>":37:13)
      "irdl.results"(%20) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":38:7)
    }) : () -> () loc("<stdin>":36:5)
    "irdl.operation"() <{sym_name = "dyn_attr_base"}> ({
      %19 = "irdl.base"() <{base_ref = @testd::@parametric_attr}> : () -> !irdl.attribute loc("<stdin>":41:13)
      "irdl.attributes"(%19) <{attributeValueNames = ["attr1"]}> : (!irdl.attribute) -> () loc("<stdin>":42:7)
    }) : () -> () loc("<stdin>":40:5)
    "irdl.operation"() <{sym_name = "named_type_base"}> ({
      %18 = "irdl.base"() <{base_name = "!builtin.integer"}> : () -> !irdl.attribute loc("<stdin>":45:13)
      "irdl.results"(%18) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":46:7)
    }) : () -> () loc("<stdin>":44:5)
    "irdl.operation"() <{sym_name = "named_attr_base"}> ({
      %17 = "irdl.base"() <{base_name = "#builtin.integer"}> : () -> !irdl.attribute loc("<stdin>":49:13)
      "irdl.attributes"(%17) <{attributeValueNames = ["attr1"]}> : (!irdl.attribute) -> () loc("<stdin>":50:7)
    }) : () -> () loc("<stdin>":48:5)
    "irdl.operation"() <{sym_name = "dynparams"}> ({
      %13 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":53:13)
      %14 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute loc("<stdin>":54:13)
      %15 = "irdl.any_of"(%13, %14) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute loc("<stdin>":55:13)
      %16 = "irdl.parametric"(%15) <{base_type = @testd::@parametric}> : (!irdl.attribute) -> !irdl.attribute loc("<stdin>":56:13)
      "irdl.results"(%16) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":57:7)
    }) : () -> () loc("<stdin>":52:5)
    "irdl.operation"() <{sym_name = "constraint_vars"}> ({
      %10 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":60:13)
      %11 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute loc("<stdin>":61:13)
      %12 = "irdl.any_of"(%10, %11) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute loc("<stdin>":62:13)
      "irdl.results"(%12, %12) <{names = ["foo", "bar"], variadicity = #irdl<variadicity_array[single, single]>}> : (!irdl.attribute, !irdl.attribute) -> () loc("<stdin>":63:7)
    }) : () -> () loc("<stdin>":59:5)
    "irdl.operation"() <{sym_name = "attrs"}> ({
      %8 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":66:12)
      %9 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute loc("<stdin>":67:12)
      "irdl.attributes"(%8, %9) <{attributeValueNames = ["attr1", "attr2"]}> : (!irdl.attribute, !irdl.attribute) -> () loc("<stdin>":68:7)
    }) : () -> () loc("<stdin>":65:5)
    "irdl.operation"() <{sym_name = "regions"}> ({
      %2 = "irdl.region"() : () -> !irdl.region loc("<stdin>":71:12)
      %3 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":72:12)
      %4 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute loc("<stdin>":73:12)
      %5 = "irdl.region"(%3, %4) <{constrainedArguments}> : (!irdl.attribute, !irdl.attribute) -> !irdl.region loc("<stdin>":74:12)
      %6 = "irdl.region"() <{numberOfBlocks = 3 : i32}> : () -> !irdl.region loc("<stdin>":75:12)
      %7 = "irdl.region"() <{constrainedArguments}> : () -> !irdl.region loc("<stdin>":76:12)
      "irdl.regions"(%2, %5, %6, %7) <{names = ["foo", "bar", "baz", "qux"]}> : (!irdl.region, !irdl.region, !irdl.region, !irdl.region) -> () loc("<stdin>":77:7)
    }) : () -> () loc("<stdin>":70:5)
    "irdl.operation"() <{sym_name = "region_and_operand"}> ({
      %0 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":80:12)
      %1 = "irdl.region"(%0) <{constrainedArguments}> : (!irdl.attribute) -> !irdl.region loc("<stdin>":81:12)
      "irdl.operands"(%0) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":82:7)
      "irdl.regions"(%1) <{names = ["bar"]}> : (!irdl.region) -> () loc("<stdin>":83:7)
    }) : () -> () loc("<stdin>":79:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
