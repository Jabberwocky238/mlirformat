"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "bar"}> ({
    "another_op"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.replace"(%0) ({
        "builtin.module"() ({
          "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
            "dummy_op"() : () -> ()
          }) : () -> ()
        }) : () -> ()
      }) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

