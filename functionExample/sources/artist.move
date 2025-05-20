module functionexample::functionexamplearist {

    use std::string::String;

    public struct Artist { 
        id: u64,
        name: String,
        age: u64,
        genre: String,
        albums: u64,
        awards: Award,
    }


    public struct Award{
        name: String,
        year: u64,
        category: String,
    }

    public fun create_artist(id: u64, name: String, age: u64, genre: String, albums: u64, awards: Award): Artist {
        Artist {
            id, 
            name, 
            age,
            genre,
            albums,
            awards
        }

    }

    public fun create_award(name: String, year: u64, category: String): Award {
        Award {
            name,
            year,
            category
        }
    }


}