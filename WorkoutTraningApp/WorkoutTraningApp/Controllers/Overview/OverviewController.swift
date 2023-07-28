//
//  OverviewController.swift
//  WorkoutTraningApp
//
//  Created by Калякин Дима  on 25.05.2023.
//

import UIKit

struct TraningData{
    struct Data {
        let title: String
        let subtitle: String
        let isDone: Bool
    }
    
    let date : Date
    let items: [Data]
}


class OverviewController: WABaseController {
    
    private let navBar = OverviewNavBar()
    
    private var dataSource: [TraningData] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        return view
    }()
}

extension OverviewController {
    override func setupViews() {
        super.setupViews()
        
        view.setupView(navBar)
        
        view.setupView(collectionView)
        
       
    }
    override func constaintViews() {
        super.constaintViews()
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
       
            
        ])
    }
    override func configureApperance() {
        super.configureApperance()

        navigationController?.navigationBar.isHidden = true
        
//        header.translatesAutoresizingMaskIntoConstraints = false
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "EEEE, MMMM dd"
        
//        header.configure(with: dateFormatter.string(from: Date()).uppercased())
//        cell.configure(with: "Warm Up Cardio", subtitle: "Stair Climber • 10 minutes", isDone: true)
//        cell.layoutIfNeeded()
//        cell.cornersRounds([.allCorners], radius: 8)
        
        collectionView.register(TrainingCellView.self, forCellWithReuseIdentifier: TrainingCellView.id)
        collectionView.register(SectionHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: SectionHeaderView.id)
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        dataSource = [
            .init(date: Date(),
                  items: [.init(title: "Warm Up Cardio", subtitle: "Stair Climber • 10 minutes", isDone: true),
                               .init(title: "High Intensity Cardio", subtitle: "Treadmill • 50 minutes", isDone: false)
                              ]),
            
                .init(date: Date(), items: [
                    .init(title: "Warm Up Cardio", subtitle: "Treadmill • 10 minutes", isDone: false),
                    .init(title: "Chest Workout", subtitle: "Bench Press • 3 sets • 10 reps", isDone: false),
                    .init(title: "Tricep Workout", subtitle: "Overhead Extension • 5 sets • 8 reps", isDone: false)
                ]),
            
                .init(date: Date(), items: [
                    .init(title: "Cardio Interval Workout", subtitle: "Treadmill • 60 minutes", isDone: false)])
        ]
        
        collectionView.reloadData()
    }
}
//MARK: - UICollectionViewDataSource
extension OverviewController : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: TrainingCellView.id, for: indexPath
        ) as? TrainingCellView else { return UICollectionViewCell() }
        
        let item = dataSource[indexPath.section].items[indexPath.row]
        
        let roundType:  CellRoundedType
        if indexPath.row == 0 && indexPath.row == dataSource[indexPath.section].items.count - 1 {
            roundType = .all
        }else if indexPath.row == 0 {
            roundType = .top
        }else if indexPath.row == dataSource[indexPath.section].items.count - 1{
            roundType = .bottom
        }else {
            roundType = .notCorners
        }
        
        cell.configure(with: item.title, subtitle: item.subtitle, isDone: item.isDone, roundType: roundType)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath
    ) -> UICollectionReusableView {
        
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: SectionHeaderView.id, for: indexPath) as? SectionHeaderView else { return UICollectionReusableView() }

        view.configure(with: dataSource[indexPath.section].date)
        return view
        
        
    }
    
}
//MARK: - UICollectionViewDelegateFlowLayout
extension OverviewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 70)
    }
        
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section : Int)-> CGSize {
        CGSize(width: collectionView.frame.width, height: 32)
    }
    
}


