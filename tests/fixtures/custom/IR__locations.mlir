#loc = loc("foo")
#loc1 = loc("mysource.cc":10:8)
#loc2 = loc("mysource.cc":10:0)
#loc3 = loc("mysource.cc":10:8 to :12)
#loc4 = loc("mysource.cc":10:8 to 12:4)
#loc5 = loc("foo_loc")
#loc6 = #test.custom_location<"foo.mlir" * 32>
#loc7 = loc("loc1":10:20)
#loc8 = loc("loc2":20:30)
#set = affine_set<(d0) : (1 == 0)>
#loc9 = loc(callsite(#loc at #loc1))
module {
  func.func @inline_notation() -> i32 {
    %0 = "foo"() : () -> i32
    %c4 = arith.constant 4 : index
    affine.for %arg0 = 0 to 8 {
    }
    affine.if #set(%c4) {
    }
    affine.if #set(%c4) {
    }
    return %0 : i32
  }
  func.func private @loc_attr(i1 {foo.loc_attr = #loc9})
  func.func private @filelocrange_attr1(i1 {foo.loc_attr = #loc2})
  func.func private @filelocrange_attr2(i1 {foo.loc_attr = #loc1})
  func.func private @filelocrange_attr3(i1 {foo.loc_attr = #loc3})
  func.func private @filelocrange_attr4(i1 {foo.loc_attr = #loc4})
  func.func @escape_strings() {
    "foo"() : () -> ()
    "foo"() : () -> ()
    "foo"() : () -> ()
    return
  }
  "foo.op"() : () -> ()
  func.func @argLocs(%arg0: i32, %arg1: i64) {
    return
  }
  "foo.unknown_op_with_bbargs"() ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = arith.addi %arg0, %arg1 : i32
    "foo.yield"(%0) : (i32) -> ()
  }) : () -> ()
  func.func @location_name_child_is_name() {
    return
  }
  func.func @optional_location_specifier() {
    test.attr_with_loc("foo")
    return
  }
  func.func @dialect_location() {
    test.attr_with_loc("dialectLoc")
    return
  }
  func.func @location_attr() {
    test.op_with_loc_attr #loc7 {foo.discardable_loc_attr = #loc8}
    return
  }
}

