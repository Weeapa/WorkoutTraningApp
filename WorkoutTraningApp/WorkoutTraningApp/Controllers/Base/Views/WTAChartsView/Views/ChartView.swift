//
//  ChartView.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 07.07.2023.
//

import UIKit

final class ChartView: WABaseView{
    
    private let yAxisSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.separator
        return view
    }()
    
    private let xAxisSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.separator
        return view
    }()
    
    func configure(with data:[WTAChartsView.Data]){
        
        layoutIfNeeded()
        drawDashLines()
        drawChart(with: data)
        
        
    }
}

extension ChartView{
    override func setupViews() {
        super.setupViews()
        
        setupView(yAxisSeparatorView)
        setupView(xAxisSeparatorView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            yAxisSeparatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisSeparatorView.topAnchor.constraint(equalTo: topAnchor),
            yAxisSeparatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            yAxisSeparatorView.widthAnchor.constraint(equalToConstant: 2),
            
            xAxisSeparatorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisSeparatorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            xAxisSeparatorView.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisSeparatorView.heightAnchor.constraint(equalToConstant: 2 ),
        ])
        
    }
    
    override func configureApperance() {
        super.configureApperance()
        
        backgroundColor = .clear
    }
}

private extension ChartView{
    
        func drawDashLines(with counts: Int? = 0){
    
            (0..<9).map{ CGFloat($0) }.forEach{
                drawDashLine(at: bounds.height / 9 * $0)
            }
        }
        
    
    
    func drawDashLine(at yPosition: CGFloat){
        let startPoint = CGPoint(x: 0, y: yPosition)
        let endPoint = CGPoint(x: bounds.width, y: yPosition)
        
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])
        
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = R.Colors.separator.cgColor//UIColor.black.cgColor
        dashLayer.borderWidth = 4
        dashLayer.lineDashPattern = [6, 3]
        
        layer.addSublayer(dashLayer)
    }
    
    func drawChart(with data: [WTAChartsView.Data]){
        guard let maxValue = data.sorted(by: {$0.value > $1.value}).first?.value else {return}
        let valuePoints = data.enumerated().map{CGPoint(x: CGFloat($0), y: CGFloat($1.value))}
        let chartHeight = bounds.height / CGFloat(maxValue + 10)
        
//        let points = valuePoints.map {
//            let x = bounds.width / CGFloat(valuePoint.count - 1 ) * $0.x
//            let y = bounds.height - $0.y * chartHeight
//            return CGPoint(x: x, y: y)
//        }
        
        let points: [CGPoint] = valuePoints.map { valuePoint in
            let x = bounds.width / CGFloat(valuePoints.count - 1) * valuePoint.x
            let y = bounds.height - valuePoint.y * chartHeight
            return CGPoint(x: x, y: y)
        }
        
        let chartPath = UIBezierPath()
        chartPath.move(to: points[0])
        
        points.forEach{
            chartPath.addLine(to: $0)
            drawChartDot(at: $0)
        }
        
        let chartLayer = CAShapeLayer()
        chartLayer.path = chartPath.cgPath
        chartLayer.strokeColor = R.Colors.active.cgColor
        chartLayer.fillColor = UIColor.clear.cgColor
        chartLayer.lineWidth = 3
        chartLayer.strokeEnd = 1
//        chartLayer.lineCap = .round
        chartLayer.lineJoin = .round
        
        layer.addSublayer(chartLayer)
    }
    
    func drawChartDot(at point: CGPoint){
        let dotPath = UIBezierPath()
        dotPath.move(to: point)
        dotPath.addLine(to: point)
        
        let dotLayer = CAShapeLayer()
        dotLayer.path = dotPath.cgPath
        dotLayer.strokeColor = R.Colors.active.cgColor
        dotLayer.lineCap = .round
        dotLayer.lineWidth = 10
        
        layer.addSublayer(dotLayer)
        
    }
}

