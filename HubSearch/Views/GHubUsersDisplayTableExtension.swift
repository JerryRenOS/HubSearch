//
//  gHubUsersDisplayTableExtension.swift
//  HubSearch
//
//  Created by Jerry Ren on 9/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

extension SearchGHubViewController: TableViewDelegateDatasourceCombined {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let numOfR = ghbViewModel.gettingNumOfRs() else { return 000003}
        return numOfR
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cello = gHubUsersDisplayTable.dequeueReusableCell(withIdentifier: GloballyApplied.gHubUserCellID, for: indexPath) as! GHubUserTableCell

        ghbViewModel.filteredHubModel = ghbViewModel.gettingHubObject()
        
        let desiredHubEntry = ghbViewModel.gettingHubEntries(index: indexPath.row)
        
        print(desiredHubEntry?.API)
   //     cello.gHubUsernameLabel.text = ghbViewModel.filteredHubModel?.entries[indexPath.row].API
        cello.gHubUsernameLabel.text = desiredHubEntry?.API
        return cello
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(GloballyApplied.perfectoRowHeight)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let sBoard = UIStoryboard.init(name: "Main", bundle: nil)
    }
}
