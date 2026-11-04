module {
}

// -----
module {
  %true = arith.constant true
  func.func @operations(%arg0: !pdl.attribute, %arg1: !pdl.value, %arg2: !pdl.type) {
    %0 = pdl_interp.create_operation "foo.op"(%arg1 : !pdl.value) {"attr" = %arg0}  -> (%arg2 : !pdl.type)
    %1 = pdl_interp.create_operation "foo.op" {"attr" = %arg0}  -> (%arg2 : !pdl.type)
    %2 = pdl_interp.create_operation "foo.op" {"attr" = %arg0, "attr1" = %arg0} 
    %3 = pdl_interp.create_operation "foo.op"(%arg1 : !pdl.value)  -> (%arg2 : !pdl.type)
    %4 = pdl_interp.create_operation "arith.constant"  -> <inferred>
    pdl_interp.finalize
  }
}

// -----
module {
  func.func @extract(%arg0: !pdl.range<attribute>, %arg1: !pdl.range<operation>, %arg2: !pdl.range<type>, %arg3: !pdl.range<value>) {
    %0 = pdl_interp.extract 0 of %arg0 : !pdl.attribute
    %1 = pdl_interp.extract 1 of %arg1 : !pdl.operation
    %2 = pdl_interp.extract 2 of %arg2 : !pdl.type
    %3 = pdl_interp.extract 3 of %arg3 : !pdl.value
    pdl_interp.finalize
  }
}

// -----
module {
  func.func @foreach(%arg0: !pdl.range<operation>) {
    pdl_interp.foreach %arg1 : !pdl.operation in %arg0 {
      %0 = pdl_interp.get_result 0 of %arg1
      pdl_interp.continue
    } -> ^bb1
  ^bb1:  // pred: ^bb0
    pdl_interp.finalize
  }
}

// -----
module {
  func.func @users(%arg0: !pdl.value, %arg1: !pdl.range<value>) {
    %0 = pdl_interp.get_users of %arg0 : !pdl.value
    %1 = pdl_interp.get_users of %arg1 : !pdl.range<value>
    pdl_interp.finalize
  }
}

