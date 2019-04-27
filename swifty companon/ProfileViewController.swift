//
//  ProfileViewController.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 28/08/2018.
//  Copyright © 2018 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

	var profile: Profile!
	
	@IBOutlet weak var tableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
//        self.navigationController?.navigationBar.installBlurEffect()
//		navigationController?.navigationBar.prefersLargeTitles = true
//		let bounds = self.navigationController?.navigationBar.bounds as CGRect?
//		let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light))
//		visualEffectView.frame = bounds!
//		visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//		navigationController?.navigationBar.insertSubview(visualEffectView, at: 0)
	
		setupProfileView()
	}
	
	private func setupProfileView() {
//        tableView.register(UINib(nibName: "ProfileHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "headerView")
//        tableView.sectionHeaderHeight = UITableView.automaticDimension
//        tableView.estimatedSectionHeaderHeight = 635
        tableView.register(UINib(nibName: "CollectionTableViewCell", bundle: nil), forCellReuseIdentifier: "CollectionTableViewCell")
        tableView.rowHeight = UITableView.automaticDimension
		tableView.dataSource = self
		tableView.delegate = self
        setupHeaderView()
		
//		if profile.imageConverted != nil {
//			photoView.image = profile.imageConverted!lk=j;
//		}
//		firstNameLabel.text = profile.firstName
//		lastNameLabel.text = profile.lastName
//		emailLabel.text = profile.email
//		phoneLabel.text = profile.phone ?? ""
	}
	
	private func setupHeaderView() {
		guard let headerView = Bundle.main.loadNibNamed("ProfileHeader", owner: self, options: nil)?.first as? ProfileHeaderView else { return }
		tableView.tableHeaderView = headerView
		headerView.setupHeaderView(profile)
	}
	
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        guard let headerView = Bundle.main.loadNibNamed("ProfileHeader", owner: self, options: nil)?.first as? ProfileHeaderView else { return nil }
//        headerView.setupHeaderView(profile)
//        return headerView
//    }
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let view: CollectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CollectionTableViewCell") as? CollectionTableViewCell {
            return view
        }
        return UITableViewCell()
	}
	
	
}
