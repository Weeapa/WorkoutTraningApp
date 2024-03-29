//
//  WTAChartsView.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 03.07.2023.
//

import UIKit
extension WTAChartsView{
    struct Data{
        let value: Int
        let title: String
    }
    
}

final class WTAChartsView: WABaseView {
    
    private let yAxisView = YAxisView()
    private let xAxisView = XAxisView()

    private let chartView = ChartView()
    
    func configure(with data: [WTAChartsView.Data]){
        yAxisView.configure(with: data)
        xAxisView.configure(with: data)
        chartView.configure(with: data)
    }
    
}

extension WTAChartsView {
    override func setupViews() {
        super.setupViews()
        
        setupView(yAxisView)
        setupView(xAxisView)
        setupView(chartView)

    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            yAxisView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisView.topAnchor.constraint(equalTo: topAnchor),
            yAxisView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -12),
            
            
            xAxisView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 8),
            xAxisView.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 4),
            
            chartView.leadingAnchor.constraint(equalTo: yAxisView.trailingAnchor, constant: 16),
            chartView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4),
            chartView.bottomAnchor.constraint(equalTo: xAxisView.topAnchor, constant: -16),

        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        
        backgroundColor = .clear
        
    }
}
