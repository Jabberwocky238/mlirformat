"builtin.module"() ({
  "irdl.dialect"() <{sym_name = "testd"}> ({
    "irdl.type"() <{sym_name = "self_referencing"}> ({
      %8 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":4:12)
      %9 = "irdl.parametric"(%8) <{base_type = @testd::@self_referencing}> : (!irdl.attribute) -> !irdl.attribute loc("<stdin>":5:12)
      %10 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":6:13)
      %11 = "irdl.any_of"(%9, %10) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute loc("<stdin>":7:13)
      "irdl.parameters"(%11) <{names = ["foo"]}> : (!irdl.attribute) -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":3:5)
    "irdl.type"() <{sym_name = "type1"}> ({
      %4 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":11:12)
      %5 = "irdl.parametric"(%4) <{base_type = @testd::@type2}> : (!irdl.attribute) -> !irdl.attribute loc("<stdin>":12:12)
      %6 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":13:12)
      %7 = "irdl.any_of"(%5, %6) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute loc("<stdin>":14:12)
      "irdl.parameters"(%7) <{names = ["foo"]}> : (!irdl.attribute) -> () loc("<stdin>":15:7)
    }) : () -> () loc("<stdin>":10:5)
    "irdl.type"() <{sym_name = "type2"}> ({
      %0 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":18:12)
      %1 = "irdl.parametric"(%0) <{base_type = @testd::@type1}> : (!irdl.attribute) -> !irdl.attribute loc("<stdin>":19:12)
      %2 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":20:12)
      %3 = "irdl.any_of"(%1, %2) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute loc("<stdin>":21:12)
      "irdl.parameters"(%3) <{names = ["foo"]}> : (!irdl.attribute) -> () loc("<stdin>":22:7)
    }) : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
