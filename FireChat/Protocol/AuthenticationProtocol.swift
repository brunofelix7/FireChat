import Foundation

protocol AuthenticationViewModelProtocol {
    var formIsValid: Bool { get }
}

protocol AuthenticationViewControllerProtocol {
    func validadeForm()
}
