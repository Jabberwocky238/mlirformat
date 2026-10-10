module {
  func.func @parse_i64_tensor() -> tensor<4xi64> {
    %cst = arith.constant dense<255> : tensor<4xi64>
    return %cst : tensor<4xi64>
  }
  func.func @parse_i32_tensor() -> tensor<8xi32> {
    %cst = arith.constant dense<255> : tensor<8xi32>
    return %cst : tensor<8xi32>
  }
  func.func @parse_i16_tensor() -> tensor<16xi16> {
    %cst = arith.constant dense<255> : tensor<16xi16>
    return %cst : tensor<16xi16>
  }
  func.func @parse_i8_tensor() -> tensor<32xi8> {
    %cst = arith.constant dense<15> : tensor<32xi8>
    return %cst : tensor<32xi8>
  }
  func.func @parse_i4_tensor() -> tensor<32xi4> {
    %cst = arith.constant dense<-1> : tensor<32xi4>
    return %cst : tensor<32xi4>
  }
  func.func @parse_i1_tensor() -> tensor<256xi1> {
    %cst = arith.constant dense<"0x0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F"> : tensor<256xi1>
    return %cst : tensor<256xi1>
  }
}

