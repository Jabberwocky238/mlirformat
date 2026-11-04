"builtin.module"() ({
  "func.func"() <{function_type = (vector<f32>) -> (), sym_name = "extract_element_0d"}> ({
  ^bb0(%arg13: vector<f32>):
    %37 = "vector.extract"(%arg13) <{static_position = array<i64>}> : (vector<f32>) -> f32
    "vector.print"(%37) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<f32>) -> vector<f32>, sym_name = "insert_element_0d"}> ({
  ^bb0(%arg11: f32, %arg12: vector<f32>):
    %36 = "vector.insert"(%arg11, %arg12) <{static_position = array<i64>}> : (f32, vector<f32>) -> vector<f32>
    "func.return"(%36) : (vector<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<f32>) -> (), sym_name = "print_vector_0d"}> ({
  ^bb0(%arg10: vector<f32>):
    "vector.print"(%arg10) <{punctuation = #vector.punctuation<newline>}> : (vector<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> (), sym_name = "broadcast_0d"}> ({
  ^bb0(%arg9: f32):
    %30 = "vector.broadcast"(%arg9) : (f32) -> vector<f32>
    "vector.print"(%30) <{punctuation = #vector.punctuation<newline>}> : (vector<f32>) -> ()
    %31 = "vector.broadcast"(%30) : (vector<f32>) -> vector<f32>
    "vector.print"(%31) <{punctuation = #vector.punctuation<newline>}> : (vector<f32>) -> ()
    %32 = "vector.broadcast"(%30) : (vector<f32>) -> vector<1xf32>
    "vector.print"(%32) <{punctuation = #vector.punctuation<newline>}> : (vector<1xf32>) -> ()
    %33 = "vector.broadcast"(%30) : (vector<f32>) -> vector<2xf32>
    "vector.print"(%33) <{punctuation = #vector.punctuation<newline>}> : (vector<2xf32>) -> ()
    %34 = "vector.broadcast"(%30) : (vector<f32>) -> vector<2x1xf32>
    "vector.print"(%34) <{punctuation = #vector.punctuation<newline>}> : (vector<2x1xf32>) -> ()
    %35 = "vector.broadcast"(%30) : (vector<f32>) -> vector<2x3xf32>
    "vector.print"(%35) <{punctuation = #vector.punctuation<newline>}> : (vector<2x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "bitcast_0d"}> ({
    %24 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %25 = "arith.constant"() <{value = dense<0> : vector<i32>}> : () -> vector<i32>
    %26 = "vector.insert"(%24, %25) <{static_position = array<i64>}> : (i32, vector<i32>) -> vector<i32>
    %27 = "vector.bitcast"(%26) : (vector<i32>) -> vector<f32>
    %28 = "vector.extract"(%27) <{static_position = array<i64>}> : (vector<f32>) -> f32
    %29 = "arith.bitcast"(%28) : (f32) -> i32
    "vector.print"(%29) <{punctuation = #vector.punctuation<newline>}> : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "constant_mask_0d"}> ({
    %22 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 0>}> : () -> vector<i1>
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<i1>) -> ()
    %23 = "vector.constant_mask"() <{mask_dim_sizes = array<i64: 1>}> : () -> vector<i1>
    "vector.print"(%23) <{punctuation = #vector.punctuation<newline>}> : (vector<i1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<i32>, vector<i32>) -> (), sym_name = "arith_cmpi_0d"}> ({
  ^bb0(%arg7: vector<i32>, %arg8: vector<i32>):
    %19 = "arith.cmpi"(%arg7, %arg8) <{predicate = 6 : i64}> : (vector<i32>, vector<i32>) -> vector<i1>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<i1>) -> ()
    %20 = "arith.cmpi"(%arg7, %arg8) <{predicate = 8 : i64}> : (vector<i32>, vector<i32>) -> vector<i1>
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<i1>) -> ()
    %21 = "arith.cmpi"(%arg7, %arg8) <{predicate = 0 : i64}> : (vector<i32>, vector<i32>) -> vector<i1>
    "vector.print"(%21) <{punctuation = #vector.punctuation<newline>}> : (vector<i1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index) -> (), sym_name = "create_mask_0d"}> ({
  ^bb0(%arg5: index, %arg6: index):
    %17 = "vector.create_mask"(%arg5) : (index) -> vector<i1>
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (vector<i1>) -> ()
    %18 = "vector.create_mask"(%arg6) : (index) -> vector<i1>
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (vector<i1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<f32>) -> (), sym_name = "reduce_add"}> ({
  ^bb0(%arg4: vector<f32>):
    %16 = "vector.reduction"(%arg4) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<f32>) -> f32
    "vector.print"(%16) <{punctuation = #vector.punctuation<newline>}> : (f32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<f32>) -> (), sym_name = "fma_0d"}> ({
  ^bb0(%arg3: vector<f32>):
    %15 = "vector.fma"(%arg3, %arg3, %arg3) : (vector<f32>, vector<f32>, vector<f32>) -> vector<f32>
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<i32>) -> (), sym_name = "transpose_0d"}> ({
  ^bb0(%arg2: vector<i32>):
    %14 = "vector.transpose"(%arg2) <{permutation = array<i64>}> : (vector<i32>) -> vector<i32>
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (vector<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<i32>, vector<i32>) -> (), sym_name = "shuffle_0d"}> ({
  ^bb0(%arg0: vector<i32>, %arg1: vector<i32>):
    %13 = "vector.shuffle"(%arg0, %arg1) <{mask = array<i64: 0, 1, 0>}> : (vector<i32>, vector<i32>) -> vector<3xi32>
    "vector.print"(%13) <{punctuation = #vector.punctuation<newline>}> : (vector<3xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = dense<0.000000e+00> : vector<f32>}> : () -> vector<f32>
    %2 = "func.call"(%0, %1) <{callee = @insert_element_0d}> : (f32, vector<f32>) -> vector<f32>
    "func.call"(%2) <{callee = @extract_element_0d}> : (vector<f32>) -> ()
    %3 = "arith.constant"() <{value = dense<4.200000e+01> : vector<f32>}> : () -> vector<f32>
    "func.call"(%3) <{callee = @print_vector_0d}> : (vector<f32>) -> ()
    %4 = "arith.constant"() <{value = 4.200000e+01 : f32}> : () -> f32
    "func.call"(%4) <{callee = @broadcast_0d}> : (f32) -> ()
    "func.call"() <{callee = @bitcast_0d}> : () -> ()
    "func.call"() <{callee = @constant_mask_0d}> : () -> ()
    %5 = "arith.constant"() <{value = dense<42> : vector<i32>}> : () -> vector<i32>
    %6 = "arith.constant"() <{value = dense<4242> : vector<i32>}> : () -> vector<i32>
    "func.call"(%5, %6) <{callee = @arith_cmpi_0d}> : (vector<i32>, vector<i32>) -> ()
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "arith.constant"() <{value = 1 : index}> : () -> index
    "func.call"(%7, %8) <{callee = @create_mask_0d}> : (index, index) -> ()
    %9 = "arith.constant"() <{value = dense<5.000000e+00> : vector<f32>}> : () -> vector<f32>
    "func.call"(%9) <{callee = @reduce_add}> : (vector<f32>) -> ()
    %10 = "arith.constant"() <{value = dense<4.000000e+00> : vector<f32>}> : () -> vector<f32>
    "func.call"(%10) <{callee = @fma_0d}> : (vector<f32>) -> ()
    %11 = "arith.constant"() <{value = dense<42> : vector<i32>}> : () -> vector<i32>
    %12 = "arith.constant"() <{value = dense<43> : vector<i32>}> : () -> vector<i32>
    "func.call"(%11) <{callee = @transpose_0d}> : (vector<i32>) -> ()
    "func.call"(%11, %12) <{callee = @shuffle_0d}> : (vector<i32>, vector<i32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

