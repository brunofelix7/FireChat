import Foundation

struct SignUpViewModel : AuthViewModelProtocol {
    
    var user: User = User()
    
    var formIsValid: Bool {
        return
            !user.email.isEmpty &&
            !user.name.isEmpty &&
            !user.username.isEmpty &&
            !user.password.isEmpty
    }
}
