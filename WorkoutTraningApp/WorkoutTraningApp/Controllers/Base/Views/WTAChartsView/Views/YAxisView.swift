//
//  YAxisView.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 03.07.2023.
//

import UIKit

final class YAxisView: WABaseView{
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        return view
    }()
    
    func configure(with data: [WTAChartsView.Data]){
        stackView.arrangedSubviews.forEach{
            $0.removeFromSuperview()
        }
        
        (0...9).reversed().forEach{
            let lable = UILabel()
            lable.font = R.Fonts.helveticaRefular(with: 13)
            lable.textColor = R.Colors.inactive
            lable.textAlignment = .right
            lable.text = "\($0 * 10)" //TODO: - Remake to colculated interval
            
            stackView.addArrangedSubview(lable)
        }
        
    }
    
}

extension YAxisView{
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            
        ])

    }
    
    override func configureApperance() {
        super.configureApperance()
    }
}
