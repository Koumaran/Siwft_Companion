//
//  ProfileController.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 20/04/2019.
//  Copyright © 2019 Jegathas Sivanesan. All rights reserved.
//

import UIKit



class ProfileController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
	fileprivate let cellId = "Cell"
	fileprivate let headerId = "headerId"
	
	fileprivate let padding: CGFloat = 8
	
	var profile: Profile!
	
	override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		self.navigationController?.navigationBar.isTranslucent = true
		self.navigationController?.view.backgroundColor = .clear
		
		// layout customisation
		if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
//            layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
            layout.estimatedItemSize = CGSize(width: collectionView.frame.width - 20, height: 100)
		}
		setupCollectionView()

    }

	fileprivate func setupCollectionView() {
		// Register cell classes
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
		collectionView.register(HeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView.register(UINib(nibName: "ProfileHeader", bundle: nil), forCellWithReuseIdentifier: "contentHeader")
		collectionView.contentInsetAdjustmentBehavior = .never
		let iv = UIImageView(image: UIImage(named: "globalBakcground"))
		collectionView.backgroundView = iv
        
	}

    // MARK: UICollectionViewDataSource
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! HeaderView
		if let image = profile.imageConverted {
			header.setupImage(image: image)
		}
		return header
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: view.frame.width, height: 340)
	}
	
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0, let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contentHeader", for: indexPath) as? ProfileHeaderView {
            cell.setupHeaderView(profile)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
    
        cell.backgroundColor = .black
    
        return cell
    }
	
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width - 2 * padding, height: 50)
//    }
}
