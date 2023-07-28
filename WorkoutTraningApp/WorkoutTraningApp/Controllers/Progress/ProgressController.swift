//
//  ProgressController.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 27.05.2023.
//

import UIKit

class ProgressController: WABaseController {
    
    private let dailyPerformanceView = DailyPerformanceView(with: R.Strings.Progress.dailyPerformance,
                                                      buttonTitle: R.Strings.Progress.last7Days)
    
    private let monthlyPerformanceView = MonthlyPerformanceView(with: R.Strings.Progress.monthlyPerformance,
                                                      buttonTitle: R.Strings.Progress.last10Months)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = R.Strings.NavBar.progress
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .progress)
        addNavBarButton(at: .left, with: R.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Progress.navBarRight)
    }
    

}

extension ProgressController{
    override func setupViews() {
        super.setupViews()
        
        view.setupView(dailyPerformanceView)
        view.setupView(monthlyPerformanceView)
    }
    
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68),
            
            monthlyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            monthlyPerformanceView.topAnchor.constraint(equalTo: dailyPerformanceView.bottomAnchor, constant: 15),
            monthlyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            monthlyPerformanceView.heightAnchor.constraint(equalTo: monthlyPerformanceView.widthAnchor, multiplier: 1.06),
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        
        dailyPerformanceView.configure(with: [.init(value: "3k", heightMultiplier: 0.4, title: "Mon"),
                                              .init(value: "4k", heightMultiplier: 0.5, title: "Thu"),
                                              .init(value: "5k", heightMultiplier: 0.6, title: "Wen"),
                                              .init(value: "6k", heightMultiplier: 0.7, title: "Thu"),
                                              .init(value: "3k", heightMultiplier: 0.4, title: "Fri"),
                                              .init(value: "2k", heightMultiplier: 0.3, title: "Sat"),
                                              .init(value: "8k", heightMultiplier: 1, title: "Sun"),
                                              
                                                .init(value: "3k", heightMultiplier: 0.4, title: "Mon"),
                                              .init(value: "4k", heightMultiplier: 0.5, title: "Thu"),
                                              .init(value: "5k", heightMultiplier: 0.6, title: "Wen"),
                                              .init(value: "6k", heightMultiplier: 0.7, title: "Thu"),
                                             ])
        
        monthlyPerformanceView.configure(with: [.init(value: 45, title: "Mar"),
                                                .init(value: 55, title: "Apr"),
                                                .init(value: 60, title: "May"),
                                                .init(value: 65, title: "Jun"),
                                                .init(value: 70, title: "Jul"),
                                                .init(value: 80, title: "Aug"),
                                                .init(value: 65, title: "Sep"),
                                                .init(value: 45, title: "Oct"),
                                                .init(value: 30, title: "Nov"),
                                                .init(value: 15, title: "Dec"),])
        
        
    }
    
        
}



//extension ProgressController{
//    override func setupViews() {
//        super.setupViews()
//
//        setupView(perfornaceBars)
//    }
//
//    override func constaintViews() {
//        super.constaintViews()
//
//
//    }
//
//    override func configureApperance() {
//        super.configureApperance()
//
//        perfornaceBars.configure(with: [.init(value: "12l", heightMultiplier: 1, title: "1l1"),
//                                        .init(value: "13", heightMultiplier: 0.5, title: "sad"),
//                                        .init(value: "asd", heightMultiplier: 0.3, title: "avxcv")])
//    }
//}
