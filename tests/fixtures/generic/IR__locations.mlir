#loc = loc("foo")
#loc1 = loc("mysource.cc":10:8)
#loc2 = loc("mysource.cc":10:0)
#loc3 = loc("mysource.cc":10:8 to :12)
#loc4 = loc("mysource.cc":10:8 to 12:4)
#loc5 = loc("foo_loc")
#loc6 = #test.custom_location<"foo.mlir" * 32>
#loc7 = loc("loc2":20:30)
#loc8 = loc("loc1":10:20)
#map = affine_map<() -> (0)>
#map1 = affine_map<() -> (8)>
#set = affine_set<(d0) : (1 == 0)>
#loc9 = loc(callsite(#loc at #loc1))
"builtin.module"() ({
  "func.func"() <{function_type = () -> i32, sym_name = "inline_notation"}> ({
    %1 = "foo"() : () -> i32
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index
    "affine.for"() <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = #map1}> ({
    ^bb0(%arg5: index):
      "affine.yield"() : () -> ()
    }) : () -> ()
    "affine.if"(%2) <{condition = #set}> ({
      "affine.yield"() : () -> ()
    }, {
    }) : (index) -> ()
    "affine.if"(%2) <{condition = #set}> ({
      "affine.yield"() : () -> ()
    }, {
    }) : (index) -> ()
    "func.return"(%1) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{arg_attrs = [{foo.loc_attr = #loc9}], function_type = (i1) -> (), sym_name = "loc_attr", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{arg_attrs = [{foo.loc_attr = #loc2}], function_type = (i1) -> (), sym_name = "filelocrange_attr1", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{arg_attrs = [{foo.loc_attr = #loc1}], function_type = (i1) -> (), sym_name = "filelocrange_attr2", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{arg_attrs = [{foo.loc_attr = #loc3}], function_type = (i1) -> (), sym_name = "filelocrange_attr3", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{arg_attrs = [{foo.loc_attr = #loc4}], function_type = (i1) -> (), sym_name = "filelocrange_attr4", sym_visibility = "private"}> ({
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "escape_strings"}> ({
    "foo"() : () -> ()
    "foo"() : () -> ()
    "foo"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "foo.op"() : () -> ()
  "func.func"() <{function_type = (i32, i64) -> (), sym_name = "argLocs"}> ({
  ^bb0(%arg3: i32, %arg4: i64):
    "func.return"() : () -> ()
  }) : () -> ()
  "foo.unknown_op_with_bbargs"() ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32):
    %0 = "arith.addi"(%arg0, %arg1) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
    "foo.yield"(%0) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "location_name_child_is_name"}> ({
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "optional_location_specifier"}> ({
    "test.attr_with_loc"() <{loc = #loc5, value = "foo"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "dialect_location"}> ({
    "test.attr_with_loc"() <{loc = #loc6, value = "dialectLoc"}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "location_attr"}> ({
    "test.op_with_loc_attr"() <{loc_attr = #loc8}> {foo.discardable_loc_attr = #loc7} : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

