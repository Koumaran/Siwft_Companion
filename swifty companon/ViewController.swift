//
//  ViewController.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 03/08/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var numberLabel: UILabel!
    
    // MARK: Properties
    let webService: WebService = WebService()
    var users: [User] = []
    
    // MARK: Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = searchBar
//		self.navigationController?.navigationBar.installBlurEffect()
//				self.addBlurEffect()
		
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.isTranslucent = true
		self.navigationController?.view.backgroundColor = .clear
			
    }
	
//	func addBlurEffect() {
//			let bounds = self.navigationController?.navigationBar.bounds
//			let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
//			visualEffectView.frame = bounds!
//			visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//			self.navigationController?.navigationBar.addSubview(visualEffectView)
//		self.navigationController?.navigationBar.sendSubviewToBack(visualEffectView)
//			let backVisual = UIVisualEffectView(effect: UIBlurEffect(style: .light))
//			backVisual.frame = self.view.bounds
//			backVisual.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//			self.view.addSubview(backVisual)
//			self.view.sendSubviewToBack(backVisual)
//	}



}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count > 2 {
            webService.getUser(text: searchText) { tab, error in
                if let err = error {
                    print(err)
                } else {
                    self.users = tab
                    DispatchQueue.main.async {
                        self.numberLabel.text = String(self.users.count)
                        self.tableView.reloadData()
                    }
                }
            }
        } else {
            users.removeAll()
            numberLabel.text = "42"
            tableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "resultCell", for: indexPath) as! ResultCell
        cell.nameLabel.text = users[indexPath.row].login
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = users[indexPath.row].url
        print("\(users[indexPath.row].login) is selected : \(url)")
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.startAnimating()
        
        webService.getProfile(url: url) { profile, error in
            guard let profile = profile, error == nil else {
                print(error!)
                DispatchQueue.main.sync {
                    activityIndicator.removeFromSuperview()
                }
                return
            }
            DispatchQueue.main.async {
//                let profileView = self.storyboard?.instantiateViewController(withIdentifier: "profileViewController") as! ProfileViewController
//                profileView.profile = profile
				let profileView = ProfileController(collectionViewLayout: StretchyHeaderLayout())
				profileView.profile = profile
                activityIndicator.removeFromSuperview()
                self.navigationController?.pushViewController(profileView, animated: true)
            }
        }

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

