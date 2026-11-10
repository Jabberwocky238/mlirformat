"builtin.module"() ({
  "irdl.dialect"() <{sym_name = "test_irdl_to_cpp"}> ({
    "irdl.type"() <{sym_name = "foo"}> ({
    ^bb0:
    }) : () -> ()
    "irdl.operation"() <{sym_name = "bar"}> ({
      %7 = "irdl.any"() : () -> !irdl.attribute
      "irdl.results"(%7) <{names = ["res"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "beef"}> ({
      %6 = "irdl.any"() : () -> !irdl.attribute
      "irdl.operands"(%6, %6) <{names = ["lhs", "rhs"], variadicity = #irdl<variadicity_array[single, single]>}> : (!irdl.attribute, !irdl.attribute) -> ()
      "irdl.results"(%6) <{names = ["res"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "hash"}> ({
      %5 = "irdl.any"() : () -> !irdl.attribute
      "irdl.operands"(%5, %5) <{names = ["lhs", "rhs"], variadicity = #irdl<variadicity_array[single, single]>}> : (!irdl.attribute, !irdl.attribute) -> ()
      "irdl.results"(%5) <{names = ["res"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "conditional"}> ({
      %0 = "irdl.region"() : () -> !irdl.region
      %1 = "irdl.region"() <{constrainedArguments}> : () -> !irdl.region
      %2 = "irdl.any"() : () -> !irdl.attribute
      %3 = "irdl.region"(%2) <{constrainedArguments}> : (!irdl.attribute) -> !irdl.region
      "irdl.regions"(%3, %0, %1) <{names = ["cond", "then", "else"]}> : (!irdl.region, !irdl.region, !irdl.region) -> ()
      %4 = "irdl.any"() : () -> !irdl.attribute
      "irdl.operands"(%4) <{names = ["input"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

