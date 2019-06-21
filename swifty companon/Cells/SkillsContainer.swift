//
//  SkillsContainer.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 31/05/2019.
//  Copyright © 2019 Jegathas Sivanesan. All rights reserved.
//

import Foundation
import UIKit

class SkillsContainer: UICollectionViewCell {
	@IBOutlet weak var collectionView: UICollectionView!
	
	var skills: [Skills] = []
	
	override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes {
		setNeedsLayout()
		layoutIfNeeded()
		
		let size = contentView.systemLayoutSizeFitting(layoutAttributes.size)
		
		var frame = layoutAttributes.frame
		frame.size.height = ceil(size.height)
		layoutAttributes.frame = frame
		return layoutAttributes
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		collectionView.register(UINib(nibName: "SkillsCell", bundle: nil), forCellWithReuseIdentifier: "SkillsCell")
		collectionView.dataSource = self
		collectionView.delegate = self
	}
	
}

extension SkillsContainer: UICollectionViewDelegate, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return self.skills.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SkillsCell", for: indexPath) as! SkillsCell
		cell.setupSkills(skill: self.skills[indexPath.row])
		return cell
	}
	
	
}
