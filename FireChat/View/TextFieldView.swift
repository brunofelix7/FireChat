import Foundation
import UIKit

class TextFieldView : UITextField {
    
    init(_ placeholder: String, isPassword: Bool = false) {
        super.init(frame: .zero)
        
        font = UIFont.systemFont(ofSize: 14)
        textColor = .white
        borderStyle = .none
        keyboardAppearance = .dark
        isSecureTextEntry = isPassword
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [.foregroundColor : UIColor.white])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
