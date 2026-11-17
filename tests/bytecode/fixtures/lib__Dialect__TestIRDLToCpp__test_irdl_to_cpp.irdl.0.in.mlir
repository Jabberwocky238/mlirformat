"builtin.module"() ({
  "irdl.dialect"() <{sym_name = "test_irdl_to_cpp"}> ({
    "irdl.type"() <{sym_name = "foo"}> ({
    ^bb0:
    }) : () -> () loc("<stdin>":3:5)
    "irdl.operation"() <{sym_name = "bar"}> ({
      %7 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":7:12)
      "irdl.results"(%7) <{names = ["res"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":8:7)
    }) : () -> () loc("<stdin>":6:5)
    "irdl.operation"() <{sym_name = "beef"}> ({
      %6 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":11:12)
      "irdl.operands"(%6, %6) <{names = ["lhs", "rhs"], variadicity = #irdl<variadicity_array[single, single]>}> : (!irdl.attribute, !irdl.attribute) -> () loc("<stdin>":12:7)
      "irdl.results"(%6) <{names = ["res"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":10:5)
    "irdl.operation"() <{sym_name = "hash"}> ({
      %5 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":16:12)
      "irdl.operands"(%5, %5) <{names = ["lhs", "rhs"], variadicity = #irdl<variadicity_array[single, single]>}> : (!irdl.attribute, !irdl.attribute) -> () loc("<stdin>":17:7)
      "irdl.results"(%5) <{names = ["res"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":18:7)
    }) : () -> () loc("<stdin>":15:5)
    "irdl.operation"() <{sym_name = "conditional"}> ({
      %0 = "irdl.region"() : () -> !irdl.region loc("<stdin>":21:12)
      %1 = "irdl.region"() <{constrainedArguments}> : () -> !irdl.region loc("<stdin>":22:12)
      %2 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":23:12)
      %3 = "irdl.region"(%2) <{constrainedArguments}> : (!irdl.attribute) -> !irdl.region loc("<stdin>":24:12)
      "irdl.regions"(%3, %0, %1) <{names = ["cond", "then", "else"]}> : (!irdl.region, !irdl.region, !irdl.region) -> () loc("<stdin>":25:7)
      %4 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":26:12)
      "irdl.operands"(%4) <{names = ["input"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":27:7)
    }) : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
