import Foundation

struct SignUpViewModel : AuthenticationViewModelProtocol {
    
    var email: String?
    var name: String?
    var username: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false &&
               name?.isEmpty == false &&
               username?.isEmpty == false &&
               password?.isEmpty == false
    }
}
