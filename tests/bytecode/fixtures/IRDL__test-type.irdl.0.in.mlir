"builtin.module"() ({
  "irdl.dialect"() <{sym_name = "testd"}> ({
    "irdl.type"() <{sym_name = "singleton"}> ({
    ^bb0:
    }) : () -> () loc("<stdin>":3:5)
    "irdl.type"() <{sym_name = "parametrized"}> ({
      %1 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":7:12)
      %2 = "irdl.is"() <{expected = i32}> : () -> !irdl.attribute loc("<stdin>":8:12)
      %3 = "irdl.is"() <{expected = i64}> : () -> !irdl.attribute loc("<stdin>":9:12)
      %4 = "irdl.any_of"(%2, %3) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute loc("<stdin>":10:12)
      "irdl.parameters"(%1, %4) <{names = ["foo", "bar"]}> : (!irdl.attribute, !irdl.attribute) -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":6:5)
    "irdl.operation"() <{sym_name = "any"}> ({
      %0 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":14:12)
      "irdl.results"(%0) <{names = ["foo"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":15:7)
    }) : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
