import Foundation
import UIKit

class TextFieldContainerView : UIView {
    
    private let imageView = UIImageView()
    private let dividerView = UIView()
    
    init(_ icon: UIImage?, _ textField: UITextField) {
        super.init(frame: .zero)
        setHeight(height: 50)
        configureIcon(icon)
        configureTextField(textField)
        configureDivider()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureIcon(_ icon: UIImage?) {
        imageView.image = icon
        imageView.tintColor = .white
        imageView.alpha = 0.85
        addSubview(imageView)
        imageView.centerY(inView: self)
        imageView.anchor(left: leftAnchor, paddingLeft: 8)
        imageView.setDimensions(height: 24, width: 24)
    }
    
    private func configureTextField(_ textField: UITextField) {
        addSubview(textField)
        textField.centerY(inView: self)
        textField.anchor(top: imageView.topAnchor,
                         left: imageView.rightAnchor,
                         bottom: imageView.bottomAnchor,
                         right: rightAnchor,
                         paddingLeft: 8,
                         paddingRight: 8
        )
    }
    
    private func configureDivider() {
        dividerView.backgroundColor = .white
        addSubview(dividerView)
        dividerView.setHeight(height: 1)
        dividerView.anchor(left: leftAnchor,
                           bottom: bottomAnchor,
                           right: rightAnchor
        )
    }
}

#Preview {
    let viewController = UIViewController()
    let view = viewController.view ?? UIView()
    let icon = UIImage(resource: .iconLock)
    let textField = TextFieldView("Password", isPassword: true)
    let container = TextFieldContainerView(icon, textField)
    
    viewController.configureGradientLayer()
    viewController.view.addSubview(container)
    
    container.centerY(inView: view)
    container.anchor(left: view.leftAnchor,
                     right: view.rightAnchor,
                     paddingLeft: 32,
                     paddingRight: 32
    )
    return viewController
}
