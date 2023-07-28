//
//  Resources.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 25.05.2023.
//

import UIKit
enum R {
    enum Colors{
        static let active = UIColor(hexFromString: "#437BFE")
        static let inactive = UIColor(hexFromString: "#929DA5")
        
        static let separator = UIColor(hexFromString: "#E8ECEF")
        static let titleGray = UIColor(hexFromString: "#545C77")
        static let background = UIColor(hexFromString: "#F8F9F9")
        static let secondary = UIColor(hexFromString: "#F0F3FF")
        static let subtitleGray = UIColor(hexFromString: "#D8D8D8")
    }
    
    
    
    enum Strings{
        enum TabBar{
            static func title (for tab: Tabs) -> String {
                switch tab {
                case .overview: return "Overview"
                case .progress: return "Progress"
                case .session: return "Session"
                case .settings: return "Settings"
                }
            }
        }
        enum NavBar{
            static let overview = "Today"
            static let session = "High Intensity Cardio"
            static let progress = "Workout progress"
            static let setting = "Settings"
        }
        enum Overview{
            static let allWorkoutButton = "All Workouts"
        }
        enum Session{
            static let navBarStart = "Start   "
            static let navBarPause = "Pause"
            static let navBarFinish = "Finish"
            
            static let elapsedTime = "Elapsed Time"
            static let remainigTime = "Remaining Time"
            static let completed = "Completed"
            static let remaining = "Remaining"
            
            static let workoutStats = "Workout stats"
            static let averagePace = "Average pace"
            static let heartRate = "Heart rate"
            static let totalDistance = "Total distance"
            static let totalSteps = "Total steps"
            
            static let stepsCounter = "Steps counter" 
            
            
        }
        enum Progress{
            static let navBarLeft = "Export"
            static let navBarRight = "Details"
            
            static let dailyPerformance = "Daily performance"
            static let last7Days = "Last 7 days"
            
            static let monthlyPerformance = "Monthly performance"
            static let last10Months = "Last 10 months"
            
        }
    }
    
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage?{
                switch tab {
                case .overview:  return UIImage(named: "overview_tab")
                case .session: return UIImage(named: "progress_tab")
                case .progress: return UIImage(named: "progress_tab")
                case .settings: return UIImage(named: "settings_tab")
                }
            }
        }
        enum Common {
            static let downArrow = UIImage(named: "down_arrow")
            static let add = UIImage(named: "add_button")
        }
        
        enum Overview{
            static let chekmarkDone = UIImage(named: "chekmark_done")
            static let chekmarkNotDone = UIImage(named: "chekmark_not_done")
            static let rightArrow = UIImage(named: "right_arrow")
        }
        
        
        enum Session{
            enum Stats{
                static let avaragePace = UIImage(named: "stats_avaragePace")
                static let heartRate = UIImage(named: "stats_heartRate")
                static let totalDistance = UIImage(named:"stats_totalDistance")
                static let totalSteps = UIImage(named: "stats_totalSteps")
            }
        }
    }
    
    enum Fonts{
        static func helveticaRefular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}


