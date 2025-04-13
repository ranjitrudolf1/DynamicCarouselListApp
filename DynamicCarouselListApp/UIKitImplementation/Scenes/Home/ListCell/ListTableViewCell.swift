//
//  ListTableViewCell.swift
//  DynamicCarouselListApp
//
//  Created by Ranjit Kumar on 09/04/25.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var listTitle: UILabel!
    @IBOutlet weak var listSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(detail: ItemModelData) {
        let imageUrl = Constant.itemImageUrl + (detail.imageName ?? "")
        listImageView.loadImage(from: imageUrl)
        listTitle.text = detail.title
        listSubTitle.text = "List Image Subtitle"
    }
    
}
