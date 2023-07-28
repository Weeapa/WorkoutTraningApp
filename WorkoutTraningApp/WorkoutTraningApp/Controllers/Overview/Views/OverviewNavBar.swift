//
//  OverviewNavBar.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 28.05.2023.
//

import UIKit

final class OverviewNavBar : WABaseView {
    
    private let titleLabel = UILabel()
    private let addButton: UIButton = {
       let button = UIButton()
        button.setImage(R.Images.Common.add, for: .normal)
        return button
    }()
    private let allWorkoutButton: WAButton = {
        let button = WAButton(with: .secondary)
        button.setTitle(R.Strings.Overview.allWorkoutButton)
        return button
    }()
    private let weekView  = WeekView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(with: R.Colors.separator, height: 2)
    }
    
    func addAllWorkoutAction(_ action: Selector, with target: Any?) {
        allWorkoutButton.addTarget(target,
                                   action: action,
                                   for: .touchUpInside)
    }
    
    func addAdditingAction(_ action: Selector, with target: Any?){
        addButton.addTarget(target,
                            action: action,
                            for: .touchUpInside)
    }
}

extension OverviewNavBar {
    override func setupViews() {
        super.setupViews()
        
        setupView(titleLabel)
        setupView(addButton)
        setupView(allWorkoutButton)
        setupView(weekView)
    }
    override func constaintViews() {
        super.constaintViews()
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 8),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            allWorkoutButton.trailingAnchor.constraint(equalTo: addButton.leadingAnchor, constant: -15),
            
            titleLabel.centerYAnchor.constraint(equalTo: allWorkoutButton.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: allWorkoutButton.leadingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            
            weekView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 15),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            weekView.heightAnchor.constraint(equalToConstant: 67) //Дефолт 47
            
        ])
    }
    
    override func configureApperance() {
        super.configureApperance()
        backgroundColor = .white
        
        titleLabel.text = R.Strings.NavBar.overview
        titleLabel.textColor = R.Colors.titleGray
        titleLabel.font = R.Fonts.helveticaRefular(with: 22) //
    }
}




