//
//  BaseController.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 27.05.2023.
//

import UIKit

enum NavBarPosition{
    case left
    case right
}

class WABaseController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViews()
        constaintViews()
        configureApperance()
    }
}

@objc extension WABaseController{
    func setupViews() {}
    func constaintViews() {}
    func configureApperance(){
        view.backgroundColor = R.Colors.background
    }
    
    func navBarLeftButtonHandler(){
        print("Нажали кнопку слева из Родока")
    }
    func navBarRightButtonHandler (){
        print("нажали кнопку справа из родока")
    }
}

extension WABaseController{
    func addNavBarButton(at position: NavBarPosition, with title: String){
        let button = UIButton(type: .system)// поиграться удалить .system
        button.setTitle(title, for: .normal)
        button.setTitleColor(R.Colors.active, for: .normal)
        button.setTitleColor(R.Colors.inactive, for: .disabled)
        button.titleLabel?.font = R.Fonts.helveticaRefular(with: 21)//поиграться с размером
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .touchUpInside)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .touchUpInside)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    func setTitleForNavBarButton(_ title: String, at position: NavBarPosition){
        switch position {
        case .left:
            (navigationItem.leftBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        case .right:
            (navigationItem.rightBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        }
    }
    
}
