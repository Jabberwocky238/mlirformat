"builtin.module"() ({
  "irdl.dialect"() <{sym_name = "cmath"}> ({
    "irdl.type"() <{sym_name = "complex"}> ({
      %6 = "irdl.is"() <{expected = f32}> : () -> !irdl.attribute
      %7 = "irdl.is"() <{expected = f64}> : () -> !irdl.attribute
      %8 = "irdl.any_of"(%6, %7) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute
      "irdl.parameters"(%8) <{names = ["elem"]}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "norm"}> ({
      %4 = "irdl.any"() : () -> !irdl.attribute
      %5 = "irdl.parametric"(%4) <{base_type = @cmath::@complex}> : (!irdl.attribute) -> !irdl.attribute
      "irdl.operands"(%5) <{names = ["complex"], variadicity = #irdl<variadicity_array[ single]>}> : (!irdl.attribute) -> ()
      "irdl.results"(%4) <{names = ["norm"], variadicity = #irdl<variadicity_array[ single]>}> : (!irdl.attribute) -> ()
    }) : () -> ()
    "irdl.operation"() <{sym_name = "mul"}> ({
      %0 = "irdl.is"() <{expected = f32}> : () -> !irdl.attribute
      %1 = "irdl.is"() <{expected = f64}> : () -> !irdl.attribute
      %2 = "irdl.any_of"(%0, %1) : (!irdl.attribute, !irdl.attribute) -> !irdl.attribute
      %3 = "irdl.parametric"(%2) <{base_type = @cmath::@complex}> : (!irdl.attribute) -> !irdl.attribute
      "irdl.operands"(%3, %3) <{names = ["lhs", "rhs"], variadicity = #irdl<variadicity_array[ single,  single]>}> : (!irdl.attribute, !irdl.attribute) -> ()
      "irdl.results"(%3) <{names = ["res"], variadicity = #irdl<variadicity_array[ single]>}> : (!irdl.attribute) -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

