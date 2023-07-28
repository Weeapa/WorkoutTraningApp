//
//  ProgressView.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 22.06.2023.
//

import UIKit

extension TimerView{
    final class ProgressView: UIView {
        func drawProgress(with percent: CGFloat) {
            layer.sublayers?.removeAll()
            
            let circleFrame = UIScreen.main.bounds.width - (15 + 40) * 2
            let radius = circleFrame / 2
            let center = CGPoint(x: radius, y: radius)
            let startAngle = -CGFloat.pi * 7 / 6
            let endAngle = CGFloat.pi * 1 / 6
            
            let circlePath = UIBezierPath(arcCenter: center,
                                          radius: radius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)

            let barsFrame = UIScreen.main.bounds.width - (15 + 40 + 25) * 2
            let barsRadius = barsFrame / 2
            
            let barsPath = UIBezierPath(arcCenter: center,
                                        radius: barsRadius,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true)
            
            let barsLayer = CAShapeLayer()
            barsLayer.path = barsPath.cgPath
            barsLayer.strokeColor = UIColor.clear.cgColor
            barsLayer.fillColor = UIColor.clear.cgColor
            barsLayer.lineWidth = 6
            
            let startBarsRadiusLayer = barsRadius - barsLayer.lineWidth * 0.5
            let endBarsRadiusLayer = startBarsRadiusLayer + 6
            
            var angle: CGFloat = 7 / 6
            (1...9).forEach { _ in
                let barAngle = CGFloat.pi * angle
                let startBarPoint = CGPoint(x: cos(-barAngle) * startBarsRadiusLayer + center.x,
                                            y: sin(-barAngle) * startBarsRadiusLayer + center.y)
                
                let endBarPoint = CGPoint(x: cos(-barAngle) * endBarsRadiusLayer + center.x,
                                          y: sin(-barAngle) * endBarsRadiusLayer + center.y)
                
                let barPath = UIBezierPath()
                barPath.move(to: startBarPoint)
                barPath.addLine(to: endBarPoint)
                
                let barLayer = CAShapeLayer()
                barLayer.path = barPath.cgPath
                barLayer.fillColor = UIColor.clear.cgColor
                barLayer.strokeColor = angle >= (7 / 6 - (8 / 6 * percent)) ? R.Colors.active.cgColor : R.Colors.separator.cgColor
                barLayer.lineCap = .round
                barLayer.lineWidth = 6
                
                barsLayer.addSublayer(barLayer)
                
                angle -= 1 / 6
            }
            
           
            
            
          


            let defaultCircleLayer = CAShapeLayer()
            defaultCircleLayer.path = circlePath.cgPath
            defaultCircleLayer.strokeColor = R.Colors.separator.cgColor
            defaultCircleLayer.lineWidth = 20
            defaultCircleLayer.fillColor = UIColor.clear.cgColor
            defaultCircleLayer.lineCap = .round
            defaultCircleLayer.strokeEnd = 1

            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = R.Colors.active.cgColor
            circleLayer.lineWidth = 20
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round
            circleLayer.strokeEnd = percent
            
            let dotAngle = CGFloat.pi * (7 / 6 - (8 / 6 * percent))
            let dotPoint = CGPoint(x: cos(-dotAngle) * radius + center.x,
                                   y: sin(-dotAngle) * radius + center.y)
            
            
            let dotPath = UIBezierPath()
            dotPath.move(to: dotPoint) // поиграться
            dotPath.addLine(to: dotPoint  ) // поиграться
            
            let bigDotLayer = CAShapeLayer()
            bigDotLayer.path = dotPath.cgPath
            bigDotLayer.fillColor = UIColor.clear.cgColor
            bigDotLayer.strokeColor = R.Colors.active.cgColor
            bigDotLayer.lineCap = .round // поиграться через точку
            bigDotLayer.lineWidth = 20
            
            let dotLayer = CAShapeLayer()
            dotLayer.path = dotPath.cgPath
            dotLayer.fillColor = UIColor.clear.cgColor
            dotLayer.strokeColor = UIColor.white.cgColor
            dotLayer.lineCap = .round // поиграться через точку
            dotLayer.lineWidth = 8
            
            layer.addSublayer(defaultCircleLayer)
            layer.addSublayer(barsLayer)
            layer.addSublayer(circleLayer)
            layer.addSublayer(bigDotLayer)
            layer.addSublayer(dotLayer)
            
        }
    }
}
