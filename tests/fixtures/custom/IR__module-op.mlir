module {
}

// -----
module attributes {foo.attr = true} {
}

// -----
module {
  %0 = "foo.result_op"() : () -> i32
}

// -----
module {
}

// -----
module {
}

// -----
module {
  %0 = "op"() : () -> i32
}

// -----
module @foo {
  module {
    module @bar attributes {foo.bar} {
    }
  }
}

// -----
module attributes {test.another_attribute = #dlti.dl_spec<>, test.random_attribute = #dlti.dl_spec<>} {
}

