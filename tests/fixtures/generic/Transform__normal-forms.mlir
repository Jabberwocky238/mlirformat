"builtin.module"() <{sym_name = "verification_count"}> ({
  "transform.payload"() <{normal_forms = [#transform.test_counting_normal_form]}> ({
    "transform.test_dummy_payload_op"() : () -> ()
  }) {test.counting_normal_form_count = 1 : i64} : () -> ()
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.structured.match"(%arg0) <{ops = ["transform.payload"]}> : (!transform.any_op) -> !transform.normalized_op<#transform.test_counting_normal_form>
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

