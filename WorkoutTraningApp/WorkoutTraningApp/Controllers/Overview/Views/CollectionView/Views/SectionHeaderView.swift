//
//  SectionHeaderView.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 21.07.2023.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {
    static let id = "SectionHeaderView"
    
    private let title: UILabel = {
       let label = UILabel()
        label.font = R.Fonts.helveticaRefular(with: 15)
        label.textColor = R.Colors.inactive
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
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
    
    func configure (with date: Date){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd"
        
        self.title.text = dateFormatter.string(from: date).uppercased()
    }
    
}


private extension SectionHeaderView {
     func setupViews() {
        setupView(title)
    }
    
    func  constaintViews() {
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configureApperance(){
        
    }
}
