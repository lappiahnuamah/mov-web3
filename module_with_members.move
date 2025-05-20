module book::my_block_module_with_members {
   
   //import
   use book::my_module;

   use sui::address;

   use std::string::String;

   // a constant
    const CONST: u8 = 0;

    // a struct
    public struct Struct {}

    // method alias
    public use fun function as Struct.struct_fun; 

    // a function
    fun function(_: &Struct) { /* function body */ }

    //conversion to u256
    let addr_as_u256: u256 = address::to_u256(@0x1);
    let addr = address::from_u256(addr_as_u256);

    //conversion to vector<u8>
    let addr_as_u8: vector<u8> = address::to_bytes(@0x1);
    let addr = address::from_bytes(addr_as_u8);

    //convert an address into a string
    let addr_as_string: String = address::to_string(@0x1);



}


module book::another_module_in_the_file {
    // ... other code ...
    let num: u64 = 30;
    let x: bool = false;

    let mut num2: u64 = 40;
    num2 = 50; // This will work, as num2 is mutable
}

//blocks
let sum = {
    let a = 1;
    let b = 2;
    a + b // This will return 3
};


{
    let a = 1;
    let b = 2;
    a + b; // This will return 3 
};


// functions
fun add(a: u8, b: u8): u8 {
    a + b
}

fun substract(a: u8, b: u8): u8 {
    a - b
}

fun multiply(a: u8, b: u8): u8 {
    a * b
}

#[test]
fun some_other(){
    let sum = add(1, 2);
}