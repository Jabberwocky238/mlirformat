#set = affine_set<(d0) : (1 == 0)>
module {
  func.func @inline_notation() -> i32 {
    %0 = "foo"() : () -> i32
    %c4 = arith.constant 4 : index
    %c4_0 = arith.constant 4 : index
    affine.for %arg0 = 0 to 8 {
    }
    affine.if #set(%c4) {
    }
    "foo.op"() : () -> ()
    return %0 : i32
  }
}

