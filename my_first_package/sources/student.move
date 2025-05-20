module my_first_package::student {
    use std::string::String;
    use std::vector;
    use std::debug;
    use sui::tx_context::TxContext;
    use sui::transfer;
    use std::u128::to_string;

    /// Student struct
    public struct Student has key, store {
        id: UID,
        name: String,
        grades: vector<u64>,
        owner: address,
    }

    /// Create a new student and transfer it to the caller
    public fun add_student(name: String, grades: vector<u64>, ctx: &mut TxContext) {
        let student = Student {
            id: object::new(ctx),
            name,
            grades,
            owner: tx_context::sender(ctx),
        };
        transfer::transfer(student, tx_context::sender(ctx));
    }

    /// Add a grade to a student's grades
    public fun add_grade(student: &mut Student, grade: u64) {
        vector::push_back(&mut student.grades, grade);
    }

    /// Get student's name
    public fun get_student_name(student: &Student): &String {
        &student.name
    }

    /// Get student's grades
    public fun get_grades(student: &Student): &vector<u64> {
        &student.grades
    }

    #[test]
    fun test_add_student() {
        let mut ctx = tx_context::dummy();

        // let name = b""to.string("Lawrence");
        let name = b"Lawrence"to.string(name);
        let grades = vector::empty<u64>();

        let student = Student {
            id: object::new(&mut ctx),
            name,
            grades,
            owner: tx_context::sender(&ctx),
        };

        // Add a grade
        add_grade(&mut student, 95);

        // Check if the grade was added
        let all_grades = get_grades(&student);
        assert!(vector::length(all_grades) == 1, 100);
        assert!(*vector::borrow(all_grades, 0) == 95, 101);

        // Debug output
        debug::print(&student.name);
        debug::print(all_grades);
    }
}
