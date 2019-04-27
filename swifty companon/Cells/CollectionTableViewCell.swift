//
//  CollectionTableViewCell.swift
//  swifty companon
//
//  Created by Jegathas Sivanesan on 14/03/2019.
//  Copyright © 2019 Jegathas Sivanesan. All rights reserved.
//

import UIKit

class CollectionTableViewCell: UITableViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initCell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func initCell() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension CollectionTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let view = UICollectionViewCell()
        view.backgroundColor = .green
        return view
    }
    
}
