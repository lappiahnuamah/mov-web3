/// A struct representing an artist

// public struct Artist has key {
//     id: u64,
//     name: vector<u8>,
//     genre: vector<u8>,
//     albums: vector<Album>,
// }


public struct Artist {
    name: String,
}


/// A struct representing a music record.
// public struct Record {
//     title: String,

//     artist: Artist,

//     year: u16, 

//     is_debut: bool, 

//     edition: Option<u16>,
// }


let mut artist = Artist {
    name: b"The Beatles".to_string()
};

// let record = Record {
//     title: b"Abbey Road".to_string(),
//     artist: artist,
//     year: 1969,
//     is_debut: false,
//     edition: None,
// }

// #[test]
// fun test_artist() {
//     let artist = Artist {
//         name: b"The Beatles".to_string(),
//     };
//     assert_eq!(artist.name, b"The Beatles".to_string());
// }


//Access the `name` field of the `artist` struct
// let artist_name = artist.name;
// assert!(artist_name == b"The Beatles".to_string());
// assert_eq!(artist_name, b"The Beatles".to_string());

// Mutate the `name` field of the `artist` struct
// artist.name = b"Led Zeppelin".to_string();

//Check that the `name` field was mutated
// assert!(artist.name == b"Led Zeppelin".to_string());


//Unpack the `Artist` struct and create a new variable `name`
//with the value of the `name` field
let Artist { name } = artist;


//Unpack the `Artist` struct and ignore the `name` field
let Artist { name: _ } = artist;


module functionexample::