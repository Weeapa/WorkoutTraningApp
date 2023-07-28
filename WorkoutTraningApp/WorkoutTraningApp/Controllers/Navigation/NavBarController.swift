//
//  NavBarController.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 27.05.2023.
//

import UIKit

final class NavBarController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor : R.Colors.titleGray, //когда найду где это, исправить на Resources.Colors.titleGray
            .font : R.Fonts.helveticaRefular(with: 22)] //поиграться
        
        navigationBar.addBottomBorder(with: R.Colors.separator, height: 2)
    }
}
