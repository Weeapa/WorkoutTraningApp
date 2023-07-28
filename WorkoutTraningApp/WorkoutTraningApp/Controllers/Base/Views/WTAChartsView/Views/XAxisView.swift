//
//  XAxisView.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 03.07.2023.
//

import UIKit

final class XAxisView: WABaseView{
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        return view
    }()
    
    func configure(with data: [WTAChartsView.Data]){
        stackView.arrangedSubviews.forEach{
            $0.removeFromSuperview()
        }
        
        data.forEach{
            let lable = UILabel()
            lable.font = R.Fonts.helveticaRefular(with: 13)
            lable.textColor = R.Colors.inactive
            lable.textAlignment = .center
            lable.text = "\($0.title.uppercased())" //TODO: - Remake to colculated interval
            
            stackView.addArrangedSubview(lable)
        }
        
    }
    
}



extension XAxisView{
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
