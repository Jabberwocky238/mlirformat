"builtin.module"() ({
  "irdl.dialect"() <{sym_name = "testd"}> ({
    "irdl.type"() <{sym_name = "self_referencing"}> ({
      %8 = "irdl.any"() : () -> !irdl.attribute
      %9 = "irdl.parametric"(%8) <{base_type = @testd::@self_referencing}> : (!irdl.attribute) -> !irdl.attribute
      %10 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      %11 = "irdl.any_of"(%9, %10) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute
      "irdl.parameters"(%11) <{names = ["foo"]}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.type"() <{sym_name = "type1"}> ({
      %4 = "irdl.any"() : () -> !irdl.attribute
      %5 = "irdl.parametric"(%4) <{base_type = @testd::@type2}> : (!irdl.attribute) -> !irdl.attribute
      %6 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      %7 = "irdl.any_of"(%5, %6) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute
      "irdl.parameters"(%7) <{names = ["foo"]}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.type"() <{sym_name = "type2"}> ({
      %0 = "irdl.any"() : () -> !irdl.attribute
      %1 = "irdl.parametric"(%0) <{base_type = @testd::@type1}> : (!irdl.attribute) -> !irdl.attribute
      %2 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute
      %3 = "irdl.any_of"(%1, %2) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute
      "irdl.parameters"(%3) <{names = ["foo"]}> : (!irdl.attribute) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

