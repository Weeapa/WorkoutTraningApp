//
//  TimerView.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 16.06.2023.
//

import UIKit

enum TimerState{
    case isRuning
    case isPaused
    case isStopped
}

final class TimerView: WABaseInfoView {
    
    private let elapsedTimeLabel : UILabel = {
        let label = UILabel()
        label.text = R.Strings.Session.elapsedTime
        label.font = R.Fonts.helveticaRefular(with: 19)
        label.textColor = R.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let elapsedTimeValueLabel : UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRefular(with: 46)
        label.textColor = R.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let remainigTimeLabel : UILabel = {
        let label = UILabel()
        label.text = R.Strings.Session.remainigTime
        label.font = R.Fonts.helveticaRefular(with: 15)
        label.textColor = R.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    private let remainigTimeValueLabel : UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRefular(with: 15)
        label.textColor = R.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 12
        view.distribution = .fillProportionally
        return view
    }()
    
    private let complitedPercentView = PercentView()
    private let remainingPercentView = PercentView()
    
    private let bottomSeparetorView: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.separator
        return view
    }()
    
    private let timeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
//        view.arrangedSubviews[elapsedTimeLabel, elapsedTimeValueLabel, remainigTimeLabel, remainigTimeValueLabel]
        return view
    }()
    
    
    private let progressView = ProgressView()
    
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration = 0.0
    
    public var state: TimerState = .isStopped
//    var callBack: (() -> Void)? был врменный Void для понятия Клоужеров
    
    
    
    
    func configure(with duration: Double, progress: Double){
        timerDuration = duration // Разобртаься зачем нужна данная переменная
        
        let tempCurrentValue = progress > duration ? duration : progress
        let goalValueDivider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDivider
        let roundedPercent = Int(round(percent * 100))
        
        elapsedTimeValueLabel.text = getDisplayedString(from: Int(tempCurrentValue))
        remainigTimeValueLabel.text = getDisplayedString(from: Int(duration) - Int(tempCurrentValue))
        complitedPercentView.configure(with: "COMPLITED", andValue: roundedPercent)
        remainingPercentView.configure(with: "REMAINING", andValue: 100 - roundedPercent )
        
        
        progressView.drawProgress(with: CGFloat(percent))
    }
    
    func startTimer(){
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: { [weak self] timer in
            guard let self = self else {return}
            self.timerProgress += 0.01
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
//                self.callBack?()
            }
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
    
    func pauseTimer(){
        timer.invalidate()
    }
    
    func stopTimer(){
        guard self.timerProgress > 0 else {return}
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true,
                                     block: {  [weak self] timer in
            guard let self = self else { return }
            self.timerProgress -= self.timerDuration * 0.03
            
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
}

extension TimerView{
    override func setupViews() {
        super.setupViews()
        
        setupView(progressView)
        setupView(timeStackView)
        setupView(bottomStackView)
        
        [
            elapsedTimeLabel,
            elapsedTimeValueLabel,
            remainigTimeLabel,
            remainigTimeValueLabel
        ].forEach (timeStackView.addArrangedSubview)
        
        
        [
            complitedPercentView,
            bottomSeparetorView,
            remainingPercentView
        ].forEach(bottomStackView.addArrangedSubview)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            timeStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timeStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.heightAnchor.constraint( equalToConstant:35),
            bottomStackView.widthAnchor.constraint(equalToConstant: 175),
            
            bottomSeparetorView.widthAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        
        
    }
}



private extension TimerView {
    func getDisplayedString(from value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours =  value / 3600
        
        let secondStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minuteStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"
        
        return hours == 0
            ? [minuteStr, secondStr].joined(separator: ":")
            : [hoursStr ,minuteStr, secondStr].joined(separator: ":")
    }
}
