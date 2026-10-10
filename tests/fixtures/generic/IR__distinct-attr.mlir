#distinct = distinct[0]<42 : i32>
#distinct1 = distinct[1]<array<i32: 10, 42>>
#distinct2 = distinct[2]<42 : i32>
"builtin.module"() ({
  "test.op"() {distinct.attr = #distinct} : () -> ()
  "test.op"() {distinct.attr = #distinct1} : () -> ()
  "test.op"() {distinct.attr = #distinct} : () -> ()
  "test.op"() {distinct.attr = #distinct2} : () -> ()
  "test.op"() {distinct.attr = distinct[3]<>} : () -> ()
  "test.op"() {distinct.attr = distinct[4]<>} : () -> ()
}) : () -> ()

