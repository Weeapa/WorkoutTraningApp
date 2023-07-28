//
//  SettingsController.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 27.05.2023.
//

import UIKit

class SettingsController: WABaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Settings"
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .settings)
    }


}
