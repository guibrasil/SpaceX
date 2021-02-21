//
//  TappableSpaceXMainViewController.swift
//  TappableSpaceX
//
//  Created by Guilherme Medeiros on 20/02/2021.
//

import UIKit
import SwiftUI
import Alamofire

class TappableSpaceXMainViewController: UIViewController {

    private var rocketViewModels = [RocketViewModel]()
    private let cellId = "Cell"
    private let webService = TappableNetworkManager.shared()
    private var badgeColor: UIColor = .green

    @IBOutlet weak var tableView: UITableView?
    @IBOutlet private var activityIndicator: UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()

        self.registerCell(with: cellId)
        self.getRockets()
    }

    private func registerCell(with cellID: String) {
        let nib = UINib(nibName: "TappableSpaceXMainCell", bundle: nil)
        self.tableView?.register(nib, forCellReuseIdentifier: cellID)
    }

    private func getRockets() {

        self.startSpinner(spin: true)

        self.webService.fetchDataWith { [weak self] (result) in
            switch result {
            case .success(let data):
                self?.startSpinner(spin: false)
                let decoder = JSONDecoder()
                do {
                    let rockets = try decoder.decode([Rocket].self, from: data)
                    DispatchQueue.main.async {
                        self?.rocketViewModels = rockets.map { return RocketViewModel(rocket: $0) }
                        self?.tableView?.reloadData()
                    }
                    
                } catch(let ex){
                    print(ex.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    func startSpinner(spin: Bool) {
        DispatchQueue.main.async{
            self.tableView?.isHidden = spin
            self.activityIndicator?.isHidden = !spin

            spin ? self.activityIndicator?.startAnimating() : self.activityIndicator?.stopAnimating()
        }
    }
}

extension TappableSpaceXMainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.rocketViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TappableSpaceXMainCell
        let rocketViewModel = rocketViewModels[indexPath.row]
        self.badgeColor = cell.badgeView?.backgroundColor ?? .white
        cell.setCellData(viewModel: rocketViewModel, with: .baseStyle)

        return cell

    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tappedRocket = rocketViewModels[indexPath.row]
        let rocketView = TappableRocketDetailsView(rocket: tappedRocket)
        let host = UIHostingController(rootView: rocketView)
        navigationController?.pushViewController(host, animated: true)
    }
    
}
