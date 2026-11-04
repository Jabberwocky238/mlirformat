module {
  func.func @inner_dcast_inlinable(%arg0: !quant.uniform<i8:f32, 2.000000e+00:10>) -> f32 {
    %0 = quant.dcast %arg0 : !quant.uniform<i8:f32, 2.000000e+00:10> to f32
    return %0 : f32
  }
  func.func @test_inline_dcast(%arg0: !quant.uniform<i8:f32, 2.000000e+00:10>) -> f32 {
    %0 = call @inner_dcast_inlinable(%arg0) : (!quant.uniform<i8:f32, 2.000000e+00:10>) -> f32
    return %0 : f32
  }
  func.func @inner_qcast_inlinable(%arg0: f32) -> !quant.uniform<i8:f32, 2.000000e+00:10> {
    %0 = quant.qcast %arg0 : f32 to !quant.uniform<i8:f32, 2.000000e+00:10>
    return %0 : !quant.uniform<i8:f32, 2.000000e+00:10>
  }
  func.func @test_inline_qcast(%arg0: f32) -> !quant.uniform<i8:f32, 2.000000e+00:10> {
    %0 = call @inner_qcast_inlinable(%arg0) : (f32) -> !quant.uniform<i8:f32, 2.000000e+00:10>
    return %0 : !quant.uniform<i8:f32, 2.000000e+00:10>
  }
  func.func @inner_scast_inlinable(%arg0: i8) -> !quant.uniform<i8:f32, 2.000000e+00:10> {
    %0 = quant.scast %arg0 : i8 to !quant.uniform<i8:f32, 2.000000e+00:10>
    return %0 : !quant.uniform<i8:f32, 2.000000e+00:10>
  }
  func.func @test_inline_scast(%arg0: i8) -> !quant.uniform<i8:f32, 2.000000e+00:10> {
    %0 = call @inner_scast_inlinable(%arg0) : (i8) -> !quant.uniform<i8:f32, 2.000000e+00:10>
    return %0 : !quant.uniform<i8:f32, 2.000000e+00:10>
  }
}

