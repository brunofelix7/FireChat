import Foundation

struct SignInViewModel : AuthenticationViewModelProtocol {
    
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}
