"builtin.module"() ({
  "irdl.dialect"() <{sym_name = "testd"}> ({
    "irdl.type"() <{sym_name = "parametric"}> ({
      %32 = "irdl.any"() : () -> !irdl.attribute
      "irdl.parameters"(%32) <{names = ["foo"]}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.attribute"() <{sym_name = "parametric_attr"}> ({
      %31 = "irdl.any"() : () -> !irdl.attribute
      "irdl.parameters"(%31) <{names = ["foo"]}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.type"() <{sym_name = "attr_in_type_out"}> ({
      %30 = "irdl.any"() : () -> !irdl.attribute
      "irdl.parameters"(%30) <{names = ["foo"]}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "eq"}> ({
      %29 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      "irdl.results"(%29) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "anyof"}> ({
      %26 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      %27 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute
      %28 = "irdl.any_of"(%26, %27) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute
      "irdl.results"(%28) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "all_of"}> ({
      %22 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      %23 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute
      %24 = "irdl.any_of"(%22, %23) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute
      %25 = "irdl.all_of"(%24, %23) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute
      "irdl.results"(%25) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "any"}> ({
      %21 = "irdl.any"() : () -> !irdl.attribute
      "irdl.results"(%21) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "dyn_type_base"}> ({
      %20 = "irdl.base"() <{base_ref = @testd::@parametric}> : () -> !irdl.attribute
      "irdl.results"(%20) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "dyn_attr_base"}> ({
      %19 = "irdl.base"() <{base_ref = @testd::@parametric_attr}> : () -> !irdl.attribute
      "irdl.attributes"(%19) <{attributeValueNames = ["attr1"]}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "named_type_base"}> ({
      %18 = "irdl.base"() <{base_name = "!builtin.integer"}> : () -> !irdl.attribute
      "irdl.results"(%18) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "named_attr_base"}> ({
      %17 = "irdl.base"() <{base_name = "#builtin.integer"}> : () -> !irdl.attribute
      "irdl.attributes"(%17) <{attributeValueNames = ["attr1"]}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "dynparams"}> ({
      %13 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      %14 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute
      %15 = "irdl.any_of"(%13, %14) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute
      %16 = "irdl.parametric"(%15) <{base_type = @testd::@parametric}> : (!irdl.attribute) -> !irdl.attribute
      "irdl.results"(%16) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "constraint_vars"}> ({
      %10 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      %11 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute
      %12 = "irdl.any_of"(%10, %11) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute
      "irdl.results"(%12, %12) <{names = ["foo", "bar"], variadicity = #irdl<variadicity_array[single, single]>}> : (!irdl.attribute, !irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "attrs"}> ({
      %8 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      %9 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute
      "irdl.attributes"(%8, %9) <{attributeValueNames = ["attr1", "attr2"]}> : (!irdl.attribute, !irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "regions"}> ({
      %2 = "irdl.region"() : () -> !irdl.region
      %3 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      %4 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute
      %5 = "irdl.region"(%3, %4) <{constrainedArguments}> : (!irdl.attribute, !irdl.attribute) -> !irdl.region
      %6 = "irdl.region"() <{numberOfBlocks = 3 : i32}> : () -> !irdl.region
      %7 = "irdl.region"() <{constrainedArguments}> : () -> !irdl.region
      "irdl.regions"(%2, %5, %6, %7) <{names = ["foo", "bar", "baz", "qux"]}> : (!irdl.region, !irdl.region, !irdl.region, !irdl.region) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "region_and_operand"}> ({
      %0 = "irdl.any"() : () -> !irdl.attribute
      %1 = "irdl.region"(%0) <{constrainedArguments}> : (!irdl.attribute) -> !irdl.region
      "irdl.operands"(%0) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> ()
      "irdl.regions"(%1) <{names = ["bar"]}> : (!irdl.region) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

