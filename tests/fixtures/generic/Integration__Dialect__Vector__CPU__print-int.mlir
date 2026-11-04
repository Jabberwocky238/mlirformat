"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "entry"}> ({
    %0 = "arith.constant"() <{value = dense<[true, false, true, false, true]> : vector<5xi1>}> : () -> vector<5xi1>
    "vector.print"(%0) <{punctuation = #vector.punctuation<newline>}> : (vector<5xi1>) -> ()
    %1 = "arith.constant"() <{value = dense<[true, false, true, false]> : vector<4xi1>}> : () -> vector<4xi1>
    %2 = "vector.bitcast"(%1) : (vector<4xi1>) -> vector<4xsi1>
    "vector.print"(%2) <{punctuation = #vector.punctuation<newline>}> : (vector<4xsi1>) -> ()
    %3 = "arith.constant"() <{value = dense<[true, false, false, true]> : vector<4xi1>}> : () -> vector<4xi1>
    %4 = "vector.bitcast"(%3) : (vector<4xi1>) -> vector<4xui1>
    "vector.print"(%4) <{punctuation = #vector.punctuation<newline>}> : (vector<4xui1>) -> ()
    %5 = "arith.constant"() <{value = dense<[-128, -127, -1, 0, 1, 127, -128, -2, -1]> : vector<9xi8>}> : () -> vector<9xi8>
    "vector.print"(%5) <{punctuation = #vector.punctuation<newline>}> : (vector<9xi8>) -> ()
    %6 = "arith.constant"() <{value = dense<[-128, -127, -1, 0, 1, 127]> : vector<6xi8>}> : () -> vector<6xi8>
    %7 = "vector.bitcast"(%6) : (vector<6xi8>) -> vector<6xsi8>
    "vector.print"(%7) <{punctuation = #vector.punctuation<newline>}> : (vector<6xsi8>) -> ()
    %8 = "arith.constant"() <{value = dense<[0, 1, 127, -128, -2, -1]> : vector<6xi8>}> : () -> vector<6xi8>
    %9 = "vector.bitcast"(%8) : (vector<6xi8>) -> vector<6xui8>
    "vector.print"(%9) <{punctuation = #vector.punctuation<newline>}> : (vector<6xui8>) -> ()
    %10 = "arith.constant"() <{value = dense<[-32768, -32767, -1, 0, 1, 32767, -32768, -2, -1]> : vector<9xi16>}> : () -> vector<9xi16>
    "vector.print"(%10) <{punctuation = #vector.punctuation<newline>}> : (vector<9xi16>) -> ()
    %11 = "arith.constant"() <{value = dense<[-32768, -32767, -1, 0, 1, 32767]> : vector<6xi16>}> : () -> vector<6xi16>
    %12 = "vector.bitcast"(%11) : (vector<6xi16>) -> vector<6xsi16>
    "vector.print"(%12) <{punctuation = #vector.punctuation<newline>}> : (vector<6xsi16>) -> ()
    %13 = "arith.constant"() <{value = dense<[0, 1, 32767, -32768, -2, -1]> : vector<6xi16>}> : () -> vector<6xi16>
    %14 = "vector.bitcast"(%13) : (vector<6xi16>) -> vector<6xui16>
    "vector.print"(%14) <{punctuation = #vector.punctuation<newline>}> : (vector<6xui16>) -> ()
    %15 = "arith.constant"() <{value = dense<[-2147483648, -2147483647, -1, 0, 1, 2147483647, -2147483648, -2, -1]> : vector<9xi32>}> : () -> vector<9xi32>
    "vector.print"(%15) <{punctuation = #vector.punctuation<newline>}> : (vector<9xi32>) -> ()
    %16 = "arith.constant"() <{value = dense<[-2147483648, -2147483647, -1, 0, 1, 2147483647]> : vector<6xi32>}> : () -> vector<6xi32>
    %17 = "vector.bitcast"(%16) : (vector<6xi32>) -> vector<6xsi32>
    "vector.print"(%17) <{punctuation = #vector.punctuation<newline>}> : (vector<6xsi32>) -> ()
    %18 = "arith.constant"() <{value = dense<[0, 1, 2147483647, -2147483648, -2, -1]> : vector<6xi32>}> : () -> vector<6xi32>
    %19 = "vector.bitcast"(%18) : (vector<6xi32>) -> vector<6xui32>
    "vector.print"(%19) <{punctuation = #vector.punctuation<newline>}> : (vector<6xui32>) -> ()
    %20 = "arith.constant"() <{value = dense<[-9223372036854775808, -9223372036854775807, -1, 0, 1, 9223372036854775807, -9223372036854775808, -2, -1]> : vector<9xi64>}> : () -> vector<9xi64>
    "vector.print"(%20) <{punctuation = #vector.punctuation<newline>}> : (vector<9xi64>) -> ()
    %21 = "arith.constant"() <{value = dense<[-9223372036854775808, -9223372036854775807, -1, 0, 1, 9223372036854775807]> : vector<6xi64>}> : () -> vector<6xi64>
    %22 = "vector.bitcast"(%21) : (vector<6xi64>) -> vector<6xsi64>
    "vector.print"(%22) <{punctuation = #vector.punctuation<newline>}> : (vector<6xsi64>) -> ()
    %23 = "arith.constant"() <{value = dense<[0, 1, 9223372036854775807, -9223372036854775808, -2, -1]> : vector<6xi64>}> : () -> vector<6xi64>
    %24 = "vector.bitcast"(%23) : (vector<6xi64>) -> vector<6xui64>
    "vector.print"(%24) <{punctuation = #vector.punctuation<newline>}> : (vector<6xui64>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

