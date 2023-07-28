//
//  WeekdayView.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 02.06.2023.
//

import UIKit

extension WeekView{
    final class WeekdayView: WABaseView{
        private let nameLabel = UILabel()
        private let dayLabel = UILabel()
        private let stackView = UIStackView()
        
        func configure(with index: Int, and name: String) {
            
            let startOfWeek = Date().startOfWeek
            let currenDay = startOfWeek.agoForward(for: index)
            let day = Date.calendar.component(.day, from: currenDay)
            
            let isTooday = currenDay.stripTime() == Date().stripTime()
            
            backgroundColor = isTooday ? R.Colors.active : R.Colors.background
            
            nameLabel.text = name.uppercased()
            nameLabel.textColor = isTooday ? .white : R.Colors.inactive
            
            dayLabel.text = "\(day)"
            dayLabel.textColor = isTooday ? .white : R.Colors.inactive
        }
    }
}

extension WeekView.WeekdayView{
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(dayLabel)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        
   
        
        layer.cornerRadius = 5
        layer.masksToBounds = false // поиграться
        
        nameLabel.font = R.Fonts.helveticaRefular(with: 15)
        nameLabel.textAlignment = .center
        
        dayLabel.font = R.Fonts.helveticaRefular(with: 15)
        dayLabel.textAlignment = .center
        
        stackView.spacing = 3
        stackView.axis = .vertical
    }
}
