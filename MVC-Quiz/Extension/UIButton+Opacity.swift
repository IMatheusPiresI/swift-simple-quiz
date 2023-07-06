//
//  UIButton+Opacity.swift
//  MVC-Quiz
//
//  Created by Matheus Sousa on 05/07/23.
//
import UIKit

extension UIButton {
    func addOpacityEffect() {
        addTarget(self, action: #selector(buttonPressed(_:)), for: .touchDown)
        addTarget(self, action: #selector(buttonReleased(_:)), for: [.touchUpInside, .touchUpOutside])
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        UIButton.animate(withDuration: 0.1) {
            sender.alpha = 0.5
        }
    }
    
    @objc private func buttonReleased(_ sender: UIButton) {
        UIButton.animate(withDuration: 0.1) {
            sender.alpha = 1.0
        }
    }
    
}
