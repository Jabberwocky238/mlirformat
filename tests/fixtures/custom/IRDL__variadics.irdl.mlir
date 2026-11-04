module {
  irdl.dialect @testvar {
    irdl.operation @single_operand {
      %0 = irdl.is i32 
      irdl.operands(foo: %0)
    }
    irdl.operation @var_operand {
      %0 = irdl.is i16 
      %1 = irdl.is i32 
      %2 = irdl.is i64 
      irdl.operands(foo: %0, bar: variadic %1, baz: %2)
    }
    irdl.operation @opt_operand {
      %0 = irdl.is i16 
      %1 = irdl.is i32 
      %2 = irdl.is i64 
      irdl.operands(foo: %0, bar: optional %1, baz: %2)
    }
    irdl.operation @var_and_opt_operand {
      %0 = irdl.is i16 
      %1 = irdl.is i32 
      %2 = irdl.is i64 
      irdl.operands(foo: variadic %0, bar: optional %1, baz: %2)
    }
    irdl.operation @single_result {
      %0 = irdl.is i32 
      irdl.results(foo: %0)
    }
    irdl.operation @var_result {
      %0 = irdl.is i16 
      %1 = irdl.is i32 
      %2 = irdl.is i64 
      irdl.results(foo: %0, bar: variadic %1, baz: %2)
    }
    irdl.operation @opt_result {
      %0 = irdl.is i16 
      %1 = irdl.is i32 
      %2 = irdl.is i64 
      irdl.results(foo: %0, bar: optional %1, baz: %2)
    }
    irdl.operation @var_and_opt_result {
      %0 = irdl.is i16 
      %1 = irdl.is i32 
      %2 = irdl.is i64 
      irdl.results(foo: variadic %0, bar: optional %1, baz: %2)
    }
  }
}

