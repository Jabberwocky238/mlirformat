"builtin.module"() ({
  "pdl.pattern"() <{benefit = 1 : i16}> ({
    %0 = "pdl.attribute"() : () -> !pdl.attribute loc("<stdin>":3:10)
    %1 = "pdl.types"() : () -> !pdl.range<type> loc("<stdin>":4:10)
    %2 = "pdl.operation"(%0, %1) <{attributeValueNames = ["shift"], opName = "tosa.mul", operandSegmentSizes = array<i32: 0, 1, 1>}> : (!pdl.attribute, !pdl.range<type>) -> !pdl.operation loc("<stdin>":5:10)
    %3 = "pdl.attribute"() <{value = 0 : i32}> : () -> !pdl.attribute loc("<stdin>":6:10)
    %4 = "pdl.attribute"() <{value = 1 : i32}> : () -> !pdl.attribute loc("<stdin>":7:10)
    %5 = "pdl.apply_native_constraint"(%3, %4) <{isNegated = false, name = "return_attr_constraint"}> : (!pdl.attribute, !pdl.attribute) -> !pdl.attribute loc("<stdin>":8:10)
    "pdl.apply_native_constraint"(%0, %5) <{isNegated = false, name = "use_attr_constraint"}> : (!pdl.attribute, !pdl.attribute) -> () loc("<stdin>":9:5)
    "pdl.rewrite"(%2) <{name = "rewriter", operandSegmentSizes = array<i32: 1, 0>}> ({
    }) : (!pdl.operation) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
