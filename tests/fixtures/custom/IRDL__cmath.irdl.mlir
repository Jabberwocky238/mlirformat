module {
  irdl.dialect @cmath {
    irdl.type @complex {
      %0 = irdl.is f32 
      %1 = irdl.is f64 
      %2 = irdl.any_of(%0, %1) 
      irdl.parameters(elem: %2)
    }
    irdl.operation @norm {
      %0 = irdl.any
      %1 = irdl.parametric @cmath::@complex<%0> 
      irdl.operands(complex: %1)
      irdl.results(norm: %0)
    }
    irdl.operation @mul {
      %0 = irdl.is f32 
      %1 = irdl.is f64 
      %2 = irdl.any_of(%0, %1) 
      %3 = irdl.parametric @cmath::@complex<%2> 
      irdl.operands(lhs: %3, rhs: %3)
      irdl.results(res: %3)
    }
  }
}

