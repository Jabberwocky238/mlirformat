module {
  func.func @test_ops_verify(%arg0: i32) -> f32 {
    %0 = "test.constant"() <{value = 5.300000e+00 : f32}> : () -> f32
    %1 = test.loop_block %arg0 : (i32) -> f32 {
    ^bb0(%arg1: i32):
      test.loop_block_term iter %arg0 exit %0
    }
    return %1 : f32
  }
}

// -----
module {
  func.func @test_no_terminator(%arg0: index) {
    test.switch_with_no_break %arg0 
    case 0 {
    }
    case 1 {
    }
    return
  }
}

