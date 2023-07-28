//
//  SessionController.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 27.05.2023.
//

import UIKit

class SessionController: WABaseController {
    private let timerView = TimerView()
    private let statsView = StatsView(with: R.Strings.Session.workoutStats)
    private let stepsView = StepsView(with: R.Strings.Session.stepsCounter)
    
    
    private let timerDuration = 20.0
 
    override func navBarLeftButtonHandler (){
        if timerView.state == .isStopped{
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRuning ? .isStopped : .isRuning
        setTitleForNavBarButton(timerView.state == .isRuning ? R.Strings.Session.navBarPause : R.Strings.Session.navBarStart, at: .left)
    }
    
    override func navBarRightButtonHandler(){
        timerView.stopTimer()
        timerView.state = .isStopped
        
        setTitleForNavBarButton(R.Strings.Session.navBarStart, at: .left)
    }
}

extension SessionController{
    override func setupViews() {
        super.setupViews()
        
        view.setupView(timerView)
        view.setupView(statsView)
        view.setupView(stepsView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
//            timerView.heightAnchor.constraint(equalToConstant: 500)
            
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 11),
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
            
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            stepsView.topAnchor.constraint(equalTo: statsView.topAnchor),
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor),
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
         
        addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0)
        
//        timerView.callBack = { [weak self] in
//            self? .navBarRightButtonHandler()
//        }
        
    
        statsView.configure(with: [.heartRate(value: "155"),
                                   .avaragePace(value: "9' 22''"),
                                   .totalDistance(value: "16"),
                                   .totalSteps(value: "7,6529")
                                  ])
        
        stepsView.configure(with: [.init(value: "8k", heightMultiplier: 1, title: "2/15"),
                                   .init(value: "7k", heightMultiplier: 0.8, title: "2/16"),
                                   .init(value: "5k", heightMultiplier: 0.6, title: "2/17"),
                                   .init(value: "6k", heightMultiplier: 0.7, title: "2/18")])

        
        
//        stepsView.configure(with: [])
    }
}

