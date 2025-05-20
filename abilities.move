/// This module defines the `VeryAble` struct with the `copy` and `drop` abilities.
public struct VeryAble has copy, drop {
//     field: Type1,
//     field: Type2,
}

// NB: All built-in types has copy, drop and store abilities. References have copy and drop.


copy - Allows the struct to be copied
drop - Allows the struct to be dropped
key - Allows the struct to be used as a key in a storage
store - Allows the struct to be stored in a structs that hae the key ability