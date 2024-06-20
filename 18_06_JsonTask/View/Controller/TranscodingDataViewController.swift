//
//  TranscodingDataViewController.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 19/06/24.
//

import UIKit

class TranscodingDataViewController: UIViewController {

    @IBOutlet var transcodingTableView: UITableView!
    
    var trancodings: [Transcodings] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Transcoding Data"
        transcodingTableView.dataSource = self
    }
}

extension TranscodingDataViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trancodings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TranscodingDataTableViewCell", for: indexPath) as! TranscodingDataTableViewCell
        let setter = trancodings[indexPath.row]
        cell.setData(setter: setter)
        return cell
    }
}
