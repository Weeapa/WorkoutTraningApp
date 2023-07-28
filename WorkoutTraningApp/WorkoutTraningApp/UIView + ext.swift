//
//  UIView + ext.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 27.05.2023.
//

import UIKit

extension UIView {
    func addBottomBorder(with color: UIColor, height: CGFloat) {
        let separator = UIView()
        separator.backgroundColor = color
        separator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        separator.frame = CGRect(x: 0,
                                 y: frame.height - height,
                                 width: frame.width,
                                 height: height)
        addSubview(separator)
    }
    
    func setupView(_ view: UIView){
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func makeSystrem (_ button: UIButton) {
        button.addTarget(self, action: #selector(handleIn), for: [
            .touchDown,
            .touchDragInside
        ])
        button.addTarget(self, action: #selector(handleOut), for: [
            .touchDragOutside,
            .touchUpInside,
            .touchUpOutside,
            .touchDragExit,
            .touchCancel
        ])
    }
    
    @objc func handleIn() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 0.55
        }
    }
    @objc func handleOut() {
        UIView.animate(withDuration: 0.15) {
            self.alpha = 1
        }
    }
    
    func cornersRounds(_ corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect: bounds,
                               byRoundingCorners: corners,
                               cornerRadii: CGSize(width: radius, height: radius))
        
        let cornersLayer = CAShapeLayer()
        cornersLayer.frame = bounds
        cornersLayer.path = path.cgPath
        cornersLayer.strokeColor = R.Colors.separator.cgColor
        cornersLayer.fillColor = UIColor.clear.cgColor
        cornersLayer.lineWidth = 3
        layer.addSublayer(cornersLayer)
        
    }
    
}
