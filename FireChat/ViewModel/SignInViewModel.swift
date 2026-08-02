import Foundation

struct SignInViewModel : AuthViewModelProtocol {
    
    var user: User = User()
    
    var formIsValid: Bool {
        return !user.email.isEmpty && !user.password.isEmpty
    }
}
