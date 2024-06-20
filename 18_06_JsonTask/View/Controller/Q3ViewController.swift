//
//  Q3ViewController.swift
//  18_06_JsonTask
//
//  Created by Varshith Chilamkurthi on 19/06/24.
//

import UIKit

class Q3ViewController: UIViewController {

    @IBOutlet var videoTableView: UITableView!
    
    var videoViewModelObj = VideoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Video Data"
        videoTableView.dataSource = self
        videoTableView.delegate = self
        fetchData()
    }
}
// MARK: - Table view set up
extension Q3ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoViewModelObj.video?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell") as! VideoTableViewCell
        if let setter = videoViewModelObj.video?[indexPath.row] {
            cell.setData(setter: setter)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tdvc = sb.instantiateViewController(identifier: "TranscodingDataViewController") as! TranscodingDataViewController
        if let obj = videoViewModelObj.video?[indexPath.row].transcodings {
            tdvc.trancodings = obj
        }
        navigationController?.pushViewController(tdvc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
// MARK: - Api call
extension Q3ViewController {
    func fetchData() {
        videoViewModelObj.fetchData(url: "https://gist.githubusercontent.com/dbackeus/484315/raw/dfeb530f9619bb74af5d537280a0b3b305410d01/videos.json") {
            DispatchQueue.main.async {
                self.videoTableView.reloadData()
            }
        }
    }
}
