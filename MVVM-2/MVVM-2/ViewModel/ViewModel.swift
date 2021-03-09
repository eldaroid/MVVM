//
//  ViewModel.swift
//  MVVM-2
//
//  Created by Эльдар Попов on 06.03.2021.
//

import Foundation

class ViewModel: TableViewViewModelType {

    private var selectedIndexPath: IndexPath?

    var new_description: Box<String?> = Box([nil, nil])
    
    func viewModelForSelectedRow() -> DetailViewModelType? {
        guard let selectedIndexPath = selectedIndexPath else { return nil }
        return DetailViewModel(profile: profiles[selectedIndexPath.row])
    }

    func selectRow(atIndexPath indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
    }

    func numberOfRow() ->  Int {
        return profiles.count
    }

    func cellViewModel(forIndexPath indexPath: IndexPath) -> TableViewCellViewModelType? {
        let profile = profiles[indexPath.row]
        return TableViewCellViewModel(profile: profile)
    } 

    var profiles = [
        Profile(name: "John", secondName: "Smith", age: 33),
        Profile(name: "Max", secondName: "Kolby", age: 21),
        Profile(name: "Mark", secondName: "Selman", age: 55),
        Profile(name: "rk", secondName: "San", age: 45)]
}
