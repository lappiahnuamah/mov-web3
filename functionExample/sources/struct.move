module functionexample::structsexample {

use std::string::String;
// use bridge::vector::Vector;

// public struct UID has copy{
//     id: u64,
// }


public struct Student {
    id: u64,
    name: String,
    age: u8,
    grades: vector<u8>,
    is_enrolled: bool,
    student_id: u64,
    results: Results
}


public struct Results {
    subject: String,
    score: u8,
    grade: String,

}


// 2. Strut without any abilities
public struct Person {
    name: String,
    age: u8,
    address: String,
    phone_number: String,

}


public fun create_person (name: String, age: u8, address: String, phone_number: String): Person {
    Person {
        name,
        age,
        address,
        phone_number,
    }

}


public fun create_student (id: u64, name: String, age: u8, grades: vector<u8>, is_enrolled: bool, student_id: u64, results: Results): Student {
    Student {
        id,
        name,
        age,
        grades,
        is_enrolled,
        student_id,
        results
    }

}

public fun create_results (subject: String, score: u8, grade: String): Results {
    Results {
        subject,
        score,
        grade
    }
}


}
