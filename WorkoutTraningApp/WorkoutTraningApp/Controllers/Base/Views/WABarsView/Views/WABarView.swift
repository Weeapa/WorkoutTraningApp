//
//  WABarView.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 01.07.2023.
//

import UIKit

extension WABarView{
    struct Data{
        let value: String
        let heightMultiplier: Double
        let title: String
    }
}

final class WABarView: WABaseView {
    
    private let heightMultiplier: Double
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRefular(with: 14)
        label.textColor = R.Colors.active
        return label
    }()
    
    private let barView: UIView = {
       let view = UIView()
        view.backgroundColor = R.Colors.active
        view.layer.cornerRadius = 2.5
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRefular(with: 13)
        label.textColor = R.Colors.titleGray
        return label
    }()
    
    
    
    init(data: Data){
        heightMultiplier = data.heightMultiplier  //Возможно нужно будет поставить "self.heightMultiplier"
        super.init(frame: .zero)
        
        valueLabel.text = data.value
        titleLabel.text = data.title.uppercased()
    }
    
    required init?(coder: NSCoder) {
        self.heightMultiplier  = 0
        super.init(frame: .zero)
    }
    
}


extension WABarView {
    override func setupViews() {
        super.setupViews()
        
        setupView(valueLabel)
        setupView(barView)
        setupView(titleLabel)
        
        
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.heightAnchor.constraint(equalToConstant: 10),
            
            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 7),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplier * 0.8),
            
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 10)
            
            
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        
      
    }
}
