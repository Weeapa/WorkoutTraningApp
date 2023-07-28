//
//  TrainingCellView.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 24.07.2023.
//

import UIKit

enum CellRoundedType {
    case top, bottom, all, notCorners
}

final class TrainingCellView: UICollectionViewCell {
    static let id = "TrainingCellView"
    
    private let checkmarkView = UIImageView(image: R.Images.Overview.chekmarkNotDone)
    
    private let title: UILabel = {
       let label = UILabel()
        label.font = R.Fonts.helveticaRefular(with: 20) //поиграться
        label.textColor = R.Colors.titleGray
        return label
    }()
    
    private let subtitle: UILabel = {
       let label = UILabel()
        label.font = R.Fonts.helveticaRefular(with: 16 ) //поиграться
        label.textColor = R.Colors.inactive
        return label
    }()
    
    private let rightArrowView = UIImageView(image: R.Images.Overview.rightArrow)

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constaintViews()
        configureApperance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        constaintViews()
        configureApperance()
    }
    
    func configure(with title: String, subtitle: String, isDone: Bool, roundType: CellRoundedType){
        self.title.text = title
        self.subtitle.text = title
        
        checkmarkView.image = isDone ? R.Images.Overview.chekmarkDone : R.Images.Overview.chekmarkNotDone
        
        switch roundType {
        case .top:  self.cornersRounds([.topLeft, .topRight], radius: 8)
           
        case .bottom:  self.cornersRounds([.bottomLeft, .bottomRight], radius: 8)
           
        case .all: self.cornersRounds([.allCorners], radius: 8)
            
        case .notCorners: self.cornersRounds([.allCorners], radius: 0)
            
        }
    }
}

private extension TrainingCellView {
     func setupViews() {
         setupView(checkmarkView)
         setupView(stackView)
         stackView.addArrangedSubview(title)
         stackView.addArrangedSubview(subtitle)
         setupView(rightArrowView)
     }
    
    func  constaintViews() {
        NSLayoutConstraint.activate([
            checkmarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15), //поиграться
            checkmarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkView.heightAnchor.constraint(equalToConstant: 28),
            checkmarkView.widthAnchor.constraint(equalTo: checkmarkView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: checkmarkView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: rightArrowView.leadingAnchor, constant: -15),
            
            rightArrowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrowView.heightAnchor.constraint(equalToConstant: 12),
            rightArrowView.widthAnchor.constraint(equalToConstant: 7)
            
            
            
        ])
    }
    
    func configureApperance(){
        backgroundColor = .white
//        layer.borderWidth = 2
//        layer.borderColor = R.Colors.separator.cgColor
    }
}
