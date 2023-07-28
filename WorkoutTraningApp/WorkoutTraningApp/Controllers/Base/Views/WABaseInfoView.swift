//
//  BaseInfoView.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 14.06.2023.
//

import UIKit


class WABaseInfoView: WABaseView{
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRefular(with: 16) // Поиграться
        label.textColor = R.Colors.inactive
        return label
    }()
    
    private let button = WAButton(with: .primary)
    
     let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        view.layer.borderColor = R.Colors.separator.cgColor
        view.layer.borderWidth = 2 // Поиграться
        return view
    }()
    init(with title: String? = nil, buttonTitle: String? = nil) {
        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = buttonTitle == nil ? .center : .left
        
        button.setTitle(buttonTitle?.uppercased())
        button.isHidden = buttonTitle == nil ? true : false 
        
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
    }
    
    func addButtonTarget(target: Any?, action: Selector){
        button.addTarget(target, action: action, for: .touchUpInside)
    }
    
}

extension WABaseInfoView { 
    override func setupViews() {
        super.setupViews()
        
        setupView(titleLabel)
        setupView(contentView)
        setupView(button)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        let contentTopAnchor: NSLayoutAnchor = titleLabel.text == nil ? topAnchor : titleLabel.bottomAnchor
        let contentsTopOffset: CGFloat = titleLabel.text == nil ? 0 : 10
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            button.trailingAnchor.constraint(equalTo:trailingAnchor),
            button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 28), // поиграться 
            
            contentView.topAnchor.constraint(equalTo: contentTopAnchor, constant: contentsTopOffset),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        
        backgroundColor = .clear
    }
}
