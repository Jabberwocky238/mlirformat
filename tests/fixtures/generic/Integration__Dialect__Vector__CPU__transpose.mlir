"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "arith.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
    %3 = "arith.constant"() <{value = 3.000000e+00 : f32}> : () -> f32
    %4 = "arith.constant"() <{value = 4.000000e+00 : f32}> : () -> f32
    %5 = "arith.constant"() <{value = 5.000000e+00 : f32}> : () -> f32
    %6 = "arith.constant"() <{value = 6.000000e+00 : f32}> : () -> f32
    %7 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32
    %8 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %9 = "vector.broadcast"(%1) : (f32) -> vector<2xf32>
    %10 = "vector.insert"(%2, %9) <{static_position = array<i64: 1>}> : (f32, vector<2xf32>) -> vector<2xf32>
    %11 = "vector.broadcast"(%3) : (f32) -> vector<2xf32>
    %12 = "vector.insert"(%4, %11) <{static_position = array<i64: 1>}> : (f32, vector<2xf32>) -> vector<2xf32>
    %13 = "vector.broadcast"(%5) : (f32) -> vector<2xf32>
    %14 = "vector.insert"(%6, %13) <{static_position = array<i64: 1>}> : (f32, vector<2xf32>) -> vector<2xf32>
    %15 = "vector.broadcast"(%7) : (f32) -> vector<2xf32>
    %16 = "vector.insert"(%8, %15) <{static_position = array<i64: 1>}> : (f32, vector<2xf32>) -> vector<2xf32>
    %17 = "vector.broadcast"(%0) : (f32) -> vector<2x2xf32>
    %18 = "vector.insert"(%10, %17) <{static_position = array<i64: 0>}> : (vector<2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    %19 = "vector.insert"(%12, %18) <{static_position = array<i64: 1>}> : (vector<2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    %20 = "vector.broadcast"(%0) : (f32) -> vector<2x2xf32>
    %21 = "vector.insert"(%14, %20) <{static_position = array<i64: 0>}> : (vector<2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    %22 = "vector.insert"(%16, %21) <{static_position = array<i64: 1>}> : (vector<2xf32>, vector<2x2xf32>) -> vector<2x2xf32>
    %23 = "vector.broadcast"(%0) : (f32) -> vector<3x2xf32>
    %24 = "vector.insert"(%10, %23) <{static_position = array<i64: 0>}> : (vector<2xf32>, vector<3x2xf32>) -> vector<3x2xf32>
    %25 = "vector.insert"(%12, %24) <{static_position = array<i64: 1>}> : (vector<2xf32>, vector<3x2xf32>) -> vector<3x2xf32>
    %26 = "vector.insert"(%14, %25) <{static_position = array<i64: 2>}> : (vector<2xf32>, vector<3x2xf32>) -> vector<3x2xf32>
    %27 = "arith.constant"() <{value = dense<0.000000e+00> : vector<2x4xf32>}> : () -> vector<2x4xf32>
    %28 = "vector.insert_strided_slice"(%19, %27) <{offsets = [0, 0], strides = [1, 1]}> : (vector<2x2xf32>, vector<2x4xf32>) -> vector<2x4xf32>
    %29 = "vector.insert_strided_slice"(%22, %28) <{offsets = [0, 2], strides = [1, 1]}> : (vector<2x2xf32>, vector<2x4xf32>) -> vector<2x4xf32>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    "vector.print"(%26) <{punctuation = #vector.punctuation<newline>}> : (vector<3x2xf32>) -> ()
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (vector<2x4xf32>) -> ()
    %30 = "vector.transpose"(%19) <{permutation = array<i64: 1, 0>}> : (vector<2x2xf32>) -> vector<2x2xf32>
    %31 = "vector.transpose"(%22) <{permutation = array<i64: 1, 0>}> : (vector<2x2xf32>) -> vector<2x2xf32>
    %32 = "vector.transpose"(%26) <{permutation = array<i64: 1, 0>}> : (vector<3x2xf32>) -> vector<2x3xf32>
    %33 = "vector.transpose"(%29) <{permutation = array<i64: 1, 0>}> : (vector<2x4xf32>) -> vector<4x2xf32>
    "vector.print"(%30) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    "vector.print"(%31) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2xf32>) -> ()
    "vector.print"(%32) <{punctuation = #vector.punctuation<newline>}> : (vector<2x3xf32>) -> ()
    "vector.print"(%33) <{punctuation = #vector.punctuation<newline>}> : (vector<4x2xf32>) -> ()
    %34 = "vector.transpose"(%29) <{permutation = array<i64: 0, 1>}> : (vector<2x4xf32>) -> vector<2x4xf32>
    %35 = "vector.transpose"(%33) <{permutation = array<i64: 1, 0>}> : (vector<4x2xf32>) -> vector<2x4xf32>
    "vector.print"(%34) <{punctuation = #vector.punctuation<newline>}> : (vector<2x4xf32>) -> ()
    "vector.print"(%35) <{punctuation = #vector.punctuation<newline>}> : (vector<2x4xf32>) -> ()
    %36 = "vector.broadcast"(%1) : (f32) -> vector<2x2x2xf32>
    %37 = "vector.insert"(%2, %36) <{static_position = array<i64: 0, 0, 1>}> : (f32, vector<2x2x2xf32>) -> vector<2x2x2xf32>
    %38 = "vector.insert"(%3, %37) <{static_position = array<i64: 0, 1, 0>}> : (f32, vector<2x2x2xf32>) -> vector<2x2x2xf32>
    %39 = "vector.insert"(%4, %38) <{static_position = array<i64: 0, 1, 1>}> : (f32, vector<2x2x2xf32>) -> vector<2x2x2xf32>
    %40 = "vector.insert"(%5, %39) <{static_position = array<i64: 1, 0, 0>}> : (f32, vector<2x2x2xf32>) -> vector<2x2x2xf32>
    %41 = "vector.insert"(%6, %40) <{static_position = array<i64: 1, 0, 1>}> : (f32, vector<2x2x2xf32>) -> vector<2x2x2xf32>
    %42 = "vector.insert"(%7, %41) <{static_position = array<i64: 1, 1, 0>}> : (f32, vector<2x2x2xf32>) -> vector<2x2x2xf32>
    %43 = "vector.insert"(%8, %42) <{static_position = array<i64: 1, 1, 1>}> : (f32, vector<2x2x2xf32>) -> vector<2x2x2xf32>
    "vector.print"(%43) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2x2xf32>) -> ()
    %44 = "vector.transpose"(%43) <{permutation = array<i64: 0, 1, 2>}> : (vector<2x2x2xf32>) -> vector<2x2x2xf32>
    %45 = "vector.transpose"(%43) <{permutation = array<i64: 0, 2, 1>}> : (vector<2x2x2xf32>) -> vector<2x2x2xf32>
    %46 = "vector.transpose"(%43) <{permutation = array<i64: 1, 0, 2>}> : (vector<2x2x2xf32>) -> vector<2x2x2xf32>
    %47 = "vector.transpose"(%43) <{permutation = array<i64: 2, 0, 1>}> : (vector<2x2x2xf32>) -> vector<2x2x2xf32>
    %48 = "vector.transpose"(%43) <{permutation = array<i64: 1, 2, 0>}> : (vector<2x2x2xf32>) -> vector<2x2x2xf32>
    %49 = "vector.transpose"(%43) <{permutation = array<i64: 2, 1, 0>}> : (vector<2x2x2xf32>) -> vector<2x2x2xf32>
    "vector.print"(%44) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2x2xf32>) -> ()
    "vector.print"(%45) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2x2xf32>) -> ()
    "vector.print"(%46) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2x2xf32>) -> ()
    "vector.print"(%47) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2x2xf32>) -> ()
    "vector.print"(%48) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2x2xf32>) -> ()
    "vector.print"(%49) <{punctuation = #vector.punctuation<newline>}> : (vector<2x2x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

