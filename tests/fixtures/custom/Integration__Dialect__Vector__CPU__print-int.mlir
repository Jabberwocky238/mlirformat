module {
  func.func @entry() {
    %cst = arith.constant dense<[true, false, true, false, true]> : vector<5xi1>
    vector.print %cst : vector<5xi1>
    %cst_0 = arith.constant dense<[true, false, true, false]> : vector<4xi1>
    %0 = vector.bitcast %cst_0 : vector<4xi1> to vector<4xsi1>
    vector.print %0 : vector<4xsi1>
    %cst_1 = arith.constant dense<[true, false, false, true]> : vector<4xi1>
    %1 = vector.bitcast %cst_1 : vector<4xi1> to vector<4xui1>
    vector.print %1 : vector<4xui1>
    %cst_2 = arith.constant dense<[-128, -127, -1, 0, 1, 127, -128, -2, -1]> : vector<9xi8>
    vector.print %cst_2 : vector<9xi8>
    %cst_3 = arith.constant dense<[-128, -127, -1, 0, 1, 127]> : vector<6xi8>
    %2 = vector.bitcast %cst_3 : vector<6xi8> to vector<6xsi8>
    vector.print %2 : vector<6xsi8>
    %cst_4 = arith.constant dense<[0, 1, 127, -128, -2, -1]> : vector<6xi8>
    %3 = vector.bitcast %cst_4 : vector<6xi8> to vector<6xui8>
    vector.print %3 : vector<6xui8>
    %cst_5 = arith.constant dense<[-32768, -32767, -1, 0, 1, 32767, -32768, -2, -1]> : vector<9xi16>
    vector.print %cst_5 : vector<9xi16>
    %cst_6 = arith.constant dense<[-32768, -32767, -1, 0, 1, 32767]> : vector<6xi16>
    %4 = vector.bitcast %cst_6 : vector<6xi16> to vector<6xsi16>
    vector.print %4 : vector<6xsi16>
    %cst_7 = arith.constant dense<[0, 1, 32767, -32768, -2, -1]> : vector<6xi16>
    %5 = vector.bitcast %cst_7 : vector<6xi16> to vector<6xui16>
    vector.print %5 : vector<6xui16>
    %cst_8 = arith.constant dense<[-2147483648, -2147483647, -1, 0, 1, 2147483647, -2147483648, -2, -1]> : vector<9xi32>
    vector.print %cst_8 : vector<9xi32>
    %cst_9 = arith.constant dense<[-2147483648, -2147483647, -1, 0, 1, 2147483647]> : vector<6xi32>
    %6 = vector.bitcast %cst_9 : vector<6xi32> to vector<6xsi32>
    vector.print %6 : vector<6xsi32>
    %cst_10 = arith.constant dense<[0, 1, 2147483647, -2147483648, -2, -1]> : vector<6xi32>
    %7 = vector.bitcast %cst_10 : vector<6xi32> to vector<6xui32>
    vector.print %7 : vector<6xui32>
    %cst_11 = arith.constant dense<[-9223372036854775808, -9223372036854775807, -1, 0, 1, 9223372036854775807, -9223372036854775808, -2, -1]> : vector<9xi64>
    vector.print %cst_11 : vector<9xi64>
    %cst_12 = arith.constant dense<[-9223372036854775808, -9223372036854775807, -1, 0, 1, 9223372036854775807]> : vector<6xi64>
    %8 = vector.bitcast %cst_12 : vector<6xi64> to vector<6xsi64>
    vector.print %8 : vector<6xsi64>
    %cst_13 = arith.constant dense<[0, 1, 9223372036854775807, -9223372036854775808, -2, -1]> : vector<6xi64>
    %9 = vector.bitcast %cst_13 : vector<6xi64> to vector<6xui64>
    vector.print %9 : vector<6xui64>
    return
  }
}

