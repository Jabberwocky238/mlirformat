"builtin.module"() ({
  "irdl.dialect"() <{sym_name = "cmath"}> ({
    "irdl.type"() <{sym_name = "complex"}> ({
      %6 = "irdl.is"() <{expected = f32}> : () -> !irdl.attribute loc("<stdin>":4:12)
      %7 = "irdl.is"() <{expected = f64}> : () -> !irdl.attribute loc("<stdin>":5:12)
      %8 = "irdl.any_of"(%6, %7) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute loc("<stdin>":6:12)
      "irdl.parameters"(%8) <{names = ["elem"]}> : (!irdl.attribute) -> () loc("<stdin>":7:7)
    }) : () -> () loc("<stdin>":3:5)
    "irdl.operation"() <{sym_name = "norm"}> ({
      %4 = "irdl.any"() : () -> !irdl.attribute loc("<stdin>":10:12)
      %5 = "irdl.parametric"(%4) <{base_type = @cmath::@complex}> : (!irdl.attribute) -> !irdl.attribute loc("<stdin>":11:12)
      "irdl.operands"(%5) <{names = ["complex"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":12:7)
      "irdl.results"(%4) <{names = ["norm"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":13:7)
    }) : () -> () loc("<stdin>":9:5)
    "irdl.operation"() <{sym_name = "mul"}> ({
      %0 = "irdl.is"() <{expected = f32}> : () -> !irdl.attribute loc("<stdin>":16:12)
      %1 = "irdl.is"() <{expected = f64}> : () -> !irdl.attribute loc("<stdin>":17:12)
      %2 = "irdl.any_of"(%0, %1) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute loc("<stdin>":18:12)
      %3 = "irdl.parametric"(%2) <{base_type = @cmath::@complex}> : (!irdl.attribute) -> !irdl.attribute loc("<stdin>":19:12)
      "irdl.operands"(%3, %3) <{names = ["lhs", "rhs"], variadicity = #irdl<variadicity_array[single, single]>}> : (!irdl.attribute, !irdl.attribute) -> () loc("<stdin>":20:7)
      "irdl.results"(%3) <{names = ["res"], variadicity = #irdl<variadicity_array[single]>}> : (!irdl.attribute) -> () loc("<stdin>":21:7)
    }) : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
