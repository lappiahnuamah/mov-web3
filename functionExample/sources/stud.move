// Create a Move module that lets you register students, store their grades, and update or view their information. Each student has a name and a vector of grades.

module my_first_package::student {
    use std::string::String;
    use std::debug;
    use sui::tx_context::TxContext;
    use sui::object;


    public struct Student has key, store{
        id: UID,
        name: String,
        grades: vector<u64>,
        owner: address
    }

    // public struct StudentRegistry has key {
    //      id: UID,
    //      student: Student,
    // }

    // public fun add_student(student: &mut Student) {
    //     student.name = "John";
    // }

    public fun add_student (name: String, grades: vector<u64>, ctx: &mut TxContext) {
        let student = Student{
            id: object::new(ctx),
            name: name,
            grades: grades,
            owner: ctx.sender()
        };
        transfer::transfer(student, ctx.sender());
        
    } 
    
    public fun add_grade(student: &mut Student, grade: u64) {
        student.grades.push_back(grade);
    }

    public fun get_student(student: &mut Student) {
        student.name;
    }

    public fun get_grades(student: &mut Student) {
        student.grades;
    }

    #[test]
    fun test_add_student() {
        // Create a dummy TxContext for testing
        let mut ctx = tx_context::dummy();

        // Create a new certificate
        let name = b"";

        let student = Student{
            id: object::new(&mut ctx),
            name,
            owner: tx_context::sender(&ctx)
        };

        // Check if accessor function returns correct values
        assert!(add_student(&student) == b"Lawrence Appiah-Nuamah", 1);
    
        // Transfer the certificate to consume it, avoiding unused value error
        transfer::transfer(certificate, tx_context::sender(&ctx));

       

    
    }

}
