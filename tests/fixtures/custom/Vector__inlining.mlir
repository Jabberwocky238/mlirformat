module {
  func.func @inner_func_inlinable(%arg0: f32) -> vector<4xf32> {
    %0 = vector.broadcast %arg0 : f32 to vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @test_inline(%arg0: f32) -> vector<4xf32> {
    %0 = call @inner_func_inlinable(%arg0) : (f32) -> vector<4xf32>
    return %0 : vector<4xf32>
  }
}

