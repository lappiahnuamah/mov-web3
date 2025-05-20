module my_first_package::ownership;

public fun owner(): u8 {
    let a = 1; // a defined here
    a // scope ends, a is returned
}

#[test]
fun test_owner() {
    let a = owner();
    // a is valid here
} // a is dropped here
