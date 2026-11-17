"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "bar"}> ({
    "another_op"() : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":7:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":8:12)
      %1 = "transform.structured.replace"(%0) ({
        "builtin.module"() ({
          "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
            "dummy_op"() : () -> () loc("<stdin>":12:13)
          }) : () -> () loc("<stdin>":11:11)
        }) : () -> () loc("<stdin>":10:9)
      }) : (!transform.any_op) -> !transform.any_op loc("<stdin>":9:12)
      "transform.yield"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":6:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":1:1)
