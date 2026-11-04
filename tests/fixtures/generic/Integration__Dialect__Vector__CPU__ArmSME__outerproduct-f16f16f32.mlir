"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %38 = "arith.constant"() <{value = 128 : i32}> : () -> i32
    "func.call"(%38) <{callee = @setArmSVLBits}> : (i32) -> ()
    "func.call"() <{callee = @test_outerproduct_f16f16f32}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_outerproduct_f16f16f32"}> ({
    %22 = "llvm.mlir.undef"() : () -> vector<[4]xf16>
    %23 = "arith.constant"() <{value = dense<[0.000000e+00, 2.000000e+00, 4.000000e+00, 6.000000e+00]> : vector<4xf16>}> : () -> vector<4xf16>
    %24 = "arith.constant"() <{value = dense<[1.000000e+00, 3.000000e+00, 5.000000e+00, 7.000000e+00]> : vector<4xf16>}> : () -> vector<4xf16>
    %25 = "arith.constant"() <{value = dense<[8.000000e+00, 1.000000e+01, 1.200000e+01, 1.400000e+01]> : vector<4xf16>}> : () -> vector<4xf16>
    %26 = "arith.constant"() <{value = dense<[9.000000e+00, 1.100000e+01, 1.300000e+01, 1.500000e+01]> : vector<4xf16>}> : () -> vector<4xf16>
    %27 = "vector.scalable.insert"(%23, %22) <{pos = 0 : i64}> : (vector<4xf16>, vector<[4]xf16>) -> vector<[4]xf16>
    %28 = "vector.scalable.insert"(%24, %22) <{pos = 0 : i64}> : (vector<4xf16>, vector<[4]xf16>) -> vector<[4]xf16>
    %29 = "vector.scalable.insert"(%25, %22) <{pos = 0 : i64}> : (vector<4xf16>, vector<[4]xf16>) -> vector<[4]xf16>
    %30 = "vector.scalable.insert"(%26, %22) <{pos = 0 : i64}> : (vector<4xf16>, vector<[4]xf16>) -> vector<[4]xf16>
    %31 = "arith.extf"(%27) : (vector<[4]xf16>) -> vector<[4]xf32>
    %32 = "arith.extf"(%28) : (vector<[4]xf16>) -> vector<[4]xf32>
    %33 = "arith.extf"(%29) : (vector<[4]xf16>) -> vector<[4]xf32>
    %34 = "arith.extf"(%30) : (vector<[4]xf16>) -> vector<[4]xf32>
    %35 = "arith.constant"() <{value = dense<7.000000e+00> : vector<[4]x[4]xf32>}> : () -> vector<[4]x[4]xf32>
    %36 = "vector.outerproduct"(%31, %32, %35) <{kind = #vector.kind<add>}> : (vector<[4]xf32>, vector<[4]xf32>, vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32>
    %37 = "vector.outerproduct"(%33, %34, %36) <{kind = #vector.kind<add>}> : (vector<[4]xf32>, vector<[4]xf32>, vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32>
    "vector.print"(%37) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "test_masked_outerproduct_f16f16f32"}> ({
    %0 = "llvm.mlir.undef"() : () -> vector<[4]xf16>
    %1 = "arith.constant"() <{value = dense<[0.000000e+00, 2.000000e+00, 4.000000e+00, 6.000000e+00]> : vector<4xf16>}> : () -> vector<4xf16>
    %2 = "arith.constant"() <{value = dense<[1.000000e+00, 3.000000e+00, 5.000000e+00, 7.000000e+00]> : vector<4xf16>}> : () -> vector<4xf16>
    %3 = "arith.constant"() <{value = dense<[8.000000e+00, 1.000000e+01, 1.200000e+01, 1.400000e+01]> : vector<4xf16>}> : () -> vector<4xf16>
    %4 = "arith.constant"() <{value = dense<[9.000000e+00, 1.100000e+01, 1.300000e+01, 1.500000e+01]> : vector<4xf16>}> : () -> vector<4xf16>
    %5 = "vector.scalable.insert"(%1, %0) <{pos = 0 : i64}> : (vector<4xf16>, vector<[4]xf16>) -> vector<[4]xf16>
    %6 = "vector.scalable.insert"(%2, %0) <{pos = 0 : i64}> : (vector<4xf16>, vector<[4]xf16>) -> vector<[4]xf16>
    %7 = "vector.scalable.insert"(%3, %0) <{pos = 0 : i64}> : (vector<4xf16>, vector<[4]xf16>) -> vector<[4]xf16>
    %8 = "vector.scalable.insert"(%4, %0) <{pos = 0 : i64}> : (vector<4xf16>, vector<[4]xf16>) -> vector<[4]xf16>
    %9 = "arith.extf"(%5) : (vector<[4]xf16>) -> vector<[4]xf32>
    %10 = "arith.extf"(%6) : (vector<[4]xf16>) -> vector<[4]xf32>
    %11 = "arith.extf"(%7) : (vector<[4]xf16>) -> vector<[4]xf32>
    %12 = "arith.extf"(%8) : (vector<[4]xf16>) -> vector<[4]xf32>
    %13 = "arith.constant"() <{value = dense<7.000000e+00> : vector<[4]x[4]xf32>}> : () -> vector<[4]x[4]xf32>
    %14 = "arith.constant"() <{value = 2 : index}> : () -> index
    %15 = "arith.constant"() <{value = 3 : index}> : () -> index
    %16 = "vector.create_mask"(%14, %15) : (index, index) -> vector<[4]x[4]xi1>
    %17 = "vector.create_mask"(%15, %14) : (index, index) -> vector<[4]x[4]xi1>
    %18 = "vector.mask"(%16) ({
      %21 = "vector.outerproduct"(%9, %10, %13) <{kind = #vector.kind<add>}> : (vector<[4]xf32>, vector<[4]xf32>, vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32>
      "vector.yield"(%21) : (vector<[4]x[4]xf32>) -> ()
    }) : (vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32>
    %19 = "vector.mask"(%17) ({
      %20 = "vector.outerproduct"(%11, %12, %18) <{kind = #vector.kind<add>}> : (vector<[4]xf32>, vector<[4]xf32>, vector<[4]x[4]xf32>) -> vector<[4]x[4]xf32>
      "vector.yield"(%20) : (vector<[4]x[4]xf32>) -> ()
    }) : (vector<[4]x[4]xi1>) -> vector<[4]x[4]xf32>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<[4]x[4]xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "setArmSVLBits", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

