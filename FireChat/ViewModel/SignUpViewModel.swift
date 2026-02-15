import Foundation

struct SignUpViewModel : AuthViewModelProtocol {
    
    var user: User = User()
    
    var formIsValid: Bool {
        return
            user.email?.isEmpty == false &&
            user.name?.isEmpty == false &&
            user.username?.isEmpty == false &&
            user.password?.isEmpty == false
    }
}
