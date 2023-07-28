//
//  SecondaryButton.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 27.05.2023.
//

import UIKit

public enum WAButtonType{
    case primary
    case secondary
}

final class WAButton : UIButton{
    
    private var type : WAButtonType = .primary
    
    private let label:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    private let iconView: UIImageView = {
        let icon = UIImageView()
        icon.image = R.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
        return icon
    }()
    
    
    init(with type: WAButtonType){
        super.init(frame: .zero)
        self.type = type
        
        setupViews()
        constaintViews()
        configureApperance()
    }
    
    
    required init?(coder: NSCoder){
        super .init(frame: .zero)
 
        setupViews()
        constaintViews()
        configureApperance()
    }
    
    func setTitle(_ title:String?) {
        label.text = title 
    }
}

private extension WAButton {
    func setupViews() {
        setupView(label)
        setupView(iconView)
    }
    
    func constaintViews() {
        let horisontalOffset: CGFloat = {
            switch type {
            case .primary : return 0
            case .secondary : return 10
            }
        }()
        
        NSLayoutConstraint.activate([
            iconView.centerYAnchor.constraint(equalTo: centerYAnchor),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -horisontalOffset),
            iconView.heightAnchor.constraint(equalToConstant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 10),
            
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -10),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: horisontalOffset * 2)
        ])
    }
    
    func configureApperance() {
        switch type{
        case .primary:
            label.textColor = R.Colors.inactive
            label.font = R.Fonts.helveticaRefular(with: 15)
            iconView.tintColor = R.Colors.inactive
            

            
        case .secondary:
            iconView.image = R.Images.Common.downArrow?.withRenderingMode(.alwaysTemplate)
            iconView.tintColor = R.Colors.active
            label.textColor = R.Colors.active
            label.font = R.Fonts.helveticaRefular(with: 17)
            backgroundColor = R.Colors.secondary
            layer.cornerRadius = 14
        }
        makeSystrem(self)
       
       
    }
}
