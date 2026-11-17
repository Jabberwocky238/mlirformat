"builtin.module"() ({
  "func.func"() <{function_type = (vector<[4]xf16>, vector<[4]xf16>, vector<[4]xf16>, vector<[4]xf16>, vector<[4]xi1>, vector<[4]xi1>, vector<[4]xi1>, vector<[4]xi1>) -> vector<[4]x[4]xf32>, sym_name = "outerproduct_add_widening_2way_f16f16f32"}> ({
  ^bb0(%arg0: vector<[4]xf16> loc("<stdin>":3:8), %arg1: vector<[4]xf16> loc("<stdin>":3:32), %arg2: vector<[4]xf16> loc("<stdin>":3:56), %arg3: vector<[4]xf16> loc("<stdin>":3:80), %arg4: vector<[4]xi1> loc("<stdin>":3:104), %arg5: vector<[4]xi1> loc("<stdin>":3:127), %arg6: vector<[4]xi1> loc("<stdin>":3:150), %arg7: vector<[4]xi1> loc("<stdin>":3:173)):
    %0 = "arith.extf"(%arg0) : (vector<[4]xf16>) -> vector<[4]xf32> loc("<stdin>":4:10)
    %1 = "arith.extf"(%arg1) : (vector<[4]xf16>) -> vector<[4]xf32> loc("<stdin>":5:10)
    %2 = "arith.extf"(%arg2) : (vector<[4]xf16>) -> vector<[4]xf32> loc("<stdin>":6:10)
    %3 = "arith.extf"(%arg3) : (vector<[4]xf16>) -> vector<[4]xf32> loc("<stdin>":7:10)
    %4 = "arith.constant"() <{value = dense<0.000000e+00> : vector<[4]x[4]xf32>}> : () -> vector<[4]x[4]xf32> loc("<stdin>":8:10)
    %5 = "arm_sme.outerproduct"(%0, %1, %arg4, %arg5, %4) <{kind = #arm_sme.kind<add>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<[4]xf32>, vector<[4]xf32>, vector<[4]xi1>, vector<[4]xi1>, vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32> loc("<stdin>":9:10)
    %6 = "arm_sme.outerproduct"(%2, %3, %arg6, %arg7, %5) <{kind = #arm_sme.kind<add>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (vector<[4]xf32>, vector<[4]xf32>, vector<[4]xi1>, vector<[4]xi1>, vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32> loc("<stdin>":10:10)
    "func.return"(%6) : (vector<[4]x[4]xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
