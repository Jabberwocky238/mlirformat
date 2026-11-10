module @verification_count attributes {transform.with_named_sequence} {
  transform.payload attributes {normal_forms = [#transform.test_counting_normal_form], test.counting_normal_form_count = 2 : i64} {
    transform.test_dummy_payload_op  : () -> ()
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
    %0 = transform.structured.match ops{["transform.payload"]} in %arg0 : (!transform.any_op) -> !transform.normalized_op<#transform.test_counting_normal_form>
    transform.yield 
  }
}

