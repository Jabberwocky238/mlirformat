#set = affine_set<(d0) : (1 == 0)>
module {
  func.func @inline_notation() -> i32 {
    %0 = "foo"() : () -> i32
    affine.for %arg0 = 0 to 8 {
    }
    %c4 = arith.constant 4 : index
    affine.if #set(%c4) {
    }
    "foo.region"() ({
    ^bb0(%arg0: i32, %arg1: i32):
      %1 = arith.addi %arg0, %arg0 : i32
      "foo.yield"(%1) : (i32) -> ()
    }) : () -> ()
    return %0 : i32
  }
}

