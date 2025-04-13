//
//  CarouselCell.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 09/04/25.
//

import UIKit

class CarouselCell: UICollectionViewCell {

    @IBOutlet weak var carouselImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(image: String) {
        carouselImageView.contentMode = .scaleAspectFill
        let imageUrl = Constant.categoryImageUrl + image
        carouselImageView.loadImage(from: imageUrl)
    }

}
