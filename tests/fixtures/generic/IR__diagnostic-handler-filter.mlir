#loc = loc("mysource1":0:0)
#loc1 = loc("mysource2":1:0)
#loc2 = loc("mysource3":2:0)
#loc3 = loc("foo"(#loc))
#loc4 = loc(callsite(#loc1 at #loc2))
#loc5 = loc(callsite(#loc3 at #loc4))
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test1", sym_visibility = "private"}> ({
  }) {test.loc = #loc5} : () -> ()
}) : () -> ()

// -----
#loc = loc("mysource1":0:0)
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test2", sym_visibility = "private"}> ({
  }) {test.loc = #loc} : () -> ()
}) : () -> ()

