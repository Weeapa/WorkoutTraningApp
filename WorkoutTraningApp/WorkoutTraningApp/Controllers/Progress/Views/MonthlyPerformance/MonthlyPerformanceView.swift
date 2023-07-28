//
//  MonthlyPerformanceView.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 03.07.2023.
//

import UIKit

final class MonthlyPerformanceView: WABaseInfoView {
    
    
    private let  chartsView = WTAChartsView()
    
    func configure (with items: [WTAChartsView.Data]){
        chartsView.configure(with: items)
    }
}
extension MonthlyPerformanceView{
    override func setupViews() {
        super.setupViews()
        
        setupView(chartsView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            chartsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            chartsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            chartsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            chartsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15)
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        
        chartsView.backgroundColor = .clear
    }
}
