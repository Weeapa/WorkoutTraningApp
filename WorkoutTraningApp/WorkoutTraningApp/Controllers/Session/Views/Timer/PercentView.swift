//
//  PercentView.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 26.06.2023.
//

import UIKit

extension TimerView {
    final class PercentView: WABaseView {
        
        private let stackView: UIStackView = {
            let view = UIStackView()
            view.axis = .vertical
            view.distribution = .fillProportionally
            view.spacing = 5
            return view
        }()
        
        private let percentLabel: UILabel = {
            var label = UILabel()
            label.font = R.Fonts.helveticaRefular(with: 23)
            label.textAlignment = .center
            label.textColor = R.Colors.titleGray
            return label
        }()
        
        private let subtitleLabel: UILabel = {
            let title = UILabel()
            title.font = R.Fonts.helveticaRefular(with: 11)
            title.textColor = R.Colors.inactive
            title.textAlignment = .center
            return title
        }()
        
        func configure(with title: String, andValue value: Int){
            subtitleLabel.text = "\(title)"
            percentLabel.text = "\(value)%"
        }
    }
}

extension TimerView.PercentView {
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
        stackView.addArrangedSubview(percentLabel)
        stackView.addArrangedSubview(subtitleLabel)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
    }
    
    
}
