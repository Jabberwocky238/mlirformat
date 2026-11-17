"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "clone_unregistered_with_attrs"}> ({
    "unregistered.foo"() <{bar = 1 : i64, flag = true, name = "test", value = 3.140000e+00 : f32}> : () -> () loc("<stdin>":4:5)
    "unregistered.bar"() : () -> () loc("<stdin>":5:5)
    "unregistered.empty_dict"() <{}> : () -> () loc("<stdin>":6:5)
    "unregistered.complex"() <{array = [1, 2, 3], dict = {key1 = 42 : i32, key2 = "value"}, nested = {inner = {deep = 100 : i64}}}> : () -> () loc("<stdin>":7:5)
    "func.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
